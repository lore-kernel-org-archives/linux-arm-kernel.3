Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB66C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kF1f5OWyBovrnxJrEidKvqNse56WBHXzqnAOUsyHHJQ=; b=PwyJMUBC6LRlvTlhOQgY1TFH2Z
	0A4fZ3FoYw7Jqp871kTu5S4Avhv1N0/U4KexxQSSMSwdLNE+CB6cB1Yix+4QNAf0X2u5sZGzaW7dl
	wFnvma9/SpFcIm+ZrcPmYLhp5GZZMlgbxUzdjUaJatyBos5rerIHHi9HWpjikkD6Q6L7TiofUWCMD
	wIKJTQfDmBGZ6oIG0/eNiRInwBQNc77reyo/Adypg5sXOQFM8NWuE+I+ycZZtd53LdcO6emxUqSTZ
	P2UC73z1Xam4+73qocw8MZxgQDokpG0vE3WvGItzDPQxUnSOxIeHk9qvWw0+YjW2AsKCbt8CabQ5g
	0mbEXdiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfInk-00000004jdO-3wLh;
	Thu, 02 Jul 2026 14:54:04 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfInh-00000004jcc-3mqg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 14:54:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so15749985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 07:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783004040; x=1783608840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kF1f5OWyBovrnxJrEidKvqNse56WBHXzqnAOUsyHHJQ=;
        b=pzfT9+aVpd9mXq6lfbsSKiGagh9fgmf4qytMRUuhGCM5xbzp9GRj7ggi5yzHHOtRC0
         95I2OOSIB8YaG0md9lNaJQCm2Ne8SidqmT6Lr1raDnEXF4G2NTuE8iyCsITBV/yRnnog
         yO+T5Aab0/uWmw6+AQiBEjl8pD83tBv6gZJ41QQoFGajBqwMCv69cbqAhuWg6S9zZqHE
         ZNDRnOutR6kaeZl/JjaxD8dLAoX9P9JLZA+UcqHG+DX9zD1lz49d8t25rvkFUbzi2bJy
         TGRCMOKDimQmypCbFlU29Se26pIrBOEXqbxBlArCBkfM+68df9C/ie8AnW2W6I0NmWA+
         679Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783004040; x=1783608840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kF1f5OWyBovrnxJrEidKvqNse56WBHXzqnAOUsyHHJQ=;
        b=A0dTg6lnKeypgr2sdpJOmXI+KDvFhc0FOSlunpY0VdboAUaAderCi6M0H7yH5fso3P
         4cPJ4sAadu/rsZmeMYYAdkaP7/S7rY51FTMQbSdmKPvjISs9LeQC59+eM7uHhLI6Syke
         sr4QdNPcZrXrguu5Qz1ROvXaLhGHoYUU5ySycjSpkmWqF65FEoZ8EINZkVCLlXWCc2p0
         7HYNkjJyyuIVJJ9jOUkGcZDjqQBpFUZrvkTbtkKRNeD+UxqgLxkaZo+Lhf06XIxKTpH8
         J9D3FfNghENs7pHBZJmWQEXakz61KiPAn7NA6qVb9OL1xQS08KOH/+BxTGWooWZujK3f
         XTgA==
X-Forwarded-Encrypted: i=1; AFNElJ945udtCC8pVBJNsAmRnGyuxt6Jl8OgC42gJImEUkngCy0B1rB2lSp1o3BzSBSSKY1waVFcFesGNQIoPwoSLWSe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1iq4snu9FaFMa+0b+ugr7z2Fe9U/yFLBbCSikNyigLKSa47tn
	EBHzeFDe32Umlp/u3cB8BO6MnSaEB3HAxivhwRVOECT0yp6ITLZLz9MZqcFvc/jW+P8=
X-Gm-Gg: AfdE7cku/AadgKo5XTCspO2MeEDE4CQk5DeKQGqQbdJLe35XjycCNiNCKmDZuobuPB8
	h+JkQxQur+/Llu0udM0uOH0Dcz+iS33yLmloZUblC83tMumJreLoWLdmLkxh0XFcyXN5occRGAL
	Ia9CVKlF/2Pgo2FGXQaK0Kjgc/wdAsNZYX+tZ4obZGY8YoUmgukgtO+g2Hz3093KSVBuYIyTKCp
	TbKZuFAD91Bvu9dJ/k1/UdlqlzvldY/itYZc3DFm+igVUFYOaIR5AAWKkPOemIIwnherni9/5hz
	Oz1vUDoMIZTW6e8XVvupheYT4CD8h4HxNxu7cgA31ti+oYBdV0NCvhg093EREgTknLtMDGEIlGQ
	XAfSNs8A8FOQnFoxyMksZy+UYJk2d5S/nc4eq2MRMiYWtao3jfibWoO0U9WRbFpmPTkpkoImHvT
	fo+YWDH/CmSrRaip6ZcQKPzQ5ohwdxOnD44IE63xfPK6I8vrmDWmB3H69g46DNzOdShCYhE6b0Z
	TIs
X-Received: by 2002:a05:600c:705:b0:493:b962:4abe with SMTP id 5b1f17b1804b1-493c3dfacf0mr54863745e9.36.1783004039655;
        Thu, 02 Jul 2026 07:53:59 -0700 (PDT)
Received: from localhost (p200300f65f47db04bdb9899c6dd79ae8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:bdb9:899c:6dd7:9ae8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c63b6f1bsm49814885e9.10.2026.07.02.07.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:53:59 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Colin Foster <colin.foster@in-advantage.com>,
	linux-kernel@vger.kernel.org,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH v1 0/3] mfd: Initialize spi_device_id arrays using member names
