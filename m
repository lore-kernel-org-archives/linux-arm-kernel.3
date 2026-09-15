Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0ABEC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f75fQgzk5PMT2bUGTVE35Rs8Li1ghntLsZOgXFHTcEQ=; b=ggrAVzWWmuLUM+1oJTP6ndqm2F
	ZTaDT8eOHbxxFVgZlqYrDhhytqZVrJORNjcHoqqDytVtpdzu6DSRUCZ0wSDQTxC6i1idf1UVgTox7
	gM5l2o6VB8TZT9L4I1SNQPUbf7pFPZBiGIQcpNsJ3wyRYBkVX3kwwDsgimXa2L0CnVMyGip5ueGo6
	45Z4qs3cFB3lW0AvdK4ASm3ibQwKmXB5kP67ND1PGsbMpIuGwNw7MgtQBkk5K0Hr9I9VmtkxnXzdM
	rCFaghnB/1zyy5gU+11HEBF7q4GU3tMHsT6303RKoEegCnOrwbuymZ4WPkxDCVRH02ZLU+UaQ4IQC
	gw3jGvTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QU8-00000005vhx-126j;
	Tue, 15 Sep 2026 10:33:56 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QU5-00000005vgA-15P7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:33:55 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254fa650c8so21516666b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789468431; x=1790073231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f75fQgzk5PMT2bUGTVE35Rs8Li1ghntLsZOgXFHTcEQ=;
        b=tGiPN4W9XsPcck2lYEA7qPZEAswIPn21Bp/mutlvIRXaFoqCoFqgvr9Yj01NV2ToVB
         pZtAT2mASl/NmWrzd26oNokSU+AXkDl+vQyemZioG3SgNjKLC5CYZUpk/YsVdz7PMGrU
         N5fiGrkLwvm9Oo9fOgacOghHRWz6akVkJ3/wT21NT8uJv/ArkFlM/fmDBrYN4fGwyAD+
         d4vylEtI/Yq+i07CBb5yOq4peVsCf8jP/Ri2/hReig510ZJdkBC1RM7+FMVRsHakw+/P
         +LdwytkqnBGZJIwyF8IUiySRvM/DZ/MfcBdLhTdsIFIjqeLklLqZR0t7FHc5z1SNf3Ri
         sQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468431; x=1790073231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f75fQgzk5PMT2bUGTVE35Rs8Li1ghntLsZOgXFHTcEQ=;
        b=fxM7q/flFeQuGzQZ1Ih235eBluTBlmeylKwHgjRrpapXl1Q6ZL97nForC9d3x1oKrZ
         o6bcD1FWmKC1MVknlzz9Rsgj/wQMe6QSkIcbZHiZQA3q/J50eMkC1JQvAP6TbwyRu1ZS
         r5qvNKyYmeQWPRNPkMgyfp7sP4We8G5U2ocTyIHurOFuwP18So9s/cc9LpVbLHGZwpKu
         Qci+Gx9m4p55BSXnIIgWp+2PgMtSsYJplAMA/xKmGEXENP248sTrVqPx4JSnjqeFRQLv
         lK4lql50GLsFfS5OYsFNli+/BOe5Sop62L8FVAKpCdR+7PH6ZAPIXNAYcQxV/a7B81mi
         BJSw==
X-Forwarded-Encrypted: i=1; AKwUvBz1Nd3Pk313AjEoJZQn0vhU0karp0+1QWh8au3kawqi9BmdLUAm5IKXUgXDGS26e/v6LkwqEFB84alEHID2F++T@lists.infradead.org
X-Gm-Message-State: AFuF++mRC/PX5RdxbHInhfN6zeRKDtNYmXyDHIiGN3lMzxU0eOrxOHW+
	pCxcVWIvxgW+ewzyl5Ve/e+ggx043duLosYoeQ/CgupeFZyi2g0UNRMN
X-Gm-Gg: AYBFou1wEFgpVcW+od5gKB6IXUbCWekO8Zglny9YdQkc7+HB0CLyWlfeVpAcu6kUSqt
	eqEgMcmqeaMwvYvXzQNJnvMrzcCsNvQjNdKmo+c5kU+DHWUyTejp4MkqEGQsPunAir7SCnBtA+e
	Ttb/+dJZsLYK91f5OdthpNY0sp50e9bTbjGUElZrJDXdqTwYEiJ949ZFoinx5bDwfbkMEiNy4yf
	WGnXsLCNB+9u53XhR+E6T2NaUX5KoQy7+FLlwP8pX0B8QX10YBqP+o0o9tVqUhPWCollv+JMhz/
	oeIoZdNbN9HEIhxIChuLP6LQR15HA83IxS3TA0w/TQZbiKnMr6JYL0Juxa4MjcobxqtoXdkUAHj
	yNcV7So9RWlcq1uSik7nHCYTD0dDKhMBzlpvm2CnJv7WMV16hsUcOICAR32WrxapeWQ2fZkt1lh
	DJY0OUea45XL51U0PzX/6eFnhKwUrU6pKcG09407/Dz67mmqT1Tq90ebm2teqSup2oB/m0YgvAK
	PT2FWyEbbTj7ix5W74hOIGDR4FcO6YzB37kr7dwc5sr/fqNuXIJTm8YuiiOVWlFGkx0hXbVOfsG
	4omDfxHRGwgELFRYgN1foe1c+WarnqlBZW4R1NW5j1hX2184fSy4lJY8zR+iRtFKntJOpGiWpQs
	k60vuNyMMoiRtoolEsSy5pRI8kdEIJxhrqQBVTaIOQu9D7OuBYvljEycO46lemBA4jcr0QERjEs
	/2x5Oa3Ye7q1i7w/i1myiAAD315T/iB5Y5O1dQTA4NgwpKuTkyybvzCO0VRAaOvnW5zDdENRfB2
	Nx2gf3Z8cu3k8G3
X-Received: by 2002:a17:907:6d1d:b0:c29:44b0:1428 with SMTP id a640c23a62f3a-c29d79b8aa1mr40465866b.42.1789468430983;
        Tue, 15 Sep 2026 03:33:50 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.oa7bb030819b2a894-tp.internal (219.40.147.34.bc.googleusercontent.com. [34.147.40.219])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e8a1sm566041866b.6.2026.09.15.03.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:33:50 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: imx: add missing pm_runtime_dont_use_autosuspend() calls
Date: Tue, 15 Sep 2026 10:33:43 +0000
Message-ID: <20260915103345.1334-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_033353_317389_DBE93EA2 
X-CRM114-Status: GOOD (  10.41  )
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

Several drivers in the clk subsystem forget to call dont_use_autosuspend()
on teardown or error, causing potential resource leaks. This series adds
the missing calls.

The offending drivers were found using a semantic patch for Coccinelle
I'm working on [1].

[1] https://lore.kernel.org/all/20260915064327.1377-1-joshua.crofts1@gmail.com/

Joshua Crofts (2):
  clk: imx: clk-imx8qxp-lpcg: add missing
    pm_runtime_dont_use_autosuspend()
  clk: imx: scu: add missing pm_runtime_dont_use_autosuspend() call

 drivers/clk/imx/clk-imx8qxp-lpcg.c | 1 +
 drivers/clk/imx/clk-scu.c          | 2 ++
 2 files changed, 3 insertions(+)

-- 
2.47.3


