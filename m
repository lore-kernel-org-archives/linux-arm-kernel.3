Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB2EC36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sC1VWClab8wHUQeTmTFrD/6kevqe1pYFFk+JDM+T+4=; b=p5quwyaOfR0keYeztNuvS1Opyd
	YN222YIw7fN478Rfu3V3XshPfsTqo2iy8m78zsTpTSwc65nQpN0QoExPhp1nj0CBqchJNAOnZCBvj
	W1y/PL0VG46ZNcgaqsBfjKt3KKAQiiAHfkztKWdueqTK7Kh7O/xktJurQpUm5w1luNTRSkMdBUtv2
	3jyw5q7VNXyjmzJRDIT8SYO1m/9HOsoZieJfdto6NAyppvDANM2kO5jkQI+1ACYXniZ20uFe9b1i9
	OducDsP/Ipl7kOAXG5tBT5iYDHtv8/2/+zVhJt42kiK35kPydUoN7yBvmR5LIIHrrI/fle0dnbhGo
	H+dGwowA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZ8V-00000002feE-25HP;
	Tue, 01 Apr 2025 10:46:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYs1-00000002d7q-144k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 10:29:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F080F61132;
	Tue,  1 Apr 2025 10:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098EAC4CEE8;
	Tue,  1 Apr 2025 10:29:23 +0000 (UTC)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] pwm: mediatek: Prevent divide-by-zero in pwm_mediatek_config()
Date: Tue,  1 Apr 2025 12:28:59 +0200
Message-ID: <9e78a0796acba3435553ed7db1c7965dcffa6215.1743501688.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1743501688.git.u.kleine-koenig@baylibre.com>
References: <cover.1743501688.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2160; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=JMgQzUTJoig5ETPeVtsMb4NN/zcNu8J+hWAXWzGaoAA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn67/tJsvKleO7aIXPu4rFG6eq/4n71gXwAUEjo noLJES5ToOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ+u/7QAKCRCPgPtYfRL+ TpKSCACl4E2BSZGgDXNnVYRUVexNWf/pzLfzsOsHEsC6on4hlKTQcylbLwpqPnfagMeus5mvR3D jJqX3V7Ym2fUjlKwQljG+jNHCz+rjvn771hutv6tLm/GQgUAxaRE/YXoZMfKKHSdgkg/sWpY1IS BrCVIpH9WgCqIgVTafaibYdINF1feP6c5yRyn+sW1Xgcy4RruZN3AI0qV7ntHeQZy7HKSeDvKOV ATdmR5KvK86+17wBwWU/L1lYGmeXDo1y0OM4j8pgqSWKig5i1P1NUn6N7p0F8rqz6lVvl9tBaJX ldQuwb+cQeog9gUWuKSYpyYCk1bdI+o/hG6bZkybkXbc9nN0
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
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

From: Josh Poimboeuf <jpoimboe@kernel.org>

With CONFIG_COMPILE_TEST && !CONFIG_HAVE_CLK, pwm_mediatek_config() has a
divide-by-zero in the following line:

	do_div(resolution, clk_get_rate(pc->clk_pwms[pwm->hwpwm]));

due to the fact that the !CONFIG_HAVE_CLK version of clk_get_rate()
returns zero.

This is presumably just a theoretical problem: COMPILE_TEST overrides
the dependency on RALINK which would select COMMON_CLK.  Regardless it's
a good idea to check for the error explicitly to avoid divide-by-zero.

Fixes the following warning:

  drivers/pwm/pwm-mediatek.o: warning: objtool: .text: unexpected end of section

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Link: https://lore.kernel.org/r/fb56444939325cc173e752ba199abd7aeae3bf12.1742852847.git.jpoimboe@kernel.org
[ukleinek: s/CONFIG_CLK/CONFIG_HAVE_CLK/]
Fixes: caf065f8fd58 ("pwm: Add MediaTek PWM support")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 01dfa0fab80a..7eaab5831499 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -121,21 +121,25 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
 	u32 clkdiv = 0, cnt_period, cnt_duty, reg_width = PWMDWIDTH,
 	    reg_thres = PWMTHRES;
+	unsigned long clk_rate;
 	u64 resolution;
 	int ret;
 
 	ret = pwm_mediatek_clk_enable(chip, pwm);
-
 	if (ret < 0)
 		return ret;
 
+	clk_rate = clk_get_rate(pc->clk_pwms[pwm->hwpwm]);
+	if (!clk_rate)
+		return -EINVAL;
+
 	/* Make sure we use the bus clock and not the 26MHz clock */
 	if (pc->soc->has_ck_26m_sel)
 		writel(0, pc->regs + PWM_CK_26M_SEL);
 
 	/* Using resolution in picosecond gets accuracy higher */
 	resolution = (u64)NSEC_PER_SEC * 1000;
-	do_div(resolution, clk_get_rate(pc->clk_pwms[pwm->hwpwm]));
+	do_div(resolution, clk_rate);
 
 	cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000, resolution);
 	while (cnt_period > 8191) {
-- 
2.47.2


