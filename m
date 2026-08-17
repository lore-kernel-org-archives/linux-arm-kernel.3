Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D716CC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 11:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzGExxFnCPzi9f9lsFjVD5bDNaIA4FG0zlhKiXHxhyI=; b=05AfegBYQWRwvkdzZQY7b2dCZh
	CtjbTp4uwoJ+PhiwXG68O2c3hGNXbO/7IrxQLpOxrhnW45ofLnERoSkSvpIBgG65ZHPJcb1pRzzS9
	/wQu3B76iPUgsqbnPMGBgvANR6kzYZAjiiErc1Dbj92/LaltRhU0ErwH15HmusFEfmvkwOibsgEkV
	7yyRa1CKkaZf+cF+xdRhp7+cha8w2DID5qZpqQ1QemsP9DuFfjS/6My0j0SM9/TVWMG0P7DJ8mMz2
	PLZSIA/vvyQ9uAnN15r9BqtK4YvlVyE4XrdZNMHkSKVGm+g7goxxWVudrHyo/TjUR84ufXCqbXl/o
	qZ9XFc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvdy-000000062X1-1zuz;
	Mon, 17 Aug 2026 11:36:42 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvdu-000000062UO-2EhA;
	Mon, 17 Aug 2026 11:36:40 +0000
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id A0001138014E;
	Mon, 17 Aug 2026 07:36:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Mon, 17 Aug 2026 07:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1786966597; x=
	1786970197; bh=EzGExxFnCPzi9f9lsFjVD5bDNaIA4FG0zlhKiXHxhyI=; b=b
	rHBiOCGVbAJPYNiIRASIdl8BPL62Vl+OERK3UFxbd0Xod+EZOHooPPaThmp3TiLq
	uxQ/vpwlSFVgT6Qk+Gf3FLVJGf7VVNTbiOU8RnB6iKXWgD7CR2fw8rzmbDWocLi5
	uWHLU3qATV/uAJwYdXQxipf2IHxVLw4ACE7BavX1lnM6zE34zJx8TL1Ijp0YcBsf
	YxYFSTL3yCrbDqqLVLEYPpy2KzerIgPBA2zJSuwAAyQ+YxkqHY15grfVjhuf67W8
	4Gn/E6SWc7mQuGlmNIbjuzO5N+zYAH9hWdX8rESFY4X+xW7vkS3kLN4RThQGT0t6
	O//TKTvKPbK+4xGFwnR/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786966597; x=1786970197; bh=E
	zGExxFnCPzi9f9lsFjVD5bDNaIA4FG0zlhKiXHxhyI=; b=IAh0/w5E0gN6CX0/v
	Qt2cQxsa/0HdQEHJWZyuGldOZPmkHnZuJ7lW1tcQO+7s87gu6L99yhjucO3+vFdI
	74qYjw+2+6j2J/Tm5VYDA+qqKL+IMeRGVGlu0QdFUxQr3j0sPxobip7HQsg1JlMr
	lO7RwrCIulgLe7iNqzPA/3G9YEAx8reQOpUcttC6xRuGYYjEoVxXBq9axf+hBY5Y
	k2eioGOywWZX3MBRNKRyBsvXWC8HEzGPLG0e8xnlRhcvB40NZdz+8UwE4rHBGTho
	nGzFju6E/AlPXHlYRBfYiH7ehjOsKKltfpt7X2KKbLDaIW9zWyWjHsL4GQkERFT9
	S5u8Q==
X-ME-Sender: <xms:RfKCalXJVI50JgyfyG5gCGGtn32YXurQxEvOkM3XgS75JUrvau4nRw>
    <xme:RfKCahtG-m8FOWH3lo8ePrlr5p7-MVQE1pd46yDFBrAEwxE7x96QLt_ncckj_wbJ0
    s2W6VEXJtFppCp-OnJskT_ulZPavd45m5MBpYFZBwdejbr144eMaghs>
