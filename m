Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827EBEC1438
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 13:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H74/YoTLDFTCdfk0PaElicwo3G9NiezT55+TiFByfrU=; b=o31BBChL0PY2dbYKm3ogFnYufd
	EVAESpujgnbeHDUkTNC+kHLx4w39hT+YSbGg0wpCC9L/g1xUfb36GK5k8EdQNF1h2KpTELENXYZhN
	4YzGBQ+IW1RBG+FybGeMa/cWHuf+dHJAXy9ucdAlfAP9tnawGtqmk0WYp1xGsmoxRWr1qBFQ9Q0md
	c6CZBcD+noEn4PifOHYo/bQFSJN7bFj9QorgXjRLyCBE42N9OgT8yFlG+zK1Kjwta7g3luPLvMUa6
	KxFOtCvlA84qkjnt/gtgmH/12aFyCsS0ZA193zVTqb/5E8jtqQEvPEPX3L6sxufrnz6Lk2uoc38Tw
	Q5W7S6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPik-0000000FD98-24LZ;
	Tue, 03 Mar 2026 13:23:30 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPii-0000000FD8D-060m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 13:23:29 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-38706f96202so70190121fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 05:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772544205; x=1773149005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H74/YoTLDFTCdfk0PaElicwo3G9NiezT55+TiFByfrU=;
        b=J2LX/m+6MbIx5VlERF5ae0BpGTLiWkDKaP/iW/NDYq5iboD8JWiFL6InMnjR4D4Wab
         vKcDQENAvGJsgX8cYXg0F3qU6mWiY0PKYWfPTMOQEB6UVOQUsqXR58jY2dmr3td/p+nE
         4KcRyqiIhAt90fzn19yNiciU8kEAatfvoxgqLWztJCytKce/Vj9dgV8nd+m1wq41peis
         z0AeVhP1aMPVxKy2bvQ7gbty2d8h1jLcTK3OxaX145/U0WN2JJdyMl6JkCFOkIAIu7NP
         9K4gVQ+kFcxxWpsrfrmRX7wf2Ap33xf+k0rCpjfwWUYBmFjRSxUB0BWDQx5MuQRrY/pR
         DOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544205; x=1773149005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H74/YoTLDFTCdfk0PaElicwo3G9NiezT55+TiFByfrU=;
        b=n1EvTIlJI7oOPoPCNCFWQr/2r+cE3vYHvYGeOzMshAGKSDo2fkFzvit7y/DRAe7oxG
         TAKqfKvLg3/gn2jwS+xkV+J8G8c/1mYxsTK2/GBxhrDIuAtcxDieCZt/vJBzb2GVLklS
         2WHotUopYGY9RK9Nu2ZM+zX4mu8YhWWca9mCUSmF7vaGRLyorc4eUvbKbGVEQDDlyHTq
         tZ48Qoi1yU2xFOeH3NlRjIxvfaY6HumLPmDf3fULiPY7Sq1i7X0gHIa9BmUtc2L2cZwL
         bZ8S5tt1HY9CGMOSRZgDKSV4VTp0zOic0L6p9VA8S1RDkRkZGh9HeoEFa1p3DcrBolzP
         aX4w==
X-Forwarded-Encrypted: i=1; AJvYcCWPaql5fL9ZB8e6hhFYC7FdnWhUdcxEgEyTpxvci1Bj3U42UU10JsSM2gRCw7Dq9YwKF0EtgXe1q29cDEwUgAZU@lists.infradead.org
X-Gm-Message-State: AOJu0YwmSoXIjaGWeK2EeGFD1S4qNn0Q0M9Gnql6wtn6ZuLaXbWvwhhI
	RO/2OBq0viJaf3eeitVn/rLZ3UViIRX/rCyBceZuM47HvyCk5V14qI9F7KwAEx5JGiA=
