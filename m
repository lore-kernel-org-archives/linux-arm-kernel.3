Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1000C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 11:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYvMqJdwYubzFDFVJAL7hX20DSHoMM9fh1Q1U5LvBKo=; b=A8c6/YtXZnE54tGTqLIMqjfYkE
	2RVDCyiLUG8tqB84R7EsUsvIW8aVADFFymoSwSCAO62DJEYey4qL2oYvb8CD/lnAFTzWTkQ0hfp2I
	PlMZsTQwt9GcB+6sn204WI330FKstYCCwWX0+QH35Kz634SL/N37/JNqB7Sud5p9w3NpLBvJcxdf1
	tppe4e50Ov8zIZDXJ5LSbxp06NI9dLhbJH4vmU6Fs0z1cW0EqwXs3reKsyS0VG3LwvZx4+fZOS5Et
	hU6/OBqkMq0TyYb2Ihb0xCw/6dX6Y6+m4b7+pT4Tln847UTFaN5OYrc/94bS3AsYaGXc7s7rylV6b
	IMfKBdJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vit2V-00000006z92-02bT;
	Thu, 22 Jan 2026 11:39:51 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vit2S-00000006z8g-3rS3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 11:39:50 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-385bd47d64fso266681fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 03:39:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769081986; cv=none;
        d=google.com; s=arc-20240605;
        b=VDt2yYoCT4oR6/uBqS9CaGwrGBqB5Cp3+jlMACDinN94uxTVML05Ax+AHmLx4Jo4Om
         RY1lHY51F2PnCtOXi1qbxT3EUjUxDwUBMaUnOKzkxqTQSON4muYffRYxQc6tC6xk2S6q
         CIzb4YQ7ol0wUv/r8JPUTUS8FDon76uq+ZQgjQN64CIjp+1qqrRME3TeqeIJepiqs6N6
         bqcUIAc8Yvs1UkxQQZE8U3dPNk4hsI00ZWRf4w4PBkks5vqk9tCmzX2TNuMpMGwfeNkO
         Ytf1Zs0fNsFabd08ayWwyVvWQPIMiczqe5KSK/ClfNUABGoBrB2CzNfOJCghZ5LZMPIZ
         u6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cYvMqJdwYubzFDFVJAL7hX20DSHoMM9fh1Q1U5LvBKo=;
        fh=97XgjeYEg/ZcfiIBPjUmITpKPBBmDimVVRqmxE+4Xjk=;
        b=Q2zFU/WAdo8YnZJ5WyJV5zbpTyTydjPUNMK/l+the9bOCFqBdVP6ynzD+9Ce5USpyn
         CvgRSuG4Z9c6T7EZYeFzTG3poLvSU8J9aaOCaRGmwFLomxWL8S0IBrLfu+gT/eT5QsbR
         D5udUZc05Y7m45ZTFhH+J03FbdHDKavkP1NiuSVRUNnMAKRbTBgJlXQ+av4/rJhcbGIW
         gnmo0aDFSEzEWqnWAyhQnhr+IYRlgFCnmlKNGs0upqznLzRXMGJKez+8FZMJLtglvm75
         QgOnPwdqaX8A9zWOHGBtc9zw30y8MTnNWc9/qttuge34/Di99sQPC/3mTPIj+uAOciS6
         MaCw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769081986; x=1769686786; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYvMqJdwYubzFDFVJAL7hX20DSHoMM9fh1Q1U5LvBKo=;
        b=eRwHEwBG1MIc02Lt9VZhh7A5gFKWkH9e0FLmXu9nXCbPn33xDCrHmomxoNFlPKo1mw
         oUyGIKfgPQQp7+pXOow6gmCsiSiFIauWvDLp/Rq+RmR88DNbrisaVBEMSNzsBrpTBh8d
         +VHdPkgpl6+vf8VlzuaQOIsHh5hWb5YaWbjsf/TSM2F81PF5JDQVRAo/krn82C3JiLjK
         ICEPkmtiT4OquRf6ZffUvk+9qA3E25SkjdJqbbePppctrwf0dOq9HTnDNeoeLefjzvcQ
         yITM3Wx8WhOEJXq/Wlf82yaSoXxTu6Cu7pKF3n/9666dUB3B7JIzvmZ5h5nhGb4tbZz4
         YcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769081986; x=1769686786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cYvMqJdwYubzFDFVJAL7hX20DSHoMM9fh1Q1U5LvBKo=;
        b=xEMfEKftCNER0SWDbE2yBwWWwfT20BUYGz9+vJ8WdOIRXUZ6nAetnsiU4zTS5oqlo/
         LD8ZjOnUOI5lbmSVeRoJomT2yko/8qH2Wyr5gy9a5RUGwIGJURAqRWUnzqal4X5fu4bE
         xRwAgTa0Ya9Uzz1AWEVGBvJIBiIRLKIOvO6fPWvo+DutfvCAKSQd30a1QvChR78nBk3I
         cgdWeASB+qGsIgcussGVa4zIS5DaakssFfO8JhyIYkOUDo8cZlkHLezmwv9jCQ/hlSWx
         CvpA+e4w0QpybJa+p14tPIi9kq5LtGsI6dGUJRsZ4NA3XnAzAfkaa7YTr9rUNijKKk7K
         SOTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3jmImWLHgCk59h+DoQvs04GaCkMYWm+7B28ngdwnT6d4qQwrAohelM+FGbajWOJh7tL2uc+I8mTupRgHvYyfM@lists.infradead.org
