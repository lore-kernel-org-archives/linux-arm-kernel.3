Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E0EE77194
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 23:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRzWf4CeAAs2Mfs+2B6JFBzmb1bdAzO9qUU3QTdAEc8=; b=hx3VDFe6b9azc7rAeQZwKQe8e7
	NuRHUcOb5bkLi0oGXDB2LVQBG+vyu5NUF88LnaPPSByLT0byJNwqt5eFpYfD8JYFyzMCab3/FTBIn
	xfbirQT/sWqmBmuV2rBe3xZiS7FtgtJ5lasu3qGUDfPUZewEP8ZLHQahMLylaf23UhBhV9G2n8Vfx
	SFOMEzMkAHTm3TpTtQjXqT99UIE+wk8Gr1v9iHDyv3K099UC8jv4oXFIuSCFkQlGf5ItuqsQosMnq
	nXm0wfO++MOWFVVljJPIy6BiWNk6VAhbDP5BItXeJXH2ks2L+zbNV6lMFct0Qurg1ifdCB3Q5cwaG
	DBvv8xAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSPA2-000000065w9-3Dov;
	Mon, 30 Dec 2024 23:26:58 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSP8p-000000065nk-3r97
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 23:25:45 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-215740b7fb8so1204125ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 15:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735601142; x=1736205942; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RRzWf4CeAAs2Mfs+2B6JFBzmb1bdAzO9qUU3QTdAEc8=;
        b=JrTVh/2vm4XH+nqPZ2EhzJ5vODODHnDR/6HlNZrzzkfqrINr178hCgIoFfikztfvvd
         HCgOXeIDYtYQMMOLjNsl6v+szp93PluTGgdNEOqknqF7NexsNtQE9rWDDbNmq3YkJikg
         ezWllcS3yMTsIxFM4T+dZ/6vJuQsC0u4LCRlOwOnkMmeebxMewPUKaKo8v55lMQwtzPU
         3eR1u1kgj1HirMNfGAAjB4BzMYqcsDDj4/VkGzyd1J5JezmSjofCk/fb+XEFQJ+mlAr2
         PqqucEHifhiv/VmIY7y8ZXhYOdniudNjjxH6ta2JnnM9fuMSN2u4d05T4tfQY7lfD/bz
         o3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735601142; x=1736205942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRzWf4CeAAs2Mfs+2B6JFBzmb1bdAzO9qUU3QTdAEc8=;
        b=kK1q7VCQ17nYyzpgIDO1kmvVz+dveFRAE7SN0oNB9wmcP8Df4KzC4bWnK8Y3xY5a3B
         tdmMDEBGLB20Wf+sV9U+T0K/IlYxoIdmjT1OXKasHRUWkUl2JiKGuMyvQOK4Q2CzjQ3T
         NrBEut2N6zLUD+wQ2qanz6zUxG9fNj2XZj+E/V7jjyXqM3AQ/qmP6GGiBGPameiGkJQS
         MT/4RZ3ygSNl5OFBWA12VLX97RyGYMiyOM6afTGDtmxNpDKHsptLZFO+vkc0J97nDT6V
         uJ8m6sryBY+WrFzXyDQ+7tI4irx4rQB4qICR0Bbjk9Wlo2BoT7QmhW+E5l6WCST4IyyN
         ByVw==
X-Forwarded-Encrypted: i=1; AJvYcCX6MXTd34YShUjeXJpgRYP+7i1ggRSoChGhbG8aAfsAUnJrrImD3Gg45cXf0Sj6bPr3kru8+UwfTacUVER0py4A@lists.infradead.org
X-Gm-Message-State: AOJu0YyxksQC0tSGSxhQu7MeidbKqZ/DfZUCl1kjCV0naGzKtqjO36He
	pyhfH70dlc1iIKz93AxLzD/le1QCg1Du50FvFz7At5bSWbDvmId2du+wwrsdGA==
