Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C62ECCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 12:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufOkjl+qPiRtshghurKtqky4g5561TsZhHIpMFstA/A=; b=ymi2RwqN+NzMeGtxTr2omsnRki
	w7R1Pn4+4xwBKx771iSxjh7Y43lIq1TW00NLoJbYP5t+RpkwrtA8PTDd2fDp/y7CkhTWW5J7kRtS3
	BOq4LHkweV6jstK01Ew5wRPyMsYEFN26gY5RhYS95DYvRB9rZSgiKTaRAbytyv3QxKUUbwhcSO+co
	CE1K2cfAy6Z429csfAjoHEm2ORW3fzCnIt5KlnAe/RT4WsPPCths1CJyR5FZ0bsLEKAVb6no2S0Kx
	du8Mfd9qWK9d+b6lvam4d8FMjPSLH1TES/ZcOFbZ1B6uve3aL0QCTx1CM3MPUXrazfuugxF5H3I/z
	U7+Kq8hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA5pm-00000009tmY-2CYe;
	Sat, 18 Oct 2025 12:14:54 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA5pj-00000009tln-39tO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 12:14:53 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso508957866b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Oct 2025 05:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760789689; x=1761394489; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ufOkjl+qPiRtshghurKtqky4g5561TsZhHIpMFstA/A=;
        b=MjGjdlCLIhZLFBwdwaWi1RHJFYXEVittTHEZFjgyrhJ5qA1FMabcKb5m5c+lYOadA7
         Ex07zatuPurxEYzeRU7jh70E08T8exQHV8brEheYJn92jfKgykqh19BuWLv+Z9yMSXNq
         1oXVMVDVVFES2r2curBXqKvJnwmXxZXImxMXdrgz6wO3vSrgk4FzNYXfgRuTqgKK+l0P
         akKj3iQFZnIIsVg1AAAOyxXQRz6B9jXBwqSxhXi7JHOUnzG7NePzrO9rAvbopLDFs2nf
         q3Ll/RpwK6IiuTJnTV81rVbenvRZNxI715L9bVci5LvKZD6yuUetrnF9SUX8BXIBhABv
         VRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760789689; x=1761394489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ufOkjl+qPiRtshghurKtqky4g5561TsZhHIpMFstA/A=;
        b=M0TVU346VxNkjn+YjqBd1xwk75k6ttAO04vsSJLOPeXyOd3MEZ/kUeiydW5JC/at7j
         x/pLhcHl27jQ70htdyIts/bJgTuD5BTaAid9aNGivqbATNP9PhX8BZzIDECxkcs2s+Ox
         rFFzM6tMpM9IyQHBgkukvDrp0gdDBeshrYAekuh23sjdZ7xliojycV1oH+gz4NTEzj8s
         SYjMo3ENm0jAq8HhHhtxYn8h7XM6x6YlAbKUZJexaiGKjidwQ21jzDIvwVPZyoAJPuEi
         U5oNczF1ufcYxWkSKT49MKk/D1E1OlyJ4QtkurYGNHub4275xM9uNOFnzLPqd5wWAJkH
         KIWA==
X-Forwarded-Encrypted: i=1; AJvYcCXIYcG5Kt33oOcweQaXf3IJtv2Z5tw6H50hpddHBsf8xk2uWXsbIMJxNgseSoKU8YMUdNoD6CKU0GiX74Sveoig@lists.infradead.org
X-Gm-Message-State: AOJu0YxPsvwwvQkUgSPn1gxOEbN5/9SZt6M+hDe31LSWWZTlYnvcskvB
	WyU7Bz3diWKykWKPAItHhFz4j/S7F2zmTVaHDbNp82nMq4bVsmOyGQ+Q
X-Gm-Gg: ASbGncv/hkxcsCsqwMhk+I2Kz98Jy1F86k7n1Opwu1PxLBkRmH9BHfX3MYT/25rNBmw
	zfj5jfVpq/9iYV6HV//s4H/DfLxVLahnNYJ7nzMmQt2/xy5OEVe97D/YWYUlsvKFMDQQu65s2xp
	9wNikngD3CVZarHnOuxjBCZOfv9m26UOo8wC4JvjKQbBS/cTKwmsdWUWM8EI6siMaDETk13insJ
	wbeOqlvLpBBl5YovU70c5KfadK7gOyAfJjKz4hrwW+HMocllmtGdtdsWSTv2rmSUbEdrNvCt8lx
	P1/+mD+7PbnQ9sIzq59sKN3485xDJ8bw1GBq+pgs+fdvC0r7e5ue2l1hKVTG9laUc/B3TQS3C2l
	Eltg0+eYTGxvv9muT6lFEyuKB51NmQoKDIX9Y9iLOBgBqylTLkgykqgdi+UoulOMO4kThqfNrOr
	DOq+TG7+m23cNidflLvZzxqJW80rGu+O3Eg2FDrGAf3wA5VJI/hS1eI8Trh1IpZtDZGZSHNGM7i
	+kwqGoqdVLh
