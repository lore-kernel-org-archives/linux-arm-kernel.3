Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A6E606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K1XjjR8R;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=A5AvGCtN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=j0J/AAvRSre91wbOcWbf8T9zQQjZf9mg7zaJjxPd+uw=; b=K1XjjR8R+mblN52/56ida6sgj/
	BaqE2qME/Oo0x4Nr7l69XFp3pgEkz5oJtr9Dkgq6QgvMW3TeDybCJMQOyl/QU2pVq68HzYNSES0GS
	nC70vhUH2Iu9CH3Tmn36v39DLpX5HEa2O3qERV3omDIiR+OmeN9IUSpskwwcIJzc4/91YSNUIlBKu
	cV4Jejl0Ic7V2n5rCwaIYibYd31wgEb33Mc4aJQs2EgGe+eDuSamWUwj6sUvZFmJ/HUy8yAJHTn+R
	U6GCoTFNbxE1epHKRoMQCMDavCmsDCpSHLO5yPPPO8OVPEmSG0w7424YDToZmSmUU7ydO6KltdEZY
	WYcZhNAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH3H-0000000Btyf-2nl5;
	Fri, 06 Nov 2026 10:20:07 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH3E-0000000Btwj-2Rn3;
	Fri, 06 Nov 2026 10:20:06 +0000
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AJteV1864372
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:19:57 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AJteV1864372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960397;
	bh=j0J/AAvRSre91wbOcWbf8T9zQQjZf9mg7zaJjxPd+uw=;
	h=From:To:Cc:Subject:Date;
	b=A5AvGCtNIRiq5wvdg4l0UIl4PwlbF05GOzO6fDewG9F5iq2IPi5T8+Twm7/eznUzD
	 kVJrAZ4hJCIfxOiBIvCbT0qIHwbJqlgLbnzRuvVH9fhVjZrbkLnw9ba4ChpGbi+97L
	 IuG57cyFm/32sqUiH8Cky9zmGnu9619UtCkdx8xk=
From: christian.koever-draxl@student.uibk.ac.at
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        sean@mess.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2 0/2] media: rc: meson-ir: wake the system from the remote
Date: Fri,  6 Nov 2026 11:19:52 +0100
Message-ID: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_022004_950335_44321111 
X-CRM114-Status: GOOD (  11.46  )
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

The suspend callback switches the decoder off, so a remote can never
wake the system from s2idle. With the wakeup-source property, keep the
decoder running and arm its interrupt as a wake source instead.

Suspend to RAM is not affected on S4: there the firmware watches the IR
receiver itself while the SoC is down and wakes the board on the power
key without this series.

Tested on an S905W2 box in s2idle: with the series the remote's power
key wakes it; with wakeup disabled for the receiver it does not.

Changes in v2:
- Commit message and cover: the series is about s2idle; deep suspend is
  woken by the firmware. The v1 test (suspend to RAM) did not exercise
  the change; replaced by an s2idle test with and without it (Martin).
- No code changes.
- Link to v1: https://lore.kernel.org/r/20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at

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
  dt-bindings: media: amlogic,meson6-ir: allow wakeup-source
  media: rc: meson-ir: allow the receiver to wake the system

 .../bindings/media/amlogic,meson6-ir.yaml       |  2 ++
 drivers/media/rc/meson-ir.c                     | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)


base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0


