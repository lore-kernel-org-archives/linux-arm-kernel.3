Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DDBFCA192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 21:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAHsQdzzN+FG3XbYUMM1my4gp2tn4lNHzdIDSZZfH4o=; b=yZ8Aixs4PjeL93+Z9XLvu4CsYE
	+db6yXpFRzWRpcm6ZQ2VjfGFlmCDRWEcmAzYDCFckDDM74e0OeeQp52blXg4YK0u854Hz/lkV8znx
	+L6rUEQElh/L/k4bGYN2STe1SbXMq6XQ24+WUHlYgxpafdRPw/i1yKV7ZU8yyQnAtRQ8B/NpVmTmD
	NIh7yMSceenupVTDzoboPi9H4TpjQo6P86uWBa0xlgtwk6/OV5JYdxRkn+u5rMLxVH+ZsnjvKntuc
	5p+AT0xbEdiufnqP0840/+77yIhPtw1eeKdQD8b0Y5PbQfysHyRSRgVYHokbphnCdNbrQxaH54DJ6
	6WbKzgPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzi6K-00000008BLZ-37Bg;
	Mon, 09 Mar 2026 21:25:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzi6I-00000008BKk-1dS8
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Mar 2026 21:25:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=FAHsQdzzN+FG3XbYUMM1my4gp2tn4lNHzdIDSZZfH4o=; b=Fr0ptvbNPneZaRJ36mFZ+C3Fvu
	MyBRHAjA9Hbx3XexQwNygm/Pr5iBk3/Mq/iJRDey1QNYOOFsOJxToJ5Yn0ScVzMZKqTp/zvowSw5A
	JskdQ0R6NNtFONA+HQ2nQpKkTHryI0jaJ6m/0s11N68cpneaFGkd7lfAMZGxW1AGXFY0Vk3ipMbpX
	k/1f5e5JSe078QiVamzvDKG1XwcC/zgAvhIhxCPJAXIi7FUhDmZfxLbQM4hLNaePbhOLM8sNUJt8D
	ZHg2lUc3tqcKEm1PYNC7M4cYIuc9SJtOdTu+5H//o4j8bt3xF7G8HXnxErK86xe4hzshbPNdgvi9+
	dsIrA/Kw==;
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzi6F-00000006bR0-1RHR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 21:25:17 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-12732e6a123so3757301c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 14:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773091512; x=1773696312; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FAHsQdzzN+FG3XbYUMM1my4gp2tn4lNHzdIDSZZfH4o=;
        b=F5vbrs/khDz2wKD3DaugnTz7Is5n0eME7NNWR38pLWlAnwtdphdwNeoY+iZCyCF6qm
         1yq+rSRerUXLHMshOumnEd40IO7TQGBYulLs7jcITEqfkup4rstKuF2py3YP5D5erAbs
         S/mKXzErz7udwdRTPiAMm3vsTmE2TTnLl9yimoZIrh6kur7aTZCWNeTKR4LjRsY5Pl7L
         u460F4kcGrSIP6wTIq/vo97X+ZAfUZSboHLpnncNK9VMV74ZCRRJlrNLA4+KScRFJvPJ
         DtNaYO/GntpdNP7jRlEwuJOrSzdsO4Bsr2hFRhobmS1gNIXaOoaXnmJvS6XPdZE1ACdn
         9vaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773091512; x=1773696312;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FAHsQdzzN+FG3XbYUMM1my4gp2tn4lNHzdIDSZZfH4o=;
        b=JGWbxH/WbRUz8mjgbkMNAVhEXF6k4Z7Kwl4WcOAojPIZr38sUCKOaeOWnwtXrySnh1
         DCDsi89UuhuHLqOIGkychZ762APNC6YbikrNj168++Tt6zP3gdw0tseZ1ns2XcFNFb/C
         tKPMgX5WpJKFp92KamUqYItnHxgtAUvcafnYeIiaGIk6v/L2DC7FRPnPB/on4fpqncIM
         XBPDOAtP/uyzwCJ/NQY0SM7uC7wtnEPLQGyfy1psg0DemTaO8vjMZb+VIg/RM3FI43K1
         oLhnMoVZn1QCKaPW/DH6R8ybVDZiilxgTA43WKLsTlav61XUmYC6iry08iltjKaGfRnT
         faBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhLFoyRsNFbsrxnNESXmwFntyG0ZzkFB3Zl8hpEFyt1YscwvuvRDr01TZlCpR1LxGSrcy2u+OfdfdIywD5Q0Vm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7idTr+cr2vJ3WwQrMcfRH6qUVxIzd+rrBCHnN+bDssNMVvlmU
	3nSRBiF7QW/j0vNEYu3oQkNbY831i+mMJb/frsnRd3xsA8Zyv19OhfpR