X-Gm-Gg: ATEYQzws+sALs1jh8aW2CXOPJFvKS+ARnGsapyNGOfAuuhp9bqmpjOiUKKgZCfBH6yy
	qG0KxQDNc4oeR/CsN1RMnQRLvrZ7q1UZ0+nv8fox+7TUt9WJ27bDZoaWmhFulSFZ6Ke8Hkslv3i
	sNx7grdEXfunYBhKHV4XqqGvCPy6ggmgBJj2x+ZPyBNqcz91zJXP49586ItmyJoSGW5RO3AsXzt
	isJ8SInd73f/kG0WTpE6nNpTLZqKIVxpfIVfPbg1tOl8yDrwFaad8nWdws1RkyUGQMM6OK3JrKQ
	NwPy2Gp5u04PBLEFlT+8Ji9fqMw0DyD7UClVHaJpuMnwNU6em51IxMjn/O9FXeLgziid8CNMqFB
	1heXBAsWJNWoFSctopaaoSn7yIgTm2cIk6MkFyss4d+KUVj0gs7wBbJnxRpSzdVgKcSz5Fvr+hf
	5cJgcIquhxrO0RIrh6sReS2AVRKilqt3P0A2FpPlnEK+y+gLiDTR4TJbUTUmli8lsV9orNyv1b
X-Received: by 2002:a05:651c:2123:b0:382:4d6b:993b with SMTP id 38308e7fff4ca-389ff365a4bmr120386311fa.35.1772544204835;
        Tue, 03 Mar 2026 05:23:24 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1235811e3sm587866e87.29.2026.03.03.05.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:23:24 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pm@vger.kernel.org
Cc: Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] driver core / pmdomain: Add support for fined grained sync_state
Date: Tue,  3 Mar 2026 14:22:46 +0100
Message-ID: <20260303132305.438657-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_052328_103813_3EEFDB8D 
X-CRM114-Status: GOOD (  12.34  )
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

Since the introduction [1] of the common sync_state support for pmdomains
(genpd), we have encountered a lot of various interesting problems. In most
cases the new behaviour of genpd triggered some weird platform specific bugs.

That said, in LPC in Tokyo me and Saravana hosted a session to walk through the
remaining limitations that we have found for genpd's sync state support. In
particular, we discussed the problems we have for the so-called onecell power
domain providers, where a single provider typically provides multiple
independent power domains, all with their own set of consumers.

In these cases, the generic sync_state mechanism with fw_devlink isn't fine
grained enough, as we end up waiting for all consumers for all power domains
before the ->sync_callback gets called for the supplier/provider. In other
words, we may end up keeping unused power domains powered-on, for no good
reasons.

The series intends to fix this problem. Please have a look at the commit
messages for more details.

Please help review and test!

Kind regards
Ulf Hansson

[1]
https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.org/


Ulf Hansson (9):
  driver core: Enable suppliers to implement fine grained sync_state
    support
  driver core: Add dev_set_drv_queue_sync_state()
  pmdomain: core: Move genpd_get_from_provider()
  pmdomain: core: Add initial fine grained sync_state support
  pmdomain: core: Extend fine grained sync_state to more onecell
    providers
  pmdomain: core: Export a common function for ->queue_sync_state()
  pmdomain: renesas: rcar-gen4-sysc: Drop GENPD_FLAG_NO_STAY_ON
  pmdomain: renesas: rcar-sysc: Drop GENPD_FLAG_NO_STAY_ON
  pmdomain: renesas: rmobile-sysc: Drop GENPD_FLAG_NO_STAY_ON

 drivers/base/core.c                       |   7 +-
 drivers/pmdomain/core.c                   | 208 ++++++++++++++++++----
 drivers/pmdomain/renesas/rcar-gen4-sysc.c |   1 -
 drivers/pmdomain/renesas/rcar-sysc.c      |   1 -
 drivers/pmdomain/renesas/rmobile-sysc.c   |   3 +-
 include/linux/device.h                    |  12 ++
 include/linux/device/driver.h             |   7 +
 include/linux/pm_domain.h                 |   3 +
 8 files changed, 200 insertions(+), 42 deletions(-)

-- 
2.43.0


