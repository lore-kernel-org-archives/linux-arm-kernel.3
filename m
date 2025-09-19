Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9755CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 10:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qQQVvpAmXSFXhkPIfMzRXcNKNt7LSya8fPUUSNlSXhk=; b=qv4K4YUh1MlZ/f+fPsEG7xXPM1
	L9oDIqd2q5fR60Irf1SXljZjFD46GxtT1rUDTE5b7erV1Aq+QHZe/xjSIJWNzGRShrdvH1KCVf0MS
	2SCqVXooQ3gRENfHmrlabyQMXDwL1stRQaj3YbVkkXXIFGZqedrTj2zWYJGvi0B5nTrmlovCn60l+
	e0V6jNh4t0vBgDe9d9umNQga1NljfsQKsTF3bicNqxwe4SgLalpKhaBnZziUf9M0SI312E1u3zFqV
	UP1szuj8X98FJDGJEDVDRfLKHCx+mQvD8HB9Ha6Yt4o4/Sn1UGcgv04j+f3/UeQC+nuwRG0m2K6wF
	8PEeiuoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzYM0-00000002ZOT-2c2v;
	Fri, 19 Sep 2025 10:28:36 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzYLy-00000002ZMD-1F7Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 10:28:35 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55f74c6d316so2223468e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 03:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758277712; x=1758882512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qQQVvpAmXSFXhkPIfMzRXcNKNt7LSya8fPUUSNlSXhk=;
        b=SBCRk0S4VI3tEElUe2zvzKJ/w7z3lMB1z7M1rYH8dQya6pzggU0IeR/yQ1cQYFlAVn
         iDkg2IzjzWPxPghLhOjgO3PVoVOsjtrw+nek0ABNk0H0raZ7TveUTCGGTgKceGvw/RdM
         rBSDneM/EMxieUdPQdYcBkNnF4rhsPLkqhrrwonZq7eI8/jJtKHvTC+scmMQQATX87Sp
         sp9XVEvPyRv6Erqkdp7Q+gmE15TEYG8U0KOGFn8R+B3zZvxRAdrPiYV6mcUB/fAOolwJ
         k8vdBpehFHvP5kdxNNEflmpwUSqPSQCKjLcGuPLl92Ln9gvR2Wlec8LeAualxaIKLJrv
         xqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758277712; x=1758882512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQQVvpAmXSFXhkPIfMzRXcNKNt7LSya8fPUUSNlSXhk=;
        b=mRFQJv0W+fcMtOfCz5LcdvTOLOkfmVpE3Y+ESDU8iHJrY3FgiMoMZAcIAkuuL6ujc4
         yh33+Ak5LNes/c5MXTAHqfYCQ4lw4HvGjyOHQlCS7g6/eCuSO/EeJVywzHqOWKCzhJDG
         5pz5qCZgkcSjEveo6xE1Ayi6uSDIEjke2uFzlaHzGlzp5rmHgShkpfrXGclljIGIRcTP
         1Xc58mNseWISRETbDlrhi7gZVP6cBzRHTqR49cselOhadtAPvwL7iXvi2lXQM0TjpLjC
         geC15C9DvekxiehOJni9inWZ7FdEuxXrHTOoHTMpslJvdxi1z6YcVBTsQjB1xturdOK6
         TZfw==
X-Forwarded-Encrypted: i=1; AJvYcCWU9QEBuPtYgA5vdoe2eB4p5vP2yQmT73uepiJqukZXj+zGbhpXyFqdWbSzRKRoatmSRlixNOYWRLhliTJAIdsj@lists.infradead.org
X-Gm-Message-State: AOJu0YwkPPqNQEWKeig7XT1a6ePiAHFQQUqINhPogNvVIzOn6C17odbB
	hB2nBpQnWgO006VcUqufP2Ui9VadPnz/Ric5x15rTShwY2L+UfC6lVD9S+yTEZopvLg=
X-Gm-Gg: ASbGnct0TMfUJCCVkXs45YmVu+BOvAJem1N2kJRIFM6Y7cd0MbQiWXqYxLn1YJ/86H9
	x9B3s7tFT31utNIeMODnAHrwXhSrCskfbbrXDppwf63gTCdHpH1XlF6rnkgVmWJw9VinAEs+AbL
	miv1SQyYKKrVzj1/TPf/xFP/pnXJdVn3wRBkQpVaqhS1RFwFMjjrCXwevCvTB7v34eJlFiBDEsu
	JptyS59c6ObeNCaY6iausR/pBNSWwFCkDJPcEDodCrcagK4sAatmxMz1MOn/C9HjKbqOECFXR0O
	DD6HqoKlr/ToteyAyGeorRVoTlvEWj2McsIyYuJFY/9DJOHmCcjQWwNRuHKDDeBrcrgwUWsTXwI
	Gt1TxO05l/BWU+ipYMdly09WuLqt4PPkYsRKmiN6OlU/g8txhvEPGiNwlE2tK1O01tPRF84Sf
X-Google-Smtp-Source: AGHT+IETmUnQlGUARBZSFBOrd6464VLoS8WXVDGEarMvcetfBwFqWJjqKJS/dx8EIEPRIYxLAxnydg==
X-Received: by 2002:a05:6512:79a:b0:55f:595f:9a3f with SMTP id 2adb3069b0e04-579e1c5f94amr819145e87.15.1758277712193;
        Fri, 19 Sep 2025 03:28:32 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a9950683sm1280054e87.114.2025.09.19.03.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 03:28:31 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v6.17-rc7
Date: Fri, 19 Sep 2025 12:28:29 +0200
Message-ID: <20250919102829.151957-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_032834_364649_0ADC57C7 
X-CRM114-Status: GOOD (  10.00  )
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

Here's a pull-request with a couple of pmdomain fixes intended for v6.17-rc7.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9:

  Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.17-rc2

for you to fetch changes up to 303010f4658cb134eb27cee88026fb5d065a48cd:

  pmdomain: renesas: rmobile-sysc: Don't keep unused PM domains powered-on (2025-09-11 12:36:55 +0200)

----------------------------------------------------------------
pmdomain core:
 - Restore behaviour for disabling unused PM domains and introduce the
GENPD_FLAG_NO_STAY_ON configuration bit

pmdomain providers:
 - renesas: Don't keep unused PM domains powered-on
 - rockchip: Fix regulator dependency with GENPD_FLAG_NO_STAY_ON

----------------------------------------------------------------
Geert Uytterhoeven (1):
      pmdomain: renesas: rcar-sysc: Make rcar_sysc_onecell_np __initdata

Ulf Hansson (5):
      pmdomain: core: Restore behaviour for disabling unused PM domains
      pmdomain: rockchip: Fix regulator dependency with GENPD_FLAG_NO_STAY_ON
      pmdomain: renesas: rcar-sysc: Don't keep unused PM domains powered-on
      pmdomain: renesas: rcar-gen4-sysc: Don't keep unused PM domains powered-on
      pmdomain: renesas: rmobile-sysc: Don't keep unused PM domains powered-on

 drivers/pmdomain/core.c                   | 20 ++++++++++++++------
 drivers/pmdomain/renesas/rcar-gen4-sysc.c |  1 +
 drivers/pmdomain/renesas/rcar-sysc.c      |  3 ++-
 drivers/pmdomain/renesas/rmobile-sysc.c   |  3 ++-
 drivers/pmdomain/rockchip/pm-domains.c    |  2 +-
 include/linux/pm_domain.h                 |  7 +++++++
 6 files changed, 27 insertions(+), 9 deletions(-)

