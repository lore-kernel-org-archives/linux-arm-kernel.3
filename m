Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671DCE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 16:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGNlAokFjmhN1EyWyvNQ13rV62s826Uf7N3aP5+qRgI=; b=qgzYgby28RVKqlRfhP3Sn1CWiG
	dEPdJNDEwLmV8T0/C5A60Or5MmaFzUbgjEDZAn184KZ/5PoChyQvIm0zjF5m2HgAku7im0Pd+yiM1
	h8fQni965fxhZGj/H76dVuNLc9Dm9d2/4NthCIO9m6W1EYcjPjhR5kMfgChnM1YHFKTVnQv/szpSW
	i5dH5Iwb10XqV0Fz3M93pj/OqItBNBwcJEMjW09rtAn2LywrAzYoJgJ1j/JKOvZtJSNIgYjQigjOP
	POjE9Veodl1PnJlgZE1UOELjApM95UvH1q2KjuHz5wvhbkH9xMDTdv7vfysPs4XKd//oCQV7JgG9f
	DCvBZAqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEzw-0000000Go6t-0Wrt;
	Thu, 05 Dec 2024 16:46:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEwv-0000000Gn5f-2KNF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:43:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E2395C639D;
	Thu,  5 Dec 2024 16:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BECAEC4CEDD;
	Thu,  5 Dec 2024 16:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733417011;
	bh=zonr3mCcTyCgwR7d1gZNImuy1doROORC9hQH8Wi0Qyg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B8oc+62XcqZXJYDwzLdQHxQmjtDEty3a7JQFOJ0C0Edbj/d2bfrEcBuv5IQ8B1/6I
	 pLuWV4hK5IjYngf+Sd2IALqQRA61xTXnq4x11haER5s/IYRPA9gNRTYIIUaHiM4dtz
	 5SkI0uHnUuGZntafkU+iLJbq/D6OIGtO5dJEjkJRaZLaITLLcihZHaPM2AueAyV+G3
	 hJXBicRsgxNKT0OeD9jG1/A7VDTIQHmm2sbZj/aOf3uqv7zumdvktYJi/GgVoGhBCm
	 p3yib1MMTL5tEqUejwVTHD8aiRMBJrM9zWmlOOihI3fggWpJHkg0K04IHtU9aya57+
	 TjwEGYRFxkl2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7815E7716D;
	Thu,  5 Dec 2024 16:43:31 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Thu, 05 Dec 2024 17:42:58 +0100
Subject: [PATCH net-next v8 01/15] net: stmmac: Fix CSR divider comment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-upstream_s32cc_gmac-v8-1-ec1d180df815@oss.nxp.com>
References: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
In-Reply-To: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
 0x1207@gmail.com, fancer.lancer@gmail.com, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
 Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733417009; l=958;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=2KaIHv/oSTo3FOtKPvkHjEF7Z3D3rI5ymtYbTqdzAuo=;
 b=v8pvfQ8UAtPhcdINtdsR/HinWMhi87hDMqA2bUaESoiOXT0yKZSWa3bAQ70f2YH6jc3aLZyRV
 y5PdyrHt1rvBDETp2KAy9KF3HHtfsuJZrbEbJFNcPj5qW7cGAh8YN0U
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_084333_677954_2707A07E 
X-CRM114-Status: GOOD (  11.36  )
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

The comment in declaration of STMMAC_CSR_250_300M
incorrectly describes the constant as '/* MDC = clk_scr_i/122 */'
but the DWC Ether QOS Handbook version 5.20a says it is
CSR clock/124.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 include/linux/stmmac.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index d79ff252cfdc..75cbfb576358 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -33,7 +33,7 @@
 #define	STMMAC_CSR_20_35M	0x2	/* MDC = clk_scr_i/16 */
 #define	STMMAC_CSR_35_60M	0x3	/* MDC = clk_scr_i/26 */
 #define	STMMAC_CSR_150_250M	0x4	/* MDC = clk_scr_i/102 */
-#define	STMMAC_CSR_250_300M	0x5	/* MDC = clk_scr_i/122 */
+#define	STMMAC_CSR_250_300M	0x5	/* MDC = clk_scr_i/124 */
 
 /* MTL algorithms identifiers */
 #define MTL_TX_ALGORITHM_WRR	0x0

-- 
2.47.0



