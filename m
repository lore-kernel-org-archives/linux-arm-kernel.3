Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B057CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 16:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYe1rF+N3ZLuSJkfqVJHQzeQ77pZlLLWMRDa9Ka0Sfk=; b=AMICFmVDuhIVRgNZPBObwIbqBJ
	tX1/BRg2BaGTP6ZBrsnKcKaSyH5VW248yTmOZAEzEHdZYSvmoC6uriDoAuUmxyytM5+ubK2gVihvG
	E4KW8aWeTioec4d+vr+qmW2WD3Iz9DaJPM33381e0dpVfH+ivbJxHCNSN71zJwpjsa8MLTchls8/j
	mYOmuhI2dFf9gVwCxS+lvTM8UKIcNSEscmk3sBX4URh1jm85UvXcKvDGg4Ocua7kRkbR1drK6BUsD
	24UBKLi8PqHWux6WxvFNZMmxur5lRbMYdOna4UBekb2S5q7bACNdEKpR+nfBZLWR1TwzV7/MTCQz1
	8Ek66nyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJvn8-0000000DeoC-22Zy;
	Mon, 04 May 2026 16:05:06 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJvn5-0000000Demi-02yR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 16:05:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 769061A3511;
	Mon,  4 May 2026 16:04:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4514F5FD5F;
	Mon,  4 May 2026 16:04:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 114BD11AD2C16;
	Mon,  4 May 2026 18:04:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777910696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=wYe1rF+N3ZLuSJkfqVJHQzeQ77pZlLLWMRDa9Ka0Sfk=;
	b=HhcvF79Fgl/gi878K+SULv3jDthK7CYvFrofeHDHBwnORhMPOU+HlEWKMJo9iOs7aHPrp/
	HJj5X16BDJQ/n8bfMIwyFFHOI+TwlRxFoqXPi9aW9/S7cJOlrE9PlGvnKSOZwn5VWO9oxs
	VBcHcENUHF9Y8o7yE3fr5wpH/24gcR9QkFo5IfE9BJTq0ruSchb24aY/4lmCWi1YjttRWi
	X2KNu/P74uM+NNFySn81yhxw/xy5pKuRugC8prV9cFdUlpeNadn87Ii2tSb+HQswSgtvyE
	6g599dza+1Ps5Upye6u/WHCb0O94Yjcd1n/e8WLkZvQ0v7/nK78bijnO6VyWTg==
Date: Mon, 4 May 2026 18:04:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linusw@kernel.org, Maxwell Doose <m32285159@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] rtc: ab8500: replace sprintf() with sysfs_emit()
Message-ID: <177791068700.1168135.10171466794848460029.b4-ty@b4>
References: <20260503201236.29685-1-m32285159@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503201236.29685-1-m32285159@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_090503_195387_D7A36976 
X-CRM114-Status: UNSURE (   7.11  )
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

On Sun, 03 May 2026 15:12:36 -0500, Maxwell Doose wrote:
> This patch replaces sprintf() with sysfs_emit() to ensure proper
> bounds checking. It also simplifies the return logic by directly
> returning the error after logging, instead of logging, calling
> sprintf(), then returning.

Applied, thanks!

[1/1] rtc: ab8500: replace sprintf() with sysfs_emit()
      https://git.kernel.org/abelloni/c/b72386864481

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

