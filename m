Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DCECD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yv5kCvYpqQ7d4QXjfHR8LoKcIwhaCkOEo6P+WKJtKvs=; b=3z3wigDlU7RsEJxyjuwnM9XfpM
	Wl1SasGsVQ2n/qENGuZo22UGDxIaC+WTuO4HguVM6Y9EI7mBr2Td3DUahEubO13JspnrEUHOjjSnK
	BSGw2NK3O5Gyk4sK5RT5kVK7+h5wsda+b7RKVkPJAtz5hcX+fw1EAms196wkmUC04EZrNTWAbdUkw
	ATHzHBd9g3rIeuHWPp8jV7spsf3SEE0aXXiwYT4HHcAmI28fLoZgqZ4Z004lJlAB587+Y9Y2L5KkA
	Wn1DltHa1QP4RgZo2dRZBa8OVdSvIDg23yFv6HYQNSvV1CIZ0og+xaecY8eZ9UmvEbKiBWVM8ZtvN
	Yjw89hWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMON7-0000000DCqv-3Or6;
	Mon, 11 May 2026 11:00:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMON5-0000000DCqH-1DBI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:00:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F69216F8;
	Mon, 11 May 2026 04:00:14 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 794653F836;
	Mon, 11 May 2026 04:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497219; bh=voSZcpcyiSDS3a/reXV/K0I/01RfqWCIKc4QVo8qHck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWKADNI07WVf8A2b1p6AnfwABXZ5IAyYR6C6rzl+s6/fUh/FcO0d9Q76KrGL3JnLO
	 LPtwmwejFNKqIFbStehlE8TRZO1LuTrI3NDglR5MR+GGaS1TwuREJmxHWCxTONCzTN
	 mG8sBhQYqlQ6mp8nmR7mzflzIYx3q3mIUTiNfTds=
Date: Mon, 11 May 2026 12:00:08 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v4 00/15] SCMI Clock rates discovery rework
Message-ID: <agG2uPsoDZOfEgWX@pluto>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
 <CAMuHMdXyJcmL1k+odRC3ej1fx2oH_Li3RjniXuqXyJUMpBo7CA@mail.gmail.com>
 <20260511-origami-ape-of-inspiration-7b55f3@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-origami-ape-of-inspiration-7b55f3@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_040023_364125_A9434EE5 
X-CRM114-Status: GOOD (  16.94  )
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

On Mon, May 11, 2026 at 09:09:40AM +0100, Sudeep Holla wrote:
> On Fri, May 08, 2026 at 07:25:49PM +0200, Geert Uytterhoeven wrote:
> > Hi Cristian,
> > 
> > On Fri, 8 May 2026 at 17:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > it was a known limitation, in the SCMI Clock protocol support, the lack of
> > > dynamic allocation around per-clock rates discovery: fixed size statically
> > > per-clock rates arrays did not scale and was increasingly a waste of memory
> > > (see [1]).
> > 
> > [...]
> > 
> > > v3 -->v4
> > >  - Rebased on v7.1-rc2
> > >  - Removed unused info.rate_discrete [Geert]
> > >  - Made dev_dbg() more meaningful by printing tot_rates [Geert]
> > >  - Fixed build bisectability by renaming properly to iter_response_bound_cleanup()
> > 
> > Thanks for the update!
> > 
> > I believe you still have a possible runtime bisectability issue
> > between "[PATCH v4 04/15] firmware: arm_scmi: Simplify clock
> > rates exposed interface" and "[PATCH v4 05/15] clk: scmi: Use new
> > simplified per-clock rate properties": 04/15 removes the last setter
> > of scmi_clock_info.rate_discrete, before 05/15 removes the last getter.
> > 
> 
> I have fixed this up by adding some initialisation in 04/15 and removing it
> in 06/15. Cristian, if possible can you check if the functionality will
> remain intact after 05/15 ?

LGTM.

Thanks,
Cristian

