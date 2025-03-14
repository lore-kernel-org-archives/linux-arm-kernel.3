Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBF0C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 22:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zZoEhi64Kn/eQi3WO9JY1pGevNfO0NZbYey6p1uGuc=; b=a79u658z7tM/yNx+QrceNmFY+o
	wchd6+D4YyDAUi6qqS1zFb9MbVeapEifPwzX82qT1jXzp9aBbcPqLC8X9cZ2g3jAFRm6PPii84M/B
	XP6+4r9H3WK3+pPNVjRNRZuLPsueDlSuDRBC38snPPLYx2SpT/QSrKlRy1lExQY1/RG506yd4U1ax
	wYjCT9PXJbksdUVO4IBUo62k43CgmzmJU8htcx53Tg51V3C/BoFVlo1CmgJtarOnOE7TBMzSGJfXl
	tHl5BF7MJEHV2F952vR8QtChLg9CsLXyFH7gWb2rPQLTLYR8Zwwtirb9PWUfWGFF4yK6jSZW7A+f1
	6AXHAo1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttDpp-0000000FSjq-03fN;
	Fri, 14 Mar 2025 22:48:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttDo9-0000000FSfi-3sWw
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Mar 2025 22:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0zZoEhi64Kn/eQi3WO9JY1pGevNfO0NZbYey6p1uGuc=; b=Cbke550NbxKPZZhkim4CZF/URd
	0BJ3imtN+kg13I80GYKFvCsRTP1fMH4hscVQFWgXVXUWd40LHx3woGUP6Y10m9OQuEUCbRENNrW1T
	QgB8qfR1o1YsGe88ZHKyFglnZM54JVJKprXd1h8d3/i9SGedPOfC5dlEU44tCaPMoPJ0POfCMDEXH
	rrTHxMM87ITaMvhs3WgbRbZ+UXUdgYxMClNGsWpDHKTHNGzI7weGvmR9WUg9KLb7Mts3G3ocA9N0Q
	8fglnkMXj3psgR6IiEXE5CIjmW5QEioM/RshbSsSaGPpcShw9Qks03qPK6iM1opgOzcovu2h3xYHX
	TVczJR5A==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttDo5-00000002zoJ-1XD8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 22:47:12 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22438c356c8so48187195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 15:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741992426; x=1742597226; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0zZoEhi64Kn/eQi3WO9JY1pGevNfO0NZbYey6p1uGuc=;
        b=isXJSnFfAW1MGSBBs9rHz/ra7lXIUb6+yvhuMkuTN1ijSfxNjTvwc9hSxTMI7/xfE1
         eQaBPSqFN3oWuW0PlmcYGyP2EAAfM7Xvdjkxx+Ax+cMdflPLgt1wVXyA4KLcKRjRetN/
         y/YV4cY3VE1dcMkn3kBu+AarINiF6XO0B7iyIIkRFRJdHdUovjmWG/J9DFn/qNJFiGJ1
         Bgd3XFoR555xW2tD52qlooLquj5h7ZDxvJQ1zD6rjD9sjHRHO1pcLvaNiJX2WPcD6wgT
         mw4HwRs6GRjbcCZWzpNHUMZL0Pb07j4nycSQWNZfXGmowT3jaCMX9UP5RB4PPvCpMdz4
         CcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741992426; x=1742597226;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0zZoEhi64Kn/eQi3WO9JY1pGevNfO0NZbYey6p1uGuc=;
        b=CTv94IayWWcF9Kclubgty9WMDoaWYBidtCkd2OEjx6lE0TI8KnsvdMmo9Sd5YGm1z1
         S6CF3OBlVmMAHii5d8ngcL4r+7EsNiGNZaa8D4AIsqm97sGqVNw6QVzjQ4/cLWbnTp6K
         TGR8TFN8b0i604wLFQUVf7/10jQYnzGGsKGVwhm5SiV2e9L0XwA9AkcR0NLYL9BJLaxM
         ip0930m/g4LxM0y+LX7L5S0rvxWZOvj13uw0/wHbH7cWVn8sAd4j/m1XIhZQZe9ZbkU4
         SFiKYzScx+GizGUNN+AF5VRO9HzGPVOXceNuSV33TfrFYQkaOdTozFu85sSwIPnXLRhR
         SMsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSrPlAfSQCMeTtAkVRZh3hVPy90t3XpETbJQiHAnbBbohZMJR1M3ztJAIZvOSJKAAH5PwtvxUySr/2XtKpHpwM@lists.infradead.org
