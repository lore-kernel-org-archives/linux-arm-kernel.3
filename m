Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80CDEE2084
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 11:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a8YgULvPUysHanJexoM4PJO6EAhVNc01J/9HL0jGN3c=; b=3EXbN3n2W8yKYMXauLEHkcixKI
	5jX/s1j23Hh83pxiR72cgJQVfEzytiJ/UjuDdaL7KRaTtqHW4o0RVnet2kBxzMhqkpjIN9pwvMyYG
	g8/rqolIr/pYW6pD4qJsii5gWEzYOoKLR8UP0t4hCDVg9xOm79T4AjQ70nQJ9N0t9uAS92Zefp2l6
	eJUYdUfu7xvX+qr6veMZQ+6ph8hysz/KbRnppIck6ZFe+gjWDP4/PVkL7ADVOB1GF0YyKMKTRtuxw
	938j29+zc+kBs0QTtAerIDHFq1zBr3SPdsSRoD48KTojV/Pe7Xaky0AgsHl6S0Ij3xkcdLKghoCOC
	Lp6IiCRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJf0-0000000BDbN-2nMZ;
	Fri, 06 Feb 2026 11:06:02 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJew-0000000BDah-2L4w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 11:06:01 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-59de38466c2so681847e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 03:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770375956; x=1770980756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a8YgULvPUysHanJexoM4PJO6EAhVNc01J/9HL0jGN3c=;
        b=C4gHu9L84bbSSuOPHuMyXQVXU8a09n67eDcs4+abB1y5z3+yBMSBFCjfaCtBg/ODUD
         HS5cXjDcffrf0C3ZidwKH+S//8tgBMMN2et4dJ3HZQPpziei8GK0v06bIGNytaST4bdu
         9eqHYYnegYSFMPHnxiNkLTWWnj9biyKAy0QgzFWDVdzQWXfLzVWOi63cUkfXyHFUTqgD
         z/2Ep8X11jV0MddcnLXh3KTQnJbzIYXcISu+PQByt9JHxIC777QGPBpDMY6uNVvP8XsP
         vRn2JQBamMuhik2HrvPGY7DPuO4eYEzOLUmS7NnmWjiqleGb8I3lfs6cHoP0zUuzHWZj
         oNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770375956; x=1770980756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8YgULvPUysHanJexoM4PJO6EAhVNc01J/9HL0jGN3c=;
        b=NWDRZxJ750Ip5rNdEGMDpj9/tAQgnh8OMYllCjZ50Zf76TztFQ3QT3hFjODjCG0Me5
         teWafINgqdWPVXqLUvyMO1wNELtczxv0tPsWpFoGtKmUcw1bKxEUq9xC3wcNI1HAbjw8
         SLSdoMOHHzo6zLlDChwHnIK5b339U/3I9OR3BEJ+suXMH+NwwjnHNz5ijkUTyeZyW2+X
         /7lesSTRlwNP97v2eqrYN5ygN9ftyVqtjV+7PQFYvCQdWVeRHwQSXhG5SH1aLFElhKtE
         uUBN7HfrWXoCQCVrQH2eB3eL5aBZUGKTC9ulLzCD3U+TBxV2CEloCl72v4rlRP3Oon5Q
         0+9g==
X-Forwarded-Encrypted: i=1; AJvYcCXFOo2FTON7UWlA/M2y1sym3Gbi3dMdbz37dMZ3Ze9tWoCgPOLVQQmd0Dq0s3gZzSQRoUo4tNeT+NOmlaIB5uqU@lists.infradead.org
X-Gm-Message-State: AOJu0YwxvIOzNTdZImopV0DIxuvbddJplvsUCHl4YDQ1FwfRUrG6tzvp
	eRNLkEXXAotew6NvDlOFbvkzaQq6b/nhOjSDFs87ibwpHs+3wJlPWddENgCJr/DRiO8=
X-Gm-Gg: AZuq6aJ9VLiSnDN2SlXTQQxGrX2oHxrk0vdNLgSNIsFZ5grX9JmH8QfOmjfYawg3UWU
	fKeoGV4nhMgTDHuR3V+btXSyqpdnvbY+v/s/8SF0vZfswxKPZJfR4OG+mxbYxrmF4kHIeUeJJF1
	DE66Dcwf0CXxMEm/S26OMvfj4xyuICf7kqqbrHxEdEc5jnuMyKobuB/1i6IGbmWw+vCiURb+u/l
	t29+XzyLlw7x+t54IxnfVs3M3uYe05f9MwS01E3MeHJTOVlzyogkKsM9ZJ7F77+5sSljb2+C9Y4
	qYEuX3bBQy9N6LHxdT13+U0zdbBPB8EmTKaC0+fFjrjDWBaadGJTruXKu9f/2aNcIWGqNAZjama
	0bHtxQj87SOmM1rvKf0BOkfs/kjueQeOCCXEIQxw+D9XaQLezNOQLphPcf+DuPKStubRnggzM+z
	hlPUsqrjtk3wS3VtAvpBpchbKsDAbmYl+PQZygKPz9tZ2Aj8he1JTPNOOYY+7t
X-Received: by 2002:a05:6512:ba7:b0:59d:fac0:3a14 with SMTP id 2adb3069b0e04-59e45169082mr649867e87.28.1770375956334;
        Fri, 06 Feb 2026 03:05:56 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cff6a5sm510395e87.34.2026.02.06.03.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:05:55 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v6.19-rc9
Date: Fri,  6 Feb 2026 12:05:55 +0100
Message-ID: <20260206110555.539300-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_030600_558314_A878F517 
X-CRM114-Status: UNSURE (   9.64  )
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

Here's a pull-request with a couple of pmdomain fixes intended for v6.19-rc9.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 861d21c43c98478eef70e68e31d4ff86400c6ef7:

  pmdomain:rockchip: Fix init genpd as GENPD_STATE_ON before regulator ready (2026-01-15 13:39:16 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.19-rc3-3

for you to fetch changes up to e2c4c5b2bbd4f688a0f9f6da26cdf6d723c53478:

  pmdomain: imx8mp-blk-ctrl: Keep usb phy power domain on for system wakeup (2026-02-05 11:33:30 +0100)

----------------------------------------------------------------
pmdomain providers:
 - imx: Fix system wakeup support for imx8mp power domains
 - imx: Fix potential out-of-range access for imx8m power domains
 - imx: Fix the imx8mm gpu hang
 - qcom: Fix off-by-one error for highest state in rpmpd

----------------------------------------------------------------
Gabor Juhos (1):
      pmdomain: qcom: rpmpd: fix off-by-one error in clamping to the highest state

Jacky Bai (1):
      pmdomain: imx: gpcv2: Fix the imx8mm gpu hang due to wrong adb400 reset

Xu Yang (3):
      pmdomain: imx8m-blk-ctrl: fix out-of-range access of bc->domains
      pmdomain: imx8mp-blk-ctrl: Keep gpc power domain on for system wakeup
      pmdomain: imx8mp-blk-ctrl: Keep usb phy power domain on for system wakeup

 drivers/pmdomain/imx/gpcv2.c           |  8 ++------
 drivers/pmdomain/imx/imx8m-blk-ctrl.c  |  2 +-
 drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 30 ++++++++++++++++++++++++++++++
 drivers/pmdomain/qcom/rpmpd.c          |  2 +-
 4 files changed, 34 insertions(+), 8 deletions(-)

