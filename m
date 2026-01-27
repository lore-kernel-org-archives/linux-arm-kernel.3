Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3BED2FEEE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 21:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0wy2itUgbHaHKFCOftIGn+pn/RO5A4fmoJjHkwQLqBk=; b=ST0jF1QUBL0TBnPhWpCgttusax
	sA6Pn7zie6ekaDxoxveYBoSO+wsCpByyG4GyfeV0CwIVRCcxgYy+QA8epsyKam8fGvg76/6PPOaP4
	mQVkJdlFc/6HBG53wMZdpGLDg0ENqxSI0wsYfZ/SAy1UXhN4r4atOxOH3NA7WZiGfZOXvNIPRLFzS
	hXI/eJRY6GHVaC+dfQwtlymalvp2cj4reZtea+V6fDq6dUTU4u9nYF6/AXqgY+dLMgOYZ1O3bG+BM
	SXWuBBxgKukNoZ0wcPWOJbNXKt7S8aN4ROGQEUkqzMQQ+88Ua+iUUNE9szHpoBbArOVM6IckP7SGs
	Dcxh5AnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqtz-0000000F4nX-2kEK;
	Tue, 27 Jan 2026 21:47:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqtu-0000000F4ly-2rfi
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Jan 2026 21:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=0wy2itUgbHaHKFCOftIGn+pn/RO5A4fmoJjHkwQLqBk=; b=JYDNR5KNVs5BotElPmeXrd/hcJ
	BbXL7PvLxeSlX/WycYxjQY9bXvDTpRcHuNn+rNVd56k3V+H71xxzmm3JpS/SQD0RioDO8/lmKuIim
	b3TYv+69a/Sh+GKGh3CtYNs1WyPHwfjmeKjss9wSkDjhcnvGLHRpzfMS3a879BhGhFECJizpK8WvI
	urvDavsIa6dbVdpaRf4D4EusBhr6KmeWQZAWlftISFO3KpRPqDRhzH2ERxsJXPxLzbbLE8+/atpnv
	0RxejJ77azITd0LwwRrkAzNW33mmfEMQkZRKyTjKlrrl45sZuqQsTK82z50//3yvrzTd7UpfSn5bh
	IXj2t1iA==;
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqtr-00000007eeg-1tjj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 21:47:05 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id C2E70C002FC7;
	Tue, 27 Jan 2026 13:46:59 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com C2E70C002FC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1769550419;
	bh=JnfNS34/V851rQP+oN95QQoE9EKEKbvWuHol2CHK5QQ=;
	h=From:To:Cc:Subject:Date:From;
	b=PvnxrkrXTfhtRNNjZxyv9ajKEDuUA82o4HcNwdrd/GPpyQF57e4dVhho+UU5udApU
	 QZdT4/nnu13MdhBn+P8xX9QEe2JLmXCKa9xzfWSE2aS1NkB6W2wo4V/wmRxxm2b3rW
	 e1DCARpJPaU7HCbgMgW6Kn+9fLGCiI75zW7Mm5p4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 3401B199D0;
	Tue, 27 Jan 2026 13:46:59 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v2 0/3] gpio: brcmstb: Bug fixes and wake-up interrupt improvements
Date: Tue, 27 Jan 2026 13:46:53 -0800
Message-ID: <20260127214656.447333-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_214703_798498_712777DB 
X-CRM114-Status: GOOD (  10.43  )
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

This patch series corrects the HW interrupt to the bank mapping logic to
be more robust and do not assume any particular order.

The last two patches improve the handling of early wake-up conditions
and makes it more robust so we can use those during "s2idle".

Changes in v2:

- corrected the patch implementing irq_mask_ack to write properly to the
  STAT register, this was not the case
- create a separate helper to write to the IMASK register to make the
  code more readable
- remove unnecessary cast of unsigned long to u32

Doug Berger (3):
  gpio: brcmstb: correct hwirq to bank map
  gpio: brcmstb: implement irq_mask_ack
  gpio: brcmstb: allow parent_irq to wake

 drivers/gpio/gpio-brcmstb.c | 127 +++++++++++++++++++++++++-----------
 1 file changed, 89 insertions(+), 38 deletions(-)

-- 
2.43.0


