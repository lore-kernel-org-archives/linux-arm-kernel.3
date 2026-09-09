Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95855C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 11:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivNR6CZSEdawfq5KcD6L2gEATgnCfMqZUQfVtaNCWdo=; b=O7FBFjbZb98Sp67ThzX9pz6j/z
	7GjefP90n+fby0IDArqkBhOUlW56stWwkLYeg+6vgBABBZ+rIq97eYragwyU2ZjF8ZZrKvIC8iLg5
	8Bqv3QYbzmYMi1Fd68fZr4wtWAQ5Rj8yrowvbLTrZWevwNi5KHQU/3x1yFMy84vX1BLpjqj6kHtmH
	TrDLuE3YLKvZYamjXlmeukFgjR0wyRqkbx9tgBkOtnP1TSimYC3AGGePzcbg5b9sRABx4DHT0aSW1
	DQNT8kC7QPhq3aWHmzEsJOou/ZdpY7LrVMqCxGlZYSVhqlGcvvzX5i0mkBwgoFz1cg8hMp0e2W4Pb
	EqH1tGQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GKB-0000000BXqe-3Kmc;
	Wed, 09 Sep 2026 11:18:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GK9-0000000BXpc-04nm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 11:18:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3F3E1691;
	Wed,  9 Sep 2026 04:18:35 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70BC13F528;
	Wed,  9 Sep 2026 04:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788952719; bh=vKm2AvQYQ/cRUTAZNpvm0tdm1XCJhCVHdz9/NjyN2MY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h80ZSZZSGsnc/0AWejTg3e9QxfGSn9ljb0GRjV8AOhAZWHEw8rFe8DdO6toQMuS2y
	 BGvzy+8v6ZTU2oZi8l+1rx6eCGVL4wkj9NEdK/IuoKEoPKwBmLTvl1xG487/lkBXUX
	 0FMQnw+L4yZiq9SGGf45LrnzmlshyQXxaSravZUU=
Date: Wed, 9 Sep 2026 12:18:31 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: rolanddreier@rivian.com
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] firmware: arm_scmi: Protect xfer->async_done with
 xfer->lock
Message-ID: <aqE7-6gwOmh8Sr4o@pluto>
References: <20260909-scmi-async-done-race-v2-0-cc5dec25c6be@rivian.com>
 <20260909-scmi-async-done-race-v2-1-cc5dec25c6be@rivian.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-scmi-async-done-race-v2-1-cc5dec25c6be@rivian.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_041841_093078_9822326C 
X-CRM114-Status: GOOD (  11.01  )
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

On Wed, Sep 09, 2026 at 04:32:27AM +0000, Roland Dreier via B4 Relay wrote:
> From: Roland Dreier <rolanddreier@rivian.com>
> 
> Asynchronous SCMI commands are completed by a delayed response. The RX
> path signals the response with complete(xfer->async_done). Unlike
> xfer->done, xfer->async_done is a pointer to a completion owned by
> whoever is waiting for the delayed response, and it stays valid only for
> as long as that waiter is still waiting.  In do_xfer_with_response() it
> is a DECLARE_COMPLETION_ONSTACK() in the caller's stack frame.
> 

Hi,

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Tested-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

