Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F53EF8FF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 15:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24C+fRjnWMRKK1Bz+qiw7F1sD6b+3uq1M/s7sYLnKLk=; b=nARdDB61ODXLQwmyjCo/6O3QNa
	u1J0S3kOfGukgtzIcKZ4I4qx+fvvL//R+31DwoJ/QwKAEoe7vHxed2rLo2mXA/gmMZueKs1+A+/NV
	MXdtwycbyHCIECusn5QvQIczFsTF+o7WJwbYReAtLWVnqWh7Q92LZVKWWTkW1xGpLMrJ3wm6vJNBr
	SkBgtKAaSRs9Wow8wD+7htANfjBNfL8e6ESn7GRnkyUE38ybwysIhIst1rWpmyitwzw8Y3t+U5Utt
	oaccHUVi++wgQqtv47UfS5vYfK4wWNEqFokpD+K6O1wtWhi+J3uP3IDRSNkjBTKGPTY2+ClkTTL/q
	6G/z2OsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxoIA-0000000HaTe-2d6o;
	Wed, 04 Mar 2026 15:37:42 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxoI8-0000000HaTD-0eql
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 15:37:41 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-439b7a87fb5so2190699f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 07:37:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772638658; cv=none;
        d=google.com; s=arc-20240605;
        b=eFckf0SlEJPO/9Y9rILtfI676gKgSnT8wbm5huiCDSJYzRGAxwNBeh53A/fg/d9EkX
         ElDm3dc1vyYY1MFnbDGoTe6UVeN8F+XSPRvaegi4DwNx/3xkNDH9L2ltMEN2aBXXP9Du
         NQpJdV925/xn4worPSP9XjDQ0yHSMLu8ovhtwmwM+kRlErkoCgMoshyjYONZmeU+p6xs
         9d4tlb4qgBLCWxo5A6h6Qicq1V2KXlVUeqU7gpkW42usV4Q/GUrb8bjM1usr+LoID9Ez
         NwWPVBzWsNCr22wHZsL/mYaT5Sm7osMdG3qWuM2tGaxkz9XE+WQMfTDX+/ZzSH3OtzND
         q1Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=24C+fRjnWMRKK1Bz+qiw7F1sD6b+3uq1M/s7sYLnKLk=;
        fh=GCFKKJsRjvPK7j7ea4pTPxsBX49C91kzYBZ4lW1wjcI=;
        b=WBBDOswlHIj+MmEcI5B2gBuIVauS9/BLWOjGLG42B+rv44/3n1HdZbuYKUsCOxW+AE
         Ba94VraB1ZH7H8x+R/iasAhCWdD1dUggj71qNmuQCweNEcfVMZzi3NuNJlmmXoKK6TkK
         RHkDbmt5M7Waoy+sFb3as9ibfiywuWsSx0b0qXjEkN1CvfqujpamlQ8qJoWClkKEAW9q
         9XDSbXk09YeMMYG5HOhOoMvp32pisI5pgeII78NLZdF7vaT7KF4RjaIvvTGj3soiLtbY
         XUl93TQPf7cb6lTA2rKTa3LM0WcsU7TPWvK4je1WogxK5BrUTP+Ody9wlq8joYVmnLy5
         d7CA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772638658; x=1773243458; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24C+fRjnWMRKK1Bz+qiw7F1sD6b+3uq1M/s7sYLnKLk=;
        b=LlU9vCohBHp/edlG67ZsAqoCNhIcjSgAlEq1wip4pQaudHUbKyC8DK2M1KWcqGYpdZ
         6RKXNOGQFwAM+wh8MocR7Cv2OeNbybUTdAuwkhndmoXp7pXvL3cstltse29NEVNmZS0M
         ths1bB7zjZ7/Q58BHhlKD7YaBJd1yZu5/hcir1zmqxwQ44Pe33dldPY+d//EQ0GuC8AY
         NuZA0wedgnzwoYpOnQmmNeMBmD83GTIekNkamlcFw7BWU5rK4mnWLury7Uo4A79gYG1u
         4qS3BLbY561m1t7HlNJdqVLa0L4A72TiruoDKVmJphVCeXibWfp/+rn4vsV3509qeAjs
         1ZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772638658; x=1773243458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=24C+fRjnWMRKK1Bz+qiw7F1sD6b+3uq1M/s7sYLnKLk=;
        b=gXQuI50o9ECMBkKiInxLyZjWsdEktY8w7wjjyhKCUe3RXQj7rc/wEJYF/JpJkP6nzD
         hiFmR6B5zmc3wuQ10cevG7D/S5MjTKNVql8gTc6bMMKLYLCmWjKjDIjyBUVEhsGWsfZg
         jxPm18bQOgSPrP8Xy23C5Tsz09SS8biecSO/r03OqV6C4dDhcpuL1998Qyjb2Un+Tdu8
         wrQ1Tflhe1uAmV6GYoy/MzuV43sCwQm1xXR25fxULicxtLBvnRb8o1hIk1zuy4j/GBNR
         KkgPwEGObfk2dquygltszrJ05wxv5io2Qm04Lbh3wHEWHP4+FEz3nblyjKe5BB35JMnc
         82PA==
