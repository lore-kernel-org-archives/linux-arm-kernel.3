Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E8CC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 15:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niOh59lSY/iyc+NdsGMZgWJfeOkMMxG5vkvm1Gzzm+M=; b=tBiTEFM2nM+PYM2CIS3JK6S3HH
	sgBuz9qXnwfdjoO5JMUoFRa9Ll6oSYyC+p1NckITP4gUrWF9U5n+vbnPaBIHm8X764ue5qJstTSN0
	9PunZ6DfQ0ZKYka6UXQXNJx2wUdBwuBWvsQDQHZWXgBkyTO1nydNNITFdjh58qniHMm8O+iLYCn1V
	6cqcDlCIqFGj5WKTHs3660t8WdeON2gdF0DB0xjb5jotQhCOkySlf9XVx3TKrhWc/SDVwhGKpgmFA
	HyynXTG9Z6uIBopmv41LzLZRUvWrjUBU51mX51cQR9jC7JqRKU5lU4J+c0L7RQHyAvYie6CWtL0p2
	qrsM+rVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYWC-00000007m4C-1m3l;
	Tue, 17 Jun 2025 15:46:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWqQ-00000007S8p-45lB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:59:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B5F8150C;
	Tue, 17 Jun 2025 06:59:01 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 689DD3F58B;
	Tue, 17 Jun 2025 06:59:21 -0700 (PDT)
Date: Tue, 17 Jun 2025 14:59:19 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: peng.fan@oss.nxp.com
Cc: arm-scmi@vger.kernel.org, cristian.marussi@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	peng.fan@nxp.com, sudeep.holla@arm.com
Subject: Re: [PATCH] [NOT_FOR_MERGE] firmware: arm_scmi: Optimize notifiers
 registration
Message-ID: <aFF0t4-tkD6k72YQ@pluto>
References: <20250613095059.GA10033@nxa18884-linux>
 <20250617135038.2439818-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617135038.2439818-1-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_065923_053438_CACB1ACD 
X-CRM114-Status: UNSURE (   8.48  )
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

On Tue, Jun 17, 2025 at 02:50:38PM +0100, Cristian Marussi wrote:
> Some platforms could be configured not to support notification events from
> specific sources and such a case is already handled properly by avoiding
> even to attempt to send a notification enable request since it would be
> doomed to fail anyway.
> 

... btw....not sure even if all of this is worth just to cut down on
needless computation...maybe just reviewing the noise level of the
emitted error message could be enough.

Thanks,
Cristian

