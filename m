Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD725E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 16:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEX07eVl8poJMk/2HTnl4uVgkRJpOJDNGu4gkKdNDK8=; b=EYNZXc3Zq/mSYVHBqYA31ucVmm
	hD6uBeSYdZPg6Byf0Req4p+F9/yLa1/y5muHqOefseDhSHeF7s5vEv1xfGmcTmIrHCXfFLL4v0MTR
	NOrQVGSBpwXxvyMZ+V9k3cjNtV9uKjZYPTp4ZDWb5nSHbGolKkcrPa8m4lGdkO75yl9yvCofCLUiz
	3haAEfWwjUoBUWAwwm+AvEIkvdqXVdnCa6MFul1SHzs2mOIFHiNiLh9vOPYzi0pO5IL5DgK5ay53V
	zAhs1Ow0KUpExAT9x9jZqv06KsFnh0UeIuNZZ91FJeo4VhxtTqrT0DixyBeDSoU7N+nR+DUFq3TMd
	7yuxnmcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNeZ-0000000Am7g-0Jv9;
	Thu, 02 Jan 2025 16:02:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNZZ-0000000AlL2-0C1F;
	Thu, 02 Jan 2025 15:57:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 87CEE5C6113;
	Thu,  2 Jan 2025 15:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9958C4CED0;
	Thu,  2 Jan 2025 15:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735833439;
	bh=l9krntIFJFgGFkmtKhs3ubXfoLYdo1dGd3fujb63qS0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GWQA/5ifHfAmW52ebrzWPjPHWHUb8Loa0cT4PsfsmvUVhRjgfv/ZpWcPVVV44iIHC
	 bKsRoUCZPiDbMC83ImLbuFqmKm6mstitNOepgNr5aA+HsdQQ5C/tA6NY4h6OXMmJ+q
	 6IBkszDnPvup/cfBcTL0bFgCGnvypTjtSYHpBaz56PotKjtai449QiPJG7IsNBAzQA
	 20e2CC1lJfbpujiBtIWZ89nDEcmL5mhMym77NPlIVjh1KL9i/L1jZH2JVeIw2IVZrS
	 BUwMKBBJaezhcfg3jXKBCIaQleuhDPZmtL04RUNxi9PR43T3d18hHd98xRuG9UMC8O
	 wiAdixR9p92dQ==
Message-ID: <dfd37ca0-14c6-4cc1-8fae-f1aa2d23e148@kernel.org>
Date: Thu, 2 Jan 2025 08:57:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ipv6: socket SO_BINDTODEVICE lookup routing fail without
 IPv6 rule.
Content-Language: en-US
To: shiming cheng <shiming.cheng@mediatek.com>,
 willemdebruijn.kernel@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: netdev@vger.kernel.org, lena.wang@mediatek.com
References: <20250102095114.25860-1-shiming.cheng@mediatek.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20250102095114.25860-1-shiming.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_075721_198734_B0F0A380 
X-CRM114-Status: UNSURE (   9.70  )
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

On 1/2/25 2:51 AM, shiming cheng wrote:
>      When using socket IPv6 with SO_BINDTODEVICE, if IPv6 rule is not
>         matched, it will return ENETUNREACH. In fact, IPv4 does not behave
>         this way. IPv4 prioritizes looking up IP rules for routing and
>         forwarding, if not matched it will use socket-bound out interface
>         to send packets. The modification here is to make IPv6 behave the
>         same as IPv4. If IP rule is not found, it will also use
>         socket-bound out interface to send packts.
> 

Please create test cases for IPv4 and IPv6 showing the problem - what
you are configuring and the expected result.

Also, commit messages should align with first column unless there is a
reason for an indentation.


