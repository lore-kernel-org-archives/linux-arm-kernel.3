Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54654CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhdCUOJguwRxW0Me6zDM1dADDQ0Txm6u4urbm0RY+sY=; b=2J/ahLNosOslwFt7iLZlcQ+FEB
	q0P0Brwa2q8HZVaVvEFD211ulwMCQ96Prx3mY+mBZ2bDoiV7+2QjMNbh97JnhRQiPapuMqfeB6H7v
	CWbSqwlcktf+lOnnd3FbHbttLrcdou+SesQejZXnGOUuC0BbEtKQKXaGixmboZSuVd/qJ95E/KyX/
	r5BQ7DcIkGZ9SM4HpPxYJRAwB5qlKHMlP4Rl1NIjq6fRwpZMw1lk+wEqUi4kRRiVzTWW1mqjJcGDB
	bqgZ3FEs91tc+28Os8mkveWpJ4xPC5S+NI9Mm9m5vqo5BVKo42THRb1HSSWPPg0pSxoq3NGVLd0r+
	Q3jpbFDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5vZ-00000001ITn-3z0l;
	Wed, 29 Oct 2025 13:09:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5vY-00000001ISG-0ZSY
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 13:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mhdCUOJguwRxW0Me6zDM1dADDQ0Txm6u4urbm0RY+sY=; b=GGj6OieiEHeELpf4Uhp8QCY3/8
	bjp92nZTjLChFyAv/cipQWLDJUF4Oe8dMZCNuJRN083gUR9JkNdowh148LD5MVbNr6fuGnC6R1C1q
	bV0IXCqNJCj8TciWEnmxAOGmuMaWTg4worRQRfxFrDDXV4gm/2X558D73MnboVAyHSa1W7zAza4rp
	lkRNa8PIJ6UCTUxUzupq1jGpblT4CXxy3fkKsRnCLyOjlfY4LHQHDVTuYA9UvfKE207aGNdZD08H+
	ITNjjtHD32bVLTlarTP2c9BVwgy+VqXVcg5cnGoipuUrVijmo0IJc4RAInrZYJvf5QJvl5DeZmnR9
	4A2QY+bQ==;
Received: from mailout1.samsung.com ([203.254.224.24])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE53l-00000006lqr-2B8D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 12:13:51 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251029130915epoutp01ff6f55690999b9059a7e5256fce37b50~y_D_CMZzw0858808588epoutp01B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 13:09:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251029130915epoutp01ff6f55690999b9059a7e5256fce37b50~y_D_CMZzw0858808588epoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761743355;
	bh=mhdCUOJguwRxW0Me6zDM1dADDQ0Txm6u4urbm0RY+sY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F0bjp2pvXZzSe9z4xpB0A9o7CfsedzMP+nonWQoLrSGd9+/sd+0VNviFOO86Qkvcn
	 GwBUC+xGljVPf4btFlDtbtalMcxyI9RyONiIMIkHUYgH2VWz9fargriXNLdhVHEe1v
	 J90dpC4kdTAxMaT83iVIVErLynCZAFqviEm9iJCs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20251029130914epcas5p1d645530f0d84d710a5b3096904e87d8f~y_D8guElW2691926919epcas5p1t;
	Wed, 29 Oct 2025 13:09:14 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cxSHs2873z3hhT3; Wed, 29 Oct
	2025 13:09:13 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251029130912epcas5p2f6596fefe3fe5513958b8209e78fa2c6~y_D6vKxIV3210832108epcas5p2o;
	Wed, 29 Oct 2025 13:09:12 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251029130900epsmtip26950c5dad6ff42f9f52bc58d8e51c136~y_DvcRhBp1199811998epsmtip2e;
	Wed, 29 Oct 2025 13:08:59 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com,
	sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
	cw00.choi@samsung.com
Cc: ravi.patel@samsung.com, ksk4725@coasia.com, smn1196@coasia.com,
	linux-arm-kernel@axis.com, krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
	jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
	hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com,
	swathi.ks@samsung.com, kenkim@coasia.com
Subject: [PATCH v3 4/4] dt-bindings: samsung: exynos-pmu: Add compatible for
 ARTPEC-9 SoC
Date: Wed, 29 Oct 2025 18:37:31 +0530
Message-Id: <20251029130731.51305-5-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251029130731.51305-1-ravi.patel@samsung.com>
X-CMS-MailID: 20251029130912epcas5p2f6596fefe3fe5513958b8209e78fa2c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251029130912epcas5p2f6596fefe3fe5513958b8209e78fa2c6
References: <20251029130731.51305-1-ravi.patel@samsung.com>
	<CGME20251029130912epcas5p2f6596fefe3fe5513958b8209e78fa2c6@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_121350_196236_4C103410 
X-CRM114-Status: GOOD (  13.31  )
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

From: SungMin Park <smn1196@coasia.com>

Add Axis ARTPEC-9 pmu compatible to the bindings documentation.
It reuses the older samsung,exynos7-pmu design.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index be1441193fee..9d3e8e9817fb 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -52,6 +52,7 @@ properties:
           - const: syscon
       - items:
           - enum:
+              - axis,artpec9-pmu
               - samsung,exynos2200-pmu
               - samsung,exynos7870-pmu
               - samsung,exynos7885-pmu
--
2.17.1


