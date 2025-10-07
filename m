Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5942CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 09:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hSmNQbC023YaXpseHaoEKu4/PJTwQxs0VDin5nInWZ8=; b=IAJq7xgyJ7ZslrJ1dmxOYrWYit
	2IZNIMtfzLf1aPxM6D1jVSOZfepvVLMmwLjpK1GiVUR80yLUhSsA/IiqYkbcXr+U7/Z15Gxkl46EP
	+3jk/EEjeCYn1qPOx6p9oMxMk6fsvwkD9qwxgXNLFIIAUs0iFisMmvKLaKnMQr7U9MIRQkBNDNvWX
	wCldywAUE7ciU5oGL8QqfBXxUf9gkmlNrk52SJ2uLIHOmCrsLYQYnoYaq2XNiOsNW8XvyHM74tcuk
	/EH7pNWdq2bcbHb2AiN/ThK/8HZayDPML7MDHa0NAbm3lSDxbf+a7fZhpl0ozsSjiRx564ju+Dd7C
	jffyQH+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64E9-00000001iuQ-12s8;
	Tue, 07 Oct 2025 09:43:25 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64E6-00000001itp-2Gig
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 09:43:23 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-36527ac0750so56951531fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 02:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759830200; x=1760435000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hSmNQbC023YaXpseHaoEKu4/PJTwQxs0VDin5nInWZ8=;
        b=cSyBjdpxMdhGY5WDvV0OyhsNgvyuEwia8QBYVcfmj2tYqBR+sIkglZFNra3hyR4bvl
         VQ9mMhYH1t8TFOYlxc2L9B5z6WIG+HDB86EKUAwLyI6z8ELKQ0ZfgMr6XsAemyT1f5+X
         TKN5W4HrWb/nTcDoD5gIdMIRdY8UzqU3vbFXdX6TlwaEjNl6vy9nUJ75FBcFIZsJgY1I
         s1JaMbcTMhjMrK3AQh73HQLWjPbQ8jcap//J4Mmlq2FwAyPBIUlxBfBo0Q2Lr910wWSf
         23QvNioqlS76mXHQcNomNa3po0lLNWBEBjoBCS002F8XtLsYvI+kn1GYx5qDPTuZkFYV
         XRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759830200; x=1760435000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSmNQbC023YaXpseHaoEKu4/PJTwQxs0VDin5nInWZ8=;
        b=WhEw9+VwOvT8gnnrGOiCHBjCK1RqFwxtQYGO0J/teEd5tWe1nGGHPc9ZVwUgL9kCbN
         rGEA0IR+ozHrvqNWtUsFdUDkA+D91AyewEqX5lBf3oZMgb0x+Es1ApFb+gr4cFx1wxLG
         tg/r9FRMT/L9Xxkvb9mSqYN6wYvXpQ0LoovTfcY0onOMdGU7xv0o0Df66w/ZduXFZd+h
         WftDpUj5vMgdvhVjdxr+K7K3tUhAPDQ8gYeGe3jGN8TnKYtUH2p0PtuC3oSqXGNHW6oi
         YrU3ar0iCiIxZBlIvxM37qzzrkeArba405aIJNAHFINAmOtxkZ7/bxg5SOBu2nMxSmyJ
         tFsw==
X-Forwarded-Encrypted: i=1; AJvYcCVunXF2MWBez1ISKxWA8RriLJy5go7YHEdA6T4DRCJ752FwxPs3dRZZWRryQDCNK0T3iuhMhjLycv0pC1nnmE2K@lists.infradead.org
X-Gm-Message-State: AOJu0YxpsHdPrztif1J/jO0LpQxcPbbMrArctAo1EhQzB8l10oB7dsTk
	ax1U+gLsYG+mjZxrXaxBVRuKKlZwXCT5MfvGkCOv0nJ4iZcdiz+5h2u3EH+bPLCpX3c=
X-Gm-Gg: ASbGnctc6WW/zhBB01V/EYrxWq1sNkJwr0iVk2oVNjTmt84tfTCrV1ZqlVNxDGKuqWW
	fMMTC6KbADhlW1Uz4T0sqdPa6DtCbZQb1VXAyIFIRdoJq5KnatbcSzcbsx/+5njSovyieV6Kujz
	krFKbVxld595k91qxHtxcQdcUD9J0FSJYOty0Zx8MNpOVCXjsuI9mYzreohViH+vk2rFt+Upf9g
	H2gW/2jLLKBY/P7xiV0Q0dyQCNUsxCn88fhejW7hr+jhwAswZR3ZcxzD/MxgS9ZPhpbYnI0V1r3
	s46j4ArtE5BDbLNbLEmPmUGE/yv4loEQMkpTmpY2pyfnj+Hz+UYMcnHJwpgjileo/fMG9Xl0T9j
	a8S289ycLaKaiA9+ZGzdtnbBPdJf2/fGEoE/+rnmbCZ0WkgAzuPkl1YLYBftSScHKq0HcGMrfcb
	m3UuVV/I7MugGTAnU5t0d6zUGy
X-Google-Smtp-Source: AGHT+IHun025wmd/VNOXL9AvwM+T6Skk1T6ZSwLUE4guDBJ/m66mfRMTd3uDpjq7T4WB14NukVXiGg==
X-Received: by 2002:a05:651c:2222:b0:36d:3113:63ac with SMTP id 38308e7fff4ca-374c36c4a1emr49732751fa.7.1759830200228;
        Tue, 07 Oct 2025 02:43:20 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0112438fsm5940932e87.14.2025.10.07.02.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:43:19 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pm@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] driver core: fw_devlink: Don't warn about sync_state() pending
Date: Tue,  7 Oct 2025 11:43:12 +0200
Message-ID: <20251007094312.590819-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_024322_610925_1936DA1A 
X-CRM114-Status: GOOD (  17.61  )
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

Due to the wider deployment of the ->sync_state() support, for PM domains
for example, we are receiving reports about the sync_state() pending
message that is being logged in fw_devlink_dev_sync_state(). In particular
as it's printed at the warning level, which is questionable.

Even if it certainly is useful to know that the ->sync_state() condition
could not be met, there may be nothing wrong with it. For example, a driver
may be built as module and are still waiting to be initialized/probed. For
this reason let's move to the info level for now.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: Sebin Francis <sebin.francis@ti.com>
Reported-by: Diederik de Haas <didi.debian@cknow.org>
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v2:
	- Due to discussions on v1 and because the default Kconfig is to use the
	FW_DEVLINK_SYNC_STATE_STRICT, I suggest that for now it may be best to
	keep the warning level for the "Timed out.." print and only change the
	"sync_state pending..." message.

---
 drivers/base/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index d22d6b23e758..c62e428b95b0 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1784,7 +1784,7 @@ static int fw_devlink_dev_sync_state(struct device *dev, void *data)
 		return 0;
 
 	if (fw_devlink_sync_state == FW_DEVLINK_SYNC_STATE_STRICT) {
-		dev_warn(sup, "sync_state() pending due to %s\n",
+		dev_info(sup, "sync_state() pending due to %s\n",
 			 dev_name(link->consumer));
 		return 0;
 	}
-- 
2.43.0


