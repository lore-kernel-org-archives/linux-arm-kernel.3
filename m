Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D621EC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INcpUno4CMeCoSWa31fGGnXJCg6HwNsUBH/ehD6uQzQ=; b=tHucMAiGbdVAubchpP4E9NxlaT
	J2SscaX4j2Ff0xG9YZO+0cmV9cCVMa4wAWemqnhhpyc6vVJ95dvhyTsvPV8pknVuJUnggVouIcsGo
	Gd4V5UWE3GPlHShZv8LdU1WixxGaJmZ7RLv2/rfur4BM37cYgfkBTS5eHZiLe1P6dbVX55J7PgXV+
	r3bRTOIZtzISy5BsLIu+sBZltZrFs+CZzTyIL7AQI425PB/2gmZ6kU6OxJQkoD+pQdhd+IUS1piL4
	bxPg4clYTVSzEZwpNhLqFJzkMO9POdx3MukjB0WW9iBrWea7HlMo0ZwFK3ACEgnve5aIdk+tMYRPX
	Zj2hLZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Zrb-0000000DhF8-1chW;
	Thu, 10 Sep 2026 08:10:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZrY-0000000DhDm-1AHq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 08:10:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49b965570d7so75540025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 01:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789027826; x=1789632626; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=INcpUno4CMeCoSWa31fGGnXJCg6HwNsUBH/ehD6uQzQ=;
        b=fzp1nkW0y12kQRH0tddZY2O09gHR/KA+7fd+hxmCdTL7ZkhinyP4KIqfe790VZWYz2
         dKoBA6ft/TXIjW8RHaI6SvFimwGs8jRK9/DytsOdgUmxfVKc/5QWEpMI2jsVA3T3ZHJX
         VODj2uMUIbCVz6puvJDi20v9/YOEiQcNK0aRrDxIJaRhMUp9a/U8JCn8sEe5segGOpNK
         SFn9cgeEJTOhEP0/xBepuGGUxSVIOSp6pZwZrDpErb2tEubEI7zExRCkDOTwdxZmby30
         3JZHwmAQyLsYCwv3tFK4Urqz2836VzcZ3RQ2oITl3Xt/rptqz0c4UXFlfk2aVsPH2ALR
         VtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789027826; x=1789632626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=INcpUno4CMeCoSWa31fGGnXJCg6HwNsUBH/ehD6uQzQ=;
        b=Wv9vUoFSMZkgiTA3X0E9g9BlZ/xhiubpqCmWLZJVpfBAkH+QdH4kCTlcdysy8JdSKM
         PYCGI4VE52R12ID4oukdGh8fmglhQvThYVuq5sL8jeGVgdBz67m1O3pNv8POIMQKylHG
         bKfVAKwngzLQpZo+COGBhSfzpbPOJtFUBDGJ2Kh08FY2wCiwlSditPqWclNEBEhnrKPq
         DVhNqbQISa9e0GDcS2Tu8y6pkMrTITjqFainRDVZwq6Mtqh7/VVwUP0mhQdQCgCiQpOE
         hAs7yBcgR3qFliS/txfkN2oR4l/rhvsCzlPWaGEhoMu1vRgmCKbDfPBqSdHiwBM38Ysj
         bVHg==
X-Forwarded-Encrypted: i=1; AKwUvBzi8J2/k3kcLVpLDqDpg4AeOdJKk60Vnjwp4/6q5EcMKnU6XA3gTIXlpyWoUTrEzuo5pcJQ+spKoNDGMzmDDr3O@lists.infradead.org
X-Gm-Message-State: AFuF++ns10XWxMHhrQZrvm2KurE5MJTXUMvfcQ6PlCmtmD5lwdc63pZX
	ZMrm1VyegiH4Abb/87OSaNRDaKbkCpQTU2IJjiCT+qanZpSBAKZM1qdf
