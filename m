Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7C9C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 06:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jvJSpWuqSHaTy3Hsey6pHPwU1ULTDl2WgXKxYEb5nE=; b=cUYGLh1CFOgO+owrmmpz5ZK8dQ
	CafMmPYt8ArnUeKkZFJPSRzaAuudf2HKrVAMFO5rMMCC9khCICCNzprlkzPlk0t+xD4r2T0qP9N0T
	WWgm9DVvhvPcorDDWDQmNg6vOUnLehsfFFG35ladNzqcaknKVzJ38GdmX+QAgqHm++IGS29AnCs3l
	JnNg7capRTCVVdVutd731S11rAL9sO0Nx26V/bKB5mCcEYmjvFKlmTvITvyU+nX0SjjhI54gb0sJT
	kfkU8w4b5sT6aDWsPFluVCUnb0nkY9S+XksGUjZhNtSLM/7eOpX6tAPdMduRw3vvFI/5JqNQ2C5WG
	BbQoldEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUwV-00000004DOu-3kpE;
	Tue, 01 Jul 2025 06:58:12 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUQl-000000048f8-0KTM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 06:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751351123; x=1782887123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/jvJSpWuqSHaTy3Hsey6pHPwU1ULTDl2WgXKxYEb5nE=;
  b=EXasPURbLfzE9w0vcDCkPSYn7WjXZ/Td1neVq+Lm3ji1u4ZiG7U+3lWS
   5ppQjoeeR0lbbTHoKisR2s/3iLu816tVIjo9YD22w9tmeJnjwVuyE93oW
   ntFJ5OciaBHIAVTPe1W/Aw5dcEaMyzHsjJxZ9A+idMsYQFBLUo3swtLLY
   829htj4CY5sfiZ654Zyc5iKlin0P3GMzyhRA3eTg1PwFnuy0Ov/jLmvQO
   9IqtCl3hfOgEd4FmpuOPsQ4RnNeozxN/f/9PFFPJ6VEq8uwug8o4LryaA
   yQV+mtGXvs2QWR+FvTU8SN2CTAhthF1qWoyJG9vW2VGQyXuc+QihBuwec
   w==;
X-CSE-ConnectionGUID: DPtb36mQTE2nfjHoEYrZLg==
X-CSE-MsgGUID: uUk3NebXRtGIIqDUH+l/3g==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943373"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:25:22 +0200
X-CheckPoint: {68637F52-1-497D558D-EBA6F5A1}
X-MAIL-CPID: B5B289A437088DE106602003F1F7351E_3
X-Control-Analysis: str=0001.0A006370.68637F79.0014,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81AA016A539;
	Tue,  1 Jul 2025 08:25:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751351117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/jvJSpWuqSHaTy3Hsey6pHPwU1ULTDl2WgXKxYEb5nE=;
	b=BOYfXq0yvd4lb4TmAw/ojWrR3oO8vsZ9PZWoXdFcKuJcLlTwmsDfAKL0jlCj3yOv4MOv9e
	7gIWhHLVLKWLVtqAPyAXHuJ1/M9ROe9TyxodzOvQMfQZfFsuavCBgerShDPAvIB6t5p0ZX
	KaPFfct5WPf+ALbDvk1D/43WTD7wluCTOBxORuP6hRxQvOYUr3nzVVbtC029YyxGSjSoix
	98UkNYhjUIAukUS9nEoWlzeB87Yb1VH7hnYg/Ix529KIywjqtKJScwDiFw4Qnvx1RquKix
	4lQN0BK7Ldbh3XxJDTA76qjHinHWbwtEymhQQpYFSyV8ZbsiuIPtrWjHZEkZ2g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 2/8] arm64: dts: fsl-ls1046a: Remove superfluous address and size cells
Date: Tue,  1 Jul 2025 08:24:50 +0200
Message-ID: <20250701062500.515735-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
References: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_232523_414893_F0B1D9A9 
X-CRM114-Status: UNSURE (   8.25  )
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

The jedec SPI-NOR flash node itself has no partitions, but the partitions
subnode.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi
index 4a8f8bc688f52..cafb35f674aa4 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi
@@ -17,8 +17,6 @@ &qspi {
 	qflash0: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 		spi-max-frequency = <62500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
-- 
2.43.0


