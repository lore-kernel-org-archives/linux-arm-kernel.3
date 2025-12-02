Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9046BCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 08:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcgzur0HEUNJflCgkpwrwXAczgebSEaHIRN6YepyWwU=; b=HVQpq1J8Aa8UTzxaB0RHSuCzeL
	wQIVM68k54owLjEySoidh9mB2pGQ+qjN1xWAQyjJ9ldX9dy/TE83wo07HCBKEhaGKWQQpWD43huGk
	IuZUEGNTV3xnk6e+mZrapXAe4kXQP560uieHxkdMV5hGCjB5J38rHKTH0ySoUNTrEx6NOkP0W+OhU
	GoWHE8TIb2xCB3h6A24yURsN7DW6NJjbOLa3UzZxllm6X+ACD8sSixMb2uxvLjEihfjxfqGSt67jE
	JN9Q7VNtbAJsDKYiJWFaQi+ucTPBSiMNMOyrK97VFQfQTsno4CEH5JZ4MFjIU8jA12oJujRDatt1g
	oNFjrx8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLlK-000000053HR-1PLo;
	Tue, 02 Dec 2025 08:29:30 +0000
Received: from mail-ed1-f47.google.com ([209.85.208.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLlE-000000053Fp-0hVj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 08:29:29 +0000
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso3251487a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 00:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764664162; x=1765268962; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcgzur0HEUNJflCgkpwrwXAczgebSEaHIRN6YepyWwU=;
        b=MG6VwAWHzkQw17/l/A+L9plTlafcRXLCTiyRlN3SufLhrSYn5ynsKGNhLYBgX6ToG1
         IgHyH1Zs6CQt7mNhbxoXhkcPXwnvnLflfMTB9UKrbke7E14JKpkY6wPlQl+IwgismL1s
         5nffCXFYitP7c/RBrhH4MwEOy12UlPOoHyscSZbmxTtIKPgd1SsAlsv6ukQWpDveCEtH
         eTY1ah5PCGXELeMW3LBgGBeOk+cllffT1wYTwzUs1AqTwinLnR5Ld0hBOIMNJGWBcP/+
         5vW7ysqCEdhgJxfbBRno9GvhnFM1rdCTcBt/guNZPyB13BoisAeI52ig0PRmApfbwPC4
         1V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764664162; x=1765268962;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcgzur0HEUNJflCgkpwrwXAczgebSEaHIRN6YepyWwU=;
        b=XCF94AyYerPRCgXgpnI67PWboM6f+ZNTaR00dwX7w+7Ov0ECjcea7fkeHWME2+6j8c
         6WMqjKSYiQ4LLRrCh5kP8zvNB9mE1aNnqMBXnWRBElTrdeYDvzQP6v1/OvhjL7kgiQGB
         xrIetDyxZJQ+NpJEP9JfhxHkxcpJvIFzfivIOSz384ISjWf5bUamzfzjWWeRB8Am2F57
         cK3zPmqZFvR+W8yL3wI8PzV6gaoYstEProhdnhul68K89o9cJDKy/kK5SfUGlyW3o4P3
         6W8fCSWWNx8zjuMIjN9z8H9zrZOawCg76YZt2FkJHEZlumN3vD5A83h5JC0rTTtT7eXS
         GDjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFOkU4iixedHmWv4nbsUfMEIo7atSMyBNMOyJYsFb39iWmH4umffo2hQsxDiEU+9oGbYkUanPBY8w90DM2GNtC@lists.infradead.org
X-Gm-Message-State: AOJu0YxD5g8CD8Sxc9opElVGJ342M217d3QTqn2nIdCa1ReZUg5vFSgF
	DxrEMZZhcjD25Q4t87gAx7t0xdozpq63T/sDyud0dDJW964j8ln3oU2j
X-Gm-Gg: ASbGncuyV1IFmw7VbBDUTLdSd51KWwTsObsVoOFlHifwmQNLs6bqOW54wxoBO3sIpD5
	qkaFl1wELBt4yFfQnH4I+55Ur4G+UJaE7hwA1rYf9QKh/gu4NfLncH56peOEYc7EuiFkj8KX+m4
	cPX4fbdn39pS4rJMRu5raZAbekxYYIqEFmL6LUqRRJWS08pm4u9Jnx3lICzHh0FCLCtIMO4pUDd
	L3hUne+7pGTJd2BFsV1RV8yCO0RwRqkee3aAuF2DJ3HBdaoYaoZGLADcCsg7VHH8q3w4ReqY41X
	rrBq3aFvFwRQdqWdbErHT/ilfaye6pibOGW8+iRgQU7INAF0AhHDd1pjaewEVc0YYfhM6I4iSgw
	Rt4MroIzvjN6OC6yj6SoPmSZOpDSQJ0fgnqOhkabh7Bn4h4eHqXapn7pBi5TgwDI2F1I4yajjOu
	tIzcrHChRmR6XVg0sOUm7DhxiBxOMDZYDjGMmic7nZkdYbMYQgKRT/HL38PqC1yi8gEuf0av6E0
	M0=
X-Google-Smtp-Source: AGHT+IHjEo3dTSPtXuaE0YTbWgrbA87SGNQIz1itunkq73Jcs/neO8kKvVs5IxH7P+kpLe+c3V08gg==
X-Received: by 2002:a05:6402:280d:b0:647:62ba:123b with SMTP id 4fb4d7f45d1cf-647892a97a6mr1662944a12.9.1764664161284;
        Tue, 02 Dec 2025 00:29:21 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90e44sm14669936a12.14.2025.12.02.00.29.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Dec 2025 00:29:20 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add compatible
 for S4 HDMI controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <a71f24c9-1f40-45a1-8fdb-6075bbf89930@amlogic.com>
Date: Tue, 2 Dec 2025 09:29:07 +0100
Cc: Chuan Liu <chuan.liu@amlogic.com>,
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
Message-Id: <F04DC684-AD64-447F-87EC-F503D411F25D@gmail.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
 <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
 <8c3b9fa4-326e-4791-8154-07b268faa132@amlogic.com>
 <7703796D-35D4-4AD2-B7F8-B75D2BE0F7AD@gmail.com>
 <a71f24c9-1f40-45a1-8fdb-6075bbf89930@amlogic.com>
To: Ao Xu <ao.xu@amlogic.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_002924_245635_5C5623E4 
X-CRM114-Status: GOOD (  18.37  )
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

Ao,
Any chance for updated s4 hdmi series for 6.18?
=20

> Wiadomo=C5=9B=C4=87 napisana przez Ao Xu <ao.xu@amlogic.com> w dniu 21 =
lis 2025, o godz. 03:55:
>=20
> Hi Piotr=EF=BC=8C
>=20
>     I will check this issue
>=20
> =E5=9C=A8 2025/11/19 18:27, Piotr Oniszczuk =E5=86=99=E9=81=93:
>> [You don't often get email from piotr.oniszczuk@gmail.com. Learn why =
this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>=20
>> [ EXTERNAL EMAIL ]
>>=20
>> Pls see inline
>>=20
>>> Wiadomo=C5=9B=C4=87 napisana przez Chuan Liu <chuan.liu@amlogic.com> =
w dniu 19 lis 2025, o godz. 03:57:
>>>=20
>>> Hi Piotr,
>>>=20
>>>=20
>>> On 11/18/2025 10:50 PM, Piotr Oniszczuk wrote:
>>>> [You don't often get email from piotr.oniszczuk@gmail.com. Learn =
why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>> [ EXTERNAL EMAIL ]
>>>> Ao,
>>>> Is there any chance to get this s4 drm hdmi series for current =
6.18?
>>>> (i tried backport this series to 6.18 but have some issues with =
reparent vpu_0_sel to sysclk_b_sel)
>>> Why do we need to reparent vpu_0_sel to sysclk_b_sel? is there any
>>> background here?
>> Well - it looks it is because bug....
>> Martin Blumenstingl had perfect eye and catch typo in patch =
https://lore.kernel.org/all/20250110-drm-s4-v1-11-cbc2d5edaae8@amlogic.com=
/:
>>=20
>> By replacing:
>> assigned-clock-parents =3D <&clkc_periphs CLKID_FCLK_DIV3>,
>> <0>, /* Do Nothing */
>> <&clkc_periphs CLKID_VPU_0>,
>> <&clkc_periphs CLKID_FCLK_DIV4>,
>> <0>, /* Do Nothing */
>> <&clkc_periphs CLKID_VAPB_0>;
>>=20
>> with:
>> assigned-clock-parents =3D <&clkc_pll CLKID_FCLK_DIV3>,
>> <0>, /* Do Nothing */
>> <&clkc_periphs CLKID_VPU_0>,
>> <&clkc_pll CLKID_FCLK_DIV4>,
>> <0>, /* Do Nothing */
>> <&clkc_periphs CLKID_VAPB_0>;
>>=20
>> dmesg is like this https://termbin.com/6020
>>=20
>> So i'm getting hdmi working - but only when device boots _without_ =
connected hdmi at boot (and connected later)
>> If hdmi is connected at boot - boot hangs at:
>>=20
>>     0.341676] meson-dw-hdmi fe300000.hdmi-tx: Detected HDMI TX =
controller v2.01a with HDCP (meson_dw_hdmi_phy)
>> [    0.342750] meson-dw-hdmi fe300000.hdmi-tx: registered DesignWare =
HDMI I2C bus driver
>> [    0.343660] meson-drm ff000000.vpu: bound fe300000.hdmi-tx (ops =
meson_dw_hdmi_ops)
>> [    0.344832] [drm] Initialized meson 1.0.0 for ff000000.vpu on =
minor 0
>>=20
>> FYI: It is after applying =
https://patchwork.kernel.org/project/linux-amlogic/cover/20250110-drm-s4-v=
1-0-cbc2d5edaae8@amlogic.com/ on mainline 6.18 (with some my adjustments =
on this series required by changes in 6.18).
>> For VPU clk changes see =
https://github.com/warpme/minimyth2/blob/master/script/kernel/linux-6.18/f=
iles/0312-drm-meson-add-vpu-clk-setting-for-S4.patch
>> It is 6.18 adaptation of =
https://patchwork.kernel.org/project/linux-amlogic/patch/20250110-drm-s4-v=
1-9-cbc2d5edaae8@amlogic.com/
>>=20
>> As kernel hangs - i have limited caps to drill where root cause is.
>>=20
>> Maybe above hang is reason of my backports or missing any pre-req =
required to get s4 drm working?
>> Anyway - it will be good to test with updated to 6.18 series of Add =
DRM support for Amlogic S4 (plus info about any pre-req required to get =
s4 drm working)
>>=20
>>=20
>>> The vpu_clk on S4 doesn't support sysclk_b_sel as one of its
>>> selectable clock sources, so this reparent operation will definitely
>>> fail. This has nothing to do with the kernel version.
>>>=20
>>>>> Wiadomo=C5=9B=C4=87 napisana przez Ao Xu via B4 Relay =
<devnull+ao.xu.amlogic.com@kernel.org> w dniu 10 sty 2025, o godz. =
06:39:
>>>>>=20
>>>>> From: Ao Xu <ao.xu@amlogic.com>
>>>>>=20
>>>>> Add devicetree document for S4 HDMI controller
>>>>>=20
>>>>> Signed-off-by: Ao Xu <ao.xu@amlogic.com>
>>>>> ---
>>>>> =
Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml | 1 =
+
>>>>> 1 file changed, 1 insertion(+)
>>>>>=20
>>>>> diff --git =
a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml =
b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>>>>> index =
84d68b8cfccc86fd87a6a0fd2b70af12e51eb8a4..6e0a8369eee915fab55af24d450a6c40=
e08def38 100644
>>>>> --- =
a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>>>>> +++ =
b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>>>>> @@ -55,6 +55,7 @@ properties:
>>>>>           - const: amlogic,meson-gx-dw-hdmi
>>>>>       - enum:
>>>>>           - amlogic,meson-g12a-dw-hdmi # G12A (S905X2, S905Y2, =
S905D2)
>>>>> +          - amlogic,meson-s4-dw-hdmi # S4 (S905Y4)
>>>>>=20
>>>>>   reg:
>>>>>     maxItems: 1
>>>>>=20
>>>>> --
>>>>> 2.43.0
>>>>>=20
>>>>>=20
>>>>>=20
>>>>> _______________________________________________
>>>>> linux-amlogic mailing list
>>>>> linux-amlogic@lists.infradead.org
>>>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>>>> _______________________________________________
>>>> linux-amlogic mailing list
>>>> linux-amlogic@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic


