Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BBBFEE4E8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 10:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbqCF9owEypIl556hOWmdvcFmathv7vB58V1rjYsIEo=; b=R6gAMUbElmJUBqtk1hKiiPYisD
	1SVe0+/tQP3aOf+OInR8vdARaMd0jC00CTnS23rpkmkNFatQjcY/v6nkDVKzm/JpP/pCpuleCYGpa
	8iSrZAciyg5eaNKsxJIo81k6/lTmRyp1ZrhTGqA993w5i5F8oIeC5PRfccay5imeKxwXXZ8WW7dz7
	aGSVKBDelTgUhJaDZyLB4hE9l7oQPVkFXTFwLJlb2TCHwlW5FUhrlQWo5VtP1amVBUzTH8jonRurX
	1ukeULi6cv9uphbu3OadvqtJL2uMQnwyKsAdlfVRkgBJkzLZrjcC3UJbsSZ4LCiX6sw+s3AZfQut6
	pcSgCIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHBC-00000009iZb-1IWt;
	Sat, 28 Feb 2026 10:04:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHB9-00000009iYz-0Npo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 10:04:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BE731516;
	Sat, 28 Feb 2026 02:03:59 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BD0E3F7BD;
	Sat, 28 Feb 2026 02:04:03 -0800 (PST)
Date: Sat, 28 Feb 2026 10:03:59 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: base: Simplify protocol list size
 calculation
Message-ID: <aaK9jwtyJHoa0F2t@pluto>
References: <20260228-scmi-check-v1-1-4935b58bb2db@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228-scmi-check-v1-1-4935b58bb2db@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_020407_167972_8D9E56AF 
X-CRM114-Status: UNSURE (   6.18  )
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

On Sat, Feb 28, 2026 at 11:37:33AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace the open-coded round-up calculation with the kernel's round_up()
> helper function for better readability.
> 
> The original expression:
>   (1 + (loop_num_ret - 1) / sizeof(u32)) * sizeof(u32)
> 

Thanks for this.

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Cristian