X-Gm-Message-State: AOJu0YysZhC+VFJDF6BXcyUDyoa8/9N4FkwQIZLP+av13U1MSWFfAuCU
	8nJeg71z0KljWFguNGUAdLpEHe289kjYBuDxCoCjig9XRMJVXmdAp4yZiVH+jJ0m+am2BdpuXLj
	ohcr7ERd4PSduGveY3l6bz0LYC67yBKw=
X-Gm-Gg: AZuq6aIojG6+m3bHeT/VpTza0KDKJwq2XqVTqXO2p/qW6NQByj+BoM8Shx6X0U2E5/S
	hvnnG0ELW7Q+NLhtTNeMK5NiFSeaLd/dAmMfSaY+gWt+BywXbdM67aISdYfPEHrlWMAPTdOQwAQ
	2DcZXZ8krwjWhjdINAQI8i61Pf9+2Su9oayh6tqBsYBnGEiiih7Ez/wtlrFgCuazggedG3Y7ev7
	gP/h2rBAswO+DBNPuAUk+ywdbCZrtbeaHrJDmYs4O7iQKynibTOZH95dyoS5OYkfMXHNlMw
X-Received: by 2002:a05:651c:1a0f:b0:37b:be38:76ab with SMTP id
 38308e7fff4ca-385c57483b8mr3950621fa.8.1769081985890; Thu, 22 Jan 2026
 03:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20260120060619.469565-1-zhaoyang.huang@unisoc.com> <aXH8ppr2bdc-lWUH@willie-the-truck>
In-Reply-To: <aXH8ppr2bdc-lWUH@willie-the-truck>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Thu, 22 Jan 2026 19:39:34 +0800
X-Gm-Features: AZwV_QjHDZT5UWLi-P23fEuZX0XjKdRUVsu37aJxuLa8nJxz7n9BwNRpicO5i5s
Message-ID: <CAGWkznFBLDr44tTCME1RVNTZ9SLDZA+By0eoTQ+-HrfnTBAoqw@mail.gmail.com>
Subject: Re: [RESEND PATCH] arch: arm64: set __nocfi on swsusp_arch_resume
To: Will Deacon <will@kernel.org>
Cc: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, steve.kang@unisoc.com, jeson.gao@unisoc.com, 
	xuewen.yan@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_033949_026683_A0FB15EB 
X-CRM114-Status: GOOD (  25.55  )
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

On Thu, Jan 22, 2026 at 6:32=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Jan 20, 2026 at 02:06:19PM +0800, zhaoyang.huang wrote:
> > From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> >
> > A DABT is reported[1] on an android based system when resume from hiber=
ate,
> > which is root caused as CFI will plant stub code[2] to verify the
> > swsusp_arch_suspend_exit's authentication, where the hash value is stor=
ed
> > before the page that alloced by create_safe_exec_page. We also have
> > tried to copy the hash value together with the function but get failed =
since
> > the value is not on the desired position(src_start - 4). So we solve
> > this issue by setting __nocfi on swsusp_arch_resume and it works.
> >
> > [1]
> > [   22.991934][    T1] Unable to handle kernel paging request at virtua=
l address 0000000109170ffc
> > [   22.991934][    T1] Mem abort info:
> > [   22.991934][    T1]   ESR =3D 0x0000000096000007
> > [   22.991934][    T1]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > [   22.991934][    T1]   SET =3D 0, FnV =3D 0
> > [   22.991934][    T1]   EA =3D 0, S1PTW =3D 0
> > [   22.991934][    T1]   FSC =3D 0x07: level 3 translation fault
> > [   22.991934][    T1] Data abort info:
> > [   22.991934][    T1]   ISV =3D 0, ISS =3D 0x00000007, ISS2 =3D 0x0000=
0000
> > [   22.991934][    T1]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D =
0
> > [   22.991934][    T1]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =
=3D 0
> > [   22.991934][    T1] [0000000109170ffc] user address but active_mm is=
 swapper
