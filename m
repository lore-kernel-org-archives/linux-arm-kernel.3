Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D483DC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 18:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0Qj2do2lKjHM4up5hNRdCkie5ZUt4A6ZgQ1FxVoTq8=; b=jLN3EIMmUMk0E7pv7xLN2+oIv5
	DamOaTtc2n3pn9w48GPtUVGfxulPtQ6x7w3oQ5+bxCpgP/9mcEhFrpRyRRfNgri+ILpRkCMaz1TIp
	8K8TmeT7TpsfUNPMj5qH9KU3CZ4koMwc4iUV/Ea6dqEDQPdUUKaGnFiTCN1O8kfPFqU/GBCv2qsza
	/yC3qjPz94nF9JiulJCCBF30ZpuVHoSGrfVYXSyem8MmfmWVW76Yzy5lI3c0xtwpmxLtVD+jicyIt
	UxGcfdRUHNwKKyz0dD3SjYAfBRecgPvfr+LadFRmSNv0NNH9sraMVqF7M0UXqox1o73wDFuMkSGqI
	+F52YWnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAmi-00000001yEw-1IYN;
	Mon, 03 Mar 2025 18:45:00 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAl8-00000001y1G-1AP5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 18:43:23 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-390dd362848so3780503f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 10:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741027400; x=1741632200; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0Qj2do2lKjHM4up5hNRdCkie5ZUt4A6ZgQ1FxVoTq8=;
        b=mC0v03r9AK3eEKfVLIiRO/H69LR1YgZX3OI61Bx3yxEgHW6OMKBecMHGYx0iuG4eCa
         7/eZv2PbZD9eH0UziRMhBRuJxFPITAJxhJ5PD2rnfgZbR5jbqeBktgElvBG1BWabEoI6
         S6rQLLZFLHTA6an5AX104ekyTVKBGXNrUGIgjH4zus+A/eLIS7HB7agRCxqncz202B2l
         +RkDaOo5tGMYCzw3z+tLiG9osrfUaVEQ21WlX2Oa/OM36CVRao/Gd3nHgYxBVNZBghpj
         697z+qjfw6wU8nJZGYQNaZRRN5glns2zeTYic7QNxzuYNCDQyTIO4GvuL0ki3GTWZ+HZ
         p3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741027400; x=1741632200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0Qj2do2lKjHM4up5hNRdCkie5ZUt4A6ZgQ1FxVoTq8=;
        b=k62jnkFUoKdzOfN4RUPDaQTpzonZ9pbdblzcNj8ITpR9w7id/SGXQi0WH4nigK1iIG
         1cT9XOT/QdqLpAAcxFyOgT7A8gKuQ0qRnl9V6W+V02YiJZ73lRLZHrtP7YBFZxR5Xqfe
         eJH56lUm0D2U8TIhDlDsi5mwiPN9oOrO/voh7IuFBzJDu146TEyLLT83wOviWFVHPj9k
         FwOge9aqASurwNsrKWPcmA9ExDb402W03i5BEgqLUALw4k/1BGDg0eC6hzN24D+8kbdl
         mpM1+niz2R6lfGixznXOl2L2/loDALv1KxfZno5EcKKC6+vycZc/HsF1vq/LsM25Qyyx
         ovVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEEQFp4LwdnI1fhVUNiRtHX/3gLBtCAvc7Nc1pgccYiKNUiSXWoW6sVLwlj0LRCvDY2n9FUxQFZkFHng3IgvLp@lists.infradead.org
X-Gm-Message-State: AOJu0YxUgZnpuM5Rs8nGDnNn3KYsUk3H+baa6xe2u8rOKexylkeqP6gY
	7Upa9Qj8JU2lBozEkL8y7ntkzV5Mjh8/2bmXcIJycxk29CHKSPLLA59m7lkL8PYDza4CFsOAfyE
	29c0UmKkKQtviVGwkdNt2wj+YxAlYt3IV
X-Gm-Gg: ASbGncvmBTcGOJE771nzq/fZygWl0Kan6ll/gmRnnoNHyE00713gfNsIcSQIwt4enKj
	91is2ygNsbthPhGE37FnPneesfzkpz8Vppfrj3o5oFPC3JWDVExtG03e9c7KB5dFpgiAcxYElK/
	t6q213AT9Xlse6KRzV45a5vCxegNV149fEJ33H316/bA==
X-Google-Smtp-Source: AGHT+IGDDnMZt3CWNMZ4/sQPWl3Fx2tgxAa5xRzjOQ98uGHkSButjm55wGRCRQL9ya4vSsAelL2gDCTl1KIzjuqQ0EM=
X-Received: by 2002:a05:6000:156d:b0:391:901:311c with SMTP id
 ffacd0b85a97d-391090131camr3764566f8f.32.1741027398340; Mon, 03 Mar 2025
 10:43:18 -0800 (PST)
MIME-Version: 1.0
References: <2c82b29f3530b961b41f94a4942e490ab35a31c8.1740978603.git.yepeilin@google.com>
 <202503031631.OeUhVRHz-lkp@intel.com>
In-Reply-To: <202503031631.OeUhVRHz-lkp@intel.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 3 Mar 2025 10:43:07 -0800
X-Gm-Features: AQ5f1JoRxo3CAzV2ykcVy66gZAUbFkQeh9Ko6yETGexZgoB5dBAptBGoLyQICIg
Message-ID: <CAADnVQLLhNRmpjwDYHB0-59TDrGcgXzqSkop+-5eHYsG-Ws08Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 04/10] bpf: Introduce load-acquire and
 store-release instructions
To: Peilin Ye <yepeilin@google.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	oe-kbuild-all@lists.linux.dev, bpf@ietf.org, 
	Alexei Starovoitov <ast@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, David Vernet <void@manifault.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_104322_315006_BEBD63C9 
X-CRM114-Status: UNSURE (   8.98  )
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

On Mon, Mar 3, 2025 at 12:55=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Peilin,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Peilin-Ye/bpf-veri=
fier-Factor-out-atomic_ptr_type_ok/20250303-134110
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/2c82b29f3530b961b41f94a4942e490a=
b35a31c8.1740978603.git.yepeilin%40google.com
> patch subject: [PATCH bpf-next v4 04/10] bpf: Introduce load-acquire and =
store-release instructions
> config: arc-randconfig-002-20250303 (https://download.01.org/0day-ci/arch=
ive/20250303/202503031631.OeUhVRHz-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 13.2.0

...

>    kernel/bpf/core.c:2228:25: note: in expansion of macro 'LOAD_ACQUIRE'
>     2228 |                         LOAD_ACQUIRE(DW, u64)
>          |                         ^~~~~~~~~~~~

Peilin,

how do you plan on fixing this?
So far I could only think of making compilation conditional for CONFIG_64BI=
T
and let the verifier reject these insns on 32-bit arches.
Other ideas?

