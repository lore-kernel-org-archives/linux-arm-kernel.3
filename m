Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5A4C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 18:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z13IR4R41ZVDKU1pxRT6lsZi2hufZ9axj9XzCLqdM7o=; b=tMhWB+gkyLz9TRtOjWEJ+r8VFz
	7OpKL4Re+pLRBs+WdLeiJVgEILQ63QsV3bkTbRRhofnYWYi+4bu3VEnBBHciovuE8ERRDKXlY1IeN
	xi2UZkjR4ULDJfnF5QMxzDawc/F5UiSxfRz1oRNCsog4bbQTIwTCdy8GVvvFLSW6M835siz4Ahzz5
	jPVL46fXJ26hcc8G+ioQFW5spcBy9vUJa6NUgSzvJn8YXpmHHI3fQSGtVMOYCmeAocbElU2hxGgXc
	SS+3PWnK098/YxZNVRMi8epg2b4MtnEli4KKUamxSWHjUT4lYV7hOGYc1gpwFRrTtMm65Pc8iAHub
	E1DnXh5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYbf-0000000GMSY-1Djm;
	Thu, 01 May 2025 18:25:59 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYYk-0000000GMEn-3Y0k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 18:23:00 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2260c91576aso11870375ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 11:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746123778; x=1746728578; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z13IR4R41ZVDKU1pxRT6lsZi2hufZ9axj9XzCLqdM7o=;
        b=mr36AVxZWiWZdjLAWKJUOiC8OUY6Q+sFiwWeCJO64UGBxMhmTqnhA3dDiVhevvS3Tc
         RBR3NFXSeTKWg119mvSpPZcEI8I6VD3D6gZP+SNZmrpz3ibJNtWJuBPt4fsNqJrV7/7T
         0+6RHTVq2bFEL9phKJB/F/7gobG+WHjpR1VBAGNo09SY9TF4aGzSxyjXztEF2g55Gxy7
         712Y3y9flknZrBZuJBP3y88YBRw5iS32PYaGD4gFEaaC9j3Q/tBoBwGTD6aYVp1MOAAX
         JJaXyHZBnZiDdSar2Dyf+bjP/uijl2hZs2inXomHdSFaKDOYxX2PSxYCgEKftV7pYFaB
         pJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746123778; x=1746728578;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z13IR4R41ZVDKU1pxRT6lsZi2hufZ9axj9XzCLqdM7o=;
        b=cudo8HpdmJUV/UUX8h+wfYODQ7kN8MppsCdLbj9tPD+WmPBPESx04ix0t36vqXVbfc
         LWd6YLpkZISFd8SNYaX535Z1C+sT2iVTD1brg2+I0Omttz6CKgGiSriMR2JjCCvBJrXw
         tbJEVkkPpB7HPZbRBoGoQcD9XWZRWnFi/Qj62Uw9FvfIFRjtISUjO0dIi40mfoWzQ2HG
         qfeueUiDrXHs+93Y7ZTeU2iuS5auIy6U2eBWVNLCoCTFHR9fP98MwrP5UVGb7XFv2M+T
         xjvOzWjhhMu/jp3I2x3gPf4oZ/E5rXXP9nc4/MHh38GuV4wNboSF4sqZ9S8GuPk1Vx7Z
         FEqg==
X-Forwarded-Encrypted: i=1; AJvYcCW2tp0FdbYVpJjsFMgAS1fP7mh65xlYd/ZBTfxlsfl4DQyt9e4eY1eiyMqEQ4PxOq+AyXKR6jD94PgHmR62rpNw@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfu5SoBfWw/7cgHD7iHh0gjdEMgDCcTAshyNDV3wg0pEaXP9nr
	b3IHe5XS42Ex9c8zxclFuRS3UBV2pNEPciYi1GKH55liC4yBYC3v
X-Gm-Gg: ASbGncukx2b88Jnb4QiR61GFGqUruPZgPzfdAi/PBmfT76w23VWCxv3Qze5ks10kbsB
	l76/mrEZwxlV8Ui3VdOJ+Ciz7UI9ZY/+vNuhJUrYSS4E9aWvAJaJ4vko980UGAigJ0cnkxPwcl2
	JrRgdAf2Y4ZjKB0Wk4QV8DT701Pa/g6RrmFjT5p22mz4aaJy0reIWK5KIpJA5BLlg9yyyPou5A/
	iQs/hPzV59bVgstcTmIVyJ9Mz5KFTVejpZuNiDzl96vlzo7Xf9kgkjXGlGAPz5b5O6//dsuC70k
	R4ovuJKdEvt2WEhoMd834CkWT5gvIH1zWP9m
X-Google-Smtp-Source: AGHT+IGda6qWln6BFDTM/Gkb68xMR5bi/oz/Rn8j/Adql6uM3+Sv7uKX/O5J0YwlaSlwXSdspZWvYQ==
X-Received: by 2002:a17:902:da90:b0:22c:3294:f038 with SMTP id d9443c01a7336-22e1034037emr552815ad.18.1746123777577;
        Thu, 01 May 2025 11:22:57 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0bc7b0aasm9869405ad.169.2025.05.01.11.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 11:22:56 -0700 (PDT)
