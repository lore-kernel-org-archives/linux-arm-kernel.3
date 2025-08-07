Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1472BC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 11:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GwPUR26iklzPWT6ODiapbWvC4FwmQLsc6pho+4ru+s=; b=NNfrr9fCktyelypr7mm0zpAIjI
	6K8xNkvltq4e+pPlSz2K6a3sTc6lvX7H6Kla2ay785kwFnZtBNzRIpDYhJla4uJSSUX3+eiXQulRj
	F3X8eEM6dGZgY4VscJwr30h2QAplbNy4EGvkmqvitYmo5TC9LMIwoYPFXaNTfHCOeQlNkphqFO8+s
	FFKaZeMiSl6XDEDTPLxZ5s33sHflFKoZzgF6q0t9BZ3GDmDg6hqxanOmfweRsnyFPJd9wuAp746f8
	G4YaNLm9srvW7/Q5AwtIjyKkLeXvRuTMerANbcOSxzYfkRqQaaZcq0OkYqP3LTluofrMOCNBLsWEV
	fWtDwnTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyRt-00000000KNb-3I5M;
	Thu, 07 Aug 2025 11:06:18 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyFT-00000000IF6-1hBa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 10:53:29 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250807105322epoutp01edd0193b5ecd5d1c8512adb0e572d72d~ZdqnxlAcm1197811978epoutp01N
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 Aug 2025 10:53:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250807105322epoutp01edd0193b5ecd5d1c8512adb0e572d72d~ZdqnxlAcm1197811978epoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754564002;
	bh=+GwPUR26iklzPWT6ODiapbWvC4FwmQLsc6pho+4ru+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PtHOQbOgR688rw+V96AF1JJMsexEuw2+2czn3x6QszxHLcP1O08/l1f07uQYvQQKc
	 aE1iRmL15sQ6wDt1nvjXcfIcvL5Vdo3mhw1YHmb9VeihMKrUEJy2rP+XMneC9VqZow
	 jOilcgutdxdJLEnUFYlmZ8Z+URsJUp5hoA+yexhk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250807105321epcas5p3bdc86d2f45040914aff49fd1d5743f4b~ZdqnSfM9V3110331103epcas5p35;
	Thu,  7 Aug 2025 10:53:21 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4byPCN3tYJz3hhT7; Thu,  7 Aug
	2025 10:53:20 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032515epcas5p294e3bb229552cdcff28fa24691c3534a~ZXjYIN0Lg0047300473epcas5p2a;
	Thu,  7 Aug 2025 03:25:15 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032513epsmtip2c47251e3e4770eea99704a4f9001deb1~ZXjWHi5Lv1491114911epsmtip2Y;
	Thu,  7 Aug 2025 03:25:13 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
	anindya.sg@samsung.com, Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: [PATCH 05/10] ARM: dts: samsung: exynos5800: Use SoC-specific
 compatible string for MFC
Date: Thu,  7 Aug 2025 08:54:44 +0530
Message-ID: <20250807032449.92770-6-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807032449.92770-1-aakarsh.jain@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250807032515epcas5p294e3bb229552cdcff28fa24691c3534a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250807032515epcas5p294e3bb229552cdcff28fa24691c3534a
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
	<CGME20250807032515epcas5p294e3bb229552cdcff28fa24691c3534a@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_035327_602153_7ACF97A0 
X-CRM114-Status: GOOD (  16.33  )
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

Modify the MFC device tree node to use a SoC-specific
compatible string instead of a generic one.

Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
 arch/arm/boot/dts/samsung/exynos5800.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos5800.dtsi b/arch/arm/boot/dts/samsung/exynos5800.dtsi
index 72d3a3535a7a..8abaf79165a6 100644
--- a/arch/arm/boot/dts/samsung/exynos5800.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5800.dtsi
@@ -153,7 +153,7 @@ &dsi {
 };
 
 &mfc {
-	compatible = "samsung,mfc-v8";
+	compatible = "samsung,exynos5800-mfc";
 };
 
 &soc {
-- 
2.49.0


