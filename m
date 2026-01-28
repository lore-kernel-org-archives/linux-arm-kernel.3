Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71191D35692
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 08:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AWq/HTw1YbVVTLbDtDcQ/JJUIzFiIOVRXqodj5LKW5Q=; b=h6MyHNh8adK8E8
	ljF23ykrscF4yfeuf3RdOp/eN6dv1/12gjv3gD4VG0aY4MlL1c7JyYScRF2ZZgd4cQiKVHNGm7Mcw
	rpnUrEUOpEP+v6EzcqbnYBhIXPVRo+xpXJJmIrpMvw6dE2N5t3kMTiKeG5o0jKMGVoAXJIPAqrIez
	HW7AroOZu8oFG5EWjQ+uWDCHH4UpGfUDsYLUyfTst+msi2Ssjn2gzVNekZ+MysS5Mdn+rUd2X4KlO
	a+BHhcrbeYWl8YOqJGTTknVR+PLwSC4xY8DftAYBMKNPDd0iUvdG2n4krXMzF3/y1Uz/IiYT7Xzu8
	pmcGK8yfDGyzrkS1KBOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1Mh-0000000Fhot-026S;
	Wed, 28 Jan 2026 08:57:31 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1Md-0000000Fhnp-2FJT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 08:57:29 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id A2A511D00090;
	Wed, 28 Jan 2026 03:57:22 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 28 Jan 2026 03:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1769590642; x=1769677042; bh=AW
	q/HTw1YbVVTLbDtDcQ/JJUIzFiIOVRXqodj5LKW5Q=; b=HSw7JYbK+PBrJm20mW
	/28ngXbf+wjRthIM4pYDD5AdrTQoBVektxX5gEaBE4928XVSRMjXOc6eIkF0osjl
	nzREBD4GIY1o3si1HrtciLsm5yFY0MdYmnzsWn9jBAhBxtSCqfUb5UbadvC9Sunu
	4PE+PRlVCjBsvNhOz+0SqThH0TY50U1jpscMGD6s/0fBb1UTKXJ9zIa2jMXwPTOQ
	yy0YMb6s6lbs5i159N9Ug34C8dxGEyC2DFsbV2GZNove4hC2PqZRLhPdt5kFjMQz
	FU1uqyyDvbMKTj6RONuvoWacXMGJGQ8Kz8Gkr3PpBkThJB7MvxhZrqijCzJ1JwIJ
	x7Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1769590642; x=1769677042; bh=AWq/HTw1YbVVTLbDtDcQ/JJUIzFi
	IOVRXqodj5LKW5Q=; b=Ae9CZ5wufqDtP7AwGtiztITsDPQf2ItJPhd5OjABpZTi
	hbBMcoMJOExkajxDdLbQKJqr14AcJvp7yBU+KIWCQkm1UZXsCWfYAbECelBZILEC
	nFoxUGoZo8S03HWDPOVpv4r41EM7HWGZMjsmBUx+UC3lnpAgwYT9r8CC0D6gberS
	9GNN4VXn5tvnDbckRFoRasYlo1CbFt8ImREV9xg3RLLZn8Bbc1WYajywHRM4yL7C
	Lmq8x+Lq2F5j1zJwhSBVlGs9Z6B8ym7LGf4jbKkVVBU2FWwMIvvx5WkPGPG4W8Qn
	8LnDwlLLfQrdkqLtXULPUoWrlaiahNf/BuFj/qGh+A==
X-ME-Sender: <xms:cs95abPp_AmSkebm8N6W3YpghxAW5v__-hAKruhyfwuVBtCLL6J9LA>
    <xme:cs95aRy-2-L58I259z-UucZHKNP8IEGLQEGJ5HArXHuhiYHL_uTruD3JTao7YSZsO
    c1EFmaqK503GpbD54P85Gtg3hUZn6GkBluwrT1OkfdG3oPEhg7BaaA>
