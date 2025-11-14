Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD03FCE7AA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 10:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFWpQbs9eju7XUpWo9+RZpsWisucaM4bHjkj9224ytc=; b=eRX9WUTkB6qad8gr9eiLT9x2uI
	cSELhJvqELuVYmhnVV7vfxBNit9NzlTiXAX0LxC5zFNF05r00ZlE/jmKFDvT/2gM8uOwRbzOTNRv8
	dwQ96b20vrztD9PxSSuyuexyzh/fzjD4pdhRK/caxL1QwPBDvOGHAU312YAFeYpuROMd7QEFS984Q
	XZovH+0RMQGrB6BqshG/wna6PThqdRh4dJz4JSeZDv8Rzp5bZSsdM9tWmEW9ngZAifM5xP1lzO4wU
	mE90UgOoIGNg9jrKMI64Oq4Kj0WD/u2e+mjtQOpIJtHXSBUomEZr5+HlQS0jBYV3y9IzxEtKwntRy
	O8m/MWAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqoU-0000000BzSJ-10SO;
	Fri, 14 Nov 2025 10:13:54 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqoQ-0000000BzRm-21yI;
	Fri, 14 Nov 2025 10:13:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763115216; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Uo1eI7o0dWFLKj7/RWiJpBOZ/6M8Z+p2twLTGb2REOEa4A0Tc+5V4SqJe8qS7BSZFhyF4CzP5bfubjvCMAccmCY2/9AkBRdPZ178hyhVKn5aGu1WKKkOi6VOgyiJnyib/X/FRYdVtmrGdVtvtUOYCJLCJc30bLO7ODHNIIaUauU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763115216; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eFWpQbs9eju7XUpWo9+RZpsWisucaM4bHjkj9224ytc=; 
	b=AJeHo8Ql0yJqtDr3iYrwEObWN1LO4TyNPgUcJHKtUhZL2GHE5zbK8gnivvvN++0sbs1FgOvj8jf5m8fj4lGHwEt+C0Lcmh4oitdQP9co4peafzH7bI4P32zj47kEKRUO7hIfLL3fpURRKt1/9OrcnPuQ5Qcfg8bYJdr+sqFyHgw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763115216;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=eFWpQbs9eju7XUpWo9+RZpsWisucaM4bHjkj9224ytc=;
	b=koDfGSVzRX8wUzMz6wSjHAiM9ouo73qkbfWQa79+AK9ddKM5YazjaayMrmw+Xcm+
	UWeZHT7+N8YhIHbx4WRpKK4uCigI/yRDj+QFp2e/KpNc06eGG6ujr90riCSFyfuZorT
	4x5D24VxcgTcLAEN4K8K8ib5Wm7FrDGXzvEAyuek=
Received: by mx.zohomail.com with SMTPS id 176311521554345.92633741698205;
	Fri, 14 Nov 2025 02:13:35 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Damon Ding <damon.ding@rock-chips.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Lee Jones <lee@kernel.org>, William Breathitt Gray <wbg@kernel.org>,
 kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
 Alexey Charkov <alchark@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org
Subject: Re: [PATCH v3 3/5] pwm: Add rockchip PWMv4 driver
Date: Fri, 14 Nov 2025 11:13:29 +0100
Message-ID: <9941350.lOV4Wx5bFT@workhorse>
In-Reply-To: <fgu42esufq2x4fcccncqs3hlotih2gqmws5atotlaznuahoslw@34vblr6vboze>
References: <20251027-rk3576-pwm-v3-0-654a5cb1e3f8@collabora.com>
 <8a6e920b-9565-4161-9d71-63f924593c23@rock-chips.com>
 <fgu42esufq2x4fcccncqs3hlotih2gqmws5atotlaznuahoslw@34vblr6vboze>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_021350_583388_40177DB8 
X-CRM114-Status: GOOD (  16.47  )
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

On Friday, 14 November 2025 10:51:27 Central European Standard Time you wrote:
> On Tue, Oct 28, 2025 at 04:16:26PM +0800, Damon Ding wrote:
> > Hi Nicolas,
> > 
> > On 10/28/2025 1:11 AM, Nicolas Frattaroli wrote:
> > > [...]
> > > 
> > 
> > Tested-by: Damon Ding <damon.ding@rock-chips.com>
> > 
> > I have tested all the PWM channels in continuous mode on my RK3576-IOTEST
> > board.
> > 
> > Test commands are like:
> > 
> > cd /sys/class/pwm/pwmchip0/
> > echo 0 > export
> > cd pwm0
> > echo 10000 > period
> > echo 5000 > duty_cycle
> > echo normal > polarity
> > echo 1 > enable
> 
> Thanks for the test, very appreciated.
> 
> I wonder what made you test using sysfs instead of
> https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/libpwm.git/.
> Is it unknown? Too complicated? Other problems?

Can't speak for Damon Ding but this is the first time I've heard of
libpwm, so I think you do need to market it better. :) Perhaps by
mentioning it in the PWM subsystem docs as a way to interface with
the kernel, if that's permitted by the docs people. (It should be,
since libiio is mentioned for IIO.)

Kind regards,
Nicolas Frattaroli

> 
> Best regards
> Uwe
> 



