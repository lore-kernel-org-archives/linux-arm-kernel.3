Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588C9D68BD5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 10:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkMWIHpKHKZpKGNryW/KAhgKYMkQPJxmIK7ITjQb8Ss=; b=0jSij2505rmRAqHMDBj1aByabj
	0HlX/9FF1y4YX77F8CMnm8+JP9lU9KcDiIwR062ajpK20POQsEnRtGsjajdaTqVJUpVHPiJLBggU1
	o5oJCQsHRtE5T9kRgPmSq8vjaUglh03dC2vxy0bmHAsm9FjRkukzdQtsEEDJ39sfCHqe2ejlNU4Cl
	LgPAItu/HHsAbJxZizQ1hUP3uQ/1hDeHbL3hVOWyuFJthKBeMP5kHpCW78YQN3WiX5EZT3p4DVJd9
	dLK3cp3slRRrdibjI0Sa4Jmi+Ty+IHZqU2CSaMBkyxLs35EgXDBOVFkdVXpcYzEKB52jLleQfYeMh
	Tn2XvZdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXGy9-0000000CL93-08Rz;
	Sun, 21 Dec 2025 10:47:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXGxx-0000000CKvC-0tUM;
	Sun, 21 Dec 2025 10:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766314027;
	bh=bLR5izwlKB8yA90I3hP1Yd4av3ijx/LKiLYcVu8QwyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KOQKtxAr/qpN4+jGGgVGsbcVH8InTJ/vJcK8OroG2ppqgT/83KRstHtLdYS3S3MNe
	 rbqI3gb53JZwttTLqocFkGQB0t1ZxGfi1LtTiJ2pCqoblAsi+vsQG5pb5z+yCndCsp
	 /iT8ucyjH6JY7bFghc+G2caZuYO9yIU5Fu+GHemxXS+/Bub+NbLadVCKO2ieWwAUBn
	 MIxekR7lpzj8XbOm0zmSlxu9obPoI64KVgqSSLb9S78bm6WrlEi58YUljqbKVoMv/w
	 NADVoUWhE18XshkYHFjAsWRzZQatvpj1ZjonTWX6kbxUIj/QuWPZsYH0dEUdpEl1Pv
	 8aossv7DUR9hQ==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C966617E1404;
	Sun, 21 Dec 2025 11:47:06 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sun, 21 Dec 2025 12:46:53 +0200
Subject: [PATCH v5 06/11] phy: rockchip: samsung-hdptx: Cleanup
 *_cmn_init_seq lists
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-phy-hdptx-frl-v5-6-dac390a780be@collabora.com>
References: <20251221-phy-hdptx-frl-v5-0-dac390a780be@collabora.com>
In-Reply-To: <20251221-phy-hdptx-frl-v5-0-dac390a780be@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_024711_688128_B10011FE 
X-CRM114-Status: UNSURE (   8.17  )
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

Drop redundant reg_sequence entries from rk_hdptx_common_cmn_init_seq[],
i.e. those that are either duplicated or overridden in
rk_hdptx_tmds_cmn_init_seq[].

Additionally, a few items do not really belong to the former, hence move
them to the latter.  That's mostly a preparatory step for adding FRL
support.

No functional changes intended at this point.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 7e5e0332f3bf..42f0ac5a74b1 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -433,13 +433,11 @@ static const struct reg_sequence rk_hdptx_common_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(000e), 0x0f),
 	REG_SEQ0(CMN_REG(000f), 0x0f),
 	REG_SEQ0(CMN_REG(0010), 0x04),
-	REG_SEQ0(CMN_REG(0011), 0x00),
 	REG_SEQ0(CMN_REG(0012), 0x26),
 	REG_SEQ0(CMN_REG(0013), 0x22),
 	REG_SEQ0(CMN_REG(0014), 0x24),
 	REG_SEQ0(CMN_REG(0015), 0x77),
 	REG_SEQ0(CMN_REG(0016), 0x08),
-	REG_SEQ0(CMN_REG(0017), 0x00),
 	REG_SEQ0(CMN_REG(0018), 0x04),
 	REG_SEQ0(CMN_REG(0019), 0x48),
 	REG_SEQ0(CMN_REG(001a), 0x01),
@@ -447,13 +445,7 @@ static const struct reg_sequence rk_hdptx_common_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(001c), 0x01),
 	REG_SEQ0(CMN_REG(001d), 0x64),
 	REG_SEQ0(CMN_REG(001f), 0x00),