Date: Thu,  2 Jul 2026 16:53:38 +0200
Message-ID: <cover.1783003256.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3505; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xnvnSkh4mR8ONwsduDg/BLAZXZr6/CxgasUbEs0w6+o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqRnty/yxLuXfqpkyn+N9SjKdq6zQf5RlY3lz4I 55PYGK74jGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakZ7cgAKCRCPgPtYfRL+ Tn6eCACqswh1Rk+hVIVYEKELUVvKdCmO7XKTWIrWdpQ/WlV0lqQ0YKOrgltvPWKMEUm2uG3Cyru clzgwExexTgigLBkspq263IUPvp7cK/ScLoq3veeoxtVpG3wNHil3Mwz5LKuwxjf+uVKmVokmnl Hnxb1CC4HTHZyPnpdwJBdO7PmNj+4GlSvJ52KUcs2f7WbrUY/u0MgbYFl0bYJCXwUnVyj4OVldu gDLZlTzgj/sCimLCa9vG+nNQvuERsiPBJ/fiwcApIv2M/M/cB3BLpz/oMjZJOaLK5aJaCWGNvjE CunjE3evQ4iBKLGvR+9mGYHc8IiSiTg1cvNAiBYIHqJ15gWZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_075401_968635_8C42685C 
X-CRM114-Status: GOOD (  17.98  )
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

Hello,

this series targets to use named initializers for spi_device_id arrays.
In general these are better readable for humans and more robust to
changes in the respective struct definition.

This robustness is needed as I want to do

	diff --git a/include/linux/device-id/spi.h b/include/linux/device-id/spi.h
	index 812e7c3854a7..93d9cd45569a 100644
	--- a/include/linux/device-id/spi.h
	+++ b/include/linux/device-id/spi.h
	@@ -13,7 +13,11 @@ typedef unsigned long kernel_ulong_t;
	 
	 struct spi_device_id {
		char name[SPI_NAME_SIZE];
	-	kernel_ulong_t driver_data;	/* Data private to the driver */
	+	union {
	+		/* Data private to the driver */
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };
	 
	 #endif /* ifndef LINUX_MOD_DEVICE_ID_SPI_H */

which allows dropping several casts and eases porting CHERI to mainline
Linux. A possible follow-up change is the following example:

	diff --git a/drivers/mfd/intel-m10-bmc-spi.c b/drivers/mfd/intel-m10-bmc-spi.c
	index 94b9c99bb4f8..28a3cc84b778 100644
	--- a/drivers/mfd/intel-m10-bmc-spi.c
	+++ b/drivers/mfd/intel-m10-bmc-spi.c
	@@ -70,7 +70,7 @@ static int intel_m10_bmc_spi_probe(struct spi_device *spi)
		if (!ddata)
			return -ENOMEM;
	 
	-	info = (struct intel_m10bmc_platform_info *)id->driver_data;
	+	info = id->driver_data_ptr;
		ddata->dev = dev;
	 
		ddata->regmap = devm_regmap_init_spi_avmm(spi, &intel_m10bmc_regmap_config);
	@@ -160,9 +160,9 @@ static const struct intel_m10bmc_platform_info m10bmc_spi_n5010 = {
	 };
	 
	 static const struct spi_device_id m10bmc_spi_id[] = {
	-	{ .name = "m10-n3000", .driver_data = (kernel_ulong_t)&m10bmc_spi_n3000 },
	-	{ .name = "m10-d5005", .driver_data = (kernel_ulong_t)&m10bmc_spi_d5005 },
	-	{ .name = "m10-n5010", .driver_data = (kernel_ulong_t)&m10bmc_spi_n5010 },
	+	{ .name = "m10-n3000", .driver_data_ptr = &m10bmc_spi_n3000 },
	+	{ .name = "m10-d5005", .driver_data_ptr = &m10bmc_spi_d5005 },
	+	{ .name = "m10-n5010", .driver_data_ptr = &m10bmc_spi_n5010 },
		{ }
	 };
	 MODULE_DEVICE_TABLE(spi, m10bmc_spi_id);

increasing readability due to less explicit casting. This also yields
tighter type checking as the assignment in the first hunk results in a
warning if info wasn't a pointer to a const type.

If you consider the last patch mostly churn, just drop it.

There are no dependencies between the patches, and they are merge window
material.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (3):
  mfd: Drop unused assignment of spi_device_id driver data
  mfd: Initialize spi_device_id arrays using member names
  mfd: Unify style of spi_device_id arrays

 drivers/mfd/altera-a10sr.c      |  2 +-
 drivers/mfd/arizona-spi.c       | 12 ++++++------
 drivers/mfd/cs40l50-spi.c       |  4 ++--
 drivers/mfd/da9052-spi.c        | 12 ++++++------
 drivers/mfd/intel-m10-bmc-spi.c |  6 +++---
 drivers/mfd/madera-spi.c        | 18 +++++++++---------
 drivers/mfd/motorola-cpcap.c    |  6 +++---
 drivers/mfd/ocelot-spi.c        |  2 +-
 drivers/mfd/rk8xx-spi.c         |  2 +-
 drivers/mfd/rsmu_spi.c          | 12 ++++++------
 drivers/mfd/sprd-sc27xx-spi.c   |  2 +-
 drivers/mfd/stmpe-spi.c         | 12 ++++++------
 drivers/mfd/tps65912-spi.c      |  2 +-
 drivers/mfd/wm831x-spi.c        | 16 ++++++++--------
 14 files changed, 54 insertions(+), 54 deletions(-)


base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
-- 
2.55.0.11.g153666a7d9bb


