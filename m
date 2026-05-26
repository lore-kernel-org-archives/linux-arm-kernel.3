Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9659CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 12:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cGdeRIyed7u9Vu7ldN0+lFeh1o2iiXjimB366st4kA=; b=CS5dB/ZZfiotwgmcb5e0R942k1
	TyLbd4nL4Fvd0UOc3dVreGoRc3gKdZfWCxo7M6ORLEtOAHpLG1N3jYbFpJ3X+p4Zx9KqMSlzuNkml
	qIv6ugY0g7Js08/4FpAlTIHcxvHJa6hShtAM7PHsQT7jrJRZ6AsPL6c39lnPX/da0U3VoVVinYi3Q
	a8lq3WexQHqVVh+KSrgI6dSa3djcAU41FxLWJ7r0NqhMxAUMaVSjmWu3wyaCnhNlJHL0JAakBz0M8
	E8UfDWCfWJWAtsTnleJ9YfiN8Crf+Pw9aWVwpDpSVS5Of+NGdwZODF3Z+se8VyX/v8M2Kr5m/FUXa
	WNvWdpNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRqsR-00000001uas-0jVW;
	Tue, 26 May 2026 12:27:19 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRqsO-00000001uZv-1to2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 12:27:18 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4526a8170ceso5323126f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 05:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779798434; x=1780403234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cGdeRIyed7u9Vu7ldN0+lFeh1o2iiXjimB366st4kA=;
        b=CcmIL+rUSisdJp/fHe2a46OGusZk4YIdcvdXe1LFGHj740VZshQRCAPd+tIuXG9cjD
         w8pGaLTJH/NU4zXuuAOKTgrmRRUG9V1sPM8m5bC4a3+3EU0zV/NaOfm54mLcm2XoeGzq
         UzkjU+M57rL4pEC16w9labH4ZMXXfRMn5jccwh3bu3gZxty6dCOwW47XRpvcc4zX9OF2
         dWfXFHm584ntZDEKDLZAAohMWlLZjjSLhDyrWVZHnXomf034GWoBkm2BrI+7QCUOiDe/
         VOGbWpQ79NidRounmFFjD+2i754u3j7iPnhAQUM34hp4DiVjUGxEXnvRlj1U3zi6rLeB
         GSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798434; x=1780403234;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3cGdeRIyed7u9Vu7ldN0+lFeh1o2iiXjimB366st4kA=;
        b=rJuTlKeQr8Rjk4qUbnvMD5VygNjcQV5nYpJVLuaYB4D1Sk82j+I/wN5zhALgiLvYNs
         Y2lXU48Tszn2EGVkRh2HU7zCOu/MZ3US+U4C/N55z0iOY/aBXtcITgH8C43kvbGESGnJ
         GdGCj5ANBBPARNvaT5JTgWhkmSk1WktylXv6V61yUFM5OKf/cUGpBy3iBxeiDQJpp0N/
         JVxbrgWDJf4Ca+HuyKA3aXT04ut3rfPSCYd0kqK+RNe1l9xLAjYKAbRlS9QIByWFPtQd
         r3mAWEMRYWSK96AYkWpIBCPUki/sn6v0q7yQJQKWdJiMA3ECtyzjnXLTO+bKltTI1G0Y
         jIyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/aVo4EDcx4GRvI8OT/iDfey+a67QCnuapXFls/as7lWIlebTM5cBcXjVonJt3La7kNiymIeVUSVmIXQUe71fKf@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxy4HjvRI7bdE6lWtUetsU6osb0kSAyg4IAcCJtTmfk7bwGvQE
	s+0YqidOwAKIQ4Vw7TBQZ0rJ4qA/NkT8foEwkXU+UY9GZ94sOJCrQX9v0fan8Nrl8qc=
X-Gm-Gg: Acq92OE56yq9EPCYyBC3lEzWWB5PvG13nEfaIsEVHakEwI0GwFdGlAKq89CoqHrlg9E
	eUNCryYXmsEBgsG4ttTixQwgfuIOTtRG8f6VBr6Ly2UDDw6Kf70I03VFTun5AtKHIzNTMI1iJIE
	8LZlGxq+0MqRN2Ca3Y4LRW83xcEl0dEwiJYfElCqmlzcusGFwqe7PSTEVgQaKMb7CGo2zqaRZrz
	MYeq+IASEzlb6kmDCCjyeSb//MA1tdOgmKhBPnOLuPCxGmNXGciNzhnmAX12SixE851jbGAkgKA
	hbSSKWYX4F7ctAXe98n1SEdySsrJ/c6pRDVb62Dm6kvEaplJ/i7Q1lCBKnZWYnyYqxco4rfzey7
	l/A6lVk2XX7YFW5t7A3OaZxtvlP3++CRnXx9DHjiEgukp8QTt3x18M0RAs4qY2S+R9E5snfBaVs
	S0Op1easG2gJbbPitBV9wgjr40krnTECN3
X-Received: by 2002:a05:6000:2408:b0:45e:941e:77b3 with SMTP id ffacd0b85a97d-45eb38c9299mr32625100f8f.41.1779798434376;
        Tue, 26 May 2026 05:27:14 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:4a0c:b15a:3467:f4ed])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45eb6d5cb9asm38009953f8f.27.2026.05.26.05.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:27:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
