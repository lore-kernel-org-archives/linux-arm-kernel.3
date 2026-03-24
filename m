Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3F2F532D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 04:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=as1oD5ZP7ir6ec+9vRMPKCBQFoPmXvB2fXhjUdsVMTM=; b=j/03JjpGVteVZHFqPqH9vgof5Y
	13RFw25ZvhwEI/9XmIdwhhr8FPsyoMx1KbSsevgDMNZQ186scDT+3ndbA0vsnpC3xjUM0l5rjfm3u
	CN33R3WlOoeJRqE3DZaonvaBbYko887niC4BjZOXrXwCKBYEgvwpemcKVv7SVpWL10CUhtNJIgk7Y
	o8MGe7jI+XQ23ncxpu5s3TD7JcgbAWB481LUzWVeh9GiZgucjVGXCc+hnDxyrZ5JJpXokenBKgLkQ
	1ZZW2RklwL957a7lqA0H9uVntbAkepiwlVf+fLpwNOVvcu5eXCntOyGAjq0vEffn41OmFIP2Kc+0M
	3ZEWFPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4tGp-00000000Xu2-0Fxt;
	Tue, 24 Mar 2026 04:21:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4tGm-00000000XtY-49pw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 04:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774326092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=as1oD5ZP7ir6ec+9vRMPKCBQFoPmXvB2fXhjUdsVMTM=;
	b=fwKY/fxlPiT9oD4Lvx2vzByL+RUvS31Rs4n+DUPcG3brpA8U+Oyf53dCNR/R+3s4CK8656
	UgTLCGJ80eQj7gNNmGonm6QY+kj9YDFxl+YgtBjeVy6BsSfs6qvWA5ozawcL+fY3pPaExt
	xKTmU10a9Qy56rA+XqDw2cf4IuQkNXE=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-7jj1nJFmNiu7zEruRE_Z3g-1; Tue, 24 Mar 2026 00:21:30 -0400
X-MC-Unique: 7jj1nJFmNiu7zEruRE_Z3g-1
X-Mimecast-MFC-AGG-ID: 7jj1nJFmNiu7zEruRE_Z3g_1774326090
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adef9d486bso34813225ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 21:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774326090; x=1774930890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=as1oD5ZP7ir6ec+9vRMPKCBQFoPmXvB2fXhjUdsVMTM=;
        b=XNL6Ma8Ya5hjfU/cGXDOVVWKahdin2gHtlkRk2D1LLYk+POCvIE7MW4Lg4opfFG5ce
         9xPw0/LpK9gp43Fc9Lzqmn8mDqqei0GQVI6agDYYWHfw9xeb4Kx21AkqNx0+sFkbVCj2
         gYvHUbAfUqUmmoDbwPd7VleIoIfJOoDdfOpTukEDqoRNwqGi1kGins6dsq9lAr9gOkTy
         9ZsV6Ozgd6tymIMI9jcDjmOleIhtiiUHsD7c6IdaVpCOmWfSW04o+kAJrGFsiRxrT2Qk
         oSiey639Kbk5MEq9Tooyo/7o/uoyOqhkiq5kwF2F3rlLrzLJshCbrXrFfxblrPqVRalf
         dOUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTntaLf+6R13FzIqaqzU7S9JLBshtb7OEF+3gGeJrfzZb9+V8a0xHToAxS1vmp71vSmpcjoeQEOYZvOUvhGlsy@lists.infradead.org
X-Gm-Message-State: AOJu0YzN2+8IsHlyWZ3Feo9uvInyxbMhK2Okoo3Ap8Tn+aZEyvB/NfBp
	SxY28TwFpmY6v6h2R/gFcQQcK+KsAqrdsFSFeNVC/vmjEdwpY8sppF705Nfdas5VCFD2Z9r8QrC
	XpkB1BNLetjum6x01BdMuEnm/Hz7i4lq6tveWy9dfQ+HBVJEvJVvORSBjx4NAVv+FBrigkiMN89
	lV
X-Gm-Gg: ATEYQzyRXh4TJzaiBhWb0zxo771tO6JZZiH+kdkKxSPx5CSM1ueHg8wXqN9K1CiiVDX
	NwLfUtqKw1T7JAjImKXGEDJ1CngmoE2V2rNepOjBtk9GlUIpC9kTQzYe8WodCNCp4wIuA6naAYL
	HXuBQX6y2G4nT5CApM8hkDas5EJXNvKkZT9BLBnGfGgNGbTZIYDANWy/iwI13mtZB3ADd3N4aP7
	RvC1gD79rOE3BPCEXRH8y/cYqjGUCkHOfKIHqpvuK1+40AMix+gn1I3ddvmY0HvhAs2I6NxK8WI
	/3c+It9Z3XbfQSrm2Dg82kfa258Sfm/SVTY9LFl3kmkz7/coKz5F3Xh45Wn0ZuzW08yV5Ks1tfZ
	HzIv4uC0eLva17isUaGLpTVUFSfrItWSmJxF6KoYrbANLVj2UUIBh/00nPgKbyaOG
X-Received: by 2002:a17:903:1a67:b0:2b0:694d:f5db with SMTP id d9443c01a7336-2b0828238d5mr130410565ad.52.1774326089742;
        Mon, 23 Mar 2026 21:21:29 -0700 (PDT)
X-Received: by 2002:a17:903:1a67:b0:2b0:694d:f5db with SMTP id d9443c01a7336-2b0828238d5mr130410275ad.52.1774326089350;
        Mon, 23 Mar 2026 21:21:29 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c74dsm171510225ad.62.2026.03.23.21.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 21:21:28 -0700 (PDT)
Message-ID: <d82f9434-ec90-4872-b779-2b20aa8e700d@redhat.com>
Date: Tue, 24 Mar 2026 14:21:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 39/40] arm_mpam: Quirk CMN-650's CSU NRDY behaviour
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-40-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-40-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7agAy1S_hPYRKb5vcqcjMppGfw5Ioagqegtz_QT1AAs_1774326090
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_212133_111869_E15A7217 
X-CRM114-Status: GOOD (  15.70  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> CMN-650 is afflicted with an erratum where the CSU NRDY bit never clears.
> This tells us the monitor never finishes scanning the cache. The erratum
> document says to wait the maximum time, then ignore the field.
> 
> Add a flag to indicate whether this is the final attempt to read the
> counter, and when this quirk is applied, ignore the NRDY field.
> 
> This means accesses to this counter will always retry, even if the counter
> was previously programmed to the same values.
> 
> The counter value is not expected to be stable, it drifts up and down with
> each allocation and eviction. The CSU register provides the value for a
> point in time.
> 
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
> parentheses in macro
> ---
>   Documentation/arch/arm64/silicon-errata.rst |  3 +++
>   drivers/resctrl/mpam_devices.c              | 12 ++++++++++++
>   drivers/resctrl/mpam_internal.h             |  6 ++++++
>   3 files changed, 21 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


