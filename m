Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C03ECE8E8B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CBiG9tFbLqIx7KKBRCWnQHbT9NWhqeOvBRJqbKiGd9Q=; b=oHp4yasXhS3+mwsS4r/tfJla/7
	Ju7P10MfSJIGDusBxsn776zxADX5oQ53LvGllJaO4wHnWahduDrgLNrsJPTNe7jOfPIrNC/pFpLab
	i6kOTiyLGV2DFQgNEkRqg1erDkAzeos7/dxzURJS32JTWZP68Wdiee0ULzsTg+KAW+dDRnskTgTj/
	iP0nE7MXHHMU7qQVzMWYbbRecHpBzv36UlthNiSvkRjCBGSt65ZlzwqElej2i5r5D7DfaUr7QjBej
	0v4dJ7RmHp95vYmWpmnqe7ds+C/5VcnhngIhI0BQvUJxfd2sFdp6otEdiUrGUZuHT5bNfHJowMzGE
	6G+eX+jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ztD-00000000w8A-1va6;
	Thu, 24 Oct 2024 15:36:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zXM-00000000sXi-0QgE;
	Thu, 24 Oct 2024 15:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CBiG9tFbLqIx7KKBRCWnQHbT9NWhqeOvBRJqbKiGd9Q=; b=M6OPtpzQvZbVZiuWkrc3p230yO
	HPi4NVdrU8/xETZanFmH1TXojf2TVftlbJ0yeckBFO2H5M9ewFODfiIlLKKUQ2TZ4B+VaLOJlYo3V
	gMlBfqXNvnAUIqP4eSMh1ozb4FuGzAwLmSbRRIFS7Z0SEZVtX0zL2n6RD88nuX1zfwTxz5cH/LCpr
	lxKZncYmIzYeesPhCulT5IsBXKxeOb/iKZAGbcntkmVL6ZSwCIjRMmQXfwFIqAMaPOz0rPnD5aALX
	FmIBOq5kt+8/ABsCJ07pe97Qd1SsUFUXSnRweIccoyDDTjjvSyl6GcezzRsZVOhbP7tPnBPJtNxAC
	igChQNHQ==;
Received: from i53875b34.versanet.de ([83.135.91.52] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t3zXK-0004at-Cr; Thu, 24 Oct 2024 17:14:06 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] HDMI Support for Theobroma/Cherry rk3588 boards
Date: Thu, 24 Oct 2024 17:14:00 +0200
Message-ID: <20241024151403.1748554-1-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_081408_186440_A389257F 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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

This adds HDMI support for the Tiger and Jaguar boards.

Heiko Stuebner (3):
  arm64: dts: rockchip: add HDMI pinctrl to rk3588-tiger SoM
  arm64: dts: rockchip: add HDMI support to rk3588-tiger-haikou
  arm64: dts: rockchip: add HDMI support to rk3588-jaguar

 .../arm64/boot/dts/rockchip/rk3588-jaguar.dts | 50 +++++++++++++++++
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts | 53 +++++++++++++++++++
 .../arm64/boot/dts/rockchip/rk3588-tiger.dtsi |  6 +++
 3 files changed, 109 insertions(+)

-- 
2.45.2


