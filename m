Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DEDD29DC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 06:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3V/ahtZ1XCh/6+3/VT/NYBPfAIn5m6Xgu4gC5ne1Kw=; b=fbFv2ygsXd1e48Uu7PFLm3i79Y
	UEMB0wy1fnvjGTJsNp26z/Z1LKrjXCFGl1J+Fb4bARepGLLrlOhEEHqc1rkkvs07expd462y/JWi7
	NxznL5DSp88IgHx6DPWvgO5uRJPIfBPRJrCuqeriO3WIDc7v8OKygntVuN2ycyFJ7NOrz/2sxv5rg
	aSSHIMeWfjaE0B6y94yLKDaebfeuOj1zsBP7nddw3EQYFiQp8bU3+1MugM3OQ94vKSYAti3zgEdgT
	az9XS8eGIIqWPLl6bVzQyaWrXyVaezc8qjaNtNQhbAGOJ0WFsbKX8795pR17fAKdW+DEnjnW40aws
	j06nsbMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYMo-00000006cbb-20Dd;
	Tue, 13 Jan 2026 06:59:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYMn-00000006cbV-3ceB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 06:59:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71A4A6001D;
	Tue, 13 Jan 2026 06:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47842C116C6;
	Tue, 13 Jan 2026 06:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768287540;
	bh=inkLnSl0ItzeVinaMJYgEU5Xice93U0TjHQH3H3LEVQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AoQQGfF4j3uqXMq5Ca/8b5AJS6i2raNtMWlorWMax9SQ/ivKBH7CYAeX3Y3YU7qrW
	 5ztSQ9BZX196R9+Bp1UI6sWWXzv+M9reVlVaPGuU/BkDI6QPSt+230EFqo6qenTxdf
	 1BaNRgPAOrQ8fRdOp8dhu72nDDR2wOaTFz6fgl1TNz6mT/D7+Uiis8LyMcZnCpfkX6
	 5/HrYQIk0QFXQlffSKJVLWjAS8wgKm1hPDYs75U0hC+MPNz1lvLL63nUxi3Pkbia4P
	 9opiMHucT3Snny6hmeWTOG8UyCM9Dl3epRvCWoiEc71OLRtceUkmGoxRefAYtuty3X
	 EW1Znlv0JZFnA==
Message-ID: <675f32d7-c866-4b66-93bb-0dc6ed53f5f9@kernel.org>
Date: Tue, 13 Jan 2026 07:58:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: apple: Ignore USB role switches to the active
 role
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260109-apple-dwc3-role-switch-v1-1-11623b0f6222@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260109-apple-dwc3-role-switch-v1-1-11623b0f6222@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 09.01.26 11:13, Janne Grunau wrote:
> Ignore USB role switches if dwc3-apple is already in the desired state.
> The USB-C port controller on M2 and M1/M2 Pro/Max/Ultra devices issues
> additional interrupts which result in USB role switches to the already
> active role.
> Ignore these USB role switches to ensure the USB-C port controller and
> dwc3-apple are always in a consistent state. This matches the behaviour
> in __dwc3_set_mode() in core.c.
> Fixes detecting USB 2.0 and 3.x devices on the affected systems. The
> reset caused by the additional role switch appears to leave the USB
> devices in a state which prevents detection when the phy and dwc3 is
> brought back up again.
> 
> Fixes: 0ec946d32ef7 ("usb: dwc3: Add Apple Silicon DWC3 glue layer driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>
Tested-by: Sven Peter <sven@kernel.org> # M1 mac mini and macbook air


thanks,


Sven


