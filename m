Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E454CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 12:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2xSbb+XBUSXol+Xw5qFRPsWuUhic/XBn3XXsaZ5Bxc=; b=Vl675gHlaNWB3Miv7b+9suryBa
	eRjKoGEgiUvJTaCbGgmx8bLK0IEC+Vbp6ZV+9mEH8mNQdMYDwetosYUqEQnc8Wx0dLdXzY8kEBoWF
	wFpjmTb3G3yHA5MHg+j7ENlmZbZF9MB3ujU/SdprySDVu10BR1c0o8kBWcipKkwAFoeGUYe/hUIS2
	vJHtURTojWjgxIxQR3d4SR1YYerYhZvOZLO6sRqlCamyYPOCajKYF3qhAjVBX9pXJQpC24ehQlguM
	hj9M2i9Jf8t03wzNAEiYwkxTES8WMQIVgC+sANDp8Ib/0cNb5EaWgEAJgZEQQBAHrih12ieqM+g3r
	wh14rIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Rw-0000000EB9d-3fwu;
	Mon, 15 Jun 2026 12:29:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Rt-0000000EB8g-1V1u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:29:55 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso24330385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 05:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781526591; x=1782131391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2xSbb+XBUSXol+Xw5qFRPsWuUhic/XBn3XXsaZ5Bxc=;
        b=CcfpSBK+Ap+g6A2xeGwn7fpGoDpuCXTLcwI+3N6PbEJYK0eFsGrbsXQRFL9gVRH+BD
         ZzEd+0ErWvegocHV7mOxS0kZID1QssNHh707v24PbOMmNUL5Al0QkxK5SbVpqjEB8tP5
         7xyCvUEwVhPxpYMA28LV62/L1TMydVBcAFPCpMfbfY404Yhn08RppGyShzvB/zCv231r
         QZ4stLlSpx7n0vQg16KXItIaA5r0P8Ruu/xAhz0l76D8E2Me0p34yPt5+z5nRIn0A+Q2
         +iihhkRvN7N0TxTpuMhF4SZYbtsUpiqE/IfxjroEOTb8LCXNbqFYNdQtgOKWnnT+gvtT
         HG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526591; x=1782131391;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j2xSbb+XBUSXol+Xw5qFRPsWuUhic/XBn3XXsaZ5Bxc=;
        b=KMaW/POsA8sZ0SVHU3uwZ6f3QXN/rLUaQwp4gvDOlPtyEr+5OnUclBcBqN7s2ULGGy
         HhYcb0coyjdquwEEJnN2uKMS5kOjIA2ndN5oJJA5Y2szxU2FmkU5zHEnPikNYcjGVBAP
         KR94rJAUxbp6ixHW1uy1dd2tYzNHWkPcMF847H1On5KKUaHhUStPwBxoe3/HKpmUS2vH
         x8vs6Lo6LKDon9bfx+XHpo7OuO9+8x5wIF/SCwWVvjhy9Chd0k8mY0JEg9BQyffne9uf
         KaPcDObxWhFBxZ2MIApv9s5VvnuJd2z6pIlI/S/xkrzYTdKhHEHNt2GW8ohJHxz+8SXP
         swSA==
X-Forwarded-Encrypted: i=1; AFNElJ+v6my4GsbmlfmAzr9I/p4k9OYdIBUtV6osImz6i8CH9Om1hdCatEcbLvlOfZ0xsdB/XzXWB71QHnagkvF8R7w4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9sX2k4qpaPneUcwmLbz4uV4QZSUnX2QofbAuRy9tFvg/+BAtD
	7jMWRoLO2q/wGECLXznSocOvv6o4fq3nfF6YLQf3mPcRyDnZcXyWaG4ey4xrDB6zS7s=
X-Gm-Gg: Acq92OGruus0xU+2Mp/X3cNaeje0OvgpxPKQ+KBXRkJMDZ+DeZxCIZGpLjpouQvtaHh
	P6yJWwcq4VAcLdwTUuHK8CrPh1eWYEl5fPSPSvcgJml222tnFWN4PgnfZYeJHA3S6Eyy6dbGfoC
	i7EACKb/pnfbA8bFhsiXeEqluKqf11xCOhyhuwGx+rRzSelALHezWFPKG9VaeALZt3F+xi4x2a9
	sqDbx3B+KYCyXSNNo/u90NkMpe8DGPXMg9lYLIJ5Tt9auRUiMo96+HbYzzcXWFWIz1nyRzgkzyD
	7Q6X+CyWTAiJPSMLpOGe2pLOpKkrsV9Fkpd02XXhhAt/w+8HkpJVApz9CdLyzxZp/bj4QsTC9Sd
	SBb7kki9M2i/ySLiC5mxJ/agOILslq9WfV3WhTQjlSfHk+qljeqhKK/ROCFhueBTdSXYbJwInAq
	eAUmBKJD+bgNMXt/Nh2uPQHA==
X-Received: by 2002:a05:600c:8b31:b0:490:b28d:a6f9 with SMTP id 5b1f17b1804b1-490ec4a8474mr184582905e9.8.1781526590867;
        Mon, 15 Jun 2026 05:29:50 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3c22:dcc2:a51d:cde2])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49220372ed0sm223313935e9.14.2026.06.15.05.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:29:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] clk: amlogic: Add A9 peripherals clock
 controller driver
In-Reply-To: <bfe92bbe-5325-4497-b79f-10c7a6e1ed5b@amlogic.com> (Jian Hu's
	message of "Mon, 15 Jun 2026 19:25:20 +0800")
References: <20260610-a9_peripherals-v3-0-d07a78085f71@amlogic.com>
	<20260610-a9_peripherals-v3-2-d07a78085f71@amlogic.com>
	<1jecieftme.fsf@starbuckisacylon.baylibre.com>
	<bfe92bbe-5325-4497-b79f-10c7a6e1ed5b@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 15 Jun 2026 14:29:48 +0200
