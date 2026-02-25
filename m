Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0967FD3776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jEAVieEU+20sbk3t3ofcLww1+yuqfYhJTzzkm2s0tRk=; b=wOVRX5uM2NG7xq+VCy1xWhemVS
	+4rORk7GRGlzHO4C20sKInIuJuJvkqycD4Jl4Hbrlqls5HIjiheh3KwT5I01Y+KzlGaabMNv6dHyU
	sLnsqpWEh4df+tdNkzZ47OCCoN/0o8gor0M45mLuUKWuvLq4kczyaRjKROIReVWyBNF3Ce/eqifCf
	UdC9I2DNQNqwnW9/hsOmnzctkPt91j9Dm8v72RM0WS3l1ccahLGwsBHKJDLWasqw+xhUfWSV5gUsx
	tMuWfqEaJKzap7IY11XG/er2RRRle4DXyTu1/Ni1VC6IoFmNqS2kyJVL4bJPF6F9iVm460ihOZCQL
	qVTZnu3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvJ5D-00000004hJU-1U7I;
	Wed, 25 Feb 2026 17:53:59 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvJ5B-00000004hIp-12c4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 17:53:58 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-506a355aedfso20591cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 09:53:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772042036; cv=none;
        d=google.com; s=arc-20240605;
        b=Gfn4xS4jRhgaEMITGJKCDXYOROAgc+luOfQZd9wuaZ4+Q6Q09Tq/Yic1CB1CouXqrB
         3eZvxH10dRutyPvtOW2WtbASK0v2i23O3C0wg0YbdhGuZrzV40fA6h9AOd0r8Y0qhRIW
         cZWiTFKfCOjh/bx+fvcH8thz6oXDBLbrtNBRmDV/7afH52cKUZv6F/MTpHeflyOuHye8
         Sv11eodh7pRVIHR9I/v0nDoHBSpQnwR9iFwH8t45FjyLyrSF2GrWTQ163ruXdQDWP9HI
         SL3/DNgfkaBpnv6O/ocJOjJRk4J9sXt9ZkfTCqrw+xS2tNbphBWe+Li9Bh1rZU+miesP
         /l6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jEAVieEU+20sbk3t3ofcLww1+yuqfYhJTzzkm2s0tRk=;
        fh=AAJEvyhNAeBDFRz3T8JRRW2mJ5Jzi77c23VcyoZtCXQ=;
        b=RDbbhBAvJz2jvKaHMMJcYetC9zwMgGF38NjvP/M2a6R8DI8x+Lygu+Uz/9Aas8JjYl
         0AIBu7xW4FdqVmF1bwwOMzqTssDu+xdaBRKOoJeC1pSiGOph3zYbX+q2BFEyiJiRm+vg
         0C6AIW9QMF9HCq9AefQF5xZsYEX9Syg1eEFvi8pzLdufgkjFOPaLVpm7RwQmTUGMXVx4
         xfG0iiufQRVTj8n1Gv4hOB9scIFQSIDn07eadyJsTkwDhIJPQNuRj52ekH7EI2eKiFUv
         gCorGyc46CMLw+tkhzx3/XD88duGnDxxoUgzcd/7NS//Zd3M+irGrFPY6uJBVfqYq06i
         I2/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772042036; x=1772646836; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jEAVieEU+20sbk3t3ofcLww1+yuqfYhJTzzkm2s0tRk=;
        b=cCXJTlMYkK4wjCsI/A90Hn/Muw58fEytTejMrT60jajWYt7zYXt6NNj/gMIALYph33
         g2SKRdCTYOFVSwOQTNqFT5FYZqhTcdf4E2PCwu5Er7w99YEEZNIP9D7qLdNekvpLnbo/
         drvpXxT+yQkZ3dJ0bKkWYUZGx2cUKoyQOgu/kRG97gREKmQoyaBsO3QWReTe+PxH5Kr0
         8Ss0o61gCNCSPLJKmsJNuDf67SbgTXm+2LFynOvqaXXv3CH7fr9Jhd3xG7LBKlS+FfnD
         w1gE9C8l5YPXwHZzRs/P1VqP5LVtg999aFUKjyvW80OOyUtMWwK5JLoSK+XroDAvX1/N
         dYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772042036; x=1772646836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEAVieEU+20sbk3t3ofcLww1+yuqfYhJTzzkm2s0tRk=;
        b=r9ScLEi8pHcslSeco1HEpPTpicdL0OwZoVLGSFW2s74noYcgvOb09gwtXNtgBgtidA
         rErUMgNlBVDOYrgt86ZxLDMt8OkMaDaoPDu8BjwkH7wng/XfOlgNo/gOcXrl0eVPGojY
         wF436aBVQXHNtrrRUa+r8GQotI5/GDIT/E5GFl6L4Uk4hiSBRp8qHJAMG1JkGJQxWoO8
         JVgvbZX09d1opqCQRH+njGCCXAZpOthcz7cthdHdLsi3n5UFjmNZO7B6FKEAT0hbYBos
         LQAFV4G8k1p/Jz6oPR44NBQ8jjCuYVW4ic9o8fzrV4i98rkbDMZiiEikZZNxZZOLCyzy
         tqRw==
