Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A463FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrs1rYdnZiXhMMrLY3jYIM0XoLk9RBUxWu4w+ShJe2Y=; b=ItbYEOTqGyHJHrRUibTAJBi25w
	8V6SbjVKXhCtFvO2ndYgArvQoaN+yRIs4OicrmjFX7q+HvvmZwVQ18hsa4+FnMYUJq3iP6VTsr2qk
	c9iCZevPVRfEFgsYzWJ/u1a+qUmD8evqoLwkBWXFMC+2WWE94kfbtpsBDAel42tEB8bEbwMr/h/fD
	R+KWBL311wL5oMEkzb2QtAqj2aiZktvMUQMht+IJaJEPLEr168oGdm6VAtSZzBoQDo/HoZeN8dOdb
	1dMoSA9Nhx3lYuoKGynCa1eS9NX/UFjwcWOLy7jP5AZ5+dLuryJdhE7IuCpBmVnB359xDORgG672n
	ej9iWopA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHosR-00000002Q8I-30Aj;
	Tue, 28 Apr 2026 20:17:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHos1-00000002Pev-34lz
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 20:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nrs1rYdnZiXhMMrLY3jYIM0XoLk9RBUxWu4w+ShJe2Y=; b=ekjNhx8LtOFuQsEfDrEXzcj8v/
	gBsBI2wJTu2FrzU99eW9G43K5ulyr6FTJwv8X+m/skriCx9GgV1/pGeSr0nUCsu3Ys4wKkoV811bR
	U5oeerpFE7Y1JXIn4FIVo/MPuXJV5o07Eq7IaUs4TQF3JDlo82v4LXrNom4Ykrj2k/vNyOf+qzPM7
	YXsJKjCDTxHki4UQP9IsmAS+Fr4FipE4Nq8RoFirklD2EcRktTHVmTaZNu6oNAoVlzMPYdm6R+c7D
	GF3rnz2kB9NOxcoLhMR0M+9+V4po6l/pJAFGqacTw56NrfZOfKZxiT/T3Icvyt7iFk1lUmSMeIQ5+
	JL6ZxlbQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHorv-000000040kq-3cMA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:17:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C97883295;
	Tue, 28 Apr 2026 13:17:11 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FD003F763;
	Tue, 28 Apr 2026 13:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777407437; bh=Va/JAFXv1Mv8JmjPvWUiIYbL1IHuJCCIZgDN7C5J2qI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KgbOa5J/xsBO8ib08nnLCnge8bFbCShJQPMq2C2+Bp5vODcd8uUAeeY2acVLel5w0
	 IVlaAyHz6Y+0oPoFqAn9DdPFdaLy0JJbQIvou8t2u5+231tBX0QrqoKFaLAKIM4VC+
	 bXWNSYTpxA07yaa/J/Jog2uovYiy04oEYLOz+CXs=
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
Subject: [PATCH v3 14/15] firmware: arm_scmi: Fix OOB in scmi_clock_describe_rates_get_lazy()
Date: Tue, 28 Apr 2026 21:15:21 +0100
Message-ID: <20260428201522.903875-15-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428201522.903875-1-cristian.marussi@arm.com>
References: <20260428201522.903875-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_211720_637995_B3656170 
X-CRM114-Status: GOOD (  15.55  )
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

Lazy discovery of discrete rates works as follows:
  A. Grab the first three rates,
  B. Grab the last rate, if there are more than three rates.

It is up to the SCMI provider implementation to decide how many rates
are returned in response to a single CLOCK_DESCRIBE_RATES command.  Each
rate received is stored in the scmi_clock_rates.rates[] array, and
.num_rates is updated accordingly.

When more than 3 rates have been received after step A, the last rate
may have been received already, and stored in scmi_clock_rates.rates[]
(which has space for scmi_clock_desc.tot_rates entries).  Hence grabbing
the last rate again will store it a second time, beyond the end of the
array.

Fix this by only grabbing the last rate when we don't already have it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
[Cristian: removed Fixed tag referring the same series]
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/clock.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 15a963b1edb9..ba25a9c6d3ae 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -582,15 +582,18 @@ scmi_clock_describe_rates_get_lazy(const struct scmi_protocol_handle *ph,
 	if (ret)
 		goto out;
 
-	/* If discrete grab the last value, which should be the max */
-	if (clkd->rate_discrete && clkd->tot_rates > 3) {
+	/*
+	 * If discrete and we don't already have it, grab the last value, which
+	 * should be the max
+	 */
+	if (clkd->rate_discrete && clkd->tot_rates > clkd->num_rates) {
 		first = clkd->tot_rates - 1;
 		last = clkd->tot_rates - 1;
 		ret = ph->hops->iter_response_run_bound(iter, &first, &last);
 	}
 
 out:
-	ph->hops->iter_response_cleanup(iter);
+	ph->hops->iter_response_bound_cleanup(iter);
 
 	return ret;
 }
-- 
2.53.0


