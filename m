Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A137606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 05:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rJdiXc+o;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=EDYxslUQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fOCYY6s4NWFJAtXADmmsBtaGwYYG3CP3GVT6+oHGss4=; b=rJdiXc+osTmLNp9RdNXFGY6Jp6
	9rIg3hshxH/74lFd4x3WSsTnCfoGfsiMgJj4x/ztGnOLeWB6olQ4ojcWKH/5QgfIRGVYNsV+o1cEy
	bky0plytmKroALUIO5q0kSB0zG+4/mAE8F7rd/so2Uk7DunRv0aXluFQWAnAiIbdpmHX9Cv+AJhuJ
	g/eGbIiw8Pcj/hzRWemsHdTDX7Dxof7e8vsp7H6tBg0ogx0adqPK+0jaYiC551Jl7k+b6i0v9P9iu
	uxNMC/K/zdW67g9/v5tbCNiEKTTppGGWRiEOEMjKy6p1QOcXJIopBDrEGhP7Llo9KtaJhvveZvke7
	Dxj/UnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpsf-00000007riy-2qdA;
	Thu, 05 Nov 2026 05:19:21 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpsb-00000007rey-3kGf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 05:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793855955;
	bh=fOCYY6s4NWFJAtXADmmsBtaGwYYG3CP3GVT6+oHGss4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EDYxslUQbO01HBCp/ixmJKShdGoiXZTMP9+Vll/sNFsk6h11qqe+XwZ+6qxPOCfa8
	 tf5r68QKO3IwSt1Q1PkjyBB7xXCcPuFADrPUmaVDYRxJnu5CPVf54q+avuxr5HJM0P
	 oDJalrYvOce34ImZ9Gsm3A1ydY5yEnHFM0JvRtYF9kvdhihB1KTZFoz4D3BK/5AZ/X
	 ZQ2oVKI4EzR2TNuTWPfiY6uMN5HT+dLEsqVQ1fUeYnLUunafRDOIQq4DDCkr9WS0xO
	 nDjeVOC1KDk2ZchRKkiv/gb4ViKzoIM6Oz+XetODn/xtG0+G8e7wGk1Vt5DLiCO8dq
	 gYsKnkWq2WuPA==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id EAF2664698;
	Thu,  5 Nov 2026 13:19:14 +0800 (AWST)
Message-ID: <2dff7406f6bbcb188f70c4caf7193fb5f0fb8e82.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] gpio: aspeed: Preserve the pending G7 interrupt
 status on control writes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, Linus Walleij
 <linusw@kernel.org>,  Bartosz Golaszewski	 <brgl@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Ryan Chen	 <ryan_chen@aspeedtech.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Thu, 05 Nov 2026 15:49:14 +1030
In-Reply-To: <20261104-gpio-aspeed-irq-status-v1-2-9805645f856d@aspeedtech.com>
References: <20261104-gpio-aspeed-irq-status-v1-0-9805645f856d@aspeedtech.com>
	 <20261104-gpio-aspeed-irq-status-v1-2-9805645f856d@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_211918_122018_7292BBFB 
X-CRM114-Status: GOOD (  10.56  )
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
> On G7 each line has its own control register, and its interrupt status
> bit (bit 12) is write-1-to-clear. aspeed_g7_reg_bit_set() updates a
> field by reading the control register, replacing that field and writing
> the value back. When the line's interrupt is pending, the status bit
> reads as 1 and is written back as 1, so updating an unrelated field
> such as the interrupt enable, trigger type, direction or debounce
> selection also clears the pending interrupt.
>=20
> Mask out the status bit when composing the value to write, so it is
> written as 1 only when the status field itself is being set to ack the
> interrupt.
>=20
> Fixes: b2e861bd1eaf ("gpio: aspeed: Support G7 Aspeed gpio controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

