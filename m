Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E60C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GidM2RkVPSnp2I62eKw/eMu8qqKqT/4Si7o7i4IuzDE=; b=lGK9cMLVZtb85t1txHGLcQvVeX
	S+7eW1XP/zwUTbdfTglbTKU2C3FYbs3l0rlMzQdqEZmCSGFExsvI2OJgksz9BQNnWUpXtmd3e2M1j
	PkCCPMtFbMuU1zhbKv43zWbeF8nuEPg1Mc3PRdKxhBBgSLkQgMHouTswBRrqv4+Q1EqnqoznZBFnM
	a+KKAGRZ7IED/k5/bO11zJpK0bAsrU8V5rREY5kusa6htSBpN72axdDy2Wvxq7+jr5ANSrEqijjtU
	hgkfF/NDkyShNqPSIbjC6dKnCV8fxqHZVxMeQCzIKtV27nOaWY4+nEOL/Jsxyxs2PXHiQhI5YtKi0
	tUaC8HyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcna-00000001m0f-1g40;
	Mon, 10 Feb 2025 23:02:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcWx-00000001iX0-0rqq;
	Mon, 10 Feb 2025 22:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GidM2RkVPSnp2I62eKw/eMu8qqKqT/4Si7o7i4IuzDE=; b=mxozNTaXaiC4P92XDsxmJkXnIx
	YJvIOQZUDf2lb5IKXcSFIRKpFpAAfMCl2winC4fF98X9fIBl8xZsb1LqJpWID65S9ulPguWZAEUNV
	V462/x6UCKQfF9q5S5A0wAvDKr8GgBYou3b7Xlt2WNtnAUc2T58egS36AqC9s3BBe9xFMozm75ao7
	xpe2pQBsyI6UAz4BWU6rKbLAiRFyPqdXX+e0TFZBjkzqLXwLeBHqfGB3fqpdn5ENBWMq6GCG5aA3B
	VMgZV233qq8KnfOdZErp5PJq+Ea/j9VvK843xyFAgZPCZgoyywdHcIJLm0d6IWhyE/D/AarBcTk+4
	aYAGdkEg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcWq-00000000L3O-1DFU;
	Mon, 10 Feb 2025 22:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GidM2RkVPSnp2I62eKw/eMu8qqKqT/4Si7o7i4IuzDE=; b=Ai3PI4V48kVOVSeVp+RWvcmQRE
	oOBFyiyAay9K5W5ltOJ7xdecpX/GsLCAko/ELY234sinuysiZfbka1nAATlarkO2idV00wp894J5h
	rDhP1cMNGs47ygow/gx2XoRr7voIaRx/snsisuReU/shOWCpPjVnmhT9cx5mEzvafBxjK+BoI2Y+U
	qVQ3+Uj4cwORk+f/3KCDZXsgHcs4BCnd2J464G8xygt0L8fkUB4FgE6nagZWPzumacz2A4Mh7a+R/
	TgLe6vdLJx9t81BWeziQl6JdTpWi10g32MechffHGgTwpwux85EDpXNdYyLUmt4rhhSO7aeu55mNS
	SkGgN8rA==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcWp-0008Re-C8; Mon, 10 Feb 2025 23:45:23 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com
Subject: [PATCH RESEND v2 2/6] nvmem: rockchip-otp: Move read-offset into variant-data
Date: Mon, 10 Feb 2025 23:45:06 +0100
Message-ID: <20250210224510.1194963-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210224510.1194963-1-heiko@sntech.de>
References: <20250210224510.1194963-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_224524_483538_55FC2627 
X-CRM114-Status: GOOD (  16.56  )
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

The RK3588 has an offset into the OTP area where the readable area begins
and automatically adds this to the start address.
Other variants are very much similar to rk3588, just with a different
offset, so move that value into variant-data.

To match the size in bytes, store this value also in bytes and not in
number of blocks.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/nvmem/rockchip-otp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index ebc3f0b24166..3edfbfc2d722 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -59,7 +59,6 @@
 #define RK3588_OTPC_AUTO_EN		0x08
 #define RK3588_OTPC_INT_ST		0x84
 #define RK3588_OTPC_DOUT0		0x20
-#define RK3588_NO_SECURE_OFFSET		0x300
 #define RK3588_NBYTES			4
 #define RK3588_BURST_NUM		1
 #define RK3588_BURST_SHIFT		8
@@ -69,6 +68,7 @@
 
 struct rockchip_data {
 	int size;
+	int read_offset;
 	const char * const *clks;
 	int num_clks;
 	nvmem_reg_read_t reg_read;
@@ -196,7 +196,7 @@ static int rk3588_otp_read(void *context, unsigned int offset,
 	addr_start = round_down(offset, RK3588_NBYTES) / RK3588_NBYTES;
 	addr_end = round_up(offset + bytes, RK3588_NBYTES) / RK3588_NBYTES;
 	addr_len = addr_end - addr_start;
-	addr_start += RK3588_NO_SECURE_OFFSET;
+	addr_start += otp->data->read_offset / RK3588_NBYTES;
 
 	buf = kzalloc(array_size(addr_len, RK3588_NBYTES), GFP_KERNEL);
 	if (!buf)
@@ -280,6 +280,7 @@ static const char * const rk3588_otp_clocks[] = {
 
 static const struct rockchip_data rk3588_data = {
 	.size = 0x400,
+	.read_offset = 0xc00,
 	.clks = rk3588_otp_clocks,
 	.num_clks = ARRAY_SIZE(rk3588_otp_clocks),
 	.reg_read = rk3588_otp_read,
-- 
2.47.2


