Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A001C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvto0JJZPgTYBlf+D9ZijX+skHY5ekmlXWbOdJ/XB2g=; b=AotOAulBK8aYHvs91TAJuA7PTM
	536L1q//IxtdDdOIH3dnsQLdQ8cWJuDlBd+pFFJfzm0VswDQi4ud4u9t4TPpyeN4FCDcjdsroeZj8
	3ytV3DRusIVr+UEn3k0OavoT5RZh6a9QoizE1XBjJAUY0vUZR5+aOj97vQLV/MMm8slsgNlehqEwS
	6t/LDphvjwATpU37duHF77LLCzWT+tBunV4KEoOHCdB8a/LVNs0ilEoG7YnFCvIpyslw/HBYxDMB1
	Q23/R9oLzfE+VTX3d/Ofwz6+3FFT8255itVbahmwO0SP0smeXsB6U1kcqTSojrWXfaXomAtp32ojJ
	WsDW2F5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTee-00000009eZ6-1IIr;
	Tue, 18 Feb 2025 19:53:16 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSsz-00000009UV6-1xsR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 19:04:02 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 42CFE25D64;
	Tue, 18 Feb 2025 20:04:00 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gTCgDbQS4Qo; Tue, 18 Feb 2025 20:03:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739905436; bh=gRa4BGEIswwEsGXvPWhdz3Z3M6ubWO9JJBcgXyWQLWc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WLxBCxAoQV0OPtz8bw0dySYBDsiEFQ0WFUH0qS27DDO5BIkXWqAujA5/5X9c7ZeG3
	 1OIrnDKegMKOENWI9eCRsI4XW8cujyHqg2L/GLYvrzMCioS/NSicil2XG79tQbrBEo
	 aFhGa6vxUPsU32A503ejQfOVQlCnSVdv0m2X8ox4BlwJHJ92G7JuHgM/Vjiq91YIgt
	 j0+aBwEcuxQKyxzR+I4GJE2piTxs7U4+rkcdu4Zv1KVO+14lUXFOb7E+vW1d5t31br
	 BLNO7u+Iv91l0hzsQqn6tRBEdI70oGOSmarO4ABEVfVtWivQhgchZZmz9M0it7FB7i
	 eaHq1ssxViOBQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:33:13 +0530
Subject: [PATCH v3 3/7] soc: samsung: exynos-chipid: add support for
 exynos7870
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-v3-3-e384fb610cad@disroot.org>
References: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
In-Reply-To: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739905418; l=803;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=gRa4BGEIswwEsGXvPWhdz3Z3M6ubWO9JJBcgXyWQLWc=;
 b=XOHjxr0b49Dt1Rd3h/NsPWA1sn23LwExP5oocNbm6XcjieQeR4TSs1j6oB6UBEHgUR21emrRq
 DRXJsBt0t0kDhQLrAUy1CnOfpcOWHhNNj99NpcDeKR27KQWMzPjp/XK
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_110401_644786_5CBAA77C 
X-CRM114-Status: UNSURE (   9.56  )
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

Add the product ID of Exynos7870 (S5E7870) to the existing list.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 95294462ff21130951bd3c940d979af182423789..fd9aeacd01a8ad016156729659178ea1b9b0c56a 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -55,6 +55,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS5440", 0xE5440000 },
 	{ "EXYNOS5800", 0xE5422000 },
 	{ "EXYNOS7420", 0xE7420000 },
+	{ "EXYNOS7870", 0xE7870000 },
 	/* Compatible with: samsung,exynos850-chipid */
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },

-- 
2.48.1