X-ME-Received: <xmr:cs95aVpTflY7dqXXAO2ZmdplCiiHXFg_sbKLRgtA3tcAI_SKYZptNGvNAPPKGXzU2UvVsiICVzZOkjVa-fhVVSBehyXj1rQZksUNEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedvleegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepudffle
    ejffefieeigeeluddvgeeklefhffeigefhudejieevgffgkeeftdffvedunecuffhomhgr
    ihhnpeihrghmlhdrrghpphhlvgdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhn
    sggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhgvrg
    hlsehgohhmphgrrdguvghvpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvghtpdhrtghp
    thhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdgu
    vgdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfh
    hrrgguvggrugdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhig
    rdguvghvpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:cs95aZOWUmjwrmikHWfn_JQ6RJUhR_ZX48NjX4lVtHykN9JMKmjF2g>
    <xmx:cs95aRfFgC46CawEmYkvezHnVuQv-XANTjRIC1-Q47zcMauIJqUK-Q>
    <xmx:cs95aXVmGUxsIZDTdUozKWVoitmwom1a7kr9jEb_BmhE9tJlqbegwQ>
    <xmx:cs95aaDLUuz1AdGxWaA4gprdx3DK8CBjwRRYNiPmJ8ObQ5nFNoLUZw>
    <xmx:cs95adeJ6FlANp17K-v_9vr7w4MU3WynIU6MwzLEW4W1mgrJV2JhOz2d>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 03:57:21 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH v2 0/2] Add Apple interrupt controller 3 support
Date: Wed, 28 Jan 2026 09:57:07 +0100
Message-Id: <20260128-irq-apple-aic3-v2-0-b4bc8e16c997@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGPPeWkC/13MwQrCMAzG8VcZORtpOy3Mk+8hO8SZuoh0tZ1FG
 X136/AkOf0D32+BxFE4waFZIHKWJJOvYTYNDCP5K6NcaoNRxiqtO5T4QArhzkgytKhavXOWyNS
 DOgqRnbxW8NTXHiXNU3yvftbf748y+38qa1RYGcfWkqVzd7yR9/Tcep6hL6V8ANXyWSmtAAAA
X-Change-ID: 20260119-irq-apple-aic3-0314f6aa2a2a
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2081; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=lSCd9224ugKISLFYLWd468PqALwjXlK5iifgzV8hY5Q=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhszK8wV/Wau4zuj82sZ4u/p3XeqqZ8smzbpQUzu5/Pvs1
 2pbFrNkdJSyMIhxMciKKbIkab/sYFhdoxhT+yAMZg4rE8gQBi5OAZiI7DtGhiOHsxaeP1pwRFb+
 hPTeiQc8WFacEjlw7970C2czDzo1bH3NyDBtjoSX6MeanW2dshd2fEiym9vyYdMcbhPWupYuto4
 nwdwA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_005727_710000_07B5BC57 
X-CRM114-Status: GOOD (  14.34  )
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

Add yet another variant of Apple's interrupt controller. This one might
to stick for more SoC variants than their predecessors. According to
Apple's device trees it is used on all SoCs since the M3 (t8122) up to
M5 (t8142). This information is not 100% reliable since macOS uses
different kernel builds for each SoC variant.
As far as the functionality implemented in the Linux driver it is almost
identical to AICv2. The only noticeable difference is an increased
IRQ_CFG offset.
AICv3 uses the same device tree bindings as AICv2 so add its compatible
to the existing apple,aic2.yaml.
Apple's device tree added many MMIO offsets as properties for the
"aic,3" node. The offsets are the same for all released SoCs with AICv3
so the Linux driver continues to use hard coded offsets.
Compatible strings for AICv3 will be SoC specific like
"apple,t8122-aic3" so a potential future SoC with different offsets
would use a new base compatible string for which the driver uses
different MMIO offsets.
While the offsets are the same on M4 and later SoCs access to
implementation defined system registers will require different
compatible strings.

Signed-off-by: Janne Grunau <j@jannau.net>
---
Changes in v2:
- allow single "apple,t8122-aic3" compatible in the bindings
- drop leftover #include <linux/of.h> as it's not justified by the
  contents
- comment and white space style fixes
- sort cases by version in switch statement
- Add Sven's Rb:
- Link to v1: https://lore.kernel.org/r/20260125-irq-apple-aic3-v1-0-a2afe66a6ab9@jannau.net

---
Janne Grunau (2):
      dt-bindings: interrupt-controller: apple,aic2: Add AICv3
      irqchip/apple-aic: Add support for "apple,t8122-aic3"

 .../bindings/interrupt-controller/apple,aic2.yaml  | 45 +++++++++++++++++-----
 drivers/irqchip/irq-apple-aic.c                    | 24 ++++++++++--
 2 files changed, 57 insertions(+), 12 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260119-irq-apple-aic3-0314f6aa2a2a

Best regards,
-- 
Janne Grunau <j@jannau.net>