In-Reply-To: <3fda1592-f7d0-4e86-8615-602804673414@amlogic.com> (Jian Hu's
	message of "Tue, 26 May 2026 17:58:19 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
	<20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
	<1jy0hm6n7e.fsf@starbuckisacylon.baylibre.com>
	<8d89b669-e72e-4663-9596-999a12922d32@amlogic.com>
	<1jqzn65y9l.fsf@starbuckisacylon.baylibre.com>
	<3fda1592-f7d0-4e86-8615-602804673414@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 26 May 2026 14:27:12 +0200
Message-ID: <1ja4tm5pb3.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_052716_540010_13A3EC97 
X-CRM114-Status: GOOD (  28.95  )
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

On mar. 26 mai 2026 at 17:58, Jian Hu <jian.hu@amlogic.com> wrote:

> On 5/20/2026 3:35 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On mer. 20 mai 2026 at 13:47, Jian Hu <jian.hu@amlogic.com> wrote:
>>
>>> On 5/14/2026 11:11 PM, Jerome Brunet wrote:
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.am=
logic.com@kernel.org> wrote:
>>>>
>>>>> From: Jian Hu <jian.hu@amlogic.com>
>>>>>
>>>>> The A9 PLL pre-divider uses a division factor of 2^n to ensure a clock
>>>>> duty cycle of 50% after predivision.
>>>>>
>>>>> Add flag 'CLK_MESON_PLL_N_POWER_OF_TWO' to indicate that the PLL
>>>>> pre-divider division factor is 2^n.
>>>> I understand what you are doing here but I have to ask why this can't =
be
>>>> implemented with independent dividers that already supports power of 2=
 ?
>>>
>>> If we use independent dividers, the n member would have to be removed f=
rom
>>> meson_clk_pll_data.
>>>
>>> However, n is referenced 35 times in clk-pll.c, which means we would ne=
ed
>>> to modify all
>>> related logic across the file. This would be a relatively large
>>> change.
>> Yes
>>
>>>
>>> Moreover, for all Amlogic chips, the n divider is an indispensable part=
 of
>>> the DCO clock.
>> There is hardly a justification here
>>
>>> The difference between SoC generations is as follows:
>>>      Previous SoCs PLL: n =3D 1, 2, 3, 4... (linear divider)
>>>      A9 SoC PLL:            n =3D 2^0, 2^1, 2^2, 2^3, 2^4... (power-of-=
two
>>> divider)
>> Yes that was fairly obvious
>>
>>> Therefore, splitting out the n divider from the DCO clock might not be a
>>> good design choice.
>> I'm not sure I agree and you've only stated your point of view without
>> providing any technical justification here.
>>
>>  From the datasheets of the different SoC we have, the documented
>> limitation is always the DCO output rate range. Nothing related to n (or
>> m, or the mult-range for that matter). This is a legacy problem, we
>> started with monolithic driver and slowly simplified it.
>>
>> As far as I can see now, reworking the PLL driver to be a simple
>> multiplier driver with range output rate constraint could actually be
>> simpler than the current code. I would also make simpler to accomodate
>> differences such as the one presented here.
>>
>> Unless you can provide technical reasons why going in this direction
>> would be incorrect, that's where I'd prefer to go.
>>
>>> [...]
>>>
>>> Best regards,
>>>
>>> Jian
>> --
>> Jerome
>
>
> I agree that having an independent N divider would simplify the PLL rate
> calculation.
>
> A separate pre-divider for N is technically possible, but there are some
> hardware constraints that need to be considered:
>
> N =3D 1 is the preferred operating mode except a few fixed-frequency PLLs.
> Larger N values reduce the PLL phase detector frequency, which may
> negatively impact
> jitter performance and overall PLL stability.

Understood. You could really make a difference by going deeper and
explaining what those constraints are, especially since you ask question
internally at Amlogic.

At the moment what is documented is a range regarding the output rate of
the PLLs. A PLL is made of a pre-divider and fractional multiplier.
and you are saying that for the multiplier to work and lock, there is
actually a constraint the input rate too.

If you can discuss with your HW team and clarify what the constraints
really are, that would help to better model the PLL. In then more likely
for us to figure out the best way to drive it.


>
> Because of this, we cannot guarantee stable system operation when arbitra=
ry
> larger
> N values are used.
>
> Some PLLs require non-1 N values to generate specific fixed output
> frequencies because
> the target rate cannot be achieved with N =3D 1 while keeping the PLL whi=
le
> keeping the
> PLL within its valid operating range. So N is designed to have other valu=
es
> =E2=80=8B=E2=80=8Bto
> satisfy this requirement.

Again it seems like the constraints we are using are not the real
limitation, just by-products, which the situation unclear.

>
> For example, the AXG PCIe PLL uses N =3D 3 to generate the required 100 M=
Hz
> output frequency,
> since the target frequency cannot be achieved with N =3D 1.
>

PCIe is a topic in itself. It uses different ops for historic reasons though
I suspect, with proper constraints, it would not really need to.

>
> Additionally, is the refactored pre-divider N implemented as a separate
> patchset,
> independent from the A9 PLL changes?

I could be seen as a pre-requisite.

>
>
> Best regards,
>
>
> Jian

--=20
Jerome

