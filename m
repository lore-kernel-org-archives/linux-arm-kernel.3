Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9428606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 19:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NQd6BJ1e;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=syxGUENS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ndUblt3nJlZZl1MwBVzDwhzSLV3QQxoKhFCgCQeYDIA=; b=NQd6BJ1ewiSST/OEGXFTDm/j8i
	HGHP3fEnvDCPCM1w6O6Cml4XFqMia3zOVtkBQ43x7b3DBYhnQqUR1KtsMd2mLlkGIZME5naENB/TA
	Lmv6P+0b5cBASVdVN5KBbUg0gkrqB8VrDnzmwaGh1VPBPNA8z83xZhSm23yhBfZDYbPf/7C9cr6Bh
	iULURAeIZcRvV0yE6fDEsYPRUNlz9Pfpu+N+ZTOiOc2BXqdDmcWc0HqKihfdiarP6v5hxXL9qN67Z
	Dej99QBPXnK+VIO+D+qAazmo3pAe8+jyBGP7ErRqfcQjr2hwx65J2UbNiD1ms+i0vFnvWPB8RQsoe
	nmsc1WLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3nO-00000001L1v-0J2v;
	Sun, 25 Oct 2026 19:22:18 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3nJ-00000001Kwt-3ojb;
	Sun, 25 Oct 2026 19:22:15 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJM3W5516897
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:22:06 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJM3W5516897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956127;
	bh=ndUblt3nJlZZl1MwBVzDwhzSLV3QQxoKhFCgCQeYDIA=;
	h=From:To:Cc:Subject:Date;
	b=syxGUENSBkiwYcHFahGPQ0HhNtrVW2Kly/KX3MoG82QvZEH/zzw9LayEQGmRQfTNS
	 PVHl8jq0Aq3LJ7hXhJTazNQ3z9tX7SD86xnMlQJAkF+Qfi0phYA1EDzeSvRZG2irkx
	 qu5JDU5CeeFNKODtXv7hLHA9hPUKQPtuKDmn1CNs=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, vkoul@kernel.org, mani@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 0/2] phy: amlogic: meson-g12a-usb2: add S4 support
Date: Sun, 25 Oct 2026 20:22:00 +0100
Message-ID: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122214_115175_BDDFC7C2 
X-CRM114-Status: UNSURE (   9.21  )
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

The S4 USB2 PHY is the A1 design with different analog trims and an
extra disconnect threshold; without its PMA update bit the host sees no
root ports. Add a compatible and the S4 settings from the vendor driver.

Tested: both host ports enumerate keyboards, mice, hubs and storage.

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
  dt-bindings: phy: amlogic,g12a-usb2-phy: add S4 compatible
  phy: amlogic: meson-g12a-usb2: add S4 support

 .../bindings/phy/amlogic,g12a-usb2-phy.yaml   |  1 +
 drivers/phy/amlogic/phy-meson-g12a-usb2.c     | 65 ++++++++++++++-----
 2 files changed, 49 insertions(+), 17 deletions(-)


base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0


