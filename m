Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03959C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 11:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2djU9nLQ8VglyUcEstpnVg4eaMTkukRCnzKizHYIlO4=; b=XKYphtU6t85bT2TrX0wDX797wn
	6QfIK60TL9MLjEYJgWJJTeaCxDUyBJJMonEDv7Ks8KsKXL41KeW7XdjEksMrtXqBp3ruKpOWlOSEM
	A9EaF4CpDGWjHEDqUR2CHeKzioo0IJ59lzt7heMGhz0ojO4pwS/JH4OShWBot4C0E4LFJ3R9f/fUT
	AviP4eH/LspSn2nWuEnXGn8ABvxVNwBWua1FUGxT6KYFV/NC1oOrE/F+m0eN6N1uRXf6Ub3AQJLns
	NutTCAXV0xynIlYGJOgvMwmzwNzjxlR4a94LAyNKMgJNrcFASyVGOQ9vXJ3WH3LV0jo2PXDeMN0Gu
	u/vDrpcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZZn-00000004wNl-0vTN;
	Tue, 01 Jul 2025 11:55:03 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZSl-00000004ubW-1PQF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:47:48 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-553b165c80cso5650111e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370466; x=1751975266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2djU9nLQ8VglyUcEstpnVg4eaMTkukRCnzKizHYIlO4=;
        b=dQTXU8ccbN+ENXABEZzHM/iT3RL0pDbKwZLvB+DEJc3+toSbgGTTP1qk3+NzpUM5E5
         tKslR6hDWbJoIu++Ieh42MV0fceJMieZXBVM4LAB3yl8Z1CpOJoY+73wu4aVN7DJfgRX
         rts74cmpF2nuEUE2DKbRL6+a8wIt8yNwVUzpyM/Jg8SQDtI6cf9qnpGJY3JJdAjgcNuE
         wIy/p6PdVx3RmoIUi8nlynL1rslvZ1b2Vivi2bpH2Z2bUUgpK0OnZ8Es1THrgzOW5ViC
         voOL+PwmWrbuzVl9HoVRXcvE+QRv/6qQ0jZ85x/vGFCyx4dNG/pnrRkqfrf1vXO/KKbD
         hV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370466; x=1751975266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2djU9nLQ8VglyUcEstpnVg4eaMTkukRCnzKizHYIlO4=;
        b=vj9Di2itIMGBfLWMFgwsWPAycQPRdqn/oR4i5BtWCeNtZM1JX+TW7XVD0mOLPVCa4x
         HA/45jyjRMVab3OP6dHr+2uZ39woN0Kghi6HQgUCtpHA+/ZbLfOajX5PCP5LfIvtvAUE
         bFkA0CJkLM/Dk/9CwbPAaZqrm64qzb7ZgZyRX4TqxdRyC1i5/pi8XOLqjhhhwVU90nkc
         NBBXmTDcRceOSczsbXqMgz3QJiq0nuFuNPQ/DqlYa3WwFBP2FX4DalewshOCn1weHPDS
         hs0h9neb6kVAGGe1olkwilvnHoKH0Yp47n4OA8xt6OSvLLNU2bAT/J6qN99CnME390NW
         OeLA==
X-Forwarded-Encrypted: i=1; AJvYcCU4mZHDDnAJVBrwkxzdODHHzgHCR6qQ89ijVTPBTbhcw8aatr8dtXV8Bv9FHlPPKku71eWJuKB46GSTj//rKEQT@lists.infradead.org
X-Gm-Message-State: AOJu0YzXfSpw3elApyEByi/30l9+AiwVQQq3GkBNqVsStVHIJF1pVine
	iIIxp+nPBzwIQPkhWE09gKaBEhv6VijSzMTgMLwVkX9yjeIwrTrwLFcjtOc3VZOQEPU=
X-Gm-Gg: ASbGnct5RGLsGGfb68gXK6xeK/c5bxTRo3oGrw3HowXFjITqbc8YCgN7GsRFIyjsszf
	kD78IVpekb30vOdWPgQ2hCV1LvqLGGCyd9NdN+6Yo7xOskByyshlJ9dZtls4j6pz21Gkm0NvaBR
	4F6SrouOx1OYcC8M6ZyWHATKgY+0H15jx/3ZB8NJNkRj3hvH6ESvP8ct3mCqSvz+xZEdF/RUkDl
	OFlvVhCj3/LgJghowjNQlYT90ag333mcwRAws33x7ZH5XgSMM0x6rOwnUqTBuuI28Cj93Uf2ST0
	/BVr5E0tyBAGlXsFudn9/RP2Yoj4xNDxGKXbkSX+jIY9lKxlQ3wWH+1VKl+lb76OMbZ8h4C411c
	vNBYHIn0GoVKhbkwW69sGcVgQnCoILohR3wPN
X-Google-Smtp-Source: AGHT+IFk1+sM2wFrURHBujkY60jtzQNdzYc3WqI7dzo+D/13c4kVHtOgYXZqpdwPvp8P1wttj8OecA==
X-Received: by 2002:a05:6512:b86:b0:553:2154:7bd0 with SMTP id 2adb3069b0e04-5550b869fedmr5078899e87.5.1751370465534;
        Tue, 01 Jul 2025 04:47:45 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:45 -0700 (PDT)
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
Subject: [PATCH v3 01/24] pmdomain: renesas: rcar-sysc: Add genpd OF provider at postcore_initcall
Date: Tue,  1 Jul 2025 13:47:03 +0200
Message-ID: <20250701114733.636510-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044747_371375_57345FB0 
X-CRM114-Status: GOOD (  16.50  )
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

Subsequent changes to genpd adds a limitation that registering a genpd OF
providers must be done after its bus registration, which is at
core_initcall.

To adopt to this, let's split the initialization into two steps. The first
part keep registering the PM domains with genpd at early_initcall, as this
is needed to bringup the CPUs for R-Car H1, by calling
rcar_sysc_power_up_cpu(). The second and new part, moves the registration
of the genpd OF provider to a postcore_initcall().

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- New patch.

---
 drivers/pmdomain/renesas/rcar-sysc.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/renesas/rcar-sysc.c
index 047495f54e8a..4b310c1d35fa 100644
--- a/drivers/pmdomain/renesas/rcar-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-sysc.c
@@ -342,6 +342,7 @@ struct rcar_pm_domains {
 };
 
 static struct genpd_onecell_data *rcar_sysc_onecell_data;
+static struct device_node *rcar_sysc_onecell_np;
 
 static int __init rcar_sysc_pd_init(void)
 {
@@ -428,7 +429,8 @@ static int __init rcar_sysc_pd_init(void)
 		}
 	}
 
-	error = of_genpd_add_provider_onecell(np, &domains->onecell_data);
+	rcar_sysc_onecell_np = np;
+	return 0;
 
 out_put:
 	of_node_put(np);
@@ -436,6 +438,21 @@ static int __init rcar_sysc_pd_init(void)
 }
 early_initcall(rcar_sysc_pd_init);
 
+static int __init rcar_sysc_pd_init_provider(void)
+{
+	int error;
+
+	if (!rcar_sysc_onecell_np)
+		return -ENODEV;
+
+	error = of_genpd_add_provider_onecell(rcar_sysc_onecell_np,
+					      rcar_sysc_onecell_data);
+
+	of_node_put(rcar_sysc_onecell_np);
+	return error;
+}
+postcore_initcall(rcar_sysc_pd_init_provider);
+
 #ifdef CONFIG_ARCH_R8A7779
 static int rcar_sysc_power_cpu(unsigned int idx, bool on)
 {
-- 
2.43.0


