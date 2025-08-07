Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B958C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 10:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=9EFIJet6GwguCOgHXt373HO19RdNPt1XWJDM2bajplk=; b=B38B3EafmVV5kP6ANas0bPXZJd
	7GuXYycbK6TljhKtJLs/O1wg0brxSAKZICOwHYDQuuFH0drJfKF2Qgn9sjo4m6WXUiEVfb+rT8aTB
	9hK9/if6Y0KLjCujWAx2lAI6vfcZ256uRo8mNtfdWLdg4IbVeuwUwro1r+GdKsO3KUoaqTQtSV8c/
	OJw7tpYo5eOaj9ozVKt2Z3dKjDshVVcgMGMo4NODD+pAL9H+WZZVRqnFKbJ9NchKvoJIBy8xa+OCB
	mfZiOLC5SKILfXZoSBVPdyK0HWLM8z84nn3+WfpYxTODnkLf0DEFRSs3pT0TpdLV2QZ/g2brDBKkq
	JyXhTUsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyFd-00000000IHn-0gWk;
	Thu, 07 Aug 2025 10:53:37 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyD6-00000000Hom-0VBY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 10:51:04 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250807105046epoutp03a162d0957d3fbd09843694a59686832f~ZdoWtLi_I0649906499epoutp03H
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 Aug 2025 10:50:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250807105046epoutp03a162d0957d3fbd09843694a59686832f~ZdoWtLi_I0649906499epoutp03H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754563846;
	bh=9EFIJet6GwguCOgHXt373HO19RdNPt1XWJDM2bajplk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=ppYXl6BUAVAeVZr16oTAuTzCiqe7yhCZS+FFgZzvF4nkidEBipqlnZylkV4VUzezu
	 CB2MBnBBTia4sRLvv5W4Z5g3ZJs3fIBqTRcepasnE5PQZyLIRAwSA7oHHnQdsqBTIM
	 W4HRgZNEHXl+bbwWKiLK/xzlWe3vfYCA3lEUb/6E=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250807105045epcas5p200483d0bdac63cb3b323ff857f67fdc1~ZdoWNaOIH1874618746epcas5p2P;
	Thu,  7 Aug 2025 10:50:45 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4byP8P11ymz2SSKf; Thu,  7 Aug
	2025 10:50:45 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250807032459epcas5p1d6bd796f5b654c92372bdcc8a7926c22~ZXjJEevMZ2629026290epcas5p1A;
	Thu,  7 Aug 2025 03:24:59 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032457epsmtip217c0a672ffd1a22f97b647b84be6597d~ZXjHGrzJG1346113461epsmtip29;
	Thu,  7 Aug 2025 03:24:57 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
	anindya.sg@samsung.com, Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: [PATCH 00/10] Use SoC-specific compatible string for Samsung MFC
Date: Thu,  7 Aug 2025 08:54:39 +0530
Message-ID: <20250807032449.92770-1-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250807032459epcas5p1d6bd796f5b654c92372bdcc8a7926c22
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250807032459epcas5p1d6bd796f5b654c92372bdcc8a7926c22
References: <CGME20250807032459epcas5p1d6bd796f5b654c92372bdcc8a7926c22@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_035100_460538_C8FF152A 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

This patch series modifies the samsung MFC version compatible to
SoC-specific compatible.

Aakarsh Jain (10):
  ARM: dts: samsung: exynos3250: Use SoC-specific compatible string for
    MFC
  ARM: dts: samsung: exynos4: Use SoC-specific compatible string for MFC
  ARM: dts: samsung: exynos5250: Use SoC-specific compatible string for
    MFC
  ARM: dts: samsung: exynos5420: Use SoC-specific compatible string for
    MFC
  ARM: dts: samsung: exynos5800: Use SoC-specific compatible string for
    MFC
  ARM: dts: samsung: s5pv210: Use SoC-specific compatible string for MFC
  media: s5p-mfc: Modify compatible string check for SoC-specific
    support
  media: s5p-mfc: Add new compatible string corresponding to S5pv210 SoC
  dt-bindings: media: s5p-mfc: Modify compatible string check for
    SoC-specific support
  dt-bindings: media: s5p-mfc: Add SoC-specific compatible for
    'samsung,mfc-v5'

 .../bindings/media/samsung,s5p-mfc.yaml       | 24 ++++++++++---------
 arch/arm/boot/dts/samsung/exynos3250.dtsi     |  2 +-
 arch/arm/boot/dts/samsung/exynos4.dtsi        |  2 +-
 arch/arm/boot/dts/samsung/exynos5250.dtsi     |  2 +-
 arch/arm/boot/dts/samsung/exynos5420.dtsi     |  2 +-
 arch/arm/boot/dts/samsung/exynos5800.dtsi     |  2 +-
 arch/arm/boot/dts/samsung/s5pv210.dtsi        |  2 +-
 .../media/platform/samsung/s5p-mfc/s5p_mfc.c  | 13 ++++++----
 8 files changed, 27 insertions(+), 22 deletions(-)

-- 
2.49.0


