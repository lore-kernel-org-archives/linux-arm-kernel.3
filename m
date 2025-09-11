Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71FECAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 14:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwxCLnysq/NZQPnFGzZvZp4/1kftabIwqJTZB7qwRU8=; b=McHvkOPME+hdoM3RlzLy7z5j71
	DYMj25hECkwlPXXGYpdfXrTrp1AXxZCHyBbO7FpgHflFrWpEt3XthNraVi+IyFE4m/WWxxxTdtIgK
	KKZmROPBY+WEQ7liqy9nKMDMEM5TkSMsue/L+E+PrtXRVMCH6W9kcag1CcZFF9PMaJYHskLcKdq3x
	kCw7F4LttdrMBDHRHeVwUqa/ipNDwFrRbV67dC0JWuGttqYPbU+FBU6l1SfKEO7sLFc9CNXVgPNhi
	HVvhdyZAT9J7yw6N3FCBCPQfsfjhwfrXYn/TcM2pCdXtGmSjiU4xSavW6efusbXa/nh/RkAVp49h5
	WFbOIfpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwi6x-00000003Uct-2i41;
	Thu, 11 Sep 2025 14:17:19 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwi6s-00000003UbM-3BUz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 14:17:17 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250911141708epoutp0143e1b2ef957fd9d000280e840f62b0d0~kQBiZ72Vq1193611936epoutp01u
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 14:17:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250911141708epoutp0143e1b2ef957fd9d000280e840f62b0d0~kQBiZ72Vq1193611936epoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757600229;
	bh=gwxCLnysq/NZQPnFGzZvZp4/1kftabIwqJTZB7qwRU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mF7WodyZyowez10hhvI8cicy6CHY1B60Adww3K0V99BBEK73XUhNZR6pFekA9wDIA
	 Yj26wWP9NofOwfpAqlEjE0Iuxpxf86UQtftCMaVPVgj6OUk3sHg2huSgDRIcTN+300
	 bax6Gn6n1mcnbd4qkd8DrWTFhhpSdeu5wDE2f83c=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250911141708epcas5p22807e6c6a34b138c0c4c64d03a787988~kQBhzFHJD2246622466epcas5p2j;
	Thu, 11 Sep 2025 14:17:08 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.91]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cN04M2WY1z6B9m5; Thu, 11 Sep
	2025 14:17:07 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250911141706epcas5p29ba4f0af11e3a95a9754fd6255f7b5a7~kQBf-Mj1B0880308803epcas5p2X;
	Thu, 11 Sep 2025 14:17:06 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250911141702epsmtip11ecb960ff9fecf37f2cc9d9fe3c6ac0b~kQBcbig8N0084200842epsmtip19;
	Thu, 11 Sep 2025 14:17:02 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, jesper.nilsson@axis.com,
	lars.persson@axis.com, alim.akhtar@samsung.com, arnd@kernel.org,
	krzk@kernel.org
Cc: andriy.shevchenko@linux.intel.com, geert+renesas@glider.be,
	thierry.bultel.yh@bp.renesas.com, dianders@chromium.org,
	robert.marko@sartura.hr, schnelle@linux.ibm.com, kkartik@nvidia.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	ksk4725@coasia.com, kenkim@coasia.com, smn1196@coasia.com,
	pjsin865@coasia.com, shradha.t@samsung.com, Ravi Patel
	<ravi.patel@samsung.com>
Subject: [PATCH 1/3] dt-bindings: serial: samsung: Update axis,artpec8-uart
 to use samsung,uart-fifosize
Date: Thu, 11 Sep 2025 19:46:03 +0530
Message-ID: <20250911141605.13034-2-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250911141605.13034-1-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250911141706epcas5p29ba4f0af11e3a95a9754fd6255f7b5a7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250911141706epcas5p29ba4f0af11e3a95a9754fd6255f7b5a7
References: <20250911141605.13034-1-ravi.patel@samsung.com>
	<CGME20250911141706epcas5p29ba4f0af11e3a95a9754fd6255f7b5a7@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_071715_119357_47955566 
X-CRM114-Status: GOOD (  16.17  )
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

Update the axis,artpec8-uart compatible such that it uses the
samsung,uart-fifosize as required property.

This is to remove the axis,artpec8-uart specific code (which is
kind of duplicated) from the driver and use the other matching
exynos8895 uart code for ARTPEC-8.

Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 1a1f991d5364..08eceaae2921 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -152,7 +152,6 @@ allOf:
           contains:
             enum:
               - apple,s5l-uart
-              - axis,artpec8-uart
               - samsung,exynos4210-uart
               - samsung,exynos5433-uart
     then:
@@ -168,6 +167,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - axis,artpec8-uart
               - google,gs101-uart
               - samsung,exynos8895-uart
     then:
--
2.17.1


