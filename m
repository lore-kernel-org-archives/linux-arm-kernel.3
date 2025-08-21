Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20066CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 16:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PE3v8D25w1NSW00QvTsGVwt89i4GMdjJys8VXXhPJ7s=; b=xdtq42l0RhvwzM/YB5tnn+gUUy
	AVbiIZRBatvgS5EJXYT4pguAFOaH7bPnRlu4SuIxPWAETGxaif3JNwSPYwVrX3ZEFeI+aavOZoGdC
	T9sVK4QSJVKKZ5MmHu+ILJ85oGiYbV1xX5ZN9KpzjjbC8NFCi/dA2GX3kxPONap9f4rsArO9j7mec
	ypXToVtiwkgmpdpQvtVAwPd4rt5hw1mAXBJHy+jqErRO43GhTY36kTAj55NpfzJyodfe3/Eicjv66
	J/tWwceCqDL+tGlN1OrJysJ9v7XcjUyyTUs2/6gg82j3JZPws96kkPRLlkU06EpU5eiSx+aVU6VDd
	AvD0698Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up8Cl-0000000HY86-0kql;
	Thu, 21 Aug 2025 16:32:01 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4av-0000000GvaV-2Vqb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 12:40:43 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250821124037epoutp03f15f5c8c801917d43e684e7663c91869~dyKRQcIlx1135411354epoutp03U
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 12:40:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250821124037epoutp03f15f5c8c801917d43e684e7663c91869~dyKRQcIlx1135411354epoutp03U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755780037;
	bh=PE3v8D25w1NSW00QvTsGVwt89i4GMdjJys8VXXhPJ7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bqzsp/nWGhnOupn8PiRThHgaEVHAWMxfuhNXT/Nl87ykYBZlpRCMeAKhb6Hfp5Ou2
	 ROJz2tw1G+oPTdfj4UBvrMykzEi8WQN68Meo3HQXOvpvD3sDwn4V6mHl6y6i68M+Z4
	 NOdXj9AXU7K3qd0q3aAyU2QyvphMrMPyhzFiae+Y=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250821124036epcas5p23d4b1358a0f10a01045f50880154c3e0~dyKP1or6v1778717787epcas5p27;
	Thu, 21 Aug 2025 12:40:36 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c72wg2Ddgz2SSKZ; Thu, 21 Aug
	2025 12:40:35 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250821124034epcas5p350aeb42b9065fcbc3d9f713df1649574~dyKOZMGE41856118561epcas5p3J;
	Thu, 21 Aug 2025 12:40:34 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250821124029epsmtip2a1ba9abee1996f1a7280719efaf5a2f6~dyKJ3_XqU2369523695epsmtip2e;
	Thu, 21 Aug 2025 12:40:29 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com, inbaraj.e@samsung.com, swathi.ks@samsung.com,
	hrishikesh.d@samsung.com, dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, soc@lists.linux.dev
Subject: [PATCH v2 04/10] dt-bindings: pinctrl: samsung: Add compatible for
 ARTPEC-8 SoC
Date: Thu, 21 Aug 2025 18:02:48 +0530
Message-ID: <20250821123310.94089-5-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250821123310.94089-1-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250821124034epcas5p350aeb42b9065fcbc3d9f713df1649574
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821124034epcas5p350aeb42b9065fcbc3d9f713df1649574
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<20250821123310.94089-1-ravi.patel@samsung.com>
	<CGME20250821124034epcas5p350aeb42b9065fcbc3d9f713df1649574@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_054041_952652_DF35EFBF 
X-CRM114-Status: GOOD (  10.26  )
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

Document the compatible string for ARTPEC-8 SoC pinctrl block,
which is similar to other Samsung SoC pinctrl blocks.

Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index de8460856141..9386dcd418c2 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -35,6 +35,7 @@ properties:
 
   compatible:
     enum:
+      - axis,artpec8-pinctrl
       - google,gs101-pinctrl
       - samsung,s3c2412-pinctrl
       - samsung,s3c2416-pinctrl
-- 
2.49.0


