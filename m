Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451DBCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 16:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkjM0zby/ZXNMw5BOq1xgd5rRfLeQwnBiSFFspFSujs=; b=DCIbR8oPtrjYZSWSMlLc2rwJwx
	6mTQbbdT9+H2XYgZhvs3jkauxiuCsM/TlJLZy9Mga7uQ0xUoOyo1dmCVQaDZ2dfH/Vs/8EpUvIEcV
	BFNviIwC0AuwGpEQMb29gg4mEyofJ3lKjHb47Ydpwphl8ruFvBoqVHr66cAEqMHLD8bRhG+hZXv6k
	lgTlMTaBnCXaUoLZKPl0b9rZuwEUIDaw0a+VT054k+pmJjjTKBVOnJNYbKW2hMSjo3lKOZiFZNNEc
	qc1crAqAu7nEdGoxWWPAeIc7eYDnihPTVfX5X/Dov2Jt83DLmpgyly0HoIjiwtT12b1j8XNO7CXCF
	Qb6v11Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7cLl-0000000AKkw-37Ld;
	Sat, 11 Oct 2025 16:21:41 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7cLh-0000000AKii-1rzs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 16:21:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B9A18C08CE4;
	Sat, 11 Oct 2025 16:21:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78A66606EC;
	Sat, 11 Oct 2025 16:21:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E03CC102F222F;
	Sat, 11 Oct 2025 18:21:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760199685; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=XkjM0zby/ZXNMw5BOq1xgd5rRfLeQwnBiSFFspFSujs=;
	b=ktu1mU4OxDqK649s6HW/JMOYQjzaLv6UMHBjGPZPgikmplOX/f5Vt179x0fhdsNjYGF+RM
	ZTqACoug23PT0wbdb3gkq24EdD7fGsQ/KM+BmXWN3Ekp9Nu73/AZ96Fl95QhSdbmtScxbv
	4x44SGiv//wY5nBVEY+IwvzbO8U40s2a8geO2wWk3XlDzgvbaHpjQvn+YHa/VfSCb7bCpj
	UOVMCkqEqLAJYfHEPZkSvFJEDvZIMlTJVCdO3susBNxB2NB0wUaU4Kz4bMDB7iRJ9Adlny
	HBSmhx1X/0XaQBxolOnIli94nydqvVp7ghYjSDKCCMu9/Tl+ylI/PH6RHoCTLw==
Date: Sat, 11 Oct 2025 18:21:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Esben Haabendal <esben@geanix.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/5] rtc: Fix problems with missing UIE irqs
Message-ID: <176019962507.48002.14768476957818198664.b4-ty@bootlin.com>
References: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_092137_660753_45DBA51F 
X-CRM114-Status: UNSURE (   9.21  )
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

On Fri, 16 May 2025 09:23:34 +0200, Esben Haabendal wrote:
> This fixes a couple of different problems, that can cause RTC (alarm)
> irqs to be missing when generating UIE interrupts.
> 
> The first commit fixes a long-standing problem, which has been
> documented in a comment since 2010. This fixes a race that could cause
> UIE irqs to stop being generated, which was easily reproduced by
> timing the use of RTC_UIE_ON ioctl with the seconds tick in the RTC.
> 
> [...]

Applied, thanks!

[1/5] rtc: interface: Fix long-standing race when setting alarm
      https://git.kernel.org/abelloni/c/795cda8338ea
[2/5] rtc: isl12022: Fix initial enable_irq/disable_irq balance
      https://git.kernel.org/abelloni/c/9ffe06b6ccd7
[3/5] rtc: cpcap: Fix initial enable_irq/disable_irq balance
      https://git.kernel.org/abelloni/c/e0762fd26ad6
[4/5] rtc: tps6586x: Fix initial enable_irq/disable_irq balance
      https://git.kernel.org/abelloni/c/1502fe0e97be
[5/5] rtc: interface: Ensure alarm irq is enabled when UIE is enabled
      https://git.kernel.org/abelloni/c/9db26d5855d0

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

