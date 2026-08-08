Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA60C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 11:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9I3hfFh13SnHymm3/QwpYoavg1WsqgiOOhVpjuX7Z9U=; b=Sq/EEtFv1FWrFV
	ZUy9e9TWPNKj4Csi9NfRTDnYX/4z3/BrK+dtNhtdZZYTq+BoXqvAUEe/8mFEmRslV1OkwpzJYktXc
	g77y+z4D0wsqfxvE9ztiKLTguMRNqXKVfk5/zwLCVuzGV2Zh2bFR1JK9xPYDto2sBW/7rpAHtEcAv
	EGzTMNqLoQqtyHoG3ujkRgD5IbcriQzdIHeT5Sgsm1XQaoJvfAuURx8Xhz7zUnGYUEdgODQ1Iq0Uo
	vY+qmPFwCM7riC2QTWy8WY6Mb264ORtCinJV2cLc8oi97KTDWnEYTtuI84aKr/k91xlBIObsVZtAk
	FN5mLdP+IAMUW8MLY10g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsfH0-00000009Jet-00HF;
	Sat, 08 Aug 2026 11:31:30 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsfGw-00000009Jd6-3Ncl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 11:31:28 +0000
Received: by chaosmail.tech (Postfix) id 69DB61C867A;
	Sat, 08 Aug 2026 11:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786188679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9I3hfFh13SnHymm3/QwpYoavg1WsqgiOOhVpjuX7Z9U=;
	b=Wo4VXIWfi73ciqOJp4d/2hTvkG7cdUGAWn7TrluUGPgcsCbiERGf0OGcNoTtcZY+iRAvf5
	Xnux+BN2vOY3AIKr19VEJ+oq/czv8/x2MUWtjm/+mGcwK/ZI6MCyz3Q2bOKubMT0FJ6RZh
	0kvkkIdCyxW9KUvzEbsMvP5QjmnU32g=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v5 0/6] spmi: apple: Additional commands and interrupt
 support.
Date: Sat, 08 Aug 2026 13:31:16 +0200
Message-Id: <20260808-t603x-spmi-v5-0-553c5ac2f137@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OTQ6CMBAF4KuQrq2ZaSk/rryHcVHaqdSoGIpEY
 7i7BRdCZPmS972ZNwvUegpsl7xZS70PvrnFoDYJM7W+nYh7GzMTIDLIheJdBvLJw/3qeZ5mEiq
 HFWhgEdxbcv45jR2O3xwe1ZlMNy6MjdqHrmlf07Uex97qcI8cOKEWpTNWWFns4y9NuGp/2XZka
 jau92Lui4UX0btUknIIpAq56uXPFyAXXkZvMK8UZLZEjas+nfvl/+nklUZhS53bfz8MwwfTBrW
 tewEAAA==
X-Change-ID: 20260725-t603x-spmi-74630bf1b0a0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786188678; l=1993;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=ARs3vpOAXHVsZcR36U3pm6o9BwuvT+hTsM//07azxkk=;
 b=WwdO8zOFYT2HxaGQV6TiYq88V+2uGZYI7BZDM3PmYmnGhTQ9tftL5PFVAXeeZatAE+WI+z9Ge
 czF6nl7eGG5AFaBkDEBkwi+JO9a9Gn2WZ1Nf5IA+kSnkKRcz6OGoOpt
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_043127_328184_921CF107 
X-CRM114-Status: UNSURE (   8.52  )
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

The SPMI bus has grown additional responsibilities in the M3
generation, making the current driver insufficient. Add M3 comatibles,
support for slave-sent interrupts, FIFO interrupts, power management
commands, parity validation, and fix locking.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v5:
- Style fixes per review
- Fix fifo flush
- Link to v4: https://patch.msgid.link/20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech

Changes in v4:
- Re-do error recovery.
- Fix an address calculation mistake
- Link to v3: https://patch.msgid.link/20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech

Changes in v3:
- Rework interrupt support
- Address review comments
- Link to v2: https://patch.msgid.link/20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech

Changes in v2:
- Change locking to non-interruptible
- Reorder irq ack
- Clarify dt binding
- Some data type cleanups
- Link to v1: https://patch.msgid.link/20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech

---
Alba Mendez (5):
      spmi: apple: Validate FIFO state
      spmi: apple: check transaction status
      spmi: apple: Implement remaining commands
      spmi: apple: lock around FIFOs
      spmi: apple: Add interrupt functionality

Sasha Finkelstein (1):
      dt-bindings: spmi: apple,spmi: Add t603x and t8122

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml |  15 +++++
 drivers/spmi/Kconfig                                   |   3 +-
 drivers/spmi/spmi-apple-controller.c                   | 389 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 3 files changed, 375 insertions(+), 32 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-t603x-spmi-74630bf1b0a0

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


