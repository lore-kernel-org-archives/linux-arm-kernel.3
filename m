Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8225CC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 01:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=blLJh96waC7iW5pUXAIxKFQ4OfEzeyzBx1zcAO6CSRE=; b=ah2eU2z7A88DyIM0H6pD7a24ZC
	R2+YfsOK4BXDd2fSkPppt7gUkQ5SgncW4YhWKLv4KwY6As88uF6YytU9YHQIFByM9PNlIPcPUyCdk
	fdiDW0WVSPKhccjgDCp+QghebPPY8d54/5VLxPDRigF8+SgRjGZWiO+0xiXCq0lJ+rKWrBedZb3Bm
	lSv/arivXakcm0fE+9XVk9egw7pZqhXyLACH+3x3GXRnL1skm7A2+q6q5zHQaYHdJ4I/8+lnp6TqJ
	G52IUZ3kyD8avXx0U2Yp/I8YyZYiT4fFMWduT2X8VV/mUDq+I7tAT+s5ROYpQkAgJUPnTYCTZUP6X
	TrL1foxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ouT-00000003qfl-2ibD;
	Tue, 22 Sep 2026 01:03:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ouG-00000003qbP-1cOV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 01:02:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 995A260210;
	Tue, 22 Sep 2026 01:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E99EC2BCB3;
	Tue, 22 Sep 2026 01:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790038967;
	bh=eLnNgO/rDS2qwwxL5yTUq+zocopo2r2OBj3hkKd83qc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bXRsCZwXAI6qxmP+fWjsQcQnf343piN64Y2a6SLHz/60arpazhSZoENh713FHhKQ8
	 NOcb+RUXb9BoienHuUG1UtCms22rA/coJPNq4F4cXCdG6UuiXDKGdJmoUoSX8SDSyk
	 dWp426duJC9kLOiAacTmGIIxVzvy1xcDzQXP4G/X4No6EBIDmsuux7gf3D2BvvZoR9
	 FybunFPgtyjTMnGRHTV7CQMb4rwMqCQEzcS4vQZJMgXVhEQtvid0wGRVqB4eh8oe5X
	 MlIbRjDmu11QJeREXCmmODD0OPw64XqZU/FixL2O7Fc9jLX1QlVFV8HZTtFNP5ihG5
	 WDPZMRgBG8s3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD2DC982E6;
	Tue, 22 Sep 2026 01:02:47 +0000 (UTC)
From: Jaidev Shastri via B4 Relay <devnull+jaidevshastri.vt.edu@kernel.org>
Subject: [PATCH 0/2] soc: xilinx: zynqmp_power: order callback state
 against probe
Date: Mon, 21 Sep 2026 21:02:32 -0400
Message-Id: <20260921-mb-zynqmp-power-v1-0-de6f2eee3f23@vt.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKjTsWoC/yXMzQ6CMBAE4Fche3YN/YlEX8VwaMsqNaHUraJAe
 HdbPH6TmVkhEXtKcKlWYJp88mPIEIcKXG/CndB32SBrearPUuBgcZnDc4gYxw8xKt0ZoRqplRa
 QV5Hp5r/747X9O73tg9yr3JSGNYnQsgmuL9HOqTkqZKdh236nOJXRkwAAAA==
X-Change-ID: 20260921-mb-zynqmp-power-34da13724341
To: Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jaidev Shastri <jaidevshastri@vt.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790038966; l=1347;
 i=jaidevshastri@vt.edu; s=20260921; h=from:subject:message-id;
 bh=eLnNgO/rDS2qwwxL5yTUq+zocopo2r2OBj3hkKd83qc=;
 b=q8wOvkA78pAcCFPujvVLwMILLMubgB/JO4Yfq1mjtANaMC4ZsHUSNsbkRpbm0mTwRLTxEnb4D
 j+OoJd891a/BIFw199Mgl2/xgfz3jWLpGFGZ0Cx7iLoMLtZon4Ws5jB
X-Developer-Key: i=jaidevshastri@vt.edu; a=ed25519;
 pk=J7+xYJRlTPds+pv5hbqFFRqGCpDeJDzmZT1ggRwj7/0=
X-Endpoint-Received: by B4 Relay for jaidevshastri@vt.edu/20260921 with
 auth_id=1044
X-Original-From: Jaidev Shastri <jaidevshastri@vt.edu>
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
Reply-To: jaidevshastri@vt.edu
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

zynqmp_pm_probe() registers the event manager callbacks and the mailbox rx
callback before it has finished storing the state those callbacks read.

The first patch closes a real window. mbox_request_channel_byname() starts
the channel before it returns, so a message the firmware already has pending
is delivered while rx_chan is still NULL and the IPI is never acknowledged.
The mailbox API gives the callback no way to reach the channel from its
struct mbox_client, so the channel is stored under a spinlock shared with the
callback and the acknowledgement is deferred until probe has published it.

The second orders the two work-struct pointers that the event manager and
mailbox callbacks dereference as soon as they run.

Found with MBCheck, a static herd7-based memory consistency checker.
Compile-tested on arm64 with W=1, no new warnings.

---
Jaidev Shastri (2):
      soc: xilinx: zynqmp_power: do not use rx_chan before probe has stored it
      soc: xilinx: zynqmp_power: publish the callback work pointers

 drivers/soc/xilinx/zynqmp_power.c | 113 +++++++++++++++++++++++++++-----------
 1 file changed, 81 insertions(+), 32 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260921-mb-zynqmp-power-34da13724341

Best regards,
--  
Jaidev Shastri <jaidevshastri@vt.edu>



