Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C028C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0GfEC89nlBesL8oKStTldMrIaIxQUV0w+3dHJkeydE=; b=TgeOcAVpIN/e+Fqkps+IDWpmhw
	9Q0jwl5mmpGeHE9qgrZnqIYutTWWEBiRNFhfZmYlMW8jPKXcEJ6jep6K3I5qFr7XskY24LHXpflJU
	RMmuzzzheA2KeCZLazxOgIPAYfgP2Hn60si9YqrRGbiY04ruQR1YzGWJzFzWrKdsG3Ij9dVgraE4r
	bAgEMb40HTxoWFoUMKejLI0hnOfYQRBgxTQHbe28WWsfAZmiF/HEumrdn8CFIWYwFCdslyCcJNtIW
	uSNZZmQYuW2fc9l9r6yVpOWZxctiIsdQa0LuMGPz9F0eLvqXlfR/OSghYXC3bELqrv6o6WiuL2Qa6
	0BvCV4VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGs3-00000007hZr-3bCY;
	Tue, 18 Aug 2026 10:16:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGs2-00000007hZP-2OFL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:16:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DFC1E43F76;
	Tue, 18 Aug 2026 10:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1291F00A3D;
	Tue, 18 Aug 2026 10:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787048197;
	bh=d0GfEC89nlBesL8oKStTldMrIaIxQUV0w+3dHJkeydE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C/b0NZouvhaVMBM6NorRvRcvDIJBqEEXkh8FD3qT5jw/aeQpXnKDgENAGmriMKysc
	 4uPCYLomBkF5fDId4rrO1yYJ9V5qCOvNoiuobzYuu72Gvcap87C5KEZRVMOtq3THl9
	 zFC0cMHPp4ENF/rweYwjTxCu3eT8Gt3YOoTQlkCm8J0BKeRAsbaJGl6v7Uutf6vnr8
	 lE0V+S6np4Ba+6eJsIMbpqVOgZLWRf++YK8j1/qa0hqxIDVN44fPFXu52CMs6sXAlu
	 NelmCXZ+atH75xrWvU1Hn5o0aAQ4vgbNPnl4GSmt6Xv5gdMbVAcDq68U9eKyIq9Eug
	 tiBfyfStmuAxQ==
Date: Tue, 18 Aug 2026 12:16:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: xiic: restore runtime PM teardown in remove to
 fix clk WARN flood
Message-ID: <aoQwxxaPSjWD8Zyd@zenone.zhora.eu>
References: <20260814-i2c-xiic-restore-runtime-pm-teardown-v2-1-7ae5d0c30ff2@nexthop.ai>
 <aoHf6UDxD68YxLYm@zenone.zhora.eu>
 <DKQN4CNOESWV.2XRL8DIC87HYA@nexthop.ai>
 <aoNdskB_y8mOj5qr@zenone.zhora.eu>
 <DKRWHA3VO9S8.3QNFPU0732I1W@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DKRWHA3VO9S8.3QNFPU0732I1W@nexthop.ai>
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

Hi Abdurraham,

On Tue, Aug 18, 2026 at 12:44:27AM -0700, Abdurrahman Hussain wrote:
> On Mon Aug 17, 2026 at 12:20 PM PDT, Andi Shyti wrote:
> > A solution would be to drop the managed runtime-PM helper and
> > restore the non managed runtime PM setup and teardown. Otherwise,
> > this ordering issue needs to be addressed in the runtime-PM/clock
> > framework.
> >
> > Does that work?
> >
> > Andi
> 
> Agreed — that's cleaner than special-casing the ordering. v3 drops
> devm_pm_runtime_set_active_enabled() and restores the non-managed
> setup/teardown.
> 
> Let me try it on hardware before sending v3.

Please, also write a nice comment explaining why we won't use the
non managed runtime PM, I don't want to receive in the future a
patch adding the managed runtime PM.

Thanks,
Andi

