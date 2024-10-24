Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED79CE8E99
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWqr/vC1uXnvqITTA1QmsjZZy7nzMOkGEm06MENhQ7w=; b=PjlgIyMI/MRM+Uuq/t3iFMwSj7
	JGHOSn0Hzv66UMtjCIq9I0zX2yBWHhUVazEP06HivbVIn25OsEE7PutbXm44BCrO08eAL2IV49yuh
	/bEba03nc5waY1tBlmWRFktC/LycaYCnI8BUc6EaTBXs6cKjM6RDgwsnvCZmx4R4bBVzVQAUuxeMX
	4xjJHXcNV63EqrbZo26CKx5JTYMg+cwHuLQKDMauTrEJPHE7slA1JL/JLTKwol8VFCLU2N1vmtRhl
	Buh+n2D3ZrkEd+PJ8gnELRk1OVjjeDyvs9MkmVZ0pyGlfpMt+hveTj2bgbXgc+xl0DFQ4nWKKZanc
	8XcFQ6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41Ys-00000001GsA-1eLF;
	Thu, 24 Oct 2024 17:23:50 +0000
Received: from thales.epochal.quest ([2607:5300:205:200::3a30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41LJ-00000001DpE-4C4X;
	Thu, 24 Oct 2024 17:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1729789788;
	bh=i9M0xbrAcc2zYjmRWvSGZudanxzGOPy6UtlMgUT0VHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SyMKLYIkLV4yt/rvAYObv3DEnh9SXBhd82PdHYAMcxFUOhicASPhb3gJrWrSfRWBz
	 O/U6QxXbYc6HPKOFA5QPSfJSQImr49xa9bgMprIcyy7uPVlErv/ofO4gpqqIB36Z7v
	 IvrodmRgzh0xOcmVgYzvukEji0Omi2XYhV8r1mwdLpJlBY5azK4akyhY747tzA41w5
	 rnyDGdomBrHYYGdGGz3hr5RA8YBdIpfozoIV4JoqXp3Cst+dEqbQvU8qD2hBoFTkTY
	 lpCHV7vX5FmdzYrTTH4rE3QRK/r7HB27rDlJfsKR+0U/FdostLHe3aGZuIjzoRiJw1
	 DeQcPUq8p9NbA==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>,
	Andre Przywara <andre.przywara@arm.com>,
	Parthiban <parthiban@linumiz.com>,
	Yangtao Li <frank@allwinnertech.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <treding@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Maxime Ripard <mripard@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Shuosheng Huang <huangshuosheng@allwinnertech.com>
Subject: [PATCH 12/13] cpufreq: sun50i: add a100 cpufreq support
Date: Thu, 24 Oct 2024 14:05:30 -0300
Message-ID: <20241024170540.2721307-13-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
References: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_100950_300387_879E49A3 
X-CRM114-Status: GOOD (  12.98  )
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

From: Shuosheng Huang <huangshuosheng@allwinnertech.com>

Let's add cpufreq nvmem based for allwinner a100 soc. It's similar to h6,
let us use efuse_xlate to extract the differentiated part.

Signed-off-by: Shuosheng Huang <huangshuosheng@allwinnertech.com>
[masterr3c0rd@epochal.quest: add A100 to opp_match_list]
Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 293921acec93..3a29c026d364 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -22,6 +22,9 @@
 #define NVMEM_MASK	0x7
 #define NVMEM_SHIFT	5
 
+#define SUN50I_A100_NVMEM_MASK	0xf
+#define SUN50I_A100_NVMEM_SHIFT	12
+
 static struct platform_device *cpufreq_dt_pdev, *sun50i_cpufreq_pdev;
 
 struct sunxi_cpufreq_data {
@@ -45,6 +48,23 @@ static u32 sun50i_h6_efuse_xlate(u32 speedbin)
 		return 0;
 }
 
+static u32 sun50i_a100_efuse_xlate(u32 speedbin)
+{
+	u32 efuse_value;
+
+	efuse_value = (speedbin >> SUN50I_A100_NVMEM_SHIFT) &
+		      SUN50I_A100_NVMEM_MASK;
+
+	switch (efuse_value) {
+	case 0b100:
+		return 2;
+	case 0b010:
+		return 1;
+	default:
+		return 0;
+	}
+}
+
 static int get_soc_id_revision(void)
 {
 #ifdef CONFIG_HAVE_ARM_SMCCC_DISCOVERY
@@ -108,6 +128,10 @@ static struct sunxi_cpufreq_data sun50i_h6_cpufreq_data = {
 	.efuse_xlate = sun50i_h6_efuse_xlate,
 };
 
+static struct sunxi_cpufreq_data sun50i_a100_cpufreq_data = {
+	.efuse_xlate = sun50i_a100_efuse_xlate,
+};
+
 static struct sunxi_cpufreq_data sun50i_h616_cpufreq_data = {
 	.efuse_xlate = sun50i_h616_efuse_xlate,
 };
@@ -116,6 +140,9 @@ static const struct of_device_id cpu_opp_match_list[] = {
 	{ .compatible = "allwinner,sun50i-h6-operating-points",
 	  .data = &sun50i_h6_cpufreq_data,
 	},
+	{ .compatible = "allwinner,sun50i-a100-operating-points",
+	  .data = &sun50i_a100_cpufreq_data,
+	},
 	{ .compatible = "allwinner,sun50i-h616-operating-points",
 	  .data = &sun50i_h616_cpufreq_data,
 	},
@@ -291,6 +318,7 @@ static struct platform_driver sun50i_cpufreq_driver = {
 
 static const struct of_device_id sun50i_cpufreq_match_list[] = {
 	{ .compatible = "allwinner,sun50i-h6" },
+	{ .compatible = "allwinner,sun50i-a100" },
 	{ .compatible = "allwinner,sun50i-h616" },
 	{ .compatible = "allwinner,sun50i-h618" },
 	{ .compatible = "allwinner,sun50i-h700" },
-- 
2.47.0


