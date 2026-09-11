Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE04FC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 07:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLOv9PqRHm0Dp6AEU3FrEQYqlkc9d2Rysj5SU5cG6RY=; b=x4NIUfVjS8wi814l8Hcme977KP
	3b9Ffp6OfqRHYebGUvOPerDuNc05R/6jU7bgJGo0aLi34mLUK3FeGTIV1HU6TIe5XpNKDOFfYhesz
	gPh8gDA7fwBUvErb7Ei/h8zg0NrqL2RkHY9/XalhAzQG+MNlq33AG962nzMAsKkpmMzMZce4AF7/m
	QmCWfCqEaE0Mf2Mqvbrt3jcdpJfmhOuR2bVQ3/hjzo27cULkRwZrw7C328ZQZ2Pl54PMggAsy4Mk4
	Yc/OayESTb5YkNK4IA1g7Yh8fRZcwyNYpd4sf7CbqBxbcs4z5rDDoXGiX8xl32PN3AaboRf62MjLx
	I1d+X+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vHw-0000000FzCg-3FfZ;
	Fri, 11 Sep 2026 07:03:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vHw-0000000FzCY-1eWq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 07:03:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D0A9841399;
	Fri, 11 Sep 2026 07:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3421F000FF;
	Fri, 11 Sep 2026 07:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789110187;
	bh=fLOv9PqRHm0Dp6AEU3FrEQYqlkc9d2Rysj5SU5cG6RY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gg0J95fHymQW9M8DoQvwqtACHc8nmHNl3IQWWBWUFvaP/N3OpVH0jrAGtc44djAkT
	 3+G3/D5vLC4wPjCNtA0WMtNa/MO2TkPe+ebtT0UBqnDRZIkTsEYY1dAJmZPRs98rUD
	 MTp1DoYUVl4Xyk70tm07cBt9bKGNME+RcofIzO0pHken0ud47IeATdooHTXZXjsNX+
	 6/K92K/LJCRnlHk5J3CkxuKAOYAfuojyK1U4E7MqSpT85p7Z5gLNfE5K07Vcov9cEX
	 5Unv0Z/nW7hykBvwro5/waAjxNj8kmwAmp9xKsZUeK9e5HOSQzr27Q2OGR3euIz1ut
	 laaSeYJmaKqFA==
Date: Fri, 11 Sep 2026 09:03:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
	Karthikeyan Mitran <kmitran@axiado.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: add Axiado AX3000 and AX3005
 PWM fan controller
Message-ID: <20260911-melodic-naughty-kestrel-efc72e@quoll>
References: <20260903-axiado-ax3000-pwm-fan-v2-0-ef43df46163e@axiado.com>
 <20260903-axiado-ax3000-pwm-fan-v2-1-ef43df46163e@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260903-axiado-ax3000-pwm-fan-v2-1-ef43df46163e@axiado.com>
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

On Thu, Sep 03, 2026 at 01:38:39AM -0700, Petar Stepanovic wrote:
> Add a Devicetree binding for the PWM fan controller found on the
> Axiado AX3000 and AX3005 SoCs.
> 
> The controller measures fan speed using a hardware tachometer block.
> Fan speed is controlled through a PWM signal supplied by an external
> PWM controller.
> 
> Add a MAINTAINERS entry for the binding.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---
>  .../bindings/hwmon/axiado,ax3000-pwm-fan.yaml      | 72 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 +++
>  2 files changed, 80 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


