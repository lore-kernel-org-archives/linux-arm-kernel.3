Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D203DCCA46D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 07:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0i4EWzFPDrCBGPxvUTW0hZsml2U+08zpz7E33Xi4YAg=; b=HGrjhknRLsSV7Jm/DqTSAWTTsS
	tUsCEz+FFGPkh5mpsWePZ5Nbx3bbgIWCcsDSTdgI+nu0udfpd3nBJPrIk60jb8/IhRNek2Nzyh0Az
	vlDkCWgKd4d1kTWpubsYdG5rFWGADYAi8IlLAg4wPGEZqwUbQQ5R6R/rDaxYLg/GCb6YbVO3VL7hh
	lFzhmLMDPXHitXtQb6Eto3wiIH8FPyqtWzbMvSKIU7ZSCUHlOs9PCwVujSPTq/6AwGi9uYsls9XrL
	ubQLobA+jvTO09y7kHpaWdfiXaj/E2OqA+lfI2YuOab9EPLOcsRCJgMln1Hkq+c8Nd2MMatqK/2Xj
	pu0K1eLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHc7J-00000002D6z-21MO;
	Fri, 16 Oct 2026 07:12:37 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHc7H-00000002D6C-2tqB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 07:12:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso12939235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 00:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792134752; x=1792739552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0i4EWzFPDrCBGPxvUTW0hZsml2U+08zpz7E33Xi4YAg=;
        b=r5rev4b2apw6NI+63hkesSXVgpJdk3UGhSuqQQv+QXT7PUnNxHtWnf1eCmbygwmvd4
         APLAnnGYdDaMXF3Ad6mdm00fm3KqBNg4n/d/+NyAwTh8g1zi40e7hRlRmF4ohswzxVo1
         lgghhYEXmQ86YftOmDzDQrKLiW7MqyeOJnWm6u4Bx+zqHrPlsoPlbfEOSmXCFc6xpPgu
         qaSWEpM3wHoveYezHoA/4tc6nhG90D1DVErOs/nkEzwQvfBcV4ou5JNpDsOPp6njXLaf
         GN2z2aZ+XTkAu18Gg+qq/MfAmq8wJQu98kARkAmnVcMXMDmj4NSNlT8dAiDahz7xQfh2
         A7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792134752; x=1792739552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0i4EWzFPDrCBGPxvUTW0hZsml2U+08zpz7E33Xi4YAg=;
        b=NGD63tg8YOTUtGnO6+1aE/++gNE07KF1v8mPqt8cpMzX7mNBdrh4sYk6oxwf7Axvai
         Pv4zEGxeE5IRKHWqqWf42Gh/u6OOzVriLk8F6QTsRtRWhmbLNB5aVBqOLPg9u1+6aDXd
         XNoBktjgfPBzNCWtThggsrAY11oiTS8gX8hRemqdnDZ4SsHAbtNjxjwWGs5GRNYl1eIh
         AR6ZDGJRD8Y/9VsqkEexsMaC15bTwYtf6UHg0w5BB9MUZ4uZ3o9Zt9mJF4vqdbtD3mgL
         2jBjVe7KxBQkoWtROGTIUgnX5pHE6gyub2NKp3Hq7XPvJJPfCpI0u2VcgYukPjqjsKLS
         EXqg==
X-Forwarded-Encrypted: i=1; AKwUvBxB2Fy+T1jYw0+b685nIW5TCOuCJR/tT1EwLcD5dsju+EU3rj81EXN8giC4REawrzYKyMu951bQLh3ulFzgPhow@lists.infradead.org
X-Gm-Message-State: AFq9FYKdWoAe3f0ukB7ti2Ak0vH7Ri6dCrfzohk3YXKD2oBX0kY4vLk3
	cbk8XJFAehfl6alIMra08Wb8+YsVKAtb2X8f1dXlRnLBFSkfAa59v2iK
X-Gm-Gg: AYBFou10hptV6IxHg5IFMOKFmnqBxNKXU+uaP+kVzMiYqhAlffwKTiDYsEqxpd0yoez
	c7MTO/n1AuaLGFdgwUCWGj8PSHZaKslFdpdcixcN9cc47iu9u4h8EPn7ZiJ0EeEc6IxgpzZ5+mW
	l0lxsASj0YP7k0SsaXrriQjUOuhKeu6UEglVXdL7FjFfnjuY4a0pbp7NUSlsbrBOV87eqKxdCMR
	VCJ5JWPpK3Y4UWb1KJYNt31p5zX2nhj0CcdA1y+sTu/k9d6XmJq4Qt+zjIim0RY+7KU1GL4Vkq8
	ygxdsT55eSexE3ygDj7+R7wltsifAAdS1xfAI9ElQaYOq+AwsF4j/x66JovyUjiQ0U8t9likCnt
	2AMp410NXxrzdDXMkNOhznFsA52w93cQJXqg0qxmXhiPAI/eSHJWg0NGhI5r4kvsXsB5fYB/Qsp
	9S0TAyPz1Qd/ZPZzNH6QBTFeefYCrJZzCbQEFXKP8DKpb1qfA1FQ/usRJ+N+RdWjsWhuRMeoFTo
	T0CkYcAJRgWpyus6XJsBTvFkBWbB/VR+nDrnGFUfAdVD94dXLRCDsjt/+chIDAquM9Ok+7j8GLp
	/FdtscVvij4q4PVoj0ozKnID
X-Received: by 2002:a05:600c:4504:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-4a18e4a7839mr459117355e9.25.1792134752197;
        Fri, 16 Oct 2026 00:12:32 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a1b377sm61802015e9.0.2026.10.16.00.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:12:30 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] phy: airoha: add support for AN7583 PCIe PHY driver
Date: Fri, 16 Oct 2026 09:12:22 +0200
Message-ID: <20261016071225.2092-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_001235_737380_71B8583A 
X-CRM114-Status: GOOD (  13.16  )
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

This small series introduce support for Airoha AN7583 Gen3 PCIe PHY.

It's not possible to reuse the EN7581 code as the register changed between
the 2 SoC and also the setup method changed (different calibration logic)

Putting the PHY in a dedicated directory is also needed for other series
current pending that will add USB PHY support.

Also a dedicated schema is added as the register names is entirely
different compared to EN7581.

Changes v4:
- Add REGMAP_MMIO to kconfig
- Better handle exit
- Add additional info on QPHY usage

Changes v3:
- Improve example for Documentation patch
- Deinit G3 PHY on QPHY error

Changes v2:
- Drop move patch (handled in different series)
- Rework to regmap implementation
- Rename files to more specific name
- Add .exit logic
- Drop QPHY in favor of external PHY handling
- Update schema with new requirement and improve example
  Link: https://lore.kernel.org/all/20260827122127.18874-1-ansuelsmth@gmail.com/

Christian Marangi (2):
  dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
  phy: airoha: add support for AN7583 Gen3 PCIe PHY driver

 .../phy/airoha,an7583-pcie-gen3-phy.yaml      |  65 ++
 MAINTAINERS                                   |   8 +
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   3 +-
 drivers/phy/airoha/Kconfig                    |  14 +
 drivers/phy/airoha/Makefile                   |   2 +
 drivers/phy/airoha/phy-an7583-pcie-regs.h     | 377 ++++++++
 drivers/phy/airoha/phy-an7583-pcie.c          | 823 ++++++++++++++++++
 8 files changed, 1292 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie.c

-- 
2.55.0


