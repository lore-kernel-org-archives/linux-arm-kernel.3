Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1EBCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 00:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqKU8AOkK2sYZLUnyHJFIE8wA4u3vUpzgORbVfbSXxw=; b=tOo+brkIptS2RG7oMlJptf24GT
	9D7co5K6FHCLdn2K/yVHVDDxpyovEB7xjkmG/Eavh3cN9ETGeGghxxIoQQg+YajPjMJrUMtCdtWnz
	yDCAcmcVjbMJZMsOfS7Y5lyQR1R2thewStkzBht8DHCKGTy2sKpi9WmRWmFz66/YkiXrOG/1YlLCa
	NVoHUWy3/Bj5+E/T54iTv0/xTpD2ToH8KNOK3pTPFxW5iHxmu6Ecfpl9OkewTsk0GZiWqAPIf0O5Z
	hY40UpnURQskMkzvu/hstkLp9zCBoJnitRzQw2/8iADhfrKu2OIcHMef286BLA3V97ZeinyVQowPX
	uCROkItA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0U21-00000008QNN-1xNp;
	Mon, 22 Sep 2025 00:03:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0U1x-00000008QMh-2st9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 00:03:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758499424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BqKU8AOkK2sYZLUnyHJFIE8wA4u3vUpzgORbVfbSXxw=;
	b=fvP74JpxbQmNo1FWFWCMdszGDxrQqjXZf9hGtyR3JdCWJ7C4aGAQMJi+fqRlk57bJCknjy
	zHxcQH8OH3FCohUXycdn/+l2L7gxlGpk1oZWNcsrPf1puPgHJ6emb7u7491VgmWXXXv0WK
	EPH+912XEk04qryV9HeA4y8bh8JTJjo=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-uYPLGBWfOXS7O7wKP9AXxQ-1; Sun, 21 Sep 2025 20:03:42 -0400
X-MC-Unique: uYPLGBWfOXS7O7wKP9AXxQ-1
X-Mimecast-MFC-AGG-ID: uYPLGBWfOXS7O7wKP9AXxQ_1758499422
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77e7d9ed351so1751595b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 17:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758499422; x=1759104222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BqKU8AOkK2sYZLUnyHJFIE8wA4u3vUpzgORbVfbSXxw=;
        b=Pz4EKjwU2ZnHZhom5V+lDs0x1+QWm5EKhlZ3ZCaIco1Tz12mqmFzqDomQqvM4hf7tL
         RoXIFHj5vk/eM//5xpd/AQty436NetTRAmG93btssyRi7bKMVq8mvoaVyU5P0KgfHfn8
         J1lLaQwyPEM8lvWxFxNcDLU/qB58PmUeH675aE+WZjcPZhRzC67mLCV8j9xcBP/VUVnD
         +kMx1pFEBDzopMGtn9wp3oRp//KCKaGZxIiUTq2QmYkTFYgVlT6tAljRO4SwVHC7ffM1
         XmZ6Jg91l5Kzmh26p5/9uqPOOb0ymLRTSELTeD1NXlIPGIES/xD5WtNyLiDw6h6yWQhp
         iLsg==
X-Forwarded-Encrypted: i=1; AJvYcCUyMtt5YgfyeAVsK9Kepc12MKyjZeWHhcwBDxm1iP2Eb0xtP+0oW0iy7ugImH6Ip6spjazOK0ZSzQd+h//9VJ4H@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8Q6NbHzMM/Uf5LKkHZxNvMeWJhKZGBEYUIRd6E/WKAakfFwTs
	yPw0Usd6q/cWzIXGUhfiknTdOtx2YYpk7teystW/TQl6k/jdB5Pupq23y05RvLZZx5wzZSzTLhZ
	ReaM9jjcwjcCjPSPRpFb+YINzpYGnZjroDaZQjR1iz/EHaS6e0kll+lAYfTCQ5PtrbbNrYOFylt
	rJ
X-Gm-Gg: ASbGncuNi0eDIhZ7B8pxdwwVw1T0xTthqbk0I2MecxdzigZNTACgejZjjrBnLJm9A0+
	403qhi9k6PE+NjJ/rMDlKD8Cffg22N8wUUuK/2RAZvNVjAmoHoveeI0U0dxlAVlgFQ+pG0M0iY8
	JcQjCEgW9Qkrp7Ab5PeWGbD2dqM34qY7bbTmA+YhMcKtzgr3D2EfGPe+MQdji1ZeD4P/Urh+Mwc
	6NxBwLID75F7213e/BTV4E1W31fbTJPD3ie58mHSfhH8DMc89n4TK166VzdZXbXem4uVGrHB8rN
	EpZrKC5bZRhO5yoTl79sse9Ww7Yq3o17ZE3OOHrwYf03by8tEzGoddkEK0HUfr8FZjSvsvpM/zw
	wiveh
X-Received: by 2002:a05:6a00:10c5:b0:77f:2efb:11d5 with SMTP id d2e1a72fcca58-77f2efb19b5mr3965874b3a.1.1758499421860;
        Sun, 21 Sep 2025 17:03:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV+P3PLtWMFz48LpuCCUOGv1CdGlTH41uj5nbM1D8BAHioMb2Zl8ZXd6r9GdYmEpNm+I3zQw==
X-Received: by 2002:a05:6a00:10c5:b0:77f:2efb:11d5 with SMTP id d2e1a72fcca58-77f2efb19b5mr3965847b3a.1.1758499421542;
        Sun, 21 Sep 2025 17:03:41 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f30749642sm2123356b3a.100.2025.09.21.17.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 17:03:41 -0700 (PDT)
Message-ID: <59d78787-1871-41ba-9a2e-30d1596c021f@redhat.com>
Date: Mon, 22 Sep 2025 10:03:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 32/43] arm64: RME: Enable PMU support with a realm
 guest
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
References: <20250820145606.180644-1-steven.price@arm.com>
 <20250820145606.180644-33-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250820145606.180644-33-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S7dIy2xkCUh-BrBgRiSlkpWuS3QPir3Qgo92JuNfQBk_1758499422
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_170345_801765_B0339B2E 
X-CRM114-Status: GOOD (  16.96  )
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

On 8/21/25 12:55 AM, Steven Price wrote:
> Use the PMU registers from the RmiRecExit structure to identify when an
> overflow interrupt is due and inject it into the guest. Also hook up the
> configuration option for enabling the PMU within the guest.
> 
> When entering a realm guest with a PMU interrupt pending, it is
> necessary to disable the physical interrupt. Otherwise when the RMM
> restores the PMU state the physical interrupt will trigger causing an
> immediate exit back to the host. The guest is expected to acknowledge
> the interrupt causing a host exit (to update the GIC state) which gives
> the opportunity to re-enable the physical interrupt before the next PMU
> event.
> 
> Number of PMU counters is configured by the VMM by writing to PMCR.N.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v2:
>   * Add a macro kvm_pmu_get_irq_level() to avoid compile issues when PMU
>     support is disabled.
> ---
>   arch/arm64/kvm/arm.c      | 11 +++++++++++
>   arch/arm64/kvm/guest.c    |  7 +++++++
>   arch/arm64/kvm/pmu-emul.c |  3 +++
>   arch/arm64/kvm/rme.c      |  8 ++++++++
>   arch/arm64/kvm/sys_regs.c |  5 +++--
>   include/kvm/arm_pmu.h     |  4 ++++
>   6 files changed, 36 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


