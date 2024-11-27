Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F449D6ACF4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 16:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9azNNhaWuPAfFs9DSNTPEvOM+I77JF+eKXGxfYhoI4=; b=uy+pPcAMOVCP5Kspv1VFJtDQO0
	6M+OmU3hmTHalLIrpVwDLhhNcXVeANsWoI7pXrqxAkvCMZ380+TuUrsCmxLkPrhijo8S57/LMCh3Y
	8r6gK4Oej8kx8QNXaB5JoTHJ8ufkGZnOh2OuUrm4va8B6/iakSFbGJ3CN2/n3KpW/ngj+4yz0Mvek
	HN0r58Zomycimyq5jT/wcWuVm5lodi8gN29qD8KYerAL7IuYxoWij2PEhOddzQ8DXyPTEWl1H/UeT
	9cj85RP7Dey61j8ixSLcBp7/dZUr4WqSCmvNxM5zIXxRnYFtF5146sV2tkcvUPuRNaOp9i4iKcWwi
	k7VX/mIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLAa-0000000DfXn-2dKS;
	Wed, 27 Nov 2024 16:45:40 +0000
Received: from mail.fris.de ([2a01:4f8:c2c:390b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGL9a-0000000DfCu-3EGc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 16:44:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D59B5BFB90;
	Wed, 27 Nov 2024 17:44:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1732725871; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=h9azNNhaWuPAfFs9DSNTPEvOM+I77JF+eKXGxfYhoI4=;
	b=eZgYKECNx0QOlu12zh/r3KYDjPyIZru9stiH6XPzsCfT1x7w46uziaYCVM7dD6bHqKzEJd
	WFcfJ0/43XogZEhTvl5rWziHt5LyCDnyAo0pajq2xuLu1Zqr7IJG6M5bsYk05mciKEFhr2
	3IA1Vqs8VXn5hRDp5Bd2yUZkspUIKixr02KmAaLSJDKQ+2l3Cd+iCdtMYgVmkZhxXVOkzJ
	7jeLb7fos5OeVB8yyS6Tcf94bShjteJ80TwCF/l/MiW0yyXyfnGOu/xTim5epeB18HvZOh
	Bp5KSOwG+jSaKBUwbm6S3WyDYs4wGvS5p7jhawECglqF6iCsc4ypyg6385dnfA==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Robin Gong <yibin.gong@nxp.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Joy Zou <joy.zou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 01/11] Revert "regulator: pca9450: Add sd-vsel GPIO"
Date: Wed, 27 Nov 2024 17:42:17 +0100
Message-ID: <20241127164337.613915-2-frieder@fris.de>
In-Reply-To: <20241127164337.613915-1-frieder@fris.de>
References: <20241127164337.613915-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_084439_239125_D47E8D1E 
X-CRM114-Status: GOOD (  11.07  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This reverts commit 27866e3e8a7e93494f8374f48061aa73ee46ceb2.

It turned out that this feature was implemented based on
the wrong assumption that the SD_VSEL signal needs to be
controlled as GPIO in any case.

In fact the straight-forward approach is to mux the signal
as USDHC_VSELECT and let the USDHC controller do the job.

Most users never even used this property and the few who
did have been or are getting migrated to the alternative
approach.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v2:
* split revert into separate patch
---
 .../devicetree/bindings/regulator/nxp,pca9450-regulator.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
index f8057bba747a5..79fc0baf5fa2f 100644
--- a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
@@ -77,11 +77,6 @@ properties:
 
     additionalProperties: false
 
-  sd-vsel-gpios:
-    description: GPIO that is used to switch LDO5 between being configured by
-      LDO5CTRL_L or LDO5CTRL_H register. Use this if the SD_VSEL signal is
-      connected to a host GPIO.
-
   nxp,i2c-lt-enable:
     type: boolean
     description:
-- 
2.46.1


