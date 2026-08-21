Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E233CC5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WhjxC8meyqFgoC6xgU71L58Qnwuzn87ityQti+5Ixag=; b=GpjZSX0tQIFapI8OUIaznZRnED
	s7XAHnheX6O9Ma+ivawi9fSwWUImmdy4MPmXV2XKG/etoSroD7CqDQCousbe3YocG8vOfamegx7lR
	7G4CwbX3HufHAHB/WgeKjDdNulc84f5L2DbrL2WhSVpMvbIkSVFuxg3bPq45faYQDFWK/r/kg/7VS
	ggaEVWO3a9uEnQVgGTPNbtxONBxGi2UOsm58SxVdZctkuys6pDdQ2qt8mjU5nTN9UJ9wm0PaUyRzu
	kh03mM0lEqasGyzGWxVMK0FxnWjh1mgGIIdMWndo/dMwRmmMJ7sJGss65eJ/ZrbBMOO/EFYfd/Vh5
	dOs2nv5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxONT-0000000DJHq-3CtP;
	Fri, 21 Aug 2026 12:29:43 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxONS-0000000DJGn-1TCl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:29:43 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84e27035206so262506b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315381; x=1787920181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WhjxC8meyqFgoC6xgU71L58Qnwuzn87ityQti+5Ixag=;
        b=Xke9kaIhnRJvdE3iHUnzXp50W98fDtAGNxQP9lHCVkGmZ4MvctU1ayWouCl86G9oqe
         W+DOYiuT5fZGSNqRHrnJB9fYwRTqKZZiNQUL6KpAkc+aFUknOA2fqzkGIC4M3iEdkmKP
         ntLiiMd1lr5Z7gsJT9vRZUg9CTTfgxgXi9aTAXPhXpXJ2IhrDslm6ZYruF2KdWZ8IQBC
         0wi/wDABMNb6N06cz7BSq17aarnKqOhrV3edsz8ReYjv0jQ1CcE7xxStcjTAh9GqBhB+
         QPHljeco2AO1n5Y5FYBfRd/3r5aAmMB761gCY6xZz578TIhk4Pb2SdpSMBZy2Qd1RIzJ
         /zHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315381; x=1787920181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhjxC8meyqFgoC6xgU71L58Qnwuzn87ityQti+5Ixag=;
        b=rY6v3tYJWM9YLw3SfLdz8/HyQA8EBqWAjnQY8CmUb470MNablQ9qAn+FHvxMIQNoTD
         O4EYS7Zh3QpmTKy6qNXfqce9g/5PMeJ3hvvN2qK5pf8ygU9VV+vN8beHwDxcQjRNYn5k
         SqXcyzSWnwta/W1AVOPrSBKO+BfOY1dKo94n0jIt8CD7DrDt6f1zls5IxXVI3+2+PbBo
         x/+HCFr87sDQZGnKDJ2I5LjUiuLNpsjKqAXikgGf4s1A/2PIxG/R1xjWXdaOq5n2+Q+d
         W5H1klI8ojkwfri/PbJFkKt6bsQjN4gIIwrxTl74PFoC6g+4nQJD049K+Osm+34frkVD
         HnVA==
X-Forwarded-Encrypted: i=1; AHgh+Roxxt1iAU4ZvVIEHMfjLT/28n3gtO+p29LCxY59lpxqXPWbH2TZ5dya0EAgdb5/eRBvZzkmJvKSz0aQc6fwhWZb@lists.infradead.org
X-Gm-Message-State: AFuF++lluizMQUGkUf3cz02GxWWb6eJSweNeMS7dx5POHYQaWiYaJlP7
	n5gssmfCiskBiDGX2QLqLThb+TMGwkfMhxklVt03UppITVS1xlXO2mKY
X-Gm-Gg: AR+sD13lNKAXFML22hDylgSt7DxR9k1Gcy2Sxax7ryCzCxw8o9bu6VdpqqtGBPlxSev
	179OMsJtYih93UWMOP/9rKllYt1MNDCPAqwnfMdxOqLVLseKWYcy9fLIXC4isquY+MwgzTe/rV8
	fDQeJifO3JNHm6aIZW43ciTlNrPL1kHS4h2TZ6rTaLd5IL2kbrS5zkX0oT/RQVafIKpuuMsIs+a
	DdN8iu6JE8gHpIR9w4VmSyohS11WtvLHLnrBFb/ilVbBtbhTLRruuBlJuYGaSyg1+mw8hSpAC1A
	KSROOZxk1Caweroo41Z1Ct+C6rpdNmHnTn4TsoAxFGHznv+WBAudSLK9xJrh2CA+lnO67ntiuiG
	mTI5zFK92Z4aShl49Nn8N/EQfbbzmB6tC2Ogp9xTKDINLpgLLW4wAa2YKtYsCCxyz/3F9JA9FeC
	JqMpzJ8yzEdZ2jcBhsyUu7WNAUx+pUKYXCiD5Lke6oVXK+S1p3JBhdk+RV33CbMBTTFmDAIfoZn
	qbuqSD/NqEgmsqn7PanuVc225Qelon0403FRSFHwDDc9VZd2moAgX+MbSZJxQVfA8cmT7mudlUY
	DaIg
X-Received: by 2002:a05:6a00:4397:b0:837:e9cc:d474 with SMTP id d2e1a72fcca58-851f9bb6a9amr10190094b3a.2.1787315381261;
        Fri, 21 Aug 2026 05:29:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3389fc4sm2848582b3a.14.2026.08.21.05.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:29:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/4] ASoC: mediatek: mt8183: Fix clock error handling
Date: Fri, 21 Aug 2026 19:29:24 +0700
Message-ID: <20260821122928.41343-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_052942_394825_8E207373 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

Hi all,

This series fixes and cleans up clock error handling in the MT8183 ASoC 
driver.

Compile tested only.

Changes in v2:
 - Remove the redundant error log for apll1_mux_setting error handling.
 - Add Fixes tags.
 - Add a cover letter.

Best regards,
Phuc

bui duc phuc (4):
  ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent()
    failure
  ASoC: mediatek: mt8183: Fix APLL enable error handling
  ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
  ASoC: mediatek: mt8183: Drop redundant probe error messages

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 25 +++++++++++++---------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c |  8 ++-----
 2 files changed, 17 insertions(+), 16 deletions(-)

-- 
2.43.0


