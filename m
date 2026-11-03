Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A41606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VWpk52ux;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=qNi5cLVl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lcg1wBxiDdcDGgK7Dz3chEfZ6MvrdqS3Jh/+FcQy5Sg=; b=VWpk52uxW15zsc
	QPFZWCK2Kq1QE1oYmmhR7pDisrafUg94iZfqvXol2+XECTMvjMFa4He65PoFq6jVV3XQEYJqS4Hvm
	sZZ8uIvRe2QAKWwCJ0+Xcwh/+2Ppxiy33oomrFhlo76hpBrFh73R+Znwh7ycJABfz0Qe/IuNEtRT7
	DsKMSPW8V+D4O1cxMH6pIjrEvHas8wNAC4AbDo7tQ4E4lwCIAT3OAai6GYZ5DOe2HqTMj70n5qBxq
	Wu3tG9e82ymstPwmR/YPmfVaeXIQzN1DoAEWo+dqjO6CXxD3RkV5ZDwqOG5xjDvrsNJhOj/MhFY1A
	hQXHbqmvjq6xMThxqfRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOF0j-00000002ev8-1ru7;
	Tue, 03 Nov 2026 13:57:13 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOF0g-00000002ete-20UQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:57:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ACCC3A036B;
	Tue, 03 Nov 2026 14:57:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1793714227; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lcg1wBxiDdcDGgK7Dz3chEfZ6MvrdqS3Jh/+FcQy5Sg=;
	b=qNi5cLVlSfUYbpjb4RcosnYY/OVuGLypm+UftvZAGws4OFdmSrE/Yb+jZD0LAiU85GuNCE
	UDlu0Y6FYSNMzT+/VtF2gt9GeYQ7WjmLP09jNyMUQabQ6+bacZN7XOF2qP89N2d8t9jafR
	5ju20EeK3QXBIaQtixADDhtX+8Uxh9eT2mwtvcHw6UvJm5n5ly/MLVKeIf7kox4BUxW23h
	PFsSdPVkzA3y6a4Za0O30jl4jpO31Vmz8qJ2Bl3MdAHlsdsytpj3N24IdebuOBQlOJ/hKg
	0ZhSbqo4tLqsbAMw/s36gfRyvnTupeHhGE/q8+mcWLWPePx6zDMkjLxIHwvsPw==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 03 Nov 2026 14:57:06 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next] net: stmmac: selftests: Add missing endianness
 conversions
In-Reply-To: <20261103122249.951523-1-maxime.chevallier@bootlin.com>
References: <20261103122249.951523-1-maxime.chevallier@bootlin.com>
Message-ID: <d0629035094621d224bc30fa7fda09ec@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_055710_684977_BCC38108 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Maxime

On 3.11.2026 13:22, Maxime Chevallier wrote:
> The kbuild bot found some endianness issues in the stmmac ethtool
> selftests [1] let's address these.
> 
> In practice these missing conversions didn't cause any issue, as the
> masks / values on which the conversions were missing were either always
> 0 or ~0, so skipping the byte swaps lead to the same value being passed
> anyway.
> 
> [1]: 
> https://lore.kernel.org/oe-kbuild-all/202611010511.Mk620DTd-lkp@intel.com/
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

