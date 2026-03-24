Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDEBF532DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 06:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xw85OR1VT86W5/UYlwDEouH2+FNxd6th+BcXCbo6xiM=; b=1IHwNodeMboWq5IvpzhyPnfxcN
	9wBlUVZ9nKYczXN0l0dBaF89YVmrcDn6QwDzN/7lapS9iHkeMCy6VsKkzeoGlgFQTynWF/kO3cwuz
	tHBEm7FehNLDdMdw+i3Jzki96F6038zo5y2Ot+YOIvU/FRnOmPIRx+LAgV5f+oNV8QADXjpXCNC+7
	0lcGSxcUAWJZ4TijBEG3l5eFV3JG2jro42d4vxRwp3a9cAlAwmfHzciLlcdf6qTi6GAck+VaX3c+o
	1VBocZQgAuJAF9L9xhnD6Ic0dfkXY5cpV2z8kkY/echeXMSUOt4oAStXF2wvuZwscbh1qcggaROnR
	54sJmHiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4utF-00000000d3w-0sWa;
	Tue, 24 Mar 2026 06:05:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4utC-00000000d3Z-2y81
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 06:05:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774332315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xw85OR1VT86W5/UYlwDEouH2+FNxd6th+BcXCbo6xiM=;
	b=Bg+I6ODzXzn2SKU0tt+vxyVTPCtTfLRPtPfa+CdGFnuQkotIaXWmfxsDxn4ZP7nxYwXbag
	o7ZThcAu3ns+8iQnpJC5GNQ8uCnR2AgFBs/a3OS9rsTDhKS7jIO2EXxyO3oRA7evIOdZ3Q
	tmpfTFXCOQ2gVXnZJh6gOW4VWrlKduM=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-M58rlBadODCOCIRnUBEmFA-1; Tue, 24 Mar 2026 02:05:13 -0400
X-MC-Unique: M58rlBadODCOCIRnUBEmFA-1
X-Mimecast-MFC-AGG-ID: M58rlBadODCOCIRnUBEmFA_1774332313
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b059511554so21967295ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 23:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774332313; x=1774937113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xw85OR1VT86W5/UYlwDEouH2+FNxd6th+BcXCbo6xiM=;
        b=Ar93Vi6D3kFNl3N3YhrMFaYkvfqMoTh/xyGFxfcmHWKstALBN44wMtGrVxcfztBsHg
         rykynddQqtQj/4fImfUfH06k25H/MvohO5Xvs7yutxs64hUOtECbGtRSznwFVG8jTlAo
         NwDlYBJM5aP+gq2P3S63FNEr2Vfw072/gGexlBAr3ux6jHpwiZoOq7IPEwE1wdmGR5nN
         /8xRZk3LErY1UInLoilaI4kqNCbbGjlwm9KU8T0xtqqFDM6qzGAbRJ10I20/W9TaHy2k
         bZzGQY27QJaPwLeqq+bTe95yvhA9dkV/sknd04Xv4LZgeVdVPLdDAxFj5hHWXAPrL+Sd
         FUeA==
X-Forwarded-Encrypted: i=1; AJvYcCVvWSX/2AE80fKmgsPWWIYaeyxl3AI+kTeNUcd/ghjMPP/VAbY+nctWsyQM3oFN490qUfDQ4OyOU0+o078AiNZ+@lists.infradead.org
X-Gm-Message-State: AOJu0YzpRS0x1ep+344zxvwiuAcTj/Pgv1dP63zDJjvKs2KxFFZilFcI
	YeLbusNzlLOSnQaIwjqiukBNqrrPMQCN/BXbmJF7Dit+WxQ4jlBA7F3gaMjRewbObRMG74ulltI
	KpmvEhd8sl6H4sw+9gtDIz7prhqoqN2Sj71XPGWYU+darfJsJLj2VQMSa/h7DMD6eZxGIhwkSNE
	X7
X-Gm-Gg: ATEYQzxwJoIShJndKfE65F8cA5uNdlmfy7Yb5FDF9UfogTMmFV9dsopW6EAWW7g1gzY
	Cat+H1q/OAGIDqoiDEdMFry1fJIPKG0Vhu3bexcFphB7YhN30HsQwbGBaGnKxk/pjjJ/RHOhmUR
	HImyjb3do9VvIJV8a5uzVTIdcVNCQEgCoqH6F9mcWnETHoB9vEUxBzfBBcYiP0jW8xcHo8hCNXp
	XcXsDe6nYA8Ycfh3Yd7jvJR7zmjvFNfM2yTgAUVcJjJz97nZbjR3ZTrbW/s3aH4Ogez2dM1vQ6e
	5v5Ra9mBzGGetZF+WMXz2tnVQHoK8MOKijOsc5Q0wGDr11zWXiwE/Ij8IOQ0YOPHs09ZGiF89kd
	x8jZuFpjB8UcWpjuVmiVx3aH15moQne9F6jWAwiy4JVXv6JafslJiZ7PkC8SmmYf8
X-Received: by 2002:a17:903:288:b0:2b0:4554:9c24 with SMTP id d9443c01a7336-2b082797405mr140735015ad.32.1774332312847;
        Mon, 23 Mar 2026 23:05:12 -0700 (PDT)
X-Received: by 2002:a17:903:288:b0:2b0:4554:9c24 with SMTP id d9443c01a7336-2b082797405mr140734575ad.32.1774332312435;
        Mon, 23 Mar 2026 23:05:12 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836556desm174549575ad.47.2026.03.23.23.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 23:05:11 -0700 (PDT)
Message-ID: <6373e449-6bbb-4fe3-b140-6cf452255558@redhat.com>
Date: Tue, 24 Mar 2026 16:04:54 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 40/40] arm64: mpam: Add initial MPAM documentation
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
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-41-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-41-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 62aBoQzjpQ7fO4c2MsiAaLKkd589d1Evt91L3zgLRwM_1774332313
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_230518_850461_5C671C78 
X-CRM114-Status: GOOD (  11.40  )
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
> MPAM (Memory Partitioning and Monitoring) is now exposed to user-space via
> resctrl. Add some documentation so the user knows what features to expect.
> 
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes by Ben:
> Some tidying, update for current heuristics
> 
> Changes from v4:
> Fix unusual indentation
> 
> Changes from v5:
> Drop cdp (under CONFIG_EXPERT) and mbwu (back with abmc)
> ---
>   Documentation/arch/arm64/index.rst |  1 +
>   Documentation/arch/arm64/mpam.rst  | 72 ++++++++++++++++++++++++++++++
>   2 files changed, 73 insertions(+)
>   create mode 100644 Documentation/arch/arm64/mpam.rst
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


