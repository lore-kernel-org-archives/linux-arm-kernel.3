Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AEEC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 05:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWZczVLGJa1y4XReahdUAMxIiZ2gtlx/faB4w9x6vag=; b=tZQV1UUlu+NDjtQZQMAC4PD2To
	jHa4KP0JHYLnYUCbw3UuE6xQZ8xy+/RUyT/Q+CSH55KD8PY4ayd67LdBj0IGcMjrZD9vkta9Sc0ER
	I58ijdbn4ZYEEQ48bp8cZIFeXLGITx6eEll/YQDOcgONOG8ICVbPFIpGylmTLGRPF+/a64TY/Lrnk
	ocCHWyexYmhPoK4gvo49RwAzDs6u+hh3vE+nNmUq1IdYPS+txM2sq+KaVhkITj3O/31wPocD3iaPw
	ueCksM35TFX8UtU2uU2F0uankoMlCNAR36KENnAUwMC/VWCkrRw8/Vf1hh7+yj2eL/Y2Vcokx4nFs
	cL5EdfwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toyoC-0000000HIHH-3rwE;
	Mon, 03 Mar 2025 05:57:44 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toyd8-0000000HHIz-1uZP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 05:46:19 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-223a0da61easo124395ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 21:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740980777; x=1741585577; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LWZczVLGJa1y4XReahdUAMxIiZ2gtlx/faB4w9x6vag=;
        b=HsYjIPiQcNpwNRUqC2xObMtW3vP0mBlcRGb1N2RqsCj3CLziRsJ+Zcz8CAampOoLFX
         9ljX9xYjh7vWfajhzk44QJXqWvQoWhApg3MgPKcmkN3Em03Zv5SrXetIkt4NuA4M0R7U
         1np7B81k9mO4REnnI8+odGKnPR7Cul+ugbiNl085Kx5fnT+2SsT9XZbCMVmqWX3Q93gH
         ajUiHak6bWUfijYmd5Vg/z8Q8foRgtgvszQKqiZ+O7Uqpw8LWnS0EHEIkdMRBeiXUZKU
         tszRHt2tL/5/FxvXhH9mEsoHqeDbLnD0Jgt6TMawVnJelydlnCvG7SN/Wo4GSJKZBWjC
         e+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740980777; x=1741585577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWZczVLGJa1y4XReahdUAMxIiZ2gtlx/faB4w9x6vag=;
        b=tFC8UHZY1zFp9ADzRGN7YJPF0kuKuAG+70BMVoLcOzcWXFDaBUZleRiQra/qQJqo3t
         kJaKDjO3xWYZwORGk5DAvjhlVGnrUmg4KNyj+hoGRIywjsE9/0feeMbTZ3xgJaU/WlS1
         kMVwia8y0Vx/IgOnhAJn0bXFiwccbYYvoYroQikhjXbYMnEUlXXfXbx2RlMLAQz1mEEB
         igV7kar+rZxp3wyVKbI0uHCJd27ybho+2SRw+i+D6OFbEkJnWjfZGEfxnCc6o+AdN5x+
         XfAYhAH/mUNhluEbTtIpp5KdRQbW0hFhMcdyokL3KILFJbGOEVUYpl0Z2TZdwZ7MC3JC
         /D9A==
X-Forwarded-Encrypted: i=1; AJvYcCVg0ChWFRXmBtdF7Sq5gKyk1HtQwUypreUL4x5+hKWbst2oJl5k4GaXRRnaS6Gu4JUWKEFJ1PbgPqvviQsXo9TG@lists.infradead.org
X-Gm-Message-State: AOJu0YyPTI8lV84teKtyWOlg4GieAbs06oMh3zbbaWdOT89DmHdcVnJQ
	47AUFgeBZN7Hh18Dx/ba31LwWkOaI3iKDYwQMkMJ1NYMvJI71ljO4dfTlzbDSA==
X-Gm-Gg: ASbGncuImCu1UYU4fuBRILWyDNIG8hcs1B0xG+qA0EvlRHAYgzjLCw/lQCtpfRaWQ+w
	CpdrhU3OAs0i8WM+hMjTPGEAO6OJViWxOncoAu5QUAq2dNiCgUnZvSdTz/f+nJWYVmzuNzpp8jJ
	BCi/X48uqKIK48jd53JIjyLScNjrt7JDINYCqAiVo4iIFnDM02nQSzEvxAMAqhU6Kx184A4i9tk
	1SEWnztzBQj1U4EbkHag4rYD80hqFwhxD6lbFC99GpOmUEueYoALPjd1bKG2qip5qw50A4wE/vH
	GIv50LmSVXuAxZIr2Rrvc0oiLEHiYZqJAFR31CcAFJCU3tyXWM0rwvqMc8ymrVsEl4HY+u2j3nA
	ZrOBKkSQ=
X-Google-Smtp-Source: AGHT+IGR9sIbs4GODDlDVazb4ZHmmL3k8nYNXhdZXtHYDL05wSLBQV8yxY07hQVWXU5lra6HhADNPw==
X-Received: by 2002:a17:902:c947:b0:21f:56e5:daee with SMTP id d9443c01a7336-223826bd593mr2964695ad.6.1740980776552;
        Sun, 02 Mar 2025 21:46:16 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a0024c04sm8210373b3a.105.2025.03.02.21.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 21:46:16 -0800 (PST)
Date: Mon, 3 Mar 2025 05:46:10 +0000
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>
Cc: bpf@ietf.org, Alexei Starovoitov <ast@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	David Vernet <void@manifault.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Monnet <qmo@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Yingchi Long <longyingchi24s@ict.ac.cn>,
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
	Neel Natu <neelnatu@google.com>,
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v4 08/10] bpf, x86: Support load-acquire and
 store-release instructions
Message-ID: <Z8VCIrnJ10uBj0yN@google.com>
References: <cover.1740978603.git.yepeilin@google.com>
 <ea2754510513dce17a1d8f4fcab07d9d769e7b08.1740978603.git.yepeilin@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea2754510513dce17a1d8f4fcab07d9d769e7b08.1740978603.git.yepeilin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_214618_499352_80C4448C 
X-CRM114-Status: GOOD (  11.84  )
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

Hi Alexei,

On Mon, Mar 03, 2025 at 05:38:07AM +0000, Peilin Ye wrote:
> Recently we introduced BPF load-acquire (BPF_LOAD_ACQ) and store-release
> (BPF_STORE_REL) instructions.  For x86-64, simply implement them as
> regular BPF_LDX/BPF_STX loads and stores.  The verifier always rejects
> misaligned load-acquires/store-releases (even if BPF_F_ANY_ALIGNMENT is
> set), so emitted MOV* instructions are guaranteed to be atomic.
> 
> Arena accesses are supported.  8- and 16-bit load-acquires are
> zero-extending (i.e., MOVZBQ, MOVZWQ).
> 
> Rename emit_atomic{,_index}() to emit_atomic_rmw{,_index}() to make it
> clear that they only handle read-modify-write atomics, and extend their
> @atomic_op parameter from u8 to u32, since we are starting to use more
> than the lowest 8 bits of the 'imm' field.

For x86-64, v4 PATCH 08/10 implements ld_acq/st_rel as regular LDX/STX
(aligned) loads/stores.  Please take another look.  Thanks!

Peilin Ye