X-Gm-Gg: ATEYQzwc0kbTox3zRddQSyQjA6Ezqcwt4wvLyWGqDFWJqJmhzFoA1yB8nTKg4PsQfeA
	t1E1QKAtrwh4YNM4V5aAX6J+IbCF9e5bOZXWbYk7VvWr4bMVVJ3faAY/nmGjzSbq17aHJnQ7Xn4
	N0+lYzLAtHtBmFBmiRoDe367qDVqom/BJPb3Laxv4UmB3j0j4cJxMLSd8EXpjmtZ3NivejBfQuc
	SEH/0Z9Yn2WOwKcaVkuJXTMqQjmITzjSqgnSEFRChOYuyHHrg4oIgCP9tVQtGe+prwoqQHXk1te
	/3FgxMyjrFKIRrUpb4jsiS/6bLnTZpCYKsjr5IXOEsyJ+Rr+T9fsh87+VumABxqBFuEvIF65OsL
	BXlRN0JR7bzqGGx3I07CqCXWhMTi1eVdd3VwyszYtAvLm+WSq+KR7H2WqL9yGJ3Ok2DnWWXb8N2
	XE4GFvTAWer+ykMrdeiiW4WJuWuok4s8YqlVhcCjFoMIc2PuSxev1+ZXy1DhlFHOwAjTo3fQaE1
	tCC+t8=
X-Received: by 2002:a05:7022:6620:b0:127:345c:439c with SMTP id a92af1059eb24-128c2eeaf9fmr5484444c88.45.1773091511897;
        Mon, 09 Mar 2026 14:25:11 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:9362:b19:e25f:7640? ([2620:10d:c090:500::2:405f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be7cdfc6c9sm349706eec.23.2026.03.09.14.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:25:11 -0700 (PDT)
Message-ID: <7905ed2d99a46a2f7a4eb41d4cb9f1dec108ecd3.camel@gmail.com>
Subject: Re: [bpf-next v8 1/5] bpf: Move constants blinding from JIT to
 verifier
From: Eduard Zingerman <eddyz87@gmail.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Yonghong Song	 <yonghong.song@linux.dev>,
 Puranjay Mohan <puranjay@kernel.org>, Anton Protopopov
 <a.s.protopopov@gmail.com>, Shahab Vahedi <list+bpf@vahedi.org>, Russell
 King	 <linux@armlinux.org.uk>, Tiezhu Yang <yangtiezhu@loongson.cn>, Hengqi
 Chen	 <hengqi.chen@gmail.com>, Johan Almbladh
 <johan.almbladh@anyfinetworks.com>,  Paul Burton <paulburton@kernel.org>,
 Hari Bathini <hbathini@linux.ibm.com>, Christophe Leroy	
 <chleroy@kernel.org>, Naveen N Rao <naveen@kernel.org>, Luke Nelson	
 <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?=	 <bjorn@kernel.org>, Pu Lehui
 <pulehui@huawei.com>, Ilya Leoshkevich	 <iii@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik	 <gor@linux.ibm.com>, "David S . Miller"
 <davem@davemloft.net>, Wang YanQing	 <udknight@gmail.com>
Date: Mon, 09 Mar 2026 14:25:07 -0700
In-Reply-To: <20260309140044.2652538-2-xukuohai@huaweicloud.com>
References: <20260309140044.2652538-1-xukuohai@huaweicloud.com>
	 <20260309140044.2652538-2-xukuohai@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_212515_400467_9EDA3578 
X-CRM114-Status: GOOD (  12.74  )
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

On Mon, 2026-03-09 at 22:00 +0800, Xu Kuohai wrote:

This was discussed some time ago in [1]. In that message Daniel notes
the following:

  > constant blinding needs to work from native bpf(2) as well as from
  > cbpf->ebpf (seccomp-bpf, filters, etc)

It appears this patch does not address the cbpf->ebpf part, or did I
miss something?

[1] https://lore.kernel.org/bpf/284404c7-c6e0-4cf9-8ada-71ebfc681541@iogear=
box.net/

[...]

> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_c=
omp.c
> index 52162e4a7f84..7a7c49640a2f 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c

[...]

> @@ -272,7 +250,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog =
*fp)
>  				       extra_pass)) {
>  			bpf_arch_text_copy(&fhdr->size, &hdr->size, sizeof(hdr->size));
>  			bpf_jit_binary_pack_free(fhdr, hdr);
> -			fp =3D org_fp;

Is it necessary to set `...; fp->jited =3D 0; ...` here?
It seems it does if extra_pass is set.

>  			goto out_addrs;
>  		}
>  		bpf_jit_build_epilogue(code_base, &cgctx);
> @@ -301,7 +278,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog =
*fp)
> =20
>  	if (!fp->is_func || extra_pass) {
>  		if (bpf_jit_binary_pack_finalize(fhdr, hdr)) {
> -			fp =3D org_fp;
> +			fp->bpf_func =3D NULL;
> +			fp->jited =3D 0;
> +			fp->jited_len =3D 0;
>  			goto out_addrs;
>  		}
>  		bpf_prog_fill_jited_linfo(fp, addrs);

[...]

> diff --git a/arch/s390/net/bpf_jit_comp.c b/arch/s390/net/bpf_jit_comp.c
> index 1f9a6b728beb..d6de2abfe4a7 100644
> --- a/arch/s390/net/bpf_jit_comp.c
> +++ b/arch/s390/net/bpf_jit_comp.c

[...]

> @@ -2383,7 +2360,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *fp)
>  	if (!fp->is_func || extra_pass) {
>  		if (bpf_jit_binary_lock_ro(header)) {
>  			bpf_jit_binary_free(header);
> -			fp =3D orig_fp;

In the similar condition for powerpc you reset `...; prog->jited =3D 0; ...=
`,
is this case different?

>  			goto free_addrs;
>  		}
>  	} else {

[...]

