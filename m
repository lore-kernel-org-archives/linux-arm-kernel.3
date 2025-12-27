Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9B6E8FDCC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHwNV1DlNmmIWAqzDul6kcoL+I8d8SB9EqXvkhkMptM=; b=3bpjZBi6Vds0P17mA7LZgcbDim
	m7CvA2U/ZBOU0U88AVnTHC9MSfshRUrTPI4Q0ws8X5dNi0XmjMEDcTlJH5dQEQGt1t+3aYG+z9rjk
	C4mGmqEQ7Pdd58t4opww3XdLlVXwHeccHr09T1rsApiTV0Tx3HpExVjyK+pmaiCTcwqt8+iv5BxYK
	NgyA7ubB38V464pXlfoLxyTzl20zqvQ7u3hclF+OXYqkH24xaVYRaFT8RvCl5Uv44Tm347fGzOQLK
	2oagzm/8w878yRkvMMtXn/iQ+7YWiKyPWqfThPIZoCV/MAWCpudHV7ku2dm3/x1cgxrkfdgYW1tJq
	/OHXKDAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZU7h-000000020HN-2QxD;
	Sat, 27 Dec 2025 13:14:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZU7g-000000020H4-0x5U;
	Sat, 27 Dec 2025 13:14:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 324C960007;
	Sat, 27 Dec 2025 13:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5395AC4CEF1;
	Sat, 27 Dec 2025 13:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766841258;
	bh=i9LBcbhUDW99QwEkFg6vlArk/fPDmBuTYEKfXVI5PWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mgQxRVP4eBT71qGFjcoEIKQXWi3MILwIvLOGStTTWUOAK1Wm8fbhP/T6K1cK7WAqj
	 Gv75cNTYCV5SmtPB7vUzopJ5XmjN+iZjGyw6tSJNx6Ya8kVrzgCcj3mIHINRFDXlsD
	 TD6J5RyvHt1ay47El+czNIOFCIeRGPA7ioFmV+nLP05cj0JaL58iAa2KvTV1KYe2dS
	 cshDrz2Ry/zug7YChKnj68qvQgjZ9SxIToOE5OdRoLRN0MNHaxQU0OWycW0w715te1
	 PvBlivimHz11/Zu5TWI4fYqbXON31ejH0D0jJ1433Cl1qjnS3Xwuhbc3xCH+ewduln
	 lsT3by94sGPuQ==
Date: Sat, 27 Dec 2025 14:14:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Coiby Xu <coxu@redhat.com>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64/kdump: pass dm-crypt keys to kdump kernel
Message-ID: <20251227-funky-swallow-from-pluto-910b9d@quoll>
References: <20251226141116.1379601-1-coxu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251226141116.1379601-1-coxu@redhat.com>
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

On Fri, Dec 26, 2025 at 10:11:15PM +0800, Coiby Xu wrote:
> Based on the CONFIG_CRASH_DM_CRYPT feature, this patch adds

Don't use "this patch". See submitting patches.

> LUKS-encrypted device dump target support to ARM64 by addressing two
> challenges [1],


...

> +static void __init early_init_dt_check_for_dmcryptkeys(unsigned long node)
> +{
> +	const __be32 *prop;
> +
> +	if (!IS_ENABLED(CONFIG_CRASH_DM_CRYPT))
> +		return;
> +
> +	pr_debug("Looking for dmcryptkeys property... ");
> +
> +	prop = of_get_flat_dt_prop(node, "linux,dmcryptkeys", NULL);

Where did you document the ABI?


Best regards,
Krzysztof


