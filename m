Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CBEC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 23:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U8qcNP21CNq1+szX+Pq/DiZmtH+Ke3MLxP+6o3bgK2g=; b=kPdBAtyTo9pv/RUoPg8PZH7HWO
	feAMoTv8k/Km/5hetxfrLoxFRuWkbyJgYXK0+qCbAbBQyfAfQd2syaPP/jsXeNykYLD/1H8AeCuiB
	XGqcBweGGFb5cH8/P0y2Uahnz4zStRvSytHNZ1i+TbzmIpiXF6QN5cRllvDsDEuemRVY3+yFy4toL
	RxCVN935oNQtfAx8nmRBze2RcYKxAKOpubA2E5IZbtaCIHFDsL8f0zU/DjJkV/LzSCbOcbsYZO2BV
	n4iDLrBHqK4wbxK6f8OjD87mJI2Du3wT0Le9QBFefKd8KqBs3C21ge8HgxLgvrR2OtFlTSCS6hY+D
	4MWdXibA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbux-00000000cKk-097X;
	Wed, 08 Jul 2026 23:43:03 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbuu-00000000cJv-2qyU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 23:43:02 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so7432935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 16:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783554178; x=1784158978; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8qcNP21CNq1+szX+Pq/DiZmtH+Ke3MLxP+6o3bgK2g=;
        b=pqxAwFsCGbkFSTbHwwh0e3yvmKj419rqj0fd+rIoS8de3IYiZTqRctYAZtW7jhcjaC
         PVNmMDWCAJFuRLGoNjL1eu6KBPy9iQ6bK7jADBxU8/7VCxbIkNgL7gXLQlRRyR+jGA4q
         qZvWhSYltGXFcmvaT1TQ3j67Fb9xxvmsdrcBUfVRhQ4GuVVLZ1zaAbX9toMxjtCjUVko
         Bw8L1A9kLoMVDAz7IsBPHkneLZQB8vuKTOatzIOKtuBhhhka9FA0edKXe3OmlpM1J0+y
         badTaEIRBsmMDl1MzmhTZvfqlq2NjILVrip3zEcp3RFv7fm+6pH6lMG97DHInToNka6t
         kmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783554178; x=1784158978;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U8qcNP21CNq1+szX+Pq/DiZmtH+Ke3MLxP+6o3bgK2g=;
        b=MOkktKjvKJz9xrU21ot1F0vdKyc9S9viMgSb1BYc/BkZgtjKGUryPN2xSJtID7nwbo
         /tRRSOZ0/TciWuA7Us3xb31mmE6Rq3SjC/NvCH2XxaZZpZkg35r/s341KMO3odPNMRcH
         h0wF8FPJoFZtctPfOb3U67DUOwf+OmFPUJLx0vua18kCjW8bWiLuh7gv66VezD9+5fwh
         o86VWmqyZCfkzTTmT6OuqOrwcZZrtXS+ReSAm49S8G4GHWXMN/lPqYeFYM87iwLlvXPK
         Sz7peUGQdMzx3ffHJEmQenGnJtR8sU4zZoNvvsevJahUZVC5ZFL5fN8E/haaxw/kwfMh
         ftiw==
X-Forwarded-Encrypted: i=1; AHgh+RrsLKoqwDXaClIh7yZ1eut0Dp9jD/a4ugW4br41OSCToQAQXOT8LTfRvvUqWCBRJptTEQ2yJKZq4SNKklnHkBxE@lists.infradead.org
X-Gm-Message-State: AOJu0YzXteF0u7awTshl6jCqYnXwwlhU+ROB+ZGJlcikVW9frY3S88Sl
	ofdj4dMwApHPpekfn0eeVrdoPU1Jev0LwiubwtxR6IKVpFtFcDorBfsW
X-Gm-Gg: AfdE7cnVUg7EbadVf9TfilGowl6c/HoXYEWLCUFdcLDUgsuc+ywDY8jgeTOBixfozlU
	M0jEm48TUB0ls+3RfvFCpyk9tMOCTDOrsvV+vYQILaET4Ts5rMFGELIEC701JLaICSPLwl5RXuc
	lbNvHgEMmqAIpjGug7nx9c4JSZlWRvRfXvAjkpn2KJWQfZ1UVkw1rL7fjuSWaFjDBaJApACC7XD
	pwx/pebW20gWxRXox8nLhBe4bt3P33Vd3st6Z94L6ktBK5YIPmcAx5/XkjmTzns7GTXhiEhurUB
	knXVoY3eJKw+iVywDF131yVmrdL1jEys57WbskCJEXK0WneTjzP8n09WxcLsde1SSzSqKX7Us1o
	QlzpYxwqfUxduopFocLCBdqL0axo+WlsusR+NXIQmJBNredvKzdVTxoztdVSIIvAF685N1uPHs0
	zPQMN6kp96dUtUEFAda5enO23GLV9mPp0=
X-Received: by 2002:a05:600c:4fd4:b0:493:e3ea:b23f with SMTP id 5b1f17b1804b1-493e6861ac2mr44972025e9.10.1783554178246;
        Wed, 08 Jul 2026 16:42:58 -0700 (PDT)
Received: from debian.tailb81abf.ts.net ([2a01:e0a:104a:4d80:14c0:9448:1c38:77df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f16cfsm15653275e9.12.2026.07.08.16.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 16:42:57 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	ulf.hansson@oss.qualcomm.com,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Midgy BALON <midgy971@gmail.com>
Subject: [PATCH] pmdomain: rockchip: Add a regulator to the RK3568 NPU power domain
Date: Thu,  9 Jul 2026 01:46:14 +0200
Message-Id: <20260708234614.499613-1-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_164300_787800_5BCEBEB1 
X-CRM114-Status: GOOD (  15.06  )
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
This patch was part of the RFC NPU series [1]; Ulf Hansson and Heiko
Stübner reviewed it there and confirmed it can be applied independently of
the rest of the (still-RFC) rocket driver and DT patches, so it is reposted
standalone. The NPU domain's domain-supply DT wiring follows in a separate
patch, so this change alone is a no-op at runtime.

Changes since the RFC posting:
- Move DOMAIN_M_R below the other DOMAIN_M_* macros so they stay
  alphabetically sorted (Heiko Stübner).

[1] https://lore.kernel.org/linux-rockchip/20260613070116.438906-1-midgy971@gmail.com/

 drivers/pmdomain/rockchip/pm-domains.c | 36 ++++++++++++++++++--------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 490bbb1d1d8e8..ba66ae7194289 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -204,6 +204,20 @@ struct rockchip_pmu {
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
 #define DOMAIN_RK3036(_name, req, ack, idle, wakeup)		\
 {							\
 	.name = _name,				\
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


