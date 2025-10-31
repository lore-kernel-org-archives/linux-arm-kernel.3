Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600E2CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Zo2jj2MOuswONrFhs1A8zruhpNCnAbrPgnW3srwcDM=; b=E/Oi5Nzp7qxnO1GWA6f4MLeH9N
	aMb36OOUJGHEDAFU6fZa+EswrbzRmUgz5BUcC2nnvQZeC9QJclb0QILYecbA2xIu1lX5col7GRg7A
	sjaTe9ncm+slDDxGRpwGh8hkaITDlaY34J+RYgSxDeIzXNDEXcCGDCG8KmY5HQU4GsH6DV0jxnls+
	Vc7+Yfg+0ZV9yagsZAISayiluusHly47lORJkJHX4V9wy9s58rOo5Pa1Ccb3RY2cIIn+xEHTM2OT8
	bT1ay6tSbDyB3viP61U2pTnQc1VJW/cD9HIV8HlpObzGr8wL6lGeNj9lOaWV1JQV1FKfukWfFEHiI
	5Gn62ZnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmgn-00000005xd4-2vAO;
	Fri, 31 Oct 2025 10:49:01 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmgf-00000005xZ5-2sET
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:48:55 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-429bccca1e8so645180f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761907732; x=1762512532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Zo2jj2MOuswONrFhs1A8zruhpNCnAbrPgnW3srwcDM=;
        b=f9Q1cKc4OBClZaROD4VkQ3wFjW3MNcKJ5h4Q5q4K4KkjoWkk9ZeeGSqdH1qQFB206G
         9DJxQAlQSyov2E+dlxRUBG8cSlEe436t9UWB91lp+aMELfTBAsz5vxhzBS7DgNK2jqqc
         nhP0NN+/JGmeL/3bhlePwC7+ktOuC3QBmGYW5zJlWB8ZeYFiU5AHmRyrOjuKdxID9epd
         n8b29gAQfGEAGfR7wbC91Rmd5mFrz+N9FrHBMgKr1e9kUMGINE0nymttcv/XN72tLJ0V
         AfPMGiti2CmnWG209vN+2SZDcKCrsge7njiG/rFRfNtTmQN3s27iiKXK8yLemtRAttFB
         4zAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907732; x=1762512532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Zo2jj2MOuswONrFhs1A8zruhpNCnAbrPgnW3srwcDM=;
        b=bIqH7caWpjRFluRErWoNxMGVxBTX42LICe3nSQX1z1Z5Yjk324iARfuHHivgtfLI3R
         qzNfKML9aV2sa+B60qvCQ+lf4pBFS1NF2b+Y+sG7RSsBWix5lTotXnHds+NQD0Ed2tGj
         pcEX/l9UDS7llC/qrZZUhWVzMtCOLS0OWm1lOkNRQMAw/vM4mD1YYoATblLhaEVGXKvC
         IqHv5Z/rNF6JITDVph2zpF4DRge9rWLcVAYvHdI4Ul7nVu0Zo5xUJ3bSFZmVb5jBjk03
         X2xl2wxh88ZTttIY72tdVHRGxO/rMSPFUri3VzoAdfhXm5KajeL1eWJQ0MuluxcTIY00
         LkFA==
X-Forwarded-Encrypted: i=1; AJvYcCUeQAVkN03YLBIhDei+y4FIDCopQFDeWP60XCATXRczgDaSmUiguopW13GUraMWhlhNPNrph5mozdZg5ppiDwOY@lists.infradead.org
X-Gm-Message-State: AOJu0YyKyb3iZRh+63/l7l0SE/DwYItwZC08Hm0vgAkWfTrQZg3AnupO
	rSQgPum3HxSGsygpfK59lAjMib4bcMwW2LALeynMNjOOzCw1Gzs2CWvmrdrjsru60dQ=
X-Gm-Gg: ASbGncvStnlr3l5eZueql/0f4rXTe/zXfF+DRhnxFqfJW+E5JCQBlU+1oj6rY4AJlLU
	tKugwMue+K+6/8PimsChnnOmeoke99cJ5isalFz5my5mJHtPF1aAu30YrE7BN0UiGTdvey1Qd8o
	NgXrpapmCJ9QAU8Zq5BKTYU9x4KqHdQW7dKzhjIpxXycsI2lhgA3hNOZXtfJeA8jXh5POXOtGhh
	e8SdVnofLcDlOir3qXCFNNxHsfsFXAZNsqGC92p5iSWmpsUtK0c2iBk3zNuCKh6QdKqfYy81lmA
	VtROTtRrMQxAZ+WKePKjkasOrybzjDMEIKhlbnY136FcVItZgXIo7Wghd7oWjPGd8RoPOM+QKfH
	BzyIwTtrXiHqcwrKIf7Y4FEJjVIEXZgoqiD/ZZSDrgrSbqjejI+OwwVToye+CgXsHD6n6OlL3Td
	fj6d719NhGaptWeO/0PRRzddR1YSIh23x6Q4o=
X-Google-Smtp-Source: AGHT+IGobibt4LNxx3fw5hmxTlHoYafBePMtzQoeq6djNMJvhNOcnjqVzzpJ8k598YLOu8WNRveGDw==
X-Received: by 2002:a5d:5d02:0:b0:427:9d7:86f9 with SMTP id ffacd0b85a97d-429bd6a8f88mr2587154f8f.47.1761907732011;
        Fri, 31 Oct 2025 03:48:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c102dfd2sm2961635f8f.0.2025.10.31.03.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 03:48:51 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 2/2] drm/rockchip: replace use of system_wq with system_percpu_wq
Date: Fri, 31 Oct 2025 11:48:46 +0100
Message-ID: <20251031104846.119503-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031104846.119503-1-marco.crivellari@suse.com>
References: <20251031104846.119503-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_034853_739866_39AD368B 
X-CRM114-Status: GOOD (  14.57  )
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

system_wq should be the per-cpu workqueue, yet in this name nothing makes
that clear, so replace system_wq with system_percpu_wq.

The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index ed6e8f036f4b..deeeface0b63 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -276,7 +276,7 @@ static irqreturn_t dw_hdmi_qp_rk3576_irq(int irq, void *dev_id)
 
 	val = FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_CLR, 1);
 	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
-	mod_delayed_work(system_wq, &hdmi->hpd_work,
+	mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
 			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 
 	val = FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 0);
@@ -319,7 +319,7 @@ static irqreturn_t dw_hdmi_qp_rk3588_irq(int irq, void *dev_id)
 		val = FIELD_PREP_WM16(RK3588_HDMI0_HPD_INT_CLR, 1);
 	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
 
-	mod_delayed_work(system_wq, &hdmi->hpd_work,
+	mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
 			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 
 	if (hdmi->port_id)
-- 
2.51.0


