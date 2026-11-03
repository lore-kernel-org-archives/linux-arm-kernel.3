Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A36606D835
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mc4lMibJ;
	dkim=pass (1024-bit key, unprotected) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=hBEMEyx5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3RVggftuvHwkvIwsFz0fnp4JO9GH5RXRpDd19+3u684=; b=Mc4lMibJD6g/KgRYuwk9TA/q7M
	6YmJgEBW/ONI2GOOESMBV1ozYynz7xBDu87isRZnUyYDTll1fMyWDWwjlE+sxKrHMFFvuIeM8vdnK
	2QEUGebUTl7qs/yvRGeTXDltcIxPFh5YpTUru6LWw23HA/bStLktct2pxaYZWIISMIhkH25jGY7+i
	ZB/z3VgZOgCRfYhXWMh1ZxxRw/M2QlkL8BPev/umD9EJEQbTXpd1MRSE0HoOXeGEIFQE+lSMSb3eh
	bbAy6L41BF+zzaK7TOC9J5H5N8VH9JiciN0k6OPKyQcZzortgIwwvc8lVKSgGawzcXo5AO//MO/mP
	cj21RdcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFNV-00000002hJu-1QCa;
	Tue, 03 Nov 2026 14:20:45 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFNN-00000002hFv-1vMC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 14:20:40 +0000
Received: by chaosmail.tech (Postfix) id 51F7B1C9936;
	Tue, 03 Nov 2026 14:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1793715631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3RVggftuvHwkvIwsFz0fnp4JO9GH5RXRpDd19+3u684=;
	b=hBEMEyx5d72x+n3sjqAsBCDqCkKYHjumFCwi45Nthqq+T9CANW/au396p9wO2OQl4mRh/V
	4sfk7LPtnFa1g++vvaW4C2zErPRSzPCRoaP7yhaeKdIgOZM0CVfWR8gaTIkxhwqLHe4K64
	03ma5itMnE1iEVTmLRdvybFPuiC5YsQ=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v8 0/3] usb: typec: tipd: Add sn201202x (ACE3) support
Date: Tue, 03 Nov 2026 15:20:22 +0100
Message-Id: <20261103-tipd-ace3-v8-0-770f42421753@chaosmail.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/23Py27DIBAF0F+JWJcKGB6mq/5HlQWPoaZq48i4V
 qrI/16cLkJUllfMuTNcScE5YyEvhyuZcc0lT6cahqcDCaM7vSPNsWYimNDMCEWXfI7UBQTKLPN
 JGYZJWVLnzzOmfLl1vR3/cvn2HxiWvWCfGHNZpvnntmzl+1yvd+WUUQP1JYLmMLjXeslUvlz+f
 F4wjGQvX0XLTctF5Rykssr4qEF1Odz5wHjL68foACCSwOBkCl0uW65bLvfj7aCU54pZLrtcNVw
 8bFeVg5ASI/gYIHW5bvnDdl05Wm4TWGfBiS43d245a7mpXAeNHgW3kP7zbdt+AdTkySQzAgAA
X-Change-ID: 20260725-tipd-ace3-090bf570ef59
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Alyssa Milburn <amilburn@zall.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793715630; l=3013;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=IuiEvdU8lEoA4WmSDCVzkUaJ2thmJ2Vk2etNoP34VuQ=;
 b=9va4+cT0aKs/8SFkkzEsdgy+TDgL052UfCETqpRM+8DkAARASZiGbHp/LWyRxoqK7yBRsV2et
 8JRecnfC8rlB7Bi4u809KI07vHxGykMenXelppLp4zHRU86A+16HBHF
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_062037_967759_84BC2112 
X-CRM114-Status: GOOD (  11.24  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for sn201202x (a.k.a ACE3), an Apple-specific tps6598x
variant that wraps the tps6598x core register set with a SPMI based
regmap-like protocol, first appearing in Apple M3 devices. This series
first makes the core parts bus-agnostic, and then adds the new SPMI
interface as a custom regmap implementation.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v8:
- Rebase on latest
- Link to v7: https://patch.msgid.link/20260910-tipd-ace3-v7-0-6c6ebe2193f2@chaosmail.tech

Changes in v7:
- Rebase on usb-testing
- Link to v6: https://patch.msgid.link/20260826-tipd-ace3-v6-0-e919f39a93a2@chaosmail.tech

Changes in v6:
- Fix rebase issues
- Link to v5: https://patch.msgid.link/20260821-tipd-ace3-v5-0-3244ed3bdc3f@chaosmail.tech

Changes in v5:
- Rebase on usb-next
- Link to v4: https://patch.msgid.link/20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech

Changes in v4:
- Unexport variant data
- One more debugfs-safety fix
- Link to v3: https://patch.msgid.link/20260801-tipd-ace3-v3-0-8332f2eca4fc@chaosmail.tech

Changes in v3:
- Restore accidentally deleted static
- Fix building with tracepoints
- Sleep the device on failed probe
- Link to v2: https://patch.msgid.link/20260727-tipd-ace3-v2-0-1345957bd635@chaosmail.tech

Changes in v2:
- Use a -core module instead of building everything twice
- Fix completion handling
- Make regmaps debugfs-safe
- Link to v1: https://patch.msgid.link/20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech

---
Alyssa Milburn (1):
      usb: typec: tipd: Factor out i2c specifics

Sasha Finkelstein (2):
      dt-bindings: usb: tps6598x: Add sn201202x/ACE3
      usb: typec: tipd: Add sn201202x support

 Documentation/devicetree/bindings/usb/apple,sn201202x.yaml |  78 +++++++++++++++++++++++++++++++
 MAINTAINERS                                                |   2 +
 drivers/usb/typec/Makefile                                 |   1 +
 drivers/usb/typec/tipd/Kconfig                             |  20 +++++++-
 drivers/usb/typec/tipd/Makefile                            |  14 ++++--
 drivers/usb/typec/tipd/core.c                              | 247 +++++++++++++++++++++++--------------------------------------------------------------------------
 drivers/usb/typec/tipd/i2c.c                               | 107 ++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/spmi.c                              | 300 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/tps6598x.h                          | 132 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 705 insertions(+), 196 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260725-tipd-ace3-090bf570ef59

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


