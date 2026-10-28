Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FCE606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 19:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GUCKisnz;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=uSvJEOwu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tjiMc0u9JRfCWVfHK0ySiQtqapmVRAz5A/meQ6qpN84=; b=GUCKisnzYxsjMP
	tIIUHFxXEngVOsXvMlJBA6NO/LRSzSpg43Q/lcQnzcXmbMIHS61k4scrfVszVqlPophxNp7TC+oqI
	aX+RQk11Rhz8mDGECJMdkIrNc0vVqZ00szokidxQe909BOkhles3PN6EgraIzLjA+kk65/ddkTdSF
	ytnwsx0V34YEYyv9QJvfBzYSddJsENmfAYSCPWqBMptNdrGj7wUs8p6noumMpgk9CsFv44Xt8+Ir3
	pidFVtqPBrZ4b1XZr0LQUhNAb/ug9BpMSPo3iOGDfOWlC1c3W1v9qc+IJ7f/278TdKlw6Zn7CR1wW
	Yon/Z9vvqC6d/e4AK67Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM98t-00000007qbv-0mZL;
	Wed, 28 Oct 2026 19:16:59 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM98l-00000007qZD-32Xp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 19:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=tjiMc0u9JRfCWVfHK0ySiQtqapmVRAz5A/meQ6qpN84=; t=1793215011; x=1794424611; 
	b=uSvJEOwu7ZXW0vMPwhcWfO96IIWUxx1pbL09mUT/jg2JPYsCtwutqcMHIZuPkSX99cl2Jy4Hnkx
	1yp/zr1YlDHd6NnXGk/ZqaK7nrXcftOZ/fYO/F9tk/BAW1Dt2Zhkq9ehFXuLJ65tzhWm1Q7rQICBq
	0yLs7dbhBR317tUXkfaaRXeJxy62LTHtF3kxP4URvCG/cMr2w1RLL4GELOgAzprZOMm6y+kNsmiIb
	ZYbXIVJRpZzJycQstd5PbpCzvq9nbJapEBISe6q0GB/oaDXlcDquX8ueA9lXvAL/QLCs5uZOQ2WBL
	Nug3h6+Ji8PcudodETzw0VpdeSziFX1i9QWQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Wed, 28 Oct 2026 20:15:12 +0100
Subject: [PATCH 2/2] ARM: omap: cpuidle34xx: Constify state info
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-susp2-v1-2-174b52857d89@kemnade.info>
References: <20261028-susp2-v1-0-174b52857d89@kemnade.info>
In-Reply-To: <20261028-susp2-v1-0-174b52857d89@kemnade.info>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1885; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=udfUXXKoplbjhUeiEbeEWkhgstB9Za6ncNNCxAZQg8E=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBq4knOI1TAO1AubtmAcvHnGMAx5q8xpYQh1KEN9
 6e4JkPCypeJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCauJJzgAKCRCEYUX6QCjc
 8fA8D/99UAuWZnyNbEb5wgRySI9mYsNOWcmPYZJR48NQxScCXf6WXflvl9J1hN+IyzvK3iO1k1b
 GIzrxzZg8VfSDWR3fBoVG9KuVIWAP1DHuSVWoIudPNShZasH+3ysOgAGqyXjCrLH5qRKUHDYqXM
 I/MQIoKlziGI+WG7P7opeeCYk9LwiigNK2U5ELXBNocf46zi8b0jWH8vCkzGMPes1cwFEnLSNaH
 uAFxQI3h07krmtGNfnW8+lydYUecUK48Tn9en+UmG93wGvc+OW7DmNHpODaOPOrqdfAIAr2CmdC
 ejJvD21ThAwmmVVzn05bojhrzsYT+cLJx6fhzdiK81zT9pV12aV/gnfax1zjVCF8ZfZGyRXPisX
 eNSeRH96sR27CxuVyJKFrY8OvexygLyqqIz3MSoTNEOVWpvxZq/k5VvOuLM6Sei8UKrEGujKbuf
 rWzK5dmaoacUFkTFE+y+HOZdEJ9nNDWDvi8onMhZwpVS03QFWmwWnWxzzb7V25jrTolSyByTA8T
 4YIamC059n9EF5mtToQXrQMfdM8FceMJidYVxs3ws/9/JXJ+kYc+CYOckpnXLFPtIEGfj0rOIfZ
 yrLKY/Qv1d/zae7J2d134tu3P7uy8EDyM2tD4k3J/4UI2efIpsQjjFnqbNy/D8ZXpQ8oBveVwnh
 cOgeTzHegCsuaWw==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_121651_771053_6B0044E8 
X-CRM114-Status: GOOD (  10.36  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

omap3_idle_statedata is only static read only data,
so have that fact cleary visible.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/mach-omap2/cpuidle34xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-omap2/cpuidle34xx.c b/arch/arm/mach-omap2/cpuidle34xx.c
index e42dcf8c03a3..16d2e1f08b48 100644
--- a/arch/arm/mach-omap2/cpuidle34xx.c
+++ b/arch/arm/mach-omap2/cpuidle34xx.c
@@ -58,7 +58,7 @@ static struct powerdomain *mpu_pd, *core_pd, *per_pd, *cam_pd;
  * Prevent PER OFF if CORE is not in RETention or OFF as this would
  * disable PER wakeups completely.
  */
-static struct omap3_idle_statedata omap3_idle_data[] = {
+static const struct omap3_idle_statedata omap3_idle_data[] = {
 	{
 		.mpu_state = PWRDM_POWER_ON,
 		.core_state = PWRDM_POWER_ON,
@@ -108,7 +108,7 @@ static int omap3_enter_idle(struct cpuidle_device *dev,
 			    struct cpuidle_driver *drv,
 			    int index)
 {
-	struct omap3_idle_statedata *cx = &omap3_idle_data[index];
+	const struct omap3_idle_statedata *cx = &omap3_idle_data[index];
 	int error;
 
 	if (omap_irq_pending() || need_resched())
@@ -168,7 +168,7 @@ static int omap3_enter_idle(struct cpuidle_device *dev,
 static int next_valid_state(struct cpuidle_device *dev,
 			    struct cpuidle_driver *drv, int index)
 {
-	struct omap3_idle_statedata *cx = &omap3_idle_data[index];
+	const struct omap3_idle_statedata *cx = &omap3_idle_data[index];
 	u32 mpu_deepest_state = PWRDM_POWER_RET;
 	u32 core_deepest_state = PWRDM_POWER_RET;
 	int idx;
@@ -221,7 +221,7 @@ static int omap3_enter_idle_bm(struct cpuidle_device *dev,
 {
 	int new_state_idx, ret;
 	u8 per_next_state, per_saved_state;
-	struct omap3_idle_statedata *cx;
+	const struct omap3_idle_statedata *cx;
 
 	/*
 	 * Use only C1 if CAM is active.

-- 
2.47.3


