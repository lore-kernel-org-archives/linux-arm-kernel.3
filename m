Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD62C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 07:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ga3qyzMoZilCY7ey+Tpyr8hgVvSITFqdTm2ZHDsEJVE=; b=xi/svJBXYBSBEzxFmPwtbOKYkd
	Wf7LNTf/uTaVLQJLo07KuXbwAU9dKdQCkYNYD6RLNlr0UJOulaNyaIbRFD81UahRhvXaPAi5yXvM1
	iMzN6WeZ37OaKd8b2u75vsxmue33qM8HEHb2PYslOLIPKNWrHGithR9MZ5ibDy53fKvAzexiHavO3
	3clLBDEy40JlmEo01i6YEw76USgvt+6ab2Vi0wQ0lRUg3FS64WQQisJ8R6TbhcbOjPQlQStzLTFwZ
	SJSY1X/tO99K12EybBFAHz37J1KVMOCmJDaiEUtezzstQXtaCpkGSpyTg/ou+twvgsXwnev5NG+sa
	281mKvSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HUa-00000007Psj-211K;
	Wed, 23 Sep 2026 07:34:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HUO-00000007PqT-3uKP
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 07:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ga3qyzMoZilCY7ey+Tpyr8hgVvSITFqdTm2ZHDsEJVE=; b=tx75Zch0Ibo4AMHcknNo9pkCy0
	g9FKsq0C0tKoQcpDa+0E148eVplEYItPOdxaMylcvxRmABcCJdCIfqu1ivaE93fWlU4ZGR9b46w45
	9q8dTXCsEbWpCSYF/kEmqINPLP2i2GAvvCfMjodfO4w7YDG3GbqGihunpgFgFV+mHvDvvmRKUC8YJ
	brorkWNqZeSaEW+3ALXgIOMHlpNvZQiyLR8+tbgh6QTQWOnCThSGEqrd/mSo08AoSWc213c/lwz8b
	d087jRwoISibsHI1tBSrORjIeXFuj0pr/GXxiahKuxE8SvNG8jrhP+ckNBHqKQUBNSWS9OtQHa7Ap
	Tu5nMDSQ==;
Received: from cp2.siel.si ([46.19.12.180])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HUM-0000000CD1S-0Ddc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 07:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ga3qyzMoZilCY7ey+Tpyr8hgVvSITFqdTm2ZHDsEJVE=; b=cIbtTtrcmPW3vkTjiYSTMTHEmI
	m6y3WBXG50ncm9PliRTCtrzIATWBuGr+xW7U+ojHkzKS0ZPT+TPdibE+nZr0mmB8vgnpllV8Y0M+5
	GjAr273xZACx/SmmsHVgpAC3iZkkBuA24HpOrvLmUNOn1AklI2BD9ZnWehzCnT42EHTmQ+CtjcuD+
	apsfhDIr+vdngzl1ZmvoOBanNI5AQ8Xlj5V5jzftpUnb/y6WOj+f5L99MDQ8cUduKcv4wY3l68Av7
	WbK3sj95a/MufKj7+pYZdflFMglQfHVXlvaHrhcStvPsaZMSF8C6iuCjwyQbeQgS6pHhzDBMyxV3c
	vTtf4MYQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:33340 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <primoz.fiser@norik.com>)
	id 1x9H2S-00000009mhH-2NHf;
	Wed, 23 Sep 2026 09:05:07 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de,
	Yunus Bas <y.bas@phytec.de>
Subject: [PATCH 1/2] ARM: dts: imx6dl: Add a label to cpu1 node
Date: Wed, 23 Sep 2026 09:05:04 +0200
Message-Id: <20260923070505.494949-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923070505.494949-1-primoz.fiser@norik.com>
References: <20260923070505.494949-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_083358_154266_5BC3AB57 
X-CRM114-Status: UNSURE (   7.96  )
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

From: Yunus Bas <y.bas@phytec.de>

The cpu1 is missing a label for further reference. Since cpu0 has
already a label, add also one for cpu1 node, so it can be referenced to
add or modify cpu specific properties the same way as cpu0.

Signed-off-by: Yunus Bas <y.bas@phytec.de>
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm/boot/dts/nxp/imx/imx6dl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl.dtsi
index dc919e09a505..78092d94f265 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl.dtsi
@@ -48,7 +48,7 @@ cpu0: cpu@0 {
 			nvmem-cell-names = "speed_grade";
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			compatible = "arm,cortex-a9";
 			device_type = "cpu";
 			reg = <1>;
-- 
2.34.1


