Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42D2C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 23:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vmy0i3VZMA4HR325lbcOKfgC/mnsKmGPoPBOA/3Q7xg=; b=ql72Cln0c8cGc9pbieWU7JjFvV
	RFQUUu4yVX9M9qZ15bQB/L2D0bCCVCBDXISm1jR1DeTNAtGrcTbGiYyMrvZa40CUXnoMezgytpH7Z
	kjFR8NjprzZdP/dKWOqBwgeVHRJEjHyTxiybMyvHn97YtSUmlj/2D1zDwjjM8NjReswGfS3DCl3cY
	3NTUgbIbBn7JtmpljAyS8l/4hU35tQPAN1w4/ga+yLvFtYEcyxITGhnMIyoIu9Wd9Guf8QqfHxlVO
	76CmG0iceqg8v/v8GvikuoWxtZCpu3ovIWB5xulGmAMipXKQUTIQt201RAAFC7UqXyIaDlJaaKN92
	3pqY624A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyHsk-0000000FgjT-2Wpf;
	Sun, 23 Aug 2026 23:45:42 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyHsi-0000000Fgj4-2aV0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 23:45:41 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-8efb708b1a0so17532676d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 16:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787528739; x=1788133539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vmy0i3VZMA4HR325lbcOKfgC/mnsKmGPoPBOA/3Q7xg=;
        b=KWmQJ1b61/OEi74e47ME3uW+rffVqhiTKqU3km8iqntZKZinYBQOcAeHAZfvhD8/iH
         dyFCnu3ZARzXeGCW7dMyoTpdN/GxjCJ1sa8L18/oh1W0Kfo//2iG+rlHkPfNzhnj3O/x
         JV5EAhpFJkv64VA75+VbYJ37v7Nxc495QnRkZsXKUDBWla3N/1OoEKicoiaap7EH8phF
         nReddiR+Btm6m9jZrbnpyWN1Gqr/VMxhVByAO7AMR3SO5P3L6gwNJwbwaVQ/C22TjO+E
         uzM1Kr6o4ibVQKdeXJmCJGIT+l01dlo0aRzL8IICKztLk1VN4d9cW9Qm7anKlF/dGPPc
         aBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787528739; x=1788133539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vmy0i3VZMA4HR325lbcOKfgC/mnsKmGPoPBOA/3Q7xg=;
        b=GR03sXlihwoutujLIkrspexcffi8kUMvmPVZkLmBKv2N2K3S8VScPYIVLMTBfu+1q7
         4R+CfyqJKhP+/CAJlLsuS2sDXtYncupnQydFUdxAvMaJ3pVUd7DK01L4LRaKPMzduS60
         tVRymtaSSmWAIlxfZrR/hYwzrAOT8MwAGuEYGjfbuy09H8aouZIiT25NqJlJVx0BcoZn
         0FnFIPdziyxhoF5G6pETsvO/QCi29hpO1TLhx7t6sYzgG/NrINoO5WmBQet10kYbN4Mw
         ridNSPB1YyZlCB1Ql8f+MML2MHv39YRf4WuS+o0Djm+lNVCjYQFusdyYh6ZO6lrnP4zx
         JAOQ==
X-Forwarded-Encrypted: i=1; AHgh+RpsQfymySHBp1v3OLmmDtwxB4K3YXxCYaWaPZ1w+cBLBgmYAYql1S0yyXNuAXSgHYost/zcZWsR3+CNPRak5X1p@lists.infradead.org
X-Gm-Message-State: AFuF++kan6eB4S7cMx1V6XW8YnJyz2WewrD9qFJzU6yigs5if6Z75FpU
	Yudn2Y0duMVjKgXUCeVv26XljkCXT3OMeA8uC35F5DUm+byWe1ZMROb5
X-Gm-Gg: AR+sD10MySUFWC0qi0BlqLl6589g6CPyaYYOyK6vaOCzfX7+dr9eK8KoqY3hZs9nl1d
	h121+jYkizKdd5UGefW3nLUnvWaeGx3qbFWSotmD/P2tqcfXKtvQj0//pEcmK9iszdtk9dFmZ9M
	xpqSIuJxVvrYkGFDoTODvoymv/FtZCKQzPEzJXDdUNSvv+3woOATvslubo7p2fA4U0szzLUmwMp
	o1WRID3jnJHJbQcr/7Lrb3OQGzECW5FeF9RDVtg+6vpQINVvJNx4RwfF4zEVCvZiF7ngN2CLvqU
	b0In5uDlaqMAmcYlf68HbBb+0CJlyl5Bnk7wRLI7e8dJfI5B7nlySoisdIiDjjuW6kBv23nkL7j
	asoZQ59B8Yy4b3BsyV1kneTvpS3bgGHr/XzBBCkN3D/4wib7W1uBm0yLuuyUaKXtSgHMr/4/hwB
	MJg9qcGwAuc/tHtG8a/YNiDPSDKLXVbEiIiu62CezpuYQilHA3MtSinMxGsGISwF9GrZsrCqsWC
	j8T+HEe8XpIv+BCwhbjRzIXLCtz+LmbuIdkDpoL1fd3ba6Hi/fEOMnLnMRE/nQEPdpjBfiD0HTD
	cbQVXh5KiS4fDCTX8ES9mnhgtDk3O+5u8/nyIg==
X-Received: by 2002:ac8:5916:0:b0:50d:e471:2d1e with SMTP id d75a77b69052e-52df5a7e229mr226286061cf.35.1787528739209;
        Sun, 23 Aug 2026 16:45:39 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e099baf17sm36510031cf.12.2026.08.23.16.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 16:45:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Baruch Siach <baruch@tkos.co.il>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: armada-385-clearfog-gtr: fix vmmc property name
Date: Sun, 23 Aug 2026 16:45:35 -0700
Message-ID: <20260823234535.72052-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_164540_654889_D14378D7 
X-CRM114-Status: GOOD (  11.81  )
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

The SDHCI node references the 3.3V regulator through a bare "vmmc"
property, which is not part of the mmc controller DT binding; the
correct property is "vmmc-supply".

Fixes: aecc313490ae ("ARM: dts: mvebu: add support for SolidRun Clearfog GTR")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
index 48b09df53c60..3262b726a1c7 100644
--- a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
@@ -235,7 +235,7 @@ mmc@d8000 {
 				pinctrl-0 = <&cf_gtr_sdhci_pins>;
 				pinctrl-names = "default";
 				status = "okay";
-				vmmc = <&reg_3p3v>;
+				vmmc-supply = <&reg_3p3v>;
 				wp-inverted;
 			};
 
-- 
2.55.0