Message-ID: <15294d369d94cf005c9aa722967e5ddb1fa8cee3.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 02/11] bpf: Move insn if/else into
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
 <henriette.herzog@rub.de>, Saket Kumar Bhaskar <skb99@linux.ibm.com>, 
 Cupertino Miranda <cupertino.miranda@oracle.com>, Jiayuan Chen
 <mrpre@163.com>, Matan Shachnai <m.shachnai@gmail.com>,  Dimitar Kanaliev
 <dimitar.kanaliev@siteground.com>, Shung-Hsi Yu <shung-hsi.yu@suse.com>,
 Daniel Xu <dxu@dxuuu.xyz>, 	bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-kselftest@vger.kernel.org
Cc: Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
Date: Thu, 01 May 2025 11:22:53 -0700
In-Reply-To: <20250501073603.1402960-3-luis.gerhorst@fau.de>
References: <20250501073603.1402960-1-luis.gerhorst@fau.de>
	 <20250501073603.1402960-3-luis.gerhorst@fau.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_112258_884856_AB867463 
X-CRM114-Status: GOOD (  24.23  )
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

On Thu, 2025-05-01 at 09:35 +0200, Luis Gerhorst wrote:
> This is required to catch the errors later and fall back to a nospec if
> on a speculative path.
>=20
> Eliminate the regs variable as it is only used once and insn_idx is not
> modified in-between the definition and usage.
>=20
> Still pass insn simply to match the other check_*() functions. As Eduard
> points out [1], insn is assumed to correspond to env->insn_idx in many
> places (e.g, __check_reg_arg()).
>=20
> Move code into do_check_insn(), replace
> * "continue" with "return 0" after modifying insn_idx
> * "goto process_bpf_exit" with "return PROCESS_BPF_EXIT"
> * "do_print_state =3D " with "*do_print_state =3D "
>=20
> [1] https://lore.kernel.org/all/293dbe3950a782b8eb3b87b71d7a967e120191fd.=
camel@gmail.com/
>=20
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

Except two notes below, I think this patch looks good.
Thank you, this is a good refactoring.

[...]

> +static int do_check_insn(struct bpf_verifier_env *env, struct bpf_insn *=
insn,
> +			 bool *do_print_state)
> +{

[...]

> +	} else if (class =3D=3D BPF_ST) {
> +		enum bpf_reg_type dst_reg_type;
> +
> +		if (BPF_MODE(insn->code) !=3D BPF_MEM ||
> +		    insn->src_reg !=3D BPF_REG_0) {
> +			verbose(env, "BPF_ST uses reserved fields\n");
> +			return -EINVAL;
> +		}
> +		/* check src operand */
> +		err =3D check_reg_arg(env, insn->dst_reg, SRC_OP);
> +		if (err)
> +			return err;
> +
> +		dst_reg_type =3D cur_regs(env)[insn->dst_reg].type;

Implicitly relying on `insn =3D=3D &env->prog->insnsi[env->cur_idx]`
is weird. Still think that `insn` parameter should be dropped and
computed inside this function instead.

> +
> +		/* check that memory (dst_reg + off) is writeable */
> +		err =3D check_mem_access(env, env->insn_idx, insn->dst_reg,
> +				       insn->off, BPF_SIZE(insn->code),
> +				       BPF_WRITE, -1, false, false);
> +		if (err)
> +			return err;
> +
> +		err =3D save_aux_ptr_type(env, dst_reg_type, false);
> +		if (err)
> +			return err;
> +	} else if (class =3D=3D BPF_JMP || class =3D=3D BPF_JMP32) {

[...]

> +		} else if (opcode =3D=3D BPF_EXIT) {
> +			if (BPF_SRC(insn->code) !=3D BPF_K ||
> +			    insn->imm !=3D 0 ||
> +			    insn->src_reg !=3D BPF_REG_0 ||
> +			    insn->dst_reg !=3D BPF_REG_0 ||
> +			    class =3D=3D BPF_JMP32) {
> +				verbose(env, "BPF_EXIT uses reserved fields\n");
> +				return -EINVAL;
> +			}
> +process_bpf_exit_full:

Nit: since we are refactoring I'd extract this as a function instead of got=
o.

> +			/* We must do check_reference_leak here before
> +			 * prepare_func_exit to handle the case when
> +			 * state->curframe > 0, it may be a callback function,
> +			 * for which reference_state must match caller reference
> +			 * state when it exits.
> +			 */
> +			err =3D check_resource_leak(env, exception_exit, !env->cur_state->cur=
frame,
> +						  "BPF_EXIT instruction in main prog");
> +			if (err)
> +				return err;
> +
> +			/* The side effect of the prepare_func_exit which is
> +			 * being skipped is that it frees bpf_func_state.
> +			 * Typically, process_bpf_exit will only be hit with
> +			 * outermost exit. copy_verifier_state in pop_stack will
> +			 * handle freeing of any extra bpf_func_state left over
> +			 * from not processing all nested function exits. We
> +			 * also skip return code checks as they are not needed
> +			 * for exceptional exits.
> +			 */
> +			if (exception_exit)
> +				return PROCESS_BPF_EXIT;
> +
> +			if (env->cur_state->curframe) {
> +				/* exit from nested function */
> +				err =3D prepare_func_exit(env, &env->insn_idx);
> +				if (err)
> +					return err;
> +				*do_print_state =3D true;
> +				return 0;
> +			}
> +
> +			err =3D check_return_code(env, BPF_REG_0, "R0");
> +			if (err)
> +				return err;
> +			return PROCESS_BPF_EXIT;

[...]