> > [   22.991934][    T1] Internal error: Oops: 0000000096000007 [#1] PREE=
MPT SMP
> > [   22.991934][    T1] Dumping ftrace buffer:
> > [   22.991934][    T1]    (ftrace buffer empty)
> > [   22.991934][    T1] Modules linked in:
> > [   22.991934][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.6.98=
-android15-8-g0b1d2aee7fc3-dirty-4k #1 688c7060a825a3ac418fe53881730b355915=
a419
> > [   22.991934][    T1] Hardware name: Unisoc UMS9360-base Board (DT)
> > [   22.991934][    T1] pstate: 804000c5 (Nzcv daIF +PAN -UAO -TCO -DIT =
-SSBS BTYPE=3D--)
> > [   22.991934][    T1] pc : swsusp_arch_resume+0x2ac/0x344
> > [   22.991934][    T1] lr : swsusp_arch_resume+0x294/0x344
> > [   22.991934][    T1] sp : ffffffc08006b960
> > [   22.991934][    T1] x29: ffffffc08006b9c0 x28: 0000000000000000 x27:=
 0000000000000000
> > [   22.991934][    T1] x26: 0000000000000000 x25: 0000000000000000 x24:=
 0000000000000820
> > [   22.991934][    T1] x23: ffffffd0817e3000 x22: ffffffd0817e3000 x21:=
 0000000000000000
> > [   22.991934][    T1] x20: ffffff8089171000 x19: ffffffd08252c8c8 x18:=
 ffffffc080061058
> > [   22.991934][    T1] x17: 00000000529c6ef0 x16: 00000000529c6ef0 x15:=
 0000000000000004
> > [   22.991934][    T1] x14: ffffff8178c88000 x13: 0000000000000006 x12:=
 0000000000000000
> > [   22.991934][    T1] x11: 0000000000000015 x10: 0000000000000001 x9 :=
 ffffffd082533000
> > [   22.991934][    T1] x8 : 0000000109171000 x7 : 205b5d3433393139 x6 :=
 392e32322020205b
> > [   22.991934][    T1] x5 : 000000010916f000 x4 : 000000008164b000 x3 :=
 ffffff808a4e0530
> > [   22.991934][    T1] x2 : ffffffd08058e784 x1 : 0000000082326000 x0 :=
 000000010a283000
> > [   22.991934][    T1] Call trace:
> > [   22.991934][    T1]  swsusp_arch_resume+0x2ac/0x344
> > [   22.991934][    T1]  hibernation_restore+0x158/0x18c
> > [   22.991934][    T1]  load_image_and_restore+0xb0/0xec
> > [   22.991934][    T1]  software_resume+0xf4/0x19c
> > [   22.991934][    T1]  software_resume_initcall+0x34/0x78
> > [   22.991934][    T1]  do_one_initcall+0xe8/0x370
> > [   22.991934][    T1]  do_initcall_level+0xc8/0x19c
> > [   22.991934][    T1]  do_initcalls+0x70/0xc0
> > [   22.991934][    T1]  do_basic_setup+0x1c/0x28
> > [   22.991934][    T1]  kernel_init_freeable+0xe0/0x148
> > [   22.991934][    T1]  kernel_init+0x20/0x1a8
> > [   22.991934][    T1]  ret_from_fork+0x10/0x20
> > [   22.991934][    T1] Code: a9400a61 f94013e0 f9438923 f9400a64 (b85fc=
110)
> >
> > [2]
> > 0xffffffd08064a878 <swsusp_arch_resume+596>:  mov     x0, x24
> > 0xffffffd08064a87c <swsusp_arch_resume+600>:  mov     x1, x20
> > 0xffffffd08064a880 <swsusp_arch_resume+604>:  mov     x2, x21
> > 0xffffffd08064a884 <swsusp_arch_resume+608>:  mov     x3, x22
> > 0xffffffd08064a888 <swsusp_arch_resume+612>:  mov     x4, x23
> > 0xffffffd08064a88c <swsusp_arch_resume+616>:  ldur    w16, [x25, #-4]
> > 0xffffffd08064a890 <swsusp_arch_resume+620>:  movk    w17, #0x5d7b
> > 0xffffffd08064a894 <swsusp_arch_resume+624>:  movk    w17, #0xb6ad, lsl=
 #16
> > 0xffffffd08064a898 <swsusp_arch_resume+628>:  cmp     w16, w17
> > 0xffffffd08064a89c <swsusp_arch_resume+632>:  b.eq    0xffffffd08064a8a=
4 <swsusp_arch_resume+640>  // b.none
> > 0xffffffd08064a8a0 <swsusp_arch_resume+636>:  brk     #0x8239
> > 0xffffffd08064a8a4 <swsusp_arch_resume+640>:  blr     x25
> >
> > co_developed-by: Jeson Gao <jeson.gao@unisoc.com>
>
> This should be "Co-developed-by:" and you will also need Jeson's
> Signed-off-by line in addition to your own.
ok
>
> > Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> > ---
> >  arch/arm64/kernel/hibernate.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernat=
e.c
> > index 18749e9a6c2d..9717568518ba 100644
> > --- a/arch/arm64/kernel/hibernate.c
> > +++ b/arch/arm64/kernel/hibernate.c
> > @@ -402,7 +402,7 @@ int swsusp_arch_suspend(void)
> >   * Memory allocated by get_safe_page() will be dealt with by the hiber=
nate code,
> >   * we don't need to free it here.
> >   */
> > -int swsusp_arch_resume(void)
> > +int __nocfi swsusp_arch_resume(void)
> >  {
> >       int rc;
> >       void *zero_page;
>
> Why does is the '__nocfi' annotation here rather than on the
> 'hibernate_exit' pointer?
Our first try is to have the callee function(swsusp_arch_suspend_exit)
waived by set __nocfi but failed. It seems like the CFI watched the
caller of function pointer and plant stub code.
>
> Will

