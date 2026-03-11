Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B165FD88D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 00:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0SXdT3BjTlKyDM8fxn2LNFhC+a57+NVKQ8ywyuz3hiY=; b=ISLbDflxpS5UykRn8d7AdESHkC
	Nnhk6uCpzrAjEftRnpgp4u8OWtCyf6j6DNKxU6o++3gPnf+9nEfa6lBWdY0lNIwtR56u4nybmj9JN
	+K/I/mQHM8O65oXcuvivuj4Ex5kjWJfndEHBcqTBo7IfufCVnvxwUyzsIUXvDNZxfyoctvCX88Ke+
	Rmg0R4uWT/2zRdAL+dtd6jv1/58JzPz9vNLpJKgtZPV63oLmI0ZkPGETHqFLRZJcsZijTBeR4bD/n
	JMTr5wWSm6+MZSxRGI5zEpI+pbkx6ZBY9pirGDmpiyAD2NK/zEMgsVpgA9Q1Zpy6eb1/QqN5IUwtV
	MHcenNCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07aP-0000000ARnF-0Zsj;
	Wed, 11 Mar 2026 00:38:05 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07aN-0000000ARma-1Abd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 00:38:04 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ad9a9be502so87948645ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 17:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773189482; x=1773794282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0SXdT3BjTlKyDM8fxn2LNFhC+a57+NVKQ8ywyuz3hiY=;
        b=CB6Q+uogM+0e7IxG8F4d5rl/aMreR0pG7eAQ7uJIhE3wznNtlRCRAWJnp9ShwtB7PM
         RuntysVPEezG/YzgLaLnBq0GfiYsUQ4K/0Scm9wbPLBna2Qj9GHeAB/e1I0cidpVzElL
         1Al5FLH3dWTV//MJ+xRzT/WgoI4No87/02m0XdDzAXUi4PaN2Mj8cNy0wNxUXL5qYbyD
         JjnMp91Famg79C1spEy7Da9dLjT7aETOLCECcE45ZKjosIDELLQmJI6o02tx3wytOQVP
         Ym4M8gB21+3viiNh92km6CEYqiqsWgcD2kYPAISmgeCDz+EbIsPvlgpo7sfLiBo6eOVt
         BHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773189482; x=1773794282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SXdT3BjTlKyDM8fxn2LNFhC+a57+NVKQ8ywyuz3hiY=;
        b=GG1sXl2pGxrKbT2H4hg8wcFaOD59zr+09Okw+kGhAtHdsOGucJkFoLi6HKXA9G4ws1
         9C0pE26Ms4RVRacDtdYKk3uWgVmcBy0dS5pv/EeXD/ugGXw/+XCKEDhEvbcuZ0Pq7zQ8
         RRTX5dAw6Vept6HbM9+S/WoHxPwG+Eh2eEONpk2zb1kWVg3qbM/OGNwwHPRiYBXQiKgj
         JOzqg6TS0+becCP6vdKnMU58+F3fzpymqDq4rTWPiC0Gmh/HGuaPA4r5Jogr5K8O9hwL
         c6Atlb3L9eTBCgNGNGbh4LS7k/h+6zyx+8Ype5+3YoomnOfr95wR7zZkorOITO5s964W
         oVAw==
X-Forwarded-Encrypted: i=1; AJvYcCVBy/UDC0rhP/S5NTIvDqpS538HSJwjfjmqytADCjPQ66NkixJtH9d7Y8gY5tjD0tKtl40IdMz1DF8Xt78DqfFf@lists.infradead.org
X-Gm-Message-State: AOJu0Yy46//ZDfMn6NKZ08mUOkrj9KF9naRbMgrWd1udNYg3+aRiF1oU
	K6QvjbDVKsssbDNCW2P3VK9MVMu/ywrdVPi8vcC6HE3XfvyQo2VYrt7dvCg+hy9X
X-Gm-Gg: ATEYQzylBMH4E90Cr+SvzzKGS2VPhJoEHe/ZqwSKf8SS/7ckNlHzOSgPdZ235yR8fG6
	xhc23Vbjq6W4x5VWBq4LcOLnhvFUKk/Cwft0ufv6e4uYAQLcPi5JbQCl/0Ic3ZUU4eSZwHe7LHA
	utwMzMC14gtB56r9wWdErBt0qiupqUVZzL1V+3kenMYSFOZTzhIVO/Fb8nHHpEQZ3hESFxdbYf+
	YMXV6oEhEPrIPCoIO0yJRD7r6ee5cq9mOSo9BNfUa2irUNZWX6qs7FvUPDPNhEyVFfRKE0FGI39
	K+Pn5qvoQJCOfZ4SjVJRn9Mqu/6IiUV6+G9CRgCd0D2ZiEF2fARDs3VgvnNZFc8QXYtPGYI2tGF
	Odkb9yLwgIPXWzfUTXxrKrONgIagftg4lkDtZ4jzWPNZkOwo1NFjhGb4shijgPXmk97ytZIrCaX
	IHRSGOZSFu4d/OK31EM5Zm6bYDuLXqhzBedOrJ9Ce9G2Exa9vPvYGC7g==
X-Received: by 2002:a17:903:3504:b0:2ae:4029:2196 with SMTP id d9443c01a7336-2aeae8bbedcmr6943885ad.47.1773189481981;
        Tue, 10 Mar 2026 17:38:01 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae222e2fsm5118555ad.2.2026.03.10.17.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 17:38:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support)
Subject: [PATCH] mailbox: rockchip: kzalloc + kcalloc to kzalloc
Date: Tue, 10 Mar 2026 17:37:44 -0700
Message-ID: <20260311003744.32099-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_173803_317578_9F65D9E3 
X-CRM114-Status: GOOD (  11.94  )
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

Use a flexible array member to reduce allocations.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mailbox/rockchip-mailbox.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/mailbox/rockchip-mailbox.c b/drivers/mailbox/rockchip-mailbox.c
index 4d966cb2ed03..a1a7dee64356 100644
--- a/drivers/mailbox/rockchip-mailbox.c
+++ b/drivers/mailbox/rockchip-mailbox.c
@@ -46,7 +46,7 @@ struct rockchip_mbox {
 	/* The maximum size of buf for each channel */
 	u32 buf_size;
 
-	struct rockchip_mbox_chan *chans;
+	struct rockchip_mbox_chan chans[];
 };
 
 static int rockchip_mbox_send_data(struct mbox_chan *chan, void *data)
@@ -173,15 +173,10 @@ static int rockchip_mbox_probe(struct platform_device *pdev)
 
 	drv_data = (const struct rockchip_mbox_data *) device_get_match_data(&pdev->dev);
 
-	mb = devm_kzalloc(&pdev->dev, sizeof(*mb), GFP_KERNEL);
+	mb = devm_kzalloc(&pdev->dev, struct_size(mb, chans, drv_data->num_chans), GFP_KERNEL);
 	if (!mb)
 		return -ENOMEM;
 
-	mb->chans = devm_kcalloc(&pdev->dev, drv_data->num_chans,
-				 sizeof(*mb->chans), GFP_KERNEL);
-	if (!mb->chans)
-		return -ENOMEM;
-
 	mb->mbox.chans = devm_kcalloc(&pdev->dev, drv_data->num_chans,
 				      sizeof(*mb->mbox.chans), GFP_KERNEL);
 	if (!mb->mbox.chans)
-- 
2.53.0


