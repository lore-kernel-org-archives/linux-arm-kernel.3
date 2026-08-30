Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285C4C61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 16:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4Gd3Zu6V237u3MJ1sYGZ7SxZwjOc/OROhTL4anxICY=; b=kckZt47bJ0GPoUXsSlRHA3Pf/X
	eKiawDFe70wCT1+SlXRvo3jJzgAGh2tTwBsXD6EDEUF/ABwSQAuHBswHvBSRX+VBdx6+f/HFlLfcl
	Ei9Ao5TKrlaq/phB6Kk/ugM2U7uQnoRFb6EPo5v/kkUyyug3TngWX+FWpd7yh/sYFoi+AV26a3+ez
	pUvt0VzaBxkTXTB7ltRoYhMjKndOpnx/lI2wswVpYxwTtdeYm9hm61BMflKI6lX/9SXPTG5nIOCiF
	kkamJQiS25nQgP9AFoIc7HkUnA3tlT2yrsEbU5VUnsnAIXAKg/NUETXuRH3p8/XppTdiXEqVSojSs
	UDxV6W4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0hzb-00000007t9f-2t3Q;
	Sun, 30 Aug 2026 16:02:47 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0hzZ-00000007t9E-2cjq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 16:02:46 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8525efa7274so2065434b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 09:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788105765; x=1788710565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4Gd3Zu6V237u3MJ1sYGZ7SxZwjOc/OROhTL4anxICY=;
        b=IthtKUkzBm9iabJ+Q9fsB11AeUbIkul9Te2BH4NtvmFT9yto9rcXZDK0Wc0xzJe+S8
         UXkXyOTyO0S4bj4IFkNLG2f+0mb6vZY8WCvmDo6/o6POgcId8rASAFxRaAjATg71xikJ
         Kv6ku5rAZbtjGZTp9nN0SGT9KoumoLBjC6E1SPNXUp1axAiakXrzRPDKUx+eCsCOu4kN
         s4mX+rDQlzEk3eZqFOcyREShqM5HToFQFfl42vd+hnHQoVg4vz/FlV7ewGit1kjAAIju
         8//KlnwBlNK8fn0FXVV7kOywZqcevlXKF2b7k0BO+XBft+N9dXbkb1oUUU/7w1aMP8Ja
         5o8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788105765; x=1788710565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q4Gd3Zu6V237u3MJ1sYGZ7SxZwjOc/OROhTL4anxICY=;
        b=G5jywsCEdGUMi4bO0KUWPQMKpE0FkoDNhDGp1PAywoLQzdA2pRk1ppZP64bWGRvMHL
         UI5G7MNSW2CIFv6Lf1GHXlEfI39DkRkkARiazBEia0ivvUtCqWZYoGPTlHnQtwPPZbfm
         Dua91QefmjPMEpuOtgeTo7lH3L4zIoP/D1N43XuyzUwSnIFShMhImIHZEq4VigtVubvN
         nQZIF1aOGyuUyc//x7+wEunW7DSx7xXDzVaViGy9NmuuPDh2IXqLRmlzDkTqLrc1y1RO
         Lek/w3SJB60NG2iRpsgsyhcTvRm+xkyJblL/04hN+1qpFVOJ86guCJE2YfWVI91pYmIO
         Q3yw==
X-Forwarded-Encrypted: i=1; AHgh+RprWcK1rRfroebAkk0qhR3pB14q0zCiv42xeAo23N0Zfbdf8ZBZzNL3loRQjsTLlIPDxxpxvhDapNfyaSHkhUSQ@lists.infradead.org
X-Gm-Message-State: AFuF++k6L+t09DGKg1iCb6N8u6zvJmpQ51kty3jrQ7ANnTyW9al0jRVs
	1Q/hs3fgzpouX523Obql6t6haWRNOC3x99A6OixX6ajQAA0HcQbU/OZc
X-Gm-Gg: AR+sD10eMo5d/1GBuzwWauR9aGdhFab/e4neSfuDBITts0zAvDENK1csEkWvRZrEWg4
	6yfIz5krGSosx06ppHmgVxezDkAv2vk9bcc59eGtbW5dFsgIoefEY3QnxRzXxlAJeiQkXQExq3l
	97AOtWel5VHewcsRF4GEe6jwdDXtfhQd5mx0D4xe9/87bRb2t3XGmcB7lgOy2NwR3FqwbWsDbUi
	PkGwrBxIDjXeVukJHLNo8zPS3Ti+LV9XffXa+reqzvOpCDj0EEsfTqw4Qmr78puRIvsclDgQzyp
	Gj4xq+C7t8ozaSORttL6Qo5LJMyhaBdnB5c0PZGxI3mPfvnQpw8RPEoVreOamJUxeWrVCBaqeiJ
	xtrHk+S0ocwsSqPtVJWZymsZkCWkE+BEcezJOnMlWj9VQFM7Lroqu02HepjQdI9hDFXW2BU4/se
	Eu/FDO3iN9C3fTCO6GomkwrMQYNYdIgIpEiSSOQVRErq7HNZnVq1K2kBV80QCS0koCGhOf+QbWh
	f5iwITjd/yFTz6L+g7loO2wU6pa0eYjm48sRv009LArmls8GdNJ
X-Received: by 2002:a05:6a20:4322:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3d3af85fc5bmr16153694637.26.1788105764564;
        Sun, 30 Aug 2026 09:02:44 -0700 (PDT)
Received: from nuvole (2.248.212.35.bc.googleusercontent.com. [35.212.248.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2839584a12.11.2026.08.30.09.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:02:44 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v6 1/5] media: hi846: Fix hi846_write_reg_16 handling
Date: Mon, 31 Aug 2026 00:00:21 +0800
Message-ID: <20260830160025.211384-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830160025.211384-1-mitltlatltl@gmail.com>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_090245_722661_F467B175 
X-CRM114-Status: GOOD (  13.42  )
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

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..7f069aca0fce 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 	if (*err < 0)
 		return;
 
+	*err = 0;
+
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
 	ret = i2c_master_send(client, buf, sizeof(buf));
-- 
2.55.0


