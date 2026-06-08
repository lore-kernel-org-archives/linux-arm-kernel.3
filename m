Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A932CD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 05:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ud+rVLLtmeaFikk63rpGcD+7hJ3NPyth5NFlQdc5XLg=; b=F7MGxwQFLBkjQ2+NYLS0UobUo1
	ZJpknhd3IsXyW7vhNvQusjjWSGFo5NMfaEgXdi1jb2DOtA+dQrC+iFi2PkxZGPnlLuAoidS0p8gR9
	vydGvposrDG9boF/bR/ZUcqvvpjVsCqsRy1SRYRcM1Dp9WZhhhuwgY0TRNrb6hhH8z/O79R6afO+O
	HpWkAQ1GgyjO8loybhkqVHJ+rHNoCoY1vY84I/bLjPIcGIEF/85pfbsolXKa5ET5N9Ofi8UK+JXE2
	dijKrLkoLpOVSj2kXAPX1zx8blhAZN06vrsc2Xu+PVksg15aArjyvBU5VeeQjDBif4ZIRd0sxLHrs
	HU8ninqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSLX-00000002peu-0Mcj;
	Mon, 08 Jun 2026 05:16:23 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSLU-00000002peV-3Jb2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 05:16:21 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84275887a3fso3033360b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 22:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780895780; x=1781500580; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ud+rVLLtmeaFikk63rpGcD+7hJ3NPyth5NFlQdc5XLg=;
        b=ATlYTJYTyomAj3YGbXeVh2izlDKy2MIUfh38GaGGRMYGtVhusogqTsjwbCqfmnv6F3
         prnY0umQtqKE7uR7dVMIphBI+uMAJg9c8eG6A6bOcWmFK8lDTJDmRiQjhau1YRDuHgpy
         l5W9PyXkxrYGI6oKnZpDB7oqV5OJeBEhDrTHi1qEZ8JnnU9fCj3SUB/n1CMZ6mjXdLgS
         7P04B1kEKbhLwJrEql5IfYJeoOrIHzq+1/C1TIcGWtzWBA2yc9jXFmotptaB3EJNaLIS
         Tb9kEJJlYarUmJ9I9O9deWhkftigzml8LZW3Wji86Y0nrL8Dt32A+1NpPiwJgvBJrN4H
         xgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780895780; x=1781500580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ud+rVLLtmeaFikk63rpGcD+7hJ3NPyth5NFlQdc5XLg=;
        b=hTdI0p5dCXPsXNINaBBAHn1gsHbGAAOTDhwOsPz98wR6zbsKStSnVsGDWhdWB9dLGS
         nAKnHx1KR8NwU9PIilwfuWDp+au6NivPp8yPwTZ//KERKvSLqMqhju0NaFK0iKjPDqHC
         74zFA16wKuCOm7r5JqBboqVrDpm2GA+h2h2RIJTWBO38gC9+ZWT0As6R+WSOMkMQwhj4
         TilzWXTQ1DFG5bFsTD+N6fv4hBqhrRoNbHTyFat18/LUuTKMhD/9B8H3zTFSfB9dGAu0
         Et+d64rpXaAlsbipgaTPPMoC2zzRWiDOlAxLdAykOIWmFgaNdNs16JcUP9D7WSafMNRZ
         CxiA==
X-Forwarded-Encrypted: i=1; AFNElJ/UFYd9izcmZtvShAXPkThoai/q5898wzrbdjhHZWXhfJN9vHFa424YyRMfLm8i4vDkVKRSRQeWqqKM39m3mtKA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9nCZXk0zd/kHkelEPoJ4L885kCpWX7kd3CmKbRMK4x1DnCMZ+
	NiLMBmHCoI5czlP6D4ahVRaxKmk1xDx9nC/LqGFUCOT4NmhKvNu5Bylf
