Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC208CD37AD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 12:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkBPidrgCBcSCiVi3pEiCePtzlLJIduNWzbjBZQqIoo=; b=gjMon5NeWDIXE3FJbebq6U477v
	FI3+ofHWcPMBr6hiWJz8mdhifA/w7v+FWOR68z/DCqckxh4RbZ3ry+e3QP68bTFO8KmtiVFuqkEn9
	1SwOQklJAdv8suIa5TSnWxeI0ks8Egmq0OVhfhnsNDP8eMz69jrGHdVKJC2f/0TLR8Q0dzIzQ7k1I
	dEsy20AStePu/SePDYAOdkYLkn99BCHwyFJ+ut+eW12p0MeoWB7dAnqcFk2WZv3xGd6+ne9osBnBM
	I4+Wbl3LWlGl4SOW2uKqHEqO4PsG4550WRMuIs/aKQrLQd7rfIa644zY+RzvLBh/v3/5bwHSkWzZ/
	Jx9n1/Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUW-00000006TFR-1j9j;
	Fri, 08 May 2026 12:39:40 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUR-00000006T8s-0VdT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 12:39:36 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-393a44854d2so14815721fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 05:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243973; x=1778848773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkBPidrgCBcSCiVi3pEiCePtzlLJIduNWzbjBZQqIoo=;
        b=HHAvH4Tf4JVDeAWseDc8nec+mAOWHYmkz1C/2tQvR4fuNDACi2zEpJlpHfa+dIyB/V
         DCTkRhy3kDCiV3JcSSoqd37cEWJZohOQMrvD3OJ7+OI+eDmIIppgJ6CS8WjOU6HbHrOv
         ZvYgjQVQXEt23ATihsb8gtd0UpilINFer/gqpdEiyPT6xxxS1XIutcAesad0YXJLwHC4
         BW9NXDa9LgLOuNhDUFM/9+9EBU6ZJc18YYjSfxCBTevF7qw0NXcVZvcAz7YVIsCh1Z02
         5o3+WBWcdXkbjOzPAYUuHP/HYrw7mp88ovaaohVnP7iYaH+Dk5hls3ubut0NtYz0jKTi
         vaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243973; x=1778848773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AkBPidrgCBcSCiVi3pEiCePtzlLJIduNWzbjBZQqIoo=;
        b=tZaYp5D1A5r66Iq5rVsoGlkMnqeSRvUh+up9AyHgBbZ3oKnwHUPcTczyX1gkLtPPXx
         ckAkVqReaAUsVnnK7r8zpQHYto+Y59a9wRg9iNlIF23t5zs6d/3tpQdA4KrimimT0LvI
         rSMnf2RB9Y0sx9WvXLSpyvfc0F4GnO/WxkK3pi3bmtOdFYwuTyTC8pg3rFqjpwwoOFhh
         w5g9fVxK5xgGdBdDDuMwoqLYN26KBVBqcgLuCgpt6FzrkjH4dNfDFQfg49qWAu6uBjhI
         iwerNhs8X66OeDx9fl6ckOeHaqDCcgIjw11YjCkt5HqKqkZjl7M1+T+V+cvi6hw8yLQ/
         haMg==
X-Forwarded-Encrypted: i=1; AFNElJ8IAS/EX0Ig4XQMyV9rb7zn9Xi7p+VKYdPzDJO9SjuDXcWWtWWC2XArrdHuvQX5RsZ8UzV5PD4wFn7XlaWBqgM3@lists.infradead.org
X-Gm-Message-State: AOJu0YwIjk+eRCxiXZ2XPh7YjUq6VWYYMLGnkv0yZvgMoyzAwbwMblxw
	nMmMHPE8vNMbUKYK1qSbh2/jbM36QrRDcmJVv1fLLSWdq4VXN9bYT6lsu4abDHrd2rA=
X-Gm-Gg: Acq92OEssV0LxVTTcwxMlhyUZ0hNmdAyV+FWBt+G58X5Qbd/U+ClLjQmUYM33pUEDAS
	/WDRyC3PunCJuy3YHnxUzpOB1vGuHmiFmkY1RheLsH6XwXN7Kh+8k67kIdgCHpXLnUQ9XREtdNW
	jiRBIz5v2vTwpvOTvus3Y38pF3hOPihsRd1IRVVGS0tIbETVFOABmYxhqR8bZucZccl61HKpXvP
	ye9tl0HC34PSWD11bCbJWeParFrjXWmDShpEOdW2C8NYwN20sNeaz35D88jJ69oBC5ahdRbzxSL
	Cl2FuwcxUg2p45LYxqop+4pszyXcsqG5FI59FCYEeYLr5/BOjnK8McQyxIQRI+CEnBQV/jm3EXU
	u41xOlHrSURMLuC7z9J3zDvF6POqyNwQxWaKZs2Bu1/MxqzMEI7tbnCzUcLGx7XHY0jtl1SFcha
	O7jQLuy/qs98P5UOyRdvRU55Zj8wYyAZnsQk3cFOa8j14yMcQdeiSOXKoRn9snqeEncPa/EftR
X-Received: by 2002:a2e:8952:0:b0:38e:98b0:3a7e with SMTP id 38308e7fff4ca-393c4211654mr36254101fa.22.1778243973092;
        Fri, 08 May 2026 05:39:33 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:32 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/13] pmdomain: core: Avoid an unnecessary power off at sync_state
Date: Fri,  8 May 2026 14:39:01 +0200
Message-ID: <20260508123910.114273-13-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508123910.114273-1-ulf.hansson@linaro.org>
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_053935_242693_DED58784 
X-CRM114-Status: GOOD (  13.62  )
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

If the PM domain was not powered on during initialization, genpd will not
prevent it from being powered off during boot. In these cases there is no
need to call genpd_power_off() at sync_state, hence let's avoid it.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- New patch.

---
 drivers/pmdomain/core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index b3ec3dec3f10..b5d90ddfd698 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3636,8 +3636,10 @@ void of_genpd_sync_state(struct device_node *np)
 	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
 		if (genpd->provider == of_fwnode_handle(np)) {
 			genpd_lock(genpd);
-			genpd->stay_on = false;
-			genpd_power_off(genpd, false, 0);
+			if (genpd->stay_on) {
+				genpd->stay_on = false;
+				genpd_power_off(genpd, false, 0);
+			}
 			genpd_unlock(genpd);
 		}
 	}
@@ -3674,8 +3676,10 @@ static void genpd_provider_sync_state(struct device *dev)
 
 	case GENPD_SYNC_STATE_SIMPLE:
 		genpd_lock(genpd);
-		genpd->stay_on = false;
-		genpd_power_off(genpd, false, 0);
+		if (genpd->stay_on) {
+			genpd->stay_on = false;
+			genpd_power_off(genpd, false, 0);
+		}
 		genpd_unlock(genpd);
 		break;
 
-- 
2.43.0


