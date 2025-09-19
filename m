Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46BFCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 07:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iB8MStRFoe+6/9cvM+l8xto9p5ppYJhBuE+xfj8TFcQ=; b=diVd45OybW8L73js0mJYmJRpdf
	k8KBdXJBZY3iLTagxgOH26QaY31zQcXgeBo/xMlviSWdX8lNloIOKWQS326Mt4aVTi6slbYWjDSt7
	Rk9j25/iwlvxlXwde9qwjZFTH3bNjuDUIKoEZGj00Eec7qP3KlWUv8bIdDkXXJIciSwMS/55t/If7
	+1oKqd4xc10UYL79Ckgpef85mZSxyzdkq4PFpVrJlV8qh8thxyOiCZQiDcPj+x79RPgcatC0hNevY
	RG+FhYBmVCIXC4vaSmktsHOnkL20g/AMCk6G15xiP6d1hl49wchhH+SskiDamOkyQLePwnJQrI6FS
	JkDBDwjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVX6-000000023Yq-2nji;
	Fri, 19 Sep 2025 07:27:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVX6-000000023Yh-0zcp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 07:27:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 550A360097;
	Fri, 19 Sep 2025 07:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8899FC4CEF0;
	Fri, 19 Sep 2025 07:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758266871;
	bh=YvEGTDyCymkNc5PTq5aWhwM4Y9NEGr2bhCtP+oNI5l4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUdNYidGtZd+Gf2oDNJm1Y+DKX+QRHgaLr2xT+TpvLnqcFb8C5Msiwp4UNg9MzHFh
	 K4+zVCjJkqdFob5skPlEqgTPb6AO3gn/1KGxDfGKRqc/Q0UMqNxiN1myAXJOwGxm8l
	 zM3e+bkFgg2R3AsMcEJX3ioMXLJVht7i2TmqmXDArbFjTllRtRykA97T04bHk3qbqf
	 ct7vMRPj+bpxOnP4u4culALYmvd2h4fxmqtEJyhdMYV2nD3BxQmNq6Xc2fj8WlGBsv
	 TnUuvCjYdVIG+3XKRCpv4QID7T+b7aW9J4PkIvfyNofexW7lt45eSz/Nf8WvI/YPZZ
	 XOixucKcpgIbw==
Date: Fri, 19 Sep 2025 08:27:45 +0100
From: Will Deacon <will@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: catalin.marinas@arm.com, anshuman.khandual@arm.com,
	quic_zhenhuah@quicinc.com, ryan.roberts@arm.com,
	kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com, mark.rutland@arm.com, urezki@gmail.com,
	jthoughton@google.com
Subject: Re: [RESEND PATCH v5] arm64: Enable vmalloc-huge with ptdump
Message-ID: <aM0F8U-cW6sh62H-@willie-the-truck>
References: <20250723161827.15802-1-dev.jain@arm.com>
 <aMk8QhkumtEoPVTh@willie-the-truck>
 <aMrXBArFNLTdwWs3@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMrXBArFNLTdwWs3@willie-the-truck>
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

Dev,

On Wed, Sep 17, 2025 at 04:43:00PM +0100, Will Deacon wrote:
> On Tue, Sep 16, 2025 at 11:30:26AM +0100, Will Deacon wrote:
> > I'm currently trying to put together a litmus test with James (cc'd) so
> > maybe we can help you out with that part.
> 
> Here's what we came up with. There's not a good way to express the IPI
> from kick_all_cpus_sync() but it turns out that the ISB from the TLB
> invalidation is sufficient anyway. Does it make sense to you?

Any comments on the litmus test and/or my question about serialisation
of the static key? I'll be moving the arm64 tree to "fixes only" soon
as far as 6.18 is concerned.

Will

