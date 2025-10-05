Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032ADCCA472
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Oct 2025 21:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+Q5QIbzZsyio6/dIB1c7tf9it+A69APCK+Fhn5DQW4=; b=SiloDaFLldTD2kbyhY7VxDuj7t
	H8qEkUc2PuzGe4qtuMye1kz23/J/JXtv0tAhYDCC58o//wp3vfqS/YkDFy4X46mi4PlTD6JYigASL
	h0/vMNmte9AbYqh13V6lES2pYJSDq4hEVFgKAf2F57hvrdWIgnDDE4SsdaUDZBhOh06knGaujUth6
	i9XVQ/Mpo1NpbPWaX4I8VWIm8QTeuaY4nIxmGdCqRvClIPaP5P1doOeuNc6UF7c2og6U7pMP6nDC2
	eLBQlAGCDSSmHzMLsk1tQYWur+ppresq4pesqY6WdpPhLu0HnBx8D3VXsDdSsx1HykTTJltPiAZpU
	oqi5tpjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5WCj-0000000GenE-3JYI;
	Sun, 05 Oct 2025 21:23:41 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5WCg-0000000GemI-1zqx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Oct 2025 21:23:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8EA9F1A1122;
	Sun,  5 Oct 2025 21:23:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F4686065F;
	Sun,  5 Oct 2025 21:23:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4149102F1CFA;
	Sun,  5 Oct 2025 23:23:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759699414; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=T+Q5QIbzZsyio6/dIB1c7tf9it+A69APCK+Fhn5DQW4=;
	b=Vst49NcPMalVhdZ7kL5jQ8d0qhbPcKJSu7ypniyQcJHTFQVWpElRzrY3guDKGe3xXPSdU0
	O0edYuvMwDR5KuTafvfgiiaRM6nBySwbfsAAMIuae94hrTY8Nax8753X2Uizy4z9JDmZN2
	3TCl1aR6EeX+k5tmxd5l6x29wz0nweRmuFeKIxU7v4d/RyX+2HAoKozCpf1CYvaXci0H/w
	6QNJAo8raJ1Rd6Ahg+1YZI6Z5g5yHOHTmmUYzE2EL5a7RNZkkFQrBGOsncZhzHnCgvhFIn
	Nm5OpbnN6DWPVrnnbUMB/veiXy4JmN4LzQSFzbg5gyn4jwpI/5/FOGDve072lg==
Date: Sun, 5 Oct 2025 23:23:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: michal.simek@amd.com, Harini T <harini.t@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH V2] rtc: zynqmp: Restore alarm functionality after kexec
 transition
Message-ID: <175969940416.3796539.10765849167176771730.b4-ty@bootlin.com>
References: <20250730142110.2354507-1-harini.t@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730142110.2354507-1-harini.t@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_142338_646984_86C92A50 
X-CRM114-Status: UNSURE (   9.72  )
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

On Wed, 30 Jul 2025 19:51:10 +0530, Harini T wrote:
> During kexec reboots, RTC alarms that are fired during the kernel
> transition experience delayed execution. The new kernel would eventually
> honor these alarms, but the interrupt handlers would only execute after
> the driver probe is completed rather than at the intended alarm time.
> 
> This is because pending alarm interrupt status from the previous kernel
> is not properly cleared during driver initialization, causing timing
> discrepancies in alarm delivery.
> 
> [...]

Applied, thanks!

[1/1] rtc: zynqmp: Restore alarm functionality after kexec transition
      https://git.kernel.org/abelloni/c/e22f4d1321e0

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

