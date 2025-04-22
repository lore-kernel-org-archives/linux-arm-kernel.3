Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECF8C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 13:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfFo36yRW3bqHMJQdQ30N2iJA/qg/wr353OuB8cXQWE=; b=OkgjwnOocOiqZrjyXMG13zU/0r
	c48FPvHWNF9BttU0zmiZNQkkfXsOXWw/PCZWImnQuCvO+57gb+UA8h9W+WptCA6ycHNFpcRnRtpAx
	qeT8P/CoSyJYPTiEfZjR+qI5/Z7DG5rUv27A1anhbzBE/NdY9SrsRLmLHG2EbDDQJkVgl/AJQUI0Y
	X5ev5C91zMNLYcIsd0gB7N5Q8Z7mX0C8hzMOjYq2h3CEZmfVlUuaXg5dJ39O9jdvKb3SX00yjLp4P
	JZ2WWO2S68tX94MdcyBm7NPFocwnE+GMI5M1irbidsLEA4qQmhpaDHwhWfZvcMqcyGT37rlKC2z4Y
	uuy3YdVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Dx6-00000007MHH-1Rx3;
	Tue, 22 Apr 2025 13:46:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Cl4-000000076r1-0Rjj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 12:29:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AA8E152B;
	Tue, 22 Apr 2025 05:29:45 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAB443F66E;
	Tue, 22 Apr 2025 05:29:48 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:29:46 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v1 6/9] coresight: Disable trace bus clock properly
Message-ID: <20250422122946.GF28953@e132581.arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-7-leo.yan@arm.com>
 <89aa249c-ac1d-40e3-8518-1b5a545b28c7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89aa249c-ac1d-40e3-8518-1b5a545b28c7@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_052950_198765_9BD91CFD 
X-CRM114-Status: GOOD (  14.38  )
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

On Thu, Apr 03, 2025 at 12:55:46PM +0530, Anshuman Khandual wrote:
> 
> On 3/27/25 17:08, Leo Yan wrote:
> > Some CoreSight components have trace bus clocks 'atclk' and are enabled
> > using clk_prepare_enable().  These clocks are not disabled when modules
> > exit.
> > 
> > As atclk is optional, use devm_clk_get_optional_enabled() to manage it.
> > The benefit is the driver model layer can automatically disable and
> > release clocks.
> > 
> > Check the returned value with IS_ERR() to detect errors but leave the
> > NULL pointer case if the clock is not found.  And remove the error
> > handling codes which are no longer needed.
> > 
> > Fixes: d1839e687773 ("coresight: etm: retrieve and handle atclk")
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> 
> This patch probably should be positioned right after [PATCH 4/9] which
> replaces pclk clock init with devm_clk_get_enabled().

Sure.  Will reorder patches for this.

Thanks,
Leo

