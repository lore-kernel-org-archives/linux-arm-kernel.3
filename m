Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B518E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wWu0+tM+DklUyr688J1cGKUK2jvQy1icRidsJVjMMsQ=; b=AiAwbOyLmc2Ua5PRBmExvxBnEp
	w5+qy/T1k7vYYoHbx4DlxfytzRccgogkl1ZVaecGxe5UfCrzPA0fxZEFmQnoPOTosIYhgxXLmxAve
	hdWOCN2Ta46752xtZFXtc0LVXcB5WBbaaMVb7XXuZZuwi3uL+9u9x0AbXY2tIg1wMBqD1mXjd/o72
	7cVN2JlcNofNiRzWdluLc/XFyYBF3dSX9Jxlg97Wo/TogikebLRQX5rXJwgY22W94HLH764dbELqC
	dsH/FPbgLhXTpLvZ/kXhATtEnsUX6zlNgDWcMeGRT/jfQcJNoIMb9y292xUpd1GrfpSPQmfYfLXDU
	4CZvKWrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwjm-0000000Cv0H-2QkX;
	Thu, 09 Jan 2025 17:54:30 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwiY-0000000Cucw-1K3P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 17:53:15 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-w49j.prod.antispam.mailspamprotection.com; s=arckey; t=1736445189;
	 b=zZznMoo1Mpu3QqV8i5J/T8ZJqUXh+bSh1DriyH6jEo2QYy9CNtjSa04tLl72ePkae8IoryAbid
	  QRkk733wS1Htrpg5t8RE582vg0XGSb8Mx0mmLhCYfAK45uHEf4mhrjbWhFlXkCg56vGKdQlgtO
	  hDd47mBquoti/OorD8cKchdMCxioDuNMdWoT/6UjrSc8Yj05EMgx00ga4fDRFyUfMyplXaH16g
	  UhnP+HTekJ1379WYISKgaH4aKDzRKIjcnk6Hcce7cddD5kGO5g/U3snidi99AbedVBmDUNmqgz
	  z0ymS0pr7+gnX5rIN9oAZ7yKYAF9x2KZ9a0s1SoCNrJ83Q==;
ARC-Authentication-Results: i=1; instance-europe-west4-w49j.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-w49j.prod.antispam.mailspamprotection.com; s=arckey; t=1736445189;
	bh=JujTlisisTKj/lB3FvEubvMqpUIrnRDxA2GT8c2/36I=;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	  DKIM-Signature;
	b=Afg2+LcUQ8MnQlmWY+EdpMn0oD0TbeRpBpChfYwUQ7sVAs+Zta3Ike/J5p/dgDGevisMoNXnT2
	  gfwOyM1w+Nf7ht8M+24pGqXkli0apeQRmomdlC4Fxs2rrTNuAJG5oG9hgdvvWFQaAWNeQJPJxZ
	  nsVNZmANAuUsyPEg7WsTGi9LF+6l3HVu8DfP1XxGKMvVoJWv0qFQUdoVh0/1KtXf75Z0tgNOUo
	  Gt8gpVxGkE2p/PsFotj0s6ldztg7QQoFbc/S9ywgktV0T4vTDEO1xnmJTwscId9cbUc/Ruw7jO
	  Q2uo6gqbfXBt3jmVbrNLrQw74TbVNMD4te1FDOKit5ETMg==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-w49j.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tVwiP-0000000BzUz-1M9y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 17:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=wWu0+tM+DklUyr688J1cGKUK2jvQy1icRidsJVjMMsQ=; b=fNb80v/07B5aJK0R1fnlwPlkfL
	FN67hDGL/yRbZajmZ/gEMwiZT+ObPRX7ix5L+1G2USW+ygPe2arT4mIbYlvnoItdTwwdFkFKfquHV
	nc5LwonHoSwwW9BCf66l2AwRKINIdZ8Kw/+WThim1Ce7gfFYkuqnPhit08vIfBR1Q+Ok=;
Received: from [87.11.41.26] (port=62454 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tVwiJ-00000000G9C-3HFB;
	Thu, 09 Jan 2025 17:52:59 +0000
From: Francesco Valla <francesco@valla.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-omap@vger.kernel.org
Subject: [PATCH] bus: ti-sysc: mark AM62 wkup_uart0 as non deferrable
Date: Thu,  9 Jan 2025 18:52:12 +0100
Message-ID: <20250109175211.113945-2-francesco@valla.it>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 11dceca83f785494117efa20445c1502
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-w49j.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_095314_522451_D079C455 
X-CRM114-Status: GOOD (  11.08  )
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

The ti-sysc driver implements a probe deferral logic to be sure to probe
the parent interconnects before their children, postponing the probe of
interconnects not marked as "early" instances until one of these is
found.

Since the driver is alse used for the wkup_uart0 block found on the AM62
SoC, but not for other devices on the same platform, this logic forces
the probe for it to be artificially deferred 10 times and can lead to
the device not being probed at all. The missed probe was seen on a
BeaglePlay with the kernel configuration stripped to bare minimum and
no module support.

Add the ranges for wkup_uart0 to the list of "early" interconnect
instances, forcing the driver to skip the defer logic entirely for this
device.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/bus/ti-sysc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index f67b927ae4ca..917b7168fbd0 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -687,6 +687,8 @@ static struct resource early_bus_ranges[] = {
 	{ .start = 0x4a300000, .end = 0x4a300000 + 0x30000,  },
 	/* omap5 and dra7 l4_wkup without dra7 dcan segment */
 	{ .start = 0x4ae00000, .end = 0x4ae00000 + 0x30000,  },
+	/* am62 wkup_uart0 */
+	{ .start = 0x2b300000, .end = 0x2b300000 + 0x100000, },
 };
 
 static atomic_t sysc_defer = ATOMIC_INIT(10);
-- 
2.47.1


