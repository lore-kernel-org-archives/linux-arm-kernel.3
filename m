Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56B4E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUNrPmk90FED3zeDJj3EWHyyRjg7kfeUadii8gv0VaQ=; b=L1cYWVEuS9xzUhc+QcbBGoj0JU
	XXzj9HGblB1j63/afMSc6aE6nwmgtf4uyfEcmAOyA1zwgZxccUfxnAVLS7R+O1JyS57gFU8YSAwcO
	2ck6UFJ6zopaQ3ByXByP6GDqpdPzuyXSOHZg325awLRuc1md1XkbGfF1ykdqGIOC5CsazDuX+iKQU
	z0njH0zIm4KneIgvZiMRlQQQDIhO+j8TtTiBewak/OmAFUZzNJJX8TIJCUtbZhwCtMUaNIJICqjwt
	S7AtRT46JLyq0AyTDXtq+GAgAwtnB0xIiQYONZz9XKVK0cpOyOau749591u9yepbGJjjzfrRHEpjc
	iYdk5l1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1du-0000000Brud-419R;
	Tue, 10 Dec 2024 14:55:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1aE-0000000Br1w-2rki
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:51:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 597F85C4889;
	Tue, 10 Dec 2024 14:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEEC9C4CED6;
	Tue, 10 Dec 2024 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733842289;
	bh=ZUAvi1jN1qmXUBxFgEozQgzSpVFDQiySdNEYR7SDDF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCvLeCmtXhosE1EdBQVuEz3PNugZIdGnoFin0EL+HTummL17Q5U3Nl6bijRf5Mknt
	 1x6+G3UUkto9N4ilgePbEI484Bse7KAYKxjv1CRdyzbHJaWr0lJIAkhNDNCJxwSSVw
	 Q4XK1V2x/L45aRa/89wdIoXTnukwLcOjooEDuyWzV2fypJU+a4s/zb+DuBthFilPXW
	 Us13Z0j9oNT60yv6/6PfMlSjVt0KHFIbFRLMe7YRA93dWehWtEbl1E8MzX8P6lba4D
	 lIeU15moEP2/qUTuq4Ez6T9/5vdb9cvGqxkcv380cIBdVVN3CFy0AcaGhSdntyZjHB
	 aoRbpC3LhC6NA==
Date: Tue, 10 Dec 2024 15:51:25 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Vladimir Riabchun <ferr.lambarginio@gmail.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, 
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: pnx: Fix timeout in wait functions
Message-ID: <6vxpcoqf3npp46cajdsvrhaoiarprhfoyzb7k6qj32dwwot6ad@udg5sq3o3klh>
References: <20241206231937.86408-1-ferr.lambarginio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206231937.86408-1-ferr.lambarginio@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_065130_767726_2BDC5BD4 
X-CRM114-Status: UNSURE (   9.19  )
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

Hi Vladimir,

On Sat, Dec 07, 2024 at 12:19:34AM +0100, Vladimir Riabchun wrote:
> Since commit f63b94be6942 ("i2c: pnx: Fix potential deadlock warning
> from del_timer_sync() call in isr") jiffies are stored in
> i2c_pnx_algo_data.timeout, but wait_timeout and wait_reset are still
> using it as milliseconds. Convert jiffies back to milliseconds to wait
> for the expected amount of time.
> 
> Fixes: f63b94be6942 ("i2c: pnx: Fix potential deadlock warning from del_timer_sync() call in isr")
> Signed-off-by: Vladimir Riabchun <ferr.lambarginio@gmail.com>

good catch! Merged to i2c/i2c-host-fixes.

Thanks,
Andi

