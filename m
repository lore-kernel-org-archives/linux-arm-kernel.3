Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D1FC77B7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 19:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=SXwOqDB2rxyGflmM5qkiFYblc7DmBIRBfaApti44VQE=; b=hOH88BZx/IDaVO
	8N3OETzsRqhF62l2q1SXcK+uofPRIPrYXwjAFzh7pgmoYsCRwCj/xHBOtjBZyDIrlLOoLeEtQ8A/t
	HX6PjJgzDCO9wvXMKiYZiK7eTGwzg6SkF3WU2wPATGfFgblIRfsY4Sh3+omlkV8wVl6CualW41UBs
	VYxtqDkXWC0RhuUzC4GtZI3qIMUuXJGXqsJeowAwT0riIwfZ5cijj8u5XAa+OEcE7ubVIGtOb6Py+
	BWlu76O1IPfsJWBUT3hFiDLhIi6lF99ADeBNP4tg4f8gkuW8/ysBN7UY1SJ4YOZpdbR7v3bTz5kNh
	9PWsDaYBAlh06fqbARKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLE5-0000000E7nA-3g4Q;
	Thu, 19 Jun 2025 19:47:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHPD-0000000DR9N-1r3S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 15:42:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1BA1113E;
	Thu, 19 Jun 2025 08:41:59 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F30F3F58B;
	Thu, 19 Jun 2025 08:42:18 -0700 (PDT)
Date: Thu, 19 Jun 2025 16:42:10 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Philip Radford <Philip.Radford@arm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, cristian.marussi@arm.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH 4/4] firmware: arm_scmi: Add new inflight tracing
 functionality
Message-ID: <aFQv0rwS3PwyTeG7@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAWPR08MB99669F0D3EB80C4ACAA90DFA897DA@PAWPR08MB9966.eurprd08.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_084223_522001_E6212878 
X-CRM114-Status: GOOD (  10.33  )
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

On Thu, Jun 19, 2025 at 04:13:57PM +0100, Philip Radford wrote:
> > -----Original Message-----
> > From: Dan Carpenter <dan.carpenter@linaro.org>
> > Sent: Thursday, June 19, 2025 3:38 PM
> > To: Philip Radford <Philip.Radford@arm.com>
> 
> Hi, 
> 
> > Cc: linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; arm-
> > scmi@vger.kernel.org; Sudeep Holla <Sudeep.Holla@arm.com>; Cristian
> > Marussi <Cristian.Marussi@arm.com>; Luke Parkin <Luke.Parkin@arm.com>
> > Subject: Re: [PATCH 4/4] firmware: arm_scmi: Add new inflight tracing
> > functionality

Hi Phil,

please reply to all the recipient of the original mail-thread when answering a
review, so we remain on the list. (mutt -> g .. I think :P) 

(I added the CCs to this)

Thanks,
Cristian

