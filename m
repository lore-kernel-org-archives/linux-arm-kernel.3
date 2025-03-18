Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4C3C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZtPLa6Gx4FxVSml/wkB43YfMAD/jyTKQtWnRVh8gh1s=; b=aJUDNYmr+AOpEkYBi/5qMnPFLa
	fsM9NcAcznzrCGUiZa5K9qhFum61Cb9slgxEQcnXSMBMq8rjNZs8xEFSThJv4A+K3K1TmDRK7tG/p
	/QZl0gc38+JhhMJrfldVsBWpKxG3w3rGrlsZSv9+sOZd17gPfHtaf6l17vqERylngSFtAAKrDmYDE
	DD3Kf3ROBhjJ9gPtsTLcUDQWDG4iRKeiRjZmQ7v9TflDdYSpDiL+ebTqyrHFcKPSgM9JQ0T62l6Q9
	jMGyX4ha0hTSX5CkZKR02zOfPWoQMOAJb/tJSU0iiN1JnsdOa1IlJVY1r4eQIxU859RuiDblML+iw
	4xxZwwDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuW3b-00000005spz-3MUw;
	Tue, 18 Mar 2025 12:28:31 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuW13-00000005sUJ-0JdH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 12:25:54 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54298ec925bso8202980e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 05:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742300751; x=1742905551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtPLa6Gx4FxVSml/wkB43YfMAD/jyTKQtWnRVh8gh1s=;
        b=V3AFthkv4FHqaEYl7PbQ3zUxtNjCJHpAXuIDvjTkdbzGqPq8tR44X8Ux5JWl93Yg8A
         SLCLnHvqRMVas+wgIwjm3S4hEJlmXPNsJb4dKUHfu8KYoWf49pcvd1rw6u6PVLcdJ4++
         3OGOjn4BOY9xmfaWub7+PZBCuMT3OxFGWT7rmzr1wOsFfkmceVzeKMeIvCyf3dvcIegU
         qzTsPjYTMQyld/bwGLXHeVfvTHIJ9zRmsKntMK5VTEcPMJ7yWmKVRSjbQbPyvPhYLeEa
         iEO6nx0VeNboo+sTU5elTnp6w/ruYFBW8+N8eXug/BQv1P7EW5Rxmuz9iQGW6vJtzkrW
         2fNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742300751; x=1742905551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZtPLa6Gx4FxVSml/wkB43YfMAD/jyTKQtWnRVh8gh1s=;
        b=W+94L7oIt4Tum5BWt5J7j4JVHqLd6k1DVKQVFON5UehPe4evA6gMXBBOKKGv9YgrDW
         V6OvQ5H5ApsBVOy+8wA+sBBEhU4VoTIl0R7JYn9VJV0ZvXRAhzMCPW0JRd+X+SewL2rF
         ekT0CD5YwpaTSwfDbGgEmtswrszJRS0H4/EM+3IZ51zwD4CzNCLJ4eblElDaFB8Rv3M8
         Iw7WLaGA4gASyuCkUp52v+mOnUWe8erLun4D+GKJQtK3vtWjaQywBNYBGVWCT4hNCFbO
         /T3JzJCki9UZLjXxSSiLMRvJZWm+i3xA24/U1x4X1ZPJ/SuhdWi3Jkrj8SngKg2hntzq
         tGVg==
X-Forwarded-Encrypted: i=1; AJvYcCVUn0HhBmIfJLEQ0tSdrpv1AMmTkZd2QSuU4kfIxVCvQjQgESqCfp1i70EfsSZGtt4I9GIRaGpbjuseTk+IZxL2@lists.infradead.org
X-Gm-Message-State: AOJu0YyJiiHBDMIm0WxJV+93/NET25K/lxDf21/HDyiDYjco42YFzSJk
	1z6h+2CJh/aAP6c5NAo5w/OGQ1Pe0Or/v6TpyuUafk02HpPwrZ4OwVgI9QhIuaM=
X-Gm-Gg: ASbGncs3QXKDUNramxLmnZfcHkKa5XPR2mxyMbhaodDFlvWTq8943lwaIhoAcyWoA1h
	mf2zXB9Ie1YTreAGLhyyxmSsAoA7FSHraHQVF989pd9127m9D1UL7STbjPxfWMYPcOE3Q68JfIf
	OEHNzqF0bb/gEhZq/RhQmE9wYkWIJmZ8L4Y30HBO2OHEW8A3PX11IGP51rjiq04hbG5QdzmdfFH
	c4zy25z8HxRfFH/QAPRLM+PbMvPcGaT769pdJBuiDzbMh6+Wp1upPZ2izYIer2OTLQvdefA2quI
	eUeuISge1NwCWNuV+OurEMbJhtK3te3Qv30viWYBImYP0a1Ese4mYCLaWUo3bTC8Q3m9+bTBhAx
	/ZN/vFlvzTWa1yhUq3xo=
X-Google-Smtp-Source: AGHT+IGVZaHWKtN8hvWXYb4jPz6o8jybr9YNPIgsaj0qZXf8oAQIfNC+5+M6VxE6U6PaRzmbGl48Vg==
X-Received: by 2002:a05:6512:3d8a:b0:545:1d96:d6f7 with SMTP id 2adb3069b0e04-549c396e431mr11868418e87.32.1742300751071;
        Tue, 18 Mar 2025 05:25:51 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba86528dsm1626584e87.138.2025.03.18.05.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 05:25:49 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v6.14-rc8
Date: Tue, 18 Mar 2025 13:25:48 +0100
Message-ID: <20250318122548.1328552-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_052553_143677_F9CE76F5 
X-CRM114-Status: UNSURE (   9.51  )
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

Here's a PR with a pmdomain fixe intended for v6.14-rc8. Details about the
highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit d082ecbc71e9e0bf49883ee4afd435a77a5101b6:

  Linux 6.14-rc4 (2025-02-23 12:32:57 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.14-rc4

for you to fetch changes up to ef17b519088ee0c167cf507820609732ec8bad1a:

  pmdomain: amlogic: fix T7 ISP secpower (2025-03-05 15:51:04 +0100)

----------------------------------------------------------------
pmdomain providers:
 - amlogic: Fix T7 ISP secpower

----------------------------------------------------------------
Xianwei Zhao (1):
      pmdomain: amlogic: fix T7 ISP secpower

 drivers/pmdomain/amlogic/meson-secure-pwrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

