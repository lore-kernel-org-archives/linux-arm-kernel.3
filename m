Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE6DD78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvNjDNR4u/8lpXBDWhpyFeHStNOdG7Hf2dU2fZODI90=; b=ErQgSTIuQXBJFhg5Bk8VA/J0VP
	A7qhUBF3pxRTa+jOoV5J8e3mlGwBysZ6Z3MdIvy/9A1SVdBzsOfGpIYJCMUEsqwr4Fwrnk2jPhIZd
	u0OHLTihT0B5gXshKCUBjnDQS+mGyRwUDgPCy4YTMfcLzkXrIgUyKz9qH66adD4naHiF7pHi7k/iz
	r784sBKhVw32uYY/uOgO7VPpd6WYhfmLkFoUQFdAaFlO1QMan571SaPxSwSOeTB8RKLyArIFso4dG
	tooVjpcR23MeQH+OplJ6tZkLnQUseS7JwLKHaBFFlf0tNcFr/cnC/6ySljku0s1x8ZkvVik78x50y
	e18RJXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9Po-00000006sSL-21Z6;
	Mon, 02 Dec 2024 16:36:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9EJ-00000006q2D-0Vxd;
	Mon, 02 Dec 2024 16:25:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 344205C6955;
	Mon,  2 Dec 2024 16:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37E2C4CED1;
	Mon,  2 Dec 2024 16:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733156696;
	bh=izSs0FmoAiW41CKlfqR52r5gwjKjez8AUBIxKV9qYXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hgN6GVxvuSg/C+xiVgczYxHNbsPNaJvOLGQrcTatCDKjMlMkfux7IWPgt6plpseK/
	 /tElV2/5wcC491iK69+WelHtf5qKZk2F7ieh3aCMaXLuI9HX1+Mnn4N2pDwD+i78Ew
	 EiLqsExR2WmZC3qecZ1CapqQhTOdqydsAFqPDz/u/FE6HVwqzuQSAftPqKVj/8pC2D
	 QUPP6QSDpYuxZGPPCLMvbOwzhfy0HLThDVifzJHUs/OjbGpGeOPEjU/9njYzQwSrN8
	 qZc6QkMzDz3zbuWA/e1KNQZx17nnt573cBS9mGqQvXY3s72+4k57HoswRrL9oD4zgb
	 Veha6oYIPQx+w==
Date: Mon, 2 Dec 2024 09:24:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/3] media: mediatek: vcodec: Workaround a compiler
 warning
Message-ID: <20241202162454.GA2848026@thelio-3990X>
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
 <20241202-fix-llvm9-v1-3-2a50f5acfd0b@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-fix-llvm9-v1-3-2a50f5acfd0b@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_082459_254194_4E9870EC 
X-CRM114-Status: GOOD (  21.66  )
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

 Mon, Dec 02, 2024 at 03:47:17PM +0000, Ricardo Ribalda wrote:
> llvm identifies that the SCP_IPI_VENC_H264 and IPI_VENC_H264 are from
> the same enum type, but their are part of the same ternary operator.
> 
> vpu_inst.id is of type int, so we can just rewrite a bit the code and
> avoid the following llvm9 warning:

LLVM 19, not LLVM 9, as the minimum version for building the kernel is
LLVM 13.

> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:597:29: warning: conditional expression between different enumeration types ('enum scp_ipi_id' and 'enum ipi_id') [-Wenum-compare-conditional]
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

FYI, Arnd basically sent the same patch October 18 but I guess it has
not been picked up?

https://lore.kernel.org/20241018152127.3958436-1-arnd@kernel.org/

Hopefully the new media committers model will help patches like that get
picked up in a more timely manner.

> ---
>  drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> index f8145998fcaf..4786062e879a 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> @@ -584,7 +584,6 @@ static void h264_encode_filler(struct venc_h264_inst *inst, void *buf,
>  
>  static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
>  {
> -	const bool is_ext = MTK_ENC_CTX_IS_EXT(ctx);
>  	int ret = 0;
>  	struct venc_h264_inst *inst;
>  
> @@ -594,7 +593,10 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
>  
>  	inst->ctx = ctx;
>  	inst->vpu_inst.ctx = ctx;
> -	inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
> +	if (MTK_ENC_CTX_IS_EXT(ctx))
> +		inst->vpu_inst.id = SCP_IPI_VENC_H264;
> +	else
> +		inst->vpu_inst.id = IPI_VENC_H264;
>  	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_SYS);
>  
>  	ret = vpu_enc_init(&inst->vpu_inst);
> 
> -- 
> 2.47.0.338.g60cca15819-goog
> 

