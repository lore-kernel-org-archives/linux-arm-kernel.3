Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75165C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtkHI/KnMWq6CTlHyr0XTNdYgawafpLs2G6PQA3uwQY=; b=LMf8hkkYFgekxB6QhYqfFUHnMH
	z0EjV7mjirbui1Vs1mt2eJwvRYB6f6cOTHHbuav5dY3BvEFn290oK+DsZrXmBKVIcfr6Cb8EZdLeB
	BZfTATEeZQWAj7WCRiYKP9/Z3NM0vZ4ql2Su6svCZCPSjP/ZPvfL1dnMWeNR46iili6EgS3ORWAWu
	UxOejDlqzu46OO6PW3Eapu4l2RKB/2bTjiAtY4dgp6IbXM7QamGJsXQvZoxAdZuNenxZSDg/U1S7m
	OuR6ADWnI2waqwVgiqso2kotpPvi6NzuZPoUnfFN+coqERV6HYRY3K2XWAXmQJQ5uuY+VMDek4Xuk
	opxPMsDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YEE-0000000EQvp-0Dtt;
	Fri, 18 Sep 2026 13:02:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YE9-0000000EQus-3HrS
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 13:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZtkHI/KnMWq6CTlHyr0XTNdYgawafpLs2G6PQA3uwQY=; b=Blv3sL1yIU13takhBCmHuSbTHB
	uMGWShNqM8/tge0021Kgq4Loo5uFyrGx2Fe+yDWLjYGf858oIxCwtNAjLR2AWY6SjTpeWIuQlhF4d
	I1IoSB27B6YCoEGHQb7XNxjY1HA+/ZP3kWN8wAnsgHlA1AVcGO3jfrfZQQcz9zu5yoXSGDX0fLiUr
	cNn92NlxSXbWsRuMxuxGkhh9Lh20od4QTvr6CjX3dCKhG8yMWyr0iUTiBnI0U3Fr4rlJc3IUfONz/
	vwciUyLdn0GfP2lspIkNZ2JXUkjyMea2KQ1JkGffWbyI0TJY7sDrjBAGdQPGt32qC3yGZGrDEqO+Y
	XbCbOeEA==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7YE6-0000000A5yq-337Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:02:04 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so3562085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789736520; x=1790341320; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZtkHI/KnMWq6CTlHyr0XTNdYgawafpLs2G6PQA3uwQY=;
        b=km7o3D3Ae5zx8ReKJVY151hIz6sA65i39YronuNt3/5ybQhI/m4HEDtyxnVXmdyomi
         x7KMDMRlO9v4qq/jMOLKPCC3ab8D+yOWySMr8jJbZKukxqdXwxLl5QDNt8eWD7SRlBn0
         oWYPIkKmygHGArOvtcJeM9jHee9sDpCBqg8nRNZ9GP1dUrboBscB9PU2ttetHOG17rEC
         F+TsuOVWix+6w5urknsd2RXhbbDTdAeff/8SplC6/36LROy2SQhoNKtdfWnN4/JoOkxL
         e4XvCtaNszhPe0JA7ffF4I9330D7Qz0tLgsLUFD0A7SGntjkyYCAvJ8Tg6mQbqqq6QV2
         fMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789736520; x=1790341320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZtkHI/KnMWq6CTlHyr0XTNdYgawafpLs2G6PQA3uwQY=;
        b=Z1IHFQ1jiRfZjDNJ18exSYGvzc+p3hQxeNd/etTNNASoSsoh5YRZmlotjl6J7ckQUU
         nYKccyTYFnOMVr35esetdpOXyeSJnJHDm3G4peDKxOgGV/Phjjr5HhnEWwLyqE6Mhog5
         BGTJmn0hmxRUp1SNudDnxFYFMueFcGeZaWDr9RnblmNxIUOyFOfBTbw0cINMjBAuMBO2
         K3I5b+YutI2QcuR1Kli8rm2BjrMDFpScwGEqluGcWXlEE3PUs2QiB6elxuE/s9WQ2gAe
         y37JWPoEUp0aYgw9t1PY/c8wbFcR9ZBIe6BVvgCCgV+6xSIzZezO6NkpNV1RyW46ZJ+R
         nGPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGOeM/EzWdDH3rWP9jyBitfGMkZgHQdqhiSbEdAy3OZrxBsQW94nTrJaxqTX3YbNcD67XxvPGB1epuQ/VcjBKC@lists.infradead.org
