Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F487C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 23:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FYFuZAXLZfyhQ6Ofp04NHjTY3u72Upe1i27dNGQ4bgY=; b=ixDcwCBI9hkWUCp0vJAZ7pyLVH
	hxUcZ90ZhMdWO2YsN5uHOLgJb5sn3LgTva7Vi3a+lh/Ev2OEm6h0y5NVdroBFRafUwAGJayu2pnql
	OyV5RhPVw0eDKmQEOgjv2Z9ShsnohAOQQxGj0SB/dO709xqy49xl3rEa6umI+X4EOVhZs9mZbF8qf
	tWg5NkTqnubEKTs8+BY4UmFlhjLPA93UjjAJtWOcja1f3zUFV/761kpmSe8LfN6+EjlljuED1VV1J
	MlucB44QTxnjMYDlThS+x5n5c+5MqIZC1xsIGYHQfNviDu5w6jstAYpcNCh8eSPm7ePyUcNXXc5ke
	B5MSBgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tufye-00000007JfO-14r9;
	Tue, 18 Mar 2025 23:04:04 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tufvV-00000007J3e-1Wz8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 23:00:51 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22403cbb47fso117390145ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 16:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742338848; x=1742943648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FYFuZAXLZfyhQ6Ofp04NHjTY3u72Upe1i27dNGQ4bgY=;
        b=FifQtcWSCJafSdJyH7hwdYSwG0KcgxX3KapTqNlqj8+GAyiwK/8p5NfwNTeB2kXv/5
         Hfs47s83iZa0A/mifjCyodfXEC2TL8AkRxoAO7plgJvc7fOL9kVbMEnYLI8R/zRECvnt
         NTh71AB7LkXNcYztFNZ0Uu7BtQ8u2wxL/sSIAJTxIhhQdwPRt833Zx6Bp6JBgoaFRC+a
         UcpMhAG6+WVbSA0AiJ7azy2rXjEp0Amtje2nT93jbtkDgx/R9Z9QBj7BVMtIf5c/e1y5
         BnHnkR3XLJRt7aQsfryF/s9M0ucyOuLwmW4pamE+ahkVME4d4bLHplydzd1ygoPFZ07O
         E5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742338848; x=1742943648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYFuZAXLZfyhQ6Ofp04NHjTY3u72Upe1i27dNGQ4bgY=;
        b=JMPyMV0cjd4nkkQeWPbAgRtL6xQx4N8PyTpP+Axifiwq+qOTieJpNKpTcmRSyPrwnP
         GbL0zTRXmHofkXmAb3Kjf/n2MyyGDimBo7AoQWUQWf23keEPyf7hNonWC5s53MDuqMVf
         1uTDIP3QQrw9vlOchXKZZiRbvIwQeeFkCj+EJjGP00f/U8dGqsJo0uvI3pAW5PoW673H
         gzTwNxRWvz0CjO2+/V2+jPDXke6PfHSXPvoJVnwPGt4dZvWbb/8U7hZk1Qv1VPA9guCm
         b7TLRgToZ5twaRQwAoJoeXl0aZa1z89nat+zjUsBoppBD3WmZ920HtfdN9O6bhqnTNpx
         G6MQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9lxwchxK+5RN1G+xqTdMRlZK0dFukn8eaqRVE7iRu9XikTNBqQip0CoeZb2xKQTSEQuy4ZUbYQuow5Bn/nxEE@lists.infradead.org
X-Gm-Message-State: AOJu0YwHIma+zIkvgp2E+X1YSgcWsc9sUtu7FT249P9jcqAsZK6Z/L78
	geL6f8LxCy41HwC74i9MTTnfvxi7GWUeP+lyttI5YLnlmS3wsKvFablEv2kFP2o=