X-Forwarded-Encrypted: i=1; AJvYcCWbtSLcWc/VScAbDorEV4YxdSFWowTrWxf8Ji+Qohae69pE3ihPQCQT1KUehn0CyW7PskzF4HvNx54L2FYG4qZV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3J/j84ymN1YN4ec/qpklzfjru0wXGr6rx/Rqarji0EVy0wt/W
	0asoCv53v8k+7jkPMygYkeaqB75+LPxAEsjRTl5NLomN/XapjY4orIRJRcCnt3pxaE1iiivzYpU
	5DMjmcxgypNwIL2gtAQjQLCx7H23ObWCeQCLY9w32
X-Gm-Gg: ATEYQzwgKmdOdjJn82afkZqaUYggD9wvuG5mSUPjAWIMUwP7DfsvAVJIhqkTjZk4AZ8
	KZn4jHO+OG5hooHyueUZczYMANw+bYXRhEQSiTFsTuDkfagBNIGRBrVsL/NfOGit5Myvq+XMvio
	OZrP76SWMOhIV2vVkUAJkslsnINzIcn5LpGpfUs/3G/Nm4+7RdnQQ+phMbeD61Bx0a0CtaCkE5+
	WgCwXetVX52O0VKiSPw9DIcy4jB4HlwshgBC67VuP2okig503E2oRn/ffqjvJtM9mcPE45Kg3ga
	SkRUQzAH
X-Received: by 2002:a05:622a:246:b0:4ff:cb25:998b with SMTP id
 d75a77b69052e-50738e19028mr11538841cf.12.1772042035314; Wed, 25 Feb 2026
 09:53:55 -0800 (PST)
MIME-Version: 1.0
References: <20260224093128.1926610-1-tabba@google.com> <c402e95a-26d3-47eb-8249-52ece97989d3@huaweicloud.com>
 <CA+EHjTyXWqnr4Cu_cZyxDCVNCxto9pJN0WS18S_ri824oQhwug@mail.gmail.com>
 <2d0c6893-d4a5-42bc-a480-55bc669da130@huaweicloud.com> <aZ81zpP6ooG_19cI@willie-the-truck>
In-Reply-To: <aZ81zpP6ooG_19cI@willie-the-truck>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 25 Feb 2026 17:53:18 +0000
X-Gm-Features: AaiRm534zbpWWOEgtIxfzMhryUNrf7luuF1GuBsHMOEjyqDn4wuNqe1tCagnydI
Message-ID: <CA+EHjTxxqr1fTfDrFwpij+92BEATbYTWmOKqtDeo5jgfqqCsFg@mail.gmail.com>
Subject: Re: [PATCH] arm64: bpf: Fix UBSAN misaligned access in BPF JIT
To: Will Deacon <will@kernel.org>
Cc: Xu Kuohai <xukuohai@huaweicloud.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Jean-Philippe Brucker <jpb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_095357_296744_78FCAB4F 
X-CRM114-Status: GOOD (  27.00  )
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

Hi Will,

On Wed, 25 Feb 2026 at 17:48, Will Deacon <will@kernel.org> wrote:
>
> On Wed, Feb 25, 2026 at 05:46:52PM +0800, Xu Kuohai wrote:
> > Interesting, I think the plt target should be 64-bit aligned to ensure
> > atomic reading on arm64. It can be updated concurrently by WRITE_ONCE
> > in the bpf_arch_text_poke function while the ldr instruction in the plt is
> > executed. If it is not aligned correctly, the ldr may read a half-old
> > half-new value, causing the plt to jump to an invalid destination.
>
> Thanks for pointing that out; I hadn't realised that we patched live
> PLTs!
>
> > To avoid over-aligning the entire buffer, how about fixing the padding
> > method in build_plt to just make the plt target aligned correctly?
>
> Makes sense to me.

As I noted in my reply to Xu, and keeping in mind that this is very
new to me (so take it with a huge pinch of salt), I don't think this
is correct, but that my original patch is probably the best fix:

> I'm not sure about this. If my reading of the code is correct, during
> the first JIT pass, ctx->image is NULL. The current padding logic in
> build_plt() looks like this:
>
>         /* make sure target is 64-bit aligned */
>         if ((ctx->idx + PLT_TARGET_OFFSET / AARCH64_INSN_SIZE) % 2)
>             emit(A64_NOP, ctx);
>
> This forces the relative offset of the PLT to be a multiple of 8
> bytes. Therefore, it assumes that the base pointer (ctx->image) is
> also 8-byte aligned. If the allocator gives us a base pointer that is
> only 4-byte aligned, target will end up misaligned.
>
> If we try to make the padding dynamic based on the actual address of
> ctx->image, pass 1 (where ctx->image is NULL) and pass 2 (where
> ctx->image is allocated) might disagree on the number of NOPs
> required. This would cause ctx->idx to diverge between passes,
> breaking the size calculations and offset tables.

Cheers,
/fuad

>
> Will

