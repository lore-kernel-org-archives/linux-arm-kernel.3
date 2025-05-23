Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01911C54F2E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 13:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/m0lhD5TLZ440p1Ln9LZrKk9CxCA5FWlLg85ARTR08E=; b=HjpUE735UhEMryzoaJJl9a/Ig6
	EdD7ZGI7m/9pMoL3IZXJO6W916M1twkocqQ423dAt7cqauD3hKs8fsp8sYcF66k5WgzLsSFiwWaOq
	ycduhaz4Bhh4WNOWpQMPAvr7PrB/JyliIGk3ZQvMqRV7boFeQ1f3BJp4QxkaiC4QawG0v3S6cVi3e
	5Wt3QKYrS7EW6rODnw8PRVNAnE4tciuWYlvCY6mqicUUxxcz6srYfDbeBVENGU2Xa5x/Sp41DaS5t
	0MM9HtliOjMylO9aUOb2h/AgssA7nWpvmKMk+Uyp1yrUquTpzukC/EwxVFk+HeipdDZtGhkRaVjln
	zOYaxhOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISI5-00000003vaS-1yoY;
	Fri, 23 May 2025 13:18:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRyZ-00000003sJV-0vqU;
	Fri, 23 May 2025 12:58:16 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-442f5b3c710so75470005e9.1;
        Fri, 23 May 2025 05:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748005093; x=1748609893; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/m0lhD5TLZ440p1Ln9LZrKk9CxCA5FWlLg85ARTR08E=;
        b=ZIxjqj2lvWzrSzxEWOjkAeLTHbYmgfRIHs3dUgtSzZLQ4XNjVhgwlYU0iX18vrDRei
         tM7J2e8gnRdNezPwRFMywVU7ysFegMMNHLevOm9t/ww587nz/BxAgUvg7O40GJXGNJAq
         RVM4oYy0lPjm1iXF3HE+SywBnxR61KYEf0Q1WycdKY3oTzx+ZjWepMdOz9p/hTMzU2oD
         7DTN0H3HVgCLVs96KoVRue2VAEzVaA3fv+Y+MGUN8+gd8/WzzskDTNv3bIQ4JXbHopNT
         w1WpF2fsFdvZsbgo3CktwkHEkZq5BLZz2NWp/9jwiHriqzrDtTw/hHZKqTEF9J0923KN
         //kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748005093; x=1748609893;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/m0lhD5TLZ440p1Ln9LZrKk9CxCA5FWlLg85ARTR08E=;
        b=tVT/nPe72pKE4cDuoh4PQ9JYX7ItbbXCguDgIaXs5LTfTZqnqyjBrPMjYur1MEgur0
         aq5Iq4AfipfiuoC8qetlAfGx67wRWbErkmTmllxuQZs6UpPCGTRoOISQrg+FpBEE1ZzL
         Ln51nDHqzxGaFPnUEF/vfCZDhjBQ6DhaaYfpnyW2jyP5OcIs/w07+hIt+IcJK+BgyEke
         KypWN73tzJjpGIGYu8tyTjlT7r1vCLfP2iBAvUCHcJi/i10h72zKD4AlomGDOYJ4Asuh
         lkHRvwDjCKxpDFh1xR5xUEOGNUNdU5rTtunNaKnddVx5pr9wv5HIx4+rR/NQ2TE/LbKm
         /q1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7rQw/tpXaUAodB/PlCT1MDUs+0Vl9DrpcBBvGGEg2/ulzdUCxWR6F9Zrfh3uqp0lMCZ74y7MXmtY1R/dCVcU=@lists.infradead.org, AJvYcCWNmwKAZsWqtLvdmDpm/fJKPFFwxTXNfzV6Did3EYc3JC4XEOnISuVlBGxKAgKftKz2Wk3P0MgWnGNsTEafKiFI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2Pmk2b5G2u4VqcH0yGulQZcgWB3lVmuplp0Y382FDz0ZAfnE1
	qojin+PtRtl4magpofwee9Ad6QI6duzFl5wd3a58PMnrQXnyr30GQLcB
X-Gm-Gg: ASbGncsUu3ivMmkY6CrJta4VpoSEFQB16H3NjVxrOCPCyK0hSdwU18blJezhcHl5DHO
	Ye0DuwwRcA3UWmoLI2D3mmQ3VDZ1FU4bjzZo09fj2tNBH3q9RiI12fKx319b086Uk4CZ5jEMZ46
	0y/IRwQ1qE+icz0aAHD0No5UvqyddECvcg8H7WjNCJ0NKLjiU10CyTEgFDOxdDz3W3na2xFJhCH
	qhJZ3kIfTkZadh6107JzZRGdPH7XlwQArHwqzebqUpPjf3G90sjXHjjGPj/bTeu8AwyKcbGqAnz
	BqnMwWcIKKtyEqpdnIPIc4YTCE9bxCO6BuVA3laggzLz9vYEHAtVjQI4tB/FLV57eCw5EZ+g
X-Google-Smtp-Source: AGHT+IGf1pWMo4SXQAxm9lw7KSPXQcTfdAiwZDS6HUYzhHSDlhRC9FPIJF7bCo4eoueCnm0Os3tKtg==
X-Received: by 2002:a5d:5f94:0:b0:3a3:7593:81a1 with SMTP id ffacd0b85a97d-3a4c2343b5fmr2624012f8f.43.1748005092950;
        Fri, 23 May 2025 05:58:12 -0700 (PDT)