X-Gm-Gg: AYBFou0y/pO+p/bQHSfriNXZWKUBrmTuATjnm3LcmcwiafNEh08APXALi4FGdgfz3Ci
	MAKH1swFSgmZVCGH60ynrJl3OS/U1CYP/SiK67u8TBVOYtDW9ZHkci1xPivVW5UCETY4iDjyU+L
	dPqGOaMCnNdZjdOmJfF7tsNF02/mOAZTHJcwb2MUMDdOju6hedRPUbAwJjesFBQEwLXqAvhjsjG
	fdjH2e/2nC/s0jnd94i1UXDCBYerkfxpKKuOKNYMQZHuSy4gfRr9ONq8CXBy6G4MIiXnMBwnUwu
	+vNnQ7JsI47Q/FObSaDzmaTdqwdnvdg8VVamlTTwflblPfUFGGxzfFdMhRvCPdZlwhjVBQ8cnP4
	BsY9LPgKR/ceq6nWSzEj3cBS+OYy2fm3aLpYoX5ARffGS1YJl0AJ6fakdPNG1eFz4OlTs9xq/gC
	ZptXKek/M7DUIizsKxbJr+Krli/Bs10IbuPWLQBVT2+E9d9iGleZH2amlkHtjebfNZ3kzyr2Lck
	nKPXZ1IECqj
X-Received: by 2002:a05:600c:8707:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-49cfc6e8efdmr368618445e9.19.1789027826071;
        Thu, 10 Sep 2026 01:10:26 -0700 (PDT)
Received: from [10.128.189.58] ([185.195.28.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fc1be3sm55241535e9.4.2026.09.10.01.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 01:10:25 -0700 (PDT)
Message-ID: <05f93f31-08d6-4d9f-a897-a36a96af1629@gmail.com>
Date: Thu, 10 Sep 2026 10:10:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add Raspberry Pi 5 RTC binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Bell <jonathan@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260909141300.1368790-1-sander.speetjens@gmail.com>
 <20260909141300.1368790-2-sander.speetjens@gmail.com>
 <4c237cd8-024f-405e-a00e-e22ff9529d08@kernel.org>
 <8cd19ae8-372b-444b-bd2a-dc01221b5896@kernel.org>
 <CAAOJLPHNGgC7B=7ESCifZ1FPcR6V=Hcg-q-aaVg_9M_-d6Fh2A@mail.gmail.com>
 <718e88b8-3f3b-410e-8e76-90c370ff920a@kernel.org>
Content-Language: en-US
From: Sander Speetjens <sander.speetjens@gmail.com>
In-Reply-To: <718e88b8-3f3b-410e-8e76-90c370ff920a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_011028_339155_370D9BC3 
X-CRM114-Status: GOOD (  17.39  )
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

 >Whether device has separate node, depends on it having dedicated
 >resources. I don't see such here, so unlikely it should have a node in
 >the first place (see writing bindings or DTS101 where exactly this
 >question is asked).

I think you are right there is no extra node needed (only 
the trickle-voltage-millivolt property) and it could move directly into 
the rpi_firmware node without creating an extra node.

Kind regards
Sander

On 9/10/26 09:08, Krzysztof Kozlowski wrote:
> On 09/09/2026 22:24, Sander Speetjens wrote:
>> Thanks for your response
>>
>>> And more important, where is any interface to actually control the RTC?
>>> I see nothing, so your firmware is? Then this is not a separate device
>>> and you just added DTS for your driver, which is a no go (see writing
>>> bindings).
>> The RTC is a physical, battery-backed RTC, but the Raspberry Pi firmware
>> exposes its register interface exclusively through the firmware mailbox.
>> I initially used a firmware phandle so the RTC driver could obtain the
>> existing rpi_firmware instance.
>>
>> Based on your comment, I think it is more appropriate to model
>> the RTC as a child device of rpi-firmware,
>> referencing to the existing firmware clock/reset/power services,
>> and have the driver obtain the firmware interface from its parent
>> rather than adding a phandle solely for driver plumbing.
>> Which also means moving this to arm/bcm/raspberrypi,bcm2835-firmware.yaml
>>
> Whether device has separate node, depends on it having dedicated
> resources. I don't see such here, so unlikely it should have a node in
> the first place (see writing bindings or DTS101 where exactly this
> question is asked).
>
> Best regards,
> Krzysztof

