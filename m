Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A88DC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 10:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5JwhEag+HNgoKIguvpD0aX73WZHK+rxY2Z3LP9I40c=; b=Oy/aolF4UWwv8tOv04gfb4/pXl
	OtHEN8wZGzjYUjYHPoBmO4SB3cITFoUS44VGARP4mVpcIeRXG4BBp4nlltSrXSZLiIHKHreuCzG+K
	k/zbG5Na436nRIFCarys1SGeSOYJtIO6yAmV9aXoICwsUnPUqaXehavjqYDr7BGtMTYiuAFBqS3/3
	W0x5o+4WY8ARM1ZoIDliwT13FWBNGwOZf+/hTUYP2ym0Dsas3s9QRl1GNavq2JYz8zh3M57LsimCG
	FFwWnxbg919lZlxBtsgDUn0RueKWnUXe08zFdk8MOUoATLEC+41Wi6KOer2y1T3/1YcTlUaD/GLrC
	YotDJZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqLQ-00000008cN7-3RUN;
	Wed, 19 Mar 2025 10:08:16 +0000
Received: from ni.piap.pl ([195.187.100.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqJj-00000008cC0-3FsD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 10:06:33 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 2D8A3C40828A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 11:06:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 2D8A3C40828A
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: ARM64 GICv3 IRQ handling on i.MX8MP
In-Reply-To: <m3y0x1e4b2.fsf@t19.piap.pl> ("Krzysztof =?utf-8?Q?Ha=C5=82as?=
 =?utf-8?Q?a=22's?= message of
	"Wed, 19 Mar 2025 10:51:45 +0100")
References: <m3y0x1e4b2.fsf@t19.piap.pl>
Date: Wed, 19 Mar 2025 11:06:30 +0100
Message-ID: <m3tt7pe3mh.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_030631_993432_C061B00C 
X-CRM114-Status: UNSURE (   7.88  )
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

Me:

> - especially with the busy loops, the I2C IRQs appear to work in some
>   sort of polled mode as well - the el1h_64_irq_handler() isn't called
>   before i2c_imx_isr(). This is fast, though - ca. 1 us after the end
>   of transfer.

It seems this is actually called by el0t_64_irq(), not a polling.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

