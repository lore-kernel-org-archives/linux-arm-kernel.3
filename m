Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98FDC369A6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 16:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3wrvWVbOnRUQVWpOBEubP7kMDCUCq12GpzisA/3qfg=; b=3EOB+11HxHMy+kOOZYFJj6er20
	5ZHzDB3f+ivGsM/vMekQq22oxbYkwNSnQYEB+sJvdz/3dYx+WlvoxlJCIOuK22l89gEsP5MZQ0Ekh
	1jovoPGFH0mNPy2gvE+sAo80SNmDsR56DIPWIRI9a2+jDmTErXIhSnTLr6Awv9O2QfWmb10zCQTff
	3me4IqS9bEBiOUArQ3pSspZJsQAol0p0XLxaLNJniJLqucB9IUhrqYTsG7koXnThrb23pTQWfHG1o
	VTUA6WPp4srZcZ1Ih8/PHDpSKsfZ2qf3XDPicabgWBEHGeJRw4FYOkqu87eFZmMw/dPnM1+34CDnR
	GKHF3xAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Bxi-00000004png-0JmB;
	Tue, 08 Apr 2025 16:38:10 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Bvv-00000004pc2-24DK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 16:36:21 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so781450866b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 09:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1744130177; x=1744734977; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3wrvWVbOnRUQVWpOBEubP7kMDCUCq12GpzisA/3qfg=;
        b=p1gD4DJTy8UPEdDMCIWWE8QoC/iSAzCr1/JpuApyleLil0BdLA0lZXNRKzIEWAZYAG
         dLdTTG9j5lt1+JRxXoTQsel9V2gJHOibMmxjind7hHtHR6CP3jz8Oi22pMHUU5nJ2xV2
         scCju2+qpgJ3ZYagIf03L1UdsLy5jgOJx1DiH2cQCYHTNqmKRz730zMO+jI+eDV/eZEB
         blAGyjWYbSfAGFli7gefhe/JGp/CbRmdOGHuQCaTvZs1P36K//BrbsAcuKXgPUOU2Pil
         E4Gir1PUm1VUxh5R7a1uh/vQgG1LWqH8Tcpx32m66UMIk4ikG6DXTQufvj9QFS52jw/c
         J+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744130177; x=1744734977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3wrvWVbOnRUQVWpOBEubP7kMDCUCq12GpzisA/3qfg=;
        b=vb+kDBgcsqXRDJCBJW7z/UMqIKhjOmM9LXjmVYMu0p8x5XtsaMOuLbYtNCBCDl7rKN
         1XqYRZAYII4zk+jZCyZ4FgDyDf5wWPaKtte1cf2tdKLnP7UHrCPiYx4EZXSk0eiBjMyz
         Ty182UByTg6QXE+X+DFkF3PBg0ps8NbImINkIBF/uhQL/Qm/lx+Q3466jlg3Bx2lwyOE
         n/28j/eePnB2Xo5ls2KesS6VfEJZx5ZbuBYsRzqulv8c9wZS9FMO342rY3G7+8wbAeOz
         t8MLboaLLZOdybzTM+20/AewZQX5bmOmYK49tco3qOXaRYuuUfqOgLkozbdO4Pi2sUUn
         x4SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVet8VjgLZtPICvD1Nhn+MAfyxDfeJwIa6o5SfULU7o876hppqHF+3idZ+/DJ3rkoZh32siiffSRwfSvgmZnySL@lists.infradead.org
X-Gm-Message-State: AOJu0YyIR0GuT5FyfdFxRO/5H9OV12VuLVoZjPPZZAuEcfTTJtt60HEJ
	YURRBqtxEC54WLRAwzo/xc/lCHGjyWsXpBBbB/4DT9jXeDRZKOUxjr56q1yCwEc6VfsXyUYZL22
	FQ6YoL3cHZCCMAE0JJZwBp+sza2UZeT14+gVgug==
X-Gm-Gg: ASbGncuj47kKBebuV9XeHIQEqWT77SiSb9H6+CVfdSu8KXaFwZfTyzQNeLRUvPRUPA2
	Rd6ysHQ0oYcJMUNlTm9/HJG01E0ymTB7Dt3Wtr/vuwOoLGXKF5WuxhEggkXPMcZw09lRSVzfrHh
	1W41aykq+ftmuHPXGOyzSCAt4ownJM
X-Google-Smtp-Source: AGHT+IEKFLhzxNA8nE4j3QQLXx2xIaLoG80ZEqlxvEiciuURe4ovIM9jxkUyiDuLYEFOGCRYHlOLSuzofncZr+mD4JY=
X-Received: by 2002:a17:907:7da3:b0:ac2:55f2:f939 with SMTP id
 a640c23a62f3a-ac7e7170328mr1083292466b.6.1744130176982; Tue, 08 Apr 2025
 09:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com>
 <20250326-onboard_usb_dev-v1-2-a4b0a5d1b32c@thaumatec.com> <20250326-fanatic-onion-5f6bf8ec97e3@spud>
