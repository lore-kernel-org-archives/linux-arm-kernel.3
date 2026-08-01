Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE46C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hwPIDXkHOLX2pofkwEoqOv94i7apCAfdrwYcx+PPWXo=; b=4Tw1OVC5r+QjYt
	vdfpaOne07qQgVoMizXLlCaKg4C4EFqmTeljF+nBI0bfFsAmibNIuATehaJtqpb8KQj4HrTe7BVUW
	yPCd6DFdPoBRlqbDBY5DID3xxdoowlOKIztxfXcuwkLhFmDFT0VuUtmX0tlzmXXJI898hCZGVNJRz
	758gz88jm1++UuM0F40hkYEG8qvrzNyi+ESgDCnt9cQEtBlYO0754VBT3FI3ybU0l+P7ioL13VLUs
	CgmGCNI6JQZlwkq8+AG/1FoWmoDxE+6vhipQZkc6QdpjdFQJ9UV6TspX+Fwe8h7B/OE+rwVroh5c3
	bvURAUXOW0bCzJCzpHXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHII-0000000F7HN-26To;
	Sat, 01 Aug 2026 21:30:58 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHIE-0000000F7Fe-1uRB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:30:56 +0000
Received: by chaosmail.tech (Postfix) id 07BBB1C87FF;
	Sat, 01 Aug 2026 21:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785619845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hwPIDXkHOLX2pofkwEoqOv94i7apCAfdrwYcx+PPWXo=;
	b=hpY3Ti2kFDmdXWOiUJdvoAwGQA/Q80DVPeV55NDmAD32OpQ1/MdJSHVAZJnzdaMqv7Hs/q
	b4PDTnvZ1Oaub4mJbr+JlZXNbFc3MKRqcyjCtsArQ6jsJhk2QKhWiIBEUAoRp97f97yCmP
	U0Ql+desJQD6pJ2fO3k38f3CbOsa9PU=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v3 0/3] usb: typec: tipd: Add sn201202x (ACE3) support
Date: Sat, 01 Aug 2026 23:30:09 +0200
Message-Id: <20260801-tipd-ace3-v3-0-8332f2eca4fc@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw7CIBBFf8WwFsNDinXlfxgXFKZ2jLYNINE0/
 Xehbpro8ubec2YmEsAjBHLcTMRDwoBDn4PcbojtTH8Fii5nIpiomBaKRhwdNRYkZTVrWqUZtKo
 meT96aPG1uM6Xbw7P5gY2FkFZdBji4N/LscTL7p83ccqolrlxsuLyYE75kyE8DN53EWxHijyJN
 a7XuMg4l3tVK924SqoffJ7nD+D59YT4AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785619844; l=2244;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=MUzHrXbd8n2NCD9Eadg2uDAMQrUrE7yS0G6eYeDPv0g=;
 b=4rMMRI6uvsP8G5nm7hRToUMIg43AAPOr9CMuHWJhUpabTvpG2bg6Pl8Gf3qt43Qh1FBCy4kiy
 /lfancP4YViCftm0RwjT9Kegbyk/5Jyj6xyZ9gJHN2uGM67T6OfMn9g
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_143054_972162_A26360D0 
X-CRM114-Status: UNSURE (   9.98  )
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
 drivers/usb/typec/tipd/core.c                              | 241 +++++++++++++++++++++--------------------------------------------------------------------------
 drivers/usb/typec/tipd/i2c.c                               | 104 +++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/spmi.c                              | 297 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/tps6598x.h                          | 124 +++++++++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 685 insertions(+), 195 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-tipd-ace3-090bf570ef59

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


