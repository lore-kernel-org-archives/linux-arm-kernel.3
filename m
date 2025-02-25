Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C30C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R66Myrb815a2WZP3G5g/ewvPF3fMxnEmoDEZgjpJrTg=; b=lhgTU/rgQd5YfBR/1L1bOjEjcm
	z2reSFOak245cJEQFgNCTYA8RfzO7KIj0mpvVVxyjgN5lnA5git5R6QhiGgVYEEClWxdGvC98YwBV
	4UcCty6YbbYqxqsZxyWwiI1ZWmbS2wZmI6D1ahZHkZoIzJiqROh0MKPoQHvUMnQj2twQWrCqWjvjk
	94mlFHXcDR1Drf3SK+Ja0vpgQFu8OPUnTptxUz0ALFYoZMX5zZTv/itm6SCdszehTO7+D9t1Q9o5D
	iId3FIHQ4c8i3AyAFDBoNITgGBS6MoisGCalttOE2+3CNx8JRIY15sFXvQESeJUyiwCz50QFFVbfv
	MrCOuTXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0eb-000000019El-2vml;
	Tue, 25 Feb 2025 19:31:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzwA-000000010tR-2H5V;
	Tue, 25 Feb 2025 18:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R66Myrb815a2WZP3G5g/ewvPF3fMxnEmoDEZgjpJrTg=; b=G9OtWPrLluyK+WuGj3VYHd03s3
	li6/pRdI8d8UAw4ZSnrwZP21VlE5jNT27KKQ0TIA4gekQmSCB/2Bo+oY8AbOodS93wDstP054jpqA
	0lVscOWVWCpVRCFEhu+GmteTSxkdhHi6s6eZFzwQEb6vn/QgBRhE2gj6ueXBSEMjpxUjqglpfa/Pf
	O1f0dSQ8qV/A5jncHQlSbLteg7bDVtdWYOb6oN8t5T5SYNRfzxaMl2OpJJt29ssRhq0Vr5TNcz5VN
	D5xdCu9CJEFqU2zFYjB0Zo9yJxZLtncpwejbN9rGjRu4xBBDC1l4wlMbdKt45LbN9T4FpSaX5kumd
	dRZIIahg==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tmzw7-0006r3-Ar; Tue, 25 Feb 2025 19:45:43 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: heiko@sntech.de,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	sebastian.reichel@collabora.com
Subject: [PATCH 0/2] phy: rockchip: usbdp: improve typec orientation handling
Date: Tue, 25 Feb 2025 19:45:17 +0100
Message-ID: <20250225184519.3586926-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_104546_614963_09E4D111 
X-CRM114-Status: UNSURE (   7.45  )
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

Reinit the phy if it's already running when a type-orientation
event happens.

Heiko Stuebner (2):
  phy: rockchip: usbdp: move type-orientation-switch further down
  phy: rockchip: usbdp: re-init the phy on orientation-change

 drivers/phy/rockchip/phy-rockchip-usbdp.c | 173 +++++++++++-----------
 1 file changed, 90 insertions(+), 83 deletions(-)

-- 
2.47.2


