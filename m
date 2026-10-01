Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F1ECA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 10:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dY76eQFJFbcYtTtHCHhdoCdyDWIvzzfDE47J+yUIxXE=; b=sV5rNn2wsiE3zPK8EenDbwbYu2
	gDkyRpK0sllwHSpcNgr1TWY0my8qtKqjnI1t5m5n1FUgmZf9eBiYM7Boh3cx3hpEwFUR12U9fNiaB
	mkgPNHm/0u3cAHnCR8KilJqAtHvMrmUKD93nSMoM3nWQ+caMjbxfPkz1V5hY49rmn2N6Cx3CiEcC3
	r378oOuDPFoLDUtec3h6tz1BZfc5+NYDLtOqBJnlGzMkeP3znOIvFbgd+FO4Xnede2UuE/YEyMeOa
	wrOMNQkRU+GTEtCZoH21eR3+dI1mb4+iqh2HJoIO4EaA5aLeGVHoGrCC3wFGACYibHf6pa2SnnIec
	gCjdawGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDaI-00000008SMu-0fbN;
	Thu, 01 Oct 2026 10:00:14 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDaE-00000008SLL-42kq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 10:00:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 612021A109E;
	Thu,  1 Oct 2026 10:00:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 344C460341;
	Thu,  1 Oct 2026 10:00:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E84610329611;
	Thu,  1 Oct 2026 12:00:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790848805; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=dY76eQFJFbcYtTtHCHhdoCdyDWIvzzfDE47J+yUIxXE=;
	b=q5KiaogDA3ek6cAs+uG7cZ4CePZVBmJ52xqL7kEvFNBOcY421S3HVNlzyPaw9UKexYAw+W
	KlSq5KHMtBcXa1jCK8pzcW+nY72n5Y/yb3/mI+3uYozc2kpmc7fD7DYdgwa8ThokLg7aKB
	E5+iht4/uhKSG5fYwh2Z+WJ5/OtnrbqqpSixFRXcTzJsSF8RnzdZNSbX3AIF+egeVevFuf
	bIURk6g0zRtgDxeySFJg4FlRV0lGJ+LH9kNzKyLTAGw2bu3wKgQcYAxzaYPssh6yNmwFEp
	cru6mBaK71yTu0Y28N+bGFzp1doORDs+EgpwKUaNddnP0K46Ug8lwizhG/DazA==
Date: Thu, 1 Oct 2026 12:00:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Liu Dalin <liudalin@kylinsec.com.cn>
Cc: linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deng Yingchao <dengyingchao@kylinsec.com.cn>,
	Qin Yungao <qinyungao@kylinsec.com.cn>,
	Luo Qiu <luoqiu@kylinsec.com.cn>
Subject: Re: [PATCH v2 0/3] rtc: ftrtc010: fix resource management and
 integer overflow
Message-ID: <179084877097.656441.12706042901770671456.b4-ty@b4>
References: <B61B30904C7ACEEF+20260827080320.3351155-1-liudalin@kylinsec.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B61B30904C7ACEEF+20260827080320.3351155-1-liudalin@kylinsec.com.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_030011_194152_5B1AA954 
X-CRM114-Status: UNSURE (   9.83  )
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

On Thu, 27 Aug 2026 16:03:17 +0800, Liu Dalin wrote:
> This series fixes three issues in the Faraday FTRTC010 RTC driver
> found by Sashiko AI static analysis:
> 
> Patch 1: Fixes a clock resource leak when devm_rtc_register_device()
> fails in ftrtc010_rtc_probe().
> 
> Patch 2: Replaces manual clock management with devm APIs to fix a
> use-after-disable vulnerability in ftrtc010_rtc_remove(). The RTC
> device is registered via devm_rtc_register_device() but clocks are
> manually disabled in .remove() before devres cleanup, creating a
> window where MMIO reads on clock-gated hardware can cause a
> synchronous external abort.
> 
> [...]

Applied, thanks!

[1/3] rtc: ftrtc010: fix clock resource leak on probe failure
      https://git.kernel.org/abelloni/c/c60478875a44
[2/3] rtc: ftrtc010: use devm clock APIs to fix use-after-disable in remove
      https://git.kernel.org/abelloni/c/d41ee317c990
[3/3] rtc: ftrtc010: fix integer overflow in time calculation
      https://git.kernel.org/abelloni/c/8ef8e9839a23

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