X-ME-Received: <xmr:RfKCatNnuru8_RYSK5cnc3lbvsoCgqu3yeR_wWpj6VZjC3qE6UGvdvpOYInZ4FcrF-QQBQdA7A>
X-ME-Proxy-Cause: dmFkZTFJpbjkSDT6AcryrIHhgbEVj8SvkD3tgmT76I8WU6lQDo3YUCdtzXxAeg/zKqpB+E
    Srz/I8ZJc3N7HCrgkTkwyaBZdvHNOdURxqLv8+rxKpfV73gGv9LWiSebktKgvlTsmvhDvl
    7z8e7P5tVZXD1XfHmjG3x7RlOqfrClYofT98201dsDsGzeGalaNI/cy87SBMyHKVxLpD1H
    cf8c4VtlmLV27PNqhGPBVow9iGRSY0ganIZ7M7ursi5UKI38krV8lOdP4K1YQOgw9wIEpu
    SQtDihQpP3WqB+Si6LCioT5pFEw0karkUBJswAF2S4IqKtJUmYgRgB9BVHgg2tCz+ac+AB
    p+k6BsTcA9CHxRwORhDKDHlcDuGzmF3rF7ve60mBaxr9oomY4nrIU6NmMpZFzQxUj73O1v
    6fllLr0K3+NNuad5vLRVAUF83mnGQ1LGiBQP+gMfje9x7MxWbT5qJ/nJuscxrEduMvF++W
    nxKLtyRp+KcvuMNrTEOTIJeuo+Q4o5ShD/EZNG2Rzrpcws2l1yWUy3weB6k7kZd56Qgde0
    +NTIJrcyzrhOcS/WhD8tNw4Q7baBROxq6a8VTR3Q7aXabwowd+J6cQJmm4fQnWzfByQij+
    XA6pZtk/nx0du2Mm7CBveU59lsc6PfWGo4z6Hg+PArDaWnArRhMnTdrMc5+Q
X-ME-Proxy: <xmx:RfKCahpihquXrIXTgEvEAhWvDguI9tYM8rfBo162bDo6KelGauILNw>
    <xmx:RfKCavvRUb3NAC5N88DQhfvE2Gk9isuJTPZVS4ISzVpVVWch-pPjZQ>
    <xmx:RfKCapjfULWnXqj_JjQ89qGENtWX5Fskft88Ycomn8qiJB1Ekkb5pQ>
    <xmx:RfKCar0g3tC1VefnM_bfXJwtRJZRIERNWKBsB_U7KCcaGk4yEQBIiw>
    <xmx:RfKCal6-XFyepCYkg4sJ1pDG7gz85C1CAj1otPSzI_4n-azqjpMx0m5C>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Aug 2026 07:36:27 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v8 02/12] accel/rocket: wait for a running IRQ handler before resetting a core
Date: Mon, 17 Aug 2026 23:35:53 +1200
Message-ID: <20260817113603.1436067-3-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817113603.1436067-1-gahing@gahingwoo.com>
References: <20260817113603.1436067-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_043638_656360_3E0D9C3B 
X-CRM114-Status: GOOD (  14.81  )
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

rocket_reset() calls drm_sched_stop(), which stops the scheduler and
returns. It does not wait for a threaded handler that is already
running, so the comment that follows, "Remaining interrupts have been
handled", states an assumption rather than something the code arranges.

Call synchronize_irq(core->irq) after drm_sched_stop() and reword the
comment to say what holds afterwards.

It has to go before the scoped_guard(mutex, &core->job_lock) rather than
inside it. rocket_job_handle_irq() takes job_lock, so waiting for the
handler while holding that lock would be waiting for a handler that is
waiting for us. Nothing is held at that point, and both callers,
rocket_job_timedout() and rocket_reset_work(), run in process context,
so sleeping there is allowed.

This does not stop a handler that has already read in_flight_job from
finishing its work on the job the reset is about to drop. That window
needs the check and the register writes to be one step under the lock,
which is what the previous patch does; the two are complementary.

Suggested-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 drivers/accel/rocket/rocket_job.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index 5f0f9682e..d484a3a6f 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -377,9 +377,17 @@ rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
 	drm_sched_stop(&core->sched, bad);
 
 	/*
-	 * Remaining interrupts have been handled, but we might still have
-	 * stuck jobs. Let's make sure the PM counters stay balanced by
-	 * manually calling pm_runtime_put_noidle().
+	 * drm_sched_stop() returns without waiting for a threaded handler that
+	 * is already running, so wait for one here. This has to stay outside
+	 * job_lock: the handler takes that lock, so waiting for it while
+	 * holding it would deadlock instead of fencing anything.
+	 */
+	synchronize_irq(core->irq);
+
+	/*
+	 * No handler is running now, but we might still have stuck jobs. Let's
+	 * make sure the PM counters stay balanced by manually calling
+	 * pm_runtime_put_noidle().
 	 */
 	scoped_guard(mutex, &core->job_lock) {
 		if (core->in_flight_job)
-- 
2.43.0


