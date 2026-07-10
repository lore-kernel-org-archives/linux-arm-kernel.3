Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53CCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6S+nvthRJHE/gqft8+ojzysfQduu/D47Hr0LnA3Vlg=; b=ylIuoHfn49NlZ4BsWnN4GNWH2M
	TTb5dPxbzkFbp6Ila9yy+jZD/iJl6X8aSKY0Itdz07WkVj0r+Grv2Yla3TmngOri99K/zOgCsBS2k
	Tjpnx9ROpGsq0rLCd4C3zmECqo3hEGDUpbEmqKXuTRvadEPmRCYjFc9VB6uP+E8oIZwGVy9aAGAl+
	1BqaEIncTvNX1kbH4wlyKTArEskdnpQUyNMLKNcIA5UmhFM2CxkLkYtrvKRclapOy5OcmSDBWteMj
	eLGmzSlN9nLHY+61kWXizyshKclQKW0R6lgD9ut5nWWtVDSn7r6U068H8lzJFgCOdlgZeLIV+lOwj
	lLQmBMaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8Mv-00000004gxh-1yJR;
	Fri, 10 Jul 2026 10:22:05 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8Mt-00000004gwB-0aFX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 10:22:04 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso983590a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 03:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783678922; x=1784283722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6S+nvthRJHE/gqft8+ojzysfQduu/D47Hr0LnA3Vlg=;
        b=JMGL5gAcImJpxgU0u24GjWrjBnJfdONjaE/PBAWpr4Hng8N/ennjci4HcC6psQKb2p
         CgYKzpYqYyBJHbZggaM1v5TK/b3b1Gmt05XgT4OvW9Jwl+L/f1ghQfbBsCV0RPslZ0EW
         S08Jfxp0aoRfH24uVXAYOhZxhDzdSwNZMV9DdCpLg1b3Y9rxJjk7vleVxE0fWLWQIetS
         DjvKl981cMtikzYqYEo7+rS7lr68tf7YqrPVv2/MCeKmFh5tTxpF42tz+5d8XHGZi82Y
         2gFNHjeGK/hPxXyFNzu7XbkOpc/sDtLmXswZZnDibGQ7pExjQy0Y9H/fXypH1JAhdy7U
         TmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678922; x=1784283722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6S+nvthRJHE/gqft8+ojzysfQduu/D47Hr0LnA3Vlg=;
        b=LCFqB2H4tfNOCWueAYXFm+XjuvJSu0qjYvw7ZzsuUcFG1Eb9S67lfqSqoZSxvAEtnw
         0W+2lCy1gZRRR05taQCVAjWo5un24AgM5f5OZ8aD8O3w4TAPfw5ONWkg10dQpp4QbWDu
         iz5+MxiKHqOM0wtj67ZuwswRC+cSUy+Fnj7L+0s28Qq/IYMYoEA6oWh3CKFrM0aEc1re
         iyufWKnU2rbM8qZyzvQ3s4N3x6noG2No1IRVZLZDCeLACRrDDRWOH4QGz5556pHSJsqQ
         hb4pJOqzN7NLQiOzzXYWbtPeHYpoP5Dd11vsta0fhwXO+dt3/jPSYAtO5n0rGbt0EFJ9
         p8Bw==
X-Forwarded-Encrypted: i=1; AHgh+RrzKRovQUEcprPKczwKGZy9SkrwOf1wDmEQAZK2LOsibmD+Rt1/fd339+ajhjoeZsLTJ9XHqftZJUkjNgU/ZkbX@lists.infradead.org
X-Gm-Message-State: AOJu0YzBPnlsujPFwVWumJfuQycx7q648H92JQvdPTwxhelIQAYpe1J1
	ecKbU58piRYZ9ac0ZX3RMmcg1rearDa/GmSDhnlf9JdqsYfqlBONZHht
X-Gm-Gg: AfdE7clnG3opZlQjDZ22Aw3ykrk2GBMZ3B/bawfRKGMvsnW9IX1JOXPSSJijnm6iYeW
	2tGoOSM0oLNaEUPOfi5xex2Z9ALkfNy0P6J+kMZD4jEKC+p/JswZE3a/rskM6DpaG+c4XSzHGNk
	wcVIhwiThMdyJAvAh0EaygiWgroE4vfdVKrqxo47Et4TV5J7XftYRNj9uLqQq8OSWBSbPuw7ksg
	GDOaT+u7IOevIZ39Vmv4iDa3XINxHP7SPCu2uui5d5zhJrgoHGQTA55+ICkP0iaDPUbegGkZI5J
	RiTIKgN1+83TdbqYLykkwv96TPsSXyIPjxYKOtrojjh3Apy7z0GuB38+OGdI7/yz+8ZBYE/ygnA
	Z1FZtbDCyeLoNIeVdNA0HjaGcX1LuMliKW+h6oU3HZwK925V5+1rcubpPEcbLbbWqcUofwAizD8
	5GnqqLfmR3WMWdyxY8/7QdDZDjHe5YwvHLM/Nlg8nERJjv24PP4qi/xpXK5w==
X-Received: by 2002:a17:90b:560b:b0:381:bc6c:25b9 with SMTP id 98e67ed59e1d1-38943463158mr9847157a91.31.1783678922024;
        Fri, 10 Jul 2026 03:22:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5516abffsm2490240a91.4.2026.07.10.03.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:22:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/3] ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and drop redundant error handling
Date: Fri, 10 Jul 2026 17:21:36 +0700
Message-ID: <20260710102138.29347-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710102138.29347-1-phucduc.bui@gmail.com>
References: <20260710102138.29347-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_032203_185982_F62A058C 
X-CRM114-Status: GOOD (  14.10  )
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

Use dev_err_probe() for probe error handling where appropriate to
simplify the code and properly handle deferred probe.
Also remove redundant error messages when the called helper already
reports failures, returning the error directly to avoid duplicate
logging.

Reviewed-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add the Reviewed-by tag.

 sound/soc/xilinx/xlnx_i2s.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_i2s.c b/sound/soc/xilinx/xlnx_i2s.c
index ca915a001ad5..0676da122edd 100644
--- a/sound/soc/xilinx/xlnx_i2s.c
+++ b/sound/soc/xilinx/xlnx_i2s.c
@@ -185,17 +185,15 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 		return PTR_ERR(drv_data->base);
 
 	ret = of_property_read_u32(node, "xlnx,num-channels", &drv_data->channels);
-	if (ret < 0) {
-		dev_err(dev, "cannot get supported channels\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "cannot get supported channels\n");
+
 	drv_data->channels *= 2;
 
 	ret = of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_width);
-	if (ret < 0) {
-		dev_err(dev, "cannot get data width\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "cannot get data width\n");
+
 	switch (drv_data->data_width) {
 	case 16:
 		format = SNDRV_PCM_FMTBIT_S16_LE;
@@ -233,10 +231,8 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &xlnx_i2s_component,
 					      &drv_data->dai_drv, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "i2s component registration failed\n");
+	if (ret)
 		return ret;
-	}
 
 	dev_info(&pdev->dev, "%s DAI registered\n", drv_data->dai_drv.name);
 
-- 
2.43.0


