Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7D0C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 19:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SmkFPv7x6SaEPIsRjgJHZz2gnZAicBosl7slQRZeBE=; b=FXpEAdGpgjupiaciZfu/2Pz4LR
	YLUYEYbgyPpOqZGWAAVTsgozRtHG//rD7aXoaCZyreD/AqHTM/vE4vg6ijTQEMTOU27guwG8WaCyZ
	cO9VoRvMdZRm4f0u7uPvR0TZE2y5SsrRH9g/a2+wbMiEjcwg87j84jtr16Eyy72QEVKzXtDWcry4M
	DR2JicX5KxPyTGWbn8yFahq3ZZAa+S8fXoSsQWOZFWNHP7Zxb0dviKIVBlbfsRhMIikSQ/EuKnzGR
	4t0gV4t8FzF1VoqG8enX38a1bCMemxNja0epMGofWqhP/k1QPL6VpHic/Azr7V3zjOvF1O8tgtj7M
	H6my9N5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlru-0000000ARvv-1jMC;
	Wed, 19 Aug 2026 19:22:34 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlrr-0000000ARv1-2PkE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 19:22:32 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so12311735e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 12:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787167349; x=1787772149;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3SmkFPv7x6SaEPIsRjgJHZz2gnZAicBosl7slQRZeBE=;
        b=kVqkUR9PgGPE3frH72O1h2V4Fs+xroGaEbTFY+2L0dgMAiydblQHJri3nSENEDaI8Q
         XEgxBlNG53sycku9rnYJQt+TPuJd0vEaIAWGTtXnoDIc8mkbmEnJE1EMSXHdVGidcFzu
         n9bwYhAbjb/lWKhxkOb45pw+vybOSLoAhX6pknzX815UkgS/zlgcQMH/F746xNstBf7O
         V+JuaZIvvK95mfCac/N14Kg5HU8guR4eVGlySO8jdIcZlwG46JkC9QN7UuMmGgb4whLS
         ZD07cdT+PLGyMq1IiEKWE2cyCOMaZFI9ViGo2y2wiR4ggtqjO3Q1Y1xxl8qX2yLYBiNO
         EqdQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCACK96a4P8YQny571D8j2nq4bz0cHbcU9sOLmFWDIxXCwVnVeoSvGj5JTQoWoXcRA0k4JmeOfLslaH1HN1QPx@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/n4Pw5rTgpo7k3SmTIKOxjJQILoYHdf7scY4N+ocPH6wGDdII
	Fi6janU7ZhpqtttD6jOt9YpkK310bD9XGd4+W3Ij9L5TK8VE1REvDwqi
X-Gm-Gg: AR+sD13xfGZhGqEUaWT0TJomO7QMYo+9pQsuCSVVBm+FfQBU3xXBNfjm/STkEzR7iWe
	/VK9P3TD1sbc+Z8q/wgYJt1vuu+3wsKQ5okofzxtUYyXotJn/W0iiA9Q0JhctSIf47CN22/eoYS
	DkoK8sEYtx9jcDdUP+qC2NUcWR4dyZvcdbGc1yQy9fseFocEtWtd3cDaiKuJt1uGihw6a/S2ktJ
	ylE5Di3bs/Xpnwei8QypKuzJJftEn6kF0+uHt6a9hTcFArHepX+L9iXfiIivKhJ3EvVikp6/wCu
	1vSZguZ0t3q9PftL169hxOoVARnZqjPIFEnHbb598mPB6O1UdhUAKp0+ibpg1mxjQJKBJUaKCQT
	TjujD7FG70ZHtSWMq7vPhwoW/lU/p30EAM4fyjYqUIV1xpE1Q+r5o7inCABjGEeNIX/QlfoEBJ1
	u7Gm+NRV0o4I4TCRRV3GFpiREEW3GS9h+iKkKIg+CTi2g9OfN/3h3+nHhDk9TNvRiZnwhFPf+Fd
	2e9sAADkYNC7YBZoGxRZ0u++FoBq/SDPQQkcZSfsVi6Ywjt5y7KMzSRvCwscmZWjsQgsdroAcxP
	ytM=
X-Received: by 2002:a05:600c:3e0c:b0:499:4e47:eaf2 with SMTP id 5b1f17b1804b1-499aa1a3e87mr144312755e9.6.1787167349071;
        Wed, 19 Aug 2026 12:22:29 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa17f202sm75178105e9.13.2026.08.19.12.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 12:22:28 -0700 (PDT)
Message-ID: <45a31ea4-7660-44c6-980e-daec6655629e@reactivated.net>
Date: Wed, 19 Aug 2026 20:22:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, florian.fainelli@broadcom.com,
 iommu@lists.linux.dev, jgg@ziepe.ca, joro@8bytes.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com,
 robh@kernel.org, robin.murphy@arm.com, will@kernel.org
References: <20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net>
 <20260728225727.148778-1-james.quinlan@broadcom.com>
Content-Language: en-US
From: Daniel Drake <dan@reactivated.net>
In-Reply-To: <20260728225727.148778-1-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_122231_616155_1F02E924 
X-CRM114-Status: GOOD (  18.03  )
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

On 28/07/2026 23:57, Jim Quinlan wrote:
>> +#define MMMU_CTRL_OPERATING_FLAGS (\
>> +	MMMU_CTRL_CAP_EXCEEDED_ABORT_EN    | \
>> +	MMMU_CTRL_PT_INVALID_ABORT_EN      | \
>> +	MMMU_CTRL_PT_INVALID_EN            | \
>> +	MMMU_CTRL_WRITE_VIOLATION_ABORT_EN | \
>> +	MMMU_CTRL_STATS_ENABLE             | \
>> +	MMMU_CTRL_ENABLE)
> 
> Hello,
> 
> Why not request the MMU interrupt and use the "INT_EN" version, e.g.
> MMMU_CTRL_PT_INVALID_INT_EN?  It seems better than "ABORT", as with an
> interrupt you have a fighting chance of the handler printing out something
> helpful and shutting down gracefully.

That could indeed be useful, but the only info I have about this 
hardware is the RPi kernel's bcm2712-iommu driver which also does not 
handle this interrupt, so I don't have the required info to set up an 
interrupt handler.

Could you let me know the interrupt routing details for all of the 
bcm2712 iommu blocks? e.g. which GIC/L2 IRQ lines they connect to.
>> +	/* Shootdown register deals with 4 pages at a time */
>> +	for (page_group = iova >> (IOMMU_PAGE_SHIFT + 2);
>> +	     page_group <= iova_end >> (IOMMU_PAGE_SHIFT + 2); page_group++) {
>> +		MMU_WR(MMMU_SHOOT_DOWN_OFFSET,
>> +		       MMMU_SHOOT_DOWN_SHOOT + (page_group << 2));
>> +		readl_poll_timeout_atomic(
>> +			mmu->reg_base + MMMU_SHOOT_DOWN_OFFSET, val,
>> +			!(val & MMMU_SHOOT_DOWN_SHOOTING), 0, 1000);
> 
> I think it would be prudent to have this function return the
> readl_poll_timeout_atomic() result and then do a dev_{warn,err}() call once
> you are out of the containing spinlock.  Also, why 1ms -- seems a long
> time to have a spinlock.

I'll do that. And yeah, that is way too long. I took some measurements 
and all 3 of the TLB-related cache flush codepaths take around 100ns on 
average. So I'm reducing the timeouts to 50usec.

Thanks!

