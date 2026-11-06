Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EB6606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ibNu/EUA;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Dg5FUOzi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=F4kxI2wTIfu/23csmBMbHSFlb5/hs/tMnDMridnsP8g=; b=ibNu/EUAzqXDlUi6ns7zwcbPxZ
	tafCZcB2IpA0E2a1vtW2B8voyD3Tdm6VlnN6WprpQISFUYTx19llSFY2I1i5azEMJwHUf2+Q1nKRx
	94OAHNolhgOjVGQVR7lL8buw0QoS9jJCEQJqk6mogX7SOQ1A2v9GD+uzkj3FxE/XgK+6yl2fKo/Nj
	yntK3rb9AcdsdARnXEf8vqRrvaq9IWhPlFLSWdi05Z0U8jfHCjKDcFwPXxTcC7MsY0pmKGelGHQjW
	SHL76eIzKpX81KgFoMUfGHMo1a3d1bJmFPYoKDUfS+SkzfhK1KiyVe99mzwgp4J7kMCUOVY+v365t
	Ql8/S75Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2K-0000000BtFq-3wsz;
	Fri, 06 Nov 2026 10:19:08 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2H-0000000BtDD-3w5D;
	Fri, 06 Nov 2026 10:19:07 +0000
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AIuWx1863787
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:18:58 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AIuWx1863787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960339;
	bh=F4kxI2wTIfu/23csmBMbHSFlb5/hs/tMnDMridnsP8g=;
	h=From:To:Cc:Subject:Date;
	b=Dg5FUOzil4AS5QZyyF2Ev4vE4NF6Xx0p36U1Lk/oDYXgSAhE2riRKS+CYTUDBfNCh
	 xPaPXp9RbEtggDvq5QL/46wBWB+nPRIHWSL94C+tCjS3ZANIX0KIa2pVXQH/HRV5pH
	 MItaJMffzdxUZ0rpMd7qnt0hu3Q5kkRa6FQdk/Dw=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2 0/2] firmware: meson: sm: make power-off work on S4
Date: Fri,  6 Nov 2026 11:18:52 +0100
Message-ID: <20261106101854.46569-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_021906_312810_2CD6C794 
X-CRM114-Status: GOOD (  14.33  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

On S4 the firmware implements PSCI SYSTEM_OFF as DDR self-refresh, and
the power key then resumes into a kernel that is gone, so the board
hangs until it is unplugged. The vendor kernel sets a firmware shutdown
flag first and takes the secondary CPUs down through PSCI; do the same,
keyed on a new amlogic,meson-s4-sm compatible.

Tested: poweroff followed by the remote's power key cold-boots the box.

Changes in v2:
- Use remove_cpu() instead of freeze_secondary_cpus(), which is not
  available without CONFIG_PM_SLEEP_SMP and not exported (reported by
  the kernel test robot and the Sashiko AI review).
- One power-off prepare handler that does both steps in order, instead
  of two.
- Link to v1: https://lore.kernel.org/r/20261025192144.208954-1-christian.koever-draxl@student.uibk.ac.at

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
  dt-bindings: firmware: amlogic,meson-gxbb-sm: add amlogic,meson-s4-sm
  firmware: meson: sm: make power-off work on S4

 .../firmware/amlogic,meson-gxbb-sm.yaml       |  4 ++-
 drivers/firmware/meson/meson_sm.c             | 31 +++++++++++++++++++
 include/linux/firmware/meson/meson_sm.h       |  1 +
 3 files changed, 35 insertions(+), 1 deletion(-)


base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0


