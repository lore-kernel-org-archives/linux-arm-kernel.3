Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE9CC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 05:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rju6HFe/S+MJe8cf6yB0HBsbdDH7a0Yg40XL1i/Z1yY=; b=c7GCp4t+zU/Cl/DBDNX3NHRQE0
	BtdlkKw5PUtrXl+0GWvVnBK1MEv3JFaaB87cnTWH6bXyK5GFIq2qpJdG2eJaon+vag1EmX2wKxSPC
	O1YqTvsatdpW+kAhzvUq5MUdByDKLhvOwVQ4zEkBpzKnVkwn2UmFnRUSkPpeAUgdrIF8Dl2rwGIIT
	7DHFKFkRuutxAol0QEujSr5urs9FtWD3IwEKKxLuEHXjumXUduurhm08Hg9Prbr225d9cSD6hcPAq
	c5WRumpH6e4LdyMJZIncFy/arIoohIJ0FkGaUPLsH6dscscvQ/d9RtoaujBHul5W7n28FrrrX56wK
	b3YQsZqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqZZ-00000004yFU-1kEp;
	Thu, 06 Aug 2026 05:23:17 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqZU-00000004y9H-3WX6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 05:23:15 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84eb992a881so1648939b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 22:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993792; x=1786598592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rju6HFe/S+MJe8cf6yB0HBsbdDH7a0Yg40XL1i/Z1yY=;
        b=JgOGaXDaimMEZlmxpJnEKuOTZip4RrKKXfFMF1JtWnL/DCZSJeADoNac16Xx6qcEL5
         q/Ivv+SZHlH+rxcsCX2RtlGyGWuaTI2AeSaDSK3bjibfkdKoiFNLTZpYdbpUYhrtiPlc
         Wg1oj0TtYQRZB1nZ73nhwgd4sAL28D9K6heOM2dgOf5cryzopkVYEiSojtgdr96jgBUR
         xwCDeKEtetmhkhESOgqRnLp9Bwir0Q9oJPcoaEvARUAJ0SBEmEOYd/mk1dizDPO5QWSA
         ZUFFPcy7FsRR2ojndKYeEO3dhz64oJlpSkqZTv41zYlsGxev6GQTiXGjNITAQtQw+qa9
         xELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993792; x=1786598592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rju6HFe/S+MJe8cf6yB0HBsbdDH7a0Yg40XL1i/Z1yY=;
        b=YznUAe+u3+fwS+/H5219YBVh8pozIl9/uolHefIXWXxL9728sEeTWcB26WFcLNFW9P
         vzqSlpzIqV87/LpDqLBv+fj2wztyijJ6zZtXWvmCMErAiA6ATLtiY7vOEuzWFJLOdftk
         E9tnFcympzeeHpiOD0PaAdT0BqTJbFT698vgw666yV2oit0IcpEahzEK/sH8RJNkXWVU
         cFbunWcXDosCeyfySzSieIKA05I6f0aixNwudZrNqKl5zi3SRo/erZ+nbFijKuVAFzM5
         ggytQlhsxgZOQA3mhPGSekAat62qvAXX2+uOWaAZMprxssMR/AkKxRoiffb5TR9kJXM3
         EGkg==
X-Forwarded-Encrypted: i=1; AHgh+Rpc6nDXr9JFoCY+27UXeFba53IpyN0ETSeOdb4hk3QoJYqMMM9WJ0QrYe7/2QC0F+Ub0Tt45+LDO45hr2My080P@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8LnjbhPcWRWTm14Xx1mHWVZEZ8q6CJzbdXP9oV7x6fjeC82AZ
	bTbCrSK3owxp7J4a+XfeMVJJLOhE6WrONc4hDnfQuOTtuzIdy35qbbB4
X-Gm-Gg: AR+sD11oz5Znzk62UkInGHwpyW3qU26JckogUz0AcvGtwPxQjMlJTxepaoSIdWzhpxp
	CNiHSTB7dKjU9cxvuE//lP3U71jb5URrkvl8vVL3kCa3eKkDVoPxRtHHV2sGBVh9LLkpK4FRdWP
	elaQPdVhJ5GRjXrVv7rfmVluLpz1F9qxZI2dyV8k0iyKu3CSHSu5q/g6SmgB9yiMotq0ssdymDd
	M90yJ7M4WfXwboxHWl/Bsl2UCNxtb2RFYC4cmCPQ/GebShoi9i0PJRXZtghW/xQQOuLf8IfQfXY
	4Ks9yfBBkTU+xLaNspBxkqDOLZuUyXw4FnD+X2F7cxckKS6QFS9FS7JYUVDTxbWub36b43bTuS1
	wPF6YI9Lm+B7r5mKmsCTsWiAu9Ei48nnjuqzV3P58ejWfB/7036ad2doitofzRDP79SzRDkipJf
	VBYp4RkGJR8ME33jNL0XtRu+cavVAxYJkYXd6qq1w2Cs9LVvuj7+xPxdpnZm+XCQ5W5+xxr120w
	mcdM4M+WrW1HLYWedit+YrM2HcgbIpNtaDh7JkWXTXy46+EN2Mrfu+TZLz3JNtGrpr/BLw7XorF
	W7C+
X-Received: by 2002:a05:6a00:2e1a:b0:848:42a7:1854 with SMTP id d2e1a72fcca58-84f2e0c9c90mr12879556b3a.39.1785993792226;
        Wed, 05 Aug 2026 22:23:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:23:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 14/14] ASoC: rockchip: spdif: Return the original error code
Date: Thu,  6 Aug 2026 12:21:36 +0700
Message-ID: <20260806052136.21034-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_222312_889711_519680F1 
X-CRM114-Status: GOOD (  14.08  )
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

Return the original error code directly and drop the redundant error
message since the called function already reports the failure.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 7f15bc7f8f35..2d53efd5dd2e 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -396,13 +396,13 @@ static int rk_spdif_probe(struct platform_device *pdev)
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Could not register PCM\n");
+		return ret;
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &rk_spdif_component,
 					      &rk_spdif_dai, 1);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Could not register DAI\n");
+		return ret;
 
 	return 0;
 }
-- 
2.43.0


