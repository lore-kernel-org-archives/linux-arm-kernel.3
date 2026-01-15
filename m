Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5214CD3CCA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 02:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dlgkmxWqaDOQOHWSmTqUqR3tikn8dprMTMa25/WTs0=; b=YBL0mv/q7eFWxSFkkDmxi3btdA
	j6eWP0JRD1ciL9BFKlVb0FeqQkMWGURHJEryFhFkQLui08vKqg/ch987GGl0N7+owmxFqXA5tJP9M
	0J9bPppJ0y+P9QYspSF6HyaVDVlfw7FQTsWmtOgY51wljMVa8wj6FzOchL0oAyPJHPjZLpzOHaIYf
	uqGXGVpQfCMiIHYKJ70A3HrrOQdw4NrzFXrNvr+QMwU+2ADfWw255vxiPAegSETSEJdPudlv4BQU7
	A9qDyqjQhA2TjxXD801rP/tEcJifLgHGPaCjMtDp8nBORfd7V8jTBk8t2gMIfF069cTEWYtYSwlC9
	Wse0ZIxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgCuf-0000000BWD6-0lte;
	Thu, 15 Jan 2026 02:16:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgCuc-0000000BWC5-1EK3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 02:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768443397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8dlgkmxWqaDOQOHWSmTqUqR3tikn8dprMTMa25/WTs0=;
	b=XBgFCR2X+w2+yV7hKH64M1Tk7JzyregRUe9PK2vNDx2ZDS2O7MFrrcxJAEHGH7PS+eegx/
	fFcTtsq4hDIAaWFQRwqHQk86DRRws5AZJb3H3mL+rt/oXFaeN0BxUceNEselZ942pBQGws
	C94YjTfDXX8+/z1eQGkEaSikNdNvbE0=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-uiDpctcOOMq_nihflP1zeg-1; Wed, 14 Jan 2026 21:16:33 -0500
X-MC-Unique: uiDpctcOOMq_nihflP1zeg-1
X-Mimecast-MFC-AGG-ID: uiDpctcOOMq_nihflP1zeg_1768443392
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0f47c0e60so9067955ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 18:16:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768443392; x=1769048192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dlgkmxWqaDOQOHWSmTqUqR3tikn8dprMTMa25/WTs0=;
        b=Evbqyt5S0JrcOUAO3/o9i2DAg2509GZ1TOkIO2dKGNOvkKirXWKXFHoJ2ISPW3+WDq
         9W4MHHk2YxzuzutMpKIT1r5d8xmDaVyKN+jHHukfwJaHerwHnxPG9rikIR7jHSst1b4r
         xJPbbsGiTMsrQP3e6KnA/kg7dXqPsc8c5quN7ZGmwd2Y4uFlEw9MRG1PBAXkTTt9YDV0
         HQR+YBBZ6423CpO0rKOF3FNMhO8Nh8R37ALGc48pxRxoHFyqfZ1JX83eVDMFo0hUJpXe
         xGx0Dhf2uuIHtO2zGSV4ZT/BbJnOGbBE+tmmwnUWlvq6ohvusu7OZJ4hQI5J4r1XmvcR
         RrwA==
X-Forwarded-Encrypted: i=1; AJvYcCV+A3IjvL7hBf/YANKqBezlQW6fgWQ5m4U1gPzXdtQ8W9fwifumykBF+uX5hRDVmBPpq/m7rYd1WPCZBBT9AxNz@lists.infradead.org
X-Gm-Message-State: AOJu0YwjUw65Zl1VOyVWeDNLCh9HoH3fEJX1vrIoH1z6qngw8eHaOP/q
	+9jNxZf2JlnrM2yn2tS5lAT5SE1zwyWchHpcPhrLqCQ/4taLH4MH/x5g1kdkRczjzn3GTNikak1
	erco3vYf/lpK6/Ti8SdxbAPRC2ZFkWu0R42UZWQK5vn/gfsNMACm3hA5k6qHyaCkswDQln9LCaX
	7U
X-Gm-Gg: AY/fxX4rtRQ+L1pg3lkXyvWdOJl4D653x1YfuO0j+tk8N2OPJlWPNKyaGSYxWPJzmcs
	yN2pGmeewkD8/+q4NmbVBjjmYLUZrnF6eYI90fMGdXKwaplxRdzSrC54JR1udKHn3Uzwd46EXjy
	egL/Z9olYtmhg8eQTGerlqtvEFtz4EjR4kXOj3/F1cBfVZOgZrTp7lw47JXCDeoI5bGuK3q4RjV
	ys/O6N2zvBauqW7lLEtBGu3RrzhTN3hl6K5bN+H8E2MdhO98eQFQ2WMZRtZWubyRwuJhvEbIUNc
	a4nGW/n7SJuHs6Ea6oDLj40GEe7F9gF2010f9784cM1SHiEKFrUZIb1d90hf7XgwcSfLR4DvhDu
	BZgfD3fUU2Bo=
X-Received: by 2002:a17:902:ce92:b0:2a0:97d2:a25d with SMTP id d9443c01a7336-2a59bb51ffemr43748555ad.15.1768443392067;
        Wed, 14 Jan 2026 18:16:32 -0800 (PST)
X-Received: by 2002:a17:902:ce92:b0:2a0:97d2:a25d with SMTP id d9443c01a7336-2a59bb51ffemr43748275ad.15.1768443391605;
        Wed, 14 Jan 2026 18:16:31 -0800 (PST)
Received: from [10.72.112.168] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3ae21sm233902385ad.7.2026.01.14.18.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 18:16:31 -0800 (PST)
Message-ID: <fa352909-0a8d-45a6-8965-6328299e2e0d@redhat.com>
Date: Thu, 15 Jan 2026 10:16:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/47] arm64/sysreg: Add MPAMSM_EL1 register
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
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-4-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260112165914.4086692-4-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lgLoDQ6dFqs8LOl5RFGHrYVdO3GjnC2sfJXdF9idzMU_1768443392
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_181638_426392_F6742110 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

On 1/13/26 12:58 AM, Ben Horgan wrote:
> The MPAMSM_EL1 register determines the MPAM configuration for an SMCU. Add
> the register definition.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   arch/arm64/tools/sysreg | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


