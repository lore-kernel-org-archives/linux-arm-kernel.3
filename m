Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9109C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07NeGidiEoFI0vJcWncCuXXVE170Ua3zDu2V1ci+TTk=; b=zVzkEPkqWi9/QH7kckCSCgLcV+
	xM6IoixPA/LGV+rZ0dnOFRdNRejUyqcypqj8neqxNOFF/u5Y/S/YoNy+Xnny+sPmluHtDS2i+PvpI
	tTzMkPu7CN5nJ4EfKRAt2wr++nbLeP1eGZH/BhufzSTPVbC8BuL2YKdv3lnzQTMD51/zyEZ5WQ6op
	3rMyQjm2rr2fTIhRBI3FT/9+xbRTWdHxZtCJHjcNy4az7Wm6i9G8IVwS8HkJW2fTEH9Za1XB/UveX
	dJ87KTL8nLeDQaKARSbbRljTnRFF50AEHjzucewVkbSF19kXgYyHagzfFvxjWcA9JyBuW4DvuASkX
	peDsJ/4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJzj-00000008DZr-3BIP;
	Wed, 12 Mar 2025 11:11:27 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJZO-000000088mP-1EgH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 10:44:15 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so13262762a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 03:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776254; x=1742381054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07NeGidiEoFI0vJcWncCuXXVE170Ua3zDu2V1ci+TTk=;
        b=mYboEBBX+GEfnIN/YVRD8QVbo/2gieX2Y9o8yoC4dRtZct7YF7rEF+zVh6aKs3Ls3d
         Y6EjqsXrQKwe67PsltYKF2PA+udTEBNpMLSUjDIcWS3xJI1Qxuqa+V8+V5qhwoCBtdsQ
         QnAdARwn0R9FZvXj3dGT0nrQ4lWR5nTp2KD9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776254; x=1742381054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07NeGidiEoFI0vJcWncCuXXVE170Ua3zDu2V1ci+TTk=;
        b=nTxPgUT37D4EihVnK0GSeJpTCKR4g6FZHGQ3aqhtl4hFdo6pV8xTsz1dT7rZF9Teg/
         hlMVk/uAS+LOy9foyiMCfsB4JyrEw54dz6A3Urx8cGmSkHCFaddHZ3CyiUpCNJgbJrpN
         MlzjeCqkkYoDe6+/+69bBs+XZPO5kiBAldX0EeY1js9YpgVHVy+TAPQ2P/t+vCd5KRQ3
         xaCuywmvIIkbOBOY9tWzT9R5mSzxR4p6YEGfNeigBinKLaWVmKAdybtqn89h/DfdgUHc
         +pZoho0YbNKu9wifInFw5MpxQ+D+nBynt9YRWvoRwB8K2sXmqJ9pxqqk23GLE2NnVIID
         AHxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQWAncaZIpxYrXcgSbCHtmXa4qiJKNMXUdNgKPtBfLqpwF5XakVELt89eyKbm3/wpSxJFtT9P+Vbquuzc7gJLG@lists.infradead.org
X-Gm-Message-State: AOJu0YxN0Y06ixqXldiveVFKzLjXCKz33xs6OOaBEFQb+W3bDmgLLkeQ
	jVvs1UYlkCQQRs9Silw4qVRmc+eAhly9jvtvw6oMDvpzRZpY8vnvHCXoEiIIUg==
X-Gm-Gg: ASbGncufVC0Wc9CTB2a5DkMuZzRrMg9IArXKNomjmzKzDswOgvmAflQtStLjZFzROR9
	Rqz1x59jnwBCYujbirg61eGyxftA1wMNvemW5zOEnxaHVqNlRti104eCnhRlSi0DsbDKzmiA2ym
	9v12cPPjLFyTItUaSuUXUFoYDlJaqeeFBkwXHKI3WzP2YXZ/Jm2gAcWBvP3SmxRe9VLa0WOKUFn
	51WQ0DTaPKCfyVQN982GjGdTiLxTXdctjD4ld4G167T73g71gY4yIcCltv18/xLm6xbvI2h6ulq
	Z/r3MaUu8DPVHqDC6R6b4LeqKn+eddszPc37+HGiLsvMsyZ6whJ47WoAqpUZjVo=
X-Google-Smtp-Source: AGHT+IFSE2gHTCSWYPmLv3kDZjxj214O8BELRgRt+BaoekLoQKZE6r3o5wS+pqNMYHoEB24uQ1fVVw==
X-Received: by 2002:a17:90b:388a:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-2ff7ce94cccmr37763724a91.12.1741776253695;
        Wed, 12 Mar 2025 03:44:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:44:13 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 7/8] platform/chrome: of_hw_prober: Support trackpad probing on Corsola family
Date: Wed, 12 Mar 2025 18:43:41 +0800
Message-ID: <20250312104344.3084425-8-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_034414_330106_2867DADB 
X-CRM114-Status: GOOD (  12.58  )
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

Various MT8186 Corsola Chromebooks (squirtle, steelix and voltorb
families) have second source trackpads that need to be probed.
The power supply for these are always on and their reset/enable
lines are not exposed.

Add them to the probing list.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index c6992f5cdc76..eb01851e1cf5 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -57,6 +57,7 @@ static int chromeos_i2c_component_prober(struct device *dev, const void *_data)
 	}
 
 DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
+DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
 
 DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
 
@@ -84,6 +85,18 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 		.compatible = "google,hana",
 		.prober = chromeos_i2c_component_prober,
 		.data = &chromeos_i2c_probe_hana_trackpad,
+	}, {
+		.compatible = "google,squirtle",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,steelix",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,voltorb",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
 	},
 };
 
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


