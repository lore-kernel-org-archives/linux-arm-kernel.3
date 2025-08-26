Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBE8CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 09:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSGgiA7okXMSZ3FGPGzhv/sQluxvM/Gr3n+FFVx6Zrk=; b=HGzgcpsWm7yJ0jGBYcZ6hjynot
	6qYSg8fzoUK8nhdj2zTF+jm4ASycdR9oAH4KWDt+5cieIKwmmWgcFRBdvFecavaVeWB4M/0h8U7D2
	dsvvHcZMHGm6CzDQ6O+GYua4GoGKRYM6yu2pnxMyGvj9eS+sHF9Qdn2GPw15+0dTGDwpx1mg+wVjG
	kEQpmXxamrXHE4A5GWcxb+poCmdp0uKOjezQy9Ijv3GERF7TOEs4EXYc0YON9Dyw73zn1WBKpZq+U
	+kf/CpyYWmyr8cl/sYEUFkqDgzjugXkIltdz1vXe4lXobS9cuiX7MjnRKGH6VQkbpU3dlAmrrkqYS
	DDHbALaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqplN-0000000BI9z-24e7;
	Tue, 26 Aug 2025 09:14:45 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpiJ-0000000BG7O-2kxA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:11:38 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso2230990f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756199494; x=1756804294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSGgiA7okXMSZ3FGPGzhv/sQluxvM/Gr3n+FFVx6Zrk=;
        b=i8cXVTlhjmuuPbtEt1rFZnskfFOhx/k+O61n2HbBf0Q/nlwvv+Sp2SZQG5BBPd9o4G
         qm/ax2YahVqDzwC6152oB987nEFPjFtKflPfL7ta88F5TlCMhZPeQHk1ed9sjVl92Oyv
         5fTv/wGooJjfunjHZeNW2y78nJdw87wM/D8gXMg037KzErAjRgT2F9ZXV3wpwGteho0C
         I2oaToMmtBkOZwtRdZyBe6g2MrVyIWXfN27v67U6swDlgk1YwHpfSnEiTBwugL6MiNcK
         5vYqYU0ukVSD/Df9tiidpRvK69TXvqFURTXgZaiDDiRlOTlaqK7PESMBmEUczZMGgL2w
         HSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756199494; x=1756804294;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kSGgiA7okXMSZ3FGPGzhv/sQluxvM/Gr3n+FFVx6Zrk=;
        b=VBUFwy9krcV5KAW1VFaRyoHs60w3NgzZhQdx7PLoG7csBUmB7tiOFkYIEiDSYXBv1k
         Rh8SXb7hLw+mVELtE/d6r6jNXDdAU/UXqR4ZWE3mSV1BrfFJNkI2IaIo/9+mNEeszbAJ
         VU9ItGh1r7mna8sT/GICS+Um6RZHWHpt9wnTmyeJ+CGynMn/KSctwgKEj+yJmlA596OE
         h7bKYC7KaTYAUYf1vg0MsV9uIKKwNQrP+fDU11SkfOWuaJrMT/C1XxKxlmiZz0URNO+b
         1C1cRFoymitpL5+bkV2gVll3IfG7ORRT+GDSDoytoP9PJArGdSmu5uGB/UhO5dAku/XB
         wGEg==
X-Forwarded-Encrypted: i=1; AJvYcCVfaJRDz5WwWPlaNrt52sz4+3ItLcxkQj4Cy4+DuwPNnWpUg3cgwvgkVlTSJK/Sf7bhBoyME9bHHGGJ8uBba+cq@lists.infradead.org
X-Gm-Message-State: AOJu0YzHqmk5PbVM1ix5M+I1VnD7r3JZ3KqyIY5qUAmNcCcvn1DwsIl6
	NjzLOADtymnP3i+vns/8c835ic9kpJo8by81S7uwWQjM0fEkMTNXIi8B1/Jhr3GSyaM=
X-Gm-Gg: ASbGncuX1lK1QWhA7b4hrTbvWYawcy0Ge9hVf+zUC/AltCKcysa74uGDXwatcxB8AR5
	4eSh+Twimye3zktCggmHXcSpdXTgiPyZLRwh8uPtufYOCi94ZeG+CKaQpYRu+dLlvhNZaXEM16b
	XV/2kb9kQQAt/aVaYKAEi89P5P6Dg4oGYQkq4Xs0iCnV2g/SP0uCXR49Y6sV43NACCm5F/hwVPy
	DDQvnar5oucx3BrqxCjOTn8xk8Js+ztQzZlPkWi7DWjbTlKXxXe+nUAdmDBRaGSB9Z4HYG8qaS5
	eOsP716c2GCJBm3qxrFyLYWb7IV1QYoGv3TkxzLbQMPCegyNaE3ro1PGQ53UodepZoLS6tME6hO
	N92ad+NYmtCiOp/50vqAv5zigyWZ2HCM=
X-Google-Smtp-Source: AGHT+IFtBWXrOWyVTOM6kOSvzOnSizJ26W7d5kPzjQBIk8HokgLiwvROTQt35HufZ0kQxPuRV/tMwg==
X-Received: by 2002:a05:6000:400f:b0:3c8:eead:3d2f with SMTP id ffacd0b85a97d-3c8eead4359mr5090468f8f.41.1756199493485;
        Tue, 26 Aug 2025 02:11:33 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:46d7:73a6:7b7:2201])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cad431ea49sm4204236f8f.42.2025.08.26.02.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:11:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Da Xue <da@libre.computer>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Jian Hu
 <jian.hu@amlogic.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: meson-g12a: fix bit range for fixed sys and
 hifi pll
In-Reply-To: <c0e8cf9a-b5c7-4369-8b6a-c4f80a6bc398@amlogic.com> (Chuan Liu's
	message of "Tue, 26 Aug 2025 15:59:32 +0800")