In-Reply-To: <20250326-fanatic-onion-5f6bf8ec97e3@spud>
From: =?UTF-8?Q?=C5=81ukasz_Czechowski?= <lukasz.czechowski@thaumatec.com>
Date: Tue, 8 Apr 2025 18:36:04 +0200
X-Gm-Features: ATxdqUGKDxJYzUIvQOK05tjpTcLCd2GeOTcg3K4KoR3MFRQVI_hcKPX99fihLeY
Message-ID: <CABd623tEGh=qtpF0h7PkRBBrR7V9EaxUv9HregqbPcLU_2Exbg@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: usb: cypress,hx3: Add support for all variants
To: Conor Dooley <conor@kernel.org>
Cc: Matthias Kaehlcke <mka@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Benjamin Bara <benjamin.bara@skidata.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Klaus Goger <klaus.goger@theobroma-systems.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_093619_714103_76FE9D13 
X-CRM114-Status: GOOD (  24.29  )
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

Hello,

=C5=9Br., 26 mar 2025 o 18:58 Conor Dooley <conor@kernel.org> napisa=C5=82(=
a):
>
> On Wed, Mar 26, 2025 at 05:22:57PM +0100, Lukasz Czechowski wrote:
> > The Cypress HX3 hubs use different default PID value depending
> > on the variant. Update compatibles list.
> >
> > Fixes: 1eca51f58a10 ("dt-bindings: usb: Add binding for Cypress HX3 USB=
 3.0 family")
> > Cc: stable@vger.kernel.org # 6.6
> > Cc: stable@vger.kernel.org # Backport of the patch in this series fixin=
g product ID in onboard_dev_id_table and onboard_dev_match in drivers/usb/m=
isc/onboard_usb_dev.{c,h} driver
> > Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
> > ---
> >  Documentation/devicetree/bindings/usb/cypress,hx3.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml b/D=
ocumentation/devicetree/bindings/usb/cypress,hx3.yaml
> > index 1033b7a4b8f9..f0b93002bd02 100644
> > --- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> > @@ -15,8 +15,14 @@ allOf:
> >  properties:
> >    compatible:
> >      enum:
> > +      - usb4b4,6500
> > +      - usb4b4,6502
> > +      - usb4b4,6503
> >        - usb4b4,6504
> >        - usb4b4,6506
> > +      - usb4b4,6507
> > +      - usb4b4,6508
> > +      - usb4b4,650a
>
> All these devices seem to have the same match data, why is a fallback
> not suitable?
>

Thank you for the suggestion. Indeed the fallback compatible appears
to work fine in this case,
and I am able to avoid additional entries in onboard_dev_match table
as added in the first patch in this series.

However, after I've updated the cypress,hx3.yaml schema file and
rk3399-puma.dtsi file,
I get the following warnings, when running "make dtbs_check":

linux/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@1:
compatible: ['usb4b4,6502', 'usb4b4,6506'] is too long
=E2=80=83=E2=80=83from schema $id: http://devicetree.org/schemas/usb/cypres=
s,hx3.yaml#
linux/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@2:
compatible: ['usb4b4,6500', 'usb4b4,6504'] is too long
=E2=80=83=E2=80=83from schema $id: http://devicetree.org/schemas/usb/cypres=
s,hx3.yaml#

Below is the diff of my changes:

diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
index f0b93002bd02..d6eac1213228 100644
--- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
@@ -14,15 +14,22 @@ allOf:

 properties:
   compatible:
-    enum:
-      - usb4b4,6500
-      - usb4b4,6502
-      - usb4b4,6503
-      - usb4b4,6504
-      - usb4b4,6506
-      - usb4b4,6507
-      - usb4b4,6508
-      - usb4b4,650a
+    oneOf:
+      - enum:
+          - usb4b4,6504
+          - usb4b4,6506
+      - items:
+          - enum:
+              - usb4b4,6500
+              - usb4b4,6508
+          - const: usb4b4,6504
+      - items:
+          - enum:
+              - usb4b4,6502
+              - usb4b4,6503
+              - usb4b4,6507
+              - usb4b4,650a
+          - const: usb4b4,6506

   reg: true

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index d0d867374b3f..7fac61f95fc6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -594,14 +594,14 @@ &usbdrd_dwc3_1 {
        #size-cells =3D <0>;

        hub_2_0: hub@1 {
-               compatible =3D "usb4b4,6502";
+               compatible =3D "usb4b4,6502", "usb4b4,6506";
                reg =3D <1>;
                peer-hub =3D <&hub_3_0>;
                reset-gpios =3D <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
        };

        hub_3_0: hub@2 {
-               compatible =3D "usb4b4,6500";
+               compatible =3D "usb4b4,6500", "usb4b4,6504";
                reg =3D <2>;
                peer-hub =3D <&hub_2_0>;
                reset-gpios =3D <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;


Do you have any suggestions on how I can properly update the schema
files to avoid the above warnings?

> >
> >    reg: true
> >
> >
> > --
> > 2.43.0
> >

Best regards,
Lukasz

