Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D73606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 19:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xpbdT+Ze;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=p6TpQbUE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gPVDVkRJaq4Rb+X6fDN8QSB/oUifhBEsOEHySvrZXRo=; b=xpbdT+ZepCv+k7a2i2i43RsI6/
	/0gCO2m5hiHJDPH85drXg5AWgmdzbNmzMNtaIL9wQ2lD5qoq//S7BdalEzT2xO6voqiXC7UuKWgtp
	1b2W5gcZb/DTKotfUn+Ue1cjlx78Apk1VU3ApWc/zMl5D2GD2Utvcjg3yn4cSra+hu/8wxbQXkliQ
	qe+Z1XJZCTpDeP+g+T7iNg4GFuVGW7Amj/VULdA7qKGVakxb348h9RUQPGfxC3P6Z4j+8uIREdwSd
	aOe77RoN/BextArHaDRVtsffix/MuNXfyDyMaFXactuplv2AE+GpU1nRQEGagm8PiQC9CMsjcVnsS
	0uGYH7hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3mL-00000001KRq-3192;
	Sun, 25 Oct 2026 19:21:13 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3mJ-00000001KQn-0hFB;
	Sun, 25 Oct 2026 19:21:12 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJL1Gt515970
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:21:04 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJL1Gt515970
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956065;
	bh=gPVDVkRJaq4Rb+X6fDN8QSB/oUifhBEsOEHySvrZXRo=;
	h=From:To:Cc:Subject:Date;
	b=p6TpQbUEPz5mfy4/LMfnjk1g0APkK4RYhQxSPjJmbRvDjPTva1D6zOd3wEDKhF9sP
	 JoyL8fmW4LKqXy5PU+ZfhqjhcAqE+d1yn5uOUX7f4oHsSrWEsSNOZscRN2P4vCH/qG
	 ubMmnhuMcaDGvwiedXDXCA+BR5zodwc9mfiO+m5w=
From: christian.koever-draxl@student.uibk.ac.at
To: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 0/2] mmc: meson-gx: make the core clock phase configurable
Date: Sun, 25 Oct 2026 20:20:57 +0100
Message-ID: <20261025192059.208792-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122111_370287_D51A699A 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The core clock phase is fixed at 180 degrees. The SD slot of an S905W2
TV box fails with CRC errors at 50 MHz with that phase and works at 270
degrees, the value the vendor kernel programs. Add an optional DT
property for it and keep 180 degrees as the default.

Tool use (Documentation/process/generated-content.rst):
This work was done with the help of an AI coding assistant, Claude
(Anthropic), used through Claude Code over many sessions. It did a large
part of the hands-on work: it read the vendor kernel and the firmware
interfaces, probed registers on the board, drafted the code and the
changelogs, and ran the builds, checkpatch, dt_binding_check and the
tests on the hardware. I directed the work, reviewed every change and
the final patches, and take responsibility for them. There is no single
prompt to quote; the sessions were of the form "find out why X fails on
this board, fix it, test it on the box".

Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.

Christian Stefan Kövér-Draxl (2):
  dt-bindings: mmc: amlogic,meson-gx-mmc: add amlogic,core-phase-degrees
  mmc: meson-gx: allow the core clock phase to be set from DT

 .../bindings/mmc/amlogic,meson-gx-mmc.yaml      |  9 +++++++++
 drivers/mmc/host/meson-gx-mmc.c                 | 17 +++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)


base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0


