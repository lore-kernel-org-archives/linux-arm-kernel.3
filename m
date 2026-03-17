Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E97AFD8756
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 12:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JWEUgV2342X6jiRVtCFNtlvF+3T7N34UBOgJmY6l/Rs=; b=QRlYf6MjoKBfGm6zqLt0iOpG2J
	UR5PpruCYUTvhyGLm3i4rqlq43iTT8xHj2E69TlZ5023Tsvey0wYvzsTg/O4oFn2p7r6dKz14lc2j
	CtZFPtouGdkUHo1IJG1ftGumCWEkYWoRGjiSrLwuxZ2B7kKBbeDoV+L+C60gpg6MJl23T7Oz3G/fg
	3UyNtA1wYoPty3yvZUv8cEeX8OVDAfu8KkSoC/BjCwOz/d4/DCA92P+zvmkaE3mmbhzOn51aoX67N
	wH9f449ZpdBJx/zBwre8xoz2SpB11xCXMNJxXIaXqBK7xtdxLkXXWP33PbuNw8I7JaKQBSQxaFcp7
	gx4hZprQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TcJ-00000006Iss-3yNI;
	Tue, 17 Mar 2026 12:33:47 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TcG-00000006Irx-29X4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 12:33:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48540355459so54826735e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 05:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773750822; x=1774355622; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JWEUgV2342X6jiRVtCFNtlvF+3T7N34UBOgJmY6l/Rs=;
        b=MryVhcCJkT7Q/Ec6KZuDyNEFewQEqo5+GgGlKWHWrfCAy+TUVyJjlT2mpT663dQNlv
         01o67Wvud27vZ8T/2ehDE+7Zm6RIbnuxahSY5PciOyYNpektMgfI9IlgQILK5Hp5lSGe
         +ZljxMLAhl3u0iZjamZsxOzH2wG+nn/I/eYk21obfxzlccEsq6Ibb2E/eJuFcXRQ9IoB
         0YUGxqqzTGcxY/nCdePXu4cghEgOGf+qqqQtt5rAZ4nCkrJhKrT30bmdxg3MzOrCMdTQ
         h0ZMCGaA/ILGUgLlYVQLIwTFHtUETY+JOBI8BgaV9MYo772cHw03jBdnGc5Hy0dsF1Nd
         FAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773750822; x=1774355622;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWEUgV2342X6jiRVtCFNtlvF+3T7N34UBOgJmY6l/Rs=;
        b=X50aO7O8j9a1eBnEh4c+iE916NqlpWGucVEeAfR+2liE6kN3kZIMDSATqygf2/gBU1
         YyV0mSxbkLet1Lai7MRiNGw3Yhtg+DjzZszaxpRQZkrvtotEbiYNDNnxt07fxGankhT8
         QNu+LOpJs9roNfX8cfe87Y0kHJ500NOA85PVyBce6eCQNiXNOBHl8pJ6TGyD0wyxxqfb
         iJubst3AtuWqFdwM91UH53ImKGDOzA4m58W4LTwT2T36QHTnXJUFR/4vwhkCRp0EQsEk
         xxWg9D6cJJyBKq4Q0FVoZbnsMx6bMa2hQoVK9bVMw0woDjceNGJCugxqjgMB4FkbUNc0
         8Vlg==
X-Gm-Message-State: AOJu0Ywv9N4ZyRzoUjxL0/r1UJJukxqEQ+B8eLORo3ueX6o57KSxPCv6
	4BluDUiqZ8uDuGuNHXHH4tqj5WAFqUVmS2q6xBX/iNfdGwIsQ8zqlszx
X-Gm-Gg: ATEYQzwAQHnc5OrlYwFLEd15ktRS0v2c9/Dbl/CfoBGr2ymCMRHTDdEB+KLNthjHqMF
	S92Yk+GhBRe4Fbrb0N//KErhzpAQt8+LmYCkGG42MPIs79wvmIPVon7j4DHX+76ZJ9Qa7uyLVt+
	ZeG345VccpXD1BXz+2Bm0yaqdrz/zQKexJaBStsiEiYNZvK7YgRlLGxrIeWJM2xn6NYF7gFZBeh
	r+2XjGeUex6wTBfeoOmvQaA8bul2ykqWLWgCudvf+ketateGs9CAJkDS1krf3s//6pz/VDGOrxS
	0tr6FrzLhVyfXR+0ha27S+dH5tAQuPGOKfd2fT2uFgZGm+5BWvX443GbZyGb3hvryqpdPUBfMhl
	6DDmpthn74Sj0qwAVagxXHYuUKfeey9J64GX2lbywrcFJMc7WcWNv5UMH0VPct8HtTa+qSFl47A
	XB0dENjDQM+w/lsnhsIprRl8x+s0VXD2/iDNRO4HMw/P8VOd5dp0ht
