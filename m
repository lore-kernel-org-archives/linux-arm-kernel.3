Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A82CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2QvCWe6PartnF3LoWYYsGQGy+7zL+gLb3mfCxj9MNM=; b=hTz9eATflWJEYg0iwJNPPeen1a
	fHSUXeKeu3FTZQXfVen38/dPaG2oX54sHlAkjEAoBvAEAgptCoNQwqIO+/n+8AE45jvcPnYYtR0p0
	v2m+XxOEYQPztuu4OHUJQ6bFfRfazIrXkV85Zbzrb9Yet93w1kiCcU63GOkPB0KwifH93RNK2xY2K
	UF8IIuxfAZJchc2IldaocOsaYONW6Iau3V6y0o4b+wx4ojQWQnqwS5J/5bZwrVQa9y/iZHJqr0iP1
	Cd60Cl9L/uIP4fQSmytonrumXwa6Ykqy9u4sjlLq0i6CddW6KCrm/yZNeN3OAhDb4veJHdpKDO/rB
	v+3R8v/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3sK-00000008EsN-1nsx;
	Mon, 18 Aug 2025 17:42:28 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3PI-000000086Wd-1gcH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 17:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=P2QvCWe6PartnF3LoWYYsGQGy+7zL+gLb3mfCxj9MNM=; b=YO0O7Fct9K+fpC+r/8Zebl8Ekn
	q1XcvYC2VDhRm2h/P9vBVIQFx+5la6aLRuhym+rkXpcDCzWjfsOswPFi6vkN2RusL5cavB8Tp1JQ1
	GrNgUxdtd20RYoGMSS+b+7zPxXgr0XdD1MUwT7iuxsILGQZfvfB3U/Q487zULzOfn5VYhEDOZZena
	9qRKrLYhyB5kLRD/8y/kSGYnximP7vRwMDQsfFXTdA0KJtM7KLLMeLtExVLc6sqQpsYxtVBEx8sJt
	ObrW7UGkUSjUke9BFYjtw8ex1xz1x0zQIaxAD5JQPo2qPbc0mfuRwNJ1R/FQ2Zvqlu5O2lQCkUMdy
	MS/fAFcA==;
Date: Mon, 18 Aug 2025 19:12:08 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Yang Xiuwei <yangxiuwei2025@163.com>
Cc: tony@atomide.com, khilman@baylibre.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: Re: [PATCH] ARM: OMAP2+: use IS_ERR_OR_NULL() helper
Message-ID: <20250818191208.11db7aae@akair>
In-Reply-To: <20250817083449.2249268-1-yangxiuwei2025@163.com>
References: <20250817083449.2249268-1-yangxiuwei2025@163.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_101228_449573_417FA211 
X-CRM114-Status: UNSURE (   6.98  )
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

Am Sun, 17 Aug 2025 16:34:49 +0800
schrieb Yang Xiuwei <yangxiuwei2025@163.com>:

> From: Yang Xiuwei <yangxiuwei@kylinos.cn>
> 
> Simplify error handling in OMAP powerdomain, voltage, and VP code by
> replacing open-coded '!ptr || IS_ERR(ptr)' checks with the combined
> IS_ERR_OR_NULL() helper.
> 
> This improves readability and consistency across
> omap_set_pwrdm_state(), voltdm_get_voltage(), voltdm_scale(),
> voltdm_reset(), and related functions.
> 
> No functional change intended.
> 
> Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

