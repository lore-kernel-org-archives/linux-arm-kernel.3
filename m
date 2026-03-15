Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF94D58B08
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 04:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwCbCJuGf54eMlx7TTx9iL5exST1ZLf1KA3NYOxhd5E=; b=M/NjwS7ILS7JfyXbe0yj/+v7LE
	w3Pro88qeAeLR0A/F05WEg5JFY1S9Vd2zWy3ZQXEXVh2MsWiEPjC8sixzVkXB6k36HWv6VXc8nuBA
	NZkMcr6fm5HoxDWH0zHvTIe62Mz90+d6ZxzHCB+9t3TabqUaMTlklpd+6avs5rM48H37M7XMCp4uC
	c/vRFCnIK2nRpqjlxcZmlEY1dh76cooGCmHErwUSygOLNtzeA2+zEzRXacchbeLma+jR5AweT/zmP
	PrvaW+1I3EYKVAqJVj7UNyHy9iIi11vbkTNbhqg98bGzUSlT/Y9TISBcfsTDKLH7uyWIt8gQ9cQE7
	yLdjXVvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1d9b-00000002NUH-3FtZ;
	Sun, 15 Mar 2026 04:32:39 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1d9Z-00000002NTa-2AmI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 04:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=lwCbCJuGf54eMlx7TTx9iL5exST1ZLf1KA3NYOxhd5E=; 
	b=fRMnyzqUzYko9QxYOXu3oIikIHzzRCOrMZt3dciIa72DMgK1SjfbNxYUwgxhnFdU6EaNlck+fis
	f/cVPV7EoWUzGLuLaaHDUfewI0NERLsylOD6ViIvaXTI81NDXriw9NSWM+JRUIU17fnAEngMoiao0
	zADZaNE0gqTB7s4zCCVMM5tJQKlShzF3yQOfINPBlCtd+CkI/owc9io41IFkG4djuFL3K8jgc4vwC
	nyfR3yi6ux5kvWyERL6+ycu7LOi/+bN8eAGPiNTIJK93clWq2eOJSU+gu+EjRQlqLdUzXS0ZIdtia
	SCvbShXe7TdIiNlyUJqtIL41QNny1/pr6rnw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w1d9M-00EXUY-2b;
	Sun, 15 Mar 2026 12:32:25 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 15 Mar 2026 13:32:24 +0900
Date: Sun, 15 Mar 2026 13:32:24 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Joachim Vandersmissen <git@jvdsn.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: testmgr - block Crypto API xxhash64 in FIPS mode
Message-ID: <abY2WLnFhfdJXO4U@gondor.apana.org.au>
References: <20260303060509.246038-1-git@jvdsn.com>
 <abTuFto8Tc3mhRRe@gondor.apana.org.au>
 <64592fee-1956-4a70-a751-9ac3335cfc27@jvdsn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64592fee-1956-4a70-a751-9ac3335cfc27@jvdsn.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_213237_557641_EFEB4CAC 
X-CRM114-Status: UNSURE (   9.33  )
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

On Sat, Mar 14, 2026 at 07:43:15PM -0500, Joachim Vandersmissen wrote:
> Hi Herbert,
> 
> I don't think this one can be applied yet since dm-integrity still uses
> xxhash64 through the crypto API. This would break fips=1 systems that use
> it.

OK I've removed the patch.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

