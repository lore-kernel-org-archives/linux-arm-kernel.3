Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664B1FF886C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 22:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDszigLPzrCmiRsGBatYg938R5Tj3XnM2EmWZ0cNUiw=; b=TiZHx2AiLvxJ6KEiT/ALs3VJVH
	TtBzMO4ETMlzeJ4Q60nfFazknyFwzfkgn9KgiiI18NK03guy5ccs60Z3zBV0aQzTLZ3YriUVL/YUi
	C0jpcItqWuBSJ5bOwIyyP5Cw5mZcIzCop81eGMXgbfT0tt6c/OBbitm15uVfGKkegA07wC8wuCSgS
	W0xpFZmP7fcOLM0Mdrj8dIgkh9ZXfkqsWvH6lTQrdD4DoH+R9wf6zMgMXVu250ph2iRHBIYocANyP
	XGRmAtXR31DsousPi6/SQ+12d7FKPUugH+SsJr0L3Kd3PnX14yga0PsJQnlBMw9f5MMOO6i6AlgZi
	yCNDt5Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHqnv-00000002YwC-1RWm;
	Tue, 28 Apr 2026 22:21:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHqns-00000002Yvo-23PT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 22:21:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6277C1650;
	Tue, 28 Apr 2026 15:21:08 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7833F3F763;
	Tue, 28 Apr 2026 15:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777414873; bh=0oXuZXWwTkgdhqDH8uG96AOPYmMlsgWr1XRmX4V3t88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eIi55or15uZzRwFD8tshHMcSkHBRaNquAsw7E3sqdnb2b4dwEP5+wIufVG1JsM2LO
	 7+ZBJ3l3IkDkZzvWYdyd7zUlWWOiu+skJJhCqa7Gy/9ktfeh641NJeHxXvL/Fs0hu/
	 OzEoIf8GeLzHFH30PSiOSCKBXY5nwdF3pEsJTjh4=
Date: Tue, 28 Apr 2026 23:20:57 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 03/15] clk: scmi: Use new determine_rate clock
 operation
Message-ID: <afEyuvQx6KRq0WXT@pluto>
References: <20260428201522.903875-1-cristian.marussi@arm.com>
 <20260428201522.903875-4-cristian.marussi@arm.com>
 <afEZotnIZYXEtMiC@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afEZotnIZYXEtMiC@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_152116_665230_8C426AFC 
X-CRM114-Status: GOOD (  18.72  )
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

On Tue, Apr 28, 2026 at 04:33:38PM -0400, Brian Masney wrote:
> Hi Cristian,
> 
> On Tue, Apr 28, 2026 at 09:15:10PM +0100, Cristian Marussi wrote:
> > Use the Clock protocol layer determine_rate logic to calculate the closest
> > rate that can be supported by a specific clock.
> > 
> > No functional change.
> > 
> > Cc: Brian Masney <bmasney@redhat.com>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: linux-clk@vger.kernel.org
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > @brian: I'd modify further this clk-scmi driver, with a patch on top of
> > this series, to properly use your new CLK_ROUNDING_NOOP flag once your
> > series AND another (already reviewed) series on clk-scmi from Peng are in.

Hi Brian,

> 
> I don't know if Stephen is going to pick up my CLK_ROUNDING_NOOP series.
> We talked about it in person at LPC in Tokyo, and he was the one that
> suggested the flag rather than a new shared noop function. However he
> didn't pick it up last development cycle.
> 
> I would recommend NOT basing on that series of mine to reduce
> dependencies, and so that your stuff doesn't get held up by series.
> 

Ok, thanks for the heads up, I was indeed not able to find the _NOOP in
v7.1-rc1 and I was NOT sure...anyway a patch on top of this whenever
your series goes in should not be a problem....maybe if you can ping me
when it's merged, it would be easy NOT to miss/forget :P

Thanks,
Cristian

