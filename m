Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6ED606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 23:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QIk14vGz;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=C/ghEGYc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OoF3aRNGJqqbd2oRzv6Oip0g+e/zxx4qNWAnUfl9xiY=; b=QIk14vGzKTIJIJ
	G5bA9Fy5pjGpvOF65S2kl11J62M69qSvhnIU3LV4DEIOx0rnDT5K1SmlcGhiGXgdNAm/SIFZbAbbf
	i91rBQpvmUKptTH/ThbJ7736eQ53Pv18cbbb0TNDZDQwzcgosoTBPXUTevF7KmsxCS3G55jkKzAdg
	RrxbDvPoxR6D7jpzg86DtFHE6twTJXfmgfHrRO0EKWgXZ6ogRxlHxiqW95JPAEPDS7mHXerVO94B3
	wLaQUIokAPbTpyUmFPjO1twEiDtkpRhFiv81m/WV4ESXHUBJA8aqhywR8mdUyFP87olun8nmAcFNS
	nBwuZhhDnISdCtpGkBVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOk5T-00000007DXH-37uX;
	Wed, 04 Nov 2026 23:08:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOk5Q-00000007DUq-0IBu;
	Wed, 04 Nov 2026 23:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793833685;
	bh=uFqwrEitMpuVqtGdZ248siC7EiGtmnXVduJ9OWh2cXM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C/ghEGYc7JoBjZgBA4Rj4apupcPsB47OKneyF4/MbJMqtgO9GsO/8eWb4Wk9thMmg
	 iPcr/SXD41fXew9ukufw09a7pxhd8Tv6zhlRMwnJdRpncZUYFW4AG6PgbPg+ZQPqHt
	 /tcRlWx275rPTRkkh4kM5HhSr5LZc4iuTtil0tuiwMZyVXTuuR3kVsLqUYAHtXDgEO
	 Yk4Lf8hnzUJVfX9sPtrWEC4els+GO11QBmu2t63beIp4zXcIg0isBfbELLJ5F02Z6Q
	 i5uokvjLaPmjYcfrVALUfoG0tMRD4DphFkGGYfsDtXuoOlRrt0JEUPUf4UkZPZYLdZ
	 sZtRpiByhzpuA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 957F217E078F;
	Thu, 05 Nov 2026 00:08:05 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5A21748002F; Thu, 05 Nov 2026 00:08:05 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 00:07:58 +0100
Subject: [PATCH v3 2/4] phy: rockchip: inno-usb2: drop duplicated update of
 rport->suspended
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-2-b20608c08b94@collabora.com>
References: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-0-b20608c08b94@collabora.com>
In-Reply-To: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-0-b20608c08b94@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=uFqwrEitMpuVqtGdZ248siC7EiGtmnXVduJ9OWh2cXM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrutXVDHZuLTW2GNGtlKmx7y1TfVLj2l9Nk
 XpEw9aduS7FOokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq67rVAAoJENju1/PI
 O/qaHfkP/j6Y/+i7bJ4su2tPd7GrvEYCl86NHL6dud6vLD72/u+F55GGjBg/Rwushf0SoETWKAA
 IbEG+nHc2Zcwb/PWSLwakFdo0UlWSDbOxYSW2DtbnSvd6VKoR9gpMHkG3zvl52Kk4YdATwpbryb
 GEeiRldew/KF3eey2yI24sfHB3/aGaHycdWrNURQEyQjVGQe/W6L0udP3zCo6j3/2GGx1VvgPsq
 SUfZ0QrUfCi7RMV9Qc9DkivNNIvEreU8XCZAj8WE6E17bHHPmrFpe0G3JzUKsrHAtFnq3r4BCFc
 HY3dYS8782kGeGnsOPSGPity+pINIoVq5+FV6+XK0jYeMUSIcbYC5VP4eA2Zz5HbjgHVcor+Sl8
 jqGpPLby2z82ccpPF7i7HX8MiQdwaPAeFzvcT6Uxy2gsapdl3RHsDZ7Z4OKa53np/WBRUcyVhaF
 rZvsQFtWAB1zSfYPuoFr+uJ9osr7Ye2uUnHNeWzHhjPJMgCq2174szgrxlK8uEZrtblFa+gnq8x
 OU0qMNDjM6oe7loY6Fg0Uj2lQeObBPecDq+2rwSwa2dDVpP6Kz5a5UDaWzv8cCDuxnO24RbkjZi
 YRBKB4xLo1wCd4oA7283pyzLnX4hF2PqOqjyZJT4QObMmU24iYFr4RpAJYSidE+YWY47ANdTeg1
 0Dx8e1opZNhP57AZlcXQsoA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_150808_286836_FDDFA869 
X-CRM114-Status: GOOD (  10.18  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

rockchip_usb2phy_power_on and rockchip_usb2phy_power_off already update
rport->suspended in their success path. In case of error it's not
sensible to update rport->suspended. So drop the duplicated update.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 0b61f152eb3f..51afbcc40c4e 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -994,7 +994,6 @@ static void rockchip_usb2phy_sm_work(struct work_struct *work)
 		if (rport->suspended) {
 			dev_dbg(&rport->phy->dev, "Connected\n");
 			rockchip_usb2phy_power_on(rport->phy);
-			rport->suspended = false;
 		} else {
 			/* D+ line pull-up, D- line pull-down */
 			dev_dbg(&rport->phy->dev, "FS/LS online\n");
@@ -1004,7 +1003,6 @@ static void rockchip_usb2phy_sm_work(struct work_struct *work)
 		if (!rport->suspended) {
 			dev_dbg(&rport->phy->dev, "Disconnected\n");
 			rockchip_usb2phy_power_off(rport->phy);
-			rport->suspended = true;
 		}
 
 		/*

-- 
2.53.0


