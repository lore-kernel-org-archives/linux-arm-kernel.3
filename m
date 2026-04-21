Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8922F8FA98
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 15:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Naa1oyRkUNUVOUuBidaVs+/e9mdftRGQ/QJOlDTjJok=; b=FAHgFDAnILX5RE1qUQI5D/Xez2
	WEfxyQnPUjvzSHPB157kv3uuKlfgDlQa+pl5wZBAQS39XDCdFXjmMPEYG63tILvrgo7+45lvRyjLP
	mL4CsUKm1BR0uLCXXdcvx+Oglr/6Io4jHkI60CHjZEiHXCE+E8x9+anqons9MLyXKgdQ3AOX0NFb0
	w/72p4N0SKWwHdoidH2Io+i4G94xox6JYMSP9cPSbNi0G1HRr8/rMiX47c0ZZs17IsUuRTKLjwu+Z
	j26bJV3K4QETZz0lMWI6DOo4KPW7I4ZuVnlhk7naSxWtF/cc8fD4M5zBe0h04njdt7CAgOHHm2FlP
	Jbr4zUVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDQA-00000008rNd-1IPl;
	Tue, 21 Apr 2026 15:53:54 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDQ7-00000008rMF-0SYh;
	Tue, 21 Apr 2026 15:53:53 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-7-16.uibk.ac.at [172.25.7.16])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 63LFrULx2501267
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 21 Apr 2026 17:53:34 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 63LFrULx2501267
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1776786814;
	bh=Naa1oyRkUNUVOUuBidaVs+/e9mdftRGQ/QJOlDTjJok=;
	h=From:To:Cc:Subject:Date;
	b=rC6wgR+n8nQ04Vk1M06RCP83Gq9TpqmcSbqHKmGkUHwZ5DShA49cGzvjbjLWMwroS
	 MGjcs+Zm9tvWUEYjErRHbFrfBzmblSP9Y/iL1z1s7opBkR3RpYEC1ybD+TDNVrgLbd
	 e4A+eBcmCF+EKTDGVIl7+lmXnD+X/xymCwgB7KKY=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <christian.koever-draxl@student.uibk.ac.at>
Subject: [PATCH v3 0/2] Add support for Amediatech X98Q (Amlogic S905W2)
Date: Tue, 21 Apr 2026 17:53:26 +0200
Message-ID: <20260421155328.26359-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_085351_936160_E007EE4E 
X-CRM114-Status: UNSURE (   9.91  )
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

From: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>

Changes in v3:
- Change position of the entry in the amlogic.yaml.
- Change formatting of the Amlogic W150S1 Wi-Fi module comment.
- Fix several formatting issues.

Changes in v2:
- Split dt-bindings and dts changes into separate patches.
- Updated model string to match documented vendor prefix.
- Put vddio_sd states array in a single line.
- Added a comment for the unsupported Amlogic W150S1 Wi-Fi module.

Christian Stefan Kövér-Draxl (2):
  dt-bindings: arm: amlogic: add support for Amediatech X98Q
  arm64: dts: amlogic: add support for X98Q

 .../devicetree/bindings/arm/amlogic.yaml      |   7 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-s4-s905w2-x98q.dts | 249 ++++++++++++++++++
 3 files changed, 257 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts

-- 
2.53.0


