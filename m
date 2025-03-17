Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E828AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 09:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMORBukfDNOzWrCEQijjWj2H6MggMJxZRFJuSPvnV3s=; b=3YqRx2cR/7/UMGskNkKcItKTY9
	qIwci5H6EaP0CYNP6+p+cJax/imGSAKxyjOM5RBrUxz51Z6DB0dB68KpIAHuuIEMlFAWOHe4cGnXc
	do1xPtH+YZzpT/Auy5zUl7BgyCF2ymRt+iP9Ob4vqbC9dgvx86AsexiSVhqFDUwxLy34QxUbqAQN0
	tegpzbMRUL5aulfO3EYMLbIlVJ0V2Mm/g4ehU2mZgW3yn+LUIvpy4g0UgkTONVxKn9iOLgPa98OUh
	i4hyIwHNo/1mNCiDe0JVrwqLFSLZvoB1fREYigiUY7G+7XZXkf2DO4N51EWVNs5xurJWEpWZbmUZQ
	ETCUtSIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6eZ-00000001tiF-1fGz;
	Mon, 17 Mar 2025 09:20:59 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6cs-00000001tT0-3jm7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 09:19:16 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-225d66a4839so47741985ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 02:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742203154; x=1742807954; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lMORBukfDNOzWrCEQijjWj2H6MggMJxZRFJuSPvnV3s=;
        b=G9QTSz7wNCcS+dg4IrmEgrCh48qpEuMrgwX0XThbKiYfUBgwxSiJOZEoflnJ1rQs2k
         gNbMDsjBj+OojdqQmYdON7sAODtj1Qhbn+idCCnbaRngwx7Ch+S5A7b4H2vfuCg3Jhsj
         374+NcHRNTOhG+9Rtp/WVsOCvJVRNffFWR2/rzyW9vsFeb9BL8MF5Ck8bbnHQ0ujS9YY
         4l9F90wOA3Jqt0Omn7slJfq6ZDL6vIW0p34mGlDwu7b9abkOTvFnny14OLe4H15M+7tF
         H4/ad1icOqBfCLHgYshcgNNUUH7ESsBXSrqhv9EAVqYrLK1f6lRRaAUSGwZQC8pDNeKr
         XO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742203154; x=1742807954;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMORBukfDNOzWrCEQijjWj2H6MggMJxZRFJuSPvnV3s=;
        b=T005Bc4BYcb02LsJn3/xe/qZmZbl/AkIIHpqvgWH7z2F3K/QoJBExvLMsg8xrZDEhf
         egAn4mTeu+c6GO1N1gSNixwQuY27E4kljsyktwDq0PRWJPNT5c3HvoxucG4w8quUx1/P
         cr8cVsgP2/cXkq5oZtJxUIbu3qN0vZw6Jn9zn6p6gqXNdB8EuM6KDQUFUnPUi7tQxHKD
         4DkphmNOkgnlIU27P5xTA8VEQmeMoONlsN2T7ACU/g0q9elsHLgvDeJjUla2PFUkzXhG
         mHwfUqzvxRvpwuQIq2vk1v18fkWkTwfIqjLBpr46UxAPy3yjEPIanEOYbXxR6s2vtpVa
         PQVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHTTg+9MgQ86LyCH8eUbjuJzr4nmn1aFtwn3kSFP5pFD0K+ogJ7lQfrxS1pwF+QvXRDIs2bIDS+Mbvs4By/xIC@lists.infradead.org
X-Gm-Message-State: AOJu0YwX4/B5YUGBz6xYJUC7q2KsTXcfU00wg7G80sq5Xz5dwi3DTn6c
	Di9dv9nhZsilxpHhlL31BFefu8BAzzN18vwCaHJjrB2OpOdsD5Oh
X-Gm-Gg: ASbGnctThZnvdM0WMSNr1urG94LC3ztIn7BYYBAEF/djqQ5BBAE0q5x6YEO3CGmuJgl
	fYY7etoLlGUJhibUmCm29Vnc/al2JWa2UbOI5qFNFZOmCPJs6Pej5D8iTuBbdlkUe4J8M76pcpF
	fbKdN+DUdAZqkuQi3x4XeWsCd7dDqmBBeobLuouK1vmLRrEqg3KwXmmp5cevlJxK8yLaj6cuYTJ
	lqiIBtf7zVVNlsZtjWvx55/BRu4BFOa7Vu+3mw4+oglUzZjgVbvRodt7TBHzK1xhVwhkMOsdm2p
	QLuPHVOHZQoZGhvszsR7qW1+yCKvJ0/9UPRRcUSiEv/8SDBDFi8=
