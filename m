Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2CCC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 17:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+KVaoc+bz5kdiOIdV934yo3sW+d4Kfk0i0tXAE4l4cI=; b=tmcjQ6li0VctZupjF2pXiVAYvQ
	WfP64TrhyDcsL7GiRqg2bNcg+xOCiHzlTlO3UakQc18sjVFWY7Lctte872V5tMg72Yrds/jXoz0aQ
	CG0Fk6pOaV4xz+HK04g29sp3Dp2NTLdTwqz3cuc8V2VuivK6lZrXsPt8VGv14zFfCZrquzX1QEWB3
	gke1boEjd7lzWSBigrrb6KRBnbCDt9ky+Fdptd292K/B/FoCMw2qduB5KmmwgWWSKr/46g/B7b0Z+
	y8a4/j8bKqmunw6beFiKW5mu91JQ/8SQRtxTFT/ZXR++oJ/9neDVASjvp5F47eTKIGcNrzEUrMkbe
	/wIhIb2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVvqR-00000000WEV-3Zxx;
	Sun, 29 Jun 2025 17:29:35 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVvmV-00000000VZy-1rtU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Jun 2025 17:25:32 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4a774209cf0so16896081cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 10:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751217930; x=1751822730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+KVaoc+bz5kdiOIdV934yo3sW+d4Kfk0i0tXAE4l4cI=;
        b=ZSKI0RI9ezCwfCMkTs+TZF9QDiXeAQlY6H1hhym7+UURhnhN9YpacA0V1No1NEq/VB
         NNTDPIzCf1PSL+jZ4I/ch3jC8VpngCdvLGz4wSK7idUgGPZJHJXCpMA1iaB4c2nE+jes
         m6cS7P+iiRlTdd/sUaNuTFFsZqUQQZ5v1D4DEmYs5z7XT6l7ddypx0TgV6kQlz469KnF
         E7/DgRs5NO1P8LloCUpmHzKa67AM6/Ldcj59Aw3ZWOxNBsTt/tQ9dQnrCs6sF+IHuOaR
         CqIf+zkGbVHt+M4yDfgCT8uHd8xDRP3cRblkzqL/W+egcAo/z+gv34UZjF14btVwQRVO
         E+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751217930; x=1751822730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+KVaoc+bz5kdiOIdV934yo3sW+d4Kfk0i0tXAE4l4cI=;
        b=VlKjyXUON5iYfUrBpAFzYNkfegFasAVuEWyFjFeINoyIzQKOuQw88RXObI2CP3gMop
         6AKBEK5JX6/T61AAJ8dFxfGQsYoWMgwWY1c0XLrmPxD2EXjJdWihGsrQkBzHbwcCWLfO
         mYDfXiBmfDdn/KeY2btmH6hLE9QYJLPdZvhLH5CcJVwNPu8gpNRWa+uKG083XNx2Abkf
         SFLEuXpNbqSJ+poy5Yayff5RY/pV9uZpOHApDwZ+H5gCwzRC6V2gWkMFkVhF6JgXUi9J
         PmSom3vfBTNM5miCT6IzCGH3gEbMuTw/YEjHgp5QXiGJF5RjO0rMpstvzX56XbhZG0Lh
         Amfw==
X-Forwarded-Encrypted: i=1; AJvYcCUinyAnnTk1XbcPrITneujdV50c3VCtlaSVfe4SoFCJYrejnK+il5mhNMmgBpFImLzkYmf26iBNhfHwXdW3b9Bl@lists.infradead.org
X-Gm-Message-State: AOJu0YzH/wvAFgK8/0f2SMtM+aI50AproldgobGP9HKqvIyLRkBNHtmM
	rL5OMTCt+mtDpcVtr5MnG7KRvVzaz3JoN7Od48MCcokHbdHOg2JfREd5
X-Gm-Gg: ASbGnctjiDTfPfQV3wPRvwAv0vsd9X9w1XJkK7Fl6xxjwWKEtvcntTeo3cDvudT3zij
	psOKBxPulzHrUDWAKKbu78/ON9XHPlz8m9Lbr2Z1ifPLLG0RHyS4v+3jhj0CzNRLVmstUp5AZA9
	+NEtSHzvE4CRwYVPiibT2406TkICVgfaPA18c01A7ZOXJ0rn7G2qWIIoH4TZrmwfrm2gf8ob3BE
	JcdKtrttiNrD9EDUqs3L0KAhAILgVPDpPC2Q9Fr2m6++QNW7u4ZvJBOXHxohpSmbHUEZFDvL7pB
	2DEkn08VWq5gXBcqripSETQgJ8yecvDCP0O7zvg6GllFdYS+Hnq/86q8fFu3QLxYRwJV35xiOb7
	GgsI=
X-Google-Smtp-Source: AGHT+IFFmSN+6Z++Qnb0w4wGv3WuFmOt+5FDFNfdU9u77RVcSCRV0E1frKS5TTT/Syii07URDiN3bA==
X-Received: by 2002:a05:622a:5292:b0:4a4:3606:cbec with SMTP id d75a77b69052e-4a7fca98a3fmr150607401cf.8.1751217930043;
        Sun, 29 Jun 2025 10:25:30 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57d7dcsm45549761cf.60.2025.06.29.10.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 10:25:29 -0700 (PDT)
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
Subject: [PATCH v7 0/3] remoteproc: imx_rproc: allow attaching to running core kicked by the bootloader
Date: Sun, 29 Jun 2025 14:25:09 -0300
Message-Id: <20250629172512.14857-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_102531_488615_A6AEFB9D 
X-CRM114-Status: GOOD (  11.94  )
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

v7:
- Added Peng reviewed-by.
v6:
- https://lore.kernel.org/all/20250626215911.5992-1-hiagofranco@gmail.com/
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


