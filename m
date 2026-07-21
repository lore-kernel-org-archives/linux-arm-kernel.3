Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A1DC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=16RyG3rd15UswS247w8Y2rBGrhgjsgtjs/mBo5jjAhc=; b=TXc2Wf8Cc/lPPNmFcdArHqhptv
	Jc9W3duqK0pmzYMGvuLv9J00DBrcWu3xTsN0+P64ofPX0eEsnuvr0pj+Wx2NDjRhUQ9o4UyfEQ82K
	J7S31ugrixpUPAgyColxuJnd6HccZ5SIslo9Wr3a8+32tSeZ3drcJWVke6ZODJf6LbghhtrZPxI3C
	UP0PYWvA2hLyfoMM7ARifVp2YVvvhc5v+NHc+/rXUlbJqR+kxzxq2h8vyVPP78p1T5zlUL2bNNwpM
	d0INqnjkNn9wfsX68RlqWSLIMz9v9tJxSfpmZYffu9GT1UOjLV5SagEWnlyVoChFVvk5+JDlI3Rox
	lIdrTFFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmD5x-00000009rhm-3QIU;
	Tue, 21 Jul 2026 16:13:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmD5u-00000009rhH-1MZV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 16:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784650399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=16RyG3rd15UswS247w8Y2rBGrhgjsgtjs/mBo5jjAhc=;
	b=Z15xHNuWMktsJuW9TN/FuE/JGOKcL4Z3H6dkYgF+Jwd8ldpT4MUEvYcwtQrm0uuKjIskGX
	tdxDi5ODQdNqjlf4S3j+t5f8XEdEa+Z0IyrHSAHQryLE4ApZOW7O8hxn+dJIjWWrN66I7j
	iquaMqjhpx43wTHjZnawDFAjsf7H8sw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-BN7N7wstMZGRjytM5rVp2Q-1; Tue, 21 Jul 2026 12:13:15 -0400
X-MC-Unique: BN7N7wstMZGRjytM5rVp2Q-1
X-Mimecast-MFC-AGG-ID: BN7N7wstMZGRjytM5rVp2Q_1784650395
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8efe7db1c42so212926306d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784650395; x=1785255195;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=16RyG3rd15UswS247w8Y2rBGrhgjsgtjs/mBo5jjAhc=;
        b=lWvZLKmEqDF5kyRRD4ZfXRMENYI1OEPQm0rLk2jhfxzBXyhlwo2Y+EvY+UsiQmT/BG
         skNLLIMltf6qWZbxOzuQ52t8IhfKRB5zwKBDQScv9cYI/Ns1JlL7DMjBuvTruqb+kSBz
         b3PJgaWu8XM+Xn+Knmkc3vp+GFqlbg/eQzAxMcx+IFcW1cQiQOc1aPrLGFqfDkrYaIAq
         OLK3JGcqeL6PfJbu2WzkQA4QIBbj1YhYpu5Oh/LOUGmvE7/I+K/flHObcmjYI/cuADP8
         0RZUoxjkNFxvNycXCFg1HmXmxt3/0bz7JYz/Hu+tadMtK9OogbuOmPGj8LliwggAHpjs
         Gv2A==
X-Gm-Message-State: AOJu0YwRe1AKMciydF1XyC2ZzgLngCbchHPU2ZctkUPzOG1QkfC44+up
	Ua6ENRgr4Z/pSgFzZHmh8FH3qtLe/815JwqcnlY5RPs8CW/+SfS8jUpZiuKMCTZZpqpfall3cVS
	3Bg3IrXQHLRPUA34vo6cxpDvKIU2GE6cnupZPyrgQx6VKSDFn/BYO5Tp4bIyXjEeZm+VLRESLkJ
	hw
X-Gm-Gg: AR+sD13ilkK0n9dy97yXqbnasQ8QYKkOntxmddUXK6iZSe6SdCRUgnY06Q0LlwPQQRE
	verPgh6/47wvhWYTNktwjhT4YEfi+LrSquPvT7MBoRVH9tK+MSzib8r372Qs1FzlJ5zlJCyxHuM
	qTzaWm7CVzDrpqacrTRyeGi8szuQfuNTowzo1m292sKtFoRQsUwkmBlPSqKMkFzFkEy8/sPkZIf
	2wprF/T9DIOiYQubJ+UYkhD0bzki5uKfBNoWsTYXw9XPO+MHdW8ASa5c5rUt9aKvil1jVk8hv6T
	RxR4OVV79uM024gukdosWaXA8tyrbb5+1Jn7AWZWzKCUJdTLNkbqDTiP+tXERuZcmbG7XAwUepl
	jmxYEndAUA2VWuTaZ9VGZW1R8eFK0TM/Z
