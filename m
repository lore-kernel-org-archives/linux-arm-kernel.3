Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15030C54F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRfyxZvH5+TpkOAftwgj9mo3UBVnLXBhqh8LLeaEC0o=; b=OMi+KsitAJMx7+26y0qf4dlY5m
	ke7rrOk2OHd/KGxzFv7mV5y80HeGkdYXPOKi8//nsMGKMoooeiXmjfjXlFJg+Ab6D/m7V+kWD7dQT
	ZvOgiJBesbMYAKwjONqeF+OUIK+nXMoplGNg1PABKaxYV9odO3QcIIz7EFBjnFWnSmIfP+BmA3ZUW
	wdCfsvT7YqzMaa/988UJx19/SPxzjhzQDweA4n0waSsVsQerdTZfOHHky9n2c8WG9zzjRzgdXTK6k
	0sW4lhFjffq2kBGhbyDiORq50c94HsUmMvs1Ypw75ibq4wF5cbTEQbRu9SglSR4dlZc+VcfXxuLp0
	wMYO4EOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbE-000000045g6-4BDF;
	Fri, 23 May 2025 14:42:16 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISdl-00000003zIU-0WxU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:40:50 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-549b116321aso11081554e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007647; x=1748612447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRfyxZvH5+TpkOAftwgj9mo3UBVnLXBhqh8LLeaEC0o=;
        b=nkyViPCECxhVtAwB8gf4Qwe7bozyxGFPlSAo3CbSw/Uh1dg+wJJu6NC0ncClQtT2hZ
         OyJ3sNqPM+hcqYOPHSkieGpsBhxLQ6x695HicAB6eHzF/RVwnvf3lDuxU/Eg27p06Df5
         Y/LsN8ohcHeXQS3ixDzIteW2wMA8lVc3ha5adWft7dfD6nrV+Y8sirxKCpewd5z0wfIm
         dO/ttCv9sxM7uSl7DMoC+Jf2ZP0OURtbtO2UGOjSHe94V7z0HQ3yzIyhoHE14xgrkz9U
         NthtMIoN87LoaguwWti51Dp1QlrnL/w3aIZLmODBg/+P3+xzL55Z6kXFGKnvmcRzpOlo
         UD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007647; x=1748612447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRfyxZvH5+TpkOAftwgj9mo3UBVnLXBhqh8LLeaEC0o=;
        b=BCJLCIHVfVjfUoeQupVATVpQ6JyXYm0JnfdnkCM7/S+SQHtRs2j5qYONyi66LFTTVq
         qIvcsAi7nTgza/ar3ynZvasKZIntyr083kAlPrOS3XecSGkrEpGvyOEAiiBEejl0U7zA
         klIpSlgDnrnLQYOjUHVHbdeQBQnFHAYrjtLT2CWAxXpFnMjh4ACf8gD74x8xkmZ1Y0au
         ReSYykGF6r2PcLdYzrS4N4/H/SR+H+7Ici2CIPSQRx6jggZ9S5INfIZ6pQQtUjocFk7Z
         xhHt8XdbhkPp6zGngjUDVm59wcR6yLGQJtanA/YjX5B1j25vnXD7DfW4MxVmW0GZ0kqY
         sJKg==
X-Forwarded-Encrypted: i=1; AJvYcCXaA+j8a3OGIkv6KOVkB4ahBZFwnGxmm5wjuSlNYhcznl06dterthbM8ECyGlGtWf/D714rgG8zLCokc0LcbcoL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+0UwrkSgapEDh7KajA/xpAXDR8KQpWAZ+WBu7pW0UzhN+ST5g
	yJDzj5hyNGNZi25cyqR+qaykw37FhENUGtl7HrD1reJoMGfHYQ8yQ3nQY6jPumG4JQg=
X-Gm-Gg: ASbGnctxDqtZadOg+Zs3PijG40o/XuZQsYm2Epynnv0nZDicpsUjVvz481gZoqk1Gmn
	L3oehuYg6woHsktP82KDhskcs27TzwzRklwJ7lX6P+gSxUdVsAxqHIroxmi5IzVz8A4zP2UU/Ck
	6eiZV9P7Usttg2j6hy3KDJlCIaIXrnWvqHGQ/VAfHXmsiJNg5mMaEwVJr6U7xOBf3ivNhCIKMEm
	/+/wD9VSiZHqeGDcfu5Mxx8GhXmHxfsroQDDbVRA5uDCj/RYzfbLCOblNl6Qe/GkPgrLBkT04ge
	0DiIYRZ27qWb9RZnH60vJ0sp5stmxwOkVCGWMvbwf38BUIr/fDM3DcOVZa9huda9HTZ46acqxoY
	vBHvpeJEUt0DLFtwwuotd70pBSg==
X-Google-Smtp-Source: AGHT+IEQ3+x5BM2uDN34zUdzxKW6ya4/VolG4ReWBxvxjZOXbRaDh6MY+jvSlnL1g35O0Meqr3/ZCA==
X-Received: by 2002:a05:6512:22c4:b0:551:fd90:e4a9 with SMTP id 2adb3069b0e04-551fd90e544mr4364920e87.44.1748007647110;
        Fri, 23 May 2025 06:40:47 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:46 -0700 (PDT)
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
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/21] pmdomain: core: Prepare to add the common ->sync_state() support
Date: Fri, 23 May 2025 15:40:02 +0200
Message-ID: <20250523134025.75130-6-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064049_161141_36204F44 
X-CRM114-Status: GOOD (  13.68  )
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


