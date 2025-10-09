Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE6ACCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 18:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNpfTKykmtQ7x/G8jL+5xxDS0zpUuNiY1jUn4dfP5mQ=; b=QOk+DUK9bQV85zrCM2OiBiStWX
	q039Cf7ykpYWftnlJe0UIDQvlnOsZyh2O2jgG0WNI6cmzpjBm9uH9uaE29am1Y3oclKRfIJvY3+vl
	/70ydvQOhm3QdoSDiKvBMsxkf5+9BaOdSsKfW73+k8L8+o7fEy2uxiuuhX5ZquH8tzngDWobHXmQn
	b/5ZSBa06DnGDh0gMqexquC1tKA/6asO5IYJ6u9/VB5+LUmUB6BJX+ZTsmZe0WW3gizhUX9tCHLDG
	MiagAOznMXVyQ2j80M/DsVe4nUAlj/keNDOQPeEMgVHplhMVQ6fuFfsKQqUZtJR/P9VidQMnyYItH
	s52OqS+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6vos-00000006xMH-0BUC;
	Thu, 09 Oct 2025 18:56:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6voq-00000006xLA-3GVl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 18:56:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 384DF603ED;
	Thu,  9 Oct 2025 18:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9122CC4CEE7;
	Thu,  9 Oct 2025 18:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760036211;
	bh=NoVJ0xm+H8Ix/8mfqh2bpoZItxqLG9X1U5XWBBIbBAo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gYs47bjttmDkjyEKLDlcGOj21k147J67LmwO7PX0bThIeoH7zs3jTCtdxwcY2Qosl
	 p9G5tfwThRtRlvuo9bq32++UJx7KVCSgydLrQPAByIBgt1soYssMkBtZJxDco3hx85
	 C3xjTNuDVwV6M+G8FWHScfT5cOxbX9Q+KXdqBHYiego5EEHPnfeCeeLVP+ilyUlWDq
	 9ULvoCHaGf3Cr0djRsjt5WJ2YBsP4XQ5X8KUE03y5TsxT3i1oarW+eCsx7UE+hD65j
	 wtFxXhhZaoDHNMThGBMuJciWlwgIgQ2fBYkp64yyUa04hhapEGgp8E9sjAbofKg9qe
	 mDU0KLv1U5oOw==
Message-ID: <bd991c1e-69b0-47aa-9373-274f92fce76d@kernel.org>
Date: Thu, 9 Oct 2025 20:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] macsmc: check for missing SMC to avoid crash
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251009183735.1288-1-atharvatiwarilinuxdev@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20251009183735.1288-1-atharvatiwarilinuxdev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 09.10.25 20:37, Atharva Tiwari wrote:
> Users might manually install these drivers
> without the core SMC device, causing

Installing isn't enough; that's not gonna trigger probing any of these 
devices.
Did you run into this issue?

Hitting this should require deliberately creating a broken dts file and 
booting with that one. But if I'm creating a broken dts file I can 
easily crash the kernel in various other ways.



Sven