X-Received: by 2002:ad4:5dc5:0:b0:8cc:de2:3b5d with SMTP id 6a1803df08f44-9077833676fmr208454836d6.16.1784650395268;
        Tue, 21 Jul 2026 09:13:15 -0700 (PDT)
X-Received: by 2002:ad4:5dc5:0:b0:8cc:de2:3b5d with SMTP id 6a1803df08f44-9077833676fmr208454366d6.16.1784650394783;
        Tue, 21 Jul 2026 09:13:14 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778543d85sm119008176d6.3.2026.07.21.09.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:13:14 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
Date: Tue, 21 Jul 2026 09:12:41 -0700
Subject: [PATCH v8] arm64: dts: s32g: Add GPR syscon region
MIME-Version: 1.0
Message-Id: <20260721-upstream-s32g-gpr-syscon-v8-1-49c308536aa6@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7Rio2hZW3sOwaOgUuoCSGSQSw
 t2tnMDle8l/fwchjiTQFDswrVFimjLYSwHd4KaeMPrMoEqlS1MZfM+yMLkR5aZ67GdG2aRLE5p
 HqJUOVlt/hzyfmUL8nOlXm3mIsiTezqfV/Owf0dVghURVbYOyRlv1ZPKDW65dGqE9juMLUKOvr
 MEAAAA=
X-Change-ID: 20260717-upstream-s32g-gpr-syscon-75f926f868d4
To: Chester Lin <chester62515@gmail.com>, 
 Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dan Carpenter <error27@gmail.com>, Jared Kangas <jkangas@redhat.com>, 
 Dan Carpenter <error27@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784650392; l=2767;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=lHjtYpzASvlxCVG3xK2x9n2hpQ6hZK9tKMMaQqJSCeY=;
 b=8ABgP1iCn05nj/pN7ivfiWkvV8wjCMbPOBY708QDHm/JR0QQ1ywmBsudLTLIbKYGcPDmFkhUx
 outpkTAD5lOCyizJF3VSDULxbbFxFlTpUNX5qZRSfFKfkCsoTG6Yb5j
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2viv-grg4J25FiSvyT-dW1l9d1wxR_t3mHgDz3ClyZI_1784650395
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_091322_446906_B561F1C9 
X-CRM114-Status: GOOD (  11.08  )
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

From: Dan Carpenter <error27@gmail.com>

Add the GPR syscon region for the s32 chipset.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
[jkangas@redhat.com: GPR syscon resized from 0x3000 to 0x100]
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
Revision of Dan's v6 patch based on discussion in [1] to avoid a panic
when reading the debugfs regmap's registers file.

[1]: https://lore.kernel.org/all/aej2X2Gp-UI3Vmvo@rh-jkangas-kernel/

v8: Correct gpr node ordering, drop T-b tag
v7: Shrink gpr size from 0x3000 -> 0x100, add 'arm64:' prefix to subject
v6: no change
v5: no change
v4: no change
v3: no change
v2: Remove #address-cells and #size-cells
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 6 ++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 809019ea0e299..29050aa5ae960 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -122,6 +122,11 @@ rtc0: rtc@40060000 {
 			clock-names = "ipg", "source0";
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32g2-gpr", "syscon";
+			reg = <0x4007c000 0x100>;
+		};
+
 		pinctrl: pinctrl@4009c240 {
 			compatible = "nxp,s32g2-siul2-pinctrl";
 				/* MSCR0-MSCR101 registers on siul2_0 */
@@ -795,6 +800,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			nxp,phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 22e80fc03f9c7..8baae30f9f192 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -180,6 +180,11 @@ rtc0: rtc@40060000 {
 			clock-names = "ipg", "source0";
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32g3-gpr", "syscon";
+			reg = <0x4007c000 0x100>;
+		};
+
 		pinctrl: pinctrl@4009c240 {
 			compatible = "nxp,s32g2-siul2-pinctrl";
 				/* MSCR0-MSCR101 registers on siul2_0 */
@@ -874,6 +879,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			nxp,phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";

---
base-commit: fce2dfa773ced15f27dd27cd0b482a7473cdcf2a
change-id: 20260717-upstream-s32g-gpr-syscon-75f926f868d4

Best regards,
-- 
Jared Kangas <jkangas@redhat.com>


