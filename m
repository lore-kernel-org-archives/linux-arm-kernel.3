Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE5ED591B1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 20:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndSoR+0OhUwkKwnTH5YxnYyz2I37z5cHRZE/CYVXZMA=; b=0jInCE0nVk3stm9QsxWaA17IL3
	WioJZ3k0U+hhLGciGjyqNJqKFDyVKuOSVY2lp/jevjyCXD9tq/yUAgtpfcYefC5RvO8SzHntjU/vy
	oRJSQZNEMGemYHP7qy2265yFl6Mkcm08LHG0yWcE5dXbLcaiDEsRq2DiW4KzwY/++Uha9GrivQikv
	iCQqViMMLlJKwzsbjMKbFbkdVhQl4VrollZ+thucaIzPRq+7RyC0cAh5NvGultkzRRKj6K840go6B
	TvQcW500KuieXorOLAcD4wSwKAcHw+QL1g55IU1X5aQoIabaZfD+aNuQaUEG95E4YUqxwa/sS41cP
	3TuJN4Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD82C-0000000AXRb-01nL;
	Mon, 18 Nov 2024 20:07:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD81G-0000000AXK5-0kSm;
	Mon, 18 Nov 2024 20:06:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47504A41BEA;
	Mon, 18 Nov 2024 20:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E787C4CECC;
	Mon, 18 Nov 2024 20:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731960404;
	bh=BZLFINsMS8pPfEa2wS5Xd+1akLeYv9BQloWJ6y92+qs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p8xchKHWTiB7DLpXpMZ/rokpIHqbjnduyfTKuCNXQEAf8AeSOLePjc+Vz+G2TUAL4
	 bpBKb6XqAuQNCqFX71br72A+J0DklZhUq/degpMQJQGgb2vb8XA6KKCowg04xS8aP9
	 9GTvY56pB99209v+dvdbbNjXAb79yBrula6Js7cz390kTxZLT+qxkPy1pYX0HGQq6c
	 0QVFz2Ighd7iypAIMlF7glyswIWxYg32oKez0Dq9SDXou1+K7vLbJeBLnVe1HGSK2L
	 kQArLC61iaOrvMcnTbSZeEkWLfCv6VWoAqoktmiFSkES/ka9EAobpzLoBIWgMGz1Qn
	 quba2HIWN95Sw==
Date: Mon, 18 Nov 2024 13:06:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] media: mediatek: vcodec: mark
 vdec_vp9_slice_map_counts_eob_coef noinline
Message-ID: <20241118200641.GA768549@thelio-3990X>
References: <20241018151448.3694052-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018151448.3694052-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_120646_336389_62090608 
X-CRM114-Status: GOOD (  23.55  )
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

On Fri, Oct 18, 2024 at 03:14:42PM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With KASAN enabled, clang fails to optimize the inline version of
> vdec_vp9_slice_map_counts_eob_coef() properly, leading to kilobytes
> of temporary values spilled to the stack:
> 
> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:1526:12: error: stack frame size (2160) exceeds limit (2048) in 'vdec_vp9_slice_update_prob' [-Werror,-Wframe-larger-than]
> 
> This seems to affect all versions of clang including the latest (clang-20),
> but the degree of stack overhead is different per release.
> 
> Marking the function as noinline_for_stack is harmless here and avoids
> the problem completely.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Unfortunately, I have seen no moment on my upstream report and this
warning is breaking allmodconfig builds because of -Werror. Can this be
applied as a workaround for now (preferrably with a Cc: stable on it)?

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> I have not come to a conclusion on how exactly clang fails to do this
> right, but can provide the .config and/or preprocessed source files
> and command line if we think this should be fixed in clang.
> ---
>  .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c         | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> index eea709d93820..47c302745c1d 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> @@ -1188,7 +1188,8 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
>  	return ret;
>  }
>  
> -static
> +/* clang stack usage explodes if this is inlined */
> +static noinline_for_stack
>  void vdec_vp9_slice_map_counts_eob_coef(unsigned int i, unsigned int j, unsigned int k,
>  					struct vdec_vp9_slice_frame_counts *counts,
>  					struct v4l2_vp9_frame_symbol_counts *counts_helper)
> -- 
> 2.39.5
> 

