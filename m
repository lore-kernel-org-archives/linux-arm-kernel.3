Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A571CCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 07:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ohsf7Kwxw4dURrBVAg9+548r3Hkt++rO/LjKiVp3o1A=; b=XFnZQeN20gEkj9OKG4A4QxvV9e
	N+fn1HODKAEN4WMqDQgtG1lmElqCPWcPBiJfV+eEIMSbfxRm6HEhDQZxAMTWpPqfFp9qXoG0nmDPc
	msZRUFHub5e7qy3FStrEd9nZzbPISPuYs1siuk2n+C0+UAwofXqO6/DOYy6Dk7X1NuTq+sKQ81grw
	KwcSwpEhbXLT/QENcgSETGeAGQfR1VsRIM91aW4NmMtDcHvjPBYKFxU0usXLvZrP8TQk7FtdjXYVc
	ay8Oa1mG3UDi5aLIoVRrDTBv/yunXMt1ny59PMe/lx8/Zf2hzKGIQ7XYnQHBN0cwIwX+IM44Gkdjp
	IXUf0ISw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbHx-00000003msW-0ndM;
	Wed, 20 May 2026 07:24:21 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbHt-00000003mrj-2Hju
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 07:24:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso43608445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 00:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779261855; x=1779866655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ohsf7Kwxw4dURrBVAg9+548r3Hkt++rO/LjKiVp3o1A=;
        b=aNf1OeXNpEnpmfHXbVV2yhqMNNHf33U0I2TYU4ovZw+UlfqP6VxdXYbschHJk1dDB6
         6N408cFbVK+0HVIQgpmbfUqoxGu3uJyqZ0XfxbwZzqn3KDpzbtJhlhQ/4H50V6B6aZte
         Nqr7b1P1+FpEud1PFZ6IUFWetjzFC5bg2p5akbh7eGDO1wfnlWEFlX7Ou6CXKUtC+myM
         lfgXZFjibGyOoBKQDmPgbkRVsdPXOyu7dD8p3bR4H79s6f+DLfwuPyHxflNu9Vuyt9mf
         8upvizBk90COU3iHwc3k9iZrBKs/8YG7Oarter/CcA0qhCk2M0niOJ8USxBkuwqXx8Xa
         t3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779261855; x=1779866655;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ohsf7Kwxw4dURrBVAg9+548r3Hkt++rO/LjKiVp3o1A=;
        b=kadSHiXOqfRrmNrsRkdXE5vnkQnAxi5syCssH48XMoTRw84Intx6JIYCrNg71OIpdf
         /ApUsg9hJlK0ld0hGqSd16dYV/iJyUwDD5dmfQDgJcuqHgkPteA9yCWzcv91W4rk3MVv
         +MOTAAsV9SexPGy0Z/5u0aTOvchQ6cDpE66xNj2ZbHd8JTruIGMI+1oufn949REUoaWJ
         +X/tX/Pysaz0qiawU8jSsFQiLf/pO2hjQYmRjqV5eUmYX0/eqmXIuwPmBJ2bUUTVO/2L
         kQkMr5kmdcL+M5nA9IShph57Wp+3tIRZit9czopV1DRY48E7H0kmhTwba7M6XvqSmzW+
         RgBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Q7iN+OuQKe30u8AZNQ/2rU8cadv7/oCzIIFH6Nr00i/UPSoA1l77x0M2k5xY1I8uQ6rG8WNsAKVrgtMlBU9bM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5nJ3rVSAS10aAAE9RHreSKvCIwK5d1aQul7zMGtG1zim21C6O
	ri7JmLsXEXkAC40FfxO/ljBOVkyW9kS/HXjGocRzvE05ybBsa3azJ06TK7K1DvIq0rg=
X-Gm-Gg: Acq92OGviiSgBBrvMdkGKNXOnMsUp1KIqedVCPxRw+31qo5Dhi+ltG+apXJhig+J1d8
	tf32ulhjMIO33LXw6CzDTKe3AEChTQ7vl/MByhaqBKBPmnEy4E9rXm4K6mWS2JTC2G8eh2Et6tb
	o3wg4mgMuvxx+nuIeMHwK1XZlm+pcCv+FJ36SMs+r4lsJ2xkEyB2WpXFbWwTDzjika+SYi+MBAH
	YGcJnO2ULsNl/s9i0j2y1pe5S/mrtJ4528QW3By8LSYOKYJJrhkFUPy8RXZJvqkYr94iq6qQ5Uw
	gGmmPyxTnVcb54TqDY/to+vZqx8xMA8Bz7vP3XXVljPiOsQMHf05pD1wjRVG6PwtPhq0JKTKeg8
	TABByzYp+JYWrO/DExf9t04eGgZHbix7k4nRMmQnZljF17LdmGwX9Gizf1ZjUksWbip6zOW9hpL
	vM+IbbLVWDy6cK01TzotT6Tw==