X-Gm-Gg: Acq92OFuu+a1oJtvrG4wtuyCPsJYRxkqRFMMN+ToKt+eZHk3V/6yqt1DxNUsU1JifLD
	kYmmEuyU69zsX5BEWy43sDOgq2dt70BvVU+pAJm/eOkHNk+0c+YGqF83pqP8jbIDRc5B7z3LqD7
	Pq2hIiK68SR5yPkX5+Z5siLW5RS5CX9dcnHnUeZtz4M4eSR03b0GVWV++dCiya5JorncfxnzXUP
	9vGCfqRITAPyArMeEu6t/GoqSz6PZwy6OTn6C2q7KonPEeMtseSRY3F1pkJau6TygAQwzCZMKbG
	ReMOvnxyl2xJMpWk8DoQNBC7yX/EtT9tBz96xbqIdHhSaCqDFNlaWLzSaJCId2JKUM/0uQHtsDG
	oS0QZ6SfW/cOOhel7ReiL2F845PoTiXx4w7/yTkTKLY1sp4jLl1C7U8zcJLiryA8MP261AFOFrd
	mk2ts+k8ILcD07K5JfmfNvVuXLHW6bSPFZVOvzeqBQMboH29/M06FK52bjVXVbBeWRg9G2SEzpq
	UZWzmWtBBwJQL71jZ1qa7p2PektzIKFZCRgH1ILvnXZcw==
X-Received: by 2002:a05:6a21:1405:b0:3b3:2fc3:880d with SMTP id adf61e73a8af0-3b4d3ce5059mr10314307637.25.1780895779906;
        Sun, 07 Jun 2026 22:16:19 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a61b3sm14459163a12.17.2026.06.07.22.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:16:19 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv3] clk: kirkwood: use kzalloc_flex
Date: Sun,  7 Jun 2026 22:16:02 -0700
Message-ID: <20260608051602.7176-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_221620_852723_A91651C7 
X-CRM114-Status: GOOD (  12.84  )
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

Simplify allocation by using a flexible array member and kzalloc_flex to
combine allocations.

Add __counted_by for extra runtime analysis. Move counting variable
assignment to right after allocation. kzalloc_flex does this
automatically with GCC >= 15.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 v3: change description slightly.
 v2: remove unused goto.
 drivers/clk/mvebu/kirkwood.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/mvebu/kirkwood.c b/drivers/clk/mvebu/kirkwood.c
index ed061d82fb65..f4f62b241193 100644
--- a/drivers/clk/mvebu/kirkwood.c
+++ b/drivers/clk/mvebu/kirkwood.c
@@ -253,8 +253,8 @@ struct clk_muxing_soc_desc {

 struct clk_muxing_ctrl {
 	spinlock_t *lock;
-	struct clk **muxes;
 	int num_muxes;
+	struct clk *muxes[] __counted_by(num_muxes);
 };

 static const char *powersave_parents[] = {
@@ -297,21 +297,18 @@ static void __init kirkwood_clk_muxing_setup(struct device_node *np,
 	if (WARN_ON(!base))
 		return;

-	ctrl = kzalloc_obj(*ctrl);
-	if (WARN_ON(!ctrl))
-		goto ctrl_out;
-
-	/* lock must already be initialized */
-	ctrl->lock = &ctrl_gating_lock;
-
 	/* Count, allocate, and register clock muxes */
 	for (n = 0; desc[n].name;)
 		n++;

+	ctrl = kzalloc_flex(*ctrl, muxes, n);
+	if (WARN_ON(!ctrl))
+		goto ctrl_out;
+
 	ctrl->num_muxes = n;
-	ctrl->muxes = kzalloc_objs(struct clk *, ctrl->num_muxes);
-	if (WARN_ON(!ctrl->muxes))
-		goto muxes_out;
+
+	/* lock must already be initialized */
+	ctrl->lock = &ctrl_gating_lock;

 	for (n = 0; n < ctrl->num_muxes; n++) {
 		ctrl->muxes[n] = clk_register_mux(NULL, desc[n].name,
@@ -324,8 +321,6 @@ static void __init kirkwood_clk_muxing_setup(struct device_node *np,
 	of_clk_add_provider(np, clk_muxing_get_src, ctrl);

 	return;
-muxes_out:
-	kfree(ctrl);
 ctrl_out:
 	iounmap(base);
 }
--
2.54.0


