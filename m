Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B1CCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiU/qRnryf546DyCg24gqS1SHnp8qC1F8SvAGiAg928=; b=f1/fUN73t/QoaogLOW6cmvMfSz
	B9ZHZTfNdC5tdKrjjGOVIW0cNrjnBcBpk89Dde2JeId9j28J1j3+6N20ioKLQMqfomLIyeWzmsxw8
	OJW7ypyysWyGJ4rX9VbFd9Kcjx0Z7KZwSOtrXysTE7dbHZB9j7OEBpkkZfdl4WLVyvTrl+ynsjLwD
	mv9D39A+IpcN6SBqBOGhT+3F5mASUaV6bcCQ35m2SRWPlVtlIBBYKeeKNLQfHDhfTa+mj8piAFXuL
	TUplCrXS5ZWcbVDuxEk8329QfAMA14nSW4hU3ShFI+e6Zrebss6NvHT2QXL3YYEwzV6jVhiCbAsvp
	56zUbQVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nPu-00000008Sj7-2kPY;
	Fri, 17 Oct 2025 16:34:58 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nPs-00000008SiX-05A2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:34:57 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7930132f59aso2963454b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 09:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760718895; x=1761323695; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiU/qRnryf546DyCg24gqS1SHnp8qC1F8SvAGiAg928=;
        b=S4lVLhp+EENCsszo9j/sqLPTMLIYRCDymvoBTf0kTrQ60sBSZ+2gbs4VrOGws5AhHm
         FCZR/1eIbJcQT5bWUnZfpDGUCxO5YVWqW3GePwbd4ZxX8bNgA2unp3tdxCJiPFrTLUwF
         7TrCF19R2BSEcXJBwaMwWFQxmUCK3gc4v0/qI4hO/CK+BLEHQT6zU7NqCh0SYgBDURvQ
         YmBOkB9iSaEIDfDP5g17jb7OZeYFMe+fmniYaAXNd495aFZSwmiQ26591qLrDGVrorXe
         2tK91Dc6d9UoWXkS210ZHIg+orPpu+RbuU7bpnkxhyCdUbktJox6p5gQHxUvLvoe4K31
         /9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760718895; x=1761323695;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DiU/qRnryf546DyCg24gqS1SHnp8qC1F8SvAGiAg928=;
        b=p5QlwBEAxleZT2ZImGBe0eHPumy3iMr3CG0cr2mIzQ+uNitBS0RugkFLhHhO3Dk4Fp
         dEaqCOVIwc91BItRDJg6xeisAcOfV1/UOzpJPEo8FTcOi0GkI3iT1lkNthCou6x7UZLS
         UdzVqmJ98RQ0DTW5qCOQ25nmSgDWzttV712gm+z1bH8Uva3nhTEBxsW6wjZctYL8mzri
         itTp/COUZuKL3S9tDe5z6/dnYRjYVxUDPDJOhCFGLW+ZnN15uSskReffDhQ08WUhAe0k
         8vWtY8dVDS4XMWdta52TL8Iv3ePS91M7VPBrxJ8gAXeg9eOpsssWnBZ642jE2ewu1ETR
         JC7w==
X-Forwarded-Encrypted: i=1; AJvYcCXZxS5jMBuH8nrPzBXQ7hmTJLEuyII0guXkLgtSzqq/4i8lYUupFl84tCChhDSIhq0T3+r3VMMFPgcx/JVgwzOa@lists.infradead.org
X-Gm-Message-State: AOJu0YwEn/8tXNnT4A3edNEpYa+z4NWRxp/CInostC6PgHmrKoenbeH4
	uYiHy0vb83oB2bo4Iyh8gk2EMn1s4bxzWMKJrGRPxO4I+Bwx6BcE5XrlTvJLOKM1nKg=
X-Gm-Gg: ASbGncsLRwrVDVj0+kpvAUF62sQbSc4I8uNqUlYbVivx8iXkhul31A8LVCkS1qhHuBC
	fwK++vI8U6hlzkBTkiCS7K1RtUWQU9bJE0m8E6AKftJHdxAL8jbplV3cp0G70hnJZnoUde6gCm9
	QrmqyxjdsyqCxs+Fg/ytDm5h4ZiBJD7ttjtHY//Aiskm97T2RQoc6CfN4K3nN1dvYRXyPWALu8i
	l2FvCn9fRsdInSfOwJakJATEai+6SsFeRiGRLe3IrVdyaE7+yLspPRytjInLTAepAzDadRSkWzg
	YhcH2E0rHDG2CXPtg0i9wF5hKcyur9OA1OjT16nreQ2wf8pMDx7/cCWNuqmi0eOJVvzkkbJczqh
	TrMWFCNv8VO/R8dujGCcVgBGnnwMtebGQBoBbts3WBOoRdjB/kYdwepBVspcIiA==
