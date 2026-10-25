Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90C4606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 19:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZXnIEeNR;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Cz0g25L3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NIeDseMKJyVvL1fXcLlTOdRUV/IjUHUNJ1TexeATk08=; b=ZXnIEeNRrgxZf5CXzL8x6EyEbn
	tFxL7D1F0L5vZ5LLPBIdkeeqnMQ2r6PA97suWM9Rf5tv4YC3TruQAAnLrOY8eqcZ5xDrErxy94Xfo
	4XucX8BjFjc9HXkh0fPjOItDbG4X/xxR/XZv0amUlz9EptXlgG8C7lk3MUa6JhLsYY/O+r6cOujNQ
	VhJ/hfvBxuK+x9He0vjkpUWlPYsKFVvmDLYuCSJP1VjgJI68rHe3LyaiOvhAazrV6hyj6cqHqgUqZ
	enHrWcJy0GVSE+duqRYkf20rf6bmoNvXVzgrBDj7e5EttQC0dHu4hHibdiclfuWx1Ti857fmZuQ63
	WaSKWNOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pL-00000001Mbx-3CBA;
	Sun, 25 Oct 2026 19:24:19 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pI-00000001MaW-3SoA;
	Sun, 25 Oct 2026 19:24:18 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJO5IZ518377
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:24:08 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJO5IZ518377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956249;
	bh=NIeDseMKJyVvL1fXcLlTOdRUV/IjUHUNJ1TexeATk08=;
	h=From:To:Cc:Subject:Date;
	b=Cz0g25L3Bzc7vojTcEyY2ynxGoIbDGhVVyEJwDU00nuhDHd2a0lm5kRQ8zeWqcj1/
	 9HB5zzC0Aa1QGvcPELskx3gsDN+qRhe0pfARUdwClVWyD/av5sfZ+PQc6GdIGWjfTL
	 99keGbUuvEZO4m5SS3UX1OjabmrDHUgMBwbJVKDI=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v7 0/7] Add support for S4 audio
Date: Sun, 25 Oct 2026 20:23:57 +0100
Message-ID: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122417_192922_60966F13 
X-CRM114-Status: GOOD (  11.15  )
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

This picks up Jiebing Chen's "[PATCH v6 0/4] Add support for S4 audio"
(and the tohdmitx S4 patch) unchanged apart from rebasing, with
Jiebing's authorship kept, and adds one fix on top:

 6: g12a-toacodec: fix the S4 source mux read-back. The S4 DAT_SEL
    field moved, so the mux always read back as input A and DAPM never
    powered the selected path.

[ckoever: Jiebing, if you have a newer version or prefer to post this
yourself, I am happy to rebase the fix onto that instead.]

Tested: HDMI audio up to 192 kHz; the TDM-C to internal codec path
plays without errors at 44.1 to 192 kHz (not listened to).

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

Christian Stefan Kövér-Draxl (1):
  ASoC: meson: g12a-toacodec: fix the S4 source mux read-back

Jiebing Chen (6):
  dt-bindings: clock: meson: Add audio power domain for S4 soc
  dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
  ASoC: meson: g12a-toacodec: Add S4 tocodec driver
  clk: meson: axg_audio: add S4 support
  ASoC: dt-bindings: amlogic,g12a-tohdmitx: add S4 compatible
  ASoC: meson: g12a-tohdmitx: add S4 support

 .../clock/amlogic,axg-audio-clkc.yaml         |  18 +-
 .../bindings/sound/amlogic,g12a-toacodec.yaml |   1 +
 .../bindings/sound/amlogic,g12a-tohdmitx.yaml |   1 +
 drivers/clk/meson/axg-audio.c                 | 165 ++++++++++++++++++
 sound/soc/meson/g12a-toacodec.c               |  51 ++++++
 sound/soc/meson/g12a-tohdmitx.c               |  80 ++++++++-
 6 files changed, 312 insertions(+), 4 deletions(-)


base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0


