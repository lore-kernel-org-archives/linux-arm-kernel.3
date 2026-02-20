Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD695C56204
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 15:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhvqRKEdBFpg6Tb3T3Vs34pdHi/UJgksuj201a6fjtY=; b=z5pd87vqmhWe1xLHur+0Z0fdBM
	7L9whBVTSsY5lvpiY6WELFnBFIsBq/0vUkm7cTb+FaYNWn7zRI15d5M7Fcin+NC3HA3mYufl829Gc
	Uz53EHzkH6sU1b8wMRCzWCjm5e6FcVuZZwqcfF2bzhgz/rXrIR1hQaatSi5TSruOHDG9QVfM7AO/z
	8j5/7CbcWOpDVJ0am4LZjZBb8y8uRq82vyktHk1L6zkoRASxaY09V8lOKGKuQvomH6qq5POouC+2A
	qn3jb1WuduwYXG7mgXQgE+eh3YuM7znSy/C35sbeMSV4/4Kjl/cQqpI/o+826S5Nh9q6rDu2Gy2Qt
	nS6R60Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRz1-0000000Ev9p-3dsd;
	Fri, 20 Feb 2026 14:59:55 +0000
Received: from mx-relay116-hz1.antispameurope.com ([94.100.132.108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRyv-0000000Ev70-3hkY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:59:51 +0000
ARC-Authentication-Results: i=1; mx-gate116-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=lhvqRKEdBFpg6Tb3T3Vs34pdHi/UJgksuj201a6fjtY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771599581;
 b=h8Eb8RtSadXhqSyDClCkzzzrhejKe47tKCpacXxBZum/ycMVQbGpIrakRFv1/9o+HTeeBKRO
 09quvd117LILyb9gEo1zhnn5Zdr80gu13M4Z/g4WHHmWOdJPU3/K/ulSv6qSbTtHXqJcQ4qcvW/
 1mo+7kQPW2AAaykN7BtJYwa3HeNxyzyFVw4ARabJ+Z1rGBOGqz9zHNzktPjgQY1D+mo+LucdSE7
 VEmvmh+5FoCnaFiJG3SlZws0I4QhIxo+hr/uJs42DXKVxBEByFlEpYbwe2nvZx3nXY3Mxd0tQyH
 zJ0YuTPhQk08aOiPqr1f3YFc98X1qHs78TBDvaeUz7DXQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771599581;
 b=JFIND1lHxG0heUwnkFNWNb5T/xH5YKFlAfAdQybxdai5abJyPRilZ3ItDody8i6pdDHkpihi
 UinRDfGmKeyx13nCBK328FoZwX7rmPJPKfoSAxiDnHajOpFDV4LgsDldG7DaQjMp6LvZtvr5lDw
 1BhqUeu9VpJ52YPY6KCdjORUdPk4kuo4Pl3OkqQQPUJKUhtpBjB6WY2T0hNJneL4jX9f9/anz2X
 jS/Tkr8CuzdjfrLNejk00kaqlSH+B9902uiJgtFtn+rARKe8XXqJU3w8PIqRhv/zsCwUZSKBON8
 PZAbiFlaQUE0qT/cV9RBcdpXzvRF3FBztAfPN50opqrlQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay116-hz1.antispameurope.com;
 Fri, 20 Feb 2026 15:59:41 +0100
Received: from FEILKEA-LNX-W.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 9BEB9220C4E;
	Fri, 20 Feb 2026 15:59:22 +0100 (CET)
From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
To: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexander Feilke <alexander.feilke@ew.tq-group.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
Subject: [PATCH v2 3/3] ARM: dts: imx7-mba7: Deassert BOOT_EN after boot
Date: Fri, 20 Feb 2026 15:59:09 +0100
Message-ID: <20260220145917.1797286-4-Alexander.Feilke@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
References: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.feilke@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.feilke@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay116-hz1.antispameurope.com with 4fHYLN53sMz9sQ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: f11760d955dda304ca308bf5bc77bde4
X-cloud-security: scantime:2.105
DKIM-Signature: a=rsa-sha256;
 bh=lhvqRKEdBFpg6Tb3T3Vs34pdHi/UJgksuj201a6fjtY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771599580; v=1;
 b=VOqCWG2aMw8E64HtTjlgAO3ycnCFfix3pnNkYdh/6nPSZsxakod5d7OAZzKOcDPTBU1/3qMr
 neY3peHl8OXGFUQ4b86qoL9DT4ZgifHYphpBBHWeh1+5mpV21qeqhPz9jf4yhfdG5C1ID+4eGLa
 szDEFLpSycIDEiaiCaQ+w+rk4smlOwbQLE8ZfQTNB3weULcCgWZhRTCQcWqlyMvCL+kx8LzxNVk
 JQwmRO1PMxE21iPrXmI6nCfa+1gost0UI9DAynMLbEOwmJv+Zf0nPJR+wwQa7WyYEuCfMNKNuZA
 sqqutxm1YN8WI4SKvV4g9MIIOEhn1OFpL4rw0d0rtMFaA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_065950_057913_0A1F2C68 
X-CRM114-Status: GOOD (  10.89  )
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

From: Alexander Feilke <alexander.feilke@ew.tq-group.com>

Deassert BOOT_EN after boot to separate BOOT_CFG
circuits from LCD signals.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
index 03f2f2cbdfbc..4192adb27223 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
@@ -287,6 +287,15 @@ &flexcan2 {
 	status = "okay";
 };
 
+&gpio4 {
+	/* Deassert BOOT_EN after boot to separate BOOT_CFG circuits from LCD signals */
+	boot-en-hog {
+		gpio-hog;
+		gpios = <3 GPIO_ACTIVE_LOW>;
+		output-low;
+	};
+};
+
 &i2c1 {
 	lm75: temperature-sensor@49 {
 		compatible = "national,lm75a";
-- 
2.43.0