X-Gm-Gg: ASbGncu8vc2uQso7Oro7tz4TP2gpbNGg0/fnyoTjf876HFJxUpoIBOkErI8t3Ofj5K7
	vvKn80fD1iqUP8Qigh7EIxdrgdBN5JTAV93cgw08WJODZuV/x0dzvqggP4cIJTKgf7hL1Y5UqmQ
	NrC/N1Mm5ZGgpHxzUAw74V+gkBhxCloWFyyz+0psi/DDclaaVcU8Br1DpDP6D+U9Tqt+xIziFF/
	C0opxfcj+Tz3E7R5FZxahz2i7GyzqZFXIXprQIQ2NySFEvdfxxq1Vp+4RAlX557Y6ncnz/Indka
	GVs83FLTLv+Zxy9t7aG6cO9yO3RLeciuXfiqs/UDxmbGlsBS/k9sf1Lw6RPi3RshpvEK7lNPBUi
	fYZ9Pop8=
X-Google-Smtp-Source: AGHT+IFTfJJcr07mnjzLqCop80WxhC5Pssj38zY+A8XR2rKWIc2cYcEXx8f4iEqqmQsjWdqm+Dpo5Q==
X-Received: by 2002:a17:902:d2c6:b0:215:acb3:3786 with SMTP id d9443c01a7336-2264993661fmr6691435ad.19.1742338847956;
        Tue, 18 Mar 2025 16:00:47 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6f14sm100739465ad.111.2025.03.18.16.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 16:00:47 -0700 (PDT)
From: Sukrut Bellary <sbellary@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
	Russell King <linux@armlinux.org.uk>,
	Rob Herring <robh@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roger Quadros <rogerq@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Raghavendra Vignesh <vigneshr@ti.com>,
	Bin Liu <b-liu@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 0/4] PM: TI: AM335x: PM STANDBY fixes
Date: Tue, 18 Mar 2025 16:00:38 -0700
Message-Id: <20250318230042.3138542-1-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_160049_405301_FAC0E3F8 
X-CRM114-Status: GOOD (  13.13  )
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

This patch series fixes the Power management issues on TI's am335x soc.

on AM335x, the wakeup doesn't work in the case of STANDBY.

1. Since CM3 PM FW [1](ti-v4.1.y) doesn't enable l4ls clockdomain upon
wakeup, it fails to wakeup the MPU.
To fix this, don't turn off the l4ls clk domain in the STANDBY transition
in MPU.

2. Also Per AM335x TRM [2](section 8.1.4.3 Power mode), in case of STANDBY,
PER domain should be ON. So fix PER power domain handling for 
standby. l4ls is a part of the PER domain.

Since we are not turning off the l4ls clockdomain on STANDBY in MPU,
PER power domain would remain ON. But still, explicitly handle this
to be in sync with the STANDBY requirement.

3. On am335x evm[1], UART0 - (UART1-HW) has a wakeup capability.
Set the wakeup-source property in DT for AM335x.

4. Enable PM configs for AM335x.

[1] https://git.ti.com/cgit/processor-firmware/ti-amx3-cm3-pm-firmware/
[2] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf
[3] https://www.ti.com/tool/TMDXEVM3358

Test log:
https://gist.github.com/sukrutb/bdbfd1220fe8578a9decf87d0bac6796

Sukrut Bellary (4):
  ARM: OMAP2+: Fix l4ls clk domain handling in STANDBY
  pmdomain: ti: Fix STANDBY handling of PER power domain
  ARM: dts: am335x: Set wakeup-source for UART0
  ARM: multi_v7_defconfig: Enable am335x PM configs

 arch/arm/boot/dts/ti/omap/am335x-evm.dts    |  2 +-
 arch/arm/configs/multi_v7_defconfig         |  5 +++++
 arch/arm/mach-omap2/clockdomain.h           |  1 +
 arch/arm/mach-omap2/clockdomains33xx_data.c |  2 +-
 arch/arm/mach-omap2/cm33xx.c                | 14 +++++++++++++-
 drivers/pmdomain/ti/omap_prm.c              |  8 ++++++--
 6 files changed, 27 insertions(+), 5 deletions(-)

-- 
2.34.1


