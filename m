Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A6610D1487
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 23:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D6KQA/Fx9D9/4JQMN8XwpW8Ndz5zn5yIIrnM3uQJKv4=; b=Qk93pX5qKmKRkCKEYQkqGCTiZZ
	2vcBMPYICmYCD7MP5GhOwRKxwiySux4l1QIQUcVwzHVxgBTFEkYEZwsTkevjTKOWN+owRQlZGn+rK
	VszaYX9Oi16uMOtSQhVh8DTRlptdIrJDtlWuNtPs2vxP0DiEvCC1v8/I+xldbZC0JU3iEYK114aD/
	I2U0pz8uhf+yV6Fy88NUO3cC2XOw9Y9e0y0ZsqhATKIy5QTXTd9kzlU82NxW5BLktQuxg4A4xCF/P
	/bidDYI2dOi2+yVaPyVCLyH5scTo77tnKdy/vXZSTeXk3tGMDj2q2Ry9YODTx5URLgL0e4omWV06d
	jLL1y5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6dGM-00000009OTk-0bBL;
	Sat, 28 Mar 2026 23:40:18 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6dGJ-00000009OTJ-2BRt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 23:40:17 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-64fc6b21789so2664792d50.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 16:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774741213; x=1775346013; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D6KQA/Fx9D9/4JQMN8XwpW8Ndz5zn5yIIrnM3uQJKv4=;
        b=tMjHQCI3Yrc3tl5JjvJ7fJdCAQwMyd5pUtqT+FtNexvl50tcIFDdbEBuMYyuCsElMC
         7NPJRHMZ9l+56++rBM+VtHOGe9Rtws7b8uhaPQRnO9FV3/CzMt+SrOIJkog8Uf4lylBK
         CEQoyHGqj9GFMKSxQzpqmkO5XADVAhbeP+fT3u1vCz3J0FPsnfVBvSMBSib3cTWjCLnU
         RGtSkneYYEa5ih5HLIoNMzm9QJtpR5TYWaazEVjz3YSI9BmbpeZ06ltuRcOhsEO3hglH
         lTx1dHY8p2lcpRTgdVItcmhd3ik07QvpGmIFg768skUQqnW+dGZVHaR66HJ7iFpewmrC
         wwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774741213; x=1775346013;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6KQA/Fx9D9/4JQMN8XwpW8Ndz5zn5yIIrnM3uQJKv4=;
        b=fHlZBBg44JrRVxv0sTMMypDZI2IlSqmai7z6bZWmMOmUf4kBHcyJFBXy/NGpjY8qKo
         z2SmR0q1haN8vpAhScqywhOLAY/Yn1BFxP9JzJzFG9EATKGVeArcKaPxxDyODZ8l5DEr
         84lahUpB0hZjNOUXVu7hcUrzXQ81X97mmuNrXV0Psjl1P/qhDup/2IGOYwLT02zmMJ+k
         Zkn3ovVEd150w2OiDYttQxfCIubZR5qK4lFH9PfZdVzAfTljRM7b2PyEQpkKmdj7bFL7
         X68XRxFvNr9/llfmg41DX3mlnodg8URdIoOcNM4goaWLNU8tNONXA/h/hEh3Txsi5the
         ucEA==
X-Forwarded-Encrypted: i=1; AJvYcCX8y/2Lf+UH9jqQ6x9Ro1BpkUj7EKgHRttqb4QdhP/Sq7N2uBX0KBzLs+2QRv3kCeKObfBgcfwLXt0K3Vk/4vsz@lists.infradead.org
X-Gm-Message-State: AOJu0YwoRvlWH3F2ENqVgyGwu/+vvLP8ga4cDX50Id8rfzJ75LPxjrgl
	7ShOi4MQ6xmm2bxOHYTXlxvx6Mf8kIF6Axy8oor7xg0hyhOQwhTiOk1V
