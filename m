Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EFAC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 08:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nj/7fcsf30Nl8qf2AjASDTaU9/a5G4x2NM42ScBp3WU=; b=A475MH1w6AzXD5Jk7ggPumThTt
	lfdriHpIwaoe6jWMlAAlXRKIF0d7RZbB1guNr6Tx8UNH5UckK0nPb6uOYS0VrdxGp0Kl6ajgIblUC
	pk68g5NQ8KXF1ES8on7tHGrDFhTx+Bu6zD5nYRF8oggMMHm525Lf8AR/YFNEbpYxLOkR1BUl+IaH5
	IqoVUAuD4Jgg8q3qy8wf/eBmGgUJTV4kUpJ22pFzEMwXlS0JLpCTRioOgJwkKP/alNAPZuauWdJT2
	ojh3yS+bRmwdD5A7use6IARoyrwuuImqx1qBLKMQDrT7wWhQ6epCB+oUFEuw+IbLEZAPC4/bs5jg/
	0d7F+t2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u245F-00000003Cq6-3zq0;
	Tue, 08 Apr 2025 08:13:25 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u243Q-00000003CBB-0IRr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 08:11:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=nj/7fcsf30Nl8qf2AjASDTaU9/a5G4x2NM42ScBp3WU=; b=LQjnvWYu3WOigFeuvNGsLhVyeA
	LSBftwv1jH5BbNLCieyXiqFYEX3BE8h4ymP8FdQ1TXE8KEoTgCBKOBsMdINAIf7mZ9sFBGSyVHx97
	bj8nOzMPWgRRGd/CEPxvEqyub6YJeRhc866hMUlCIlha1QDfz1R5r0hK9gTNH0tpb7QC8DvPhYgcs
	GxG81Vp9C61eONYw7rE6F937r9GgLov71RcD4mQZJ9k86q/hlquMkMBDlY6Msh5dS3ld/zSKDr5IZ
	zlnZizKi8GCOrR4jWnVOPPQV7OftOMeUJ+Zvd4iEoRHbnCFZu00+lNexG2ZP7p4Tk/PomzZcIgu+i
	dEl7TZwA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u243C-00Donk-01;
	Tue, 08 Apr 2025 16:11:19 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 08 Apr 2025 16:11:18 +0800
Date: Tue, 8 Apr 2025 16:11:17 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: clabbe.montjoie@gmail.com, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] crypto: sun8i-ce-hash - fix error handling in
 sun8i_ce_hash_run()
Message-ID: <Z_TaJWOFdAGNAOyh@gondor.apana.org.au>
References: <20250401192321.3370188-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401192321.3370188-1-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_011132_106106_0B37D686 
X-CRM114-Status: GOOD (  10.44  )
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

On Tue, Apr 01, 2025 at 10:23:16PM +0300, Ovidiu Panait wrote:
> Rework error handling in sun8i_ce_hash_run() to unmap the dma buffers in
> case of failure. Currently, the dma unmap functions are not called if the
> function errors out at various points.
> 
> Fixes: 56f6d5aee88d1 ("crypto: sun8i-ce - support hash algorithms")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
>  .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 34 ++++++++++++-------
>  1 file changed, 21 insertions(+), 13 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