References: <20250822002203.1979235-1-da@libre.computer>
	<c0e8cf9a-b5c7-4369-8b6a-c4f80a6bc398@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 26 Aug 2025 11:11:32 +0200
Message-ID: <1jy0r64fcr.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_021135_816115_26CE1660 
X-CRM114-Status: GOOD (  26.89  )
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

On Tue 26 Aug 2025 at 15:59, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Da:
>
> =C2=A0 =C2=A0=C2=A0Thanks for your feedback.=C2=A0but this patch is wrong.
>
>
> On 8/22/2025 8:22 AM, Da Xue wrote:
>> [ EXTERNAL EMAIL ]
>>
>> The bit range 17:0 does not match the datasheet for A311D / S905D3.
>> Change the bit range to 18:0 for FIX and HIFI PLLs to match datasheet.
>
>
> The upper 2 bits (bit18, bit17) of the frac were deprecated long ago.

deprecated ? that is really confusing

That seems to imply that it does have an effect but you are choosing not
to use it. Please clarify.

> The actual effective bit field for frac is bit[16:0]. However, the
> corresponding datasheet has not been updated. I will provide feedback
> and update the datasheet accordingly.
>

What about bit 17 and 18 then ? does it have any effect at all ?

>
>>
>> The frac field is missing for sys pll so add that as well.
>
>
> PLLs with frac support are used in scenarios requiring a wide range
> of output frequencies (e.g., audio/video applications).
>
> Since sys_pll is dedicated to clocking the CPU and does not require
> such frequency versatility, it does not support fractional frequency
> multiplication.

You are mixing "HW support" and "usage choice" here.

What I read is :
* Da says the SYS PLL does have HW support for the frac parameter
* Amlogic does not see the point of using it since the CPU does not
  require fine tuning of the rate.

Is that correct ? or is the HW just no present ?

>
>
>>
>> Patched:
>>
>> + sudo cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq \
>> /sys/devices/system/cpu/cpufreq/policy2/cpuinfo_cur_freq
>> 996999
>> 500000
>> + sudo cat /sys/kernel/debug/meson-clk-msr/measure_summary
>> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>>   hifi_pll                      0    +/-1562Hz
>>   sys_pll_div16                 0    +/-1562Hz
>>   sys_pll_cpub_div16            0    +/-1562Hz
>> + sudo cat /sys/kernel/debug/clk/clk_summary
>> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>>      hifi_pll_dco                     0       0        0        0
>>         hifi_pll                      0       0        0        0
>>      sys_pll_dco                      1       1        0        39999999=
85
>>         sys_pll                       0       0        0        499999999
>>            sys_pll_div16_en           0       0        0        499999999
>>               sys_pll_div16           0       0        0        31249999
>>      fixed_pll_dco                    1       1        1        39879999=
85
>>         fixed_pll                     3       3        1        19939999=
93
>>
>> Unpatch:
>>
>> + sudo cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq \
>> /sys/devices/system/cpu/cpufreq/policy2/cpuinfo_cur_freq
>> 1000000
>> 500000
>> + sudo cat /sys/kernel/debug/meson-clk-msr/measure_summary
>> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>>   hifi_pll                      0    +/-1562Hz
>>   sys_pll_div16                 0    +/-1562Hz
>>   sys_pll_cpub_div16            0    +/-1562Hz
>> + sudo cat /sys/kernel/debug/clk/clk_summary
>> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>>      hifi_pll_dco                     0       0        0        0
>>         hifi_pll                      0       0        0        0
>>      sys_pll_dco                      1       1        0        48000000=
00
>>         sys_pll                       0       0        0        12000000=
00
>>            sys_pll_div16_en           0       0        0        12000000=
00
>>               sys_pll_div16           0       0        0        75000000
>>      fixed_pll_dco                    1       1        1        39999999=
39
>>         fixed_pll                     3       3        1        19999999=
70
>>
>> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
>> Signed-off-by: Da Xue <da@libre.computer>
>> ---
>>   drivers/clk/meson/g12a.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>> index 66f0e817e416..f78cca619ca5 100644
>> --- a/drivers/clk/meson/g12a.c
>> +++ b/drivers/clk/meson/g12a.c
>> @@ -157,7 +157,7 @@ static struct clk_regmap g12a_fixed_pll_dco =3D {
>>                  .frac =3D {
>>                          .reg_off =3D HHI_FIX_PLL_CNTL1,
>>                          .shift   =3D 0,
>> -                       .width   =3D 17,
>> +                       .width   =3D 19,
>>                  },
>>                  .l =3D {
>>                          .reg_off =3D HHI_FIX_PLL_CNTL0,
>> @@ -223,6 +223,11 @@ static struct clk_regmap g12a_sys_pll_dco =3D {
>>                          .shift   =3D 10,
>>                          .width   =3D 5,
>>                  },
>> +               .frac =3D {
>> +                       .reg_off =3D HHI_SYS_PLL_CNTL1,
>> +                       .shift   =3D 0,
>> +                       .width   =3D 19,
>> +               },
>>                  .l =3D {
>>                          .reg_off =3D HHI_SYS_PLL_CNTL0,
>>                          .shift   =3D 31,
>> @@ -1901,7 +1906,7 @@ static struct clk_regmap g12a_hifi_pll_dco =3D {
>>                  .frac =3D {
>>                          .reg_off =3D HHI_HIFI_PLL_CNTL1,
>>                          .shift   =3D 0,
>> -                       .width   =3D 17,
>> +                       .width   =3D 19,
>>                  },
>>                  .l =3D {
>>                          .reg_off =3D HHI_HIFI_PLL_CNTL0,
>> --
>> 2.47.2
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic

--=20
Jerome

