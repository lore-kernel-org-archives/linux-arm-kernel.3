Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F241F51416
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 22:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUW3uQ0GOOk5NLEcFEyI1LZbgO/qREK4Yx9n2fFhxPY=; b=fHbsrKf0iQ/ec4L0iwrK0zkdSq
	ARqYuL0eBUwnWePqfw93URGMOAOXhCCvS6Nqmn6XSYYKxr3noeNmBLH+ZrxpkZZlebWR/ax6u/68+
	us2Ye/v/WwrGVzcar/R+0j9ptZMaEOF+YLP59VhOLwVuUzU6aToOTF9MRxy1lQRmb0+cFv4qlk1MQ
	gWedlEsTU8vTmAKg7rsNPNZDCKjinobkWvxLPYM0Af17i9h8yPq+Z4q3F1Q2vA8sjhrOf9xYQUcwA
	XAbMsLrH+nALnRnipA5n61rBWmvxDp6yE5SuuhAqOvX8AZME2XjJI6zv/TXR3Qvh8YCnMHb2pAMMS
	5ENe7SDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydjr-00000004at0-11DE;
	Fri, 06 Mar 2026 22:33:43 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydjp-00000004asf-00xo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 22:33:42 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-439aa2f8ebaso4316812f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 14:33:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772836419; cv=none;
        d=google.com; s=arc-20240605;
        b=W9QZSkMsZnnLRz8xHkN1LFbFeJNDxUG/FLJVLO9WimTU19UkYysDlXzgM7rsdr3Ddz
         I8hptxk27jZOMcAXiDllHbCCVBiVA8OnKX6XMw3fqBxvmDdeko+Rc4XNphjpsXIl0+A3
         hGXqPxu4gwspTmKIVa8NTtJwA8XiI+EtC1Dqpx/Rp4XZkXQnUYvnrKW7dCZuRvViMP8Y
         oI8f9G69UEvZc+3AbWJ7RVCLyxvsSMyhB10cyKYKtPNB216kXtUaIO9eRhY106Ww9j0V
         jxWlpDXAKyBzqhXO2/RlkoxHPcVE4eI7E+UQu4Eh8WQHjCRVxBw6z6bH49NrOFd59Ddw
         hgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jUW3uQ0GOOk5NLEcFEyI1LZbgO/qREK4Yx9n2fFhxPY=;
        fh=9ukHZsU45jcu+ytjeQsBPu100g9vW0PPBop8M8UYp+I=;
        b=TGQy9rb5i0KYxmc0ZntyemmDstpMMquoSGaBjsA8cG90XLqg+lQgk12rKC4XWDwVgc
         retqmgC8ZY2WhUSglcCWSisCSV/juH2015qogPaNKbr2Z3/OlEoMpB/pUFmtFoPzFvTK
         g1LWFAfDtEWsA20/BLgc2BaIMwIekLOZG3DcynCHlUJKZuCBjWFay2pZONZGgPCtYrxR
         c9HNU6Ww8zVhbDQH4Io5iRBbLPnNRiwWFbDrM8bcv7JU9gOVZa0inEdqu9jtpKDzaYnU
         M6K5L+/vFJBiOwttXRbYWIbIxOHV0cvFJ0NtgRlAwJ2JvO0y3z/Jr5PjoMuf/vXsJaIu
         CZGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772836419; x=1773441219; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUW3uQ0GOOk5NLEcFEyI1LZbgO/qREK4Yx9n2fFhxPY=;
        b=SaLEEkPqJyp7a8piI2T3XxwVMyTye3OjgdIwK2aO/m2TFgkBDCsKaifhxnPiYL8rAS
         23hPxRw/GMyRy0lAplZ/nyyvyA/yi2FhL2i0rb2G9fA6VMhrtpC5+IG36V3mUCK/IcJE
         TPRjwPoj37E7YuAvutB+cI5DulnT5MLY0cRtoJ9JZh8i7oHKVLblZoDJ/wrJaTBt6X77
         9FjMi5F36bJKyStuxkfFpT6V3nJ/o1UWlCg0DiIEwXCsRT65QNehvwxBpk8bjOERufxu
         +gN+Ewn3X7EVj2if8ZwQj6i9jpuArcOe2wyAL15Qn1ootpGR+TbvVumPqOiuJOA2f2Oh
         fd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772836419; x=1773441219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jUW3uQ0GOOk5NLEcFEyI1LZbgO/qREK4Yx9n2fFhxPY=;
        b=wMrlw9UAHBsx7z8c8KSSvyqToZTITNbWmZhSA+KiXFRk0RsFYVgaMUK1m4vkoItYwZ
         6GIIJVbO3H4K9kXkpri4d8TfscaGj1JvEui8NcKjOnF/o/Tv/1QqowpDrBFqwY4VWFqS
         SEpPRWYlz3hF6q96Ohd3MmUtBjvf1wWeqT0EDNd7U+wilwO+2v/8w/jNNHW7wDfU7735
         r0O1/VacCgcTPyrulQsOCHwxtHjkx1IRnQ+J6spdEpEpSgPH8jhwWPe7L8gqsL0byEfd
         q1fjN0mTr0Urt+KKUOK6RJt6GHqjaJ48TVDhCTJCmU64S6h2+qH/J1NF6yRnf6MtITs7
         wrWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXva5pfqAyIEFQYZPLA1I+ey7xP2aOVAEp2rE9OlpQXyJIlMwjGq6DIuBVrjECwQQLNdi/dmwgIsjKV4qI3pcID@lists.infradead.org
