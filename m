Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B571D44157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BEPLXOAQeugFgDKChVlT8VIgkLIi/DDxz/mYsa3wLfQ=; b=fg9dLydplhNic7ItH5IpFBp74F
	VMIMKpYQSWGOFUBBmn4B5TKPOuhjSgF5NTJK1mcAzffCKdlgO1DjAdDF3LmU1tGc8bM4qWaFzKGl/
	QcgsDMdcwl6oAvNnVm0G0f6WBLo6Q87T68pdyOhejekHJM0aIbA0Tun5x7tDwF9pSWZdZKHRhzG1i
	8MpuPQm51DPQJFfR2L3WRmVfy4jjYwfrzLQZZ0VxvR7qWC6QBlvSBZfzfdd0i82CG/fxtsWmedHRx
	ZU1Wvmf/lXVl6BGm/D/4S4CM1KWDoyQ4rBOjQMNYBVEY6zK+kk/eina+pZeAczejdZTPNSUI5VLju
	5S91ZVIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOOK-0000000CWmw-42HF;
	Tue, 19 Nov 2024 13:35:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOIs-0000000CVcG-0i9o;
	Tue, 19 Nov 2024 13:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BEPLXOAQeugFgDKChVlT8VIgkLIi/DDxz/mYsa3wLfQ=; b=F5lQ5yigIzEZ8qRRmX5lvzMcWc
	yvBRTNsDD9j6GgWwKM186+eSV4S4TQ6AAIHIuyCuG4leCwOSIGyqRdCANxRp4bGI9+lNebfQ32gjl
	z340XFkZU1p56vLLHZN3BNo4GaeD2LA2EAskVS5LbniUuiKk7na1wNP5SV+1+ZRPACigRRNTsInau
	QsllgZa78IjqChyFL3VdGRMUqkrOyZcKNgXUYkVzjkRMWy3ajjYI+OEO7mX988ztJQSdH6MLvi1VL
	8OT5I0tWY8OJ59dpO4KI1HPBy1VAzJujVVT0gPbyx/ldT71fldldtw/tpagd9Q+mfj2NaVAtsgdzW
	Uubfkl6A==;
Received: from i53875a30.versanet.de ([83.135.90.48] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tDOIo-0006z1-W7; Tue, 19 Nov 2024 14:29:59 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	detlev.casanova@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	sebastian.reichel@collabora.com
Subject: [PATCH 4/5] nvmem: rockchip-otp: add rk3576 variant data
Date: Tue, 19 Nov 2024 14:29:15 +0100
Message-ID: <20241119132916.1057797-5-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241119132916.1057797-1-heiko@sntech.de>
References: <20241119132916.1057797-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_053002_220203_E7301282 
X-CRM114-Status: GOOD (  11.92  )
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

The variant works very similar to the rk3588, just with a different
read-offset and size.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/nvmem/rockchip-otp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index 3edfbfc2d722..d88f12c53242 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -274,6 +274,14 @@ static const struct rockchip_data px30_data = {
 	.reg_read = px30_otp_read,
 };
 
+static const struct rockchip_data rk3576_data = {
+	.size = 0x100,
+	.read_offset = 0x700,
+	.clks = px30_otp_clocks,
+	.num_clks = ARRAY_SIZE(px30_otp_clocks),
+	.reg_read = rk3588_otp_read,
+};
+
 static const char * const rk3588_otp_clocks[] = {
 	"otp", "apb_pclk", "phy", "arb",
 };
@@ -295,6 +303,10 @@ static const struct of_device_id rockchip_otp_match[] = {
 		.compatible = "rockchip,rk3308-otp",
 		.data = &px30_data,
 	},
+	{
+		.compatible = "rockchip,rk3576-otp",
+		.data = &rk3576_data,
+	},
 	{
 		.compatible = "rockchip,rk3588-otp",
 		.data = &rk3588_data,
-- 
2.45.2


