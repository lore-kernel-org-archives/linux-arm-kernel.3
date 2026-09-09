Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B37CC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzaNhATIdhxpC6JVerVZ3GOKWv6+RID4GsaT9j1TEpU=; b=lIZF4lb5SKntZ+lNy83QeYNsLo
	Q0ld5D+2LucWWcGVdkcSmzwI3VgfswUxpZm3pmbxLQs62T/GZrbuEehueI727ec22r1ctCZ97i4kS
	rlDCRqrW+QHg8dZJkTAb/rOKWQmfnmmcHdxOpP2JZ6PFdv4D4nYl0FqwZkOKVDOCqmR18IzozQNRg
	zkHXEOlaTzUpQNsoWdQTNT4/DKjNO6DbYRtUdUDHFH773Mv+GTUQ90Q4ZG0PgNeEoNt2IIsKNArcQ
	xK8MJRt4YgVY9oVSzoIZ5QysVNDGQR3gaN9euioRrWAH2q/c+wXeNedKHf2hvttW3QSm58v78G61g
	oH20PIkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4K7r-0000000C8LD-2tfm;
	Wed, 09 Sep 2026 15:22:15 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4K7l-0000000C8Ea-27Vm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:22:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 392644E415B2;
	Wed,  9 Sep 2026 15:22:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E02760448;
	Wed,  9 Sep 2026 15:22:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5BDBD11C7AF57;
	Wed,  9 Sep 2026 17:22:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788967326; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=KzaNhATIdhxpC6JVerVZ3GOKWv6+RID4GsaT9j1TEpU=;
	b=uwk4BS0i6nO//nIHM9d9pBWfJA4DW3hmwZfzs8dOgKLxSJvWM7pYyOS37njsl+/QpKoOac
	fgzc5gEx2cg1gpfM4DAqMXv/RnYAIVwROK5ZOCP4S7LcbeSPYtTzUtN6wGlN4LlcVF0HT4
	HHTFj4aUACU0gSXhgXX1lu1ZGCPpAbfQe4522I/jx0626Mlj9QVY+s0KpyXyuFvsx3R3ie
	KEuv19ZbKxlaJnVJXCNnwPs6J55/O4ESdnQfEAdSX8jyMxbyCppmnwR0xto2ZLLtvzEDbx
	ItG//eYk5panHRVOFA2v+Uw9hjgGp0twtDVqP0/dis90eX4/YjT2jQFCfGp85g==
Date: Wed, 9 Sep 2026 17:22:03 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sander Speetjens <sander.speetjens@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dom Cobley <popcornmix@gmail.com>
Subject: Re: [PATCH 2/3] rtc: Add Raspberry Pi 5 RTC driver
Message-ID: <202609091522031352f96b@mail.local>
References: <20260909141300.1368790-1-sander.speetjens@gmail.com>
 <20260909141300.1368790-3-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909141300.1368790-3-sander.speetjens@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_082209_706964_0ACEF420 
X-CRM114-Status: UNSURE (   8.12  )
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

On 09/09/2026 16:12:59+0200, Sander Speetjens wrote:
> From: Jonathan Bell <jonathan@raspberrypi.com>
> 
> Upstreaming the downstream Raspberry Pi 5 RTC driver.
> This driver supports the custom DA9091, which is accessed through the firmware mailbox.
> 
> Co-developed-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>

This is missing the SoB from Jonathan Bell


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

