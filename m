Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951CDCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCb8DxBgLNYKl2se7nFRUFkwYJO2PqG9toAr7Dgva9M=; b=vj0kW5/iY2c7T+fyFmukyFL8Xv
	wT5QuG8wiKC0FmnJUtyUP0FSwvAZkYAkjduqh6tT++W/1snAZfQqDcNp36PSmLzCTDELwlwcaBzGm
	f0IY5DvAk5dHtMJui3A7eS2OXb1JyaRSn87INQsRlY+xkS9JtySD7D3PM7ZPES796j6z2IGENN7B7
	bJofgNjcKc6xf+zR6gCiFp15UaHUvA5owKyzApCZn/escJ+W+J72iSC9mQ6GIBjo/6M6e2/hVei6Y
	BPj/P73Jg46LzVIgsUwcqQtaCRwTjX2qT/lH3sj7vxsMoRxwJnmO+FcSECDPkUCgPoNB8YQkn+64s
	KD8Iq8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMB5-0000000CkXz-0oca;
	Tue, 02 Jun 2026 10:16:55 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMB2-0000000CkVm-3Cum
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:16:53 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2c0c3546924so16019015ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395412; x=1781000212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCb8DxBgLNYKl2se7nFRUFkwYJO2PqG9toAr7Dgva9M=;
        b=E/jauxwRs03ZEjUh2Yhb9o72i9VEcF6c5yRPqVU8Cbd9f9gLcqrgEMZHKGaGEKvYpT
         glWhahIYioCSA4UHqi6cu3l/5EUyulT8OFgBKObtIwVGZSYYekbvR/LOfUJR2wcMsKtM
         rG4KLazaqPjZsz7PZTpTlKckgjn5T9XvVes1lzeDUuq1uckRskW48xpiQvi7hLWa0uan
         U6wjqPd8/Q282smdaj/PD40DqVSJgnKTFupMT9iKf4GvEVay+YnnnlNCegZo8unMUk2H
         8D/gbYG5xpso82RtDzvZ1uzfNis/+q+ZZ8i1KMOlxjqIVZDhbno8qLY9fi5Gnj+4IASg
         Wnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395412; x=1781000212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rCb8DxBgLNYKl2se7nFRUFkwYJO2PqG9toAr7Dgva9M=;
        b=sVPcuUQy14c6vH/nRB9mA2Gb/9BtSZgPRtNsVLUnZSwfYOTxbAbi6pHzJwH+e9qtCa
         QXBYIwCaehx33rZert7Bg5xITkadYRzGNpPQ6OHeRvsyAXCW8/vVeZYDFSNQSGL9nPti
         6dVzl5gRgTY2DRj4T0gC+v3FmZtS7eYxampHRKyQPa6qqOe/LH4PYgVQsWHtChDUfNqK
         /WKt39ypfPFjfzly9unB00l7w/PK/Xxhv1iFhNJ/m8F5Wi/pDbk5VI5boSOzcrEKUJzu
         YNyuoQqb1EaLrIJxIxKlSZS/f+dv7F80wzsfOqsqvb/AMr/ONFPOVG52Cf2Q0oCYbIwS
         PJgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DC1OkJLkRXT2ODujEzQwY14RcKRhgr3cQFuupqFzKt0BnTU6I3Q2Ysgqsm6YdD12iRBA8Ul1WRzc6SQpnroFa@lists.infradead.org
X-Gm-Message-State: AOJu0YwDcSFy4Tf/FVJpzydTY83OqKyVGlGOmrUmGL4gbS+au0rOdlTK
	u3dn6IIY006zhMgw1UcAKUT5oxQhnqPRfeJL/TFYy01LUQhPr1AWnEq1
X-Gm-Gg: Acq92OGWAwDXj26R/njFZ1HpztKmL2MfuYzYiD88Lxmx/zBePMppxh5qlvF0ZiPptOy
	6Q5yLfWJ4nXLLXQAiCggGraGkBUZxQYw6MHsfZorZGigv3zOqQ/uX1C8tplwAm/LIriWeyj9xUv
	vhxfSRQiPvDwVtNCmcU96O34m8LE029yXk+As2TsIgXUpdp/gifztiudRNf7/Z6RZuzfOb4sQJd
	uCZbKwKcpHFxMQT/1FoCTI/0O+8HgzK0ej0R7KAy7Fp6qlEwWunWmJQjR9NSUqb4a7wJArCjJNO
	KsuysXjSXNflviozAklG3PPPO7kp/a0hyfNobtd0VWzcjYsvm/x+BEFNukXfHZ8Q7mp1Lkgkunj
	WjxNGox8gw5xWBQ/ivqdf/VHWbvkIrgzaJpWYGP5z2W3MZep0gA6TYsazsYgQBBRvm0mM1VvqL+
	4KVHsudWZl5VswC6VWlXtaNwpZNn2VEIiWRl7pjGPUbjh2LfxTjoiI+qLBERLxxZT+qkd7
X-Received: by 2002:a17:903:46cf:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c0c6254383mr111686365ad.37.1780395411951;
        Tue, 02 Jun 2026 03:16:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd84fsm132766305ad.23.2026.06.02.03.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:16:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/5] ASoC: rockchip: rockchip_pdm: Reorder clock enable sequence
Date: Tue,  2 Jun 2026 17:16:06 +0700
Message-ID: <20260602101608.45137-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602101608.45137-1-phucduc.bui@gmail.com>
References: <20260602101608.45137-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_031652_821077_5CB53F9B 
X-CRM114-Status: GOOD (  14.32  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Enable the 'hclk' bus clock before the 'clk' controller clock during
runtime resume.
The bus clock provides the register access interface, so enable it before
the controller clock. This also makes the resume sequence the reverse of
the suspend sequence, which keeps the clock ordering consistent.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only. Please help test if you have 
    the relevant Rockchip hardware.
Changes in v2:
  - Clarify in the commit message that the resume sequence becomes the
    reverse of the suspend sequence.

 sound/soc/rockchip/rockchip_pdm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index c69cdd6f2499..8f78f7bc1806 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -422,16 +422,16 @@ static int rockchip_pdm_runtime_resume(struct device *dev)
 	struct rk_pdm_dev *pdm = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(pdm->clk);
+	ret = clk_prepare_enable(pdm->hclk);
 	if (ret) {
-		dev_err(pdm->dev, "clock enable failed %d\n", ret);
+		dev_err(pdm->dev, "hclock enable failed %d\n", ret);
 		return ret;
 	}
 
-	ret = clk_prepare_enable(pdm->hclk);
+	ret = clk_prepare_enable(pdm->clk);
 	if (ret) {
-		clk_disable_unprepare(pdm->clk);
-		dev_err(pdm->dev, "hclock enable failed %d\n", ret);
+		clk_disable_unprepare(pdm->hclk);
+		dev_err(pdm->dev, "clock enable failed %d\n", ret);
 		return ret;
 	}
 
-- 
2.43.0