X-Google-Smtp-Source: AGHT+IGBPsSaJcR0ev47Hb3xPBn0QIJdrD4FfY6KddrSOXRmNh4o7RZCBMe0k/WnE7eQQbehnrN6qA==
X-Received: by 2002:a17:907:2685:b0:b45:60ad:daf9 with SMTP id a640c23a62f3a-b647254f6bdmr770989466b.3.1760789689192;
        Sat, 18 Oct 2025 05:14:49 -0700 (PDT)
Received: from ?IPV6:2a02:8010:6606:0:8c72:1dd5:7473:88ff? ([2a02:8010:6606:0:8c72:1dd5:7473:88ff])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebc42963sm223334266b.77.2025.10.18.05.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Oct 2025 05:14:48 -0700 (PDT)
Message-ID: <b22425c3-01e0-4d2e-bf78-5db884d4ec38@gmail.com>
Date: Sat, 18 Oct 2025 13:14:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: fix eMMC corruption on NanoPC-T6
 with A3A444 chips
To: Dragan Simic <dsimic@manjaro.org>, Jimmy Hon <honyuenkwun@gmail.com>
Cc: Tianling Shen <cnsztl@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Grzegorz Sterniczuk <grzegorz@sternicz.uk>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251017073954.130710-1-cnsztl@gmail.com>
 <7f0b1747-87eb-0b0b-6fb0-304811a4be21@manjaro.org>
 <d9d14ce2-2e65-422e-95fb-eb30b128ad90@gmail.com>
 <41154cde-a447-0707-4387-cd3dca90b97d@manjaro.org>
 <CALWfF7K0=J3E-zr41wV-28+SCFkT_so55Aee8BvQsB4KJZy6YQ@mail.gmail.com>
 <47931e9e-09db-3909-4531-dae6869171d7@manjaro.org>
Content-Language: en-GB
From: Hugh Cole-Baker <sigmaris@gmail.com>
In-Reply-To: <47931e9e-09db-3909-4531-dae6869171d7@manjaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_051451_828943_90CBD1D7 
X-CRM114-Status: GOOD (  37.36  )
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

Hi Dragan,

On 18/10/2025 09:30, Dragan Simic wrote:
> Hello Jimmy,
> 
> On Saturday, October 18, 2025 02:42 CEST, Jimmy Hon <honyuenkwun@gmail.com> wrote:
>> On Fri, Oct 17, 2025 at 10:15 AM Dragan Simic <dsimic@manjaro.org> wrote:
>>> On Friday, October 17, 2025 14:08 CEST, Tianling Shen <cnsztl@gmail.com> wrote:
>>>> On 2025/10/17 18:25, Dragan Simic wrote:
>>>>> On Friday, October 17, 2025 09:39 CEST, Tianling Shen <cnsztl@gmail.com> wrote:
>>>>>> From: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
>>>>>>
>>>>>> Some NanoPC-T6 boards with A3A444 eMMC chips experience I/O errors and
>>>>>> corruption when using HS400 mode. Downgrade to HS200 mode to ensure
>>>>>> stable operation.
>>>>>
>>>>> Could you, please, provide more details about the troublesome eMMC
>>>>> chip that gets identified as A3A444, i.e. what's the actual brand
>>>>> and model?  Maybe you could send a picture of it?  It might also
>>>>> help if you'd send the contents of "/sys/class/block/mmcblkX/device
>>>>> /manfid" from your board (where "X" should equal two).
>>>>
>>>> Unfortunately I don't have this board nor this eMMC chip.
>>>> I got the chip model from my friend, it's FORESEE FEMDNN256G-A3A44,
>>>> manfid is 0x0000d6.
>>>
>>> Thanks for responding and providing the details so quickly!
>>>
>>>>> I'm asking for that because I'd like to research it a bit further,
>>>>> if possible, because some other eMMC chips that are also found on
>>>>> the NanoPc-T6 seem to work fine in HS400 mode. [1]  It may be that
>>>>> the A3A444 chip has some issues with the HS400 mode on its own,
>>>>> i.e. the observed issues may not be caused by the board.
>>>>
>>>> Yes, it should be caused by this eMMC chip.
>>>
>>> I'd suggest that we move forward by "quirking off" the HS400 mode
>>> for the FEMDNN256G-A3A44 eMMC chip in the MMC drivers, instead of
>>> downgrading the speed of the sdhci interface on the NanoPC-T6.
>>>
>>> That way, the other similar Foresee eMMC chip that's also found
>>> on NanoPC-T6 boards, FEMDNN256G-A3A564, will continue to work in
>>> the faster HS400 mode, while the troublesome A3A44 variant will
>>> be downgraded to the HS200 globally for everyone's benefit.  It's
>>> quite unlikely that the A3A44 variant fails to work reliable in
>>> HS400 mode on the NanoPC-T6 only, so quirking it off in the MMC
>>> drivers should be a sane and safe choice.
>>>
>>> If you agree with dropping this patch, I'll be more than happy
>>> to implement this HS200 quirk in the MMC drivers.
>>>
>>> As a note, FEMDNN256G-A3A44 is found in the Rockchip Qualified
>>> eMMC Support List v1.84, [2] but the evidence says the opposite,
>>> so we should react appropriately by adding this quirk.
>>
>> When adding the quirk for the A3A44, can we lower the max frequency
>> and keep the HS400 mode instead?
>> That's what the Fedora folks found works [3]. There's more test
>> results in Armbian [4]
> 
> Are there any I/O performance tests that would prove that lowering
> the HS400 frequency to 150 MHz ends up working significantly faster
> than dropping the eMMC chip to HS200 mode?
> 
> I'm asking that because lowering the frequency looks much more like
> there's some issue with the board, rather than the issue being the
> eMMC chip's support for HS400 mode.  Thus, a quirk that would lower
> the HS400 mode frequency would likely be frowned upon and rejected,
> while a quirk that puts the chip into HS200 mode is much cleaner
> and has much higher chances to be accepted.

