Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052E6C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 23:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zWxkkeiTyWE5LKeVfdhoG160eDFFWVwrPpDwosVNsg=; b=SGzNJmEIN+fdrCDGFQZZpkfyEW
	8JwNX+rRAKr9u0UrqX9DzytdWC1Rgzvu/ewzoDgKjWkxSXmXpe3aeMRPJqVqqRylakx/WshAOJlIc
	AY7YtOpDNC6PAE1HMD3WtodRs1W2xuXzpaqPT1wJG/VhCcbdM7TyWOUvjLVZDR87rOGlup7vYIF8a
	GTHuMk/Deh9cfuqxam4dTpg6hrm0TCtC0cajBhSA2djecuppLalkCzmjXllVEsxiZ/upkdY2ysI4d
	fltbAWDTnLkbg52eGZwAQjTa9t5wSHHkHeH0fVJGA2T9dRyDUNlbeA0zxWi68mWbmz4S7JwMMVB6Q
	szgBvGEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Fuu-00000004qix-2CNb;
	Mon, 14 Sep 2026 23:16:52 +0000
Received: from out-192.mta0.migadu.com ([2001:41d0:1004:224b::c0] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Fud-00000004qPJ-3Gpd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 23:16:39 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=6zWxkkeiTyWE5LKeVfdhoG160eDFFWVwrPpDwosVNsg=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789427792; v=1; x=1790032592;
 b=CTN8WiOgCgcBOqgnN4CcU3dUEdhIrCHG69eyBylJY3dopCJ14vtbC3gvs15LK5dIFLBssFSv
 oaMh34+xqmSi+Se3HTEwEnAUmgwolt+UV0e3UQ2s7cp0agA9qpEl0cXPi50M+mDeiRathmIfC3p
 R4gh8HPeL6jGDLv5VfIEkzZtkHDBwHsjrzqTmT7EE3WTaaLGW7hfkSjGIOu+/ldKi40pvC2eh1+
 hZSa33IElwwuE8mS1px74fwfBFLbFr9AaPKcm8vgkHS4UDK61lok2XjvpID2qJRhyulnZ/slKnP
 XGOm9GZLh7RrCqqVu2s12MzMIRMCKTUvO4VNNz2cJZxTA==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 93e28aba6f8c875a;
	Mon, 14 Sep 2026 23:16:21 +0000
X-Mizu-Trace-ID: 93e28aba6f8c875a
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Klara Modin <klarasmodin@gmail.com>,
	Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH wireless] wifi: mt76: mt792x: fix NULL dereference in ACPI SAR init during probe
Date: Mon, 14 Sep 2026 16:16:18 -0700
Message-ID: <20260914231618.17749-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2fd03569-f1c4-4c02-97ed-c74f4cd7f809@leemhuis.info>
References: <20260825181712.28548-1-lucid_duck@justthetip.ca> <2fd03569-f1c4-4c02-97ed-c74f4cd7f809@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_161636_247792_8BF43488 
X-CRM114-Status: GOOD (  13.89  )
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

Thorsten,

Thanks for pointing Linus at it, that's pretty cool.

There's nothing to set straight as far as I could find so no additional
patches to send. I went through it pretty thoroughly against mainline
this afternoon.

No stable backport needed. Both commits it fixes first appear in
v7.3-rc1, so the regression never reached a release.

Felix's tree carries no competing fix and has not touched that file
since October from what I could find.

The two patches still queued for that file, Junjie's 0xff one and my
table-layout one, both apply cleanly on top, so nothing got stranded.

Thanks again,

Devin

On 14/09/2026 06:35, Thorsten Leemhuis wrote:
> For the record: Linus pulled this directly from the list into mainline
> yesterday after I pointed to this patch in a small regression report. I
> did that, as I had seen multiple people reporting a regression who
> confirmed that this patch fixed things for them.
>
> Bypassing subsystems like this has obvious downsides and risks; hence,
> if that got something on the wrong track, please speak up -- or ideally
> send patches to set things straight again in mainline.
>
> https://git.kernel.org/torvalds/c/7825de3f75d184612d77655669a04ea0da252c17
> / 7825de3f75d184 ("wifi: mt76: mt792x: fix NULL dereference in ACPI SAR
> init during probe") [v7.3-rc3]

