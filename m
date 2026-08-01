Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403C0C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 01:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcL2MQ0L53z3f4PzFpgfMlNLyAs1xeASuNlN5kmxois=; b=u7a8BrEOZcpBYjB02Qfua7XpOS
	7ihWes4nKGzsU60EW9KcQSGK5Dsh8+BhjlxtfJKjMWwf3xVsoavkTUnD9FmbjxUlkjSa5sFlDtYG3
	+DBp3odkx8IiVRDnf2JghITIYGIJOotY9lpCONAJ3bkTCz9wUYIqnBr2PxtSuyBi0tRae7LltSysv
	qfAkuJ2WiwNRJ2Pb0GqCfhTEuHF//TRRr3BiNmDDtTWwNg3tzhRQiCp4T7cZi1t1pHpPq9O7Xtecm
	9ADC3CkVt5LAJTaPWn0bfLXrBi85KGUdALb3MENKb5SjI8MbMcwvabalYiGqGhKxPcweY7dzoSLbc
	3ecR77YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpymR-0000000DoPA-1XSJ;
	Sat, 01 Aug 2026 01:44:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpymP-0000000DoP4-0NHV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 01:44:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 625E243999;
	Sat,  1 Aug 2026 01:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FBEF1F00AC4;
	Sat,  1 Aug 2026 01:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785548688;
	bh=vcL2MQ0L53z3f4PzFpgfMlNLyAs1xeASuNlN5kmxois=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QuvVUmMVC7qfCurZ7pQA6Kr2AOCRvrRz+AIoNsyBtY+HZBCzD3SF/e0q7CfQ3F2j2
	 /twEJPXNE6eXSkcp3Ooo7+LwAh/+hXf2mDhIQGQZXiQEKt8sy5Wyc3uHAUwhWm1ImF
	 mz8fZquP208z15e2M59odTDJa3UQHhGeef7p/g0YPo/3XVy8ExIYqIO1jvxNyxP7sM
	 U/cjYIM0/c01OK76lKFZDclxla5as3x8/va9NNBj+4TByazK7luLA+lLYVP6+h0DQZ
	 3WC12Fduh2+ZiS/IUKweDa2MRSbHIhCB47DesDsftS69DFW8649DT+s7A0uaWSLWVS
	 H6+X0hqTdhhwg==
Date: Sat, 1 Aug 2026 02:44:42 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: <ehristev@kernel.org>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
 <andy@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
 <Jonathan.Santos@analog.com>, <jorge.marques@analog.com>,
 <joshua.crofts1@gmail.com>, <jishnu.prakash@oss.qualcomm.com>,
 <antoniu.miclaus@analog.com>, <mazziesaccount@gmail.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 06/16] iio: adc: at91-sama5d2_adc: adapt the driver
 for sama7d65
Message-ID: <20260801024442.49bfad4e@jic23-huawei>
In-Reply-To: <20260727122633.117435-7-varshini.rajendran@microchip.com>
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
	<20260727122633.117435-7-varshini.rajendran@microchip.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 27 Jul 2026 17:56:23 +0530
Varshini Rajendran <varshini.rajendran@microchip.com> wrote:

> Add support for sama7d65 ADC. The differences are highlighted with the
> compatible. The calibration data layout is the main difference.
> 
> Update Kconfig help text to mention SAMA7 SoC family support.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
Hi Varshini, 

I looked through the rest of the series and don't have any other comments or
questions.  Thanks,

Jonathan

