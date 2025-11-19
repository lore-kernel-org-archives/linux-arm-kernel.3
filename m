Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F3ACF3189
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 10:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+nM8TwEn3pAM+Wkbq5/nAzbOqWOMItS7/Y6FbwZo48=; b=cmaCEipugg7PVjupfBHe3prqci
	a26rO4WYvSZOTCs14PFeXjQM86yjfqoWQ57tCo0HwFR1CygF6WStnWnMoKh9iawhpc4BtXiT1omJS
	fBLFzgoDFR2V/IRvIycwSnyXLq+/OANknbLOLC9u/cImxU/ckdTZS2IYuWG+NqEEvjv479GaoM11h
	Z0wl/eu++3Kj+yInwqkUbhQcKxHNfFVrWtsKwzHo0DB9nwUOyiADEbagIwH27gRieNb123cbdXiIY
	EEfNxZ4TCN7gYkirBWkzMoD5uy+mcKyMXljawptIA4llvYbbP+lVA8+Bq5mCs/ueEPZ6IYlo/DcfF
	VDIwupxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfPc-00000002y2g-2GcW;
	Wed, 19 Nov 2025 10:27:44 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfPZ-00000002y1e-417C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 10:27:43 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b73545723ebso1177181566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 02:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763548060; x=1764152860; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+nM8TwEn3pAM+Wkbq5/nAzbOqWOMItS7/Y6FbwZo48=;
        b=jL5guu3KBnNVXqSN2Ng8xAlI2upG3Exj2EROuql4ZjbPgCh3kgY+XPse33jGs/xSC4
         SMHC/JD3RbEBli3KFVbj+4K3nM/Jqm8oozJ+o3+BWjS7bopgZVsGWjkX3mczh/6hBg6O
         0HEfVXTqneWUxr8CzS+4IOCDHxU9W+au59Y8wCgTkH6gHJR8sdKLZKfjoCQ8dCHz580Z
         JEENjXFjQnaMtPjrojbURzw2bmRlcRP2w3dyyoRZcYlDbZjGmPt+A6yxXELb9YTSmI6v
         8DGElrx6vb+0r6lhQRd/0a7XB+Pj3/4tNrFXqU2hvRvcooeIQqUDW6On7kDSS68RWuSw
         4ZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763548060; x=1764152860;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S+nM8TwEn3pAM+Wkbq5/nAzbOqWOMItS7/Y6FbwZo48=;
        b=bxQeTjtghWJhm/tHG1FmixSMXAIDe98y6oJAYs4XJDfz/yY9nbq4JAKEXUTBgQHMf2
         bt99413/sxV5sSPMPuTi8MLvw77PtWGXfKga4N7XS8wJ8LVQbmGJEIWem8E9MwcSwrRZ
         dSnxvLon79UqtDdHL2KokPxgTHLtvnTAQcZxAS1F8FzP4gUNHRdVqsFla01j0VC7p2ME
         Lt2131zitpS9EzkIDwaw8AWPzTuhIPlQmPRN4M1XXVm9sESLCcJduOJyOeAVPPbOjA+z
         wcCYjwnWx16sXQiRKiXRskhhTXFfZ0VKdSvBATquuu2dLzr6LmVpGVSuMrhxciFqFwJj
         DNIw==
X-Forwarded-Encrypted: i=1; AJvYcCV8TNWSVwufXPVJcAzRd+WJHA6gCbPMRkrxm1bsbv1/nV2F5Bh3cJ5ypKDJK21vZE3hhXjVOIALvBT7mmMB7sfM@lists.infradead.org
X-Gm-Message-State: AOJu0YyoBP/OM6lnYQb+Y1Ou+ES7JirbMEB9tDsRWQeKCw3PzA3yUV7z
	Foy6xS5RjDfnu4g1V9z8d32RvNUf+oJjJioV/Q4XyMjxRhl526HBDHjM
X-Gm-Gg: ASbGncvBVmOAX3XXmJdso8/WBIMHOIXnZ6QQlQM5644vVdcN+1XyjZvXMLoWLdh2pdZ
	uW5sfKgwzRXdBUAG9mkcTN1nnLgRzyi/iU5kNN9PTiU+EvgeMLGXj0WoHvzvEvSjUmUbTs06Nex
	2weotQX2N8MPixJbDi7+t2XiaBEnxl+hBKVtS28SzZVtcJlHyDUHQn+CEjEyiqW6E5a45+Ad/iy
	+rVbxesKhAJOmgXsqaS7Zb7J3onWGB17VOZtJ1bBNgDOKAJdJzVxRTkYUU/3aco+uZxYtHxWT/+
	Yvjxq705YG997LOzYdCZ2sqP0AAg+NqNx00fZodrDwYHRSgpaW2d1ybodE/mPYgJG2IUkDEIOLR
	ShH0as1CqZM80dKG9CeSXwQ38mRxWlVU8Y7xlwghN10Du/2yS7dxEz8XUL9ncDBZfdrMT694Fv1
	cBkga9lzoplwLnvojZ24WwfCRSETEnnbs6mAj/5C3TAk/6kbygZncnEfDesBhn9HycO7wtbhM5d
	Fw=
X-Google-Smtp-Source: AGHT+IFcsP/JWu7DWWlBu/BkWNRt0LIFSuLh7i2sy3UQ2gmA3tYApcSpm1bJdautTGMK/vyZo0UGug==
X-Received: by 2002:a17:907:7e93:b0:b73:9368:ad44 with SMTP id a640c23a62f3a-b739368aff0mr1299146866b.16.1763548059649;
        Wed, 19 Nov 2025 02:27:39 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad4635sm1588133966b.26.2025.11.19.02.27.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Nov 2025 02:27:39 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add compatible
 for S4 HDMI controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <8c3b9fa4-326e-4791-8154-07b268faa132@amlogic.com>
