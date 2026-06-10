Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7343ACD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 11:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qbr4ROVH+jnt4tP/9mv5QAbtw8gA7hNTlWAUzPbg2+k=; b=Pc8geyhcGrNwhBYKd8n/vKGRU/
	Qw2U24FAxUPLGl/LV0KoZ3x9GkmFHuL5I8qaACccx7dE9CFvSPL9FLa1x6b36uMvDuzY04gSUQaXS
	aQniko/MsiGiAAKeflFi8gG+Z4jTlbJygGUrgHOwf6E1FmRV/4EKpCElf8iBoD7RbGTLVwILxTAHs
	xDKCDfdYEhQimGD4iKiV50BG89ovV/v5DqwuFZl/u3LnTXXHqqMlGr8gwqPAEegUT8A2FQOiybCN1
	YnaP7d2kmfnA0r98EZ4smMcSKfcSs+MHyXaCoKjwCzLIEJOH9D33PriRZ1QSWDxmcmxoMU9gYgdAL
	+z80msbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHTa-00000007ZZw-03iF;
	Wed, 10 Jun 2026 11:52:06 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHTW-00000007ZZL-37HW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 11:52:04 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 49E0D1D000B5;
	Wed, 10 Jun 2026 07:52:01 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 10 Jun 2026 07:52:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781092321;
	 x=1781178721; bh=Qbr4ROVH+jnt4tP/9mv5QAbtw8gA7hNTlWAUzPbg2+k=; b=
	I60ba5Cj6DsveHCsg/ZOr3eoF7690GZ07OPp5jm+Q0NqcKgTHSH4NIAUBk5mYG/T
	hYTZN1dheeg4nLnu1qtrJZXzvrQDHZh/Xz7DNU/pD9jgkoadydvbOfN5/6Y7fcPd
	vAsiMQexpiwUckMaLgY735DBTkWPYXCKyexJU3q8VdBQvBPwMFZ47SHCiKRY/4ih
	K/xNubhkbPntZw/l7XZ/LVrKWhRbpaM/Bn+iKYmbqu8SzPAwNv8oD8uTj/ru/pZI
	t+zMTvaN0RzkBvgDMQldXh3AkAJDsR0OuaWodENz3ZgOJy5nh17WMniM5HqxBsCI
	WZcxrxaKK8tFVIQmc3ZAkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781092321; x=
	1781178721; bh=Qbr4ROVH+jnt4tP/9mv5QAbtw8gA7hNTlWAUzPbg2+k=; b=I
	EV9VM43ZgrzUZCqQy6trvY2y8OoI7rzF8ItGKLO61WL/EiAJQsQolyNZHwBFfSld
	sCSDADJNgTHPO1997s42D9fWljm0Up5+kEwksei6hUyUGDnTP6C/rp1TaXC745C3
	HT4Caqh0F+yoBIECFBwbx0ToxZEdKQlCZKiam2lWZYa4CTtRog2f3Tur5l98IfLN
	n22JliFjGKL2rwx4dQAWpuWrOikmAnLfawV741HBBr5g6hakh7qQ2KtbN2FK1aoO
	bs+Gfjy2gsl6GagQvaXzWG2bp95itV1P8nJq/Xs24f64M5XKTceiganvgQiJ2PAB
	fP+m63VUruopen9qC1pjg==
X-ME-Sender: <xms:4E8pasbG_oJaJw5Y4HuM8Gp2euFrxLfd338BoFiIwooPOLG88fIg8A>
    <xme:4E8paiNaJ3uHurcYPSlQXLwJLipVgXeuJ2IfQOg0Fqx4zTkcaS7hzx-RnObGkhUI6
    HxAT7-4Ll_2QmiC6QDhYj_lR8JijsgBZjRkT2ELGYhP5NFqrVnQgO8>