X-Google-Smtp-Source: AGHT+IFJ3+KNPGSuwMfsWk2oP7Mi4HeigQmPSucY0XlswK32zmoftHGchXXTi+JkTmrGrEHybr+mbA==
X-Received: by 2002:a05:6a20:e291:b0:307:a015:37ef with SMTP id adf61e73a8af0-334a84da469mr5925151637.20.1760718894441;
        Fri, 17 Oct 2025 09:34:54 -0700 (PDT)
Received: from CNSZTL-PC.lan ([2401:b60:5:2::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff15829sm16810b3a.11.2025.10.17.09.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 09:34:54 -0700 (PDT)
Message-ID: <601cd8dc-afb5-4a67-af63-567814d755a4@gmail.com>
Date: Sat, 18 Oct 2025 00:34:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: fix eMMC corruption on NanoPC-T6
 with A3A444 chips
To: Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Grzegorz Sterniczuk <grzegorz@sternicz.uk>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251017073954.130710-1-cnsztl@gmail.com>
 <7f0b1747-87eb-0b0b-6fb0-304811a4be21@manjaro.org>
 <d9d14ce2-2e65-422e-95fb-eb30b128ad90@gmail.com>
 <41154cde-a447-0707-4387-cd3dca90b97d@manjaro.org>
From: Tianling Shen <cnsztl@gmail.com>
In-Reply-To: <41154cde-a447-0707-4387-cd3dca90b97d@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_093456_086749_4A1F8FD7 
X-CRM114-Status: GOOD (  26.55  )
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

On 2025/10/17 23:15, Dragan Simic wrote:
> On Friday, October 17, 2025 14:08 CEST, Tianling Shen <cnsztl@gmail.com> wrote:
>> On 2025/10/17 18:25, Dragan Simic wrote:
>>> On Friday, October 17, 2025 09:39 CEST, Tianling Shen <cnsztl@gmail.com> wrote:
>>>> From: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
>>>>
>>>> Some NanoPC-T6 boards with A3A444 eMMC chips experience I/O errors and
>>>> corruption when using HS400 mode. Downgrade to HS200 mode to ensure
>>>> stable operation.
>>>
>>> Could you, please, provide more details about the troublesome eMMC
>>> chip that gets identified as A3A444, i.e. what's the actual brand
>>> and model?  Maybe you could send a picture of it?  It might also
>>> help if you'd send the contents of "/sys/class/block/mmcblkX/device
>>> /manfid" from your board (where "X" should equal two).
>>
>> Unfortunately I don't have this board nor this eMMC chip.
>> I got the chip model from my friend, it's FORESEE FEMDNN256G-A3A44,
>> manfid is 0x0000d6.
> 
> Thanks for responding and providing the details so quickly!
> 
>>> I'm asking for that because I'd like to research it a bit further,
>>> if possible, because some other eMMC chips that are also found on
>>> the NanoPc-T6 seem to work fine in HS400 mode. [1]  It may be that
>>> the A3A444 chip has some issues with the HS400 mode on its own,
>>> i.e. the observed issues may not be caused by the board.
>>
>> Yes, it should be caused by this eMMC chip.
> 
> I'd suggest that we move forward by "quirking off" the HS400 mode
> for the FEMDNN256G-A3A44 eMMC chip in the MMC drivers, instead of
> downgrading the speed of the sdhci interface on the NanoPC-T6.
> 
> That way, the other similar Foresee eMMC chip that's also found
> on NanoPC-T6 boards, FEMDNN256G-A3A564, will continue to work in
> the faster HS400 mode, while the troublesome A3A44 variant will
> be downgraded to the HS200 globally for everyone's benefit.  It's
> quite unlikely that the A3A44 variant fails to work reliable in
> HS400 mode on the NanoPC-T6 only, so quirking it off in the MMC
> drivers should be a sane and safe choice.
> 
> If you agree with dropping this patch, I'll be more than happy
> to implement this HS200 quirk in the MMC drivers.

Yes for sure, thank you ;)
The full cid is d6010341334134343411f63ea7208700.

Thanks,
Tianling.

> 
> As a note, FEMDNN256G-A3A44 is found in the Rockchip Qualified
> eMMC Support List v1.84, [2] but the evidence says the opposite,
> so we should react appropriately by adding this quirk.
> 
> [1] https://github.com/openwrt/openwrt/issues/18844
> [2] https://dl.radxa.com/rock5/hw/RKeMMCSupportList%20Ver1.84_20240815.pdf
> 
>>>> Signed-off-by: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
>>>> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
>>>> ---
>>>>    arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 3 +--
>>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>>>> index fafeabe9adf9..5f63f38f7326 100644
>>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>>>> @@ -717,8 +717,7 @@ &sdhci {
>>>>    	no-sd;
>>>>    	non-removable;
>>>>    	max-frequency = <200000000>;
>>>> -	mmc-hs400-1_8v;
>>>> -	mmc-hs400-enhanced-strobe;
>>>> +	mmc-hs200-1_8v;
>>>>    	status = "okay";
>>>>    };
> 