Date: Wed, 19 Nov 2025 11:27:26 +0100
Cc: ao.xu@amlogic.com,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <7703796D-35D4-4AD2-B7F8-B75D2BE0F7AD@gmail.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
 <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
 <8c3b9fa4-326e-4791-8154-07b268faa132@amlogic.com>
To: Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_022742_030861_45BA5E5E 
X-CRM114-Status: GOOD (  20.43  )
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

Pls see inline

> Wiadomo=C5=9B=C4=87 napisana przez Chuan Liu <chuan.liu@amlogic.com> w =
dniu 19 lis 2025, o godz. 03:57:
>=20
> Hi Piotr,
>=20
>=20
> On 11/18/2025 10:50 PM, Piotr Oniszczuk wrote:
>> [You don't often get email from piotr.oniszczuk@gmail.com. Learn why =
this is important at https://aka.ms/LearnAboutSenderIdentification ]
>> [ EXTERNAL EMAIL ]
>> Ao,
>> Is there any chance to get this s4 drm hdmi series for current 6.18?
>> (i tried backport this series to 6.18 but have some issues with =
reparent vpu_0_sel to sysclk_b_sel)
>=20
> Why do we need to reparent vpu_0_sel to sysclk_b_sel? is there any
> background here?

Well - it looks it is because bug....
Martin Blumenstingl had perfect eye and catch typo in patch =
https://lore.kernel.org/all/20250110-drm-s4-v1-11-cbc2d5edaae8@amlogic.com=
/:

By replacing:
assigned-clock-parents =3D <&clkc_periphs CLKID_FCLK_DIV3>,
<0>, /* Do Nothing */
<&clkc_periphs CLKID_VPU_0>,
<&clkc_periphs CLKID_FCLK_DIV4>,
<0>, /* Do Nothing */
<&clkc_periphs CLKID_VAPB_0>;

with:
assigned-clock-parents =3D <&clkc_pll CLKID_FCLK_DIV3>,
<0>, /* Do Nothing */
<&clkc_periphs CLKID_VPU_0>,
<&clkc_pll CLKID_FCLK_DIV4>,
<0>, /* Do Nothing */
<&clkc_periphs CLKID_VAPB_0>;

dmesg is like this https://termbin.com/6020

So i'm getting hdmi working - but only when device boots _without_ =
connected hdmi at boot (and connected later)
If hdmi is connected at boot - boot hangs at:

    0.341676] meson-dw-hdmi fe300000.hdmi-tx: Detected HDMI TX =
controller v2.01a with HDCP (meson_dw_hdmi_phy)
[    0.342750] meson-dw-hdmi fe300000.hdmi-tx: registered DesignWare =
HDMI I2C bus driver
[    0.343660] meson-drm ff000000.vpu: bound fe300000.hdmi-tx (ops =
meson_dw_hdmi_ops)
[    0.344832] [drm] Initialized meson 1.0.0 for ff000000.vpu on minor 0

FYI: It is after applying =
https://patchwork.kernel.org/project/linux-amlogic/cover/20250110-drm-s4-v=
1-0-cbc2d5edaae8@amlogic.com/ on mainline 6.18 (with some my adjustments =
on this series required by changes in 6.18).=20
For VPU clk changes see =
https://github.com/warpme/minimyth2/blob/master/script/kernel/linux-6.18/f=
iles/0312-drm-meson-add-vpu-clk-setting-for-S4.patch=20
It is 6.18 adaptation of =
https://patchwork.kernel.org/project/linux-amlogic/patch/20250110-drm-s4-v=
1-9-cbc2d5edaae8@amlogic.com/

As kernel hangs - i have limited caps to drill where root cause is.=20
 =20
Maybe above hang is reason of my backports or missing any pre-req =
required to get s4 drm working?
Anyway - it will be good to test with updated to 6.18 series of Add DRM =
support for Amlogic S4 (plus info about any pre-req required to get s4 =
drm working)  =20
    =20

>=20
> The vpu_clk on S4 doesn't support sysclk_b_sel as one of its
> selectable clock sources, so this reparent operation will definitely
> fail. This has nothing to do with the kernel version.
>=20
>>> Wiadomo=C5=9B=C4=87 napisana przez Ao Xu via B4 Relay =
<devnull+ao.xu.amlogic.com@kernel.org> w dniu 10 sty 2025, o godz. =
06:39:
>>>=20
>>> From: Ao Xu <ao.xu@amlogic.com>
>>>=20
>>> Add devicetree document for S4 HDMI controller
>>>=20
>>> Signed-off-by: Ao Xu <ao.xu@amlogic.com>
>>> ---
>>> Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml =
| 1 +
>>> 1 file changed, 1 insertion(+)
>>>=20
>>> diff --git =
a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml =
b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>>> index =
84d68b8cfccc86fd87a6a0fd2b70af12e51eb8a4..6e0a8369eee915fab55af24d450a6c40=
e08def38 100644
>>> --- =
a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>>> +++ =
b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>>> @@ -55,6 +55,7 @@ properties:
>>>           - const: amlogic,meson-gx-dw-hdmi
>>>       - enum:
>>>           - amlogic,meson-g12a-dw-hdmi # G12A (S905X2, S905Y2, =
S905D2)
>>> +          - amlogic,meson-s4-dw-hdmi # S4 (S905Y4)
>>>=20
>>>   reg:
>>>     maxItems: 1
>>>=20
>>> --
>>> 2.43.0
>>>=20
>>>=20
>>>=20
>>> _______________________________________________
>>> linux-amlogic mailing list
>>> linux-amlogic@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>=20


