Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DBFE784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 16:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l98t+1M1VWTPisKtazrXq0pFOX2xbqWtZ2NXrwza3Wk=; b=00pbytGy2QArsTuwWhTPNWcVqu
	SXFpwB9JBsuIECrs9RU8VQGcrYaJ6ul+mZ/Pw40qglC22gELGb1yDEp7GOUG57U8WAosaBkbCmTEk
	B5F8AcjpSjUDGUjCVAP9auOaKadfHcfKK1RIHyywGG8+TXSWIb+xffmCCBDPmc6aIfHK2PeK3wmpp
	7IUIMeFdq5gkDU1560YyrK8xlsWdX7ZWrc4qqN2Jn3ya968UMZRZ2WvyM48v2FAvYjpYTlxkjAvuR
	MWDZP6QdX5h3vGco87XNllIQNFqSTvmD65+Y5idZmwnuPl4XfYeq0GsBCQDTJ34UAN5mq3KQvJfZD
	0/lEwZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZtWv-00000002seL-1Wpk;
	Sun, 28 Dec 2025 16:22:05 +0000
Received: from mail-m81171.netease.com ([47.88.81.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZtWr-00000002sdO-0her;
	Sun, 28 Dec 2025 16:22:03 +0000
Received: from LAPTOP-N070L597.localdomain (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ecc4355c;
	Mon, 29 Dec 2025 00:21:50 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: markus.elfring@web.de
Cc: angelogioacchino.delregno@collabora.com,
	jianhao.xu@seu.edu.cn,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	zilin@seu.edu.cn
Subject: Re: [PATCH] soc: mediatek: SVS: Fix memory leak in svs_enable_debug_write()
Date: Sun, 28 Dec 2025 16:21:49 +0000
Message-Id: <20251228162149.3825287-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20dca540-1c20-460a-9079-718db465c518@web.de>
References: <20dca540-1c20-460a-9079-718db465c518@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b65c41e9e03a1kunmc737f434adbec
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTBgdVkwdH0hKTk1NHhofTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0pVSktLVU
	tZBg++
DKIM-Signature: a=rsa-sha256;
	b=IrWp0y+HsM7/beoCKxodyzVI62saRWopFbY4hwdW/E5NQbE6Ii8BgW5s/QNFI67Ub8TDsS9XxIARMSUHXhzxCSkJ/gO6VAbaP9EgbV4qHR/KUfbeZYMJGvu29bDx6nvxgvtmtpBgnRUYfE9ojuNOXCEM4KbjNYUnuGBwSqPkJao=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=l98t+1M1VWTPisKtazrXq0pFOX2xbqWtZ2NXrwza3Wk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_082201_945334_AAF09A50 
X-CRM114-Status: UNSURE (   8.32  )
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

On Sun, Dec 28, 2025 at 03:19:00PM+0100, Markus Elfring wrote:
> …
> > Fix this by freeing buf before returning the error code.
> 
> How do you think about to use the attribute “__free(kfree)”?
> https://elixir.bootlin.com/linux/v6.19-rc2/source/include/linux/slab.h#L512
> https://elixir.bootlin.com/linux/v6.19-rc2/source/drivers/soc/mediatek/mtk-svs.c#L785-L813
> 
> Regards,
> Markus

Hi Markus,

Thanks for the suggestion.

I agree that using the "__free(kfree)" attribute is a good way to 
simplify memory management here. I will apply this change in the 
v2 patch.

Regards,
Zilin Guan