X-Gm-Message-State: AOJu0YzFDdTrZpWxE14+8GtmFddHsVnCjmzeX8RSodMqagdzH+6Lff8T
	9kMz+khQHMki5bbomFREocZFMdewT4kdl4Wp6skWNJjg4MrcvaE6
X-Gm-Gg: ASbGncuUhdXQiFlU6nm44hORiPgwmOOMd4HlLfQ07a0XTNJxMzc8w9f4N/D4Wbw/vph
	E0xNtL0kobxSGx/7kjXuseF94Q2y8zbyrtqfw23lx48kkw25MuFIO2+2LLjLOJgt/fcgAorU6YG
	2H8gCNIUVJnI0gg6sw/6FQStLfSTzfWDqluNnXT9nxr0//rAmwCpHkhqz/SGvG4N89GM4WjAzxe
	WyHeIq46Xx1cWmC8tY3C/Tu3yEymFlRuKiXGX+9Kw2KjewZVVxA9fUSmQs7hh8T9dUeOI0XRY6U
	qFWvSYR8Cy4h6ixBr3lnWvs1AB6WYGU14u8ajN5C
X-Google-Smtp-Source: AGHT+IE5BsFikv0Zy/M5K5/YooQ0IZXHiKgPfdHvD36gcvkA4VKCXVrThbSUpc5Gp513eGAfeESaMA==
X-Received: by 2002:a05:6a00:92a3:b0:736:4abf:2961 with SMTP id d2e1a72fcca58-737223e8ef3mr4206808b3a.17.1741992426214;
        Fri, 14 Mar 2025 15:47:06 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737115511cfsm3390784b3a.45.2025.03.14.15.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 15:47:05 -0700 (PDT)
Message-ID: <293dbe3950a782b8eb3b87b71d7a967e120191fd.camel@gmail.com>
Subject: Re: [PATCH bpf-next 01/11] bpf: Move insn if/else into
 do_check_insn()
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
Date: Fri, 14 Mar 2025 15:47:00 -0700
In-Reply-To: <20250313172127.1098195-2-luis.gerhorst@fau.de>
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
	 <20250313172127.1098195-2-luis.gerhorst@fau.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_224709_635656_DE385B38 
X-CRM114-Status: GOOD (  14.65  )
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

On Thu, 2025-03-13 at 18:21 +0100, Luis Gerhorst wrote:
> This is required to catch the errors later and fall back to a nospec if
> on a speculative path.
>=20
> Move code into do_check_insn(), replace
> * "continue" with "return INSN_IDX_MODIFIED"
> * "goto process_bpf_exit" with "return PROCESS_BPF_EXIT"
> * "do_print_state =3D " with "*do_print_state =3D "
>=20
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

This refactoring is a long overdue, thank you!
A few nits below.

[...]

> +		err =3D do_check_insn(env, insn, pop_log, &do_print_state, regs, state=
,
> +				    &prev_insn_idx);

- `regs` remains declared in do_check(), while nothing prevents
  pushing its declaration to do_check_insn().
- `state` is `env->cur_state`, so I'd avoid passing it as a parameter
  (just to reduce count);
- `prev_insn_idx` is unused by `do_check_insn`;
- `pop_log` is not used by `do_check_insn`;
- given that `insn` is presumed to correspond to `env->insn_idx` in
  many places down the stack not sure about this parameter.

> +		if (err < 0) {
> +			return err;
> +		} else if (err =3D=3D INSN_IDX_MODIFIED) {

Also, I'd get rid of `INSN_IDX_MODIFIED` and move `env->insn_idx++`
into `do_check_insn()`. This would save a few mental cycles when
looking at the code with full patch-set applied:

		} else if (err =3D=3D INSN_IDX_MODIFIED) {
			continue;
		} else if (err =3D=3D PROCESS_BPF_EXIT) {
			goto process_bpf_exit;
		}
		WARN_ON_ONCE(err);

		if (state->speculative && cur_aux(env)->nospec_result) {
			... bunch of actions ...
		}

		env->insn_idx++;

One needs to stop for a moment and think why "bunch of actions" is
performed for regular index increment, but not for INSN_IDX_MODIFIED.

> +			continue;
> +		} else if (err =3D=3D PROCESS_BPF_EXIT) {

[...]