X-ME-Proxy-Cause: dmFkZTGZIwo5KtSHdxfT+Ae64Z6rtdz5qTlNjl7FQnd+4W9H0YALvvQkZ+IixgJZNGBa7Y
    LYgKbfPl/W+rX4T4g5+CUd9983g0PTGHzmRYNdIffjWinfRKw+TFC+/fmnApz7o99xadEr
    olm9xmZCxrTzsWTgfRYgb/R85ICIg8/4BoCVDYEe+y45mqLDyip8pilF21897oM81wqBl8
    znBuzSMuTTauEqbGX6ZyCcZFnxdsHw//6xumk9LkhqjFnGtZWUlu5s4TnNziskFcCjR2Dw
    65hcN3f4aRMLnEBQQVlczGDJRhQYNLdCQ5y11+APEnGoNI9NVs3f4rJ4Wth3u7fQ2eBXhq
    8RwSu1fVarIVtvGfxpJFQvTRBi8FxNiH+DfTdFVJK2iw3ZVVbFAy2HwguRmjTgBwSK7IZP
    R8OoPv0mLf1+3s9zEy28uxB6CDDp9ongYg8ajQz7UTA/bGCgQ2bwrg9TxH8iGVcxwQhg33
    CzSPFt9U/KYMaQPuOLiQVGvVt+OeV2EYD38x2B0xRdl11uZJ2ucsgbP0Hk2z+VEvW+qWSO
    osKYbJHsCjFZaRR/f++UmrcLnDtAb8zhGSj46Vj1jLxjBjzQtQPMgoJes1F1ae47v+0l12
    c/kbDxeT1sHpapI8GHAc2PfQLvI5DqufxT2zH0zjwAZkyzwpHT0Ex8q2bYUg
X-ME-Proxy: <xmx:4E8parIa9ie_4XSYMC-TNZK2FYY7niU1j1VDSedgsD0sfS0g4Zj_9g>
    <xmx:4E8pahsqkUpjWaZ_zE3jeZa_mhPp9DAtdyZc4JB9naRX1t-Zfg_-eA>
    <xmx:4E8panUEpe1X_i6_itQoVeCAXtEW38--Sfl3kNrbbeoI-qbBL-Wbng>
    <xmx:4E8paki5rBB0Ev3HeAHDsiCiYZfMWqbeDgxb3BIJda7cFkC7r97OWQ>
    <xmx:4U8paqJp29TUkKDJo2AJn1sfrfLUU6CgT7eA5h7tlfM_d5gojBmxvM_v>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CFE54182007E; Wed, 10 Jun 2026 07:52:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AveuuW7LIw6B
Date: Wed, 10 Jun 2026 13:51:40 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Josua Mayer" <josua@solid-run.com>, "Frank Li" <Frank.Li@nxp.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <fc58ffaa-c910-4bf5-9a37-20e9aeab466b@app.fastmail.com>
In-Reply-To: <20260610-lx2160-pcie-fix-ranges-32bit-v1-1-98086fc5fb6b@solid-run.com>
References: <20260610-lx2160-pcie-fix-ranges-32bit-v1-1-98086fc5fb6b@solid-run.com>
Subject: Re: [PATCH] arm64: dts: lx2160a-rev2: avoid 32-bit pcie window system ram
 overlap
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_045203_375315_2D0A5713 
X-CRM114-Status: GOOD (  11.07  )
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

On Wed, Jun 10, 2026, at 13:45, Josua Mayer wrote:
> A 3GB non-prefetchable PCIe bus window can overlap with inbound DMA
> addresses for low system RAM, so DMA transactions may be routed to a BAR
> on the same host bridge instead of memory.
>
> Change the 32-bit non-prefetchable PCIe window back from 3GB to 1GB on all
> controllers, avoiding that overlap while keeping the added 64-bit
> prefetchable region.
>
> This partially reverts commit 9ed301397090 ("arm64: dts: lx2160a-rev2:
> extend 32-bit and add 64-bit pci regions").
>
> Fixes: 9ed301397090 ("arm64: dts: lx2160a-rev2: extend 32-bit and add 
> 64-bit pci regions")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Closes: 
> https://lore.kernel.org/r/9e6326f6-dad1-4169-a63c-e62ee5b341f2@app.fastmail.com
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Looks good to me, thanks for the fix!

Acked-by: Arnd Bergmann <arnd@arndb.de>

