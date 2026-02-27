Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A433FD5314
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMFAO4csiSN1neHee9OeKdJZyaErSWGhMT/VU9fURKM=; b=YpoOEnG/PBQbThiAqq8Wxgnlsh
	0wv6BRuzF3uDORprCE4AMoVKGKRHUsPWc01QmCZKAX56OEh6vJNrTKIqwFnHxXWrqeLZCZVyOjCN8
	Z7IinfhVNYFxALBOpErdiHsUlO7GLEz9W6I9QuTiUF0V5rQIP9jLAkoXiEczVk9zxfyPpZ5PaPtIL
	YtpXuj69wk2wdxjvDVMG6qw0sUF2hpkfiAqUF6O5LYyB+lvD4KjiGPCcsLJebiqiX3vbHv9hT1qBv
	tv5JXo1lQUX9zzX7Xx5zpblvTPVisHi/kLWV6ev3BpjviV7E7MZfcw9LGGbIjv0cIBYS5ON3mzQNO
	holrq3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtpw-000000083U5-3QzT;
	Fri, 27 Feb 2026 09:08:40 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtpu-000000083TO-2H6O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=PMFA
	O4csiSN1neHee9OeKdJZyaErSWGhMT/VU9fURKM=; b=NNt/+kgdJvUJ6dErCiQZ
	FsjmBZOYgAIctuPF+FsJTFm1XfUfq0bbV2r75EIzm32GJZONBIpZQb18pjKoEYfz
	v1BkfHcvRUuWFPaUKI52cD5vUZlgEh0U0jC6YnGQF4FAUS/ANpi708r2HeFeps5d
	760lZ8tMAOh2/LW5EnJwMWBybA8EisVDcz8Nt+j1enOM4kBmiEXnL2+BV8/6VZwn
	Ii6YPZvpBS1ZzqSqUimwGhUmg4M9rNqVVZs0zgGX0Fd7v92aJIi7IbX/S4NhfDB2
	rr+uysI8ngNiXM9fOjw2UQiaonzEht4kHSYcngE0oAEswp32ODspy3yP4k3v7KZn
	fg==
Received: (qmail 1412929 invoked from network); 27 Feb 2026 10:08:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Feb 2026 10:08:35 +0100
X-UD-Smtp-Session: l3s3148p1@JPv0lMpLHKAgAwDPXzF+ANZpdrMKUeLI
Date: Fri, 27 Feb 2026 10:08:34 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aaFfEsfh0xTh0b1y@shikoro>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <aaFcs1miP88QWmtH@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaFcs1miP88QWmtH@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_010838_859216_24177A69 
X-CRM114-Status: GOOD (  11.28  )
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

Johan,

> Wolfram, I noticed you merged these last night. Please think again and
> let's discuss the end result here. There's no question that there are
> lifetime issues in i2c, but this is not the way to solve it.

I did think again and do not see a way how the life cycle problems can
be solved while drivers happily access the device struct of the adapter.
Whatever the solution to the core problem is (revocable, custom SRCU,
something else), I still think this step is needed in any case. If I am
wrong with this opinion, please enlighten me. Pointer to some existing
thread is OK, too. I didn't have the bandwidth to read the revocable
mail threads.

Happy hacking,

   Wolfram