Message-ID: <1j7bo0dm0z.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_052953_420972_B67AE12F 
X-CRM114-Status: GOOD (  28.21  )
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

On lun. 15 juin 2026 at 19:25, Jian Hu <jian.hu@amlogic.com> wrote:

> On 6/10/2026 8:49 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On mer. 10 juin 2026 at 16:14, Jian Hu via B4 Relay <devnull+jian.hu.aml=
ogic.com@kernel.org> wrote:
>>
>>> From: Jian Hu <jian.hu@amlogic.com>
>>>
>>> Add the peripherals clock controller driver for the Amlogic A9 SoC fami=
ly.
>>>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> ---
>>>   drivers/clk/meson/Kconfig          |   15 +
>>>   drivers/clk/meson/Makefile         |    1 +
>>>   drivers/clk/meson/a9-peripherals.c | 1925 +++++++++++++++++++++++++++=
+++++++++
>>>   3 files changed, 1941 insertions(+)
>>>
>
> [ ... ]
>
>>> +
>>> +/* Channel 6 is unconnected. */
>>> +static u32 a9_glb_parents_val_table[] =3D { 0, 1, 2, 3, 4, 5, 7 };
>>> +static struct clk_regmap a9_dspa;
>> What is this ?
>
>
> The peripheral clock definitions are ordered by register offset.
>
> dspa is one of the parents of the glb clock, while the dsp clock registers
> are located after the GLB clock registers.
>
> Since glb references a9_dspa before its full definition appears, the
> declaration
>
> static struct clk_regmap a9_dspa;
>
> is added as a forward declaration to satisfy the compiler.
>
>
> Would it make sense to relax the register-offset ordering in this case?
>

I don't think we ever enforced such ordering (or any other ordering) in
the clock driver, so yes please.


> By defining the DSP clock before the GLB clock, we could remove the forwa=
rd
> declaration of a9_dspa.

Unless it is absolutely necessary, please avoid forward declaration.

Declare what is needed first, keep related things together and use your
best judgement ... IOW, make it easy for me to review ;)=20

>
>>> +
>>> +static const struct clk_parent_data a9_glb_parents[] =3D {
>>> +};

[...]

>>> +
>>> +static struct clk_regmap a9_vclk_div2_en =3D {
>>> +     .data =3D &(struct clk_regmap_gate_data){
>>> +             .offset =3D VID_CLK_CTRL,
>>> +             .bit_idx =3D 1,
>>> +     },
>>> +     .hw.init =3D CLK_HW_INIT_HW("vclk_div2_en", &a9_vclk.hw,
>>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARE=
NT),
>>> +};
>> Looks to me all this div_en / div repeating pattern would be easier to r=
eview
>> with tiny macro .
>
>
> Good point.
>
> I tried to reduce the repeated div_en/div pattern using a helper macro.
>
> It keeps the relationship between gate and fixed-factor clock more compact
> and easier to review.
>
> After using the helper macro, the div_en/div code can be simplified to the
> following:
>
> #define A9_VCLK(_name, _reg, _bit, _div, _parent) =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\
> struct clk_regmap a9_##_name##_en =3D { =C2=A0 =C2=A0 =C2=A0\
                       ^- not strictly necessary, a touch too agressive
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .data =3D &(struct clk_regmap_gate_data){ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D _reg,=
 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .bit_idx =3D _bit=
, =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 }, =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hw.init =3D &(struct clk_init_data) { =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D #_name =
"_en", =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ops =3D &clk_reg=
map_gate_ops, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent_hws =3D (=
const struct clk_hw *[]) { _parent },=C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .num_parents =3D =
1, =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D CLK_SE=
T_RATE_PARENT, =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 }, =C2=A0 =C2=A0 =C2=A0 \
> }; =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 \
> struct clk_fixed_factor a9_##_name =3D { =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .mult =3D 1, =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .div =3D _div, =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hw.init =3D &(struct clk_init_data){ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D #_name,=
 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ops =3D &clk_fix=
ed_factor_ops, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent_hws =3D (=
const struct clk_hw *[]) { =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &a9_##_name##_en.hw =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }, =C2=A0 =C2=A0 =
=C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .num_parents =3D =
1, =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D CLK_SE=
T_RATE_PARENT, =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 }, =C2=A0 =C2=A0 =C2=A0 \
> }; =C2=A0 =C2=A0 =C2=A0 \
>
> static A9_VCLK(vclk_div2, VID_CLK_CTRL, 1, 2, &a9_vclk.hw);
> static A9_VCLK(vclk_div4, VID_CLK_CTRL, 2, 4, &a9_vclk.hw);
> static A9_VCLK(vclk_div6, VID_CLK_CTRL, 3, 6, &a9_vclk.hw);
> static A9_VCLK(vclk_div6, VID_CLK_CTRL, 4, 12, &a9_vclk.hw);
> static A9_VCLK(vclk2_div2, VIID_CLK_CTRL, 1, 2, &a9_vclk2.hw);
> static A9_VCLK(vclk2_div4, VIID_CLK_CTRL, 2, 4, &a9_vclk2.hw);
> static A9_VCLK(vclk2_div6, VIID_CLK_CTRL, 3, 6, &a9_vclk2.hw);
> static A9_VCLK(vclk2_div6, VIID_CLK_CTRL, 4, 12, &a9_vclk2.hw);
>
>
> If you think splitting it further into separate helper macros would impro=
ve
> readability.

One clock per macro please. Hidding 2 declaration is recipe for
disaster. For ex, here the first one is static, the 2nd is not=20

>
> I can do that as well.
>


