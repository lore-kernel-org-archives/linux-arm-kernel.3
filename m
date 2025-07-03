Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEC0C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 09:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i74P6ykJLEnyrC03GPEsGhBSSNdT0vtNxbdEH9wyPsQ=; b=u48WfJH50+PZuiYzCYf7IrN4nL
	M3lRVfSCUeJ02NspNS34Hfmjh9i5J/G3WDwKvVCOcWOSJZg52Rio9uI++aZWttciRlns0OloVYo02
	C7CIA/AmoIitiJo0ugrT/XGlxMlyMUKeoBYKsMzU8P510+o29qsJVB+82F/7NxhDJ6Hc9ARuBu/bn
	l5hRpGpGci9lbM74QdzFhD7576hR149oy7+CyEkFcx9nU17QFga8aArRbtcWe+4YW4sgkS0ZRqxpM
	wM3DVHjKlpSm5C/YrnX/Y7CYypf3tvKFJ4n2TdbhQTqWQBeQxPSH90ouU2hLgfjerEk3KUqlctoE5
	UgGdVjwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGA7-0000000AoLs-3YNk;
	Thu, 03 Jul 2025 09:23:23 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXG65-0000000AnjG-2FRG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 09:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1751534345;
	bh=i74P6ykJLEnyrC03GPEsGhBSSNdT0vtNxbdEH9wyPsQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=M1lb0ty/nrTkoFvVTLVpN9Z1zmKJhYqjAhIXe2H7hR+YWLKab2f59h5IsYIRJpQdE
	 ermBlNyrdt65pKqiFV3MiEfD1a/UdC7A/xf//0A+5QPMnhE7O/F7OirkLCMZ8TKoYb
	 ugJVt4EpJBBciYzjB8bmUA1D/WXUJPsbQSWt1pA0=
Received: from [IPv6:110::25] (unknown [IPv6:2409:874d:200:3037::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id ED6D265FF1;
	Thu,  3 Jul 2025 05:18:54 -0400 (EDT)
Message-ID: <a48666fb2254521197a7f13948feefd38947e944.camel@xry111.site>
Subject: Re: [PATCH RFC 1/4] Revert "Revert "lib/mpi: Extend the MPI
 library""
From: Xi Ruoyao <xry111@xry111.site>
To: Gu Bowen <gubowen5@huawei.com>, Herbert Xu
 <herbert@gondor.apana.org.au>,  David Howells <dhowells@redhat.com>, David
 Woodhouse <dwmw2@infradead.org>, Lukas Wunner <lukas@wunner.de>,  Ignat
 Korchagin <ignat@cloudflare.com>, "David S . Miller" <davem@davemloft.net>,
 Jarkko Sakkinen	 <jarkko@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Eric Biggers <ebiggers@kernel.org>, "Jason
 A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Tianjia
 Zhang	 <tianjia.zhang@linux.alibaba.com>, Dan Carpenter
 <dan.carpenter@linaro.org>
Cc: keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Lu Jialin <lujialin4@huawei.com>,
 GONG Ruiqi <gongruiqi1@huawei.com>
Date: Thu, 03 Jul 2025 17:18:49 +0800
In-Reply-To: <20250630133934.766646-2-gubowen5@huawei.com>
References: <20250630133934.766646-1-gubowen5@huawei.com>
	 <20250630133934.766646-2-gubowen5@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_021913_587568_67874240 
X-CRM114-Status: UNSURE (   6.42  )
X-CRM114-Notice: Please train this message.
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

On Mon, 2025-06-30 at 21:39 +0800, Gu Bowen wrote:
> This reverts commit fca5cb4dd2b4a9423cb6d112cc71c33899955a1f.
>=20
> Reintroduce the mpi library based on libgcrypt to support sm2.

If you use a newer version of Git, the subject would be 'Reapply
"lib/mpi: Extend the MPI library"' and IMO it would be better.

--=20
Xi Ruoyao <xry111@xry111.site>

