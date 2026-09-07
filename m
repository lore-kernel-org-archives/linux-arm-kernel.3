Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0873C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 07:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nPO1TI6PhcIovZv4CegSlinuFtOw5SUcbsLM6dvhUU=; b=gIKg7ydxFg3ATomPs1m0WkPkyC
	rpPjD+SuRcAZmjBIIAHThJOE8+dxLQlXBzG57AHfxulQqtK22QXoSnV2TElVwQih472xLI88FMsXg
	Dehq6SmZTO2O+/VDptfI6dNIBGv5WJNGW1DqWHHG878+5WWKA6BRa0we6/D5HpAA3qs9CZJADFuuY
	dJmlj+HfS4mIyt1ZKDTQwXQ6GruNakLj0vf1RDWYj596vkojRyWSTa7Ek+9f312pYGwP7WaAZMFEP
	bLOdWe28Ilxp4G2tghJbU6qwAJ6MyG+Dx2WOWhJZeF7h/FqtaVAJpIYpq57+djVFkVnedHar2ohIc
	cBSe5lnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3UAm-00000006CHt-4533;
	Mon, 07 Sep 2026 07:53:48 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3UAc-00000006CE2-2xBo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 07:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=+nPO1TI6PhcIovZv4CegSlinuFtOw5S
	UcbsLM6dvhUU=; b=ZtJifY6qz+n1xQC7E8yC6YfAJhyMYlTTYA7SabGkgKkESMe
	+OXOG4Ya+3NmB88YK1kUKtxp6BddPG41Vhk/49qz9pbFWoJyOewsXzcYXqwUYGQa
	BxvJeG5QgPJAWx22z+ADXg6zz5gACOpX71WDs4SGyLlmVF9jjHBjLEFcCrGs=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDHQAf_a55qnlUAAA--.364S4;
	Mon, 07 Sep 2026 15:47:19 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Mon, 07 Sep 2026 15:46:51 +0800
Subject: [PATCH net-next v2 2/5] net: stmmac: sophgo: Use common RGMII
 delay handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-dwmac-ultrarisc-v2-2-9a39bf8db313@ultrarisc.com>
References: <20260907-dwmac-ultrarisc-v2-0-9a39bf8db313@ultrarisc.com>
In-Reply-To: <20260907-dwmac-ultrarisc-v2-0-9a39bf8db313@ultrarisc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Jia Wang <wangjia@ultrarisc.com>, 
 sophgo@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788767221; l=1357;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=CDI070e+NOZ/ruqicjlaZpPE25aCTxfliAy88qsKICo=;
 b=IQF3xUotir2QfLDg3r7ZgEAnMaIc0rhUw8Jyn+COg58zKlYEvAyzLQJcHMCEMeDMSQNy/Eym6
 SbxQS1Zz9uZBX9n3GyIwwcYaEumahXlVcDAx+Fav+0HlgAhVbHHcDMo
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID: AQAAfwDHQAf_a55qnlUAAA--.364S4
X-Coremail-Antispam: 1UD129KBjvJXoW7CrW8uw4UurW3CrWUJw1rtFb_yoW8GFy5pr
	ZrCa4a9rn7tr4aq3Z8Jr48ZFy5Wa47KFWj9a48tws3Zay0yFyaqwn0yFW0qFnrAFWUZry7
	tr4UZFy5ZF98Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmK14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7
	xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j
	6F4UJbIYCTnIWIevJa73UjIFyTuYvjTRRCJPDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQACEWqdDaQAAQAPsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_005344_284133_AED1C00D 
X-CRM114-Status: GOOD (  11.63  )
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

Describe the SG2042 internal RX delay through the common stmmac
platform data and let stmmac_pltfr_probe() adjust the PHY interface
mode.

This removes the duplicated mode conversion without changing the
hardware behavior.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
index e02ad3762b5f..f62c803665ad 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -55,14 +55,10 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
 		return ret;
 
 	data = device_get_match_data(&pdev->dev);
-	if (data && data->has_internal_rx_delay) {
-		plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
-									  false, true);
-		if (plat_dat->phy_interface == PHY_INTERFACE_MODE_NA)
-			return -EINVAL;
-	}
-
-	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
+	if (data)
+		plat_dat->has_internal_rx_delay = data->has_internal_rx_delay;
+
+	return stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static const struct sophgo_dwmac_data sg2042_dwmac_data = {

-- 
2.34.1


