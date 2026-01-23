Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D725BD72350
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 08:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mbMLxmiYobP/b8FdV9Pv7yVBEhxjQ794uSO1d9WVoE=; b=zHibSb/yhuuAgXT/au5KpyINn3
	KyzDfg+l5/6MiJAHrgpT1H/RuFHJUQZKlSJTF9azOHxYwc2P1xsBlkii4lYQNwrfA3lL99+SsnUcj
	UfVGjD1nuhIHyfevG1bm9Su9+JIRySpoqY4ZRJGrkyXOJ69VgAG6lmWoH3//u69Nit3OwfOTxPUZV
	3fL2/GnsYH2IwOvJzA8qo6f6BxsV50OctViddLOmnOtz69uo5OZRwnM6IZFMq0pIn4Y5YPSPkKdz5
	AXY1WuFFq7d+6H++xfVX6W2EcNA0CcfIeDruAd9hew1/+AvYe/QTyNU+SUjByqc2H7N7kjqFyJcxr
	Tk/phHTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCkX-00000008UwX-2clY;
	Fri, 23 Jan 2026 08:42:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCkW-00000008Uw1-1p2h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 08:42:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C0F360010;
	Fri, 23 Jan 2026 08:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED97CC4CEF1;
	Fri, 23 Jan 2026 08:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769157755;
	bh=S/zXxDEYmCUkDscKgbWaYUEDm0jge4sk1pPwprWhnbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dOga/W/mDRkFC6X9CJ0Qbt/kQOExGTnEQQibfgW1GLSexg5OeqDhJML8FE0IKLTSX
	 6lvobBcB+PepvPcoVO9JQ9Y453OzTJpkEP0rHmtxKbO1HTva4fmV7SQAV4hsSr8Ld4
	 akRsQGML8xCDbnrGyFQ3T3RCop/s2ap29sHDD/BLyFjXridmr4q0Kg2W0OkNVN3xbq
	 ufF2jS9hnvZ2HmehQSk131jzS+sPzfhkeEKaYccwo6Srq6NoO45wiLaIVJ1GfzHb45
	 h97opOnbERX31UuZ3GeIAXoqV1/IoN7EB9GkP5fN/7IsIa6spdsTVv170XcaIKaBIt
	 gaLigMDagTDFw==
Date: Fri, 23 Jan 2026 09:42:29 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Robert Moore <robert.moore@intel.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 0/6] irqchip/gic-v5: Code first ACPI boot support
Message-ID: <aXM0dVthp33yUqj8@lpieralisi>
References: <20260115-gicv5-host-acpi-v3-0-c13a9a150388@kernel.org>
 <aWy9T3VDyXpVG41z@lpieralisi>
 <87sec30yhk.ffs@tglx>
 <aW3pALPxn4i9fiDO@lpieralisi>
 <87pl751zeh.ffs@tglx>
 <aW9V4A7lTGZWTO9e@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW9V4A7lTGZWTO9e@lpieralisi>
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

On Tue, Jan 20, 2026 at 11:16:00AM +0100, Lorenzo Pieralisi wrote:
> On Mon, Jan 19, 2026 at 02:54:14PM +0100, Thomas Gleixner wrote:
> > On Mon, Jan 19 2026 at 09:19, Lorenzo Pieralisi wrote:
> > > On Sun, Jan 18, 2026 at 03:47:03PM +0100, Thomas Gleixner wrote:
> > > I think the simplest way to sort this out is for this series to go via
> > > the ACPI tree if that's OK for Thomas, given that the ACPICA code will
> > > go via the ACPI tree anyway and there are other dependencies on it there
> > > I assume (this series is fairly self-contained).
> > 
> > I'm fine with that
> > 
> > Acked-by: Thomas Gleixner <tglx@kernel.org>
> 
> Thank you Thomas, Rafael I hope that works for you too, please let me know
> if there is anything I can/should do.

Hi Rafael,

forgive me for another ping, can you please let me know whether you can pull
this series on top of acpica changes for v7.0 or it needs to take a different
route ?

Thanks a lot,
Lorenzo

