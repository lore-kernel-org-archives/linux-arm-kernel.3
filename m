Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81540E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 08:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YadcVfReBs2XK7Wp6qew5wyT/6xKrDqXPFq+/V2+s1M=; b=1Ntq8yzX8scrJSWcKFu1SfndB8
	G/vynW3OWbYhs4yQ2yHyvRSo/4Adcfbj9z0ZzqR3pI8SlYZEom3fxFCcldD0+Ya6F2xiv5oM/zQD/
	MHZhTyNUh6PCZf2yz1kRDxKtru7imzFu+Ik2+SRRFJ+uyWBMIoMBl+CdxfOD3+OA+dtiZCWety/QT
	9RRw2BeAZMVNhZit+EoUOEPK0GSxMbAqNbGIWORvIwBpjXuY62RkOAgNVLGhtau65V+vKcjqjCeIs
	bdElrKeb7cGKRHmw739ITqDhoB/tgHkDLjjsoZw9fWjxKqDaZaA4AUzb4GFDD23wEcwfpmqKP789s
	ND8uiPyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIkSq-0000000BqL7-24JN;
	Wed, 04 Dec 2024 08:10:28 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIkRq-0000000BqEm-088N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 08:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=YadcVfReBs2XK7Wp6qew5wyT/6xKrDqXPFq+/V2+s1M=; b=SSt9Ck6rXSe3GL44TdtuQwfFD5
	QJsGr8JSdRzsTF11jrSZ/UX61yTgUff3ext3xzkyh+LZMZ5MBhTlNpWdfkWT/NOC24SMpI4ywpuwO
	4rSS5zFJqF1Os+KQcc8JiDmVk02TBUo6YpXDWIGv4Gu+3glOfM2x4tN0wxOrSaleU/Als43WjQwvP
	NLXQV6Mb/fu1k4WNKUIR7LxiLWx7fHyagZ5Qf2bWnSldxv+35sUbHr6U9sgyvgVF8K1elPJGQkNZF
	6uBpGGttksW6JfgwZhuHhxC7yGtUl+FRsbiS+suuWv4mkrgRMLqOeYNR+jzVfPwo6aAYEF3UuwZTw
	IUEQIyag==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tIkRk-00067Y-46; Wed, 04 Dec 2024 09:09:20 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tIkRj-0002A9-2K;
	Wed, 04 Dec 2024 09:09:19 +0100
From: Esben Haabendal <esben@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  stable@vger.kernel.org,  Patrice
 Chotard <patrice.chotard@foss.st.com>
Subject: Re: [PATCH 0/6] rtc: Fix problems with missing UIE irqs
In-Reply-To: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com> (Esben
	Haabendal's message of "Tue, 03 Dec 2024 11:45:30 +0100")
References: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
Date: Wed, 04 Dec 2024 09:09:19 +0100
Message-ID: <87cyi798eo.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27476/Tue Dec  3 10:52:11 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_000926_359321_1C9F0883 
X-CRM114-Status: GOOD (  15.08  )
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

Esben Haabendal <esben@geanix.com> writes:

> This fixes a couple of different problems, that can cause RTC (alarm)
> irqs to be missing when generating UIE interrupts.
>
> The first commit fixes a long-standing problem, which has been
> documented in a comment since 2010. This fixes a race that could cause
> UIE irqs to stop being generated, which was easily reproduced by
> timing the use of RTC_UIE_ON ioctl with the seconds tick in the RTC.
>
> The last commit ensures that RTC (alarm) irqs are enabled whenever
> RTC_UIE_ON ioctl is used.
>
> The driver specific commits avoids kernel warnings about unbalanced
> enable_irq/disable_irq, which gets triggered on first RTC_UIE_ON with
> the last commit. Before this series, the same warning should be seen
> on initial RTC_AIE_ON with those drivers.

I don't have access to hardware using cpcap, st-lpc or tps6586x rtc
drivers, so I have not been able to test those 3 patches.

/Esben

> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
> Esben Haabendal (6):
>       rtc: interface: Fix long-standing race when setting alarm
>       rtc: isl12022: Fix initial enable_irq/disable_irq balance
>       rtc: cpcap: Fix initial enable_irq/disable_irq balance
>       rtc: st-lpc: Fix initial enable_irq/disable_irq balance
>       rtc: tps6586x: Fix initial enable_irq/disable_irq balance
>       rtc: interface: Ensure alarm irq is enabled when UIE is enabled
>
>  drivers/rtc/interface.c    | 27 +++++++++++++++++++++++++++
>  drivers/rtc/rtc-cpcap.c    |  1 +
>  drivers/rtc/rtc-isl12022.c |  1 +
>  drivers/rtc/rtc-st-lpc.c   |  1 +
>  drivers/rtc/rtc-tps6586x.c |  1 +
>  5 files changed, 31 insertions(+)
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20241203-rtc-uie-irq-fixes-f2838782d0f8
>
> Best regards,

