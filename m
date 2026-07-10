Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7F2C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FpEEKAJp3BqSZSJR3hfnA3eBxaF2LazIySDJM1KKJg8=; b=UN7k5RvP4oTho8pJdTL1A40++G
	8kNjuYVz9iscSU7uKA41Vo6gPikypOc3X9YLemVKI78SIwxxMatqiijZGLDHUBhp/sPIknE7hmOiO
	1xZUjtsVz9zwWfzFq4Qh2rvOlOn64WMt7pUcELTu4SK8Y5Wd5WdygcDiZKKPeb9WhHPHLY1Yjp2py
	0J4TzKjqSO+ZK9cZx108y3W3VEgm/npX7DOWzW6k1v0LrLLU9QvCrlupQkCrHvbsmMqLOR4mJSqP6
	8L20tD6RA1KsMEWho8kEVjmJ8Xt6hgpycn+Dijie9rFHhzdz8uYsXYZxqwh/MMWM/GgnCVU/f4tlO
	ZfkfDOkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Nw-000000047Tz-3rw1;
	Fri, 10 Jul 2026 05:02:48 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Nu-000000047T8-3IVi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:02:47 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-37df72c9984so863206a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659766; x=1784264566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpEEKAJp3BqSZSJR3hfnA3eBxaF2LazIySDJM1KKJg8=;
        b=q6SJN0v2g+Hw5NCdqSSVzHsQ56zB1yEFN0JBhCnsu/Q0QxgVY01SjfNK+abO3CB3Ss
         3EGWRaMOSUAMav/LhM0wDUBYo/s1p8PPK936skOXO7/7H5GuD1yb3y/TWMAsz0Lrf/SY
         rd6vq1UEESZD+JigxhztRZJLLzDd1mfmRVf2vL/ikclOdjvqBHhvcP25OwHl72a8pSG3
         xuex9ficGymeHvA8PEZp7CRFhKBjn2EIX17mhEJqDtJSPUEDZibMF9nZMIStCksUvh8W
         i4o2agigynRKMlNFvFx2SE6L6iv9es4crqs1WdSVuyavGS/xYUd1VEIy6XsF7kJXeYE0
         If5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659766; x=1784264566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FpEEKAJp3BqSZSJR3hfnA3eBxaF2LazIySDJM1KKJg8=;
        b=RRDcfRLcYKLN5SlBalDEVbrgMoxgReOMWlAkLI6sOZNuwFzLbR8NC73KHJ4wF3nXi5
         sUeTkce7vzT+m/p4p19ybWQvui/GLWSUxfI0tAFPMJdfwggpoH8M/xowjvlQaY2VDimy
         zzsPaL+ezZ7ZeYajcFQeOV3qbU3ZuTC6Iw85ClRQCujQ9dqUMUoL+WVnNJBXtrHxVIsj
         /z7xj9Yaf6xkdNG8LtvGbMXleHWW4lNZGdOzntcR5Pg6AHl81Std8nGtpfpXUhF1AkN+
         beqIjeIhaCRFHtEyS8euTnHUCviqbtNypcwJC4mVcR/RwyMwzXmwY+Ol8PD2HO81qdSb
         vacw==
X-Forwarded-Encrypted: i=1; AHgh+RpU4UFMiWOUZQZI7gPXvbB8gVnvX0cj0FOcpBJbVO6JTb6bTt/jSBSUowFacpGAUFSlybv1EGsSHRn0SerOUXNO@lists.infradead.org
X-Gm-Message-State: AOJu0YwEI7aQ3Kt+jmFmmHuORDOwv+ZYgkAnU1Ga1Ca8hvZKP1WGe1Jh
	jXZcTwlSiIfKQLIEu3TCYZOb+NPYZAzehH7Vi3NF2nJIFN3fkaiQhmQe
X-Gm-Gg: AfdE7cm3dzAlX9nV61DiOOfc5WxPePnQqzrEizHp7XshNRhRU+eVyW4GFfCtGtaQJlA
	6b1mtYw4zbRgGMXjRP54RBhlWiDIde+oVEC0uidXbYcYY6nGQUkjOt258vEL8PgEo5cuwfV0N6l
	rORemVfnTGiTS5VK7PUOy9zQSJf2FEp7QDrK66pleW2fpMmTmJ+K+EoIkE9ZzEPp4uDfo5U4gVX
	RqiLes3GJ+9W8wojBBmarGvanmjevOFOzzVF7IJ7DT9gJGkFninTAYASZIG86YxZHw71zUkv+db
	YRPnvzGY/f7RTrZLuUan5At7a73AHUJhVJ9SeX5Y0YTefUKx4868dbupaKUL7/xPos18zxKd2Fl
	Iv3WsQ/X0Id66X1TPWifdKCvOgNGGrhZSF8mCC7WTOmoJOIuhPEOL4F754cyz9sk0WQOiVUV1Am
	5UvqVxwqFRVjUzy/6F0vm1yOHrbWQgLl1mIPPq4kwAOeotajY=
X-Received: by 2002:a17:90b:50:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-389407321b5mr9590297a91.16.1783659765935;
        Thu, 09 Jul 2026 22:02:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5516ad85sm2139647a91.2.2026.07.09.22.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:02:45 -0700 (PDT)
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
Subject: [PATCH 1/2] ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and drop redundant error handling
Date: Fri, 10 Jul 2026 12:02:22 +0700
Message-ID: <20260710050223.14266-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050223.14266-1-phucduc.bui@gmail.com>
References: <20260710050223.14266-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220246_829069_95946019 
X-CRM114-Status: GOOD (  13.48  )
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
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


