Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1307EC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 05:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQejFIIIFE6fTGF6lTC/UW/FVyJt6i6U66qSLqZAyAY=; b=3TRPQh88WuFepTlkY+6vmlEMc/
	lUVn9OzYXjrEbS/vKT0K8MwieVD2xME5bpX86AT+lCDmC1ODsIfrcg1tZh9nOin91xKTiJ95hOKhR
	0WLmMoX39m6pU49Edg4HW6+DSzlDCqZ5EoGbhanz/yfMu0LxLgjZtKBVPLFTvP7/o2mFL/tb2udAH
	XAwGsrKQG25Mlkm04/lr3IzpsKypbJvUgv4XO/D8MJ+tpra+9jMG28EfeVaExn/sds4WISHRQ3qZy
	uz9nY5ZUdSi3HebUMYylU1CO/JNciHEYOTTj9/JtbhI79rKqls2GRDGa+9W9Bz5P7ghsXD70+JyAU
	/16KoJmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tJc-00000004HTr-1nTq;
	Tue, 22 Sep 2026 05:45:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tJZ-00000004HT5-0ivb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 05:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iQejFIIIFE6fTGF6lTC/UW/FVyJt6i6U66qSLqZAyAY=;
	b=RAR2OJ00hwBhFAKfl82glepqoSQaa9ajdWDlRW7Bpe75I9jfXZPh0ZNlscAnOvgN2tFSpp
	GoaXdgnpBjrmOqbZ/RsHBhqHdpdWsDdtCfuW7ObtZPZlT2JuY9oNhcV32f/HDVmyERrqIx
	jbDYkhYGnQ4209yY+pFHKPpmGDfslPU=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-SDCaMKhnMsyredsnMoQbqg-1; Tue, 22 Sep 2026 01:45:10 -0400
X-MC-Unique: SDCaMKhnMsyredsnMoQbqg-1
X-Mimecast-MFC-AGG-ID: SDCaMKhnMsyredsnMoQbqg_1790055909
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dd667770efso6561725ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 22:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055909; x=1790660709;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQejFIIIFE6fTGF6lTC/UW/FVyJt6i6U66qSLqZAyAY=;
        b=MxjSXtoC6CC86UyDjNq8Af3uXDqNAxmRbAIGtSzoRx90pT7oupuqpz68rY9D6iUQnX
         J3CxgFHo3qY2pbUUdjwAWge2Ek2DdB1PjGYLvwl0ExLv44uERbqWG9iN28+Xd/pYj7ag
         MT3fUUnZ5l8lHhX1sb77kylYPR57sS+iKuo/4EIhLkx0K2G1dQoCT7aG0Mj4DiJffMLm
         Uf4nB64AX2cXGrSL38cCvjbK0ZAEsM8aiTHORTe5R9rzZeBBH2+Q6M02X60hS4YGBJv1
         7O8rIHGRcG/BtrQ3Xm+S//BcMOK25q6vKrr80eRCLhh12BG+Pr19jnlj4Pqn5oGfM8Ho
         e78Q==
X-Forwarded-Encrypted: i=1; AKwUvBw2nAdkjdxZ/g4hV4BlE9maWhfuN1pGoH9Edy2zzBbl8ZPALd+8Loz95wX/S0VtnySDXlZ8HKbuEp43PnO9kGBn@lists.infradead.org
X-Gm-Message-State: AFuF++kMO2RgfYiPvOtAd8+e+TFtM2vWWCoql8VNrvzq5Ebtnmci8Wp7
	Rs+CB/6gzI3urLSCu2vlr7Y8P9OvLOA4dQr64TnlJYTRb3Lvye2Vv6eYs8jHr4l5yhdyZ+yOZvf
	kJ+Cl1+htCghS2fZoLeWrmFFqiF00YJRL+cERdb5TXpJ9thyc/07vg/JQHnR1PpLj22HcBtfZHz
	ad
X-Gm-Gg: AYBFou3pXibKrVxQ5fi6uJsTS6ZEoL0Dw2/4gP48z9PiT6qiQ0yH4uxxzWD1NycUu+I
	NM290qOWYWNYjzDko1rhWbuoSXaSNnjm0pu7WKSrTg4XA1y8G+reqnRCNiGu165veQ4PWrfkQ5j
	j+9g4ckHeD1V0fE0P6XcCdUthr37A0Bsg3XttVrPhTvVZed580XNfLNvRsJ7+N6iA6JpVvjiu3g
	9Cc4HQdXSApMZYzsVY3BnmXphIxRQlugF5B5eD1Lvl9OJG6I2Wioh60jJ9odojAYFvqUqUXpZn0
	dHAMUxs0CeGKVtjtqDME25R6NgUFd4K4CR4SMuaG3nbLSIzbKv8U1QfxCGNNsxoCdU9tL+OHnMq
	qFFisQ7aKPBTsQiZY/j+/KfENQM9fU4b+x2/bXjzS/w==
X-Received: by 2002:a17:903:2412:b0:2dd:a94a:437a with SMTP id d9443c01a7336-2df60d6752emr392065ad.0.1790055909298;
        Mon, 21 Sep 2026 22:45:09 -0700 (PDT)
X-Received: by 2002:a17:903:2412:b0:2dd:a94a:437a with SMTP id d9443c01a7336-2df60d6752emr391905ad.0.1790055908866;
        Mon, 21 Sep 2026 22:45:08 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d048086sm3562615ad.59.2026.09.21.22.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:45:08 -0700 (PDT)
Message-ID: <8928b196-9373-4d60-b44f-87d1607e04a6@redhat.com>
Date: Tue, 22 Sep 2026 15:45:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] arm_mpam: Switch to kvzmalloc_objs() for
 allocation of component cfg
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-12-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260917145617.2202986-12-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MEoVA-Zj9lYILVWDEuWtKZwN5G7qQnmRpM0M4FTjLPM_1790055909
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_224514_826074_156DF4E0 
X-CRM114-Status: GOOD (  12.04  )
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

On 9/18/26 12:56 AM, Ben Horgan wrote:
> Each component cfg is sized by the size of a per-PARTID multiplied by the
> number of PARTIDs. On a platform sized to push the limits of the
> specification, the allocation using kzalloc_objs() will consistently
> fail. Change to use kvzmalloc_objs() so that large allocations fall back to
> vmalloc() based allocations.
> 
> Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> ---
>   drivers/resctrl/mpam_devices.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


