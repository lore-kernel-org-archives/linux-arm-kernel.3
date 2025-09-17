Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2548FCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjHTiR3TP8U/dHiplS5lbpj1CbW/m/2exj5qmUp/EYw=; b=OpGB0/1oXGnmriAtCnAA1Ztl79
	JtIeRuQV+xZU4yHqxNXapV+1fTPlzOQvdH7xQc/UhFQM7pk0jvhsW7ezID/HV0rWUT+ACdhrEJ+y9
	gemJLkk1ONkN0qbp/5VckDxiktYiuEtt+Vq2nHvqNQ9zeg4M0c/zGwSYipeeZ0uLnp9Xvpuds9Cwl
	QTO3xkahfrkvSXXb5RnDJyB/ZFupxoEQBxCbSMWu6lTutHIWVdfIMRdgKZcpDKp8rHRAtegdfShSZ
	NwgpMcJKD/vfiO8FNRw4FQpw7em3ApUUQ+uh1Yqx/kNfNjZ7eVMG1XwOB5aXcoQqS/su0p1G9SoOz
	+fb0vWhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uym9s-0000000AOA7-2kEU;
	Wed, 17 Sep 2025 07:00:52 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uym9p-0000000AO7w-2kJr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 07:00:51 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250917070043epoutp033f45ae03d45ce92c148ef6a8e27cba94~l-8NLldLh2280022800epoutp03S
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 07:00:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250917070043epoutp033f45ae03d45ce92c148ef6a8e27cba94~l-8NLldLh2280022800epoutp03S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758092443;
	bh=AjHTiR3TP8U/dHiplS5lbpj1CbW/m/2exj5qmUp/EYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=apvk//ViSB0zCF6zsMpNVzZVZyHpNrA/+oaJ65ozZXRLqo/ZLD7Dtf00GoLxIf/Zf
	 tWJCS2PSNQzJok5g5PivQOs4Gl8JarJvnfD1cRcX0m6fLbxsG6CHAqJ/Pqj/ITfHhM
	 MLgteyO/ALEJBtBgt0TOyvMuvXWp1zacUdA2ANZE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250917070042epcas5p3c3921b9e9ea491fef55f93fc9a9c8eaa~l-8MUEMvw0930209302epcas5p3l;
	Wed, 17 Sep 2025 07:00:42 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cRV615SWvz6B9m8; Wed, 17 Sep
	2025 07:00:41 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250917070041epcas5p4729ea496eee0c1ec2f4c234a63f71f7d~l-8KqqV1y1470914709epcas5p4-;
	Wed, 17 Sep 2025 07:00:41 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250917070037epsmtip1266105bf74f13d80d8ee8c783b60254d~l-8HD8Mh-2848728487epsmtip1-;
	Wed, 17 Sep 2025 07:00:37 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, robh@kernel.org, conor+dt@kernel.org
Cc: tomasz.figa@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	ksk4725@coasia.com, pjsin865@coasia.com, gwk1013@coasia.com,
	bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com,
	lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, shradha.t@samsung.com, swathi.ks@samsung.com,
	kenkim@coasia.com, Ravi Patel <ravi.patel@samsung.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: samsung: Add compatible for
 ARTPEC-9 SoC
Date: Wed, 17 Sep 2025 12:30:03 +0530
Message-ID: <20250917070004.87872-2-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250917070004.87872-1-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250917070041epcas5p4729ea496eee0c1ec2f4c234a63f71f7d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250917070041epcas5p4729ea496eee0c1ec2f4c234a63f71f7d
References: <20250917070004.87872-1-ravi.patel@samsung.com>
	<CGME20250917070041epcas5p4729ea496eee0c1ec2f4c234a63f71f7d@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_000050_183014_A279EC87 
X-CRM114-Status: GOOD (  10.14  )
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

From: SeonGu Kang <ksk4725@coasia.com>

Document the compatible string for ARTPEC-9 SoC pinctrl block,
which is similar to other Samsung SoC pinctrl blocks.

Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index f1094d65e846..a2c16385bad3 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -36,6 +36,7 @@ properties:
   compatible:
     enum:
       - axis,artpec8-pinctrl
+      - axis,artpec9-pinctrl
       - google,gs101-pinctrl
       - samsung,s3c64xx-pinctrl
       - samsung,s5pv210-pinctrl
-- 
2.17.1


