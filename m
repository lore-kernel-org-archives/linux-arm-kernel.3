Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CF1CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 21:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=USZ1ZPEwAt0buJ1raktBiS8fu4e5iLdAr8IWfRSGWK0=; b=sw83/+zxNH+OFcVwNT0M0toy+k
	fCoIvVkeUdhEA72UXPTVdLcqKNW/+kqcP0z1tq16HDKZgRU3kELSCz//S7e0+QhifBU9s9otS8MuL
	TgBnKX0ilxA3wCYpFNF5c69rqGLA5iJvXhtX1lFZZjlzaoaLyfokr4tkkQxtM0KoYC9bJsXQBbHP8
	334OOlNTAvyDn0QmRGmBxf/AJBU6dbTnvVQtOih53nKXPHxOon9jxzcVpmkMwjYnZ7UUbd5RhS4vX
	xaqZ+WtpgeI5OVCvHX0HgbWNm2E6uiU8NGFJmIcv62EBwbx6jquxgbgSJL4/hXoFjOx/sbueTjGmL
	2lF6tO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPor5-00000005tN9-2Ajg;
	Wed, 20 May 2026 21:53:31 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPor2-00000005tMX-3KaS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 21:53:29 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-79a535e7c00so53781867b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 14:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779314007; x=1779918807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=USZ1ZPEwAt0buJ1raktBiS8fu4e5iLdAr8IWfRSGWK0=;
        b=cdBSccV3T46mBlVGDAKLl5LOu7NZ0IeogzBSjk4ZJSBBc+DntxmgzL37GcAm1K9J1Q
         R5LWPHObvFbxHOCJfxj6Pz0oZCxRmVcnwZ8eZkNaE/nCl4w8Cm5FBoPnPf8lPyJkpIyl
         veNlEwFFi6Fywc61X23aS9zu7mwT8MRUjE4fZ6LgGSo88U68+qeEAwmaSV0ptMG+lr7W
         exYMHlAVu7GtHJN9iSvzxAKdjV+6mUy+hm2GHpM7EbuGmp1GxFFcM1UWOOBone3BlWKZ
         XoOA0rtrKPwvixGicn42HEmPjZz8Da+GfoQ/7ocDpLsxLFcUcP8VZACcPv31tDMWJM83
         FPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779314007; x=1779918807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USZ1ZPEwAt0buJ1raktBiS8fu4e5iLdAr8IWfRSGWK0=;
        b=fki4lt4OwetiaMBa5pT2WS3N1eN9ResaI5KZHtjQZ+eW/+zOYwGNfC9MKL1NBspw5o
         dkeM5+zhu7lf4CmbeRed6hw/75U1dK4ud6i9F+ZwkrWMGOlwnsLZzI+jf7iibuMT749k
         AvJ6bkJ4W/KxdSDMWuDCLZZpqIb22dlUKtiJCmaeblRQmxYXzwhUlDWb+b6Y/NTwX0sw
         5cbmEUkIXWgeODum8KS/IS5vb/8QvZgPNhy4EmXJIjgs7/KcFqDFtI2rUwc71+de3ApB
         BEqz2u31rLokYNw8m7hP+QB20XGkY0YeGUhupDFuA5gJCIbAWH4+Y+vsccPeVffF80HT
         UZBA==
X-Forwarded-Encrypted: i=1; AFNElJ9O0pDPpWSgQbvgUi3gKGItBxAPYi8MeSXdJU1TKMVdhBlvaabM5cC4DQ6czBmD2jJjqF2POEN3iXdOXxjLKk/V@lists.infradead.org
X-Gm-Message-State: AOJu0YxPKHuVi/a4GdKACU+SB0jUCkyR1g3RSG40IhVbmJKVMDXmVfKE
	v3RR0EywSCHih0wAPaO0UP8eN300iBTzqk2TLUyMCLQKA7fXAUmoAQrT
X-Gm-Gg: Acq92OGZmbk3jzeV4G6jBf/LQ3aLPZcvYYTeo66WPOt2kqgbImNep7hjOqkxi6Pb7eY
	mioA9BWAAV4sSmv1MfAuzExgyfctW9xYoHlOqtEkL26YTZiz/ArCkItHpsQfEeEnSnrYrpoTXYq
	7ZeuTcDYO+YKhK6P3UM7jDUI5oA7gvxUphL/chFTa1wsZ7ColmSwe4pWvnwzjsKpjk+Xl+J4LOY
	c9NiRqZK5DL/HcPH+PuGn072YwyXJC2psl30XGC6Ca73pqQ1cSrJc9aUC9Mji501BktX7xNssmU
	mjD4I+Q/c9mhV+eBGWKse5VJj1Ygk/KvpSfocY2cYwTK9XgaM6+hSMnjAk1AboFY+Uqa4x7zITm
	leisLJMGd6py9JKUN0NQDh1etoE3XOIOHLglMFQqxWneSKxc0QDqnxEnSBOcku3aTmD2hAZRHTq
	Xfjv1SznGMmZiQ6fSLHdybQgZp3cL89NDlvvtIwwzGfw==
X-Received: by 2002:a05:690c:c4c5:b0:7d0:b4d:e03f with SMTP id 00721157ae682-7d20a7a9720mr3219537b3.9.1779314007072;
        Wed, 20 May 2026 14:53:27 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:ed8c:6b8b:1fa3:d14b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc9bc0dafdsm59071347b3.30.2026.05.20.14.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 14:53:26 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: xuwei5@hisilicon.com
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: hisilicon: hi3660-hikey960: move role-switch endpoint into connector
Date: Wed, 20 May 2026 16:53:25 -0500
Message-ID: <20260520215325.55353-1-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_145328_842498_629FEA16 
X-CRM114-Status: GOOD (  12.60  )
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

The rt1711h Type-C controller on the HiKey960 has the USB role-switch
endpoint placed as a top-level 'port' node, outside the connector
subnode. This triggers two dtbs_check warnings against
richtek,rt1711h.yaml:

  - 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
  - connector:ports: 'port@0' is a required property

Move the role-switch endpoint into the connector's port@0, which is
where usb-connector.yaml expects it. Update the DWC3 remote-endpoint
phandle accordingly.

The TCPM core (tcpm.c) looks up the role switch starting from the
connector fwnode via fwnode_usb_role_switch_get(). With the endpoint
inside the connector's port@0, it is found through the primary lookup
path rather than the device-level fallback.

Cross-compiled for arm64. Verified with dt_binding_check and
dtbs_check. Not runtime-tested on hardware.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
 .../boot/dts/hisilicon/hi3660-hikey960.dts      | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index c6056a85c..27fb08d34 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -550,6 +550,12 @@ usb_con: connector {
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					usb_con_hs: endpoint {
+						remote-endpoint = <&dwc3_role_switch>;
+					};
+				};
 				port@1 {
 					reg = <1>;
 					usb_con_ss: endpoint {
@@ -558,15 +564,6 @@ usb_con_ss: endpoint {
 				};
 			};
 		};
-		port {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			rt1711h_ep: endpoint@0 {
-				reg = <0>;
-				remote-endpoint = <&dwc3_role_switch>;
-			};
-		};
 	};
 
 	adv7533: adv7533@39 {
@@ -683,7 +680,7 @@ port {
 		#size-cells = <0>;
 		dwc3_role_switch: endpoint@0 {
 			reg = <0>;
-			remote-endpoint = <&rt1711h_ep>;
+			remote-endpoint = <&usb_con_hs>;
 		};
 
 		dwc3_ss: endpoint@1 {
-- 
2.54.0


