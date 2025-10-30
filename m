Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF91CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 08:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZpYo4qCdvkOxQDRmJbeXBNTq2tyicbeHh7QBXTUQpc=; b=2GV7CXs2pmvxqnPY/WpGfFDQGN
	NxMVJHLeS9syG4Il4yctrbbJ8baYFyRkYVykb0hUh4MRywaO9RaMZduWESnMvwh4g7B7FxOsISKhR
	3q2ef7iNPk0JRaKZmwrNf4l+bjbIzl+2LpVwstAp1XOyc+9W8Zt1F2U6hScg52CkMiU8txhVoyREy
	BMdh+rNKndUGYfwbFLeuCd0yiS1aSY1SvsICArwdtbQH0+r+vNEyV1mPzwfQ/utBVEHKbLHbf7Sf8
	VPFx1W0aKmo0jewOhX+eFp5Z6jvb5JsjsU1MWhnY0+9LJrz06h4+3vrs0N5kkY7YflyL2+lIfZxJb
	9YlkQFfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOI0-00000003mQY-2qQl;
	Thu, 30 Oct 2025 08:45:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOHx-00000003mPm-0jql
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 08:45:46 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-475ca9237c2so4336665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 01:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761813943; x=1762418743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZpYo4qCdvkOxQDRmJbeXBNTq2tyicbeHh7QBXTUQpc=;
        b=hIeug/o/lkJSpw3cHS4TojYtNYmqiAWQGnhlZU2XwUz/GUJt3go9U8pg/0aA0pguAJ
         mqFcuruUAmzspuoctgksI8hGZnFkg9Dviz3IqayfJFV8VYV21FQfd3VG9K6xa+HBwJ5B
         JDU8V98VLDxZTD6JJp7odvhN74d3narQApDAmg8iCvheD0V9xwwyzV9KrBMwfOTMRP5o
         qZYzGcXBZh/1n+9v8zftQFpYRi7MSeyHC//6zQMnXzjebUUyEm2nhJ1coT/ObrWE8bfY
         SoUPKiHRuQaHG1iV5j+WRfQo6qdTmsPsx7s5aOrSmzKVJCVB0NMjvDL6GhAz3lO1//cn
         4RZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761813943; x=1762418743;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ZpYo4qCdvkOxQDRmJbeXBNTq2tyicbeHh7QBXTUQpc=;
        b=jXAnd7riCg6ywaI5zAi+GCigSxfIRdYQC/BpHd1eZOTwR8rEGRYjWvr02Iq90p1lbd
         8ppxsCJJrNKH3ZZZqIOj5kMT89ac+tRe7/ceQLyqsGWLyDM/6JplQPOM4JwgiPwSC0tY
         dcQOTzxJ+Yxo6EwBXV3rZPoTQbVGfCaC6O7cOvTtUmYIg+0qF6qmb0awjSJd0OKo0Sr2
         AdaaPXmuYJoL3wf9/MyX8/GGK2KXDbvvmbmRP/+fRJvtdhaASDv1jzs4Xf7ckxzfy66s
         BFDfD1ZZAyd1HIjvSSvRuKB3p8E4a0vNDvR7F/ckqj4c3Nn+SioCAuEia+NN3MZ4Y4kr
         F9rQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8nwpngpocFJKPV+/EkETrpet++UN8XsJGyvBjle6yAaTUMtWBEs/BvP39SOlv51MUD0rSHWZt9+LuUooN+0nq@lists.infradead.org
X-Gm-Message-State: AOJu0YweyGjIj1R57MoaIocgSMCkXaxCI3bCDln3ThzClkdu9zpYtXMe
	7USAWNZz3S8GUfRvBi32oIENgrYgvXN8TuGrlra8x6VnFmqaPXoRzlXKMIKN+tPRcGw=
X-Gm-Gg: ASbGnctXgvWDjY/fV0p5nm+ecxvWEvqKnuWKFGWPR0oRtE3vzY7rTkihQuYHwO8v/52
	OvSW5yXa5fGaQapX+jP18d5nz9ArFGBHcikditwXVkhiFwr+SdxMpAxrzbdKPe3gfP9WWUMFSJ6
	ggSPF+Ag67E14RAWP0iCuAA0412JbWemP+v++6zXqmvMI74lafK7nxdhFKNRd7EhhFT4Fnq968+
	q2r299apNuke8QMDheOOKIj5tk1Ov6wrL6AUMupDaWMagagrl14d3sCufBWgVKddMNGf9fHpRzO
	cp2lHaKNy6qSJoyMYoQgmLM+tS2fJ2HpUiJtW2iLKTKc8TSEAA7dr2ftzin05aQVcA32u0yiPN4
	HVCAYg6SBRm8sKZp0XFJLJNj85EKERxUFrQnkA9BAAsUud5PR2XJfKBpsFmDuywSxQeFh8lrLzQ
	==
