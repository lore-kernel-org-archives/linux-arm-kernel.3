Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCFAD33990
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/4Ejv/TEe8ix+JAwoUVc/rF+/w+t0EeX6p8whR7eow=; b=1VfjzoRMtmxEPyhvDn2JmfPte3
	wuqwtx4FEdinNAUrtaQed5voBYvT4HCCHYtvghNgYNVWb9+a1xUzAoCEAYMCCDidgNN9NgoLeFxHD
	j5qbGhiEAYTXdE2yMBD8BuoEPOlpPrQqZNvK2AC3veTtmNCDYKGlZAyWHn8UF72lLxqS021dDKmnx
	fqn4plhFEIaC+7ElD77QcvFJQDD+Qa3RPbHCCNPPrlWDUwAIoFHMSR92IbYddOzfD8xtBWnHeF9MQ
	wU9kkay2VYU2mnAmgLVJ/cgeb0EHR0eCeKlM5AwnqcyGfod1srpWf+1x/njkwxz586M+nmJzlt1h4
	0W18j5KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Rjw-0000000BKL9-0xTs;
	Mon, 28 Oct 2024 15:33:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RFY-0000000BE1t-2620
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:01:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33327497;
	Mon, 28 Oct 2024 08:02:11 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6CCCD3F73B;
	Mon, 28 Oct 2024 08:01:40 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] firmware: arm_scmi: Reject clear channel request on A2P
Date: Mon, 28 Oct 2024 15:01:38 +0000
Message-Id: <173012765846.2640935.17751629825029165429.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021171544.2579551-1-cristian.marussi@arm.com>
References: <20241021171544.2579551-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_080144_690728_D92BA358 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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

On Mon, 21 Oct 2024 18:15:44 +0100, Cristian Marussi wrote:
> The clear channel transport operation is supposed to be called exclusively
> on the P2A channel from the agent, since it relinquishes the ownership of
> the channel to the platform, after this latter has initiated some sort of
> P2A communication.
> 
> Make sure that, if it is ever called on a A2P, is logged and ignored.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!


[1/1] firmware: arm_scmi: Reject clear channel request on A2P
      https://git.kernel.org/sudeep.holla/c/a0a18e91eb3a
--
Regards,
Sudeep