-	REG_SEQ0(CMN_REG(0026), 0x53),
 	REG_SEQ0(CMN_REG(0029), 0x01),
-	REG_SEQ0(CMN_REG(0030), 0x00),
-	REG_SEQ0(CMN_REG(0031), 0x20),
-	REG_SEQ0(CMN_REG(0032), 0x30),
-	REG_SEQ0(CMN_REG(0033), 0x0b),
-	REG_SEQ0(CMN_REG(0034), 0x23),
 	REG_SEQ0(CMN_REG(0035), 0x00),
 	REG_SEQ0(CMN_REG(0038), 0x00),
 	REG_SEQ0(CMN_REG(0039), 0x00),
@@ -464,7 +456,6 @@ static const struct reg_sequence rk_hdptx_common_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(003f), 0x83),
 	REG_SEQ0(CMN_REG(0040), 0x06),
 	REG_SEQ0(CMN_REG(0041), 0x20),
-	REG_SEQ0(CMN_REG(0042), 0xb8),
 	REG_SEQ0(CMN_REG(0043), 0x00),
 	REG_SEQ0(CMN_REG(0044), 0x46),
 	REG_SEQ0(CMN_REG(0045), 0x24),
@@ -474,14 +465,9 @@ static const struct reg_sequence rk_hdptx_common_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(004b), 0x00),
 	REG_SEQ0(CMN_REG(004c), 0x01),
 	REG_SEQ0(CMN_REG(004d), 0x64),
-	REG_SEQ0(CMN_REG(004e), 0x14),
 	REG_SEQ0(CMN_REG(004f), 0x00),
 	REG_SEQ0(CMN_REG(0050), 0x00),
-	REG_SEQ0(CMN_REG(005d), 0x0c),
 	REG_SEQ0(CMN_REG(005f), 0x01),
-	REG_SEQ0(CMN_REG(006b), 0x04),
-	REG_SEQ0(CMN_REG(0073), 0x30),
-	REG_SEQ0(CMN_REG(0074), 0x00),
 	REG_SEQ0(CMN_REG(0075), 0x20),
 	REG_SEQ0(CMN_REG(0076), 0x30),
 	REG_SEQ0(CMN_REG(0077), 0x08),
@@ -493,13 +479,10 @@ static const struct reg_sequence rk_hdptx_common_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(007e), 0x00),
 	REG_SEQ0(CMN_REG(007f), 0x00),
 	REG_SEQ0(CMN_REG(0080), 0x00),
-	REG_SEQ0(CMN_REG(0081), 0x09),
 	REG_SEQ0(CMN_REG(0082), 0x04),
 	REG_SEQ0(CMN_REG(0083), 0x24),
 	REG_SEQ0(CMN_REG(0084), 0x20),
 	REG_SEQ0(CMN_REG(0085), 0x03),
-	REG_SEQ0(CMN_REG(0086), 0x01),
-	REG_SEQ0(CMN_REG(0087), 0x0c),
 	REG_SEQ0(CMN_REG(008a), 0x55),
 	REG_SEQ0(CMN_REG(008b), 0x25),
 	REG_SEQ0(CMN_REG(008c), 0x2c),
@@ -511,7 +494,6 @@ static const struct reg_sequence rk_hdptx_common_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(0092), 0x00),
 	REG_SEQ0(CMN_REG(0093), 0x00),
 	REG_SEQ0(CMN_REG(009a), 0x11),
-	REG_SEQ0(CMN_REG(009b), 0x10),
 };
 
 static const struct reg_sequence rk_hdptx_tmds_cmn_init_seq[] = {
@@ -545,9 +527,13 @@ static const struct reg_sequence rk_hdptx_tmds_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(0048), 0x11),
 	REG_SEQ0(CMN_REG(004e), 0x34),
 	REG_SEQ0(CMN_REG(005c), 0x25),
+	REG_SEQ0(CMN_REG(005d), 0x0c),
 	REG_SEQ0(CMN_REG(005e), 0x4f),
+	REG_SEQ0(CMN_REG(006b), 0x04),
+	REG_SEQ0(CMN_REG(0073), 0x30),
 	REG_SEQ0(CMN_REG(0074), 0x04),
 	REG_SEQ0(CMN_REG(0081), 0x01),
+	REG_SEQ0(CMN_REG(0086), 0x01),
 	REG_SEQ0(CMN_REG(0087), 0x04),
 	REG_SEQ0(CMN_REG(0089), 0x00),
 	REG_SEQ0(CMN_REG(0095), 0x00),

-- 
2.51.2