X-Received: by 2002:a05:600c:c0d0:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48fe53774b4mr270166855e9.8.1779261855105;
        Wed, 20 May 2026 00:24:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:fa19:c0c9:991f:186d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49008c047absm86786415e9.0.2026.05.20.00.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:24:14 -0700 (PDT)
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
Subject: Re: [PATCH 05/10] clk: amlogic: PLL l_detect signal supports
 active-high configuration
In-Reply-To: <d023303e-e785-4b60-85cd-c83cc3f890e4@amlogic.com> (Jian Hu's
	message of "Wed, 20 May 2026 11:25:35 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
	<20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com>
	<1jse7u6n3q.fsf@starbuckisacylon.baylibre.com>
	<d023303e-e785-4b60-85cd-c83cc3f890e4@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 20 May 2026 09:24:12 +0200
Message-ID: <1jwlwy5ysj.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_002417_611008_34149EB1 
X-CRM114-Status: GOOD (  20.94  )
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

On mer. 20 mai 2026 at 11:25, Jian Hu <jian.hu@amlogic.com> wrote:

> On 5/14/2026 11:13 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlo=
gic.com@kernel.org> wrote:
>>
>>> From: Jian Hu <jian.hu@amlogic.com>
>>>
>>> l_detect controls the enable/disable of the PLL lock-detect module.
>>>
>>> For A9, the l_detect signal is active-high:
>>> 0 -> Disable lock-detect module;
>>> 1 -> Enable lock-detect module.
>>>
>>> Here, a flag CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH is added to handle cases
>>> like A9, where the signal is active-high.
>>>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> ---
>>>   drivers/clk/meson/clk-pll.c | 9 +++++++--
>>>   drivers/clk/meson/clk-pll.h | 2 ++
>>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>>> index 1ea6579a760f..5a0bd75f85a9 100644
>>> --- a/drivers/clk/meson/clk-pll.c
>>> +++ b/drivers/clk/meson/clk-pll.c
>>> @@ -388,8 +388,13 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>>>        }
>>>
>>>        if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
>>> -             meson_parm_write(clk->map, &pll->l_detect, 1);
>>> -             meson_parm_write(clk->map, &pll->l_detect, 0);
>>> +             if (pll->flags & CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH) {
>>> +                     meson_parm_write(clk->map, &pll->l_detect, 0);
>>> +                     meson_parm_write(clk->map, &pll->l_detect, 1);
>>> +             } else {
>>> +                     meson_parm_write(clk->map, &pll->l_detect, 1);
>>> +                     meson_parm_write(clk->map, &pll->l_detect, 0);
>>> +             }
>> I'm not a fan of this code duplication.
>> Use the introduced CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH to compute the
>> first value, then flip the bit.
>
>
> Ok, I will update this in the next version.
>
> Here is the updated code:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 meson_parm_write(clk->map, &pll->l_detect,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 !(pll->flags &
> CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH));
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 meson_parm_write(clk->map, &pll->l_detect,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 !!(pll->flags &
> CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH));

Please use a variable. Make it clean=20

> =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>
>>>        }
>>>
>>>        if (meson_clk_pll_wait_lock(hw))
>>> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
>>> index 949157fb7bf5..97b7c70376a3 100644
>>> --- a/drivers/clk/meson/clk-pll.h
>>> +++ b/drivers/clk/meson/clk-pll.h
>>> @@ -29,6 +29,8 @@ struct pll_mult_range {
>>>
>>>   #define CLK_MESON_PLL_ROUND_CLOSEST  BIT(0)
>>>   #define CLK_MESON_PLL_NOINIT_ENABLED BIT(1)
>>> +/* l_detect signal is active-high */
>>> +#define CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH   BIT(2)
>>>
>>>   struct meson_clk_pll_data {
>>>        struct parm en;
>> --
>> Jerome
>
> Best regards,
>
> Jian

--=20
Jerome

