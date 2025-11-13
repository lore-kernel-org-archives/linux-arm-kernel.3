Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FAACD5BC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 10:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KneE+CHdhKHPFQs4hczWXHtfrVUW1VO77WP+m5tj/Pw=; b=RKyHyeIOP1hMgL0VwcRYpZ1e72
	G8boEeVmKkH2HhUdbkd2vJQRMFxcu1fJcPLlJCdnVPJDjVYL1lcLhL4RCALAxJgwDh1+QhjJAjyiD
	zTMI0LFQCi5k6qhTdnzkdaFheP8DKVt6zXp2TPTGumpXW7pJ3x80Uqu7RDmvvIWql8Ac/uuWSKGY6
	/fsaUdlQP8v/0vmMzuXztLU9YJWNQg4jMrhlXMHQVvJsizAyMllhrLvOG8ijTqcIQXvkhE0uys4I9
	v0hxUm8TQsVzhaOymAwAKqG4FB67Bpc3w97rj7kbz9ML2gyg60IyC4tZwN+uOuG7cD2RnRjFmmJQ0
	LvTtggNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUvq-0000000AKHH-1xdS;
	Thu, 13 Nov 2025 10:52:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUvn-0000000AKG1-0Ym1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 10:52:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4F7412FC;
	Thu, 13 Nov 2025 02:51:48 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49EE73F66E;
	Thu, 13 Nov 2025 02:51:55 -0800 (PST)
Date: Thu, 13 Nov 2025 10:51:42 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scmi: reset: validate number of reset domains
Message-ID: <aRW4PpPjVw1-melm@pluto>
References: <20251103161044.2269377-1-a.shimko.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103161044.2269377-1-a.shimko.dev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_025159_207793_35DCBA1A 
X-CRM114-Status: GOOD (  14.55  )
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

On Mon, Nov 03, 2025 at 07:10:43PM +0300, Artem Shimko wrote:
> Add validation to reject zero reset domains during protocol initialization.
> 

Hi Artem,

> The fix adds an explicit check for zero domains in
> scmi_reset_protocol_init(), returning -EINVAL early during protocol
> initialization. This prevents the driver from proceeding with a
> non-functional state and avoids potential kernel panics in functions
> like scmi_reset_domain_reset() and scmi_reset_notify_supported() that
> assume dom_info is always valid.

Indeed, this was alreay spotted/reported/fixed in other protocols, but
the preferred solution is NOT to bail-out when there are ZERO domains,
but to carry-on WITHOUT crashing of course: the reason for this is
testing scenarios in which you can have a platform/FW reply with ZERO
domains.

> 
> The change is minimal and safe, affecting only the error case while
> preserving all existing functionality for valid configurations.
> The existing -ENOMEM handling for memory allocation remains unchanged
> and sufficient.
>

In fact if you look at the code there are already a lot of places in
reset.c where the code path is anyway guarded by num_domains so it is
NOT problematic.

There are, though, other places where the dom-> dereference is NOT
protected and those could be probelematic.

Have you seen any crash related to this for real when zero num_domains
are reported ?

Anyway, it would be good to harden the protocol code as already done
a bit in other protocols in the past, but I advise you to lookup in
perf.c the scmi_perf_domain_lookup() helper as an example and see
how it used across perf to address a similar scenario and adopt the
same solution for reset in order to harden the code while preserving
the possibility to initialize the protocol even with ZERO domains for
testing purposes.

Thanks,
Cristian

