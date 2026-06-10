Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4579CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 18:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbblqeNKmNEyk8tHqt+WNyhAvwCFyPES8lnSCQQ/rlI=; b=bSZVDybX72T4eVXfl0J/QPVV6q
	etBFOtXBGNbOlESu8goEeP+55z+BAUl3E161RWE9ccwbg7+xWWiQ9Hh2jzhKmSqdSX7KeycJh4Ka3
	9NqfadqSg8vPWM2+VA+g9m9OtZajkRmrHgsC4/U3VrP5ufzwlmPO80xTBmdjYyI9DTVMd8TROtuP6
	cdR+eMaO/XudfrCiezvw7Y9CaVe49khLgH/sRPGi228ib1U9GWiM9xGAAUIWCuhUCebK1mrEBWM6G
	w0CpPtziXPjcahzp48lNfL0pFZTXP2vs9UYacyKwSy74PQ7EKqT13YAX/b58cixlUrb02eEWH7G31
	8TdJ+dwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXNxr-00000008FJn-1RsE;
	Wed, 10 Jun 2026 18:47:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXNxp-00000008FJe-44kq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 18:47:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E1613601DC;
	Wed, 10 Jun 2026 18:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B611F00893;
	Wed, 10 Jun 2026 18:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781117264;
	bh=NbblqeNKmNEyk8tHqt+WNyhAvwCFyPES8lnSCQQ/rlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oVwLEts/auDkPFZ/GfhKGEDCghkVguAQHYJ+jyRFNX7VW53lhIMH9M9q5HTQWOn/Q
	 Q2e7pCkghC3ixOJWfGWE1LqHmCHIWExyNOV48WIOgGhFTusPr9Hqz1sNkoOkEw9IhS
	 hjk1RekyW4scWsCOKq1GK+QSNQCaCI2uOMZSRUKGGk/JCKvb+CERUiAtEajupMCMbm
	 xicv/jrnzm3SuTAoVdEktTWGkZZJDGsfBIV3uW6RcXT2wnmuEbyAo/0s24xu3I0kXb
	 NtKUjMJsWDSso87NyA9gulSwRwyXoqKmdTsAdYoifngiJH/lci3d4vvhzFXEDdvpWn
	 4s7M7KhzbInYA==
Date: Wed, 10 Jun 2026 19:47:37 +0100
From: Simon Horman <horms@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Roger Quadros <rogerq@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Meghana Malladi <m-malladi@ti.com>,
	David Carlier <devnexen@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Kevin Hao <haokexin@gmail.com>, Himanshu Mittal <h-mittal1@ti.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Markus Elfring <elfring@users.sourceforge.net>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Jan Vaclav <jvaclav@redhat.com>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Felix Maurer <fmaurer@redhat.com>,
	Luka Gejak <luka.gejak@linux.dev>
Subject: Re: [PATCH net-next v3 0/3] Add standard stats for HSR/PRP
Message-ID: <20260610184737.GO3920875@horms.kernel.org>
References: <20260608100930.210149-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608100930.210149-1-danishanwar@ti.com>
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

On Mon, Jun 08, 2026 at 03:39:27PM +0530, MD Danish Anwar wrote:
> Add standard stats for HSR / PRP. This series was initially adding HSR/PRP
> related stats for ICSSG driver. Based on maintainers' comments on v2 I am
> now adding support to dump standard stats for HSR/PRP.
> 
> The drivers which support offload can populate these standard stats.
> 
> This series only implements offloaded stats. For software-only interfaces
> Felix Maurer had said he will do it later [1]
> 
> v2 https://lore.kernel.org/all/20260514075605.850674-1-danishanwar@ti.com/
> [1] https://lore.kernel.org/all/ag87pBZfOyccPZTc@thinkpad/
> 
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Felix Maurer <fmaurer@redhat.com>
> Cc: Luka Gejak <luka.gejak@linux.dev>

Hi MD,

There is AI-generated review of this patch-set available on both
https://sashiko.dev and https://netdev-ai.bots.linux.dev/sashiko/
I would appreciate it if you could look over that with a view
to addressing any issues that directly affect this patch-set.