X-Received: by 2002:a05:600d:8489:20b0:485:3812:36dc with SMTP id 5b1f17b1804b1-485566d9068mr210984635e9.9.1773750821994;
        Tue, 17 Mar 2026 05:33:41 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4856ea96828sm111917355e9.5.2026.03.17.05.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:33:41 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 17 Mar 2026 13:33:32 +0100
Subject: [PATCH v2] arm64: dts: marvell: armada-37xx: drop
 'marvell,usb-misc-reg' from USB host nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-armada-37xx-drop-usb-misc-reg-v2-1-ddff72114414@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQQ6CMBCF4auQWTumBSzgynsYFqWMMImlZKoEQ
 7i7lRO4/N7ifxtEEqYI12wDoYUjhykhP2XgRjsNhNwnQ65yowpVohVve4tFta7YS5jxHTv0HB0
 KDUiNKS5lUztLBlJjFnrwevTvbfLI8RXkc9wt+rf+W140aqyVcrqrStNV9jZ4y8+zCx7afd+/f
 sJPisoAAAA=
X-Change-ID: 20260304-armada-37xx-drop-usb-misc-reg-e9635498cae6
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_053344_576651_EE112229 
X-CRM114-Status: GOOD (  15.63  )
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

The 'marvell,usb-misc-reg' property is present both in the EHCI and
in the XHCI USB host device nodes, however it is not documented. Thus
'make dtbs_check' produces warnings like these:

  /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
          from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
  /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
          from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml

Apart from the fact that the properties are not documented, those are
not even used by any USB host drivers. Due to this, drop the properties
in order to get rid of the warnings.

Note:

With the same name, there is a property used for the Armada 3700 USB
UTMI PHYs of which dt-bindings documentation has been added in commit
e60958699afa ("dt-bindings: phy: mvebu-utmi: add UTMI PHY bindings").

Additionally, the property is handled by the 'phy-mvebu-a3700-utmi'
driver since commit cc8b7a0ae866 ("phy: add A3700 UTMI PHY driver").

When the nodes of the UTMI PHYs has been added to the SoC dtsi by
commit 05d168a56fae ("arm64: dts: marvell: armada-37xx: declare USB2
UTMI PHYs"), the properties has been added to the USB host controller
nodes also. According to the commit message this was intentional,
however in regard to the USB hosts, neither the respective documentation,
nor driver support has been added into the tree since that.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - add Reviewed-by tag from Andrew
  - change subject and reword commit message
  - Link to v1: https://lore.kernel.org/r/20260304-armada-37xx-drop-usb-misc-reg-v1-1-800c1b746b7a@gmail.com
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index ea1824f5321fbb32fc4373c08a0d94bca1dc793b..44c47409f8793ae1266303607812ef481edbfbc5 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -369,7 +369,6 @@ usb3: usb@58000 {
 				compatible = "marvell,armada3700-xhci",
 				"generic-xhci";
 				reg = <0x58000 0x4000>;
-				marvell,usb-misc-reg = <&usb32_syscon>;
 				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&sb_periph_clk 12>;
 				phys = <&comphy0 0>, <&usb2_utmi_otg_phy>;
@@ -393,7 +392,6 @@ usb32_syscon: system-controller@5d800 {
 			usb2: usb@5e000 {
 				compatible = "marvell,armada-3700-ehci";
 				reg = <0x5e000 0x1000>;
-				marvell,usb-misc-reg = <&usb2_syscon>;
 				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usb2_utmi_host_phy>;
 				phy-names = "usb";

---
base-commit: 98226a594f313442fcba38cefc1df0b6c1691c7e
change-id: 20260304-armada-37xx-drop-usb-misc-reg-e9635498cae6

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


