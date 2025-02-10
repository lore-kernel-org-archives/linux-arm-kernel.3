Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72363C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x62ijsNCPVrYm4nC3upourBy1Fy9pOeygf/DPMb93sY=; b=FqlkQz7g/J2AA4cLqT+W2pAnkv
	9RssCicvbDn/Jn2DihWph95clWf5Wk8PKRVh92gLQz6XsXaAlYfFERZAg67/Kazp7k5uu7wVHBtaW
	tXyjUMnT+1Sg0CQ8BWRNospDtr4ivzKgnbmHtyF+pWeMAR56hxFqu7CjIhU7ecmlUYH4uOm3AOQSu
	ydxCYi4p0f7h0v2R5IbZAEN9VadHPdoLn5jQMki22H8QojTVVUoTZ/cwCXHzg840RJV8IWc+w3ARH
	GGRnRgu52ZSn/bSL6JdFDGx/GIXy2VIE16obqFvvox4s8AwWejHdhSlgJLiq7zbdCNV60iKLlyiI4
	UodFaMdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdd4-00000001u78-2sJy;
	Mon, 10 Feb 2025 23:55:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcKg-00000001fOo-1Wn3;
	Mon, 10 Feb 2025 22:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=x62ijsNCPVrYm4nC3upourBy1Fy9pOeygf/DPMb93sY=; b=jw+Ka5Z1NrGe+yBo5LAU9Nq5jI
	7hZZkUHrlA0sxklJiQu/fH0suXjl6CUkZh4ymEjExMvIwvCLPobN3NC5nWKTNEtfXnPtqK1tpV8av
	QWZlWLuB7TzrATQvpxUAy8CTgsSB4d2j8vcMlbqsIZyL+xYYkbdOr1/PwDsOLUq48x4n0KkSb7cP+
	ZDPWMLrR6Vrurj5qBgqYxxLV822yIyxTrsf94RsS0nQhF/DWAOdQpY5bI4rIMCRp5dZ8ME4eXa8nt
	Bz/aC8NJr6rfixnw6krv2jq2hO7HZdTL1Nd3NDTLMpSt6QwgJ5IHmoYZF8WcEU7yJ2XNEDDH+oIjz
	0gKnylWg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcKb-00000000K6w-3da5;
	Mon, 10 Feb 2025 22:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x62ijsNCPVrYm4nC3upourBy1Fy9pOeygf/DPMb93sY=; b=yGkADEcAVgAXFy5wCvHC7hWjna
	6X3zl/ri17FCghHdsZ/6oy97l5Xa5d1Fk7C6MgqM8oyNEM9+MbYkpgpURrrh18cyv6eUHBv/LksNd
	yuK7ztbUhVG1/Sd/d5l+h77pMtT90IqtnwaPOVZDVj8k5MFhVrQRxCxdVy7fMdNC5JMz7x9f+Lx16
	CFy55gl/ju9uzEsX0VsUfGm7WEEXYlB/qlzTw76anKZWuJghyS908JglvYegsQSwpZ+DO5d+rpKzO
	UIhK3TmFFgHfcxLMowbiTkGGM2UMzvV72Q55UjbfGgoFykB09tM7uHG+qPtwH3UvD6GdHAcubPMA/
	InfyaeSQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcKa-0008Cw-Cr; Mon, 10 Feb 2025 23:32:44 +0100
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
Subject: [PATCH v2 5/6] nvmem: rockchip-otp: add rk3576 variant data
Date: Mon, 10 Feb 2025 23:32:11 +0100
Message-ID: <20250210223219.1193346-6-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210223219.1193346-1-heiko@sntech.de>
References: <20250210223219.1193346-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_223246_064698_E9244A00 
X-CRM114-Status: GOOD (  11.81  )
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
2.47.2


