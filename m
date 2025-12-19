Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E1AD767CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdm6H2YQYEZzrlujZzzvcFEFCw8dy3ybIssjYR1jN9Q=; b=d5U8UbCqqp8SPsBlBSLfdy1QML
	61gwtlG2ct1FTiQBjV1Eh5lVSrUvQkMKfLDDcVLEir5QWFWJjs2tQV/alTXdNXuOLsWN2VaVHKmJg
	8RaoHjVOaEQ7jn+Nfg0sKIxdq5zcQX5i/u288md0AwIyyNuybK0uEX+gEhaWE3ioJDv4sHjeUa2Hu
	y+FajPMH7O8r7ZVMMLjcaPu1mzco13N2iZiAlMcwsPIjHYosbNPzJ5TYaCzNev9cbpi+hkjL57BKu
	RpwyX3nPvQjAWd8aquPbD0BL2iGFzHhadNlCNt3fi7SLHQg0cirgerzFOnBjg2wmzvc7VN9hfZpYY
	ISBQTkUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXrx-0000000A7WX-0a52;
	Fri, 19 Dec 2025 10:37:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXrv-0000000A7Te-0xXK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:37:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8B24FEC;
	Fri, 19 Dec 2025 02:37:46 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7617C3F5CA;
	Fri, 19 Dec 2025 02:37:51 -0800 (PST)
Date: Fri, 19 Dec 2025 10:37:48 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vedashree Vidwans <vvidwans@nvidia.com>
Cc: <salman.nabi@arm.com>, <andre.przywara@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <lpieralisi@kernel.org>,
	<mark.rutland@arm.com>, <ardb@kernel.org>, <chao.gao@intel.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<sdonthineni@nvidia.com>, <vsethi@nvidia.com>,
	<vwadekar@nvidia.com>
Subject: Re: [RFC PATCH 1/5] firmware: smccc: LFA: use smcc 1.2
Message-ID: <20251219-thundering-striped-nightingale-db4ecf@sudeepholla>
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
 <20251208221319.1524888-2-vvidwans@nvidia.com>
 <20251209-curvy-walrus-of-wonder-dbb178@sudeepholla>
 <b8fdec67-584f-492e-b2a7-8c932871f459@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8fdec67-584f-492e-b2a7-8c932871f459@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_023755_311214_70107515 
X-CRM114-Status: GOOD (  23.39  )
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

On Fri, Dec 19, 2025 at 12:47:52AM -0800, Vedashree Vidwans wrote:
> 
> 
> On 12/9/25 03:42, Sudeep Holla wrote:
> > On Mon, Dec 08, 2025 at 10:13:11PM +0000, Vedashree Vidwans wrote:
> > > Update driver to use SMCCC 1.2+ version as mentioned in the LFA spec.
> > > 
> > 
> > I would prefer if you work with Salman Nabi and get this incorporated
> > in the original patch by providing this as a review feedback.
> > 
> > There is no point in having this independent of the original patch as it
> > is not yet merged.
> > 
> > -- 
> > Regards,
> > Sudeep
> 
> Thank you for the suggestion.
> 
> Hi Salman,
> Could we come up with a strategy to combine the LFA driver patches? I have
> been working on this recently and I would be happy to revise all the patches
> so that we are followiing the specification from the start.
> 
> Please let me know if you think of any other approach.
> 

Ideally, you should comment directly on the original submission, outlining the
specific changes you would like to see - just as you would when reviewing a
patch. This helps document your requests clearly and allows the author to
address them and post a revised version, ensuring that all changes are
properly tracked on the mailing list.

-- 
Regards,
Sudeep

