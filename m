Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9866CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 14:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tj/U0Y54eAKclejjEBVwWZyUPwiS6WzmvFTi1kYoa60=; b=ug0f0V7IHdE8ZSCfor/qyo4+7L
	A2TVbvhq4NEwSkqvTvl5ZPSQ004IxZ9bVtG9zVSOZVSqo4YaoPQW6TlnAwH+r5i2YhwjMi9adH5rV
	qo/LIXEbe7BcTA4GB8cyyukIHisBN/Z6cVvenlRfz9RHLJQD6x67vwocwx4L+gJyaTQEROJpvx6SC
	GMMCm5cABWaoC3+i7IkqDOGWKI8yiAqtZ+lSLdtccIRYCKsesyE7KLf2VTK6XsK3LoR1H3U58xIAj
	NEvBLKLmnF1fUERNfl1epWO4OtxcOpPKgvk1Kdj6Zg9/VUcztIWdQWnXSMudgR7j9VUi0jvZ0CDj/
	XYdpPsHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1nz-00000006P3G-2bqt;
	Tue, 23 Jun 2026 14:08:47 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1nu-00000006P1H-3A3M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 14:08:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 31373C6B38E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 14:08:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 910EB601C2;
	Tue, 23 Jun 2026 14:08:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8709C106C8382;
	Tue, 23 Jun 2026 16:08:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782223718; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Tj/U0Y54eAKclejjEBVwWZyUPwiS6WzmvFTi1kYoa60=;
	b=IZuJTS4Gaj7zpjzOxVenDZXvDPqCUWMOEpXcEhfV25BRkcLbwZBK5o8Md0Sp0vUMh3/lI2
	uNLYIaZKGKBzSO/ZwJzR858RhBjQKDKQEPaWRbsmXflsTjoZAiVlg6+AC3pkHQvzzhQc0U
	rL1fR+RYTXNHmNYaRzuu9sH5jtyXIP7egW5NXeTxl3/MnJgTsQbAWxlAFFxotrgYvz67jU
	411GO7jLeSEFDZ/KCW6wJSRJLR0pgWW3cAhnC8rh9Jcag4K9lL5hQ9HsnYXiHFEhpiANYe
	slL4Wku8V2rEdhkYnNYIfWvqbhiYUzn/Wr/453FOhGPqOrsfXNsYNAGo7UFPqA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,  Boris Brezillon
 <bbrezillon@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: mtk-ecc: stop on ECC idle timeouts
In-Reply-To: <20260623135729.52304-1-pengpeng@iscas.ac.cn> (Pengpeng Hou's
	message of "Tue, 23 Jun 2026 21:57:29 +0800")
References: <20260623135729.52304-1-pengpeng@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 23 Jun 2026 16:08:34 +0200
Message-ID: <87se6dmjrx.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_070842_950742_45846F8A 
X-CRM114-Status: GOOD (  10.34  )
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

Hello,

> diff --git a/drivers/mtd/nand/ecc-mtk.c b/drivers/mtd/nand/ecc-mtk.c
> index c75bb8b80..96703f0a4 100644
> --- a/drivers/mtd/nand/ecc-mtk.c
> +++ b/drivers/mtd/nand/ecc-mtk.c
> @@ -123,8 +123,8 @@ static int mt7622_ecc_regs[] = {
>  	[ECC_DECIRQ_STA] =      0x144,
>  };
>  
> -static inline void mtk_ecc_wait_idle(struct mtk_ecc *ecc,
> -				     enum mtk_ecc_operation op)
> +static inline int mtk_ecc_wait_idle(struct mtk_ecc *ecc,
> +				    enum mtk_ecc_operation op)

Looks good, but could you follow up with a patch which removes the
inline keyword as well? It does not seem to serve any purpose there.