X-Google-Smtp-Source: AGHT+IFQrLJwhlX7+RiGH3CxZ9FfxID5MIfJ1arkUBWGEnsa5Y9RjhdscgDV1ztpHSFUF5oJv7iB3A==
X-Received: by 2002:a05:6a00:8306:b0:736:5813:8c46 with SMTP id d2e1a72fcca58-737107f9d11mr17429679b3a.8.1742203153453;
        Mon, 17 Mar 2025 02:19:13 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737115293f6sm7340451b3a.14.2025.03.17.02.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 02:19:12 -0700 (PDT)
Message-ID: <9083b52fd4a2d7a5a0473e858042c277c883f8b0.camel@gmail.com>
Subject: Re: [PATCH bpf-next 09/11] bpf: Return PTR_ERR from push_stack()
From: Eduard Zingerman <eddyz87@gmail.com>
To: Luis Gerhorst <luis.gerhorst@fau.de>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,  Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend	
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev	 <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>,  Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai
 <xukuohai@huaweicloud.com>, Catalin Marinas	 <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Hari Bathini	 <hbathini@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,  Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman	 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Mykola
 Lysenko	 <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, Henriette Herzog	
 <henriette.herzog@rub.de>, Cupertino Miranda
 <cupertino.miranda@oracle.com>,  Matan Shachnai <m.shachnai@gmail.com>,
 Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, Shung-Hsi Yu	
 <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, George Guo	
 <guodongtai@kylinos.cn>, WANG Xuerui <git@xen0n.name>, Tiezhu Yang	
 <yangtiezhu@loongson.cn>
Cc: Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
Date: Mon, 17 Mar 2025 02:19:08 -0700
In-Reply-To: <20250313174149.1113165-4-luis.gerhorst@fau.de>
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
	 <20250313174149.1113165-1-luis.gerhorst@fau.de>
	 <20250313174149.1113165-4-luis.gerhorst@fau.de>
Content-Type: multipart/mixed; boundary="=-pU3IArgK79wjJvjdvEwt"
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_021914_936409_844A4809 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

--=-pU3IArgK79wjJvjdvEwt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-03-13 at 18:41 +0100, Luis Gerhorst wrote:

[...]

