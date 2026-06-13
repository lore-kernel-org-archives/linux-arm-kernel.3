Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37162CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 06:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qXDWY05NWH/jJuuAS5m9EpuxlsKXS/Zj0XFrGsO4MM=; b=gzcqJO3XWU9/OZSVbqIwWxaPok
	KJD4olE/VhoBY4V88QjjTHSWRkOw6IJ8DK+9O/I9Occhgz/51aODT1DGDL6nFfhdvWjbXne7hDdi4
	8xyddK26wo4QPL+FEwkiw5Ggy4QN4fcCCtTcfjL8lOGchtRpqjvm5xCf+IdH4Ro86VK35c2q8Vh4Y
	TQidrWa/oQkxM2kHUTBcQaO2Ak5RZICm7vzyBnfatdDb+DdjJEHDLLfAMPX+40Q1SWEfTX1bqtljU
	lyBprDNdqJ4IOovE+FIrYn/ooKxYAxx9mDmD8C4EWOvar55j5B3I9DcNTbWki865JLNkCPyOLTy7r
	OiKWR1Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYIKU-0000000C1DN-1jKC;
	Sat, 13 Jun 2026 06:58:54 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYIKL-0000000C125-349d
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 06:58:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-491b390f9e9so9842235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 23:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781333924; x=1781938724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qXDWY05NWH/jJuuAS5m9EpuxlsKXS/Zj0XFrGsO4MM=;
        b=PUzu95ng3lIuuDEStSnCrfsVcURR/uYUrvLI6zjBlSvayx2T/568GPpyttuAChrIRy
         1l3OeKkEJswRncMNXxaymFPsG5E7VZS6hpFKG1JBYO5c4hiRTtZQK7XUeOviiJHCiNrd
         NH/oWYYY2E16gKlzSGqck0Q5cG0d4m4LzPzDeQY3UvFyFm97GOfl/tIBzO0eqOCuhgUV
         62uhzPIi2taN1dKaS1pbkMOadfmwl6L3E942kPZJDUIdDIMVNJTzCdo173czGijToP1v
         PrCc5UJkNipGA5/bH/Ck93wsOi6li4WO1mszf8TqL93xMEF/7VT0FI+pUmSLluPb2LFY
         q+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781333924; x=1781938724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6qXDWY05NWH/jJuuAS5m9EpuxlsKXS/Zj0XFrGsO4MM=;
        b=SDZwy6ulLrSRDhdoCJZ1ShkfZM89g/U0M9WsFntPBVZFvu+3GvtElnHeAVBjUvBTsT
         X5kwkgPluzUGD4TZZUtOdRueBlA68qQn5dqVWFiGxNVGxNb7KMPR4E5zl5u0IfomCbsf
         z+4na9dNUdrVfbCU2+KX2iGOwx9hHCMiNQFe+EhupFAR3wT17zkBGIzXcmrsxQ85tZzq
         jN1EhkDurrLECl46CJOevbD9c0X+qDEPEBz10ZWtLBGxrxUck6bT25pRn+yCWUHGyojU
         f57XiPM+zFIWtigA4FXFBTO9Z8qMMCECKmtn2T1mzZwtVWc2cpkdi4y0qaXHO+Wxi2qd
         e83A==
X-Forwarded-Encrypted: i=1; AFNElJ+yR3v9dRy12pgWrXvMZ4RiuD9CG6EnE2JvsKhWdyoAOWz4RN+Q2E90ZeE7aQHPozoIAm4eo1GClVYC+x7kZB98@lists.infradead.org
X-Gm-Message-State: AOJu0YwNFvclbShoKfCbN45o2w5R92JzNZMrbXxpHD6gX3i1j7t0HqN9
	F3ps88g8IWfPTToGVf2Mg1d4ezJGXoio/sWZZ9CpUANxlTAfmwQ7eAFy
X-Gm-Gg: Acq92OHiBIk3wHdvXRPoXKUOXAW7c3OVgcfUhWny/QD9EMUvgz2Mw6ZQGX0jNJtY+9z
	vwVjOoSg7AjpvGS1j7z233tC/Dreyti7S69fnWNDZo067uZFK3bLmT69HO88fAMaQXZcCo7Z4Ne
	G3L7vPkfCE2YTyshSBF2HT5fV3fSZhwag8XNrwxbjVNpvScVg5mkXKA6fiFhTRwUPxozPwhqv/n
	76fiCJGBzdZnHOSuUwr4Ndh8j+ZS2+Y/VP5omuHZkjkrbyM7yvVrinFG5mW0O/cN+eEYbSMtmop
	TOZBLd0ShBDIx3RHHZfEvTcRMoJqFoD7f6f24nln4YK5eJFC19xKNVbdyLvKCt3LT2+f9Uh/axo
	6kBP0jwtWFHQW7yS9G3aV7eNqg0EDvI5ZA0xt+wB2lpPjWY5NqiH0pthnRMDZhzDqtmluMIECI6
	0AEbPn/BwMThT+DeSSCfesfqkDkrpMLoRSJN+8P63t7g==
X-Received: by 2002:a05:600c:46c4:b0:490:b355:9c8c with SMTP id 5b1f17b1804b1-490ec4fbcb7mr81233115e9.23.1781333924116;
        Fri, 12 Jun 2026 23:58:44 -0700 (PDT)
