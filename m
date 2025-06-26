Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151E0C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 23:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BIo+4tv6e0tJvJwfvRUmdX7OEB2USSJerM3U4tjrK2w=; b=NSJjQN9uaacKDYyCwUGb838sAA
	88MbPuo8miU+I4keAzUKK+KBVs5r+aflFHjBJ54mHOiFyjU1aLU8Oq8AV2LtumIsRjWdBYBB0fYr/
	42yGPwSp5M+tDtPYFTg7OMYqOrzGBffFZ2Bkm6I4aLi1O5aMuw8UbSwsiLUegEsCdOdYy/g/nGFwe
	20sq24PieWMN+8OCgpf//AhReY0SQDq95kQopw9DPo1wlwqXdRd1Z8XpoosF/2qdJhezrlUJEwHO/
	imOH9vy7rw9TQglzmrLDgoenCKL1iDiGmW8swDGyINF2n/nIYPnrScTTi45Bqse8wrqdfOvtxNHef
	3EIdLH7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwLy-0000000D6Hi-1HGY;
	Thu, 26 Jun 2025 23:50:02 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUud3-0000000CtJx-2FPo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 21:59:34 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-23602481460so18352815ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 14:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750975172; x=1751579972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BIo+4tv6e0tJvJwfvRUmdX7OEB2USSJerM3U4tjrK2w=;
        b=MqslTIIOFPi3YHq6D4wgTRP50tCEaKnhJ5YoO1jRTeWti0w8cWXCs6518GLRmCqxiR
         dUhFMxw83nrIY0jbl7MLkVX1pAWUuJ6Iuw+E8hxVow0pPt2EQRkVwgntbbrVXElvfgfI
         IDfS1o5SOszak4IAXTDLYDSSi1c9JIaX/wWDiEXvHC4MjbPk13V2CV8k4fiHGlJz+xQO
         xTZAA0NgoI260BDFCnPuHSkPBT6eIDcoTVr+86FJfiJEmJN3+huGhhOCfxfQ0wwBEwC6
         No+ylUXxOl7qnPdISBbH8ZsLdNDmS+/iKixb/Tb465QrgGE/T1fXhL5hY+TKTfdtkFq6
         MLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750975172; x=1751579972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BIo+4tv6e0tJvJwfvRUmdX7OEB2USSJerM3U4tjrK2w=;
        b=u+L7EUQXr0/3U5+XjIHdnvzQIqzh2IzTn2wc4YQiqIYWBn0E6so5N7sFqGQB7JtgBy
         0cVYcASPP52kpODoMbmQHq3Lx3wINmlcad9KLBNWPucn1zklYYqQuWubRZcKwH1SCYlA
         S6fdI8Rd2r4bCLsop6xr+0GBgrFRkob3Bte51raLIxBYTZ/6t8MfAyqWXrZsep8x691F
         yrIXobtgV5IKX3wHQdHx6VD9T9LdOFQbXlr0L04xv/R4iljPniaINmUvEwJHOh0DSdIT
         f08ijXAP4efhHBzMI6+QSUs/ozEvzSgNskfRqzDkKHhHUUgqiMOyZWvRDyd0w8VSya33
         2KsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVigwzIpQsvCB6q9AlAskVQ5xaJ2CEl55SsnLiVtkeoErHf4DQUJ37bjLTo2rle9qsEKSKVXg5KRPlLeXhL4PBM@lists.infradead.org
X-Gm-Message-State: AOJu0YylfuuKaJiJvSfSlvZ8MadCe454zrICWi8TP6Tck9C0oTDi76Uc
	8vNsWcQTJhbblzv7PBuvrjTPTfGzRmDHhgbQrIlWE/8BtuHZwzlQGMRa
X-Gm-Gg: ASbGncvSS8Pr1aTZfSKUVx9rEpXcf3Np3KBicvwE7D+ZST7TdDup+u+6BgwoJTNA0bm
	kT/pHTNl1lrdHB9FkFVSYuHC55R8x34zLrPkQhZAfmCkv63KT66j83MgDMVVEClcDLu4L9bUcLd
	l/sFnGWPZqKBtMKmdzl/yIjabBWjlORhxmEPf8Q1hQij3R1JDgVDf6YwskAOIogEF10Z48X1VXG
	t+J54zjuPdLCviPFO5xbOwMgC3r5WbUReCFX8bz2FZ4QKHzPuG4O6wkD0e+iXD5SRlThOVNSkMf
	C9ws/04IxBxPXKIxBML7Pr7Nf+WUKTEpIGjQxqTzU7q1BxQjFYR4P72htINPlIemYxf5vTXwEk1
	rh8E=
X-Google-Smtp-Source: AGHT+IEWjshLgh07UmKjVXlymS2HdOEmftHmlKGMeQUGGSx7ixamCKXotE/1Lb9O5SdhP8Ay5EI28A==
X-Received: by 2002:a17:902:ce85:b0:234:1163:ff99 with SMTP id d9443c01a7336-23ac4609a61mr14225035ad.43.1750975172151;
        Thu, 26 Jun 2025 14:59:32 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b8b9sm585275ad.118.2025.06.26.14.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:59:31 -0700 (PDT)
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
Subject: [PATCH v6 0/3] remoteproc: imx_rproc: allow attaching to running core kicked by the bootloader 
Date: Thu, 26 Jun 2025 18:59:08 -0300
Message-Id: <20250626215911.5992-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_145933_576885_CC30F679 
X-CRM114-Status: GOOD (  12.42  )
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

v6:
- Added "reviewed by" from Ulf and Bjorn.
- Fixed and improved commit descriptions of patches 2 and 3.
- Improved the comment inside imx_rproc.c file.
v5:
- https://lore.kernel.org/all/20250617193450.183889-1-hiagofranco@gmail.com/
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


