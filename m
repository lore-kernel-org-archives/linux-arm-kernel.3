Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C536C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 23:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLSJoNhqitBynpVd16vFcy3Vr4aNPFfC+ZBhksu/Yjg=; b=JOAss6jLa64mGwIU1Ze2kDLdTt
	m2JVVzSk4P8L6n9hgM0xZFM/ze0CxJ5EF5X2JyWqmDesmdTHFfccAUulzB/lWittl1dGRr83XsCWP
	mvYuSnu8YpWrjTeKbAYBH6Qc01NK8GcG6cUbhDIe2M+V2u4FLTLb/AAYlkO76DTFM4QiednQvMVtG
	/mBM7PV+fV6Ufn33KEU363mKKZtflyQKO0s7geV3MXyvtlFjKu6A6DnBr/OVTqScV7GGa7gMTpp2C
	tpxEWyKLprvg9vuVviaqnX5wvD0pvn2dkhB/rKKTHV2akdUv70xK6buBm9DqAtp6IxWrleBzu3txQ
	4kpAwGcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYOQ-0000000E872-36Jx;
	Fri, 21 Aug 2026 23:11:22 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYOO-0000000E86h-143g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 23:11:21 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-495437bb891so9141095e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787353878; x=1787958678; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLSJoNhqitBynpVd16vFcy3Vr4aNPFfC+ZBhksu/Yjg=;
        b=fVpHHJaibGH1sRLutRFPM/u1zRye1Cr8fXYCPy+0u/0UB92GhqaIRRg2qpIbmihZd/
         JlTyKFIhbrHKJ7v5DfTQfefBYE/2uMayrKcujco5s/eUy2YLM1vhVD6wyJ50P1SwFdrs
         a0QoJI3Nr7Z97KD8rGQoYEATzs0RT2efOPVOkUm/152tyFlDnNM8WEgpQWfTykBnYomK
         dQ3AT4uUrx+K9VpGeucqkGxu9cFuiTjCfP5/N/QLKTpwtQ/qfTEipbs3v44QM2z4zzA4
         /piQ8N1M2/tGN/lEYUMdDASRvQFan//IkdCYjbh4iC7I9VEFL7sB9cxAa7UNE8fy1uTa
         tmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787353878; x=1787958678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hLSJoNhqitBynpVd16vFcy3Vr4aNPFfC+ZBhksu/Yjg=;
        b=ZQ1M6cGPnbZmPfx9TObQKErvzRu5Bz8txNJzFuzCDpYyJxRmYVK7Rt1ZYJEKMeq/bV
         tKpx4haH7UHfxbx1hDD+lsgTotGA1bnHl6wRer0S7UqP9htSxy8RWYexTozBf8wwo0Du
         EItuDSPm0aSCcKW29EFNu34jMbG3Dm9Jh7ZNIt1fVb5k32TOPJx4dZ6wumKtszKETpX5
         YH8BLxUYUtsJoHz9ksOEp0DGNDuuM1TsOSwuNpX5fNNgxEOhZLotZ5vJRrnGuIwN3Oph
         qc+YA5G+UD2QqmoKQRsb0wTxqPqt5klzy0UrwbzOHL189NqYJ6jaSHDp31HvjP4WZBNx
         W0yA==
X-Forwarded-Encrypted: i=1; AHgh+RqGITj77CqdNLkBEW8PzrKd6Uj/l+V2A9JobokgMo6PC/siMnBnoAx8ojgFoW4Ab45/RHNvf/H6NF6+xnV48VIW@lists.infradead.org
X-Gm-Message-State: AFuF++nxwBY3yfuNRQxMFzVpCnmq+m46vBCcdRC6e4fqmIUz0XzHCZNo
	j5nbZvzoqEpSMlqdYpcdKhPNBhzIUXt3Om8y+5vba8+26WImKp1bTvft
X-Gm-Gg: AR+sD12JZYwQdMxDmojs7/7lFmYAJu8DnTtT7vPIp54GcJqRanPaBGjm+PEf7Ph9LLC
	WxB+mI2bIZB2S7aec+FGfBG4NiLTm37IRw8291ls06dPuNySkPmgPOINA0YMQvMX9j4iJ5HCqwm
	1SLp7VKYssQ7oOQS+Hm6kN1V1ME7OJOW3+0OInRqVcsKiTVs/e+2Ufqx4gVBCVzp3nU//jyNzlu
	+J0RcPLKo4MFRmUZfJFww5rir/zezYTOXFpfP1/DAIwrWcilYKHNoXu3mrqYw7rSIAONX8hYDUs
	01XGQBVXUGI4iCH9b90mW/sMbaVOHElY4YEpVuKluhF8NZC0eQQtDQg5ZAePb3UdWepM+hgwf6f
	79RSYMKoiA1nwsXZhatkDvNtkNiFsfBR3hsu8As5YhnFTNrGL315R31p6YMtdS5OtpONMh+8GIE
	IOZNzE6DCpJLznoJ27sDzbnma9ur+jLXQINjNW8XWfNWtb5tT+JjQ/ZYMfrQHcJ40iN2lUhg2/m
	nLL+WYkAcmtU+ftAKarfmO0b9N7lNyYG9iGU8AVCFxBkNqMx0j4F+JI