X-Gm-Gg: ASbGncvxpPoESzdInFP5B2b7SZHu3wIC4H2jXPVA+TnGm6cHdCwys+Nrsnh6zXA+SAQ
	wtfNGDRDL/ERv9fTi7ckAA48PMab8eEXLm5+tsspqIBkkofpgpIr8C5Z7MuOsdOoo8n/JnNjn6i
	x7vPjPEWkCh5vD6lGuBU1k6c82JPw6B5/L170UNZ3VVON6IfovO7Bh95xuGSXLwp4vrJco1Rv6M
	+d7aEFrQzO3o+P0sqRbocH7ccfPPBuf26SV3prW4Y1sm48NRN6iHiGNDZUm2yLaxi4Haand48x6
	L4Y4SF2egQbMYOZcI8E=
X-Google-Smtp-Source: AGHT+IGRp5e+88I/VIGxZjpmzQSJtLaRAWmCvlTAi2UkTOuOHL2cTguNZqZ4pi6cNwhvlNNsVq25FA==
X-Received: by 2002:a17:903:2350:b0:20b:5e34:1850 with SMTP id d9443c01a7336-219e773876bmr15701785ad.23.1735601141982;
        Mon, 30 Dec 2024 15:25:41 -0800 (PST)
Received: from google.com (40.155.125.34.bc.googleusercontent.com. [34.125.155.40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fd58asm20315918b3a.145.2024.12.30.15.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 15:25:41 -0800 (PST)
Date: Mon, 30 Dec 2024 23:25:37 +0000
From: Peilin Ye <yepeilin@google.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Josh Don <joshdon@google.com>,
	Barret Rhoden <brho@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next 2/2] bpf, arm64: Emit A64_{ADD,SUB}_I when
 possible in emit_{lse,ll_sc}_atomic()
Message-ID: <Z3Mr8bqHyjTEFqGm@google.com>
References: <3b84fa17ab72f3f69e09e0032452d17eb13b80db.1735342016.git.yepeilin@google.com>
 <953c7241e82496cb7a8b5a8724028ad646cd0896.1735342016.git.yepeilin@google.com>
 <6763d7c3-7971-477f-aa47-cb2fdf4b08e2@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6763d7c3-7971-477f-aa47-cb2fdf4b08e2@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_152543_962126_DABB1C72 
X-CRM114-Status: GOOD (  14.87  )
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

On Mon, Dec 30, 2024 at 04:44:26PM +0800, Xu Kuohai wrote:
> > @@ -721,7 +727,7 @@ static int emit_ll_sc_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
> >   	const s32 imm = insn->imm;
> >   	const s16 off = insn->off;
> >   	const bool isdw = BPF_SIZE(code) == BPF_DW;
> > -	u8 reg;
> > +	u8 reg = dst;
> >   	s32 jmp_offset;
> >   	if (BPF_MODE(code) == BPF_PROBE_ATOMIC) {
> > @@ -730,11 +736,15 @@ static int emit_ll_sc_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
> >   		return -EINVAL;
> >   	}
> > -	if (!off) {
> > -		reg = dst;
> > -	} else {
> > -		emit_a64_mov_i(1, tmp, off, ctx);
> > -		emit(A64_ADD(1, tmp, tmp, dst), ctx);
> > +	if (off) {
> > +		if (is_addsub_imm(off)) {
> > +			emit(A64_ADD_I(1, tmp, reg, off), ctx);
> > +		} else if (is_addsub_imm(-off)) {
> > +			emit(A64_SUB_I(1, tmp, reg, -off), ctx);
> > +		} else {
> > +			emit_a64_mov_i(1, tmp, off, ctx);
> > +			emit(A64_ADD(1, tmp, tmp, reg), ctx);
> > +		}
> >   		reg = tmp;
> >   	}
> 
> Thanks, this looks good to me, but we now have serveral repetitive code
> snippets like this. It would be better to refactor them into a common
> function.

Sure!  I will do that in v2.

Thanks,
Peilin Ye


