Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9A8CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 08:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mLY8zivKv4V7ZPqASwM9sGRdSMQXYChLQdHmi9I6EJE=; b=L3s2Y38GAxWxiTtUGDHl9xJAEY
	HM2zyDU4q1EWsqebEw+mcf+iitG5mVTaW3Y8+ROXW6+oSIt6lEUzWGQT0CLG+Q2EyLWpOebe9/IOw
	rSmp4Jj8HTLkUE4I6ZanMzf2ZmGrGGtPMQvaq3J8dABr6sYRHm1yjiub8vKDkpdDt3m5UGh4K/U3F
	0/dE6buHdCFi9BwnpDZZbV8c17upc4EUGtpUDY+QVtpMI9KbW/qVowfPycEBy/xHP05VnAFgCU4+S
	Eh4VKIFp2pah8wvMmmWvMiwRcVbRl2cAXcFxwIx5tzoXEVfAZFvOgDiDQyTfkndi7iDwDGONaM+RW
	nOYJz1Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unYts-00000005Ube-2Iyu;
	Sun, 17 Aug 2025 08:38:00 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unYrG-00000005USM-2XmE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 08:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=mL
	Y8zivKv4V7ZPqASwM9sGRdSMQXYChLQdHmi9I6EJE=; b=cIyiwxb3EIhFeCpqJg
	0x9Mt29Uz+rCc31W+FAINyJuFpXzkM17eHmAY24J3/1sX06PUJ+Av9zBX693CwF7
	gYej8Dcx85g3+1deNWN8UesI12uGLjOC9SdEfG0/08yrik68JTDyBuWXj/ZDAwIa
	jjK04ycTh91fJI5YBfLbs5a4w=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDHZ8UrlKFoCU5FCg--.59942S2;
	Sun, 17 Aug 2025 16:34:53 +0800 (CST)
From: Yang Xiuwei <yangxiuwei2025@163.com>
To: tony@atomide.com,
	khilman@baylibre.com
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: [PATCH] ARM: OMAP2+: use IS_ERR_OR_NULL() helper
Date: Sun, 17 Aug 2025 16:34:49 +0800
Message-Id: <20250817083449.2249268-1-yangxiuwei2025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHZ8UrlKFoCU5FCg--.59942S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr18AFWUKw4kAF4rurW8tFb_yoW5KFW5pF
	yqkw12gr40gw17J34DtF40vF1jy392qF40yrZY9w1Yqw4a9rnrG3W29Fyjk34Ykas7Ga1r
	AF43Aay8Zr45JFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jJfHbUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/1tbiMQ+skGihi-yrTQAAsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_013519_022264_EA02861E 
X-CRM114-Status: UNSURE (   7.22  )
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

From: Yang Xiuwei <yangxiuwei@kylinos.cn>

Simplify error handling in OMAP powerdomain, voltage, and VP code by
replacing open-coded '!ptr || IS_ERR(ptr)' checks with the combined
IS_ERR_OR_NULL() helper.

This improves readability and consistency across
omap_set_pwrdm_state(), voltdm_get_voltage(), voltdm_scale(),
voltdm_reset(), and related functions.

No functional change intended.

Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>

diff --git a/arch/arm/mach-omap2/powerdomain.c b/arch/arm/mach-omap2/powerdomain.c
index a4785302b7ae..0225b9889404 100644
--- a/arch/arm/mach-omap2/powerdomain.c
+++ b/arch/arm/mach-omap2/powerdomain.c
@@ -1111,7 +1111,7 @@ int omap_set_pwrdm_state(struct powerdomain *pwrdm, u8 pwrst)
 	int curr_pwrst;
 	int ret = 0;
 