Received: from debian.tailb81abf.ts.net ([2a01:e0a:104a:4d80:14c0:9448:1c38:77df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202e5cbasm42917705e9.2.2026.06.12.23.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 23:58:43 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xxm@rock-chips.com,
	chaoyi.chen@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	jonas@kwiboo.se,
	Midgy BALON <midgy971@gmail.com>
Subject: [RFC PATCH v4 9/9] pmdomain: rockchip: Add a regulator to the RK3568 NPU power domain
Date: Sat, 13 Jun 2026 09:01:16 +0200
Message-Id: <20260613070116.438906-10-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260613070116.438906-1-midgy971@gmail.com>
References: <20260613070116.438906-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_235845_822272_1F9D9DBA 
X-CRM114-Status: GOOD (  12.01  )
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

From: Midgy BALON <midgy971@gmail.com>

The RK3568 NPU rail (vdd_npu) needs to be enabled before the domain is
powered on and disabled after it is powered off. Give DOMAIN_RK3568 a
regulator parameter (like DOMAIN_RK3588 already has) so the NPU domain
can set need_regulator, letting genpd manage the rail wired up as the
domain's domain-supply instead of marking it always-on in DT.

Suggested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 drivers/pmdomain/rockchip/pm-domains.c | 36 ++++++++++++++++++--------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 490bbb1d1d8e8..19db307e3811d 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -138,6 +138,20 @@ struct rockchip_pmu {
 	.active_wakeup = wakeup,			\
 }
 
+#define DOMAIN_M_R(_name, pwr, status, req, idle, ack, wakeup, regulator)	\
+{							\
+	.name = _name,				\
+	.pwr_w_mask = (pwr) << 16,			\
+	.pwr_mask = (pwr),				\
+	.status_mask = (status),			\
+	.req_w_mask = (req) << 16,			\
+	.req_mask = (req),				\
+	.idle_mask = (idle),				\
+	.ack_mask = (ack),				\
+	.active_wakeup = wakeup,			\
+	.need_regulator = regulator,			\
+}
+
 #define DOMAIN_M_G(_name, pwr, status, req, idle, ack, g_mask, wakeup, keepon)	\
 {							\
 	.name = _name,					\
@@ -241,8 +255,8 @@ struct rockchip_pmu {
 #define DOMAIN_RK3562(name, pwr, req, g_mask, mem, wakeup)		\
 	DOMAIN_M_G_SD(name, pwr, pwr, req, req, req, g_mask, mem, wakeup, false)
 
-#define DOMAIN_RK3568(name, pwr, req, wakeup)		\
-	DOMAIN_M(name, pwr, pwr, req, req, req, wakeup)
+#define DOMAIN_RK3568(name, pwr, req, wakeup, regulator)		\
+	DOMAIN_M_R(name, pwr, pwr, req, req, req, wakeup, regulator)
 
 #define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset, req, idle, g_mask, wakeup)	\
 	DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status, r_offset, req, idle, idle, g_mask, wakeup)
@@ -1274,15 +1288,15 @@ static const struct rockchip_domain_info rk3562_pm_domains[] = {
 };
 
 static const struct rockchip_domain_info rk3568_pm_domains[] = {
-	[RK3568_PD_NPU]		= DOMAIN_RK3568("npu",  BIT(1), BIT(2),  false),
-	[RK3568_PD_GPU]		= DOMAIN_RK3568("gpu",  BIT(0), BIT(1),  false),
-	[RK3568_PD_VI]		= DOMAIN_RK3568("vi",   BIT(6), BIT(3),  false),
-	[RK3568_PD_VO]		= DOMAIN_RK3568("vo",   BIT(7), BIT(4),  false),
-	[RK3568_PD_RGA]		= DOMAIN_RK3568("rga",  BIT(5), BIT(5),  false),
-	[RK3568_PD_VPU]		= DOMAIN_RK3568("vpu",  BIT(2), BIT(6),  false),
-	[RK3568_PD_RKVDEC]	= DOMAIN_RK3568("vdec", BIT(4), BIT(8),  false),
-	[RK3568_PD_RKVENC]	= DOMAIN_RK3568("venc", BIT(3), BIT(7),  false),
-	[RK3568_PD_PIPE]	= DOMAIN_RK3568("pipe", BIT(8), BIT(11), false),
+	[RK3568_PD_NPU]		= DOMAIN_RK3568("npu",  BIT(1), BIT(2),  false, true),
+	[RK3568_PD_GPU]		= DOMAIN_RK3568("gpu",  BIT(0), BIT(1),  false, false),
+	[RK3568_PD_VI]		= DOMAIN_RK3568("vi",   BIT(6), BIT(3),  false, false),
+	[RK3568_PD_VO]		= DOMAIN_RK3568("vo",   BIT(7), BIT(4),  false, false),
+	[RK3568_PD_RGA]		= DOMAIN_RK3568("rga",  BIT(5), BIT(5),  false, false),
+	[RK3568_PD_VPU]		= DOMAIN_RK3568("vpu",  BIT(2), BIT(6),  false, false),
+	[RK3568_PD_RKVDEC]	= DOMAIN_RK3568("vdec", BIT(4), BIT(8),  false, false),
+	[RK3568_PD_RKVENC]	= DOMAIN_RK3568("venc", BIT(3), BIT(7),  false, false),
+	[RK3568_PD_PIPE]	= DOMAIN_RK3568("pipe", BIT(8), BIT(11), false, false),
 };
 
 static const struct rockchip_domain_info rk3576_pm_domains[] = {
-- 
2.39.5


