Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED17D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 13:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UzjFUATixGEhENXHEUG95u0sMOrZqZmW0LecHI/bMco=; b=2Jy3FG7KovLRsKaS/B21J1rXoz
	aqmHWtDte0oLOvw/XmPOiwYfOFRVJV3nS6+TYTDbqj7x9elxwJkbFOo+y6flZVEAlAJfr1M4adeGv
	vQ1fhhC8mWq0ir8hhkGw1UQNmCiDcV93hghRRnUwJOniKgbB4twwn61LFaHroosVQ2Wgy8fI5rPRU
	WVj+C9le7SchEK5GXk5vpmYPTQJ46TOhwcHp/A3ggX+DIUR3ePhdTGMHCL6ZDgCcZtSE4CdzyDRkq
	fSDxtZ8MqrJHVADiGyAm5z/Vcho7aSOljkmxyfJP+z8zA/PnhMszeVvsv3FCyeEkj2DyMgw//yPIy
	Y085sJzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOyFV-00000000T2F-2lvl;
	Fri, 28 Nov 2025 13:10:57 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOyFT-00000000T1u-0ejI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 13:10:56 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-595825c8eb3so1734066e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 05:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764335453; x=1764940253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UzjFUATixGEhENXHEUG95u0sMOrZqZmW0LecHI/bMco=;
        b=fwJ09ACSF0ijfD63HiaV/heWSkO9qoOQ17iGaEjbS/o1Y+cvi7k7LGVaeeJojXhHBu
         2MoLVpiJiaPkpFxr8vQOvvvHzBg6FgOAsKfgHcanMYcxZyitW9fsjV0PJeXsL0ar1Fqg
         M5vC2jFkB7XSxCFQ87anToV6o4pp3uyt3zeL4b90iTUWO1hGwcjuLiXkOeIFOVajg65e
         1FkBE3KaysJXgqZe3+knaAP1hirkpMBLOSFNVNDL2ERQEfiBeBFCGuG55QiMRFD6OFiS
         IDqDaSesWikT4y1yxvQUX8XbInwpAXo70RtAbR0cqQMKf7uXGZEnK4ZchSBc/ga2RXNU
         PJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764335453; x=1764940253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzjFUATixGEhENXHEUG95u0sMOrZqZmW0LecHI/bMco=;
        b=GWPDC6ix/RlJh3rPp3uK26pR8JuHBN8IO+t2EVurVSAnnV6poqvo4CoPrK8mQkz1/e
         3L+xqSqCTC1ZxLJy09E9qMp7jJzrDz9UfU5gD9EOVDDOOxUl4F9KoH3Evaac98TlMLfj
         dhCsIxCs70w5okYwH60SPpbJExqSh/nCxHmsB8qTIdd2aWljJmpIXZKUIvyTPfcorMLJ
         NKHsaiDsJLLjn4UwgMx1wXVNCjGNB56ttG71kRdnaCAWyqMHc9KXqZi/s0PJ9SIvy0Dc
         Pk8Ad2T9zsa5Fe/fdHPyaoqR2hyemyCi8ghiS8g9MniIUBSDUZ3HIxiilBAY3/zz35jk
         UPYw==
X-Forwarded-Encrypted: i=1; AJvYcCUL/0vHMq8spTL/NybqHaQdWQYhpLnVTfbM+WJBZDSUL4thAosHAxnxB5y64Jjk6L4zRo7DSA/nXDiE3bB1SbPM@lists.infradead.org
X-Gm-Message-State: AOJu0YxhOfiY63gu0y60rdKg4CmTgAuvAi2MaTssQ9qxqhc/DkjlorME
	kwz3HdJ4dpA2cnzIznLKw+Z8ejdFPpkSczSmlxfT9AGpoEhjJlFzb6ZK6Qt3z0ngBz4=
X-Gm-Gg: ASbGncv8MGU4fNeua0DvtIp8+/RLAV+jm9N42fcA+scUKhMbeooZWMgCtEad1u8+fq3
	YIe0UyphADScjFgL1yQ5OSG5OMJxOSP+jbn6WbdMDv08RVqniqnCEe0dMpXQx8Wixm4tqTkwj0F
	lrW3aX/t7DluyiCDwXzM6BimQ8r/dxPoYaF7g78qHea6R7VjSVUMOI3XRpfaT28SdwVhTP+Srs7
	uvqMoFkqqM3WzZh8XeiZJrowfa74f6wj8T+jyU5Xb/lrPdi7e1yJlpOmt/0GW45xUOm/JKLxh8G
	xjoIvKr6eWGlblVwGaLWpPJP+v2d2CUO+obw0fd0i52bD8F6Zgfj1tQWgzXcYnwdGRcsMCUKu5y
	Tk6uZ9aizcW5eWdH/fTa8MkWMfpaJGhEI0tUdm5CPPXyShq8QojlVZAexRr/J/nyg311d1tZ5zD
	+Z8BRLOXQrsgv9fh83E/Y=
X-Google-Smtp-Source: AGHT+IEQsRJAXuvpMC9nA3qXOjzTHFWk0uaOKBkHUrEcO1F3nDkA6mgaLwYnxUkSq0kYQOipq5jdRQ==
X-Received: by 2002:a05:6512:a85:b0:594:2f72:2f7f with SMTP id 2adb3069b0e04-596b505992dmr5760486e87.6.1764335452545;
        Fri, 28 Nov 2025 05:10:52 -0800 (PST)
Received: from uffe-tuxpro14.. ([2a02:1406:25e:19ec:960:b9ff:34c:57a6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa43f12sm1209002e87.53.2025.11.28.05.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 05:10:51 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v6.18-rc8
Date: Fri, 28 Nov 2025 14:10:49 +0100
Message-ID: <20251128131049.7584-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_051055_227169_D492B43B 
X-CRM114-Status: UNSURE (   8.53  )
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

Hi Linus,

Here's a pull-request with a couple of pmdomain fixes intended for v6.18-rc8.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 6a23ae0a96a600d1d12557add110e0bb6e32730c:

  Linux 6.18-rc6 (2025-11-16 14:25:38 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.18-rc6

for you to fetch changes up to c98c99d5dbdf9fb0063650594edfd7d49b5f4e29:

  pmdomain: tegra: Add GENPD_FLAG_NO_STAY_ON flag (2025-11-24 11:14:01 +0100)

----------------------------------------------------------------
pmdomain providers:
 - mediatek: Fix spinlock recursion in probe
 - tegra: Use GENPD_FLAG_NO_STAY_ON to restore old behaviour

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      pmdomains: mtk-pm-domains: Fix spinlock recursion in probe

Jon Hunter (1):
      pmdomain: tegra: Add GENPD_FLAG_NO_STAY_ON flag

 drivers/pmdomain/mediatek/mtk-pm-domains.c | 18 +++++++++++++++---
 drivers/pmdomain/tegra/powergate-bpmp.c    |  1 +
 2 files changed, 16 insertions(+), 3 deletions(-)

