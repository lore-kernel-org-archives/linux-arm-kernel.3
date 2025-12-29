Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E437FD3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 13:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OlwV+0WkrrhkAznnAMTdjGUiKt37Zz1CzIqKhw4J8E=; b=2zotUjGNnvXf16u5PICnflw7nD
	YOZcO1QNrPEZg1KSHst5JOIgtVh5dOB7Lu+i/PFBZmTS7aE0StRY8BcrtGkf8ccBURDPAa4SG+Yjq
	S6cCJx8pBRA1wTvblcMyN+WZSdbrSXx7tnPct1t3hFOnrQeUBkYlzJ2Y0t+yVEoia00mGNxgyk6gX
	FVhOh6xtIriQ4A+19kxBppjIU6QO160zKq/4sxuStSBFCYnHw/u3mNDr8EgHYnwo6vVizmuCkq0CL
	iLz8Ymoi5mFVWJ9DYfVOwqosoVyi2RHXMPl85IH+EWDAN36pY0pSUcUpvUU7oxSKOQTYcmh3z2CJP
	SPFzia3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaD7l-00000003js7-25IX;
	Mon, 29 Dec 2025 13:17:25 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaD7i-00000003jqf-0uUb;
	Mon, 29 Dec 2025 13:17:24 +0000
Received: from LAPTOP-N070L597.localdomain (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ee89fa22;
	Mon, 29 Dec 2025 21:17:12 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: markus.elfring@web.de
Cc: angelogioacchino.delregno@collabora.com,
	jianhao.xu@seu.edu.cn,
	kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	zilin@seu.edu.cn
Subject: Re: [PATCH v2] soc: mediatek: svs: Fix memory leak in svs_enable_debug_write()
Date: Mon, 29 Dec 2025 13:17:12 +0000
Message-Id: <20251229131712.388207-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1d9b46ba-728e-459a-9d82-0f49e2fe08b9@web.de>
References: <1d9b46ba-728e-459a-9d82-0f49e2fe08b9@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b6a41726103a1kunmbd4a8e841222b6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHUJJVklLSEhOTEtPTkgaSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0pVSktLVU
	tZBg++
DKIM-Signature: a=rsa-sha256;
	b=lZMSgaxa4GXhiwucz/mhIY8jUm3fPooBzsHSv6imSruT4z691xuklvzYwZ9F3aiOK9rDmt493LL45kdxSraIslTc/N/hmv4bAguWEbFG3A6KLamWOo3GE40EUqsqk/+olp0FSq6ywz91SNm/Te8WUsJFmTW7RXu0X1WyacP8lVY=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=4OlwV+0WkrrhkAznnAMTdjGUiKt37Zz1CzIqKhw4J8E=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_051722_915151_32F58D02 
X-CRM114-Status: GOOD (  10.05  )
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

On Mon, Dec 29, 2025 at 09:19:19AM +0100, Markus Elfring wrote:
> …
> > +++ b/drivers/soc/mediatek/mtk-svs.c
> > @@ -789,7 +789,7 @@ static ssize_t svs_enable_debug_write(struct file *filp,
> >  	struct svs_bank *svsb = file_inode(filp)->i_private;
> >  	struct svs_platform *svsp = dev_get_drvdata(svsb->dev);
> >  	int enabled, ret;
> > -	char *buf = NULL;
> > +	char *buf __free(kfree) = NULL;
> >  
> >  	if (count >= PAGE_SIZE)
> >  		return -EINVAL;
> …
> 
> You may reduce the scopes for involved local variables,
> don't you?

Thanks for your suggestion. I will reduce the scope of the local variables 
in v3.

> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.19-rc3#n262
> 
> Regards,
> Markus

Thanks, I will add your suggested Cc tag in v3.

Regards,
Zilin Guan