I also have the NanoPC-T6 with one of the A3A444 eMMCs which suffers
from I/O errors in the default HS400 mode. These are its details in
/sys/block/mmcblk0/device/:
manfid: 0x0000d6
oemid: 0x0103
name: A3A444
fwrev: 0x1100000000000000
hwrev: 0x0
rev: 0x8

I wasn't sure if I was just unlucky to get a faulty chip, but seeing
this thread it seems like a wider issue. On my board, limiting it to
HS200 mode gets rid of the I/O errors, and it seems that lowering
the frequency to 150MHz also avoids I/O errors.

I did a quick unscientific test with fio; HS400 Enhanced Strobe mode
with a 150MHz clock gives slightly better performance than HS200:

HS200 mode:
read: IOPS=697, BW=43.6MiB/s
write: IOPS=697, BW=43.6MiB/s

HS400 mode with 150MHz clock:
read: IOPS=805, BW=50.3MiB/s
write: IOPS=799, BW=50.0MiB/s

so from my perspective, limiting the frequency would be a better fix
than disabling HS400 entirely.

It could also be of interest that the clock used apparently can't
provide an exact 200MHz, e.g. in HS200 mode:

root@t6:~# cat /sys/kernel/debug/mmc0/ios
clock:		200000000 Hz
actual clock:	187500000 Hz
vdd:		18 (3.0 ~ 3.1 V)
bus mode:	2 (push-pull)
chip select:	0 (don't care)
power mode:	2 (on)
bus width:	3 (8 bits)
timing spec:	9 (mmc HS200)
signal voltage:	1 (1.80 V)
driver type:	0 (driver type B)

> With all that in mind, if the resulting I/O performance difference
> between 150 MHz HS400 and HS200 is within 15-20% or so, I'd highly
> recommend that we still go with the HS200 quirk.  It also leaves
> us with a nice safety margin, which is always good to have when
> such hardware instability issues are worked around in software,
> unless detailed eye diagrams, protocol dumps and whatnot can be
> pulled and analyzed, in which case the resulting safety margin
> can be much slimmer.
> 
> Ideally, we'd have a completely different board with the same
> Foresee FEMDNN256G-A3A44 eMMC chip to test how reliably its HS400
> mode works there, to see is it really up to this eMMC chip or up
> to the board design, but I'm afraid we don't have that (easily)
> available, so the only remaining option is to work with what's
> actually available, which inevitably leads to a certain amount
> of guesswork and some compromises.
> 
>>> [1] https://github.com/openwrt/openwrt/issues/18844
>>> [2] https://dl.radxa.com/rock5/hw/RKeMMCSupportList%20Ver1.84_20240815.pdf
>> [3] https://lists.fedoraproject.org/archives/list/kernel@lists.fedoraproject.org/thread/MCSDYDQVOXS5AZMKA7LLY4QX7JXBWPCA/
>> [4] https://github.com/armbian/build/pull/8736#issuecomment-3387760536

