Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A34606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 16:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mygIgmHT;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZDroGC+x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b5iTkwSOZHA0NMgeve9AVcmRA7avz9vnNSokzShuXNI=; b=mygIgmHTx2h5RZxBRvD5N3bSkv
	HgHjaSx+Ayo44R7dmnhA2TyVZRYoKA/Ujiv87NdBT+PvMSoIQ38SLRxg0njlLII8QeQVfJnRjyEXm
	/KrI3kdNOejZ2Sb+2Y2a4Fnu8mYatPVo2rzkmdnIXudi0N5VekZyv23mT4sKZOyahBDK0SMVi7u3D
	YYgDUF/UAsvO/yYnystCtgV2uiP71SZXZwsRI8/k1dBMu5Fq9l/BGSJsGc9h6S1I8svH7QpD8h4Hg
	55NN+q+qJXYU6UNMGY9t7TfTOjdh6S238mrvrTNxU6ApwUIYUHfyWH9vuxegSWWPZ429/kqsMQdFM
	K2kqkcFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKICL-0000000GfKx-0x8m;
	Fri, 23 Oct 2026 16:32:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKICF-0000000GfJo-1C63
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 16:32:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B4B560A58;
	Fri, 23 Oct 2026 16:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB9E91F01825;
	Fri, 23 Oct 2026 16:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792773166;
	bh=b5iTkwSOZHA0NMgeve9AVcmRA7avz9vnNSokzShuXNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZDroGC+xpkkXkLSz9nuI+opuu5tNARVn8NQVHvBGJ39Wcu5xwGoNJMMCuYl0xpk2S
	 unEbIF+IzanPKZcNUTshlOcL6t3fv1xF8cO5Hjpj9/BUYOX1ZMLKuGBcPPLj/b5BRX
	 dAxWyqRJKfRWVaiL5netmNJNdeuyBFRid9M+kHjzAoHsFtrW3x8NCMnJntoxsuVwkd
	 ADM6h5a0wWiiJqNXcaoCWfeVHSxoOqefKY8gG7CIjE6ZX/zK+DowM8kj5B6Flg7Is0
	 pwVCAYcQVIOd68eVAnx7t6ySwcE5/D5CYepQn1InkIirF0wWUyrQLFupAkddsWxMER
	 dFvoPAcadEk5g==
Date: Fri, 23 Oct 2026 18:32:38 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Carlos Song <carlos.song@nxp.com>, 
	Haobin Jiang <lemonoutput@foxmail.com>
Subject: Re: [PATCH v3] i2c: imx: add I2C_M_REV_DIR_ADDR and I2C_M_NOSTART
Message-ID: <atuMDUXq64XhQgqM@zenone.zhora.eu>
References: <20261023-for-upstream-i2c-imx-lx2160-reverse-v3-1-a07b249df381@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-for-upstream-i2c-imx-lx2160-reverse-v3-1-a07b249df381@free.fr>
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

Hi Vincent,

On Fri, Oct 23, 2026 at 04:20:19PM +0200, Vincent Jardin wrote:
> The Realtek RTL8366SE SMI read frame per:
> 
>   S Addr Rd [A] reg[7:0] [A] reg[15:8] [A] [data[7:0]] A [data[15:8]] NA P
> 
> Linux support it using I2C_M_REV_DIR_ADDR on a write message
> that inverts the transmitted R/W bit, and I2C_M_NOSTART on the following
> read message that continues the frame without re-addressing.
> 
> This NXP i2c-imx is missing such support, so on an LX2160A the Realtek switch
> could not be used.
> 
> Acked-by: Carlos Song <carlos.song@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

pushed to i2c/i2c.

Thanks,
Andi

