Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0554C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 09:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ETFfzivBomCCDCyrbe6+6aUhyVBv4jXv02doewEomfk=; b=cd1lPWEU2RHrWGSB08+xwgVbGA
	6tnynAFP04YHjAfYxP7W8/am5pBhZDBwjwqG1/JAmBDP+ylhrIB65DkG9/iOG1U8O1RI1rAB8mXGT
	VyxGd3W1mFv0b3Dx4JL59yNDwzfbt/63CN3YFdO1DvFSMFLjIga1CzJQzczhXXtmlJ1xnaz2lMlKT
	2PUJIUcFkg25WYYiblPEgTEuXjBKKiqDimApK9x2BWDaPOkQYCnD9g44SZWFMtDN/MbLFQ1Xyeiy/
	I5eBp93bRo+TukNJrIcJJ4JvL1QUr0fJJH905NmCXI1D85KxDswGEsfuBmyXavBWk27IdvnOMxXKL
	lKWH3Chg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoQx-00000002Q6y-3PpK;
	Fri, 14 Aug 2026 09:42:39 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoQv-00000002Q4x-0mS7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 09:42:38 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so10955765ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 02:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786700556; x=1787305356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ETFfzivBomCCDCyrbe6+6aUhyVBv4jXv02doewEomfk=;
        b=h7Gx++zj62qgc/qr7qMjnf1d+juml+RUH0A2kkIfbuxMF+c+/VyJgfMzX0lrD6f5yR
         JS/W/tucjr7jFfhoeJt4zttn+cYlKf48CbiA+YUkEtpvr8Le8T0Hc/+c7ZfM9jF3tVqB
         lpvdI9xLdrsfeVtPJVYTTovg6FyPF2+TmohIT4EO/y0ii8/GZJUksOaYkxQ5fQQGpCo8
         JKsVz0IFgZooXp5CCrW3glkWdoTYiRPgOEcqc1zR2CUxEYk8xW6VQ+Q0FUwN/7M8nQUn
         Pl6ZZa5za/FVGS/iIm6yFDAn4vcRIMXSyQRCDUL7T+x6RO/wZ3zmffxBQR6LFA8/BNJ6
         riXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786700556; x=1787305356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETFfzivBomCCDCyrbe6+6aUhyVBv4jXv02doewEomfk=;
        b=Rhapjjj7YUqI7Yz9nSC2UtyxNf+fbx35HxjTpXd5JuFj6Pv897j5Q2QQ7lBKzfrvNa
         c8ooY7876f4SSxdAOvORHNb7/k+XvWqc41a6WOe9mokYxg2hECryZTECJpQ5VC/3WcjT
         mYjQ8qUQ9vfn2qdyr6ha9Kh1TX+wtRZ9rAHmEWUhvzdUnrPvcKNzm7BN2iuEpYeyLhJW
         ozUMYI9/7fWoKdqXRN6d8k+HWc992T/suu13szHp2ZQPllYymKvGhc/4gan4oM2ePyBa
         KiCeziKAT42i/6I/g4pxAfdgo9jU32Cyu9h2oIBMlymiXm75jM0jb7jtFoXhishzzNm8
         9+Ug==
X-Forwarded-Encrypted: i=1; AHgh+RqKKIg8/sMwrC8P/26HHsvyzTsY2RYgk/+kNytT6IMzpcRkAewSUFlZf3k/Brws852nQvCKpA3MQq1/PFRa8skV@lists.infradead.org
X-Gm-Message-State: AOJu0YzdNUJT+u1BRiG3uXqG3TL7HHDx+mduTjDOikafxpaX71ruDzoo
	j/EztfKnQ8OjS18jON8CTaVKYmSC0ES0dOFLKjhQ5vXsICrKMhX7tEu/
X-Gm-Gg: AR+sD12AdXxaw4vDRU6seUnfKn8PyQmTN8MxmvS54dNEUpUOmhXiM0yP3Wne2cKRB1H
	GwjfwOHYGVE9W6a2WAUj5oxHcPSMYAMlD3D3X6/ffrRmYpCCwE7lIwXskuszK7+rSoj22UguxMU
	rfQe3aaY/sqIOcM9mEXoYa3kTaQNG/lBf6+NYurDvDWp3Twhc2Pgq1KhgD0RxAJa1ah39+ICSyX
	IoNrLyl7P/6A1M24DRj8eCCA6fTnaeMBvrGZEblrSkXTObMF7EDWYbEXonzVWhr/dqOTNq/5oVw
	mEo/lIelTlheRPF+xtIwno+7NjTznCY8PFeR8zH5JFDxlk8kSIpQxFNzusmLiQahb2zuH+48isB
	xgIzltrnlGJ4wCLtNYjBGJU9qMTcfzeLZhE83iUwkCmu+TMU8lzhw9kREuwXYZup/tfxrKX42wK
	Nxi2dS2wT3bqvRuMWY0QZpBrEBNKjTnhD4/c+2FpvrwtwaBBQFZLk3CtcrRPmV61b4eLh8cmlCR
	htuBpCeUQhpcD0qD3yhCLhJPqXq158yk1qLAVmznX75R2BWG8vyXegHDtcPimePl18K2PwtogrM
	ERRm
X-Received: by 2002:a17:903:1a08:b0:2d3:7887:7e7f with SMTP id d9443c01a7336-2d3b0c5de30mr56550695ad.11.1786700556062;
        Fri, 14 Aug 2026 02:42:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae7c067asm7446345ad.28.2026.08.14.02.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 02:42:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: meson: aiu: Drop redundant probe error messages
Date: Fri, 14 Aug 2026 16:42:10 +0700
Message-ID: <20260814094211.25151-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_024237_226384_2F22BFB7 
X-CRM114-Status: GOOD (  12.52  )
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

The functions called here don't log the error themselves, but the
error is already reported deeper in the call chain, so the dev_err()
calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/meson/aiu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 2668646e3597..2ba61e2f703a 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -242,12 +242,12 @@ static int aiu_clk_get(struct device *dev)
 	ret = aiu_clk_bulk_get(dev, aiu_i2s_ids, ARRAY_SIZE(aiu_i2s_ids),
 			       &aiu->i2s);
 	if (ret)
-		return dev_err_probe(dev, ret, "Can't get the i2s clocks\n");
+		return ret;
 
 	ret = aiu_clk_bulk_get(dev, aiu_spdif_ids, ARRAY_SIZE(aiu_spdif_ids),
 			       &aiu->spdif);
 	if (ret)
-		return dev_err_probe(dev, ret, "Can't get the spdif clocks\n");
+		return ret;
 
 	return ret;
 }
-- 
2.43.0


