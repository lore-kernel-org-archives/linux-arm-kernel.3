Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B0FCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 15:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8wlgQwiaapKDvuuMcG/LHnApbqP6But5sj6HSYDOJ8=; b=G/Md38gvgbhhr3lJA0WfAUyX87
	u/znmhifo7ysn5ES+VJY6pB94lZbcpcgTBPLO4Pux+o8V7pnxkuJcYOOd2k7UJciKdKQFFM99eeZF
	cvKVvt/Ho1/6HlSpvODqgihLkc84Xte5AQXwsgpeFsKesQlY/GGvOE3wbTupwBDtzKzQ8sxXJlgNh
	oO2Cx04CnCN3wrEwVRO2ri80gw/cl9R1SHVjE2jIdAZJJwy8lZneeiIE1FO2HNPB80RwpO+rFobfu
	kS2OE1xt/WhAOiDRwiEMRTg0/XDncTEZguef2LFetFZ6EwT1ecwhzD6tKvfEIR4btVoFPlDSaAhNe
	GghjPNxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6xd-000000046oN-3udv;
	Sun, 09 Nov 2025 15:04:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6xa-000000046nx-2IN0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 15:04:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5468D402F6;
	Sun,  9 Nov 2025 15:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5045C116B1;
	Sun,  9 Nov 2025 15:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762700644;
	bh=IUXxyPcnqpDHiv1qOb2dy4VYfAq79Wb3o8hOBTShskU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DkIOeFV1+f18yDyApLUJy74bTRcPycSJScKMDXtjh3tIhxmXLqADiOOBXZhAF0uqo
	 h3rVu6lHHaCdm2TISoR9+A117zDZhQKc8IM4iXJSOMDV7LaHpYL6eK3nMWlDBiLRur
	 YBD8oaHA44QzSL665ddvLAmpZvaph/jDhKh+C74COZxwvp7q1k7PxUIyvLiUA/USjB
	 czfi8cgRi9iyQo3bV3TOzBNxFs0QDaxxbFOfxh3WB23vr+yHNKCQC2o8FPr3vxUx33
	 qlBAE3cjey5WcPjgh3W4IzGu/U6zai62L5drBm1ksFsV6wJKgHOhbrjVLM7oyNQM5q
	 5fmyCrqvVBVLw==
Date: Sun, 9 Nov 2025 15:03:57 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>, nuno.sa@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joel@jms.id.au, andrew@codeconstruct.com.au, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] iio: adc: aspeed: Add AST2700 ADC support
Message-ID: <20251109150357.513e3a25@jic23-huawei>
In-Reply-To: <3d2fde56-d82e-40c2-9d0b-2888160a642b@baylibre.com>
References: <20251103105217.1764355-1-billy_tsai@aspeedtech.com>
	<20251103105217.1764355-2-billy_tsai@aspeedtech.com>
	<3d2fde56-d82e-40c2-9d0b-2888160a642b@baylibre.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_070406_615731_5F0D5174 
X-CRM114-Status: GOOD (  14.12  )
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

On Mon, 3 Nov 2025 09:20:48 -0600
David Lechner <dlechner@baylibre.com> wrote:

> On 11/3/25 4:52 AM, Billy Tsai wrote:
> > This patch adds support for the ADCs found on the Aspeed AST2700 SoC,
> > which includes two instances: "ast2700-adc0" and "ast2700-adc1". While
> > they are functionally similar to those on AST2600, the OTP trimming data
> > is located at the same offset (0x820), but uses different bitfields.
> > 
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > ---  
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> 

Series applied.  I'd have preferred a cover letter given more than one patch
as it both gives a meaningful series name in patchwork and provides a common
place for replies like this one.

Thanks,

Jonathan

