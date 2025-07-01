Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C64C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Grr6sl4cEvHS0b8iaih2yeMDMbPzzC5ZGk2V/+UW+I=; b=aLumfIf+s/iTaanlMn26rq8Gnr
	Mr5qX75wCnj5mpBu6JX411nkNe/53kK4fLcynmoivYOx4qMne5cmvhPB20COfqh91wAnK9hhXFo82
	tapWM/NRanddjqE2Cb0zOAU+c3xZTYUEC9jojOTw8+qz8GyieU9rRwS0Wct0YAtsBbgG0uALxXQvH
	Vgw6RKnESzi+8OTv+YINYzIQ205tgTmytszJ6oodNUR+3zm2ac3ggDgdQfF7lMJXPvXfiweWk37/O
	iyQAfoINbGVsopp7EQwru2EU2tJxuefb9Uq2vWHBseSorFMEDAd7GxNP61r10ywFeRoyFVgdhmuQm
	UDvVRGTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaMF-00000005My2-31FH;
	Tue, 01 Jul 2025 12:45:07 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZTE-00000004utV-0Exl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:48:17 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-553c31542b1so3663882e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370494; x=1751975294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Grr6sl4cEvHS0b8iaih2yeMDMbPzzC5ZGk2V/+UW+I=;
        b=SVU4MyOWudij0eOkMABzqQQckyipWbQEb5ApOjSDIzAz8AiMzRTlTxRa4RTajGQnRG
         Z+w8gUb7XJodb9ij+HzuGdVyG2pAlHjxGeyJewg9+0SGm6+ln0QbsJ3tkL7YTzPc2/KC
         YymPgWL2DNa+syRVT1xWckRxq8TuvCE8cXEz/DEvZ5DXaTVsQ+aAna9L8tSKWDN5mitV
         QPpXEwVqA/TVmj02I2pxXWt+yHjjXf/2zUPpQQpKtZv8lUzdoVs7oW1SSNQ/IH7P8gpT
         MdzUA5A2+4efT16E8WzaZMas8e/uLwghoCEsYPNvvi8L6e28a4KvrItLTAPYZGhS0aLZ
         0mTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370494; x=1751975294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Grr6sl4cEvHS0b8iaih2yeMDMbPzzC5ZGk2V/+UW+I=;
        b=vxv9kOmztFoWNXFm+E8Kcf4UrSulw4UfTLmQNbC7pNEAG+02Q3IOxjwSCaUryojo1z
         pqYYAPv1akHm4WD7XPOr1lunF30o3xMnvMHn008U/p69l6ScU91Q7327/A11WW31v+Ty
         uOnpXGioX8DZNir+4SPmj7lMABE0L8rgPzoDsvjSQG9XHRnCw00fWsYJjS0afPM0mNHp
         1PFMwFJYloiwhrutV8ZRGnonnk6LY1uRlNtXZ83DG4XkV5Gy/wS2amqFB1iScMmscB9G
         6GiYdTEVGMItsRaKIVqd5f1svNeSoQIndDudVByuNNm0mj4aKYwsbTgAEfoMP9IWBNmO
         4Amg==
X-Forwarded-Encrypted: i=1; AJvYcCXaiTBcBV/0zsnmbLdgRWdnkeTDsIGd2KHRT1WNjzTrc54IfFqu/OoPMk1kLM7rP9q3zDlwJ/ZJ1XV7MpOuQNl0@lists.infradead.org
X-Gm-Message-State: AOJu0YwZze6Yt0UMZUTj/SoiWNhK96sHt9Sbxoy8c3B3N3eiY0wvNlVU
	YjDvwgiJyj547i0WM3RgyAYhe3ITd6uitEOjIFMBlF2eJWtUnfUBjL3icfZQ7Nc+D4k=
X-Gm-Gg: ASbGncve4WIRfJzvxSvkkQc1qFl8eoITx429GiDGc2s4rRvDg68sQMoJgEmanhiDUuf
	ddgqncch7I6Hyrj5WkcIDbLatX7JvOl+c8tULFQd7svBP/Unu57DOgj12BETM9nqxvqeRawb+cI
	7XlNnFVbCxT+mheHj/FsbGnHZZSiQw8yd1x5/ecjN9xlVgpiAP3lzsBYMnRfRiDAv3Bka4Ff37a
	AYLwj/XioHB270BP4Wnxuh8GDWkbmffsQ5+oJdYawAUBokigGmipMepeEaBNEgbJNl2YtkxcpKv
	Mg2TrKRJ0ug7nH+4DyMhr389L2SmPvj5OBAx6dKfiwloEx00/P6eY2aRo81KhJYnzIWo2TmHOPO
	Z7UrydinaE6WbMJ6+n3bZgZQye8jQ1oz2dKSG
X-Google-Smtp-Source: AGHT+IEAzEGjWuHMus1XDYl0PiNkmllaOO69M065vbKdwdWl1n37RJb78JR7OOuVsVm98bpKzaxCeA==
X-Received: by 2002:a05:6512:3da2:b0:553:26a7:70ec with SMTP id 2adb3069b0e04-5550b79db9cmr5623472e87.0.1751370494435;
        Tue, 01 Jul 2025 04:48:14 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:13 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 22/24] pmdomain: core: Leave powered-on genpds on until sync_state
Date: Tue,  1 Jul 2025 13:47:24 +0200
Message-ID: <20250701114733.636510-23-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044816_096623_A9C74383 
X-CRM114-Status: GOOD (  14.91  )
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

Powering-off a genpd that was on during boot, before all of its consumer
devices have been probed, is certainly prone to problems.

For OF based platforms we can rely on using the sync_state mechanism that
the fw_devlink provides, to understand when all consumers for a genpd
provider have been probed. Let's therefore prevent these genpds from being
powered-off until the ->sync_state() callback gets called.

Note that, for non-OF based platform we will keep relying on the
late_initcall_sync, which seems to be the best we can do for now.

Suggested-by: Saravana Kannan <saravanak@google.com>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 18951ed6295d..a86aeda1c955 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -1324,6 +1324,7 @@ static int genpd_runtime_resume(struct device *dev)
 	return ret;
 }
 
+#ifndef CONFIG_PM_GENERIC_DOMAINS_OF
 static bool pd_ignore_unused;
 static int __init pd_ignore_unused_setup(char *__unused)
 {
@@ -1359,6 +1360,7 @@ static int __init genpd_power_off_unused(void)
 	return 0;
 }
 late_initcall_sync(genpd_power_off_unused);
+#endif
 
 #ifdef CONFIG_PM_SLEEP
 
@@ -3459,6 +3461,7 @@ void of_genpd_sync_state(struct device_node *np)
 	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
 		if (genpd->provider == of_fwnode_handle(np)) {
 			genpd_lock(genpd);
+			genpd->stay_on = false;
 			genpd_power_off(genpd, false, 0);
 			genpd_unlock(genpd);
 		}
@@ -3486,6 +3489,7 @@ static void genpd_provider_sync_state(struct device *dev)
 
 	case GENPD_SYNC_STATE_SIMPLE:
 		genpd_lock(genpd);
+		genpd->stay_on = false;
 		genpd_power_off(genpd, false, 0);
 		genpd_unlock(genpd);
 		break;
-- 
2.43.0


