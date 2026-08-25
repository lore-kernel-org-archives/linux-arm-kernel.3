Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1244C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 08:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yatvnucvowUBLiZV/e86RBt+bEgEplpvaCSySex1gA=; b=jezzoyX7QjSfaH26JEhSPM3/cM
	qVP0mKEswPkpd6MO3HTQsi1DA9ZZKuIa4EK3q1lD4PjHz1ObEghs1dcpNpzNDQMq6IWO7RJ1ukFMi
	1Y1xESeMGVBTxVrVt6uMXqlpPrAMRzkqLgMe656eNDUga6cSjSP1DCpNv2IpP/63z+awQIT+aeN3N
	lLo7JUPevybU9HRDafX6U1t3di2zIZu34ntWdguNa+RTfI6phDFr9d5a77lmVDkxIczGj4gihYt6L
	xJaxmw3N93sl0nrMvaztijptRK8HEH3OMbBmOLdT4XGEGvx888ohtIrOmmTfk1+Qm79COn/Rwr4Nq
	Q2pqIrlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymHj-00000000LmT-3N72;
	Tue, 25 Aug 2026 08:13:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymHg-00000000Lki-2a7s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 08:13:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EB0D01A17F3
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 08:13:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF170604C4;
	Tue, 25 Aug 2026 08:13:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DABCD11C7A07F;
	Tue, 25 Aug 2026 10:13:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787645599; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=1yatvnucvowUBLiZV/e86RBt+bEgEplpvaCSySex1gA=;
	b=KFZxCAhFbsazub9sZ7HcyNjILQBooj34vUGCNNiW4HHN9exzQQ4HBmHbMCXuHKpPtAM/xC
	34Tgf4yK6xYaEncdvR6DqiC4wTIu+m3bIr8r+RU9IjvvlYLaObspFHD/esMAZ1tGFP86Jz
	kAEkehAjdIL4TZRhU0MMt6haHfm5RFKE7vkkQeRrLpxQeIk7kNp682xjyFC8ben3pDhX+W
	4CQh2ZHPdR6qoaARZ/ao+BDZKnPrzZAIFT+YsCooXg9BXAReelg1XJnsw2gIUS5dqTlR+h
	Qc75XZrnFnO0kfKGZw1xYEVK1nIDnzPDNW3QxKeavYfAR7C3ImaXgRFwEnP60Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: michal.simek@amd.com,  krzk@kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memory: pl353: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
In-Reply-To: <20260821074417.261168-1-triet.hoang.dev@gmail.com> (Triet
	Hoang's message of "Fri, 21 Aug 2026 14:44:17 +0700")
References: <20260821074417.261168-1-triet.hoang.dev@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 25 Aug 2026 10:13:17 +0200
Message-ID: <87ld9uk482.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_011328_791585_AB8AA793 
X-CRM114-Status: UNSURE (   7.43  )
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

Hi Triet,

On 21/08/2026 at 14:44:17 +07, Triet Hoang <triet.hoang.dev@gmail.com> wrote:

> Convert the deprecated SIMPLE_DEV_PM_OPS
> to DEFINE_SIMPLE_DEV_PM_OPS
> and pm_sleep_ptr().
>
> This lets us drop the __maybe_unused annotations
> from its suspend and resume callbacks,
> also reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled.

Here is the occasion for sending a v2 with your two patches: wrapping at
50 chars is abusive :)

Other than that, I guess the diff is fine.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