> @@ -2011,8 +2011,10 @@ static struct bpf_verifier_state *push_stack(struc=
t bpf_verifier_env *env,
>  	int err;
> =20
>  	elem =3D kzalloc(sizeof(struct bpf_verifier_stack_elem), GFP_KERNEL);
> -	if (!elem)
> -		goto err;
> +	if (!elem) {
> +		err =3D -ENOMEM;
> +		goto unrecoverable_err;
> +	}

Could you please point me to a location, where exact error code
returned by updated push_stack() matters?
I checked push_stack() callgraph (in the attachment), but can't find
anything.

> =20
>  	elem->insn_idx =3D insn_idx;
>  	elem->prev_insn_idx =3D prev_insn_idx;
> @@ -2022,12 +2024,19 @@ static struct bpf_verifier_state *push_stack(stru=
ct bpf_verifier_env *env,

[...]


--=-pU3IArgK79wjJvjdvEwt
Content-Disposition: attachment; filename="push_stack.dot"
Content-Transfer-Encoding: base64
Content-Type: text/vnd.graphviz; name="push_stack.dot"; charset="UTF-8"

ZGlncmFwaCBHIHsKTm9kZTB4NTVkZDRhOGQ0YjUwIFtsYWJlbD0ie2NoZWNrX2NvbmRfam1wX29w
fSIsIHNoYXBlPXJlY29yZF07Ck5vZGUweDU1ZGQ0YWEwNjc5MCBbbGFiZWw9IntzYW5pdGl6ZV9z
cGVjdWxhdGl2ZV9wYXRofSIsIHNoYXBlPXJlY29yZF07Ck5vZGUweDU1ZGQ0YThjYTU4MCBbbGFi
ZWw9IntjaGVja19oZWxwZXJfY2FsbH0iLCBzaGFwZT1yZWNvcmRdOwpOb2RlMHg1NWRkNGE4Y2Yy
NjAgW2xhYmVsPSJ7Y2hlY2tfa2Z1bmNfY2FsbH0iLCBzaGFwZT1yZWNvcmRdOwpOb2RlMHg1NWRk
NGE4OGQ3ZDAgW2xhYmVsPSJ7ZG9fY2hlY2t9Iiwgc2hhcGU9cmVjb3JkXTsKTm9kZTB4NTVkZDRh
YTNhMzYwIFtsYWJlbD0ie2FkanVzdF9wdHJfbWluX21heF92YWxzfSIsIHNoYXBlPXJlY29yZF07
Ck5vZGUweDU1ZGQ0YTc2YzYyMCBbbGFiZWw9Intkb19jaGVja19jb21tb259Iiwgc2hhcGU9cmVj
b3JkXTsKTm9kZTB4NTVkZDRhOGJhODUwIFtsYWJlbD0ie2FkanVzdF9yZWdfbWluX21heF92YWxz
fSIsIHNoYXBlPXJlY29yZF07Ck5vZGUweDU1ZGQ0OTU5ZmU0MCBbbGFiZWw9Intwcm9jZXNzX2l0
ZXJfbmV4dF9jYWxsfSIsIHNoYXBlPXJlY29yZF07Ck5vZGUweDU1ZGQ0YWE1YzFlMCBbbGFiZWw9
IntzYW5pdGl6ZV9wdHJfYWx1fSIsIHNoYXBlPXJlY29yZF07Ck5vZGUweDU1ZGQ0YTlhM2FjMCBb
bGFiZWw9IntwdXNoX2NhbGxiYWNrX2NhbGx9Iiwgc2hhcGU9cmVjb3JkXTsKTm9kZTB4NTVkZDRh
OWZiOWQwIFtsYWJlbD0ie3B1c2hfc3RhY2t9Iiwgc2hhcGU9cmVjb3JkXTsKTm9kZTB4NTVkZDRh
Nzc4ZGIwIFtsYWJlbD0ie2RvX2NoZWNrX3N1YnByb2dzfSIsIHNoYXBlPXJlY29yZF07Ck5vZGUw
eDU1ZGQ0YTc0MTk5MCBbbGFiZWw9InticGZfY2hlY2t9Iiwgc2hhcGU9cmVjb3JkXTsKTm9kZTB4
NTVkZDRhNzQxOTkwIC0+IE5vZGUweDU1ZGQ0YTc3OGRiMDsKTm9kZTB4NTVkZDRhNzQxOTkwIC0+
IE5vZGUweDU1ZGQ0YTc2YzYyMDsKTm9kZTB4NTVkZDRhNzc4ZGIwIC0+IE5vZGUweDU1ZGQ0YTc2
YzYyMDsKTm9kZTB4NTVkZDRhNzZjNjIwIC0+IE5vZGUweDU1ZGQ0YTg4ZDdkMDsKTm9kZTB4NTVk
ZDRhODhkN2QwIC0+IE5vZGUweDU1ZGQ0YThkNGI1MDsKTm9kZTB4NTVkZDRhODhkN2QwIC0+IE5v
ZGUweDU1ZGQ0YThjYTU4MDsKTm9kZTB4NTVkZDRhODhkN2QwIC0+IE5vZGUweDU1ZGQ0YThjZjI2
MDsKTm9kZTB4NTVkZDRhODhkN2QwIC0+IE5vZGUweDU1ZGQ0YThiYTg1MDsKTm9kZTB4NTVkZDRh
OGNmMjYwIC0+IE5vZGUweDU1ZGQ0OTU5ZmU0MDsKTm9kZTB4NTVkZDRhOGNmMjYwIC0+IE5vZGUw
eDU1ZGQ0YTlhM2FjMDsKTm9kZTB4NTVkZDRhOGNhNTgwIC0+IE5vZGUweDU1ZGQ0YTlhM2FjMDsK
Tm9kZTB4NTVkZDRhOGQ0YjUwIC0+IE5vZGUweDU1ZGQ0YTlmYjlkMDsKTm9kZTB4NTVkZDRhOGQ0
YjUwIC0+IE5vZGUweDU1ZGQ0YWEwNjc5MDsKTm9kZTB4NTVkZDRhOGJhODUwIC0+IE5vZGUweDU1
ZGQ0YWEzYTM2MDsKTm9kZTB4NTVkZDRhYTNhMzYwIC0+IE5vZGUweDU1ZGQ0YWE1YzFlMDsKTm9k
ZTB4NTVkZDRhYTVjMWUwIC0+IE5vZGUweDU1ZGQ0YTlmYjlkMDsKTm9kZTB4NTVkZDRhYTA2Nzkw
IC0+IE5vZGUweDU1ZGQ0YTlmYjlkMDsKTm9kZTB4NTVkZDRhOWEzYWMwIC0+IE5vZGUweDU1ZGQ0
YTlmYjlkMDsKTm9kZTB4NTVkZDQ5NTlmZTQwIC0+IE5vZGUweDU1ZGQ0YTlmYjlkMDsKfQo=


--=-pU3IArgK79wjJvjdvEwt--

