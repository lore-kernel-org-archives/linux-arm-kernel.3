Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE78EFC72CB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 17:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0AJDTQx4Fo0qs6sgUSUPoNfGP6EMtKuFzwsXYq6U9jE=; b=MPB4WuN4v8CHJ12tEz1srQDL3f
	EE26F/3T3+yKE1tIkn6E8MxMIUbUkKzCy7JOB3/RdK/21DvS2ZkEo4i1NgEBmJ+wm9hKw8EMyPBy8
	/geKlA9Rq+dRcufZFis9DBO2OtXYCck070o4t8T0bJC5MBXe3MAy3HRhu/NdrgBuH/vvLx554afZw
	ZuiMX3eouYHSI+BopE8H9zLmnowaeCzeeN7Znpe2v8rZcmuLqaIKPMdvHw7Suorw1eK0IAfXY0HPo
	e2kI3JerM4JNph1e8h3FSWyOYcVSXW4zYl60yKyBGmMVfw5K2b/zhvDvTb8H4hYp/QZf6U6fHOeTl
	Zjjibklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4MOs-0000000FXDc-2d4z;
	Sun, 22 Mar 2026 17:15:42 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4MOp-0000000FXDH-1uxW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 17:15:42 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-89a1d7cc7f0so27928976d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 10:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774199738; x=1774804538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0AJDTQx4Fo0qs6sgUSUPoNfGP6EMtKuFzwsXYq6U9jE=;
        b=JwOEnY6jdkk8hs2PABQ8lKlOCVmLArfSLLVfU8ocIL6Jidx6EYUAmSCWVcDbSuRG2a
         E91YLKJQEPf2i/zVDe7i7Ta2bkq7vubfuDTyErC5FN35u4a94xpFx7H1HOr66IWFQ+jl
         14Yva2EtjPZK6vLRF2ZdatVdlasi8fmgxum1Hkt/+QlspxXdk3wgm6TEozsv9JUbmkkd
         U+cJop6/+I/zYXJIFyivgzNXB1E7f1kSDtnw3uuneOIq4y/gkbNs+v9VF5emb6MTurdJ
         3jDidNrCi4BVL83nzoV6WrYEgAFhGgmqnel2fZZZrO+dKHgi6rIpaI/Z1Oua7sDpACps
         +eQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774199738; x=1774804538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AJDTQx4Fo0qs6sgUSUPoNfGP6EMtKuFzwsXYq6U9jE=;
        b=q7KeNCcJphFnY9GwPfwAIw2cUou2y3BaMdl8mekDA6NQNr/UA7uXK247uVcz/fjq56
         2w4CW7XwMr0RQkJXufVcDtm2KrLefWevoFZh6Sfr7q3BxsQBSODBwSZKdtwD4my6SevG
         d0+xkmglDZcVZtEMRFh9PW3VDsMUzeNVDjSNM66DuwCHFH4/DVFreij8k66fiIsy2B/d
         KmUiY2/cGQqdNg9u8T47U70NOnAIpozSzs3ytSuLdlmguLQoFBMlluvj0H1JcUJpSpDl
         +3DKCL3FaFBL0Zv3YOR7Zp5fxw7mAfpoziyL1hMehdzT/+SY5DGH2pzaVo1YuCQqWzuu
         FLqA==
X-Forwarded-Encrypted: i=1; AJvYcCXncUprkSmIVnQ4rumZ0K8Z2qcPgx8lj+wlPuJPdhiGIwqtZkTBe6KsAuygF0k63ifbXxLYWtYrfXj+mciJaOAu@lists.infradead.org
X-Gm-Message-State: AOJu0Yxaxt/CqgmmBWW599w2F1TcK7D8Lq73yW/czWG7nlxncoXy/OIx
	CO30ypPiMGzEtCaSfTt7oPXTZYN9kmlESNG/VLbHb17uqPMR6mZ/06Z9
X-Gm-Gg: ATEYQzxy3QE0KzHFI4n16xrQlN99PW9yM3ymG/Vc4Y3NBcCS9HTGKE6ipgVPKhTKGR8
	6gIOiXOVWPx8VtkN8OcDFe2dv96Neov7AAv6cWK+lif/syXsnf4DAcMWT7m5AXMIUMLNOI0M5Po
	aRdcdIg9WaY+g42kssnYzVb0Z1DGFG/FfWAbdydOpEA25MLsgjjuFr8h/17WQ+M4Ox92kZmZtGA
	7RacJleCPIe7q+QPccoq6MaVLhkocVfSWc+VcR32RCVWPMchp3rubgG5+kh1fSQ1TFOw4oaxiHh
	njInMtBMOB0JhE3jORvZavPoHCJCq5jcycj7YWnAwwvnjmT5XnshjCIitAayyeCfH6XLKJcFV7g
	jHpgLQyDUDkUU41Ok+7vlcMzHH2L8wj++K6SA5Kd3avtq10uPL/8GgAOSFr/RuKjH0vyfAhCtaq
	dPDht/TV3TNO1jwHEQVmeAKu6rvPC7B1TFaylbetSZlzIuuTIK8aoeog4sn9uMtyzXxymjYzLQQ
	xBq0/aWGig4WA==
X-Received: by 2002:a05:6214:d87:b0:899:f1c1:dda8 with SMTP id 6a1803df08f44-89c859fa4damr166241696d6.13.1774199737628;
        Sun, 22 Mar 2026 10:15:37 -0700 (PDT)
Received: from Desktop-PC.. (wnpgmb0311w-ds01-161-217-39.dynamic.bellmts.net. [142.161.217.39])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85335464sm67001966d6.31.2026.03.22.10.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 10:15:36 -0700 (PDT)
From: jassisinghbrar@gmail.com
To: tglx@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: dianders@chromium.org,
	shawn.guo@linaro.org,
	maz@kernel.org,
	stable@vger.kernel.org,
	andersson@kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCHv2] irqchip/qcom-mpm: Fix missing mailbox TX done acknowledgment
Date: Sun, 22 Mar 2026 12:15:33 -0500
Message-ID: <20260322171533.608436-1-jassisinghbrar@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_101539_522432_011D4851 
X-CRM114-Status: GOOD (  10.60  )
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

From: Jassi Brar <jassisinghbrar@gmail.com>

The mbox_client for qcom-mpm sends NULL doorbell messages via
mbox_send_message() but never signals TX completion.
Set knows_txdone=true and call mbox_client_txdone() after a
successful send, matching the pattern used by other Qualcomm
mailbox clients (smp2p, smsm, qcom_aoss etc).

Fixes: a6199bb514d8a6 "irqchip: Add Qualcomm MPM controller driver"
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
---
 drivers/irqchip/irq-qcom-mpm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 83f31ea657b7..181320528a47 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -306,6 +306,8 @@ static int mpm_pd_power_off(struct generic_pm_domain *genpd)
 	if (ret < 0)
 		return ret;
 
+	mbox_client_txdone(priv->mbox_chan, 0);
+
 	return 0;
 }
 
@@ -434,6 +436,7 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 	}
 
 	priv->mbox_client.dev = dev;
+	priv->mbox_client.knows_txdone = true;
 	priv->mbox_chan = mbox_request_channel(&priv->mbox_client, 0);
 	if (IS_ERR(priv->mbox_chan)) {
 		ret = PTR_ERR(priv->mbox_chan);
-- 
2.43.0


