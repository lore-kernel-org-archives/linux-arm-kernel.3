Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8ABBC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEPGE7TsupqG+0s5NHlCQYzC7uUWUsspvWbRsHcv5Us=; b=WqrMde8B7WjhhvtPkNOFlkYLS0
	/HZ5a8bf2uvB3yvzBQ84XZKV5jSyL+R2SVvRjbZOCZPk/aO9k8eR4nmFww6D1I/S2XiWDEZ1zCPur
	T0dIjRnO1AmT6tSagXkxBkebfUgvSbuT64Q0gSOyy7GZt+DNJVvSYGhF8LWUIf9oetqu1EMIj2Tbj
	qyc+nYnsP3mY67EJAY1/lw70sf1S07VowVZUOICeWf7WTanU26n8Vj2yQN8y2Mv+1RTnmikSp5sak
	MBK6qQhWCHWSlIYPoEnZWnYR0hInBf97ncbrKJ5HAbR6b5ORdASBmXW3NMRUuPj8Qh4o0nxuP7VGO
	0h8sWarQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xvc-00000009WEW-2F8o;
	Tue, 08 Sep 2026 15:40:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xvX-00000009WDH-1mEw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:40:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C46411476;
	Tue,  8 Sep 2026 08:39:56 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E77E3F7B4;
	Tue,  8 Sep 2026 08:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788882000; bh=4E/QUa1lJLzFAlCV6vPDzrRQV3T6EKul1f35Q4OSPzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZA4cJHzCorXj5MAXtAIs8Y/Mjeznm2KVYPJT22y7BscOnKzAaiMvSSjCzPi8mudo6
	 YqCCG/El4TCTvkHtCH/UMNFji8/tQXhsO4eM/O+smMCE2zjxGPGKP7rYUHe4Ev4ovv
	 Ja7+JOpK1F6Rk8/ujCt64QN3el//HDA+d0RPkx54=
Date: Tue, 8 Sep 2026 16:39:51 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: rolanddreier@rivian.com
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Couple of SCMI race fixes
Message-ID: <aqAsR4tQrtsUZe66@pluto>
References: <20260814-scmi-async-done-race-v1-0-335b163d77ee@rivian.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-scmi-async-done-race-v1-0-335b163d77ee@rivian.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_084003_510059_8AF465BC 
X-CRM114-Status: GOOD (  11.04  )
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

On Fri, Aug 14, 2026 at 08:15:32PM +0000, Roland Dreier via B4 Relay wrote:
> Noticed a couple of races in SCMI code around delayed responses that
> time out. These are probably nearly impossible to hit in practice but
> the fixes are pretty straightforward and it seems worth having the
> code be sound.

Hi, 

apologies for the delay in this reviews...

Nice hardening work, Sashiko complains about a few unrelated things (of
course :P), there is only probably a good point around the update of
DEBUG_COUNTERS that you added


https://sashiko.dev/#/patchset/20260814-scmi-async-done-race-v1-0-335b163d77ee%40rivian.com

"Will this new counter actually increment for timed-out responses, or will it 
be blocked by earlier validation logic?"

I mean please consider if you can improve the patch only regarding the
DEBUG_COUNTER update (probably moving the update where async_done is now
set to NULL is enough...)

Beside this, look good to me and in my testing everything was fine.

Thanks
Cristian

