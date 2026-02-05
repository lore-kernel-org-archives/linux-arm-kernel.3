Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85B1ECD9AF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hNV9IUB5w5au3NsTLYYRa1ygl6b7jhZ/NpWWlTkpJI=; b=gir29NZ1F6OvMTF/gr+WcG4yt+
	kI0B5KiYKbr3A72e+6g36O9hY5s5w7ylLn6WayS669YWmLI95qjIuxAoDm0JPY7pdxsmVl9KwDREW
	LmUmT0Ik1YdfIEClUgwviUyyFtUsFYb9IorTPXzi9/hywSTsPR2Uf0xCmnbHrzek6viErGrBbdLSX
	YkWCL1YhlUdSyJ4WUCIZ66ar4kU+bdl/e9D3Mv8SEoJQn0fCxzGTfL2AiQLdASFvNVKSafIulg5gt
	kU8arjPqPaa2Pz75B3p3y0NPFiUQaOnCBXEH9OrAjGnWOozjbwecNEClsW3EmHlKE45PBXeMQhxNj
	aUas0MkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo7GP-0000000AY7t-0VzU;
	Thu, 05 Feb 2026 21:51:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo7GL-0000000AY7I-0kWo;
	Thu, 05 Feb 2026 21:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=1hNV9IUB5w5au3NsTLYYRa1ygl6b7jhZ/NpWWlTkpJI=; b=EYyfYt4wodonT7h7+8rY+/oC0I
	gBJ8FScAIPK9+39RLp1mRgx34ddagBLoY5NHqkI+JGgFD+HF4boH3ltEQgPNRWeNlibc9URsr1QUz
	d6fYCQC77CoCXGgAG8szMJT/GCaHtT6zUnH7PPib21HcIIr6gVA525F43T1947jF3kQ+7/VOlCBlh
	C1kqmuXG+1+OUfUdvGTEYBgjvm0mj3uw7bYchs4+rS1Zp5mwkxeISUEYYPugaY15/qjfOp7NCwOns
	2nrW5xlWik4Fu622bSBcM4CIgVw3JmVQF8ccp4FMireukQSZIb3YUVo3Y9VVPblh28FZ8+NQOQiNc
	PV8RZtbQ==;
Received: from i53875afe.versanet.de ([83.135.90.254] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vo6lQ-007GGK-Aq; Thu, 05 Feb 2026 22:19:48 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kever.yang@rock-chips.com,
	finley.xiao@rock-chips.com,
	w@1wt.eu,
	jonas@kwiboo.se
Subject: [PATCH v4 6/6] nvmem: rockchip-otp: Add support for RK3528
Date: Thu,  5 Feb 2026 22:19:01 +0100
Message-ID: <20260205211901.490181-7-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260205211901.490181-1-heiko@sntech.de>
References: <20260205211901.490181-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_135146_668377_29FFCE03 
X-CRM114-Status: GOOD (  12.17  )
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

From: Jonas Karlman <jonas@kwiboo.se>

Add support for the OTP controller in RK3528. The OTPC is similar to the
OTPC in RK3562 and RK3568, exept for a missing phy clock and reset.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/nvmem/rockchip-otp.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index 62ce22d72586..0ec78b5e19e7 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -333,6 +333,18 @@ static const struct rockchip_data px30_data = {
 	.reg_read = px30_otp_read,
 };
 
+static const char * const rk3528_otp_clocks[] = {
+	"otp", "apb_pclk", "sbpi",
+};
+
+static const struct rockchip_data rk3528_data = {
+	.size = 0x80,
+	.word_size = sizeof(u16),
+	.clks = rk3528_otp_clocks,
+	.num_clks = ARRAY_SIZE(rk3528_otp_clocks),
+	.reg_read = rk3568_otp_read,
+};
+
 static const char * const rk3568_otp_clocks[] = {
 	"otp", "apb_pclk", "phy", "sbpi",
 };
@@ -376,6 +388,10 @@ static const struct of_device_id rockchip_otp_match[] = {
 		.compatible = "rockchip,rk3308-otp",
 		.data = &px30_data,
 	},
+	{
+		.compatible = "rockchip,rk3528-otp",
+		.data = &rk3528_data,
+	},
 	{
 		.compatible = "rockchip,rk3562-otp",
 		.data = &rk3568_data,
-- 
2.47.2


