Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA48CCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 08:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6bBRqVPfu4/8wamOq3/siJIb6epSz31x2A+7rsSjhdM=; b=RO7p1yNub7AkRY
	bJEIhljVQk27quSZ3NDSzjsImUhoBHn87dZwgqzP1ke4qQj+aL+QSp2oMqE5dB9OCcXxKjWYPWU0z
	zLQsCrjDhv08Lh5cRiLZIM1OiXekmSe87ezO9istsbHt1eNEPRYU/M0ndaBnS7mhRuQXaG2DMJ5wW
	BRTIs/b887bxTFuXmO7GGHynp4HT+i5ff16IzGvqUk7F98b9SQLdouScVmdsQHAc1DA00ZlFCS2eb
	MbgPc9l69vz8EHQ7xsm2HVll93tLq5BpeADCbAD+7hTDT6m13tmTOhvkrQB4cHbFWBpzbxPGQ11/w
	pvWAFWmxlW8YnuHDG2mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGhs-0000000H8Ou-0Hy8;
	Thu, 15 Oct 2026 08:20:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGhp-0000000H8Ok-1vEh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 08:20:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E3D37419D4;
	Thu, 15 Oct 2026 08:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABCA71F000C4;
	Thu, 15 Oct 2026 08:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792052452;
	bh=6bBRqVPfu4/8wamOq3/siJIb6epSz31x2A+7rsSjhdM=;
	h=From:Subject:Date:To:Cc;
	b=W2i0JKzUFkQs2wKKYOSkjZwpFSdsTmZO+jQfuKkWEQwuwmsoeBBCnH4/W2SmGCYiu
	 32jwppO2wKolSD42H4wEuLFhKmg2swLglqP/7pZtWl/G2zNyYNCVDTzV0jrGDJr8UI
	 H04HB3vyP+RLd1Rzo3BVpxn0raZ8KUdf/4FPt7b0RHAQlICAfot6dExUqd2RHXdGua
	 Gg6cFpAsFenHppoX6qnvFRbh3sdGalBPsYyW4usE+oKoUO7d2I1BLiUGtTl7u5ze4I
	 POQfqdUgE0G7UlpT1uUouupCDYhwFkMYDav/VIlMsZhLO2IiYepkLtWPcZQ4K3U6nL
	 B5pUV/mDn9/cw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH 0/2] irqchip/gic-v5: Fix standalone IRSes OF driver probe
 and DT bindings
Date: Thu, 15 Oct 2026 10:20:24 +0200
Message-Id: <20261015-gicv5-irs-no-cpus-v1-0-d4b337b7f000@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5EQBBA0atIrVXSbZjgKmJBqTZl0aQLmUTcX
 WP5Fv8foByEFerkgMC7qMw+wqYJ0K/zI6MM0ZCZ7GuNzXEU2guUoOhnpGVTLKlwffdxVZUbiN0
 S2Mn/eTbta936iWm9R3CeF8khMGJ1AAAA
X-Change-ID: 20261014-gicv5-irs-no-cpus-8c5fba3f9940
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Rob Herring <robh@kernel.org>, Sascha Bischoff <sascha.bischoff@arm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.15.2
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

The GICv5 architecture allows IRSes to be designed as standalone, ie with
no CPU connection, to support system topologies where the IRS is separated
from CPUs.

Current OF code fails the IRS probe if "cpus" and "arm,iaffids" properties,
that define IRS<->CPU connections, are missing (which goes against the
current schema because they are "required"), which is not correct for
the aforementioned reasons.

DT schema for GICv5 must be updated in that "cpus" and "arm,iaffids"
properties are currently defined as "required" which is not correct
(unless there is a way to keep them "required" and empty) and must
be relaxed.

I do not think it is possible to keep "cpus" and "arm,iaffids" as
"required" and allow them to be empty lists - I would need DT
maintainers feedback on that to see what is best.

I did not mark patches for stable kernels because I would like to get
feedback on the DT binding changes first before sending any change that
is potentially ABI changing back to stable kernels (strictly speaking
I do not think the DT changes can actually break anything - the only
potential issue is DT files that do declare "cpus" and "arm,iaffids" as
empty list against the schema - if they do that they are already broken
and this patchset changes nothing in that respect).

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
Lorenzo Pieralisi (2):
      dt-bindings: interrupt-controller: gicv5: Relax IRS properties constraints
      irqchip/gic-v5: Fix standalone IRSes OF probe

 .../devicetree/bindings/interrupt-controller/arm,gic-v5.yaml     | 9 ++++++---
 drivers/irqchip/irq-gic-v5-irs.c                                 | 4 ++++
 2 files changed, 10 insertions(+), 3 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20261014-gicv5-irs-no-cpus-8c5fba3f9940

Best regards,
--  
Lorenzo Pieralisi <lpieralisi@kernel.org>


