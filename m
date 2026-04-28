Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3385CFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+GIe709ABpWxrmLIdTscxK7CBfN6QUNa09LbdQB73M=; b=LSAHd1SoybVWsztXaI0Svo+khW
	kTuDjxcnxYGZueduzVhljGjchpFKunXfSkRQFx8uNaq3VtIx/Cs3Krrx+6RY0mTHqW1iDKjHXD3uj
	TTH3uc/cqeM1CVU9q1Bh2bZYAYJl5xMeU7k/MxuRRP2DSBZZMsMGWLIa8QkT+aHKAmpKcDFdumEAd
	JwusbyRKV8Dkt+yVhYn3qt7sNn0cu1hfFgPP5ocB+Axp8pvdt8uJ+2Ibcxeny5jFW5Tt07bRwhevm
	jT1ZOjvYJONN3kGeh9FL+CF/OpSs46rD6bdNHvi/TsP9wXnD9gNYz1DzzXai6ENPYu725SdK5LATN
	EvFWS3NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHos4-00000002Piy-2OsP;
	Tue, 28 Apr 2026 20:17:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHorp-00000002PPA-2Vkx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 20:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=o+GIe709ABpWxrmLIdTscxK7CBfN6QUNa09LbdQB73M=; b=H7RmZu9ihbgLpmJT6kWhXdLkj3
	OzbmGfnXUcZAnh+/U/Ns3ym+MJXN8Gtli6vL6NhaCbkW4me7hUsk0ErIL2gUM6irwSH9GuXphdZB8
	2TOSZzu/vSwu2Nz7q5gjL3qf5i6EXftRi3lFFkVKPCnuWfbEOJfYnDnd1fA7m46FcQbPu8chVvhL/
	hCbGCogbulxptiWWQHMHqrT/DEp0uZwSwbjhNPn5KYl8USQm9g10bxOvzyHpQN+wzCdsAGgbqdUC3
	8HN7+iOdxWokDNG/18qIrNPLXJ2F4AwS89TFRy3qc6AZ5Mq6Yh4c8nmhiQ/Gzo4KRgg9r4KTqu3z2
	rgsBMT9Q==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHorl-00000004Osl-2xFx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:17:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BE141C01;
	Tue, 28 Apr 2026 13:17:02 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD3A73F763;
	Tue, 28 Apr 2026 13:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777407427; bh=OwrS1tuzfQVio2IobCkB91DzRSW/Wbs2qREjyQ2A8Gw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hC7y1OJtFYOyBrZ3QxB/oKhe66SRPsjFysNW3FB3RH9ix6nRQYuECZZaUpiDiPKFT
	 ILX2W8l/AZwvC0v7bNVGWJUedNa6l2l64S4OwZXfakHw2ekX9SW9My2Tsp2ErPAsw+
	 qLPgszOcxsi3nP9PUWRxh11L5x3MhsKbuPLKRDZw=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v3 11/15] firmware: arm_scmi: Fix bound iterators returning too many items
Date: Tue, 28 Apr 2026 21:15:18 +0100
Message-ID: <20260428201522.903875-12-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428201522.903875-1-cristian.marussi@arm.com>
References: <20260428201522.903875-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_211710_317491_5945AD5B 
X-CRM114-Status: GOOD (  16.00  )
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

From: Geert Uytterhoeven <geert+renesas@glider.be>

When using a bound-iterator with an upper bound, commands are sent, and
responses are received, until the upper bound is reached.  However, it
is up to the SCMI provider implementation to decide how many rates are
returned in response to a single CLOCK_DESCRIBE_RATES command.  If the
last response contains rates beyond the specified upper bound, they are
still passed up for further processing.  This may lead to buffer
overflows in unprepared callsites.

While the imprecise bound handling may have been intentional (it was
mentioned in the commit message introducing the code), it is still
confusing for users, and may cause hard to debug crashes.  Fix this by
strictly enforcing the upper bound.

Note that this may cause an increase in the number of
CLOCK_DESCRIBE_RATES commands issued, as retrieving the last rate may no
longer be done inadvertentently, but require its own command.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
[Cristian: removed Fixed tag referring the same series]
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index cb4865fd8af2..fd031a8d40df 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1820,6 +1820,7 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 	const struct scmi_protocol_handle *ph;
 	struct scmi_iterator_state *st;
 	struct scmi_iterator *i;
+	unsigned int n;
 
 	if (!iter)
 		return -EINVAL;
@@ -1852,13 +1853,17 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 			return -EINVAL;
 		}
 
-		for (st->loop_idx = 0; st->loop_idx < st->num_returned; st->loop_idx++) {
+		if (end)
+			n = min(st->num_returned, *end - st->desc_index + 1);
+		else
+			n = st->num_returned;
+		for (st->loop_idx = 0; st->loop_idx < n; st->loop_idx++) {
 			ret = iops->process_response(ph, i->resp, st, i->priv);
 			if (ret)
 				return ret;
 		}
 
-		st->desc_index += st->num_returned;
+		st->desc_index += n;
 		ph->xops->reset_rx_to_maxsz(ph, i->t);
 		/*
 		 * check for both returned and remaining to avoid infinite
-- 
2.53.0


