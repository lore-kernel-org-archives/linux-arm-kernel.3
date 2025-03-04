Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B2CC282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKu8LyDUb6+PRnFWbbFy8fbyqc50Q0CKq0s3JDpuTwk=; b=AD5f/eA+npzD+Jc9TKZAA6Wf4B
	TQkDvl7cueS/YiSq6S8UmfY/wjTcogGjzZIWSrQM0iy6Sck05uiEUW6wMftk1GBV+mJndDlwYDBlg
	IakcUfpkgOnF/NlBw0JatTSjrdaMJ01cT/cnXvUNqsy/cisc/APb5naetCpGO75K1yLa8ltWkUFZZ
	thrhg2Gj+B8EY9N4DjnVKCl5HU02QW6n3tn/zBoQozAgwRQBjMHyf7dLfuQdb3B7W4rEYa8EwKoR0
	h5ow+2BvawXYpF8dD9LsBW8pocccGqb+qXiC90EFQpS+Bam8MRv2kgqfDI0M0SNL75OKXbzHyiOrz
	ujWZ4lkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVDz-00000005RhD-0jyL;
	Tue, 04 Mar 2025 16:34:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUCF-00000005DEl-3hrF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:28:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D2A72B;
	Tue,  4 Mar 2025 07:28:50 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 399773F66E;
	Tue,  4 Mar 2025 07:28:35 -0800 (PST)
Date: Tue, 4 Mar 2025 15:28:32 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, soc@lists.linux.dev,
	Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Luke Parkin <luke.parkin@arm.com>, Peng Fan <peng.fan@nxp.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: use ioread64() instead of
 ioread64_hi_lo()
Message-ID: <Z8ccIBTgn6n7CYXh@bogus>
References: <20250304144346.1025658-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304144346.1025658-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_072839_962645_50D3EEB5 
X-CRM114-Status: GOOD (  12.45  )
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

Hi Arnd,

On Tue, Mar 04, 2025 at 03:43:34PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The scmi_common_fastchannel_db_ring() function calls either ioread64()
> or ioread64_hi_lo() depending on whether it is compiler for 32-bit
> or 64-bit architectures.
> 
> The same logic is used to define ioread64() itself in the
> linux/io-64-nonatomic-hi-lo.h header file, so the special case
> is not really needed.
> 
> The behavior here should not change at all.

LGTM. I just sent PR for v6.15 this morning. Either I can redo PR with
this included or you can just apply this directly. I am fine either way.
If you go for the latter approach,

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

If you prefer me to send updated PR, let me know. I don't want to create
confusion by recalling by PR and sending an updated one without consulting
you.

--
Regards,
Sudeep