X-Forwarded-Encrypted: i=1; AJvYcCVb6jpTn86lIhLNwV/voOmx4T5qHD37J1ewR4AY1njt0vE3/xOEWlewsrdJAs/KLKWbyzY1DtVloyYFZ8vh18OP@lists.infradead.org
X-Gm-Message-State: AOJu0Yylq5/P/wd4ycBDGoTNuEMPJ9VYCSpg2aCauNWd9F3SkYbk9ga2
	AzEK7QtRNSExQ50RUsxhUMvjRIR5LxncbvWrekYyxyPck5a3/fK+KsEk39zuVd4I3x3GUfRufNG
	ZTYfhX7y/mwR9sEHwX4H+fS+1CYRgSUVTH6VA
X-Gm-Gg: ATEYQzwMfzDh0+5nqxMZjWigEYz+3GlFdK8Cfh6Vd9Q3gouqoWthTpORojnUVnyKiuK
	A2qe6mMG9J2DI1/Dc2P75urjNNJfnNluHQxgR4BbcVjUDGP9ruDs45OLfCpmetJGp0w5aTyWCxX
	q/BiITt+Xd/JFhyfBxgly8aniCgcBpL0nG2xyM8DRbBqGqFeGn310ktBXD+6danS/Ba5DSaYykm
	ZcbMOZsW8cCUhVp6/8EFV/WeS5x8NKpSQ1ASpN28Nv1B8ONTedzFd/GyLews3c95R5G6n/TDvam
	NHilEvdJyvj7KFD7NF9x0sZbFAPOnLIzYtBVYkbCRPupun/atXY6BqvlKS445o1w4nkf3MloV+2
	rcrbo9rxid0h+vSByx10DBMOXAg==
X-Received: by 2002:a05:6000:144f:b0:439:bd46:41ec with SMTP id
 ffacd0b85a97d-439c7f64e3amr4552595f8f.2.1772638657979; Wed, 04 Mar 2026
 07:37:37 -0800 (PST)
MIME-Version: 1.0
References: <20260302102726.1126019-1-xukuohai@huaweicloud.com>
 <20260302102726.1126019-4-xukuohai@huaweicloud.com> <CAADnVQLoWzz8ioVg3MFjn08fBLfNq6HdvqLtqXV0zUb=SR_HGA@mail.gmail.com>
 <1ea52c33-ae27-45fb-b4ff-0c4637a4312a@huaweicloud.com>
In-Reply-To: <1ea52c33-ae27-45fb-b4ff-0c4637a4312a@huaweicloud.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 4 Mar 2026 07:37:26 -0800
X-Gm-Features: AaiRm51nYgrFTZDKYO__FZp669W9unlvWI8agTWcFrkv1cu7vf7-zveP0gghP0U
Message-ID: <CAADnVQ+HvsZ0zr6AGLBhMOVX1uRKwRqV28ywcvpVkrsDTyaXmw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 3/5] bpf: Add helper to detect indirect jump targets
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Puranjay Mohan <puranjay@kernel.org>, 
	Anton Protopopov <a.s.protopopov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_073740_235197_41F03551 
X-CRM114-Status: GOOD (  17.01  )
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

On Wed, Mar 4, 2026 at 4:46=E2=80=AFAM Xu Kuohai <xukuohai@huaweicloud.com>=
 wrote:
>
> On 3/4/2026 1:19 AM, Alexei Starovoitov wrote:
>
> [...]
>
> >> -       for (i =3D 0; i < insn_cnt; i++, insn++) {
> >> +       for (i =3D 0, j =3D 0; i < insn_cnt; i++, j++, insn++) {
> >> +               env->insn_aux_data[subprog_start + j].final_idx =3D i;
> >>                  if (bpf_pseudo_func(insn)) {
> >>                          /* ld_imm64 with an address of bpf subprog is=
 not
> >>                           * a user controlled constant. Don't randomiz=
e it,
> >> @@ -1512,6 +1542,8 @@ struct bpf_prog *bpf_jit_blind_constants(struct =
bpf_verifier_env *env, struct bp
> >>                           */
> >>                          insn++;
> >>                          i++;
> >> +                       j++;
> >> +                       env->insn_aux_data[subprog_start + j].final_id=
x =3D i;
> >
> > You're adding final_idx because bpf_jit_blind_constants()
> > doesn't call adjust_insn_aux_data() ?
> >
>
> Yes, I added final_idx because insn_aux is not updated here.
>
> > imo that's an ugly workaround. Just call adjust_insn_aux_data().
> >
>
> If we adjust the env->insn_aux_data here, should we also adjust the globa=
l
> env->prog->insnsi array? I think env->insn_aux_data should remain consist=
ent
> with the global env->prog->insnsi array. Since constant blinding only rew=
rites
> the subprog's private instruction array, updating the env->insn_aux_data
> causes a mismatch with the global state.

yes, and subprog starts, and pokes that bpf_patch_insn_data() do.

blinding was implemented long before that, so it was never updated.

