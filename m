Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11DFC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PmabZA0qSqEuuUpNPi6PV2cpZ3axKCDAeR5lWOl4bmA=; b=RYBagtWAG9VHWf
	E9Fif4BD1MK5nsrLMrt+VZVdNGgXV2b7bQmLw+YDLPIF13trpnjHKOq+1M7SBRfptDx+jWIiCCgJH
	BjrIKrWliMl1Bjv6RiCjnd/ZuZIRoZOQ0xuTTl9qAO5rI0o0SBm4vFkHbsKRhfzmDym0DbH9wiW5l
	o5MkEY9tqjl+4h1RAqA2rfIsrPqxpJh3x7DR0pHbaFNh3WJJXzuor7RsfJBsrCnh5SBO1CI3t/6Om
	fp7dTXjiUfbShaQKKE5g/fWcUEE68SAv5Ug5am6A/oUVsz2CAlr1C+tT6i4qh5YCTVX4jpBSd7RYi
	MGxfJJiKiyaqZAhGJMMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruZ6-00000005RiX-1bEE;
	Thu, 06 Aug 2026 09:39:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruZ4-00000005RhZ-3Dv0
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Aug 2026 09:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=PmabZA0qSqEuuUpNPi6PV2cpZ3axKCDAeR5lWOl4bmA=; b=QilDIST2t8tO1ffBfoIyjWXuLS
	yXQF14/gfZHxHixHJtz755wJu3hm1IOxSbRxK2aCKqXrnutpZB/dA70NPKHiOFNJJ5P0zNTz2NSlu
	4x9pgZmnd7TMBDKSBbR8a3ecOIMmdNZlicFkP96dngi4jLMFz3iuERPm1aRB2AFYqDR3HFiuBxbUo
	9rXwFpaFb1j9JlU3UkNqdGfnqBEJiuZj9rqHVXYOcXldYFsn6XUjwDW4tD5QKNIyLB1LR30GkYw6x
	O7YuyVywO3lHrcISAkqgwsSzWHRAr+A+uugUhj4gxwMOYb3QTErKfo25GRAQ67v/WwwMqUiq0IVbj
	r7QAXsgQ==;
Received: from chaosmail.tech ([77.81.229.115])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wruZ0-0000000BNpz-3xI2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:39:01 +0000
Received: by chaosmail.tech (Postfix) id 4844D1C867A;
	Thu, 06 Aug 2026 09:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786009131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PmabZA0qSqEuuUpNPi6PV2cpZ3axKCDAeR5lWOl4bmA=;
	b=vvDNyI4IescBUAqWIYsXb4ptEZH69DUkqpOVucTPPisNzBPnZ7449xDptmTP6vFox6Nsco
	73SjQfai9mvA+ktJ7nQttf0fD8YAVPbhSxz4mi8s0plzTCEGE7KIqEDgfp9ILXQhL7BHyX
	bQHViUtapD65bl1242DJJUl+AX+MIN8=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v4 0/3] usb: typec: tipd: Add sn201202x (ACE3) support
Date: Thu, 06 Aug 2026 11:37:19 +0200
Message-Id: <20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22PQQ6CMBBFr2K6tqbtUAquvIdxUcpUahQIrY2Gc
 HcLLiSR5c/892ZmJB4Hh54cdyMZMDrvujaFbL8jptHtFamrUyaCiZwpIWlwfU21QaCsZJWViqG
 VJUn9fkDrXovrfPlm/6xuaMIsmBuN86Eb3suyyOfeljdyyqiCNKkh51DoU7qk8w/t7oeApiGzP
 Io1rta4SDiHTJZSVXUOchOHH14wvsbTY7QAEFag0Zk1f/g0TR9oi636NwEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786009131; l=2412;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=87xiSp5NbIVEzBkYBz33rdO65pry6dY8g5pN4fFkCBo=;
 b=IRLlQtfIWvRD1dX1xg3VAeUhxCl+m+kK+l6H/RHtVTncY+TqCBYgYLaDFkvAjceGIRKymQ84k
 VDyDvlkJbtSAUfolTHlgpzFSCOjuN/oYo4JPJ/Foyg9Wo0cZPJt4Kly
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_103859_277465_E577DFC2 
X-CRM114-Status: UNSURE (   9.95  )
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

Add support for sn201202x (a.k.a ACE3), an Apple-specific tps6598x
variant that wraps the tps6598x core register set with a SPMI based
regmap-like protocol, first appearing in Apple M3 devices. This series
first makes the core parts bus-agnostic, and then adds the new SPMI
interface as a custom regmap implementation.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
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
 drivers/usb/typec/tipd/Kconfig                             |  20 +++++++-
 drivers/usb/typec/tipd/Makefile                            |  14 ++++--
 drivers/usb/typec/tipd/core.c                              | 241 ++++++++++++++++++++++------------------------------------------------------------------------
 drivers/usb/typec/tipd/i2c.c                               | 106 ++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/spmi.c                              | 300 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/tps6598x.h                          | 130 +++++++++++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 698 insertions(+), 193 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-tipd-ace3-090bf570ef59

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


