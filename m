Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD04CA5FA9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqRtnc/P+rZ8ziC43+o+bBxfq5eQjgc6WRa/25o2wJM=; b=LDAKiIb15SUCnbG82iwvoYOkl0
	R03zD0/4aRGAfi3lOHyp69K7TznqcNPJRpARJ8yFImxN1BkMfH3cGJs2ETsl3ltbV8aQyDfST0Jl7
	s3VTTR0d2QTVIMuoCdz5Zqpj8hqxbFOdi78V6OXsqduzheXzBvIiIq+tbJbX3+XWl56s/KHuHxzS2
	ZHW9pO5EH3I1z4Q437IRA7q5pZVY0Jqgl/5C6exB6HRryLZmyQXvrzi3v4H2xvHkKthuajIsDZLPJ
	Yx8Q5FxjMNk35cv2ufLEHe/BwDIlweEba+zPGvlResJEbHPbyc9engRrzViXKtyOPfAJYGSlIVaGw
	R9neDR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHJX-00000001V6E-2nue;
	Mon, 28 Sep 2026 19:47:03 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHIh-00000001UbL-45st
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:46:13 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48884b926f0so2211110f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 12:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790624770; x=1791229570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqRtnc/P+rZ8ziC43+o+bBxfq5eQjgc6WRa/25o2wJM=;
        b=e/TCH2w/PENC4e14UdUMtakCwlk/3nku/Gs2213jV5ah/ggIMQ0KlvdeV7w09u8qPE
         aA2l6tC9suf3q/HtrYBZWeIUwDPYhsf4gMkBCIHOgjl2wO9OcCUrC0bmOfh6flrsU+5u
         Q1c3Dw+MAfIdAcZumesoExtHEbGCe1BGFf32CTgb9agkDHHC5EFuYuaIicd54f3s8GLN
         v68CuNts7nAFwX9sCfAyre2NkQulku8bF1BbEuuVALYfwHVk2tlflfooaOVooRSKAHb4
         RHwtuY3GlfMujdm7QBpjmyeA6LhFJvgdCSKnNILXkcSxsJ7epwdMTcJhS3FDTvu3aCF+
         0DFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624770; x=1791229570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qqRtnc/P+rZ8ziC43+o+bBxfq5eQjgc6WRa/25o2wJM=;
        b=CKp5Ui4X57H12UObGZJTSJiDJFMklQzCB6p4cuJMhcCU8FzBtKPMEbrqGSU7mHwrrO
         gLY47Sws3Zh9YAm5iYIHiZ59S/16UAt/4Wmr5nM15q2JlFmgLZ0bIDPADeOm4vT+5j+P
         npJHF1Y0iE0ZEDZ1sC711ES/u7BRdLHDr0/wQYi/lAgIqx0pwh0jjmlNs86JBHiAA68x
         Ryj4aOIWFbr8oX0pPwk3tPQn6xElCwQO/gNnUK7w29X7ecRhdHo5EPyOSsATF1/i8W/l
         9gVGnx2cSLAjI/XwWag/8b0ARO/jgk5GTRBDIUCsFSxyIRAxEBB+FHU9PSh34NEJv7VX
         5vvA==
X-Forwarded-Encrypted: i=1; AKwUvBxbJC3lyrpy0FGO1Ps1rUxQMnkT7JCPXDm+MmUS+k0yXjwr2VHq6cvR9uJkTiIipsNbfKsyZyLvGhLTxNq09hQh@lists.infradead.org
X-Gm-Message-State: AFq9FYLEJNjs90Aby8Hpa9CD4/Hb1R+6c4UZdow1CxrOzpABJKql9nbL
	cUMtzD5XUN2ELGDpO/twghrNUQUy/vMy9LdIZwGJQBwnMb08Eh62XsiG
X-Gm-Gg: AYBFou1TtSAXdHbd7qSicZyAWUTdu8LlesQQo456+8Bz75wso6tylpB7NTi3Mjj6ba6
	BgoSMFi1ZuQZybIBXweLbaDTyzZYsEz3jBHQHFZ5E4Se3yTVWh7xNyrl0I0vuqFfsMeu1SxJ/el
	1ofdsm61Iou24jnwIHe0gaFfmAcnOSyltgR/lfNMLc1f0z8IYToMr/phNP0JNe0qolkgnzPyAG8
	NkAoBK0mj+nU38c6Isf4HzcC1KYqIBoa2Guf9kr8kunCLhYh+70UOdvOLikosrhfWgDyNvHJ5VK
	+IGXNzEgC1D+eQbb7HWvUNVEaiNSKJOTV+12togYskVXlaa95dSc48JLG2Sad/w1w0p4bU9OHaF
	CxEW06bDSYWfT8Tg1CSfNhfftOLA1EAHiv6xa1ctJNrmqI+LL2czX+hlJCeIXe2pJd5cXlCCXlZ
	ZhEaTkMysgakPSgy3AyhSP2XI+Hht8HhXBqV4p2TcdtjQKieL7zaSs9N1R8kegs7r5/8IzoRllT
	K8vCgNZXhC54GGIxUxwITYM5yhLxiAMmuTp7dCaYQqT94em0O+p5vmu98epXYlm
X-Received: by 2002:a05:6000:3110:b0:485:ac35:5c5d with SMTP id ffacd0b85a97d-48871725321mr27594766f8f.15.1790624770026;
        Mon, 28 Sep 2026 12:46:10 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48af071532dsm1527706f8f.20.2026.09.28.12.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:46:09 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v24 07/10] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Mon, 28 Sep 2026 21:45:06 +0200
Message-ID: <20260928194511.41878-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928194511.41878-1-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_124612_062147_95B391C8 
X-CRM114-Status: GOOD (  11.62  )
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

Add myself as maintainer for AN8855 DSA driver and all the related
subdriver (mfd, mdio, phy, nvmem)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6de1ff058db6..59e6385b2c50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -759,6 +759,22 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA AN8855 DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/dsa/mediatek/an8855.c
+F:	drivers/net/dsa/mediatek/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.55.0


