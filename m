Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E10D69114
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgMI2XaAkzSEk7PCM+/3QfgY6sh/m9iqNd+K6a7QDCs=; b=OrQzqjrv2OBLfqeq75aXTi4Lq4
	hCvb+aE//i6j0v4XOskEfKXjjm3jP/sQJnBS2NuYa/k8v9MXk0eo1rTha+Xm+n5pdxdx+CxQmWNjC
	yH3BecE/3SZnvfAocgX1XMt4Nwq9xS9gACJAFecfGcbquIwoO2MzW3V1066wG6HLH7xlhOFhnPU7N
	zmtsOXeNKPYTAiToJQF8PVpBt0Mxd7EnlZhW4pE7VmMk0Kd1BfERXbRAMM27eUHsTeh4uKjVV8/em
	ywNYOkB8mCiTN0cn4yOlbCVa9MfTOWcc7tmi4T19BPForu3mjZWfkDFWNNpSdXPAUS3kYedUUscsY
	L/XHyuLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGg6n-0000000FpNL-3Qyk;
	Thu, 28 Nov 2024 15:07:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGg5n-0000000FpCq-3b7p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 15:06:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3823cae4be1so598708f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 07:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732806366; x=1733411166; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MgMI2XaAkzSEk7PCM+/3QfgY6sh/m9iqNd+K6a7QDCs=;
        b=lLdqlmq7sSOH7BAV07k0DeNsN0flHSCf5fofMkx1VHw3d0RCW44sTy1Mt5ALLbQzxW
         6Jh0Wn1L5KI3uiXVQuuZmwX5Uv6ZJDZi/VvIW4fwPptSnN91uRPyZcRNefHphDEbK5E+
         4h1srckh8CAAoHpLh2frFn8b/m13OWMGCfOrRl81tbWXdz66WXKpfiLbzXH8KwMP9DVi
         a0WtvqQA3ljVHzBOUtpe2bAGSVk8hxxq7MT/X7owdbyKEYzKb3NO69ikXhKsBw471OjJ
         pVYgt8vdgNQlmn6XGW/G6Ic3tfKQakaoSWdqzz80P9Dopk+daeG6wo9xs97o5ZZrQgmW
         K/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732806366; x=1733411166;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgMI2XaAkzSEk7PCM+/3QfgY6sh/m9iqNd+K6a7QDCs=;
        b=P6rmA0O265VEkKTPhkn7ayCWCYJ4cnYxSL6ALHVFrbTQ1W/3cY2JQYi+1EftJAhtmj
         FoR+PvADQshGvz5zbMloH3qm3sUIBnT2TonnNPkWxyqVnMtlbCxAkmtEmnXWWWtLPMev
         Tudkrz3efq32U2lOBuXHT1u8Udcmhld0Ivn1aI5wQb8qInyOgzztgPv7Qi+ALtPNFSwX
         8gKOeEA2xxSv2io5/rwGe/kouM/8HW4X3CYxvttMeLUf9GeJoqw5IEHxe9aYrvnYbJkY
         NRjCuwCF9QcAMptr4CACURoRS5I0Bw+x5npVNMQcA1zn9Xvu/a4HheVzQKLFfEQvQ3VG
         9NTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDalzMCqew3+rB/JrbmEqZoXwDqULKU+kZajjY0PiADuwHRKqwPQGpQUlYFdEWnwaJpK9dIKvH5lpGA6wQjlvl@lists.infradead.org
X-Gm-Message-State: AOJu0YxBo+NvX1FFEQuoZGulPRTzToLoCNZj5gz1MPveR/vPpnfZN9eE
	A+KCpb0wXBSzvVpy2Og0skeFNxHTSlahmYYLa3DiCpdnCW9aku5AAo+mVr9xlnY=
X-Gm-Gg: ASbGncv/YiQNBZ2CM+skLGaYNy06wEIvDnkKD0epBBttzBE71b9YoM7Y0EShxzz0hJ2
	V66kk/tmz61h3EuvnwtARDfPJOXzJ9+1pVbTWLTKjUCsRXTib0vkTqKqE2Dww/n25ABPN1TSmwq
	oEAD4rKIp51hynfKAxzSTNIl5WseTm+L2FUt6M1QdKGAOHk8Q1qMGzEbxdoxV75t+4uxv5s4wzD
	5rXxqUmTppOZfbwWDI9kZWFraNkjuPraZe5nyJwsxen2YF4Jw==
