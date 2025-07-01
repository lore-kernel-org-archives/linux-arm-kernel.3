Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EA5C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79lLQOvWjPgr3ms40rqLbg+1wi6d2CJf/NthKCtHiEc=; b=R3YtKG3cfsY3sZu9Dqbv4xnYfF
	FOAwV8J1Db8oXOqJG/JtFyauH0L44SWVMiaQeyW5xCOtrnwVKYd0SLevVhlwFh51jfgzP1tzsxzwL
	9tcv+g5AJhY68qLsODFnVNSPPQlDSycRWH7/mIYOHhROnPw2t5C01KAnQOojV4J0Vp8K7lRZcsucD
	Mp60v2vO7ZXHWyoJABUE3E24UA+QZ5iWQTIcBfMMeRlVzWbP5jn/mfjJpnl8EoUwvnrT3976J2+aG
	FgdO5tHTS34wRgNAJeieuWveArbu72+BgQx7vodboDaWxBECnG0IUax86hDbpFzBh8BRqeps8SeZ/
	lLl8OsRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWa98-00000005Jy8-34qS;
	Tue, 01 Jul 2025 12:31:34 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZSu-00000004ufJ-3QDY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:47:57 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55511c3e203so3173785e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370475; x=1751975275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79lLQOvWjPgr3ms40rqLbg+1wi6d2CJf/NthKCtHiEc=;
        b=D3KmUD0YNXVjTQuVmyM0k0KORw6/EUzdsUtRGTBwSP2wZ8BMRe5SFTANYoi10kMrXL
         Rn2jofLPtuf9wmXnSUFIV212m2p+xNalxPHPmkbKpwZWf5/QsCNce3ILomFZdPcWO/pF
         Cn2r3FZzCWmDmxylK+LRrMh+gqem7aU8alqr6FBkRP5B4lKwOvSNRnmeKRj4mreeDxD5
         Ftsn7GKUlCWwuNFpP9ps7jYRZmj8lNq2Y7k5QndM7psOJVirC2NQ/dgjDIZTX49kQ9x/
         g5K0iRK0nLxUl8GF1J0iIioRQMLUjMdQ8fpCTCYVVEo6i2NPt9eY9fWZGO0h6i6QXnAg
         79yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370475; x=1751975275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79lLQOvWjPgr3ms40rqLbg+1wi6d2CJf/NthKCtHiEc=;
        b=McMXdPDoRrK54QlLIqgnwFCPlweAcigrjRcxq4SMFYl6QA9eX92g0nBFkmOx/FSyKI
         wgtli+UjszukUx/GJ343mRx2/DZ7ZVN6/Dz7wzpa+KVDH41vELvVq2VHY5AymgZEDdtm
         GZS99F6pdvgsvxvsJydF2frYjHzX3fZHILRm+2kmnjr/K1sNkaVaD393lxtF6SUOmGfW
         XgOr9Z1jPtUPnhPN3iPRNZ8Yiw/45iYA74kk51S+b13CBWFfZ9FmjxkBaXvVz74icWBs
         tnUyCp7q+rpQMGe1gGsQAlbmQ+g622ZdLmb0mYlj9hpuji5KLSBowjmGwnNjMBEKBWpd
         +Jdw==
X-Forwarded-Encrypted: i=1; AJvYcCUP7dPVu3Oogh8MbgqluLaH+4aduj/MOy53faVdYtkKUQliiJGQS/R6UfDk50aJvPVVYpxYb/bLTE8Ss/RAfisK@lists.infradead.org
X-Gm-Message-State: AOJu0YwzXyZx+e2pa3Gqt8ctlUDaZJv2I5sqHLbOfZeTmTEsQ9sxRJq9
	Q6laLsLaxQYibh27l67JRYxM/1INwNlfWaaA/D5KIpgBwPMCOuDy1xXK777J7tfZxe4=
X-Gm-Gg: ASbGncv972VwLTi+09H+EBNBEi4LJq1Tw7YDETMPOgfl5cJ2obJR3wLr6ffVGvySN1A
	yxbcdKy3wNdw4olNwMs8ux18F/+EE6+4gjoSjQKMR54vy1D47GVAuoEYX87nsAlm6x1QvHP/vyO
	SP51ry93E19P6vuVGFA7blBp/ZPDe74ovnvg/uXfNP7RrEgAFCAmAzS3wZkYc1QzBOgVl8z/qnB
	p1hvA0B4qjfUzsEN9LAKB5syihqJdHb7lMXqU/JaLprga8mGhJ69Y4FZKrMk62ezcGa/M0Dhs62
	TVGnjFHaIsjPiRPohze9PW/slSZqy4mYmqPKRQnu3wIAfCRYwJp+Jv/fDAJO2mqIhPt/lMY0p8c
	4x1tI9gUnVrjarskCZ18vzSdWv3HaA2JGcfym
X-Google-Smtp-Source: AGHT+IH4G62NAIzkTDdd4Bnq5FbST4e5sFqlJvIjwn56lcRCHhQ1EM+lmASjybjZreaBKv2h5BjCKA==
X-Received: by 2002:a05:6512:3501:b0:553:296b:a62 with SMTP id 2adb3069b0e04-5550b7e761dmr5493897e87.12.1751370474952;
        Tue, 01 Jul 2025 04:47:54 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:54 -0700 (PDT)
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
Subject: [PATCH v3 08/24] pmdomain: core: Prepare to add the common ->sync_state() support
Date: Tue,  1 Jul 2025 13:47:10 +0200
Message-ID: <20250701114733.636510-9-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044756_862832_BC60AEEA 
X-CRM114-Status: GOOD (  14.35  )
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

Before we can implement the common ->sync_state() support in genpd, we need
to allow a few specific genpd providers to opt out from the new behaviour.

Let's introduce GENPD_FLAG_NO_SYNC_STATE as a new genpd config option, to
allow providers to opt out.

Suggested-by: Saravana Kannan <saravanak@google.com>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 include/linux/pm_domain.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 3578196e6626..9329554b9c4a 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -104,6 +104,11 @@ struct dev_pm_domain_list {
  * GENPD_FLAG_DEV_NAME_FW:	Instructs genpd to generate an unique device name
  *				using ida. It is used by genpd providers which
  *				get their genpd-names directly from FW.
+ *
+ * GENPD_FLAG_NO_SYNC_STATE:	The ->sync_state() support is implemented in a
+ *				genpd provider specific way, likely through a
+ *				parent device node. This flag makes genpd to
+ *				skip its internal support for this.
  */
 #define GENPD_FLAG_PM_CLK	 (1U << 0)
 #define GENPD_FLAG_IRQ_SAFE	 (1U << 1)
@@ -114,6 +119,7 @@ struct dev_pm_domain_list {
 #define GENPD_FLAG_MIN_RESIDENCY (1U << 6)
 #define GENPD_FLAG_OPP_TABLE_FW	 (1U << 7)
 #define GENPD_FLAG_DEV_NAME_FW	 (1U << 8)
+#define GENPD_FLAG_NO_SYNC_STATE (1U << 9)
 
 enum gpd_status {
 	GENPD_STATE_ON = 0,	/* PM domain is on */
-- 
2.43.0


