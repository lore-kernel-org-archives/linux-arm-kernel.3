Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F56CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awhRxtTb59uFrw9BcmOadR/YY1+NLLAGsGfYTgdJp4k=; b=ngBicMf2Wb1LXoroaXd1V80GuB
	FSPwPo45rcD/XONrvptb3Mjegr2Sdkkkx9jNPhNOYNm9PY0W8gSPx/sk9a9RxQZ9W0SlC6eAQS1KF
	tImwR/3nxYIkaj5YlYZ5I6Ml1rnxn7cMP148RBXVeWKNiVBcuidI15WXYqeo6mUa2XV0NmQj+UxBO
	L4QTBJafz+ulTxP5V6T4l2Bqf8VeTWWxh+Ybsx5cp5xhLCASUgB5hOg55pVuD7ZvvdSA9VDhlCEFT
	72OFEodbSOjwNiEte5daf3ZPgJppjEctiYrrs2+ZmfTiVY6Wkc3haRdQINjw4VOyE9hFZ8uuy3W4+
	/CmrRGEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHSFw-00000001MO6-0NTr;
	Thu, 15 Oct 2026 20:40:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHSFv-00000001MNs-00q2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:40:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6762443770;
	Thu, 15 Oct 2026 20:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721E81F000C4;
	Thu, 15 Oct 2026 20:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792096850;
	bh=awhRxtTb59uFrw9BcmOadR/YY1+NLLAGsGfYTgdJp4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FeSobAKIBHtsxNGahwJm3YVst3IQFjTWGtlNOyojnC4A4Fp4N4J5cTYEiE1h91DaU
	 OsaDc+zbFhl+6ZKDHlpSyTfUrqBj89vMq9bAvgY+CIjVg9cn7ZRTLpdOm99Hqi55Mj
	 VzT5lUBy2+PqY29fF3sPnlIwL+ZBRctYw7Nx/SGjpn98ZffztBF7d+0/8gK5219gZ/
	 oXzlXZFgxGnuCN/foPqyif7We/eTR+W8T2+byTpzDTQ0YbXJM9v9P6oFh30lKdf9eB
	 3fNb3ka6aDBRjT65LsFNLQ6GjScvxyD33SyucdF4Led0g8s5ERzpPhyMyVh25vdzZT
	 Vt46uaxBjk45w==
Date: Thu, 15 Oct 2026 22:40:46 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] i2c: xiic: restore non-managed runtime PM to fix clk
 WARN flood
Message-ID: <atE6LA8SFpFvZfzZ@zenone.zhora.eu>
References: <20261014-i2c-xiic-restore-runtime-pm-teardown-v8-1-40668c270069@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-i2c-xiic-restore-runtime-pm-teardown-v8-1-40668c270069@nexthop.ai>
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

Hi Abdurrahman,

On Wed, Oct 14, 2026 at 04:56:55PM -0700, Abdurrahman Hussain wrote:
> The devres conversion replaced manual pm_runtime_enable()/disable() with
> devm_pm_runtime_set_active_enabled() and dropped the remove-time runtime
> PM teardown. The managed release tears runtime PM down in the wrong
> order: it calls pm_runtime_dont_use_autosuspend() before
> pm_runtime_disable(), i.e. while runtime PM is still enabled, and devres
> is LIFO so the devm_clk_get_enabled() release runs afterwards.

...

> Fixes: 50c63491ff26 ("i2c: xiic: switch to devres managed APIs")
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

pushed to i2c/i2c-fixes.

Thanks,
Andi