X-Google-Smtp-Source: AGHT+IFRqKns2v7+EvpR5bRe/kFdtX/HOMybFPiYMJcDt+PidpgK4dhZ2EOX0xqyN5JCUyI4UtPn5g==
X-Received: by 2002:a05:600c:608b:b0:475:de12:d3b2 with SMTP id 5b1f17b1804b1-4771e1f1dc2mr56796015e9.36.1761813943196;
        Thu, 30 Oct 2025 01:45:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:64bd:9043:d05:7012])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4771902fa8dsm61122685e9.8.2025.10.30.01.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 01:45:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: amlogic: Optimize PLL enable timing
In-Reply-To: <61c2738d-7291-4a45-aa73-f18528c81ba8@amlogic.com> (Chuan Liu's
	message of "Wed, 22 Oct 2025 22:07:43 +0800")
References: <20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com>
	<20251022-optimize_pll_driver-v1-2-a275722fb6f4@amlogic.com>
	<1j347b403i.fsf@starbuckisacylon.baylibre.com>
	<61c2738d-7291-4a45-aa73-f18528c81ba8@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 30 Oct 2025 09:45:41 +0100
Message-ID: <1jsef0ydze.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_014545_277511_01679C38 
X-CRM114-Status: GOOD (  32.89  )
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

On Wed 22 Oct 2025 at 22:07, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Jerome,
>
>
> On 10/22/2025 8:01 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>> On Wed 22 Oct 2025 at 14:58, Chuan Liu via B4 Relay
>> <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>>=20
>>> From: Chuan Liu <chuan.liu@amlogic.com>
>>>
>>> Amlogic PLL locking procedure shall follow this timing sequence:
>>> 1 Assert reset signal: Ensures PLL circuits enter known initial state.
>>> 2 Deassert lock-detect signal: Avoid lock signal false triggering.
>>> 3 Assert enable signal: Powers up PLL supply.
>>> 4 udelay(20): Wait for Bandgap and LDO to power up and stabilize.
>>> 5 Enable self-adaptation current module (Optional).
>>> 6 Deassert reset signal: Releases PLL to begin normal operation.
>>> 7 udelay(20): Wait for PLL loop stabilization.
>>> 8 Assert lock-detect signal: lock detection circuit starts to work.
>>> 9 Monitor lock status signal: Wait for PLL lock completion.
>>> 10 If the PLL fails to lock, it should be disabled, This makes the
>>> logic more complete, and also helps save unnecessary power consumption
>>> when the PLL is malfunctioning.
>> Is this applicable to all supported SoC ? from meson8 to s4 ?
>
> Yes.
>
>> What did you test ?
>
> We have tested this on the G12A and later SoCs without any issues.
> Internally, we have adopted this configuration sequence in our branch
> and verified it on a large number of SoCs.
>
> We haven't maintained the meson series for a while, so it hasn't been
> included in our recent validation. I also don't have any meson boards
> on hand. If you have one available, it would be appreciated if you
> could help verify this, Thanks.

It's very interresting that you ask the community to test and validate
chips sold by your compagny, chip that are still sold *today* and readility
available on most market places.

I'd be happy to forward you a few links if that helps.

>
> This PLL sequence adjustment for meson SoCs adds a 20us delay after
> enabling the PLL and after releasing its reset. The delay addresses
> rare PLL lock failures observed under low temperatures. As a result,
> it slightly increases enable time but improves stability.
>
>>=20
>>>
>>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>>> ---
>>>   drivers/clk/meson/clk-pll.c | 68 ++++++++++++++++++++++++++----------=
---------
>>>   1 file changed, 40 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>>> index b07e1eb19d12..26c83db487e8 100644
>>> --- a/drivers/clk/meson/clk-pll.c
>>> +++ b/drivers/clk/meson/clk-pll.c
>>> @@ -353,6 +353,23 @@ static int meson_clk_pcie_pll_enable(struct clk_hw=
 *hw)
