Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2163DCEE33C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZoRqBKBvDLqf9D9TX1b0psMmM5R6ahmWiNt9SX3H4Q=; b=mU8XjntfbnSYPqGq5awBwDn3tc
	KN+JjRdhoT8yVRmn8CQTNle6gSZzrfVYtsFigOIRqIezpBusIeL6IPUSzLQwvZPVywUs3hLezBZLl
	irtudPHACBW+UrVCBxpmkElFZz0reTzFu13Endipy6EqsysflG2yLnjEQHG9Q/ePRLtW4g1qhI3DW
	pGHBnBwc+Y8MQNciUtOVnB3k3PCNyydmDThr9cooyosiiiyZ2jcbYwQYXL07Lowt/epbhgCGAnu4T
	aVqAIwdnc43rrxhk94ybHD4fXN2EHYoqZ7DU/yz3q+maRqI4IDsg6yA2YTPlyhjWK0qFGbundsO6/
	G3JnKvRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOq4-00000000mE6-2SDb;
	Tue, 18 Nov 2025 16:45:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOq1-00000000mCv-3MzM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:45:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02446497;
	Tue, 18 Nov 2025 08:45:44 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 392483F740;
	Tue, 18 Nov 2025 08:45:46 -0800 (PST)
Date: Tue, 18 Nov 2025 16:45:43 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com,
	amitsinght@marvell.com, baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
	carl@os.amperecomputing.com, dakr@kernel.org, dave.martin@arm.com,
	david@redhat.com, dfustini@baylibre.com, fenghuay@nvidia.com,
	gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
	jeremy.linton@arm.com, jonathan.cameron@huawei.com,
	kobak@nvidia.com, lcherian@marvell.com, lenb@kernel.org,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, lpieralisi@kernel.org,
	peternewman@google.com, quic_jiles@quicinc.com, robh@kernel.org,
	rohit.mathew@arm.com, scott@os.amperecomputing.com,
	sdonthineni@nvidia.com, sudeep.holla@arm.com,
	tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zeng Heng <zengheng4@huawei.com>
Subject: Re: [PATCH v5 08/34] ACPI: Define acpi_put_table cleanup handler and
 acpi_get_table_ret() helper
Message-ID: <aRyit16Mrth-jjjg@arm.com>
References: <20251117170014.4113754-1-ben.horgan@arm.com>
 <20251117170014.4113754-9-ben.horgan@arm.com>
 <CAJZ5v0hAPoE96C7=ynR=Ex4huPP3b896sBRNdBiLe=3Q9vKwHQ@mail.gmail.com>
 <aRybF5PV_N2ODeiZ@arm.com>
 <CAJZ5v0jA5vWi3JFRcCMFmvpWSu8jFT-jOWvSNLt59FeqKEk3iA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0jA5vWi3JFRcCMFmvpWSu8jFT-jOWvSNLt59FeqKEk3iA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_084553_882673_BFBCF81B 
X-CRM114-Status: GOOD (  15.05  )
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

On Tue, Nov 18, 2025 at 05:21:07PM +0100, Rafael J. Wysocki wrote:
> Hi Catalin,
> 
> On Tue, Nov 18, 2025 at 5:13 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
> >
> > Hi Rafael,
> >
> > On Mon, Nov 17, 2025 at 08:46:52PM +0100, Rafael J. Wysocki wrote:
> > > On Mon, Nov 17, 2025 at 6:01 PM Ben Horgan <ben.horgan@arm.com> wrote:
> > > > +static inline struct acpi_table_header *acpi_get_table_ret(char *signature, u32 instance)
> > >
> > > Maybe call this acpi_get_table_pointer() ?
> >
> > Would you have time to look at the other ACPI patches in the series? If
> > you are ok with them, happy to go in via the arm64 tree? Or we can put
> > them on a common branch if there are conflicts with your tree.
> 
> I think that this is the only one touching ACPI code outside the MPAM
> and PPTT parsers, and the other patches in the series are fine with
> me.
> 
> Please feel free to take the entire lot.

Thanks!

-- 
Catalin

