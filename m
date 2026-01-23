Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E7CD72379
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 11:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XH4nSX4LPoSkxa/PYwaKG8lQRqVVZ4EkQiKIGnDG4eA=; b=MNCsprHM/5S7RY2CoEcGwDDyoQ
	b729MU3ZhoA+2gbNYD3YSF8qtOJ8agSgGI9I0mfP2iiuxDI4WR+dO09HU4L/ha9KZYr9SPA9uifzS
	4TbVogRwpkw4Py5ByquPWxBQrzX46XyfCowxNWiHQkZTOOg2XbdiApWFTaSy2/aYNUml+z0qu7M8i
	vAjwofcIzKf0alwv5bVPOldP4HKLXmN44w62CnxKkD+zh5z0FluOkmnFUCYQQmBdqBN9laukfFF9h
	Ytg0gGmjHzqq5CpVTUQXUbEj0UcpOqgzClx/YHnRrqEFP+EvYkWaS6TT/O76tsSpZBNaRMSinyxdw
	69R3Tupw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFHl-00000008pZH-1cq2;
	Fri, 23 Jan 2026 11:25:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFHk-00000008pZA-2OhW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 11:25:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8817860134
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 11:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DD2C19423
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 11:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769167503;
	bh=XH4nSX4LPoSkxa/PYwaKG8lQRqVVZ4EkQiKIGnDG4eA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vImoSdZxWuENWQ9XTIv4zgJJsA8xnMlR5GGWiXjXIaPNv6UDkKR8xE1Ul9Apoweiw
	 ZLX9UJiM3jedkkbZgjIlcL2aaXWOlrxqd8Hcx3xGFnFOhUE7b0enizsjZwSnWZLDV2
	 p5tD95NRqijpc70J13k+Ltty6ajJ72IOCKRsBxfITIOMXqDp1IbIWUPxyWgIkMcbOh
	 owkVejI4dyylue5mbXIN8bYB+aDGBUeTsNCd7b/J9NUYK2ftdidUjtzJdgg393Xf2p
	 crCCsf5H90xXKkgy0NJ2zV0xx6Hu5W1pI6ufxtwvjsijYTFFNfHKRdcg1AWZGqlO7q
	 gxdjNo45oTTRg==
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c61343f82d7so849166a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 03:25:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGkKEGNc6qYQUng3Bk0M4bZzqa/AL+EdIy28lK0rcKleVuQsAKKzXWh7xaZj6X5xSJSIMZYcdQTvmoW/CUi5m/@lists.infradead.org
X-Gm-Message-State: AOJu0YzLn7x+JRo1FSKzdBqPV1qiFDxIg8hUdN3yH7TLHGKGqIA1iIv5
	gm7SBf1pcPUf+eHLncmbwj5DUyEBpiaHDOd/JbHVvyHIp0q7S6P/Bv6XWnt3GTWnFubrOypajOf
	6vnceE2CRY8RH1oTnTESTNB3Jm3/FxL8=
X-Received: by 2002:a17:90b:180d:b0:34a:8e4b:5b52 with SMTP id
 98e67ed59e1d1-3536701d1e7mr2303386a91.8.1769167502720; Fri, 23 Jan 2026
 03:25:02 -0800 (PST)
MIME-Version: 1.0
References: <20260123074820.310605-1-ruanjinjie@huawei.com> <aXM-vOUVbD8iwicr@gmail.com>
In-Reply-To: <aXM-vOUVbD8iwicr@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 23 Jan 2026 12:24:50 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHQKDMvrj-NUWVTN=AP0W5rUMdxXFzzp=OphxM7bE2PNQ@mail.gmail.com>
X-Gm-Features: AZwV_Qi6WVvWtdcSAOAhjgAaETyZIPQoHF0jNjo-Svsw9pyXs6exzF62LuGjDdM
Message-ID: <CAMj1kXHQKDMvrj-NUWVTN=AP0W5rUMdxXFzzp=OphxM7bE2PNQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: kexec: Add support for crashkernel CMA reservation
To: Breno Leitao <leitao@debian.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net, catalin.marinas@arm.com, 
	will@kernel.org, akpm@linux-foundation.org, bp@alien8.de, 
	pawan.kumar.gupta@linux.intel.com, mingo@kernel.org, 
	feng.tang@linux.alibaba.com, kees@kernel.org, elver@google.com, arnd@arndb.de, 
	lirongqing@baidu.com, fvdl@google.com, bhelgaas@google.com, bhe@redhat.com, 
	dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com, 
	osandov@fb.com, jbohac@suse.cz, sourabhjain@linux.ibm.com, cfsworks@gmail.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 23 Jan 2026 at 10:30, Breno Leitao <leitao@debian.org> wrote:
>
> Hello Jinjie,
>
> On Fri, Jan 23, 2026 at 03:48:20PM +0800, Jinjie Ruan wrote:
> > Extend crashkernel CMA reservation support to arm64.
>
> This is awesome. I was waiting for this patch! Thanks for working on it.
>

That is great!

But the commit log contains no motivation whatsoever why this is such
a good thing, so perhaps one of you can enlighten us? This endless
fiddling with boot-time memory reservations doesn't make the system
more robust, so having a good reason in the commit log why this change
is needed is really needed.

