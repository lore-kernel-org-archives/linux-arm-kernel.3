Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF013606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 20:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1GRfQOgh;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=E+KBQkQE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bce2KlDG4ggff4eJWY/Cqm429Y6p4LEqCaZ6RsNcRH0=; b=1GRfQOghuTjtkGtXFGnsgTWOpw
	S6FR0+rkwMEYDG9dreuWCg6AcK//DHZj8zZ72FGCAXzilMHD9tzwhuukbU4k5u15hfa4d+1j7oS49
	osF2n0EumnKj8LUA+9iL2IW4a3xq+TCH+dCAC9g9OEPQ1dswXVxPUqnEqfvl1fKBmRNFUOKKT6Roz
	c2bBzWaKqkGklMv9lQEqqIURKENOCOh6W/Jt2CPNL8BfBZWKfOB5mmhK16cqDMQYSwOHNR64AkGQc
	9HgYZ00s9T1tmVWrPGzkWNGaGHM1uGgBE3eceKoujGQnYucpvmgILUFFf6wz1z9tOemBMcAa+9XdZ
	DWd2zyog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJctM-0000000CpWJ-2LdZ;
	Wed, 21 Oct 2026 20:26:32 +0000
Received: from mail-24418.protonmail.ch ([109.224.244.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJctK-0000000CpVt-26QG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 20:26:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792614386; x=1792873586;
	bh=Bce2KlDG4ggff4eJWY/Cqm429Y6p4LEqCaZ6RsNcRH0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=E+KBQkQEFkzbBzlQftAxcYF1jybkzElM1zoymGeLrC5kjyrf/trxyNJtH4n2njzTY
	 tS9r09T+ZzNiQ2eGGOrVvbo4Q7GSHFm6aXB1zWaW5kNnUQUzCmv6s4oyJP927zlUIU
	 cXpLPpeTngInBWLHiW9oNf/nxSn2sxxeK6Vu2Juq5EyJ5/RTi0yC4J0Fjjy6tds8Kp
	 aMuLo/yxh5nueXWzcFH+GlzL0E3UyIVWdNmvfYmgKioCJKy0KIfTWFpJnnu+F5hyTx
	 othTOQvqBJPLq7PldAsyejnP4T9YWGnTUlyWhjfHzClrpNnLID6Ihua7xYKaJaUbP0
	 xAN3oJU3j5WZA==
Date: Wed, 21 Oct 2026 20:26:17 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, Eric Biggers <ebiggers@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>, linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: Re: [PATCH v10 09/14] crypto: qce - Only register algos if the user really wants it
Message-ID: <179261435862.92690.611780170759449709@pm.me>
In-Reply-To: <20261013-qce-fix-self-tests-v10-9-57162a38a554@oss.qualcomm.com>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com> <20261013-qce-fix-self-tests-v10-9-57162a38a554@oss.qualcomm.com>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 65740e0ea33da3bf88d934988af2b35a331cb6e5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_132630_698776_A24F027D 
X-CRM114-Status: UNSURE (   4.81  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 13 Oct 2026 11:57:38 +0200, Bartosz Golaszewski <bartosz.golaszewsk=
i@oss.qualcomm.com> wrote:
> The power-management part of the driver is kept as is to allow scaling
> down of interconnects gating of clocks by runtime PM.

On X1E80100 that part brings deep sleep back. With this applied to
7.3's driver, qcrypto binds without registering algorithms, both crypto
paths drop to 0 in runtime suspend, aggre2_noc and mc_virt reach
sync_state(), and a deep suspend counts aosd, cxsd and ddr again.
Details in my reply to 10/14.

Tested-by: Birk Skyum <birk.skyum@pm.me> # X1E80100, Lenovo Yoga Slim 7x


