Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E19C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 06:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=elnn7JUGC5l+jKw9U2Iosas8+d3MHu6QPBJwE1B2V50=; b=MljtnlnAWBppsEhA+CnUikQ0la
	iNmeKsVQYle0PL5vNMas7t8hm5D4OytgrcntAvYuydSNJYnI+DVGbppFE1GpThRyyK5WX4t04bNbS
	xldhF6GGXDbM2cEkWcBl6ZIk9H6U/Opxpl4kn7t40FZKYuK3zr/O8cwdROA3mhC08pxebHz1UWwum
	ZT4ueTJxfb5Um9Bq3RQnJGUqJY5LZc3HP4x2HNyG4XTjqsLhPOs4dSfr9pzbMYTdVhNWfOk4WQrxS
	u5Ni9laXg8HB7pqSOp4yaW/3SY+d5QUpyMuZ/DMw+2KEgattQJuLVgQ4/6apqrDtsrE+FZ9v/Cg0/
	WvUJQm6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5oF-0000000DniI-3Fti;
	Mon, 29 Jun 2026 06:49:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5oE-0000000DnhH-2KXp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 06:49:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EFEAF43B03;
	Mon, 29 Jun 2026 06:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C72D9C19425;
	Mon, 29 Jun 2026 06:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782715773;
	bh=uq6YWgDsWWGXAC45T6w2Ey4osYNKqHhIwFzNycMRum0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=KJtjbnW1/mqKsn403xVrjfNllzjp/b4KZ0ab99n/OwnpfS7xL3m8NLEypUizpITYe
	 d5Wi+eSF/E1L/X+8EQbNUuowHU25QdOzrPVfJzDbJqqHnayE8RQNg+NiVOaqQEXgw5
	 lqKG1rKaujmOxgeuKulxFFzpZGa3p3f2mo0ccQOKOkAchx9t0XTWDznUQJ7V+HJiK6
	 OKezfWYasXnMr/I2JULjMY8T2erEpk4m/csazqMENxhBparDm86LY/5qE1kxT8562/
	 zixx8yNtgdmcMfdurTGAzi22dMS6nKcnRTBDug9zQtOzBbq+x/nm3THQqHpYGOlT5y
	 agRvKEsmdvGAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD8FC43327;
	Mon, 29 Jun 2026 06:49:33 +0000 (UTC)
From: Yu-Che Hsieh via B4 Relay <devnull+yc_hsieh.aspeedtech.com@kernel.org>
Subject: [PATCH 0/4] ipmi: bt-bmc: Add configurable LPC host interface
Date: Mon, 29 Jun 2026 14:48:57 +0800
Message-Id: <20260629-aspeed-bt-bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFkVQmoC/x3MQQqAIBBA0avErBswsYKuEi3UxhooC60IpLtnL
 R98foJIgSlCVyQIdHHkzWdUZQF21n4i5DEbpJCNaGSNOu5EI5oDzWpxPZeDv9DTgkYpXQnnlGg
 t5MEeyPH9z/vheV7fNbWobAAAAA==
X-Change-ID: 20260625-aspeed-bt-bmc-multichannel-b44a10ff407c
To: Corey Minyard <corey@minyard.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782715772; l=1578;
 i=yc_hsieh@aspeedtech.com; s=20260629; h=from:subject:message-id;
 bh=uq6YWgDsWWGXAC45T6w2Ey4osYNKqHhIwFzNycMRum0=;
 b=z0YtNlAtfb9bWuZnl+4DCd9uwBOGfUQn+aP+5ndB2O/l5fbsR+oL9XsClEErI4e3dyIgUSw3j
 dcqDi7YaxAXAgEuiRYiZKpRdhR3OWwyOGVjBozc1R3XAZPoZjC4B4Wp
X-Developer-Key: i=yc_hsieh@aspeedtech.com; a=ed25519;
 pk=kLxUeF7g6teciq79it9N3tYNgp3yCspZ+AHlYSnZ0gs=
X-Endpoint-Received: by B4 Relay for yc_hsieh@aspeedtech.com/20260629 with
 auth_id=844
X-Original-From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
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
Reply-To: yc_hsieh@aspeedtech.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Aspeed BT BMC driver currently programs a fixed LPC IO address and

SerIRQ value for the host-facing BT interface. That matches the original

single-interface setup, but newer systems may need the host interface

parameters to be described by firmware.

The Aspeed KCS BMC and VUART bindings already use aspeed,lpc-io-reg and

aspeed,lpc-interrupts for this purpose. Reuse the same properties for

the BT BMC binding and teach the driver to consume them while preserving

the existing default LPC IO address and level-low SerIRQ configuration

when the properties are absent.

The first two patches are small preparation patches. The register

definitions are converted to bitfield helpers so BT_CR0 fields can be

programmed by name, and the open state is moved from a global variable

to the device instance so multiple BT devices are not blocked by a

single shared open count.

---
Yu-Che Hsieh (4):
      ipmi: bt-bmc: Use bitfield helpers for register definitions
      ipmi: bt-bmc: Track open state per device
      dt-bindings: ipmi: Add optional LPC properties to ASPEED BT devices
      ipmi: bt-bmc: Read LPC address and SerIRQ from device tree

 .../bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml      |  21 ++++
 drivers/char/ipmi/bt-bmc.c                         | 118 ++++++++++++++-------
 2 files changed, 99 insertions(+), 40 deletions(-)
---
base-commit: 493181e2f2f1bdfd4f09a988008653ae73b30688
change-id: 20260625-aspeed-bt-bmc-multichannel-b44a10ff407c

Best regards,
-- 
Yu-Che Hsieh <yc_hsieh@aspeedtech.com>



