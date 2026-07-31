Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30160C55172
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 22:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EO8CFlkuOm9CFa5xTcXOHUlgLuaD/l88nHO6R3HiCps=; b=ICrkU2muX++nWkrd/C50+WXLiJ
	rAK7QIv73aanhQUSswAlB9yL+IokjPLd0MnzlzdMrxN9Ju500YskMmOfbRJ6JHM00tTKEQAbTsWpV
	bE+hXCea9w1qip1SiUuRqTh2DUIi7Xc7VKgxCP5gczfP0EJt7iSlE/3zsr13xBha+C89VLAMuy1EC
	kYaKJCSVnWE8PqWvoteSE4jqoXF1T95XrxWZJezJs7zdOXCGko6neHELxzMT9/B90Lq4PPN+7Q4IP
	TAn/ipmmaKtNrLVOviLcxuvqFZ1bNUkGKFBthEbHZLCgqBhFZlz4sHvXZSF/Bvd6UYHboEeSu+USq
	3e061gKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpw0z-0000000DhPt-2n6n;
	Fri, 31 Jul 2026 22:47:41 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpw0w-0000000DhPJ-3Hdr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 22:47:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C24781A1376;
	Fri, 31 Jul 2026 22:47:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D082E6039A;
	Fri, 31 Jul 2026 22:47:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13D9F11C16E20;
	Sat,  1 Aug 2026 00:47:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785538039; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EO8CFlkuOm9CFa5xTcXOHUlgLuaD/l88nHO6R3HiCps=;
	b=PexFx1TJHg8/pnR7hv6ujSMs80MZ4tEyoitcfQ3BjIvW8TXDrp88xGAXYYNCSMhQYHppTx
	HdLBZIVU3XnXTJ/1baRwzNk1dpjYpxxCgMBmTa7bALDUpLzdGaPoZthLES2j8Gw6fq9K4d
	eWxNGk43xYyCrhvBbanKeIbc8BL0IF7xgMaLwoxBzr+iLbCMLmSHtKyprcBa9dA6BL392G
	FVtMhBuhSwiCvXfST0di7W8GfpsayaS5U9JSs/Js1bHh5bCWB6czVdFdBKOKSQjFbUo9/G
	I0NDhPxzle8yjtoYwagWSALBSc4wGSuiKqPP5YfuDiwU8WpnWcTCzRAMa8e0Pw==
Date: Sat, 1 Aug 2026 00:47:17 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, Paul
 Louvel <paul.louvel@bootlin.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] soc: fsl: qe: properly scan GPIO nodes at startup
Message-ID: <20260801004717.73c06683@bootlin.com>
In-Reply-To: <a1db12ef75bf881dd5fba893a37db0c8517eca1b.1785414349.git.chleroy@kernel.org>
References: <a1db12ef75bf881dd5fba893a37db0c8517eca1b.1785414349.git.chleroy@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_154738_965324_EF7567DC 
X-CRM114-Status: GOOD (  10.80  )
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

Hi Christophe,

On Thu, 30 Jul 2026 14:29:36 +0200
"Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:

> Before commit 156460811def ("soc: fsl: qe: Change GPIO driver to a
> proper platform driver") qe_add_gpiochips() was walking the device
> tree to find all nodes with compatible "fsl,mpc8323-qe-pario-bank".
> 
> After that commit the discovery is handled by the platform core,
> therefore it is necessary to call of_platform_default_populate() on
> the par_io node.
> 
> Fixes: 156460811def ("soc: fsl: qe: Change GPIO driver to a proper platform driver")
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> ---
> v2: Use of_find_node_by_type() instead of of_find_node_by_name() as the "par_io" type is documented while the "par_io" name is not.
> ---
>  drivers/soc/fsl/qe/qe_io.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

