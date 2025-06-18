Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E0DC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 02:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AR29u6dqmK6ehegRcbbijgUNzEMQNsv2oGLo6lBr3lU=; b=jQaLJdALAxViwUDyNXXncVm2bT
	as6k/UtVyb34AXlWMe1/J5B2y2cnJTyUYt+wXLHITJo49HZe0KSSqG4tl7xWeYkH/zOQhGNYYaT2s
	v50zYLqwMG/ZfKpYx9tE5ersTrLK3ZFwAAfYCZbUwaKfF2jRR2Z7oe+KJ1un1H2fKrTL4ZFS/B0zC
	wecr11tQ50QIyyf9HUJw/4QmSIc6EPwDcN/yQUDRIWJFVbrOjjZ5MkffS1QWlkKBN0gdkKarAEJBG
	ncbj/l0hywBh7gHFPgrE4Q7sSKDHw9qoS8yKpWdovNKGWQflnlUguWwrRHmzYBLE5KVbNE84XtISG
	EXItSQmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRifA-00000008pD8-08xl;
	Wed, 18 Jun 2025 02:36:32 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRibX-00000008ozc-2TDW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 02:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750213966;
	bh=AR29u6dqmK6ehegRcbbijgUNzEMQNsv2oGLo6lBr3lU=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=c8yy43LxWxntWCAOlzFtJQAOwl4vSyG4RXS1nvNxQc2BzJW8ypHz9yJ/Q90//MlXV
	 Oma6DS17CsIYdYRhl7qtRMRRNMGkjbmYg9nghh3dwVcaQRzZfuxE02c1a5bZjdhAo3
	 Ly4x5rwRK9gQVoI+Z4+3xall0uLUpOT/BSZd5gP0dZJizBU8SYGXQ/1fxPTjpxg8ps
	 aP63LasTIY3Wz2orNMECmD7DHxpPJhxCYsqKSZyoTA/wP9rpX3VgIZyn+mkCuw9Cj2
	 AXoxBORWQHcrQ0M29SNwhxuMI3DwYyC1A5RRqoEODdIkV0n5ewfG0ESnqm4NN0a37C
	 i2LWYha0Dx0Fw==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 60A1D640A0;
	Wed, 18 Jun 2025 10:32:45 +0800 (AWST)
Message-ID: <100bed083e9a98432888c0b1db8cbc445f96cd64.camel@codeconstruct.com.au>
Subject: Re: [PATCH 3/8] mmc: sdhci-of-aspeed: Patch HOST_CONTROL2 register
 missing after top reset
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cool Lee <cool_lee@aspeedtech.com>, adrian.hunter@intel.com, 
	ulf.hansson@linaro.org, joel@jms.id.au, p.zabel@pengutronix.de, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 18 Jun 2025 12:02:44 +0930
In-Reply-To: <20250615035803.3752235-4-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-4-cool_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_193247_814469_AE2F3534 
X-CRM114-Status: UNSURE (   5.20  )
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

On Sun, 2025-06-15 at 11:57 +0800, Cool Lee wrote:
> HOST_CONTROL2 register will be cleared after top reset,
> it needs to be saved/resotred while reset.
>=20
> Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>

Please squash this into the first patch.

Andrew