Received: from [192.168.0.14] ([178.233.24.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca9417dsm26093920f8f.101.2025.05.23.05.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 05:58:12 -0700 (PDT)
Message-ID: <8f9ae0f1-130f-482c-b0a2-d5a403639099@gmail.com>
Date: Fri, 23 May 2025 15:58:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mt6358-regulator does not probe automatically on MT8183 and
 MT8186 Chromebooks
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <f3c6ea1d-da0f-40cc-ba70-7cabb5c3189f@gmail.com>
 <dc21b01f-e89f-42f5-b6d1-f6a00a524235@collabora.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Content-Language: en-US, tr, en-GB
In-Reply-To: <dc21b01f-e89f-42f5-b6d1-f6a00a524235@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_055815_267480_0FA80A11 
X-CRM114-Status: GOOD (  28.01  )
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

Hello again,

On 2024-12-23 14:21 +03:00, AngeloGioacchino Del Regno wrote:
> Il 21/12/24 16:38, Alper Nebi Yasak ha scritto:
>> Hello,
>>
>> I'm left with one small problem trying to boot Debian on MT8183 and
>> MT8186 Chromebooks (Cozmo and Magneton respectively). I see a lot of
>> probe deferrals and get dropped into an initramfs shell. All of them
>> get resolved if I run `modprobe mt6358-regulator`, after which I can
>> exit the initramfs shell to continue booting.
>>
>> It has been happening for a long time, still unsolved as of v6.12 and
>> next-20241220. I am using `softdep mediatek-drm pre: mt6358-regulator`
>> and so on in /etc/modprobe.d/ to trigger it to probe, as a workaround.
>>
>> But I would like if it was solved upstream so distro kernels can work
>> "out of the box". Any ideas why isn't it probing automatically, and how
>> to make it so it works?
>>
>> More info from a serial connection below (on mt8183-kukui-jacuzzi-cozmo):
>>
> 
> It's a bit odd, thanks for reporting.
> 
> I'll check that next year........ (which is really in 2 weeks anyway, but it's fun
> to say)

I couldn't manage to ping you for this, let alone look further into it
until now. It has been a while, I assume it's still not fixed, do you
need me to test again?

> Btw, that softdep is obviously not right, but I think I shouldn't even have pointed
> that out; still, better safe than sorry, anyway.

Yep, that was just a debug trick I use. My current workaround is using
CONFIG_MFD_MT6397=y and CONFIG_REGULATOR_MT6358=y like everyone else (as
in the defconfig).


On 2024-12-23 19:00 +03:00, Mark Brown wrote:
> As indicated in that thread the MFD should register the regulator
> function driver with the name "mt6358-regulator" used by the driver,
> then the existing MODULE_DEVICE_TABLE() will DTRT.

As far as I can see, mt6397-core.c is doing a devm_mfd_add_devices()
call with the necessary data, roughly paraphrasing:

> static const struct mfd_cell mt6358_devs[] = {
>  [...]
> 	}, {
> 		.name = "mt6358-regulator",
> 		.of_compatible = "mediatek,mt6358-regulator"
> 	}, {
>  [...]
> };
> 
> static const struct chip_data mt6358_core = {
> 	.cid_addr = MT6358_SWCID,
> 	.cid_shift = 8,
> 	.cells = mt6358_devs,
> 	.cell_size = ARRAY_SIZE(mt6358_devs),
> 	.irq_init = mt6358_irq_init,
> };
> 
> static int mt6397_probe(struct platform_device *pdev)
> {
> 	int ret;
> 	unsigned int id = 0;
> 	struct mt6397_chip *pmic;
> 	const struct chip_data *pmic_core;
>  [...]
> 	pmic_core = of_device_get_match_data(&pdev->dev);
> 	if (!pmic_core)
> 		return -ENODEV;
>  [...]
> 	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
> 				   pmic_core->cells, pmic_core->cell_size,
> 				   NULL, 0, pmic->irq_domain);
>  [...]
> 	return ret;
> }
> 
> static const struct of_device_id mt6397_of_match[] = {
>  [...]
> 	}, {
> 		.compatible = "mediatek,mt6358",
> 		.data = &mt6358_core,
> 	}, {
>  [...]
> };
> MODULE_DEVICE_TABLE(of, mt6397_of_match);
> 
> static const struct platform_device_id mt6397_id[] = {
> 	{ "mt6397", 0 },
> 	{ },
> };
> MODULE_DEVICE_TABLE(platform, mt6397_id);
> 
> static struct platform_driver mt6397_driver = {
> 	.probe = mt6397_probe,
> 	.driver = {
> 		.name = "mt6397",
> 		.of_match_table = mt6397_of_match,
> 	},
> 	.id_table = mt6397_id,
> };
> 
> module_platform_driver(mt6397_driver);

It has more things like "mt6359-auxadc" and "mtk-pmic-keys", that also
list compatibles in the non-mfd driver's MODULE_DEVICE_TABLE(of, ...).
See `git grep -C5 '\"mediatek,mt63..\+-' -- drivers/`.

Maybe if the target driver isn't available by the time MFD registers it,
it doesn't try again later? And so people have added the compatibles to
subdevices to let them get another chance to probe?