X-Google-Smtp-Source: AGHT+IFCQOlNDI8ArzCZ2jGZrEopkwYDeCZvjEQAGp3/JK0gSJIUVVZoGTxQH/hrEMSp6P2HzE11Pw==
X-Received: by 2002:a5d:64cb:0:b0:382:4978:2aaf with SMTP id ffacd0b85a97d-385c6edc515mr5523043f8f.57.1732806365996;
        Thu, 28 Nov 2024 07:06:05 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b89d:29e9:7047:2d6f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd2dba8sm1893959f8f.1.2024.11.28.07.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:06:05 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>,  "Michael Turquette"
 <mturquette@baylibre.com>,  "Stephen Boyd" <sboyd@kernel.org>,  "Kevin
 Hilman" <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  "Mark Brown" <broonie@kernel.org>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
In-Reply-To: <c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 28 Nov 2024 15:51:28 +0100")
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
	<12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com>
	<1ja5dk2y5l.fsf@starbuckisacylon.baylibre.com>
	<f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com>
	<1j4j3r32ld.fsf@starbuckisacylon.baylibre.com>
	<306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com>
	<1jy1131kxz.fsf@starbuckisacylon.baylibre.com>
	<c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 28 Nov 2024 16:06:05 +0100
Message-ID: <1jplmf1jqa.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_070607_894913_CA5609D6 
X-CRM114-Status: GOOD (  25.36  )
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

On Thu 28 Nov 2024 at 15:51, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Thu, Nov 28, 2024, at 15:39, Jerome Brunet wrote:
>> On Thu 28 Nov 2024 at 15:11, "Arnd Bergmann" <arnd@arndb.de> wrote:
>>
>>>> All clk, pinctrl or regulator are used by other driver yes, this one as
>>>> well, sure.
>>>>
>>>> What special about this on is that it is an auxiliary bus driver.
>>>> It is directly instantiated by another driver. That's where
>>>> it differs. The axg-audio clock driver instantiate the auxiliary reset,
>>>> it does not use it, which is why it makes sense for it to select the
>>>> driver.
>>>
>>> Can you explain the logic behind this design? It seems that the
>>> entire problem here is the split into more drivers than it
>>> should be. It's common for clk drivers to also act as a
>>> reset driver, and my impression here is that you were trying
>>> too hard to split out the reset functionality into file
>>> in drivers/reset/ rather than to have it in drivers/clk/.
>>>
>>> Could you perhaps move the contents of
>>> drivers/reset/amlogic/reset-meson-aux.c into
>>> drivers/clk/meson/axg-audio.c, and change the exported
>>> symbol to a static function? This would still require
>>> a dependency on the exported meson_reset_toggle_ops,
>>> but that feels like a more natural interface here,
>>> since it's just a library module.
>>
>> That's what we originally had. Reset implemented in clock.
>> I was specically asked to move the reset part in reset using
>> aux drivers.
>>
>> https://lore.kernel.org/r/e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org
>>
>> Eventually that will happen for the rest of the reset implemented
>> under drivers/clk/meson.
>>
>> It allows to make some code common between the platform reset
>> drivers and the aux ones. It also ease maintainance for both
>> Stephen and Philipp.
>
> I don't understand how this helps: the entire point of using
> an auxiliary device is to separate the lifetime rules of
> the different bits, but by doing the creation of the device
> in the same file as the implementation, you are not taking
> advantage of that at all, but instead get the complexity of
> a link-time dependency in addition to a lot of extra code
> for dealing with the additional device.

My initial rework had the creation in clock (note: that is why I
initially used 'imply', and forgot to update when the creation moved to
reset).

I was asked to move the creation in reset:
https://lore.kernel.org/r/217a785212d7c1a5b504c6040b3636e6.sboyd@kernel.org

We are deviating a bit from the initial regression reported by Mark.
Is Ok with you to proceed with that fix and then continue this discussion
?

>
>      Arnd

-- 
Jerome

