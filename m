Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839BBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 04:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVhQvDRPfOQGu/EOlVqtQc7WBtfEWppFNIwOfGFGWSY=; b=QRSVapO9pGohw/Tktm3lvB4oSj
	QLviPGbXTMeHs6lYg4em+uVd2RIrGF+n807cQ92jRyz1CCcNlmS3pvk8m+nYtQUkFIZReTagU/Y7h
	iJuj/AWr7V3t/TWQiyeNG9/nJouLMkDS4uN1iWXagwU94dApOjN2Ld5XztdDjsKleFwwzi+QjhXNQ
	fE42FCFvsNW1HCxGDt2/cmNpwUgdfBl+GkYZHBsPzermhJOlgXvKSEnBHI9gYmRkEIoK+MFQU5C3K
	pRKK+zDnRYRngGamzUcifjteGKL1qlBMcRjILQ5UKg8owyz1YEjcCwS+mf1RiHOpjo6JtGfdiox47
	FfUFykDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkE5u-0000000GRC1-1gXj;
	Thu, 16 Jul 2026 04:53:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkE5s-0000000GRBY-0YxI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 04:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784177587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nVhQvDRPfOQGu/EOlVqtQc7WBtfEWppFNIwOfGFGWSY=;
	b=fISeEw0csE5Vp9+3802FmmDv2hfgWLGtEIHN6p/0Am5vcWXDjnBXbYfgXkhKvSJcpxMXLK
	humCqwhPgoN8DbxA+fo4I8FpfbTnmFRV9qNb/FN4mTeI4ZaxN+NNvx4IZG28HQ0brQBzEv
	sdC/bt2gjmKuSAjeyumDx0R/Na3VMu8=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-VA5ULBBzNR6566zF_pQBpA-1; Thu, 16 Jul 2026 00:53:05 -0400
X-MC-Unique: VA5ULBBzNR6566zF_pQBpA-1
X-Mimecast-MFC-AGG-ID: VA5ULBBzNR6566zF_pQBpA_1784177584
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380b630c505so7632106a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 21:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784177584; x=1784782384;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nVhQvDRPfOQGu/EOlVqtQc7WBtfEWppFNIwOfGFGWSY=;
        b=hBcBJl/owEjz58NxANAexhkMgljgv1/JeA+e/qWND1/xE1YJ/gyQckD9JBsfo3QkAN
         JrjGtf+vbH4PrC/EUkskVvMGZ2obzwbik5GX5sHmHEFRXcIbEnF+0jvVD5zL8/j+BSmu
         kuPcxMFH7BIgLH7OZRhpM8LKSq1VTtc9ZXEXZnw86bbH+rj9/AFT88JKPXykFWWnrkxH
         mq3Om/kvSgoudHXQzMej8jUA3bDrnHNOdAle00kw8y/Pc0fAkNKVWhcPrRevM0obZpIF
         VfFScAo38S6UIiZFMhu5qEJMeofKRoVR/CZCgIc8nY1VysPxeCmVniqu8EmdNcRqMDFi
         jKYg==
X-Forwarded-Encrypted: i=1; AHgh+RrhcDj5KKypHY3k6Vr1ZTd3wJRGqoVo6zjYSdwDq+nr6Zp4RtRx7uEZWAiDJdCzVzLWUo9RD7DZIQa1DESdw17y@lists.infradead.org
X-Gm-Message-State: AOJu0YwDX1LXEZ2uQ4CW8r5+O+R9nOrlju0GsB048D0YB/AMtSdxkKK/
	S6V5CVYRfDbDN59sIt2bfBpwihR+He7ew1tSaAsE/jksjN+DNLCcBMYen6H7psZ4JwhMdDhwViJ
	GFGmou/zTUBlOqauNK3VXNGHVwBJvSt3LPD5+yXeMuQHrYODhNMrHorCoiITiVJshpC5VSBhvYU
	ld
X-Gm-Gg: AfdE7clL7Q9aRfBzdlrYjm0eud/V7+BT5YBDYIOwbPIMGjgamiifUADrVwBh/j5RQDq
	C8Ycf4iKS6wmzJlCwRe5t3ENakWIU0DvWbMy5ETweq/9DSxXDuWwIo8oImfrMpw3FHL12iFxJBg
	9n4/66G4x+LWOJXqITPgEfA0icGsBkM/11CSPWRvo/QG9UkZqlN4MmRF0LFxgn0Xhnj/8rwD6es
	FMw8GXhz6VZOfCz2Hr13q2dHeZTV1a5taIiXCDIZHCMcc0Lr+6olc3nsKhPbnwj3+thPdvW0OR6
	N9rQPvK03JoTLxwd5NHU8qegTVmIsySJUAaFJ2UU/WVA3qZZSLgsgTXMsgmtGvzqWL6Lmu7NpDW
	o6cXlsEnqOEP4BUx2e3M0PiW3UCE6h0+UfSkwIDQyKPc=
X-Received: by 2002:a17:90b:2709:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-38e1ae2a42bmr7752457a91.14.1784177583864;
        Wed, 15 Jul 2026 21:53:03 -0700 (PDT)
X-Received: by 2002:a17:90b:2709:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-38e1ae2a42bmr7752438a91.14.1784177583337;
        Wed, 15 Jul 2026 21:53:03 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e2a228336sm1251715a91.2.2026.07.15.21.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 21:53:02 -0700 (PDT)
Message-ID: <2024059d-b56b-49a7-91e1-aa9fa357a097@redhat.com>
Date: Thu, 16 Jul 2026 14:52:57 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/11] arm_mpam: Switch to kvzmalloc_objs() for
 allocation of component cfg
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
 <20260710115546.29644-12-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260710115546.29644-12-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AwXUzV6hRGw2S5_TaN3XwOVGApSjqH3lNnFahN5485A_1784177584
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_215308_247433_77C4CCB1 
X-CRM114-Status: GOOD (  11.25  )
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

On 7/10/26 9:55 PM, Ben Horgan wrote:
> Each component cfg is sized by the size of a per-PARTID multiplied by the
> number of PARTIDs. On a platform sized to push the limits of the
> specification, the allocation using kzalloc_objs() will consistently
> fail. Change to use kvzmalloc_objs() so that large allocations fall back to
> vmalloc() based allocations.
> 
> Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


