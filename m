Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40142606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 12:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rsUyJCxf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=WiXXukn+;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MxbmDdtp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Pct43w36pX1CyxyO5UioTaXSfQeG54+wyQReoWNQ2M4=; b=rsUyJCxftNrc/40h/awdKc3NdZ
	8Vm25fnsmc8f/PaIOOSyt7M+9V2pE/4TdC9Wc3xU/QPAkDX8KmKY/Fd3ibjIGlGhpmwNg+5mx/ELF
	uJMiPcpuRqmuIh7yyuR95hORWBpQjylVfP/4YMOJ0kLsA0CU0AUwCY/wX9LWu9MGQtLTqEwWPp6l9
	MLH/YOji8K62xFc4SgomEI25987UurZSc5pT50/3GjlM4wJA6TcCnrdga/S+iqx+Ef9IiT8thzG+z
	BL86yQlrGuAv6317271eBQCAVyaoQICxU8k2cxWnpkoAgPJJjPPY+KQFGIHgX/7XCKNSYwl51e7lm
	r+CWhenA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLg4L-00000004bG6-0rTm;
	Tue, 27 Oct 2026 12:14:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLg4H-00000004bCR-1PyN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Pct43w36pX1CyxyO5UioTaXSfQeG54+wyQReoWNQ2M4=; b=WiXXukn+pCGCxM9/BxWE/lliEu
	w/q30L/joZu+Vlui4RzGCc4Ah+eOvyYG/1W/wHXvtNmK3hsqF2kzpqd1gNQs4CCbWi/URwQtJziuN
	cCMKbGdTw8iaVHdmtjWJe2xY31nvjzOl0xkJcvcHrltqZbJvcihKe+pT19NAz+D+ZfCa4H47cHUj8
	xFOWKYPF9K0kbl8nddGKFeNTuZK+LgNqw8701eeynilK9iRQ6FzrRHbtb1YXxymf8MlrJbV1fi4si
	Wjc/S5iwcRsebHExeT0YLb/tHltlVeG2hhKc2ZUlIe1blrEdtHjrsAmHJMky2zAywuUk3/+B4v7aZ
	kPjbqfeQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLg4E-0000000EuoU-1boj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 12:14:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E0F515A1;
	Tue, 27 Oct 2026 05:14:09 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A90893F7B4;
	Tue, 27 Oct 2026 05:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793103252; bh=+x+QJyMjGuwggXOVsXDAKvdIRmr5Q1UABK+FUovZffM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MxbmDdtpPfFoeXeefNCv5AG3xkR1QIVMG8IB2ba7p7XsZOR6MnMJ29n3aUtFpTKJ4
	 yLVIhmoqY7IVmL9k2CNn/AA5kywvOq6jfzJC2KXy4+cz9+i2CHledKBbL8gMZYUmmn
	 WxAvzzd5AGHTuf/m4wwpUP+AjJpR9G3NOXH2TXe0=
Date: Tue, 27 Oct 2026 12:14:07 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: idreg-override: Detect trailing "--" in
 __parse_cmdline()
Message-ID: <auCVj80cR8LILhXB@arm.com>
References: <20261015161054.357595-3-blum@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015161054.357595-3-blum@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_121414_694248_7D81968B 
X-CRM114-Status: GOOD (  21.35  )
X-Spam-Score: -2.5 (--)
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 15, 2026 at 06:10:54PM +0200, Thorsten Blum wrote:
> __parse_cmdline() detects "--" only if it is followed by whitespace.
> However, at the end of the command line, it converts the dashes to
> underscores and tries to match "__" as an option.
> 
> Detect trailing "--" directly instead of converting it to "__".
> 
> Fixes: dc3f5aae0638 ("arm64: idreg-override: Avoid parameq() and parameqn()")
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/arm64/kernel/pi/idreg-override.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
> index acaf56234973..38aa28d19650 100644
> --- a/arch/arm64/kernel/pi/idreg-override.c
> +++ b/arch/arm64/kernel/pi/idreg-override.c
> @@ -352,8 +352,9 @@ static __init void __parse_cmdline(const char *cmdline, bool parse_aliases)
>  
>  		cmdline = skip_spaces(cmdline);
>  
> -		/* terminate on "--" appearing on the command line by itself */
> -		if (cmdline[0] == '-' && cmdline[1] == '-' && isspace(cmdline[2]))
> +		/* Stop at "--" appearing as a separate argument. */
> +		if (cmdline[0] == '-' && cmdline[1] == '-' &&
> +		    (!cmdline[2] || isspace(cmdline[2])))
>  			return;

I guess that's more of a cleanup. Does it actually fix anything to
deserve a Fixes tag? We skip an unnecessary lookup for "__" but there's
no functional difference.

-- 
Catalin

