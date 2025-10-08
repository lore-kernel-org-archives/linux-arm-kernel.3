Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B70CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 10:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTNX3IQnvSRAv3npumHZt++X9b4PD1bbzr97XEBgAKc=; b=SGIW7aGC3STnudRgVP74lBqUoJ
	VV5RKkDx3JhgtHwDzqFzFhxVTWt2lLoC7vm1i7XdYbXWYVnF3gbUqnM9hFHcBoCKeHPocAdvo4W8e
	+mSlmVbWRX6VioNPKY221r5isN988p1MP8K0lNOqqme2yrZnOFYrr8HNGWGD6QSjRRbj2kzDyBGgF
	5WCgv3avA0XoqMbA971YC5uPWwrvlFooGwoYiz7bJkPkQEt7alknt+97l44jh336qj6iBAIClv9Cj
	9n9TFz/DPat45bOBOGJhZIN/FeBSpLiI7dSse1moK0AfzHx10RTm39oAloxDvY0XNLxF/KIk/O9gK
	6Rq9YKQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6R1Y-00000003bZj-1mDw;
	Wed, 08 Oct 2025 10:03:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6R1W-00000003bZO-1XNN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 10:03:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF09822EE;
	Wed,  8 Oct 2025 03:03:44 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA9413F738;
	Wed,  8 Oct 2025 03:03:51 -0700 (PDT)
Date: Wed, 8 Oct 2025 11:03:43 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: cristian.marussi@arm.com, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	sudeep.holla@arm.com
Subject: Re: [PATCH v3] firmware: arm_scmi: Fix premature
 SCMI_XFER_FLAG_IS_RAW clearing in raw mode
Message-ID: <aOY2_x2Xd_74U8f_@pluto>
References: <aOVGGaY9NmKqUwPG@pluto>
 <20251008091057.1969260-1-a.shimko.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008091057.1969260-1-a.shimko.dev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_030354_471585_543A57C3 
X-CRM114-Status: UNSURE (   7.56  )
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

On Wed, Oct 08, 2025 at 12:10:57PM +0300, Artem Shimko wrote:
> The SCMI_XFER_FLAG_IS_RAW flag was being cleared prematurely in
> scmi_xfer_raw_put() before transfer completion was properly acknowledged
> by the raw message handlers.
> 
> Move the SCMI_XFER_FLAG_IS_RAW and SCMI_XFER_FLAG_CHAN_SET flag clearing
> from scmi_xfer_raw_put() to __scmi_xfer_put() to ensure flags remain set
> throughout the entire raw message processing pipeline until the transfer
> returns to the free pool.
> 
> Fixes: 3095a3e25d8f ("firmware: arm_scmi: Add xfer helpers to provide raw access")
> Suggested-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Perfect, LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