X-Gm-Message-State: AFuF++lQ6Opd2P3OPgLNvIzfc8Y1O7iaQLrudWCxLsjUqPhU23o1/DMb
	mNFkGAFuVnCHfIofUmajZd02wbhPeW0bZ+KU2l7kjlNHnnMp/nInkmVDSQilFdm0Xp0=
X-Gm-Gg: AYBFou2JHOQGQVLgBVOhACW/taXsQm8nf0OYo/8mHTIvtD6lB+9CGkjI1RWPFT7o060
	svmjxgLHb9lIXBxRq6YVUZlHLTFVhzb6hoLu7hfqI9A0u609xPS/PsFcObtOAm6EP4fQ3LnAsrF
	ykXkW7mNxy1DHjMQEvuoEmxj73Mkpq1/iyls6boZRTG0SeafEl1wJ88z9eaHW9A22Lg1m21okGK
	EYfeLBm9YpHCdF0fkZOSSIrNvmFSdFBYuVpncjy1gakTj7ecXZ8jQuxgVyeCsNxw1/xb5iPg3e6
	DKMS61kNiyFRvHXxsHHWrdbouxNGfSabn/X/Jaim91KSoB1E+cv2UhFiCixhamVA1MrNvJBqRCI
	mnxYihRybHlByYG1xt6VWW0qwwatO61xqDVdb/9IB2EbSntJ3KSjsBEGijeX8ZXjTrxdpGKOAPt
	LpnBzyfN7lmZq1lDp9QcmYF4Wz+fHfQHAchuO9RAffSxcT8/WmSKQT8sjwzNkM5b2sImjicXZHB
	sgYnoYAccL8dO0=
X-Received: by 2002:a05:600c:1f95:b0:49f:bcb7:8e9 with SMTP id 5b1f17b1804b1-49fc5726c1fmr60894575e9.9.1789736520206;
        Fri, 18 Sep 2026 06:02:00 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:767:e33f:e8e7:bc85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24034esm188663345e9.15.2026.09.18.06.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:01:59 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 18 Sep 2026 14:01:50 +0100
Subject: [PATCH 1/2] i2c: i2c-core-acpi: use named initializers for
 acpi_device_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-acpi-i2c-v1-1-caf4bea4886c@thegoodpenguin.co.uk>
References: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
In-Reply-To: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
To: Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <westeri@kernel.org>, 
 Shyam Sundar S K <shyam-sundar.s-k@amd.com>, 
 Elie Morisse <syniurge@gmail.com>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Devyn Liu <liudingyuan@h-partners.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, 
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Hu <hanshu@zhaoxin.com>, 
 George Cherian <gcherian@marvell.com>
Cc: linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789736516; l=1626;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=fa6kq1q/j0kmHwk4URxaYOv2Xe357GRD8EOADLztHbM=;
 b=EYFqwB3JTSDF/v6810RjGhnD5BuvCmTHk4T0POvMYduD0+qDSn25FQg7BXKXC7O8I0YPInY/k
 wW3a/ein6rHDASDulAEy/3FhDJTusf+soHqll38+PQvEAnd5Rrg6OMI
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_140203_020830_E20DE743 
X-CRM114-Status: GOOD (  15.26  )
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

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/i2c/i2c-core-acpi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 8f3bdd50186e..5161e8a7ca10 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -352,8 +352,8 @@ static const struct acpi_device_id i2c_acpi_force_400khz_device_ids[] = {
 	 * at 400KHz (as can be expected of any recent i2c hw) so we force
 	 * the speed of the bus to 400 KHz if a Silead device is present.
 	 */
-	{ "MSSL1680", 0 },
-	{}
+	{ .id = "MSSL1680" },
+	{ }
 };
 
 static const struct acpi_device_id i2c_acpi_force_100khz_device_ids[] = {
@@ -371,11 +371,11 @@ static const struct acpi_device_id i2c_acpi_force_100khz_device_ids[] = {
 	 * the device works without issues on Windows at what is expected to be
 	 * a 400KHz frequency. The root cause of the issue is not known.
 	 */
-	{ "DLL0945", 0 },
-	{ "ELAN0678", 0 },
-	{ "ELAN06FA", 0 },
-	{ "ELAN1300", 0 },
-	{}
+	{ .id = "DLL0945" },
+	{ .id = "ELAN0678" },
+	{ .id = "ELAN06FA" },
+	{ .id = "ELAN1300" },
+	{ }
 };
 
 static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,

-- 
2.43.0