X-Received: by 2002:a05:600c:4e94:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-499b9198005mr78347705e9.6.1787353877591;
        Fri, 21 Aug 2026 16:11:17 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9a848dasm25994015e9.0.2026.08.21.16.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 16:11:16 -0700 (PDT)
Message-ID: <f4d11338-159b-477f-8ff1-1bd52783e183@gmail.com>
Date: Sat, 22 Aug 2026 00:11:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip: gic-v3: fix unmet dependency on ARM_PSCI_FW
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com,
 linux@armlinux.org.uk, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 bcm-kernel-feedback-list@broadcom.com, radu@rendec.net,
 kernel@pengutronix.de, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, arnd@arndb.de, Sudeep Holla <sudeep.holla@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260801212235.2692694-1-julianbraha@gmail.com>
 <87lda2j5gs.ffs@fw13> <877bllp5fs.wl-maz@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <877bllp5fs.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_161120_320741_056B20CE 
X-CRM114-Status: GOOD (  23.78  )
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

Hi Marc,

On 8/20/26 09:22, Marc Zyngier wrote:

> [+ SMCCC folks]
> 
> Thanks for roping me in.
> 
> This looks like the wrong fix altogether. Whatever the Broadcom stuff
> depends on is irrelevant, and has nothing to do with GICv3. Same thing
> for the NXP contraptions.
> 
> If there is something to do *for the GIC driver*, it is to make sure
> it compiles/links correctly when the platform does not select options
> that are not required. Why would NXP and Broadcom care about an
> erratum that is specific to NVIDIA?
> 
> I also disagree with what the commit message asserts, ARM_PSCI_FW is
> selected *globally* on arm64, not on a per platform basis (TFFT!).
> The NVIDIA machine being an arm64 platform, the correct dependency fix
> is to select HAVE_ARM_SMCCC_DISCOVERY on arm64.
> 
> The overall issue is that there is no fallback to do something
> sensible when HAVE_ARM_SMCCC_DISCOVERY is not selected. Random drivers
> should not have to guess or add random #ifdefs all over the shop.
> 
> I came up with the following hack, which compiles correctly on 32bit
> ARM without PSCI at all. YMMV.
> 
> Thanks,
> 
> 	M.
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 42f2278a702d0..937f17ec93a2e 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -37,7 +37,7 @@ config ARM_GIC_V3
>  	bool
>  	select IRQ_DOMAIN_HIERARCHY
>  	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
> -	select HAVE_ARM_SMCCC_DISCOVERY
> +	select HAVE_ARM_SMCCC_DISCOVERY if ARM64
>  	select IRQ_MSI_IOMMU
>  
>  config ARM_GIC_ITS_PARENT
> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> index 4de81848fe2ee..75f9d3f1723b5 100644
> --- a/include/linux/arm-smccc.h
> +++ b/include/linux/arm-smccc.h
> @@ -324,6 +324,7 @@ enum arm_smccc_conduit {
>  	SMCCC_CONDUIT_HVC,
>  };
>  
> +#ifdef CONFIG_HAVE_ARM_SMCCC_DISCOVERY
>  /**
>   * arm_smccc_1_1_get_conduit()
>   *
> @@ -363,6 +364,12 @@ s32 arm_smccc_get_soc_id_version(void);
>   * When ARM_SMCCC_ARCH_SOC_ID is not present, returns SMCCC_RET_NOT_SUPPORTED.
>   */
>  s32 arm_smccc_get_soc_id_revision(void);
> +#else   /* CONFIG_HAVE_ARM_SMCCC_DISCOVERY */
> +#define arm_smccc_1_1_get_conduit()	SMCCC_CONDUIT_NONE
> +#define arm_smccc_get_version()		0
> +#define arm_smccc_get_soc_id_version()	SMCCC_RET_NOT_SUPPORTED
> +#define arm_smccc_get_soc_id_revision()	SMCCC_RET_NOT_SUPPORTED
> +#endif	/* CONFIG_HAVE_ARM_SMCCC_DISCOVERY */
>  
>  #ifndef __ASSEMBLY__
>  
> 

Thank you for explaining. From my tests, your version resolves the unmet
dependency well and doesn't introduce others.

- Julian Braha

