Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF4CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 18:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGYFYpP+YrrqGo5Ub6STulzSBuLANjfod4QFaQBkOPY=; b=hdVjTPgynXcVrBTdgoOuS0wqcX
	axeGJJt99lF99GfywrNiHVg9sQmx0U1ak+eePksBovJCPT6T6FOX9m4QI1mkWwjok3KWa1CkivtcF
	pNaHgAmVcrItoywjwn6EgHMRNp0PH4SL/Egf8tWUXZVajPpZYQ+AF+42ooQoCc3ixi6fDOL3/4iC1
	Enz3D+va+MpPoZJ5SkueQxpbIGHBPEys4OyIyiSHrRonIS/Q9CQEYD1pJUNaaf00FXgqydROG3hwY
	1n+r76V4oO8jGg1WnDLtwTuSGrd2/Xzpso0t75Kgs8NlJ6eLT3Kd/Gl5StTdP5USTGeXvI/muJu7G
	j8PnEYCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbzW-0000000ESw8-46tU;
	Tue, 17 Dec 2024 18:08:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbeW-0000000EP1H-14OY;
	Tue, 17 Dec 2024 17:46:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 650A5A41F25;
	Tue, 17 Dec 2024 17:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93A0C4CED3;
	Tue, 17 Dec 2024 17:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734457594;
	bh=OwGheDgt29vkvS8t2F2IuM3VUVlBDeT9j61i23O0ZJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T3ePxkuPfo70D9lFnDwMhsaSYEGVGBUJICi+5sqC0oLHaXUqtOBToQbKP6tosj15V
	 +zzrBj9vWgDNqRIbrA5YW5va/cKmoxDs2olkmaBnQ6gNIHfja8tvtIAHePhUWK2nF6
	 xWLWSQgE7i3ktUlqFZH5yJ5HITbjgtP2dSfQNQpcY/c7QfSRMvD/fnurDON5vNIv+t
	 UvO1A3uFDeEXqeBO2oWb5n7ICD/DBbcUvnvt00AK0ekDKkB+YKtr1kcbxm8eztoFql
	 l+8Z/i0hIOzCN8hNio7y4wzf8+j+L/sEBlQigX2X3mT28CvykL+XpOztCb/VaowHi6
	 HZ8DJAocaVrbw==
Date: Tue, 17 Dec 2024 10:46:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
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
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] media: mediatek: vcodec: mark
 vdec_vp9_slice_map_counts_eob_coef noinline
Message-ID: <20241217174628.GA2654633@ax162>
References: <20241018151448.3694052-1-arnd@kernel.org>
 <20241118200641.GA768549@thelio-3990X>
 <20241119110226.dbd54clp46klvjl5@basti-XPS-13-9310>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119110226.dbd54clp46klvjl5@basti-XPS-13-9310>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_094636_433674_04BEFDE6 
X-CRM114-Status: GOOD (  30.26  )
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

Hi Sebastian,

On Tue, Nov 19, 2024 at 12:02:26PM +0100, Sebastian Fricke wrote:
> Hey Nathan,
> 
> On 18.11.2024 13:06, Nathan Chancellor wrote:
> > On Fri, Oct 18, 2024 at 03:14:42PM +0000, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > > 
> > > With KASAN enabled, clang fails to optimize the inline version of
> > > vdec_vp9_slice_map_counts_eob_coef() properly, leading to kilobytes
> > > of temporary values spilled to the stack:
> > > 
> > > drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:1526:12: error: stack frame size (2160) exceeds limit (2048) in 'vdec_vp9_slice_update_prob' [-Werror,-Wframe-larger-than]
> > > 
> > > This seems to affect all versions of clang including the latest (clang-20),
> > > but the degree of stack overhead is different per release.
> > > 
> > > Marking the function as noinline_for_stack is harmless here and avoids
> > > the problem completely.
> > > 
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > 
> > Unfortunately, I have seen no moment on my upstream report and this
> > warning is breaking allmodconfig builds because of -Werror. Can this be
> > applied as a workaround for now (preferrably with a Cc: stable on it)?
> > 
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
> I'll handle it asap, it will be part of 6.13

Is there any update here? I don't see this patch applied in -next.

Cheers,
Nathan

> > > ---
> > > I have not come to a conclusion on how exactly clang fails to do this
> > > right, but can provide the .config and/or preprocessed source files
> > > and command line if we think this should be fixed in clang.
> > > ---
> > >  .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c         | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> > > index eea709d93820..47c302745c1d 100644
> > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> > > @@ -1188,7 +1188,8 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
> > >  	return ret;
> > >  }
> > > 
> > > -static
> > > +/* clang stack usage explodes if this is inlined */
> > > +static noinline_for_stack
> > >  void vdec_vp9_slice_map_counts_eob_coef(unsigned int i, unsigned int j, unsigned int k,
> > >  					struct vdec_vp9_slice_frame_counts *counts,
> > >  					struct v4l2_vp9_frame_symbol_counts *counts_helper)
> > > --
> > > 2.39.5
> > > 
> > 

