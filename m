Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780EBC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 20:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/g5yhOWPORmK9ogzAWJP38KD+VTJ2iKQXh01FcOmmw=; b=Qf4xCRT7u5C/dYCQ3ICWCvsq82
	N7t+ojC2Gk1tKNla2fziZuPRRrdBUk+uMFH10Q+qruHCWnOy/2T1VxOaVvWD/TcdGeMkLrSM8D3I3
	GC/yRJmdfgTHbYPisqTJbW6GDrJa8uqbeNR0AZwbqowldI1wXr+dfTCir3s+E+p1Po1ygN22qdOsI
	paJ6+SsMc2btE17k8bexh52GIaERMrBiduGsLXhYuxp1QHxUZp3gzLO7bUi2v3WbK85G+Ez1BUMSH
	5dKe98Z3RY9grVKx8gKwcEBC30T1Emgyz+GA1vddeTsJLfFIJHj2KgtyHwzlPcAkHq324xWGIHdwm
	O7zkNg3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFIoY-0000000GIz5-2uxQ;
	Wed, 14 May 2025 20:34:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFImW-0000000GIfj-3rsk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 20:32:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B674629FE;
	Wed, 14 May 2025 20:32:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A41C4CEF0;
	Wed, 14 May 2025 20:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747254768;
	bh=kLT7AGaYUt0x4NzoA2YDU9G75SMw3aG+JzfYzl7I3Eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ICG+eVIIpxahdMCHBUGlL9M1KEwP5DFHg9pi7dUBMp4+rwzaWaJba4pXL9DkEyN8Z
	 ZTAkn+NGT3KYeJ1DgU3+z71ZUbSBV6fAkuIcAvQ8F7OUbbUeZ6f/S4oVl7L4ZM0FVq
	 Ig5VueF2TkPXd8jcIRySrHhRwF+kNg6nbqhor7FHnLZg11+3nGr1c0ViVbqtwn8GYF
	 GY08FAhLWl4iC6ddTVCTUb75VoXSVU7kaZONDMpCV5ICN1ivdoCCkTsr8bM7hWv1oq
	 BqRPj7dvoi1PqgRSyqurSy1201ox26alOgKD1B4TpmvJVpUBeYPWPce5qAJTVGx+HY
	 yhj85+yTp0UIg==
Date: Wed, 14 May 2025 15:32:46 -0500
From: Rob Herring <robh@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, R <rqou@berkeley.edu>
Subject: Re: [PATCH 0/7] Support exposing bits of any byte as NVMEM cells
Message-ID: <20250514203246.GA2958656-robh@kernel.org>
References: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
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

On Sat, May 10, 2025 at 07:44:40AM +0000, Sven Peter wrote:
> Hi,
> 
> I'm preparing USB3 support for Apple Silicon Macs for upstreaming right
> now and this series is the first dependency. The Type-C PHY requires
> configuration values encoded in fuses for which we already have a
> driver.
> Unfortunately, the fuses on these machines are only accessibly as 32bit
> words but the Type-C PHY configuration values are individual bits which
> are sometimes spread across multiple fuses.
> Right now this is not supported by the nvmem core which only allows a
> subset of bits within the first byte to be exposed as a nvmem cell. This
> small series adds support for exposing arbitrary bits as nvmem cells.
> 
> The second part of the series then adds the nvmem cells required for the
> Type-C PHY to our device trees. While it's technically independent I've
> included those changes in this series for context.

The idea in the DT is normal addressing is byte-wise, so the only thing 
needed to specify bit level addressing is a 1-7 bit offset.

If you have access size restrictions, then that should be handled by 
your driver. The nvmem layout shouldn't change because of that. You 
could perhaps define the access size with 'reg-io-width' property, but 
really compatible should imply it.

Rob

