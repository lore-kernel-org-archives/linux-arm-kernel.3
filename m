Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDA8606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 05:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RwQPwI5d;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Kh3y7Xy6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+8q0BMvB9wWUz5f3EYAzIeMUb+gnozsdbkCnoECk4mc=; b=RwQPwI5dLnGil2cdGjSaAriSFJ
	rnAHv8FdpN605672MpOpip1qsFEV4jmmafzUG9kNkGf7sWp2hzb9vscUN7wZm2SD3uUyLTz/in5PR
	EvDXBqPoBsh+Ny7aotbfTrk5YG+0RDg8HC76DE0PGkLvN1OJpO4GjN/gdUm+KcZorYxpC6/t2jyX1
	NvBE14xJj817TUvs5ptp0xkBf/YysdrEi+Io00rTRrAdb13FnqeVpT+h3iOJ5Y5tTTFeCdt2FtO5v
	bAERccBTK0y1hMS62s90SJWUMQGNtuOgjq2Z49Hjf552VUHzyDxM6UjrRExJ+zCmikLFYTKj6TBjA
	Rtlq528g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOprz-00000007rSd-0ZQp;
	Thu, 05 Nov 2026 05:18:39 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOprt-00000007rRT-373y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 05:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793855907;
	bh=+8q0BMvB9wWUz5f3EYAzIeMUb+gnozsdbkCnoECk4mc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Kh3y7Xy6tZVSiGt/8Es7VfOUi/arBd5FRbyFObIdv6Iiq6PPE8Ipb5wD/3A1B5YDB
	 jVC65cPMNvPDYZ9I7gkMppRVGCjkGLRRk2Q8Rut8QPRoZ97316SO0eNKVyl/6s3D0/
	 W/lBZC+hy5iIdqG6iMyiSDCQ/yWYBAZtNeLYaFwsmQw/X/Iw/nv3CBz0U2fhj92UZC
	 hp2LQKsSf9ylwKPVwnzrnLtIwGKrxNy95syFEE1QtZlsL1jEpTCOeKw191U2cLVbX/
	 rs3XBp6jJ1cc59t0iTHQlP46QweFyhZFYwpaG5QkwthHluMcomrhgQjD1p4ymDwmTC
	 U/dn18Hc4XOaA==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3446C64698;
	Thu,  5 Nov 2026 13:18:27 +0800 (AWST)
Message-ID: <3c6f78a78dcea12e97b62f8a65c0248f023bbc64.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] gpio: aspeed: Clear only the acked line's G4
 interrupt status
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, Linus Walleij
 <linusw@kernel.org>,  Bartosz Golaszewski	 <brgl@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Ryan Chen	 <ryan_chen@aspeedtech.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Aaron Antone <aae@amazon.com>
Date: Thu, 05 Nov 2026 15:48:25 +1030
In-Reply-To: <20261104-gpio-aspeed-irq-status-v1-1-9805645f856d@aspeedtech.com>
References: <20261104-gpio-aspeed-irq-status-v1-0-9805645f856d@aspeedtech.com>
	 <20261104-gpio-aspeed-irq-status-v1-1-9805645f856d@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_211834_291970_E4D05955 
X-CRM114-Status: GOOD (  11.68  )
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
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 2026-11-04 at 11:58 +0800, Billy Tsai wrote:
> The G4 interrupt status registers are write-1-to-clear: writing 0 to a
> bit has no effect and writing 1 clears that line's status flag.
> aspeed_gpio_irq_ack() clears a line's status through
> aspeed_g4_reg_bit_set(), which reads the bank's status register, sets
> the line's bit and writes the whole value back. That write clears every
> interrupt pending in the 32-line bank, not just the acked one.
>=20
> aspeed_gpio_irq_handler() reads each bank's status register once and
> dispatches the lines that were set. If another line in the same bank
> latches an edge after that read and before an ack in the bank, the ack
> clears its status and the handler is never called for it, so the edge
> is lost.
>=20
> Write only the line's own bit when clearing the interrupt status on G4.
>=20
> Fixes: 79fc9a2fcc45 ("gpio: aspeed: Create llops to handle hardware acces=
s")
> Cc: stable@vger.kernel.org
> Reported-by: Aaron Antone <aae@amazon.com>
> Suggested-by: Aaron Antone <aae@amazon.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>

