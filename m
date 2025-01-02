Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE89E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 12:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=87IKF3c9HbECtsPTMeRuQc+tjYDzspetfXzHHwU8By8=; b=rUtFuim19qbN3nnlCwPom3M+IT
	dt7oUdlPcaEmsvVxlhixo/9kC92PSi5jH7RWh7INPQlT8pppjyjYPZQCC58oHjk67zsgpPvn7/ViT
	hH2xwgaG2iPPbEvvXvyGlmJqkyXC0z96jZmZhOIeEI0IFFPEIeRVesMnZ6ISh+D7Enq6IkdiOeTE1
	g8TDqrtSpbLm9rIIHEUqzcjC/z8pgECYSrHsJGdr0mllBqqjOFN5EBchZ79oC41lRfiT/GnKVmGyl
	+OcTzzOfbrbfHCvftaDbXA1cpgO4+AZ0k6iMrq7qQRVJGgT275vR7lvnkyxmwvUp8n8KcbDinXD36
	xIy8VcxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKg0-0000000AOqk-33fH;
	Thu, 02 Jan 2025 12:51:48 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKcH-0000000AO0z-2uCf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 12:47:59 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so12373246e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 04:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735822075; x=1736426875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=87IKF3c9HbECtsPTMeRuQc+tjYDzspetfXzHHwU8By8=;
        b=hTEH3WvyRs2nGMY+PCHxgyebFEZfxVaQi71Vh4l5WPfx8DrTtLMEcYQpKMIqE+IoI8
         htvGKzERnQhyMjr0mSh0vbg9uiS7g9p/QY/vvXiqSXDkUBCjbbo4/Tca+9f+IapQtdqX
         FLwzG15lylnc7fBLVt3Xq0LuIWNM8jDaNz6LGl9/znDZUjqT14A7wgKnCHZ3GDjzQbxb
         c+cHoWPa1L9AahbkYYMf7t9oOsyEJ8f3otMTDn31odCSkTMCNvF8PY2hnDysPt2mM/kL
         C9L5jVCHPnAv1lniUENgk/PBLJZG8ebpntrZmC3R4w5S18my9Oo5Wm0Hzf/eKTp/PBfe
         RQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735822075; x=1736426875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=87IKF3c9HbECtsPTMeRuQc+tjYDzspetfXzHHwU8By8=;
        b=Xo55277IKdryZpxA4TMDJiTpXjrUa8btK+OGGjVBhwApvTAiXjqPw6X0d+tJ8WCMqj
         grjUkaXaTxs+5GuQtlBG/j5nvDFwbUC7RVwi7kFXkq3jJljbBFY8nrOgpVsZNbdkzKwp
         1sxTi3xVPdjOteN88c8tCJlNzUHoGpyuM1eROALGejJz4uV3aQMFpM9gEYh6YmYQtLIu
         40WuYW+gpac0Z02uT1dQXLTR4dNqkEkGlJ8Oo1NZ1ILeBvtd8ph+OQK04KYkMNph4Bzn
         bXJDypqYRUjkxhjc+edgbJLX/JUFxpeyJRop4b6V0o76v3JiGpMoYMy6nXUgHLSr/wsl
         4rXw==
X-Forwarded-Encrypted: i=1; AJvYcCWtZnpNPSqsZ3vK9ebg6wzEd/dNou3Pc8MPMjY93nhv30Pm5TQU8zVZnq5/6GidBrCopJf4FfhTeqXLfr2FrHh4@lists.infradead.org
X-Gm-Message-State: AOJu0YyYYyx0FupU53T12I/Mh5zrHjWO2HYWhKMANIjVYIh84C2XxUtx
	WjvYWM4d10rwNcAsijg7q0JKxxXzwWZ306y/a7zsO12oDfDUCnHUPvPoCQdsaPg=
X-Gm-Gg: ASbGncsFZ9yIXEYAvMx0uZk4UX3f3CfCtkVkQVekQTQD6d//sCHWC7PW/6fsePOlXWv
	0qQW8byCVe1iMR6dyWC/HoElIGeo/nlMG0BjeMrkD6IGZqxd2TW30zuyRc0f2RpFn0s7VSgKxMs
	gcRJ6W58xkqlsy2I2QbLT+RMfCyzU3GwUmnZZgmtALtD/L+A+N3XrSfYd/KkYZazeraEPLdUy6P
	tF4kA46cFdosq04WIQ0PHRvdcbzqo1tIk1tnu+/CLeDEzX4DpWg5RNDzq2Kk83eV6hmfQVneUGV
	QCG1oxrMZRt8ueD3VWEXy/Tox4050rc=
X-Google-Smtp-Source: AGHT+IHSR/Xqw+zKVilPbS18SxVhML7NXuysuSNJyvDEen1lNQEfTHRrM46D8RL3KMyIttSdLTLqLA==
X-Received: by 2002:a05:6512:e8c:b0:53a:1a81:f006 with SMTP id 2adb3069b0e04-5422953fedcmr15859594e87.31.1735822075431;
        Thu, 02 Jan 2025 04:47:55 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238217f9sm3817314e87.211.2025.01.02.04.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 04:47:54 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v6.13-rc6
Date: Thu,  2 Jan 2025 13:47:53 +0100
Message-ID: <20250102124753.50440-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_044757_787037_C41596F7 
X-CRM114-Status: GOOD (  10.42  )
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

Here's a PR with a couple of pmdomain fixes intended for v6.13-rc6. Details
about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.13-rc2

for you to fetch changes up to f64f610ec6ab59dd0391b03842cea3a4cd8ee34f:

  pmdomain: core: add dummy release function to genpd device (2024-12-19 15:47:02 +0100)

----------------------------------------------------------------
pmdomain core:
 - Silence warning by adding a dummy release function

pmdomain providers:
 - imx: Fix an OF node reference leak in imx_gpcv2_probe()

----------------------------------------------------------------
Joe Hattori (1):
      pmdomain: imx: gpcv2: fix an OF node reference leak in imx_gpcv2_probe()

Lucas Stach (1):
      pmdomain: core: add dummy release function to genpd device

 drivers/pmdomain/core.c      | 6 ++++++
 drivers/pmdomain/imx/gpcv2.c | 4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

