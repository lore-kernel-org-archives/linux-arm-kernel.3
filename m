Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14576109B473
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 14:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wmozg0m3DQsYpGD8orkO2ipP4TyyaAJHZKLp0sbHtfk=; b=PE1KmXPv2Y9nsim8w4dimmU7Oh
	u2bi18IS6xiTexCIPtnBAOvZAULq+j2/OpiYbuas/XPwvIfFdQskt7MoXPSgNgZ2KQiPZ52v3iEb1
	6/fD5IqZCCkdSwg2pxomWVUY1w8ahtojVtzaAnsHJUoe1OfRMsP4lRCjTqiqFhYqAeiE5j4t28TBX
	DwXlp/tteufFbS/aX42iZPsUDIrDbq0K0wofImUkG0POwJyaiF8AFB4Dlz7YC2BgzqDN4cg8bC8AU
	vwZdmusNYrIKeMwZFsqiTkDq0u28NtCGwYABY4Yn8ZXqX6LiyFsBpr8RU+I/zhq9l8n4qQtaULlAA
	vpXcjFug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Zv0-0000000D4Bd-0BWm;
	Tue, 31 Mar 2026 14:18:10 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Zux-0000000D4B9-0Mtn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 14:18:08 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-6501c4857b2so5653909d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 07:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774966685; x=1775571485; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wmozg0m3DQsYpGD8orkO2ipP4TyyaAJHZKLp0sbHtfk=;
        b=s0pHHTvqjAJpWe/gkJ923wEhPNKZKFMUZyL63leYr4/bcgoUfEot0jvzbN8K4heDIv
         xb/yWPw5u5JAeqpFcFCYy8uRb1i5CMS540BPCRKRVvfRNqwntaKcZq2O0WUhkRg0IF6s
         Tu5uLRHKFYVv8IlxGvrHiecBStJaPQkIER3Gly3Ihgyg6cEQJAPtR5on5pQcBSIuUg2G
         68vVPkiGzV7uyI+b/GsxDUj+qVzCcNKeMEhLCfNVsaq9sYEFQPNnf09Nse2JcM4GPP8d
         qlZv6a9wZaD7R1sTnqn6fWXiAIgReyQ3M9oYqbkGSeF6miUFhKADD6dHQxEo3pG3Q5jV
         R+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774966685; x=1775571485;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wmozg0m3DQsYpGD8orkO2ipP4TyyaAJHZKLp0sbHtfk=;
        b=XvDAxNt5LcwN6npziqHH3pHsAVbze4pTU4Alf3fEzvyY6RTFOy77KYJtONdNM35O46
         nq7W/LSbZAFG9GNou1BltUVkc7HJiE+QEOTPttx2BmyuliMR8rqd2E8r5aZC7NJtuC3V
         bEhdFjp5cZaaoU8AY9oraxANEioUMDnt3+5FqdIoEpcIeX318JP/3/G4lbv+YwPId7wf
         EqmW9M8GGYTwJpvnyKncviAZyKogBOefIzUY7cd7nF7CkirSnT2lIMdHAD3gaU7Cx9IN
         WxKSZOaZWcWQD9TB93wRx4VdFSJWRlal9G/OqRbgnaRPoXN6B8HD4KZN29EcNzDCXT4M
         39GA==
X-Forwarded-Encrypted: i=1; AJvYcCUErB6YyIvv1UdZoUtYGLtXl27WwYzrIX9uMULw2EFrOZNieI401HGEW5fa8+fwomkzjvPXTpVDK4uTJ0Vb7u79@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl784h3IhndsByldKflB5dcVZlzD64HSIwOey9rqgs2jELN0sy
	gBgwzIBFeZl1Mh57upgufFPT07lkhZWjFNuhiFPI38e/9SjKMZ9hpr/f
X-Gm-Gg: ATEYQzyPCig4LV4e0UWADtTpbQRY+DqFQA2xvdY/TGCVp5uC8lSC0d45PYZLW9VNSHS
	W7P2j3YvXwDi68kb0d6nGicckpCkgJaZ4m1iGd1jhhV6YETVOyjSG5YGT1qTw7Ft7JuvDO7VjTl
	xXHARXjQK4BlawGDGI6WhB0D5i6JkM2uEU7RrtiRmB/yh2eSr7o7+lWYGAFRN/vYylE28uRtEOu
	gGAGW9g9ltl3/LBIp+WnCIZxrPip+EJE/uf1s/p4M1X3/cMmyK9BO3t8EdGjnzgPUC6ksqyDDUi
	sY0VSAlZUEMz15pb1+YkWfjH2S4ipX9SQyVy6OFdfYvOyeBTY6M9lMXztRoBsmWLcmILFnwEJiZ
	2OFh7MkLJMu0KQF7HTS84eDoLRZdRH22RrBuQ9+OiUQ2f7ssMaMHyIiIWrebLvp6b1BCGJwuHTS
	4LJGb2uc4QjVSlo9Ug
X-Received: by 2002:a05:690e:4408:10b0:64d:6cf8:f8c with SMTP id 956f58d0204a3-64ff73d4236mr13831172d50.40.1774966685293;
        Tue, 31 Mar 2026 07:18:05 -0700 (PDT)
Received: from [192.168.2.165] ([2600:1700:220:59e0::914])
        by smtp.googlemail.com with ESMTPSA id 956f58d0204a3-65009326eddsm5590599d50.13.2026.03.31.07.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:18:04 -0700 (PDT)
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Tue, 31 Mar 2026 09:18:00 -0500
Subject: [PATCH v2] ARM: dts: aspeed: Enable networking for Asus Kommando
 IPMI Card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-asus-kommando-networking-v2-1-f7d72ae5d40d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOTU7DMBBGrxJ5jZF/iD3qinugLsb2JB2V2GCnA
 VTl7pj0ACzfSPO+dxeNKlMTp+EuKm3cuOQO5mkQ8YJ5JsmpszDKOGUNSGy3Jq9lWTCnIjOtX6V
 eOc9yjMppg+gCRNHfPypN/H2o384PrvR56wvr4ygCNpKxq3g9Dd6FF4pAU4oWwMcUJm9VQkPjC
 KCnqFGD90r8uS7c1lJ/jupNH7L/AzcttXQuWQUBYLTudV6Q3597gTjv+/4LK7ziOQwBAAA=
X-Change-ID: 20260328-asus-kommando-networking-5c0612aa6b8c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Anirudh Srinivasan <anirudhsriniv@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_071807_137078_66946146 
X-CRM114-Status: GOOD (  14.01  )
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

This DT was tested (on the OpenBMC u-boot fork [2]) with a u-boot DT
modified to insert clk delays of 0 (instead of patching u-boot itself).
[3] adds a u-boot DT for this device (without networking) and describes
how to patch it to add networking support. If this patched DT is used,
then networking works with rgmii-id phy mode in both u-boot and linux.

[1] https://lore.kernel.org/linux-aspeed/ef88bb50-9f2c-458d-a7e5-dc5ecb9c777a@lunn.ch/
[2] https://github.com/openbmc/u-boot/tree/v2019.04-aspeed-openbmc
[3] https://lore.kernel.org/openbmc/20260328-asus-kommando-v2-1-2a656f8cd314@gmail.com/

Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
---
This patch is based off aspeed/arm/dt from bmc tree
---
Changes in v2:
- Commit message now mentions that the u-boot tested against is the
  openbmc u-boot fork
- Link to v1: https://lore.kernel.org/r/20260328-asus-kommando-networking-v1-1-66d308b88536@gmail.com
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