>>>        return -EIO;
>>>   }
>>>
>>> +static void meson_clk_pll_disable(struct clk_hw *hw)
>>> +{
>>> +     struct clk_regmap *clk =3D to_clk_regmap(hw);
>>> +     struct meson_clk_pll_data *pll =3D meson_clk_pll_data(clk);
>>> +
>>> +     /* Put the pll is in reset */
>>> +     if (MESON_PARM_APPLICABLE(&pll->rst))
>>> +             meson_parm_write(clk->map, &pll->rst, 1);
>>> +
>>> +     /* Disable the pll */
>>> +     meson_parm_write(clk->map, &pll->en, 0);
>>> +
>>> +     /* Disable PLL internal self-adaption current module */
>>> +     if (MESON_PARM_APPLICABLE(&pll->current_en))
>>> +             meson_parm_write(clk->map, &pll->current_en, 0);
>>> +}
>> I don't get why you moved that code around and make the diff even harder
>> to read
>
> Sorry about the misaligned formatting. I moved meson_clk_pll_disable()
> earlier in the code because I added handling for PLL lock failures,
> which unintentionally broke the alignment.
>
> I'll split the PLL lock failure handling into a separate patch in the
> next version to make review easier.
>
>>=20
>>> +
>>>   static int meson_clk_pll_enable(struct clk_hw *hw)
>>>   {
>>>        struct clk_regmap *clk =3D to_clk_regmap(hw);
>>> @@ -366,53 +383,48 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>>>        if (MESON_PARM_APPLICABLE(&pll->rst))
>>>                meson_parm_write(clk->map, &pll->rst, 1);
>>>
>>> +     /* Disable the PLL lock-detect module */
>>> +     if (MESON_PARM_APPLICABLE(&pll->l_detect))
>>> +             meson_parm_write(clk->map, &pll->l_detect, 1);
>>> +
>>>        /* Enable the pll */
>>>        meson_parm_write(clk->map, &pll->en, 1);
>>> -
>>> -     /* Take the pll out reset */
>>> -     if (MESON_PARM_APPLICABLE(&pll->rst))
>>> -             meson_parm_write(clk->map, &pll->rst, 0);
>>> +     /* Wait for Bandgap and LDO to power up and stabilize */
>>> +     udelay(20);
>>>
>>>        /*
>>>         * Compared with the previous SoCs, self-adaption current module
>>>         * is newly added for A1, keep the new power-on sequence to enab=
le the
>>>         * PLL. The sequence is:
>>> -      * 1. enable the pll, delay for 10us
>>> +      * 1. enable the pll, ensure a minimum delay of 10=CE=BCs
>>>         * 2. enable the pll self-adaption current module, delay for 40us
>>>         * 3. enable the lock detect module
>>>         */
>>>        if (MESON_PARM_APPLICABLE(&pll->current_en)) {
>>> -             udelay(10);
>>>                meson_parm_write(clk->map, &pll->current_en, 1);
>>> -             udelay(40);
>>> -     }
>>> -
>>> -     if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
>>> -             meson_parm_write(clk->map, &pll->l_detect, 1);
>>> -             meson_parm_write(clk->map, &pll->l_detect, 0);
>>> +             udelay(20);
>>>        }
>>>
>>> -     if (meson_clk_pll_wait_lock(hw))
>>> -             return -EIO;
>>> +     /* Take the pll out reset */
>>> +     if (MESON_PARM_APPLICABLE(&pll->rst))
>>> +             meson_parm_write(clk->map, &pll->rst, 0);
>>>
>>> -     return 0;
>>> -}
>>> +     /* Wait for PLL loop stabilization */
>>> +     udelay(20);
>>>
>>> -static void meson_clk_pll_disable(struct clk_hw *hw)
>>> -{
>>> -     struct clk_regmap *clk =3D to_clk_regmap(hw);
>>> -     struct meson_clk_pll_data *pll =3D meson_clk_pll_data(clk);
>>> +     /* Enable the lock-detect module */
>>> +     if (MESON_PARM_APPLICABLE(&pll->l_detect))
>>> +             meson_parm_write(clk->map, &pll->l_detect, 0);
>>>
>>> -     /* Put the pll is in reset */
>>> -     if (MESON_PARM_APPLICABLE(&pll->rst))
>>> -             meson_parm_write(clk->map, &pll->rst, 1);
>>> +     if (meson_clk_pll_wait_lock(hw)) {
>>> +             /* disable PLL when PLL lock failed. */
>>> +             meson_clk_pll_disable(hw);
>>> +             pr_warn("%s: PLL lock failed!!!\n", clk_hw_get_name(hw));
>>>
>>> -     /* Disable the pll */
>>> -     meson_parm_write(clk->map, &pll->en, 0);
>>> +             return -EIO;
>>> +     }
>>>
>>> -     /* Disable PLL internal self-adaption current module */
>>> -     if (MESON_PARM_APPLICABLE(&pll->current_en))
>>> -             meson_parm_write(clk->map, &pll->current_en, 0);
>>> +     return 0;
>>>   }
>>>
>>>   static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long ra=
te,
>> --
>> Jerome

--=20
Jerome

