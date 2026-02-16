Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790E8E7BD8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 10:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiCrxtYWRStBcB48EVBaE3Qi59Fgvi3biq62nXCK5YU=; b=lkNgc9zFBi9iHiGB+bY9x58E7Y
	rwSKQpO1hnByjJSjI4+0LewzoFxn2YEypCo42d+C1p1OEXRvhtXsq4CgiCagv551Z5uwcDL2OybO7
	jTFfIrtB7czkjn7iGy958J/cZiSZCQgaKgo4PCyVFOFT2BksgZ502Ss00BJpu2nYJ4AOwXQhwXoC7
	GtRPiRwcPtGHxQRPPKfDt7BSlMcSbbMmMj6gHWrNfnVS0zWhVV7QZA4Pz+PQ67bIZ+HHU2ydUEZE1
	OS3lZ5JAHjAKrEBLa/b48tqluORCVk9QJsUHtWDA14BAt/zB01b/AivssV3sbd4nge2yVyRHI8wth
	mf2Hk6Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwEf-00000006O2Q-2teF;
	Mon, 16 Feb 2026 10:53:49 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwEc-00000006O1S-19ic
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 10:53:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yiCr
	xtYWRStBcB48EVBaE3Qi59Fgvi3biq62nXCK5YU=; b=jz7SX77qvlrbNw4hCYfO
	yCt1rz9NMBX3YTdqNAfVGeZxI9+Zm+h2GlAMFRyMKl9wz1u+Ub98NVdPovxla7QN
	5r0OcbuhkZHKECkQkJ+/b/7PvAFlM/zi4MM+y3ctN/Buiov/FAu3yCe53zWLbkX8
	BjiCN7t4x6yiJgl6V6y0kplGJ0fzdkJFEgXJXHRyUh6vemc01G1h5MURkBp7sBdY
	nfSvkkCSax7aBUYlkrrzWaktywBBTvrNXmkfiFHBk3nKDBwhh1wxpKRhVhutjy9l
	88OM9Ue2nsEdhsw9MEWthIAJE6kFGNY0ini5b6aQTP6h6gFn6XDZ+++7jU2MnAV9
	tA==
Received: (qmail 3207498 invoked from network); 16 Feb 2026 11:53:40 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Feb 2026 11:53:40 +0100
X-UD-Smtp-Session: l3s3148p1@2MaMxO5K3I4ujnu0
Date: Mon, 16 Feb 2026 11:53:39 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, linux-renesas-soc@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [RFC PATCH v2 02/13] hwspinlock: add callback to fill private
 data of a hwspinlock
Message-ID: <aZL3M6hT45I2WUaQ@ninjato>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <20260215225501.6365-3-wsa+renesas@sang-engineering.com>
 <6e495cc2-3469-4855-8645-c5633d937f1e@omp.ru>
 <aZLVU9toZRX2vKX7@ninjato>
 <CAMuHMdWwJZ4fiNgh4DEGpr85QQrPwyA=F=RFyPq-iGzq=F5qMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWwJZ4fiNgh4DEGpr85QQrPwyA=F=RFyPq-iGzq=F5qMw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_025347_195259_9ECA8BD0 
X-CRM114-Status: UNSURE (   8.52  )
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


> Is that the statistically most-used response to that question? ;-)

That I don't know. I just know that I did build-testing for the whole
series and the buildbots reported success. Need to look up why this was
not caught.

Sorry Sergey, you were right...

Hmm, so is merging all the user-conversion patches into this one an
option? Maybe the RFC here can be reviewed per-driver and the real patch
set have this all merged?