X-Gm-Gg: ATEYQzygWuU1IvwKZDULlGqGW6jPfL3XDSRZ4cRlevFse/mOvpdlRz9GmVrUnCzsDM8
	3JhY4xJc0kU9uxdAzT85C2tARWVpNiMKLRmF0KF9GS9en1BMzBtYSe+nArX+fJJAegZUCXJj4Jm
	a75wrvmPREufgk4QOBl+e2OaJ+zW/dntWMAuw7ThlkxEE0C4qJZPQbbBnjD8doBjCDvgLUE7PZy
	wKdfnjS29KpX6M5ZTQ/y2WfA99RVfX/+mI4ydXLVS4/b4/E0QLNASePAiPG4Gwfqv6pNBv9boZF
	1Ok+6lEUyKw7PkV2D73YOSBFppGfOpnnb+ZnVERqbnJ+Pi8lLUnPN909L8CUvPlobXIuZl88mcg
	TWRFslnvSBgILQgDyOLi540i3GKwIiY2B1FMG23bnJx1VxrycaeX6nGanC1NYz3TgqJpGlXbcjC
	k8NU60vqvPaazLiu5I
X-Received: by 2002:a05:690c:387:b0:798:3be8:b68a with SMTP id 00721157ae682-79bde0b7b15mr78629767b3.56.1774741213414;
        Sat, 28 Mar 2026 16:40:13 -0700 (PDT)
Received: from [192.168.2.165] ([2600:1700:220:59e0::914])
        by smtp.googlemail.com with ESMTPSA id 00721157ae682-79cba66cf09sm15559127b3.43.2026.03.28.16.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 16:40:12 -0700 (PDT)
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Sat, 28 Mar 2026 18:39:59 -0500
Subject: [PATCH] ARM: dts: aspeed: Enable networking for Asus Kommando IPMI
 Card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-asus-kommando-networking-v1-1-66d308b88536@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQrDIBAFfyXsuYKaRqW/UnLQdU0lRFtN2kLIv
 1ea4wy8eTtUKpEq3LodCr1jjTk1EJcO8GHTRCz6xiC5VLyXhtm6VTbnZbHJZ5Zo/eQyxzSxAbk
 S0lrlDEKbPwuF+P2n7+PJhV5be1hPCc5WYthScb11WrkroaHgsTdGo3dB99xbScNgjAgorDBac
 xiP4wfEBxgrtgAAAA==
X-Change-ID: 20260328-asus-kommando-networking-5c0612aa6b8c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Anirudh Srinivasan <anirudhsriniv@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_164015_603719_729BC8D4 
X-CRM114-Status: GOOD (  13.17  )
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

Adds the DT nodes needed for ethernet support for Asus Kommando, with
phy mode set to rgmii-id.

When this DT was originally added, the phy mode was set to rgmii (which
was incorrect). It was suggested to remove networking support from the
DT till the Aspeed networking driver was patched so that the correct phy
mode could be used.

The discussion in [1] mentions that u-boot was inserting clk delays that
weren't needed, which resulted in needing to set the phy mode in linux
to rgmii incorrectly. The solution suggested there was to patch u-boot to
no longer insert these clk delays and use rgmii-id as the phy mode for
any future DTs added to linux.

This DT was tested with a u-boot DT modified to insert clk delays of 0
(instead of patching u-boot itself). [2] adds a u-boot DT for this
device (without networking) and describes how to patch it to add
networking support. If this patched DT is used, then networking works
with rgmii-id phy mode in both u-boot and linux.

[1] https://lore.kernel.org/linux-aspeed/ef88bb50-9f2c-458d-a7e5-dc5ecb9c777a@lunn.ch/
[2] https://lore.kernel.org/openbmc/20260328-asus-kommando-v2-1-2a656f8cd314@gmail.com/

Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
---
This patch is based off aspeed/arm/dt from bmc tree
---
 .../dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
index ab7ad320067c1ddc0fea9ac386fd488c8ef28184..e0f7d92efa18ccbad2c336236c3b9d01b7de1bba 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
@@ -107,6 +107,24 @@ &gpio1 {
 	/*18E0 32*/ "","","","","","","","";
 };
 
+&mac2 {
+	status = "okay";
+
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii3_default>;
+};
+
+&mdio2 {
+	status = "okay";
+
+	ethphy2: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
 &vhub {
 	status = "okay";
 };

---
base-commit: 76b4ec8efdc3887cdbf730da2e55881fc1a18770
change-id: 20260328-asus-kommando-networking-5c0612aa6b8c

Best regards,
-- 
Anirudh Srinivasan <anirudhsriniv@gmail.com>


