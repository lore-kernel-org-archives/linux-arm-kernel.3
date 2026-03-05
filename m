Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6D1F33A8B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 15:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4f3ymvbCLqgGdyzBmhaz++3ENK/U2JPVOpkAsotXB0=; b=WbeIctaiOpxpV6RwoyeL3XaMG4
	e1T9I/bsgpOBnAbNy/sTtINYL/te9mjdTgp57umGpIvQH+wwAbH3q/LDBCJQ2cf2Wb7VNM5E1zbl3
	4oLZb/1iP+mD9xUtWe7/9e4kDTyyWNY5F0EoKHHmMMZMq5CDPXKvHVfeVDCShLAJ/lSM30hLzUESN
	yOcbo3erqp4uRS2cxBmgurAi4KT1YGf7XboR2pEhQPNmyeEriFvPd/3mNMRjdDVYCO74Y8WLlzL6Y
	wDjQu40YBUEZ8JiC/BymJqh09hk1hokhc4UMUmUULAQmJzX7DgOlE3CSnB3DEot1Qm0SFT37LAlNR
	IoX/KDcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAS3-000000026G6-3RPG;
	Thu, 05 Mar 2026 15:17:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAS0-000000026FT-3wzu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 15:17:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B834E339;
	Thu,  5 Mar 2026 07:17:12 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DE0A3F73B;
	Thu,  5 Mar 2026 07:17:16 -0800 (PST)
Date: Thu, 5 Mar 2026 15:16:54 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com
Subject: Re: [PATCH] firmware: arm_scmi: Fix NULL dereference on notify error
 path
Message-ID: <aameZunhUGIn7xoK@pluto>
References: <20260305131011.541444-1-cristian.marussi@arm.com>
 <aamcu-f14DZNJzw5@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aamcu-f14DZNJzw5@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_071721_021296_B328EF49 
X-CRM114-Status: GOOD (  16.08  )
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

On Thu, Mar 05, 2026 at 06:09:47PM +0300, Dan Carpenter wrote:
> On Thu, Mar 05, 2026 at 01:10:11PM +0000, Cristian Marussi wrote:
> > Since commit b5daf93b809d1 ("firmware: arm_scmi: Avoid notifier
> > registration for unsupported events") the call chains leading to the helper
> > __scmi_event_handler_get_ops expect an ERR_PTR to be returned on failure to
> > get an handler for the requested event key, while the current helper can
> > still return a NULL when no handler could be found or created.
> > 
> > Fix by forcing an ERR_PTR return value when the handler reference is NULL.
> > 
> > Fixes: b5daf93b809d1 ("firmware: arm_scmi: Avoid notifier registration for unsupported events")
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---

Hi Dan,

> 
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for you review.

> 
> I feel a bit bad about this.  I saw this as a Smatch warning last August
> but I somehow marked it as a false positive.  :/

:P

...it was tricky because the code is bit convoluted...
...indeed I posted this as a quick easy backportable fix BUT I am gonna
post soon a full rework on top of this around that function and the
whole SCMI notification core code that makes use of cleanup handlers
since they greatly simplify some of the mutexes hell around this
stuff...

Thanks,
Cristian

