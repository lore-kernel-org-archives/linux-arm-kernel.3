Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282C5C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 06:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXv4IxxEbHPHAcPBEFdWySsOK6uC1B7IUvoRJiHV6GA=; b=vUzYxsUyCfrVFtXBDyXjdsIAVs
	Z8Zus6ysLzPPhPL3vHPSOgKrPFdUPo6DfuB2vcfXje1aUFZYPfmSD3Q40rTDPClvQJYSxkafQMeF6
	SGybneIOYxN4t72l1mkACAIzIdarJZoig+q0cTysHprbXP/BQ9sbwwpdf+AXsCU+JOf7wfgwx2cYa
	8qPgj/pxQ6KHI0B6tS2whHiO/GRNSTRZCXFPla6jRxhgpE17xItsnEoOiwFO+nXVu09yw1tpnOctI
	2IR8Wkc5bs7+jz1Nj5FxUlmVhiHgXtE3+UGPqbnGtqKhKuMwTOvz8fmlQ2mieY5m5nr9VjncEx0gp
	OZrYnV7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x216u-0000000GV80-0RYm;
	Thu, 03 Sep 2026 06:39:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x216t-0000000GV7p-1m1J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 06:39:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D9FB2600D4;
	Thu,  3 Sep 2026 06:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DCE1F000E9;
	Thu,  3 Sep 2026 06:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788417582;
	bh=kXv4IxxEbHPHAcPBEFdWySsOK6uC1B7IUvoRJiHV6GA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QfTlUyFpyhrRbkP8tt8HJT/DQYi19QkPHq5dG2NXBoMfbpe52tebDtxf0F4Zc/T7m
	 9dkzMP25g4SPnFujXFPxci9xCsppNc1Jfe5XLew9LiCs1xeFeOsUjFIrUWtKRvJY3+
	 rLp8xYuKL4NH3q58AFg6adaoSiuKrCIQuA70XKFHpq+N7aCX/RdBeC64/e2AM6D5Oh
	 pZLN8OzftMQyvtL7OAJu2wpxBJ7skU6mNGcaJZvR8feT5HUxPEeTdN9qKdru/cQ9N9
	 Ok7MpJPfaKjze64qbohx4JsTGUCGk3PVfz0CZk7cYkRiIbnwinl8b2pTrqgHDj65Yj
	 JjI6qkR2jMC9Q==
Date: Thu, 3 Sep 2026 07:39:39 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 9/9] firmware: arm_scmi: Validate PCC shared memory
 signature
Message-ID: <20260903-spiked-undetectable-toucanet-ae8854@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-9-cb6b88b4ebb3@kernel.org>
 <20260824132450.000045ca@oss.qualcomm.com>
 <20260902-miniature-bullfinch-of-agreement-4e15fd@sudeepholla>
 <20260902163110.000054cc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902163110.000054cc@oss.qualcomm.com>
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

On Wed, Sep 02, 2026 at 04:31:10PM -0700, Jonathan Cameron wrote:
> On Wed, 2 Sep 2026 09:25:19 +0100
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > On Mon, Aug 24, 2026 at 01:24:50PM -0700, Jonathan Cameron wrote:
> > > On Thu, 13 Aug 2026 12:33:04 +0100
> > > Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > >   
> > > > Validate the PCC shared memory signature when setting up an SCMI PCC
> > > > channel.
> > > > 
> > > > Reject channels whose shared memory signature does not encode
> > > > PCC_SIGNATURE combined with the PCC subspace ID, so misconfigured
> > > > firmware is caught before the transport starts using the shared memory
> > > > region.
> > > > 
> > > > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>  
> > > Interesting there aren't more checks on this in the various PCC users.
> > > Question for another day perhaps.
> > >   
> > 
> > Tried cleaning up all but some platforms like Hisilicon kunpeng complained
> > it will break their platforms. So added a warning in the core but I want
> > to enforce stricter check here for SCMI PCC.
> 
> Fair enough.  I'd be tempted to check in core and add a quirks list
> for those broken platforms but meh, not my problem ;)
> 

Yes that is a possibility. One step at a time, lets keep warning for some
time and then handle broken systems as quirks. The warning is already in
place.

-- 
Regards,
Sudeep

