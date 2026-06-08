Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61123CD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 02:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j20V0GuPV7rBgGUjbhfpY7XnYJHwynd15A65eNviT9Q=; b=vkZ78beQ91GYeHpY/K2uAb3cdu
	O1MzFCIj8JhnSu7hYFl2wvnVKGFMi6kXtNYtRyMuPpABjw9qYBoOtmoROpG4jtr0M0OPbGVYkGBSv
	6hk9uc+4vPJE+eICGxPK61HPp1x49kUZYsn++ksJGv5/61SPuf/AR+I6+bzK/xItPFD5nhGDzXja8
	UJplPTQ0716UwKQhuG2tk1yIF7W63H9124b9/Prs2Ln0XU1Gi+d9xaOn+yxUb6lVxb0bTG8U2thhb
	4T+9arp/5AxqPSrRZfKjmmeTiXjo6ZqnACd/ZQTcVgFcQZ97q+rAzLxdDbpx5O7III5tTRjDK8WYi
	UJr5PUcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPnV-00000002jBE-0SC7;
	Mon, 08 Jun 2026 02:33:05 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPnS-00000002j8g-0N1S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 02:33:03 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2c0c3543590so24740545ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 19:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780885981; x=1781490781; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j20V0GuPV7rBgGUjbhfpY7XnYJHwynd15A65eNviT9Q=;
        b=ToJ+iyQSdNpciee/wuOH4E4toHkbvU0FW6+5mfTvHVX42ykOwBbYjvQGnuSPosm9vX
         /JiWscOjo4iPxqgapBaHYYpFtQ1ZbGOQCc7LRDVHVG71gwB4/0sk5ZjBDAGFvWGAHb6F
         gYcJZWa4t4mkC1K3V3eDB0SvZlIzI7aZ1qMZo7bbanv3sUu8J/Zz6r2tu7yO/epfWIBF
         c441+9plRMB9w0KCM+GQjAFFa4XxvvIyr9YcFj9rJgagrXtz28nRQE8M1K/1rLXTs8sD
         +oE1OQf4yQ5RT4bgDXTyiOauIKsP3LI10VFF/7dxG7mvskhapemHVDB4NidDQ+ELYN/A
         z+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780885981; x=1781490781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j20V0GuPV7rBgGUjbhfpY7XnYJHwynd15A65eNviT9Q=;
        b=dzFDqeuA4gyCr/9QIE9i70HJe0JftHJmoE7PgjdyWRwZQ1Ph3FaaTiHTmQKyp3TR+z
         bghEBkNO0mgcdbKuQjteFv9o3z2qnoLgDFCfmRKFOBTGie2hYhSXZyBYsIz3qL/jh3HM
         gd7xRv2qQEcCZ8uyphUA7jHdzn3NxtkCRsAcpTuHr6BgQsSebFPyvhixKCf6I4x0FFoA
         n1fsY3IPqBBqnC3mM16NOEw5a3V2dVnMPlzmq1P/srUubeq12Q8LH7gJ1j8MNAYSn/uN
         xzfxiFU99yORbQE6Z5JidonzJsgbBgF5sB3GR8K4lsOblcxtYxho3+yNpnwhlVr339lh
         P0NQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Q7Qf5F22haf8YIFxoylRQtUkb+Lugbqt7GC6r116ncw7m14tcHEuAQ7LxQagcgOpYFpYnGq6IhSts3O7Oy51Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwcL3n9j/UllaTriARuRUqbf7M9EiZExsI0fk/hrjnrYLp9PIB0
	8Sy/LkWwRDtvsYuSQxymh9JXtlRw4l5DCMV6dzW95jkrirdSH2j44xsw
X-Gm-Gg: Acq92OFXHL82j5tcFw4fabixFdmTnfrtKXMtRcxpb55hvuBFgeMMTNFdVRDSxuWY8/4
	YtEVI2pYiwtyYDuTgEP7Ls3D3bSXbaGdKfpdBByBJMKXLFkKv0x3pGdVyMh6tMWEEFRiSCiC5ex
	9x/JsGfiPGagJFJIlvRJITSuU1MJTJfYLAjjVYNOhjWs/V14iBt3pAeS2cgqZw7zyKc1nIEyt2C
	v57hkbei0ZYp7dHXnlMqlbut5F7WUTpcBT6/cepQrnv7VzImKZnO98EKwqIsDmupwyg8V6G4EpC
	dJxU6ZRCcAACUlAXvU49HOh414wFyKg/5B8OfmGgetROUTD2vt/sWoI6irk+A2ymelJ+wxsuXv9
	KUvlvYFqq515tW97cg8U9YbJT1e2VhAJP3nnP2nKX6fgPZyjBGgNIUSsy98cN3jHp8Wva+qCED5
	wHtoLSy9OxcQIQBY4uht1sTRa7qfO8yhIyJlYRFq280Fxiwi/5l/tX+aub61oZ0LR3N7w7XYgMr
	617P8IuSo0mrm7WckuCN9s=
X-Received: by 2002:a17:902:d2c6:b0:2c2:245a:3360 with SMTP id d9443c01a7336-2c2245a33c4mr100349275ad.6.1780885981043;
        Sun, 07 Jun 2026 19:33:01 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c245dd3b5dsm38143485ad.81.2026.06.07.19.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:33:00 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v3 5/5] drm/verisilicon: add DCUltraLite chip identity to HWDB
Date: Mon,  8 Jun 2026 10:32:37 +0800
Message-ID: <20260608023237.305036-6-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608023237.305036-1-a0987203069@gmail.com>
References: <20260608023237.305036-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_193302_215178_5ED7BE70 
X-CRM114-Status: GOOD (  11.30  )
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

Register the Nuvoton MA35D1 DCUltraLite chip identity in
vs_chip_identities[]:
  model      = 0x0   (DCUltraLite; Verisilicon uses 0 for this IP)
  revision   = 0x5560
  customer_id = 0x305
  generation = VSDC_GEN_DC8000
  display_count = 1
  max_cursor_size = 32

Placing this entry last makes it the gate that enables MA35D1 hardware
recognition only after all the supporting ops and DTS changes are in
place.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/vs_hwdb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c b/drivers/gpu/drm/verisilicon/vs_hwdb.c
index 91524d16f778..7d630a667a3f 100644
--- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
@@ -129,6 +129,16 @@ static struct vs_chip_identity vs_chip_identities[] = {
 		.max_cursor_size = 64,
 		.formats = &vs_formats_no_yuv444,
 	},
+	{
+		.model = 0x0,		/* DCUltraLite */
+		.revision = 0x5560,
+		.customer_id = 0x305,
+
+		.generation = VSDC_GEN_DC8000,
+		.display_count = 1,
+		.max_cursor_size = 32,
+		.formats = &vs_formats_no_yuv444,
+	},
 };
 
 int vs_fill_chip_identity(struct regmap *regs,
-- 
2.43.0


