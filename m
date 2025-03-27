Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB197C36010
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 16:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kB8KVWR95tdYCqRM6F+RnHZdlpglpzMAxs6qp/amWbM=; b=a1fQ0DuP9W87d248m9uRAVbtKo
	tn9H8quGf6a5fjqVm7ZIU1YuPslORZAwRN4WBkQGJO/+EKZeuqPkV7ueLy15O8RHb9++gRau4XuzG
	21QkG2o/nzzCQoRLss73rP/Rex9s7GtFDWZO8pLKYTKMYErjJBwd3xugY4ph7VKy40looQClmxBvN
	gmvcrJCYosghzUEZEuezd4oYlsxH0Xwa+w1qMxe1sa8Gv1peiBoO2eHsu6tZpcAWKVGjYWiAgu9kz
	7eMn9UXWREeDmeYEMnCO176CehV7Ki4lTyZyUb/XhgTSASwK3yygLOHklsDWkBJGH3shNsxzWyyLB
	wVJXpqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqQe-0000000BZmY-1Zja;
	Thu, 27 Mar 2025 16:50:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqIl-0000000BY6G-2bsk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 16:41:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00038A42D5C;
	Thu, 27 Mar 2025 16:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609EBC4CEDD;
	Thu, 27 Mar 2025 16:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743093714;
	bh=cgDvoTMdFl8uJCZb28WudBmYP1cge1/0I+1+v6MpP9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gl1VHmPArr+Oc1d64A5bGcyj8lgREvZPSDTk3D/n0Bo1JqkK0pB6dtHmX4+2V4PuL
	 2HDKE4IrSaqHzobn6atrf8G3IVE6Hk5ZybBurAtmZu2ECnvTi8vgVWuCGKBskXN18n
	 BPSZJ2u23RK1MJJ+i86DWhz8OVQNV7uRZkTx7EA0dLLQyGclYgqF/h7VSWKl08RVea
	 c3LDx0b3F1FBPSZ8YaB1esfGOwuiIHilQwAVhtPUTbj/liVjJ1g4NSxLtIDAnCzt0+
	 Pt6g6rtRmttd8PEdH6ZuE7Nc24EtIG3pz5AfOMeLP28TuuaRBJ8aN80hBOWIEsisX7
	 Ntj08FKtZQnRg==
Date: Thu, 27 Mar 2025 09:41:52 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
	stable@vger.kernel.org, David Binderman <dcb314@hotmail.com>
Subject: Re: [PATCH] arm64/crc-t10dif: fix use of out-of-scope array in
 crc_t10dif_arch()
Message-ID: <20250327164152.GC1425@sol.localdomain>
References: <20250326200918.125743-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326200918.125743-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_094155_724196_BD22C2BC 
X-CRM114-Status: GOOD (  11.16  )
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

On Wed, Mar 26, 2025 at 01:09:18PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Fix a silly bug where an array was used outside of its scope.
> 
> Fixes: 2051da858534 ("arm64/crc-t10dif: expose CRC-T10DIF function through lib")
> Cc: stable@vger.kernel.org
> Reported-by: David Binderman <dcb314@hotmail.com>
> Closes: https://lore.kernel.org/r/AS8PR02MB102170568EAE7FFDF93C8D1ED9CA62@AS8PR02MB10217.eurprd02.prod.outlook.com
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/arm64/lib/crc-t10dif-glue.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied to https://web.git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next

- Eric

