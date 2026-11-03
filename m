Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA07B606D82C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ISq1KYHp;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=bjt9+W/b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q66KFJC7/i7Yn4OCqcftASZFnDxA3e4YKO5lDWUMXlY=; b=ISq1KYHp3EMga3
	8xkBmeANgKtAV+5OnUgeXrvzXhCyoR/KV45Ak3OwTfqGukuWJDe7m11hCLQQ6JcJiOFc10NXH0nsK
	93DnuvauUtDKP+60yQr0bYRL0OmALvPTXpwofNyD+ybJ4gTq1mP+wxi0x0LeiNoaJPPSQXKzhWCsZ
	ncDsDUxr1rjQHjNxPJFYi8RWJfL+w6/sEaSUV6G3kMvbvuGJgUNIT4ExoCLsqwbmspHkRWT7VOf1B
	sWnFOCz/CdUo4JTsIEqdPmxPBaUtQLKOXbAzmo3T/Z+ZLhMKkEcNvgXx6E/nKmCfBfMeKpBL89sSZ
	1tRgiiO/+zLJEzXk5wnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCsO-00000002EXa-2NVg;
	Tue, 03 Nov 2026 11:40:28 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCsL-00000002EWD-0Eop
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:40:27 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 1E56E240105
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Nov 2026 12:40:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793706020;
	bh=Q66KFJC7/i7Yn4OCqcftASZFnDxA3e4YKO5lDWUMXlY=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=bjt9+W/bdEj9OIkjT+tMhRa3EyLEGBVp77gpDIxWr3H+xaDFoUqsIss7lm8ho8qBt
	 cmcV/OmuHVTf0YhBTy5pun2eWpGqTYbajHq2CCttvn0aTcnP3chEIe9NIQkrTUUp5b
	 wlxY7rRD0Xfz0lVjyVt1625P+T47clxB9YSoSQ4efuvQQ2c1mjWCZxFPbQKRXmm6oE
	 dovLyI970W9kDmLktYarmd3Bn5AkU9T2t5sukvf0NkL+d4m+LPld2dEigfEUZa0LUu
	 wECiN6rPDUnpL40SVt29s2KRQL4O3ls79OKgiJSWkg40KuEGcVzKXMgbLaUtnGoJ+1
	 rVnzxPkSC7wzg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jJmpV1Zysz9rxL;
	Tue,  3 Nov 2026 12:40:18 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 03 Nov 2026 11:40:19 +0000
From: mateusz.nowicki@posteo.net
To: Christophe KERELLO <christophe.kerello@foss.st.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, Linus Walleij <linusw@kernel.org>, Yann Gautier
 <yann.gautier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 2/3] mmc: mmci: stm32: do not use NEGEDGE in HS200 mode
In-Reply-To: <a5fff7cd-686a-4fef-b9f7-87e19b870fa9@foss.st.com>
References: <20261031120700.42576-1-mateusz.nowicki@posteo.net>
 <20261031120700.42576-3-mateusz.nowicki@posteo.net>
 <a5fff7cd-686a-4fef-b9f7-87e19b870fa9@foss.st.com>
Message-ID: <f9358cbe526c22c6a8fcbdde814820e3@posteo.net>
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_034025_850972_4B74E148 
X-CRM114-Status: GOOD (  20.47  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Christophe,

> No, it is not what it is written in the RM. If clkdiv is equal to 0, 
> NEGEDGE has no effect.
> NEGEDGE has an effect only when clkdiv > 0, so it can be used with 
> HS200.

You're right, thanks for the correction. I read the NA in table 268 as
"not allowed in HS200", but it is only there because CLKDIV is 0 in that
configuration. I'll drop this patch.

> On ST downstream Linux Kernel, you can find following patch not already 
> upstream:
> mmc: mmci: stm32: use the delay block above 100 MHz on stm32mp25 SoC 
> (Commit ca3b1cf)
> By applying previous downstream patch + patch 3 of this patchset + 
> using  original slew rate that was upstream on
> this board (slew rate set to 2 for the clock IO, 1 for the others IOs), 
> HS200 should run on a ST MP25 DK board at 100 MHz.

Thanks for the pointer, that was the missing piece. I went back to the
DK and tested it with the SDMMC2 kernel clock at 200 MHz, so HS200 runs
at 100 MHz like in mainline. Without ca3b1cf every write test failed,
no matter whether NEGEDGE was set or which pin group I used. With
ca3b1cf all runs were clean, with pins_a as well as with pins_b. I also
checked 150 MHz (no divider, delay block in use), and it works with
both pin groups too.

So NEGEDGE was never the problem, it was the delay block running at
100 MHz. I'll include ca3b1cf and 01d3cac in v2, with you as the author.

One more thing about the pins. I added the pins_b groups (faster slew
rate) to the DK device tree in 7.4 because pins_a seemed to corrupt data
in HS200 at 100 MHz. Looking at it now, that was the same delay block
issue. Would you like me to send a patch that switches the DK back to
pins_a and drops pins_b?

> This patch breaks also MP13 SoC that is supporting HS200.

Understood, sorry about that.

Regards,
Mateusz