X-Gm-Message-State: AOJu0YxWZ3ReXF+plaQvBfMTozTk9eenpa8S0MQXpYbi07XXa9fNHir6
	Lo9ismNLmdeJ68XcR/Ny5++BymY4jNs+H9+74xFsqhm2VPIdqPhfYzT34mRfWM4xGU6+55b/Jpi
	teh4uESeZ6s1pFDdMwAA27NNMMVTbev4=
X-Gm-Gg: ATEYQzysz4EdOX12Zq12xXeAx34xAdjV9PETs8x5zazxOBKAdyl/69JtirnDAX8tgAK
	dabWuee4Ua8BBd/s7Y8KOdzYufmego3ysqLrgMjh38cSGfwGNAZAhOOlxZAt3Ed438RYQaqTno3
	zxz5BtpLhliM1qO1sw41O45sbkbW3NxkFlnp/6KIbGl0jMb/MIUZHDtGkUZPtsuYIVFloqyaPgv
	o0C+eKVyYO4nO/1EfF6M1DtMcNZkeYUncI3OEQpscLQG/32n/pnPYTvZ1QoEJMvqgCWPNN/0moy
	8eFBJ2LMvfOPLYuzJQcCZzyYDF9BM4K5r6Zl79tzSVVP0EJFUHX4Gdzipx1PJ4rr9zPboI9NGqq
	hmx/61BZXcs+nBpVHiSzObUc9DQ==
X-Received: by 2002:a05:6000:2003:b0:439:ad2d:99f8 with SMTP id
 ffacd0b85a97d-439da885bebmr6744576f8f.30.1772836418704; Fri, 06 Mar 2026
 14:33:38 -0800 (PST)
MIME-Version: 1.0
References: <20260306221330.630971-1-yeoreum.yun@arm.com> <20260306221330.630971-3-yeoreum.yun@arm.com>
In-Reply-To: <20260306221330.630971-3-yeoreum.yun@arm.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 6 Mar 2026 14:33:27 -0800
X-Gm-Features: AaiRm523IJSrvR6Oh5s_-TbReIdaszdnRGNng5EUigJX51I46zC9wDY2sRJtdOs
Message-ID: <CAADnVQJW2vK9YEsdnDMbij9Ed-wfra3Wbg4mp95C=xiDw6Bteg@mail.gmail.com>
Subject: Re: [PATCH 2/3] bpf: introduce bpf_jit_insn_aux_data
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, richardcochran@gmail.com, 
	Anton Protopopov <a.s.protopopov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_143341_084515_594F32A7 
X-CRM114-Status: GOOD (  13.86  )
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

On Fri, Mar 6, 2026 at 2:13=E2=80=AFPM Yeoreum Yun <yeoreum.yun@arm.com> wr=
ote:
>
> This patch prepares for fixing the BTI exception related to gotox.
>
> bpf_jit_insn_aux_data contains per-instruction auxiliary data for the JIT=
,
> extracted from env->insn_aux_data.
>
> For example, it is used to determine whether an instruction is
> a destination of a gotox, allowing the JIT to emit
> the appropriate BTI instruction at that location in arm64.
>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  include/linux/bpf.h    |  6 +++++
>  include/linux/filter.h |  4 +++
>  kernel/bpf/core.c      | 59 +++++++++++++++++++++++++++++++++++++++++-
>  kernel/bpf/verifier.c  | 30 ++++++++++++++++++++-
>  4 files changed, 97 insertions(+), 2 deletions(-)

before posting patches please scan the mailing list to see whether
a particular issue was discussed.

pw-bot: cr

