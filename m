Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC25E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03fGmmTHeLYs46d2GJk6NpttT2VGDhBI33NEAkwy9JQ=; b=hCehJGggj8XIwCz8oAckP7z7an
	fkQ7rHxyWYRMOh+6h9OuwJuVBXjlVjqP7FbB2KaHaQRsv+N35fgH3u5rYMahZjAgzEMTr1Ry8L4UI
	liVeKVEyZ5D/arQGbw6YzMvfLBNh2iJQvl8MAvJi2X6Wvmtk/TD5wxwx0UGD/U3ZLB5ikvY0vqZ/O
	UN+21vjC38blm4kDaM1e3K97rGZG5bvX15luvi44eIemwciZ0T/JcDqvdrYF/YCDBziFSFz+5kMbx
	8Kng0E+jzpy8wjf/kYg2qZ6wEKx19CSg4h2K3OqOfdGTn1TCLea0j32lzPkqX8QRRtlh9xclRyoA3
	MZD/7aMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbJO-00000007N9N-45WV;
	Mon, 09 Dec 2024 10:48:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbHs-00000007Mid-1wse
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 10:46:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEC04113E;
	Mon,  9 Dec 2024 02:47:15 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B09D03F720;
	Mon,  9 Dec 2024 02:46:46 -0800 (PST)
Date: Mon, 9 Dec 2024 10:46:44 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Etienne Carriere <etienne.carriere@foss.st.com>
Cc: <linux-kernel@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] firmware: arm_scmi: round rate bisecting in
 discrete rates
Message-ID: <Z1bKlOeHJFHpe9ZU@bogus>
References: <20241203173908.3148794-1-etienne.carriere@foss.st.com>
 <20241203173908.3148794-3-etienne.carriere@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203173908.3148794-3-etienne.carriere@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_024648_544624_7422B8C4 
X-CRM114-Status: GOOD (  20.60  )
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

On Tue, Dec 03, 2024 at 06:39:08PM +0100, Etienne Carriere wrote:
> Implement clock round_rate operation for SCMI clocks that describe a
> discrete rates list. Bisect into the supported rates when using SCMI
> message CLOCK_DESCRIBE_RATES to optimize SCMI communication transfers.

Let me stop here and try to understand the requirement here. So you do
communicate with the firmware to arrive at this round_rate ? Does the
list of discreet clock rates changes at the run-time that enables the
need for it. Or will the initial list just include max and min ?

> Parse the rate list array when the target rate fit in the bounds
> of the command response for simplicity.
>

I don't understand what you mean by this.

> If so some reason the sequence fails or if the SCMI driver has no
> round_rate SCMI clock handler, then fallback to the legacy strategy that
> returned the target rate value.
>

Hmm, so we perform some extra dance but we are okay to fallback to default.
I am more confused.

> Operation handle scmi_clk_determine_rate() is change to get the effective
> supported rounded rate when there is no clock re-parenting operation
> supported. Otherwise, preserve the implementation that assumed any
> clock rate could be obtained.
>

OK, no I think I am getting some idea. Is this case where the parent has
changed and the describe rates can give a different result at run-time.

I need to re-read the part of the spec, but we may need some clarity so
that this implementation is not vendor specific. I am yet to understand this
fully. I just need to make sure spec covers this aspect and anything we
add here is generic solution.

I would like to avoid this extra query if not required which you seem to
have made an attempt but I just want to be thorough and make sure that's
what we need w.r.t the specification.

-- 
Regards,
Sudeep