-	if (!pwrdm || IS_ERR(pwrdm))
+	if (IS_ERR_OR_NULL(pwrdm))
 		return -EINVAL;
 
 	while (!(pwrdm->pwrsts & (1 << pwrst))) {
diff --git a/arch/arm/mach-omap2/voltage.c b/arch/arm/mach-omap2/voltage.c
index 49e8bc69abdd..000c2bca5ef0 100644
--- a/arch/arm/mach-omap2/voltage.c
+++ b/arch/arm/mach-omap2/voltage.c
@@ -51,7 +51,7 @@ static LIST_HEAD(voltdm_list);
  */
 unsigned long voltdm_get_voltage(struct voltagedomain *voltdm)
 {
-	if (!voltdm || IS_ERR(voltdm)) {
+	if (IS_ERR_OR_NULL(voltdm)) {
 		pr_warn("%s: VDD specified does not exist!\n", __func__);
 		return 0;
 	}
@@ -73,7 +73,7 @@ static int voltdm_scale(struct voltagedomain *voltdm,
 	int ret, i;
 	unsigned long volt = 0;
 
-	if (!voltdm || IS_ERR(voltdm)) {
+	if (IS_ERR_OR_NULL(voltdm)) {
 		pr_warn("%s: VDD specified does not exist!\n", __func__);
 		return -EINVAL;
 	}
@@ -124,7 +124,7 @@ void voltdm_reset(struct voltagedomain *voltdm)
 {
 	unsigned long target_volt;
 
-	if (!voltdm || IS_ERR(voltdm)) {
+	if (IS_ERR_OR_NULL(voltdm)) {
 		pr_warn("%s: VDD specified does not exist!\n", __func__);
 		return;
 	}
@@ -154,7 +154,7 @@ void voltdm_reset(struct voltagedomain *voltdm)
 void omap_voltage_get_volttable(struct voltagedomain *voltdm,
 				struct omap_volt_data **volt_data)
 {
-	if (!voltdm || IS_ERR(voltdm)) {
+	if (IS_ERR_OR_NULL(voltdm)) {
 		pr_warn("%s: VDD specified does not exist!\n", __func__);
 		return;
 	}
@@ -182,7 +182,7 @@ struct omap_volt_data *omap_voltage_get_voltdata(struct voltagedomain *voltdm,
 {
 	int i;
 
-	if (!voltdm || IS_ERR(voltdm)) {
+	if (IS_ERR_OR_NULL(voltdm)) {
 		pr_warn("%s: VDD specified does not exist!\n", __func__);
 		return ERR_PTR(-EINVAL);
 	}
@@ -216,7 +216,7 @@ struct omap_volt_data *omap_voltage_get_voltdata(struct voltagedomain *voltdm,
 int omap_voltage_register_pmic(struct voltagedomain *voltdm,
 			       struct omap_voltdm_pmic *pmic)
 {
-	if (!voltdm || IS_ERR(voltdm)) {
+	if (IS_ERR_OR_NULL(voltdm)) {
 		pr_warn("%s: VDD specified does not exist!\n", __func__);
 		return -EINVAL;
 	}
diff --git a/arch/arm/mach-omap2/vp.c b/arch/arm/mach-omap2/vp.c
index a709655b978c..03c481c4742c 100644
--- a/arch/arm/mach-omap2/vp.c
+++ b/arch/arm/mach-omap2/vp.c
@@ -199,7 +199,7 @@ void omap_vp_enable(struct voltagedomain *voltdm)
 	struct omap_vp_instance *vp;
 	u32 vpconfig, volt;
 
-	if (!voltdm || IS_ERR(voltdm)) {
+	if (IS_ERR_OR_NULL(voltdm)) {
 		pr_warn("%s: VDD specified does not exist!\n", __func__);
 		return;
 	}
@@ -244,7 +244,7 @@ void omap_vp_disable(struct voltagedomain *voltdm)
 	u32 vpconfig;
 	int timeout;
 
-	if (!voltdm || IS_ERR(voltdm)) {
+	if (IS_ERR_OR_NULL(voltdm)) {
 		pr_warn("%s: VDD specified does not exist!\n", __func__);
 		return;
 	}
-- 
2.25.1


