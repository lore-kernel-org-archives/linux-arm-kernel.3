Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1693CFC9ED9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 07:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nmJQIvtiaxODiCsUsq3Jno3CVTZP2FwDaPbHG1QOL54=; b=K8bfxY715WuEjfx5v322rxGbf/
	iyTP9sFlRLpJ+iA/UL7jTcUr/e3dEtAQ2AB+n2yK/DlUqoFmAAC4dqAmR7tWN4TjM6dxCFw+NUiOw
	hTzE3bEJxuTGZh+j3ulk7gRyiGTfwY1WZlxtbfipGUeYsfxybWO7Jv7Lo0nWI+sqg+EKTbMyWm4Ee
	wscEc1VjRGJYa78g/H8jaDh8bLtMExV9i52irWDRte6Ba52AoS1Qoq8h/zh2vG2VlR4+RmldEmHjI
	VjUbymy4OOyhEcWlQhVXVvP2UuJ/AjW/FEDSM9/qQ6Wh8Ltm1E2V0ce9/yYT7XL0RnrKMp91YwBp7
	3Yc345yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vymNj-00000004zGD-06HQ;
	Sat, 07 Mar 2026 07:47:27 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vymNf-00000004zFg-1JkN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 07:47:25 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8299f1ca894so903135b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 23:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772869642; x=1773474442; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nmJQIvtiaxODiCsUsq3Jno3CVTZP2FwDaPbHG1QOL54=;
        b=VoqT51N5xDlK5fElQkEJXcQ00TTpk6dO2Wkq+OpsCjIEkOzfsJIk3jVpjKl7Gqh3Dj
         Ic9f4FCu7ySEVl6tTzICQpV5sViTYqJz6KRCWZKF2y/I4tM1jcG5oRYc7HNMCjur83hu
         s8+2baAjpAySV0mNIghSL4KxCxuxcs0Qih9QXpTodvNnm8QBNKZdskHf+bJtXb9NxaRA
         iK0ElVCuNlMRETZxfuvcLOZ3rNm6JBCx94hmljw0+atPRCrPKsbvPGKEoiOOWzwO1OIh
         FekWTE8z0cATpZ4NcaTTD4uQmMuLotjmmz5F+gIBven68ayWbYUtqW7w6MVG5A58O9Jm
         Yh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772869642; x=1773474442;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmJQIvtiaxODiCsUsq3Jno3CVTZP2FwDaPbHG1QOL54=;
        b=wN/NXcjZibBG9EkT2RwLh1CC2TezWEXqiALxnOSWsZWdHhfxs6RYnyBjKzDQeUP3Os
         PWpLEus1mg6ecreCrdzQ1qmxW1o/elk8fbmEsGNuEdUm0GmdGye5DMRFhQUZY/83ySNS
         1XIEdIX7Lw1tEU+JYM2rKSXj4ic/pSOriLLdujT5uco8pfhCfkcPETqHmC1HKkM8iauH
         bm7ezfGrzFVI+uq4YNST2MjB+E56z2gaUO+uYbPnynnFIO5MUmAM3yUq8dfVOR/xMUXq
         j+4e5chVJHI1iGjUU1iD0D/+eGyoIpMCSSatCpHqt/5Rhb1IXVObZCOm+GTIDUYo1lP2
         j2eA==
X-Forwarded-Encrypted: i=1; AJvYcCWKpKjw0L7nvPAoPB6djLv1Jfvh+d3qfxNrP7CjfJ4NWCFfqNISb2sKGa2eNLnzZ/Qm+AAFsPfyYCnEfVmNMS3C@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4T24HvU3Jlbv3Nk5nhcWz5JIVsPx4Z1X9WJVSSyE58XXNSj47
	srP6WFWEngO1GPjT/p6ETeB+GOCKmG6hrpuhBhz3acZ+vB6rBpWSqIDc7eZyLf6sXIM=
X-Gm-Gg: ATEYQzzaAL0Onswl4cBMPpMI5w9/GssrvI0hWc/IKfSBSCJmGQvfXJ2oWxkFXD5gV4A
	jYfQoSfAF5WPkNeyXOebpUjXn2ciI7G6xh3FuuJ5/2Aw+MTiPD4mWf8mQs5Ep2j9ELwSYZVYzZ4
	G79fBunvDgsn1aeNp6UNm9GRmcSzAVoogvL5z+km6gGqJhokLMRRjVlgiiTW4Oz39EPX20GNg2y
	hKBkdNxvc34lMqX46oDgtGaWMu8pUNQZxtLb5dIpZYa1McITdKwIqoPKZq3C2w5uWZa56kC+raN
	3pkygavJE5m3QnKh34Uq3Uv1FzPxhrdBg4siDKtIuP6PCitS9O+tlQzkH1jJQcYLe4UOaYY8ouI
	+NMeJXP1QiKtnSOn51ZCMRDDArlq5VrQS/W01K29dzhJoPK9XcHeKOUTeDtYpHqEdT9dqy1Qju6
	lqspy7NRuErmw0QoxhMzmBulB/lyCZehTEhjc=
X-Received: by 2002:a05:6a00:2d19:b0:827:4372:dd1f with SMTP id d2e1a72fcca58-829a2f348e2mr4772406b3a.41.1772869641947;
        Fri, 06 Mar 2026 23:47:21 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:59cb:c81:de53:1143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4657445sm3970820b3a.17.2026.03.06.23.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 23:47:20 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 07 Mar 2026 15:47:15 +0800
Subject: [PATCH] spi: axiado: Remove redundant pm_runtime_mark_last_busy()
 call
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-axiado-1-v1-1-e90aa1b6dd9b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAALYq2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNz3cSKzMSUfF1DXbNkCxMjS7OkVJNEIyWg8oKi1LTMCrBR0bG1tQD
 gdghEWgAAAA==
X-Change-ID: 20260307-axiado-1-6c84296be4a2
To: Vladimir Moravcevic <vmoravcevic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Mark Brown <broonie@kernel.org>, 
 Harshit Shah <hshah@axiado.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772869637; l=1011;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=75e1lv9Zspk1Yn0ZaGCEQTR5dnPaiJ708BBDY7KFgho=;
 b=2/Bv0N9XW6gxyCPmTUnBk/9Q3k+xdUY5JCrXf/I2nuBVZwXriVFmO+IsoPc5uwksPKv9TisXF
 R712Si5ImMpClUWifArZ2bpP+lMC7Z8XADU8hLFYzsNMod19xsIjdru
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_234723_362547_EA6A28BB 
X-CRM114-Status: GOOD (  10.48  )
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

The pm_runtime_mark_last_busy() call is redundant in the probe function
as pm_runtime_put_autosuspend() already calls pm_runtime_mark_last_busy()
internally to update the last access time of the device before queuing
autosuspend.

Fixes: e75a6b00ad79 ("spi: axiado: Add driver for Axiado SPI DB controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-axiado.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-axiado.c b/drivers/spi/spi-axiado.c
index 8cea81432c5b..bd5f67acc4f6 100644
--- a/drivers/spi/spi-axiado.c
+++ b/drivers/spi/spi-axiado.c
@@ -850,7 +850,6 @@ static int ax_spi_probe(struct platform_device *pdev)
 
 	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	ctlr->mem_ops = &ax_spi_mem_ops;

---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260307-axiado-1-6c84296be4a2

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


