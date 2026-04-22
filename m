Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A612F9B61D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 11:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKttHRgNksRfLVo0DvEk3tP1JHxpksMPWqcmRaCbT+I=; b=T2VdYlocaCVGyZCAYFT4EF0bKg
	yQZnJxzcQaWqDUnlH4n5X67+4IAGOdmyobwDOpOMVgNjYw19PN5x+LRIuUVcBPoDYjnrKWOulOyOc
	cd7C9OK4QPzGmGF63FX/IhuuAdRipipJejlUH6miwfUWusJTrU5IRtGv8rOt78F5j77tbLOQyr1En
	yqBXj3/6Wc7TPDRDO560XXQlR1CO6BJJeCwkhLqRNOMPHGx3tFbA9crN2Gxpv0g2mdlB1Cbuv3Ud2
	DCFmzyxWJ6gUAPtX3FOYTM2p//XZO0JsnhL0OpDHslCGz46tfAcTeQ+NmNW8HgnHiHoX1e7N7jZ7A
	QCq1FPfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFVo1-0000000A02m-3s2F;
	Wed, 22 Apr 2026 11:31:46 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFVny-0000000A01c-21Wr;
	Wed, 22 Apr 2026 11:31:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1776857483; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MimHX1btavL7aACKXbdbvysrgAWp7/h5gFGy0xHKQ/Du6bp0FIO7a0p9vtNaUdkOBhW2/75EBsNoXOj3Io204G1/L5hjkdnDKU/xpnaSOCPKZpFuXkOCXyh6OIcCU7tRAiZ6/XnYAvKteHNXCr1SKTpqwrYEwkm0P5QVS9IGBvg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776857483; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IKttHRgNksRfLVo0DvEk3tP1JHxpksMPWqcmRaCbT+I=; 
	b=hPmNYIiolteG3jpCgdNyLhqBseheqVImT3aQo7VSf3ifAMe0hRCvmjcW4aHj0wRdINyu3V09bcVvxgYTCoQhHT67qP2v0H1dUePSPyYyyF/Lpoi9eUaTx2XGs6lDT7ips0weDGhWx1euRa3LOU6XJLwPYlgG5CErywroJr3jI8k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776857483;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=IKttHRgNksRfLVo0DvEk3tP1JHxpksMPWqcmRaCbT+I=;
	b=Ksp9vjk/uOy3DfAI6qlRjw4lwueKETLEFdNgnDwMmrGjLB3l5DNYzPKkVRpmGmI3
	SvPNgAdV2bFvWOmI2esOq6C98aHebioFu+d4fAjUswv5b3Z1WDw9tU3P1FSPRJ07zsh
	aF5AsAg8GR4EePlaQM/B82/lHqEHQXf8qtzBtQIM=
Received: by mx.zohomail.com with SMTPS id 1776857481494503.366495114184;
	Wed, 22 Apr 2026 04:31:21 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Lee Jones <lee@kernel.org>, William Breathitt Gray <wbg@kernel.org>,
 Damon Ding <damon.ding@rock-chips.com>, kernel@collabora.com,
 Jonas Karlman <jonas@kwiboo.se>, Alexey Charkov <alchark@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/6] Add Rockchip RK3576 PWM Support Through MFPWM
Date: Wed, 22 Apr 2026 13:31:14 +0200
Message-ID: <dB_doorKQsK5TdJ40Tv8Lw@collabora.com>
In-Reply-To: <20260421165656.168fe262@jic23-huawei>
References: <20260420-rk3576-pwm-v5-0-ae7cfbbe5427@collabora.com>
 <20260421165656.168fe262@jic23-huawei>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_043142_587500_5CA17E21 
X-CRM114-Status: GOOD (  18.14  )
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

On Tuesday, 21 April 2026 17:56:56 Central European Summer Time Jonathan Cameron wrote:
> On Mon, 20 Apr 2026 15:52:37 +0200
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:
> 
> > This series introduces support for some of the functions of the new PWM
> > silicon found on Rockchip's RK3576 SoC. Due to the wide range of
> > functionalities offered by it, including many parts which this series'
> > first iteration does not attempt to implement for now. The drivers are
> > modelled as an MFD, with no leakage of the MFD-ness into the binding, as
> > it's a Linux implementation detail.
> 
> Just thought I'd point out that as this includes the linux-iio
> list sashiko took a look at it.  Quite a few things and at least
> the first one I looked at was valid (a dereference before a validity
> check)
> 
> https://sashiko.dev/#/patchset/20260420-rk3576-pwm-v5-0-ae7cfbbe5427%40collabora.com
> 
> Whilst this tool does generate some false positives, it also finds
> quite a few things it seems us humans fail to spot.
> 
> Jonathan
> 

While I'm not entirely opposed to this, I do think reviews should happen
on-list when possible. Sashiko is a Google service, so it has about a 50%
chance of still being around in 2 years time. One of the benefits of the
kernel development workflow is that discussion going back decades is still
accessible.

The reason why these aren't posted to list goes into the other thing
that I currently am not stoked about, which is that I'd have to act as
a filter for a Bring-Your-Own-Brain noise generator to pick out the
parts that aren't convincing lies.



