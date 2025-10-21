Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86238CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 09:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ppnt0OlEIaNzdb3Blav7C61dJg2ocwL5Jom+3yWiQJQ=; b=VlO3GePqZxXvOd/bN1xMLNUmzl
	sWvci3TpBfgrHh6hYkIKlPAL4jfQbfQ2CJmQoj/Ub+j0hxrgQptPFiWQX9zBuaZJzbCNdJU2Mfyo8
	g+hdQbUgZ7ttJuy1+Td2YaO50nx/6YvfNF0U2EaNaxprAR/FdiXm3QmXncK+mFE2Vcfj4g6/Ep3Z2
	KNEnDs5shte2CC58w9PEA6WS0Z6WauaV26ypGWhItoqgYnQt+QmIPcTSk+NL4oPWTfh/wm7wlOlmE
	HpsXL99vNwCDf8RgLGG1okJsTa0ootW3nbVXoUGlHYKU1u9hxjJNXR1tJ3QdSEnnioXKCswHf+z8q
	/7o3+S1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8Kg-0000000GOYE-3wUh;
	Tue, 21 Oct 2025 09:07:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8Kd-0000000GOXb-3NJq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 09:07:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 552D11063;
	Tue, 21 Oct 2025 02:06:55 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30B673F66E;
	Tue, 21 Oct 2025 02:07:02 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:06:59 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, <arm-scmi@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/8] firmware: arm_scmi: Extend transport driver macro to
 support ACPI
Message-ID: <20251021-caped-cherry-millipede-af7fee@sudeepholla>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
 <20251017-acpi_scmi_pcc-v1-2-0adbab7709d9@arm.com>
 <20251020181106.0000724f@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020181106.0000724f@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_020703_877442_00EAFBA5 
X-CRM114-Status: GOOD (  12.66  )
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

On Mon, Oct 20, 2025 at 06:11:06PM +0100, Jonathan Cameron wrote:
> On Fri, 17 Oct 2025 14:23:45 +0100
> Sudeep Holla <sudeep.holla@arm.com> wrote:
> 
> > Extend the SCMI transport driver helper to also support ACPI-based
> > systems. Introduce an internal helper macro that accepts both OF and
> > ACPI match tables, and expose two wrappers:
> > 
> >   - DEFINE_SCMI_TRANSPORT_DRIVER(...)      -> DT/OF wrapper (unchanged ABI)
> >   - DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(...) -> ACPI wrapper
> > 
> > For ACPI, the generated platform_driver now sets .acpi_match_table via
> > ACPI_PTR() so that builds without CONFIG_ACPI remain safe (becomes NULL).
> In general it doesn't normally matter if ACPI_PTR() isn't used.
> 
> What specifically is this preventing?  If CONFIG_ACPI isn't set then we'll never
> use those paths anyway.  Using ACPI_PTR() tends to need ifdef magic or
> __maybe_unused markings that are rarely worth the effort for these tiny
> tables.
> 

You are right, my bad. I had assumed acpi_device_id is defined only when
CONFIG_ACPI=y which clearly is not the case. I will update the last patch
and this commit message accordingly.

-- 
Regards,
Sudeep

