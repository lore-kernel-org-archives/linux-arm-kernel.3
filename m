Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A46CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 21:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdZa5mT6e0C2U/Kjg0oF233p2kgkpg3mIMsYIfiUcPo=; b=m3bPFd1lZNBXqpeEXzIsqN78Co
	drNgNgY9SuFdYhc3san0OzA3looJylDaO8Jtajdd6oSegoqbS0CFSK10R++MFRTZrMXqC8RiRaFr8
	Dh/nPSkXIJP6vQR9vBKWP/lZHur+hGBrx0V3w/I3yB6MN8dKtk+EjUYt9j7z/QMFiNHklddUguhdx
	FODkeMQlyrvdyfu1tM09KVCMVQBG14AH2y6CUW9ZJkwCO13N8HZvM6B5aJkHWIjAFGVMl3kmckaiR
	A4besUcSsUqb4zxX/mKnaq/NmicBTTaDNHbd7AB3Wudj4/fcIEH6EAIo96RIANL+sh/xNeApGE4Ge
	vhBCQqTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6ll-0000000GMp8-3D6c;
	Wed, 14 Oct 2026 21:44:17 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6li-0000000GMo6-31Fa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 21:44:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=jdZa5mT6e0C2U/Kjg0oF233p2kgkpg3mIMsYIfiUcPo=; b=lbYsagp04O4Oc3iLW68zu5zMCJ
	qEMAhGP//WbRVIs1DgvSn+N9NA0nbW1yNxg4f0s5um7pW3Q6GTV6/j9NM8u0KeKp2JQdC/X6F1hWw
	9dmQQDhqoQANl78PqeqXAszZjxLSYyiEXFvBM6e5uXadbzKiqRPanSTnX1Xs7IPrJ368jOgA1QvwV
	hTakF8AbEpnhlAa3dOvhrem3a7SaFyZB7l/A824xWW1H/jU+R3CClP8Hjy7Vm2ikKI5G6hkq9zv3s
	C2qol7LFHyM5dY7meUAQkQUZS/0M7vsXKoBZo4Fyf98Dv4cw7JF4LZRJzjHUy49V2NwPpHi85pzas
	aDRfh7ng==;
Received: from [177.172.122.211] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xH6lb-000F5s-IK; Wed, 14 Oct 2026 23:44:07 +0200
Message-ID: <430b10e9-7c8a-44ad-904b-e579250b314a@igalia.com>
Date: Wed, 14 Oct 2026 18:44:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/1] arch: arm64: Implement unaligned atomic
 emulation
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, kernel-dev@igalia.com,
 Mark Brown <broonie@kernel.org>, Will Deacon <will@kernel.org>,
 Ryan Houdek <sonicadvance1@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Billy Laws <blaws05@gmail.com>
References: <20260930020138.2377090-1-andrealmeid@igalia.com>
 <20260930020138.2377090-2-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20260930020138.2377090-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_144415_039428_0A41506E 
X-CRM114-Status: UNSURE (   6.31  )
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

Em 29/09/2026 23:01, André Almeida escreveu:
> Implement support for emulating unaligned atomic operations on arm64.
> User applications that wish to enable support for this should use the
> pctrl() flag `PR_ARM64_UNALIGN_ATOMIC_EMULATE`.
> 
As discussed at LPC 2026[1], the split lock emulation is probably the 
first thing that we want to figure from the atomics issues, given that 
is the trickiest one to emulate correctly given the need serialize two 
atomic instructions. As suggested by Mark, first we are going to work on 
an userspace solution that delivers correctness and from there we can 
better understand what the kernel could provide to help with performance 
improvements.

Thanks!
	André

[1] https://lpc.events/event/20/contributions/2594/

