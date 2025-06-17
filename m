Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2DAC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 19:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ticf1f4PmQmZwFcANzazYxHsrbux47xCzbGTbFHeNUw=; b=hlzHhifrreBKXacX4BTe5zzpvD
	20lt3LFebIWuV5HufTWbEoKl/ZXAIekz59/yQes4KBBaYsgmZkYJ6FKNvhZElSXPQDTjjFvQK4tSV
	oy08uhwgHyYXC4f6oqiR9oagdF9o0QHe4twHmZ7YoAQaO/+ACMSNpUh2MBYWsti1wMGZkUgoZKeeF
	78+yYs5NxmuxLWkS/wANHYOAp+u4jyXe6JM4rk2jA8Nm7u9rzwnVrlQ35rWXDXHXCs069eXjqGKGR
	hCSEaalVhifsd40d99B2KhKNg82dwQWWRi1lN5WDMb6KiVi5N9UmYDcq+jZPvRpeg4CAjcETYjCF+
	Um42Fegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRc8P-00000008GNz-2yAt;
	Tue, 17 Jun 2025 19:38:17 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRc6C-00000008GAj-3zlv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 19:36:02 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-742c3d06de3so7055625b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 12:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750188960; x=1750793760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ticf1f4PmQmZwFcANzazYxHsrbux47xCzbGTbFHeNUw=;
        b=UxSSdDTPeo9VPezWCfXzGCzWxJ69FSmm+d470armuQOErlbEjlP8EKd7Uw6idkVLXS
         AfPNeQBI5Eg8TQd5iAttEtF9ME00IPf1QeoiquXSPx9jiB0b3DB1YrYyPSxMZPQ3LW4T
         PdYezgCNx8/C9U/v+ks2Q4YzHofXj6+Tv2PdfkQTVa+3Xl2/1yaFzfZ16AGkSgm0hMkr
         IgGdvhal26qAMQzDtW7lFgHLm5OsXxISwVb38vqltkY6PEMoClFptrhfPvSPbdtjIx/e
         FjLjUxLJuxAHHydolvwP58Mu1ObczJ2M7URgoIlueSSQvtN3C9A7yY1jCdUWoDOo/hWd
         F3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750188960; x=1750793760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ticf1f4PmQmZwFcANzazYxHsrbux47xCzbGTbFHeNUw=;
        b=m43bVtYhEj9g+vz0Io8kCBcnMHKsgImLildKeJwr7AiHyR+5odu/HfjYr77jddk7MC
         JzRLgoU5/uDMjBZSuuYO9kvE12oxlIYKGm+tw9bjtO1wVX+3N2H7FvEw/u1oHyfJ5k1B
         N3iI+mkLUTCFGTuwSlO09DsupBHvc0r6qlkDLJiI8IMueLuFvNVepwIRXyWmjTtQn3xu
         vU1R7QRXhrz4Fy2LZO73AL2TykcQ50MM13Mh2QhJbofTF1MGDwkKWms1M1twW9xjEwU4
         MeOlfuB4Emg51oPOEdZHOBYzkJ1J0J9kb8GowhcBJSpk16Ut0MKI0pkMuZhNZh1AU30T
         v/bw==
X-Forwarded-Encrypted: i=1; AJvYcCW7LA+TGUfU2YufdPs0hqT1e1An9AelzyHzHLoVLRvjLH+mdo3TonBp9QVNNBn5FG3hIV7vypWPjiM2fFyl9mnG@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy/AJMDgESRJGzyI6dGbLdAUOvnOi89CAWcIqU1NbOaVxRdGpk
	KWzlNODxcfikVix4phH9Q89XYO1dg7J6ntLv6S47StZTbXpdB9kZWbSHOR0Qe2ih
X-Gm-Gg: ASbGncusuR2MUNRO1nggTec5fhRa2c18wtHjKRkvgIckEr9FoS+W4Nw+ohMmr10+BMp
	dHRcgI+a4SPXIgcBHljUh2CBc4T/KhXuzgnRwKVAq0zQa3qoP9zz7EEjf5wVxYwBUvvHPapFe/Z
	FVkp/EAmKPVppsWj1IxnYiw2nuNcJ/nYHEx+wno42BUSagMS99X8udfsdQDl4wSW9Mgdqnnrdi7
	S8bHj8LQs9m4ukfxNLk9fZ89e/4dNJEakjb9aA60LO0DA71OZsrXWAmSF5b8ge6vHp2P4WdKecN
	b5qzBMDcd2okOHIpVXRs5jUCdnJcFMEY9d4cRXMTWrw2iGFKqgIUZy+wq1C8bze+QFEThBYoExT
	gMPxl0HsG
X-Google-Smtp-Source: AGHT+IFusaGvuCb7ZR1Ws5Y5oPYYDpHSdWxbRb5ZmiLNV78bJUEaevAuOwvHQpQaXM6A0+dTKeJfPQ==
X-Received: by 2002:a05:6a00:23ce:b0:748:de24:1ade with SMTP id d2e1a72fcca58-748de241b57mr2814970b3a.7.1750188959655;
        Tue, 17 Jun 2025 12:35:59 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7340sm9648582b3a.179.2025.06.17.12.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 12:35:59 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH v5 0/3] remoteproc: imx_rproc: allow attaching to running core kicked by the bootloader
Date: Tue, 17 Jun 2025 16:34:47 -0300
Message-Id: <20250617193450.183889-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_123600_992465_FF0D3A0F 
X-CRM114-Status: GOOD (  13.34  )
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

From: Hiago De Franco <hiago.franco@toradex.com>

This patch series depends on Ulf's patches that are currently under
review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
Without them, this series is not going to work.

For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
started by the bootloader and the M core and A core are in the same
partition, the driver is not capable to detect the remote core and
report the correct state of it.

This patch series implement a new function, dev_pm_genpd_is_on(), which
returns the power status of a given power domain (M core power domains
IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
already powered on, the driver will attach to it.

Finally, the imx_rproc_clk_enable() function was also changed to make it
return before dev_clk_get() is called, as it currently generates an SCU
fault reset if the remote core is already running and the kernel tries
to enable the clock again. These changes are a follow up from a v1 sent
to imx_rproc [2] and from a reported regression [3].

[1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
[2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
[3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/

v5:
- pm_runtime_get_sync() removed in favor of pm_runtime_resume_and_get(),
  checking the return value of it.
- Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove().
- Fixed missing "()" in dev_pm_genpd_is_on description.
- Updated dev_pm_genpd_is_on() function description to be explicit the
  function reflects the current power status of the device and that this
  might change after the function returns, especially if the genpd is
  shared.

v4:
- https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/

v3:
- https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/

v2:
- https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/

v1:
- https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/

Hiago De Franco (3):
  pmdomain: core: introduce dev_pm_genpd_is_on()
  remoteproc: imx_rproc: skip clock enable when M-core is managed by the
    SCU
  remoteproc: imx_rproc: detect and attach to pre-booted remote cores

 drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
 drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
 include/linux/pm_domain.h      |  6 +++++
 3 files changed, 73 insertions(+), 7 deletions(-)

-- 
2.39.5


