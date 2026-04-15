Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643AEF428C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 19:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eD9Gm900Z5a9PUDrOmqopWeHYJogEu8ArE7AzIHmAAE=; b=Z4U0w9g0EQJe9HDhA5haITZHND
	TTrMS1MvBExTomBp/erohHcs4/vhgmIgyIX4+7kH4ESqE+pCcVdztEVzObOpmFj1z0fve3nmZsX3p
	+ME4WBybBMnYiBnTXD3L+8JC67mCLxccMjuADh3SeWyEQ7pmW4wVmI3fDsHnkdE8s3omzmRGp2z6P
	KSAvvboXZUS+86p8PvYFH+IC3exthBrJoc62V4esIfps7semxdqJ1szBP5m8RLeyXv65KipoMvlVp
	oycbY/tz56qnKJoi0nVCvf7PMSsdCvzlwtAnl/FCnPkbX21Z2OcAKUny9d3VVPTm2LXVo1DbtH7Y6
	T/JXdTYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD5p6-00000001XeP-1mYJ;
	Wed, 15 Apr 2026 19:22:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD5p4-00000001Xe5-1PbL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 19:22:51 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488a29e6110so76625115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 12:22:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776280967; cv=none;
        d=google.com; s=arc-20240605;
        b=hCq2lj9NdRLRlkY6aR/b2Tv8+AmxVFr35ehJ5pNukCy41cKzBHcw02TORJGqRzT+wC
         I5Uuf9SUrBpiZae/5HtoRSD8ZhkVNOWryZqe7miuvrCHk4JNk5rgdzkTrWCk7BXnNgKZ
         /RCHSuRvqyF2N5MvaMP2STpHD6LsmgTS7rtE9WBG22gyiD7no0M/anoWfOAXNYuuxBCr
         mNcfCx8PVBspslhEGaylJQbZVYTb3lIT2hv60e5HeWprLZ/Ygk/RXFhwrhfByvIPf21k
         XSQ3LrjHuownXR9ny1WvXvhhqIiUGe8UJvFZKjoYU+PAnZySkY5PMsl9oC7S+dnePJxf
         QQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eD9Gm900Z5a9PUDrOmqopWeHYJogEu8ArE7AzIHmAAE=;
        fh=yt20II+SWpdEIL1DryP4TWnOe5b5elFeg80ANG7Mzks=;
        b=NnVQL0J5Ucb9PvfZJK1052NznGXSZmdOhPlAzI8YODSCmLXp8s+7QMjL0g7wCbK2ON
         sdVYoOybVqj4CYo2mRYKdfYck6gXpJKLHfXqlPhgWFiOcrZ8B5q2fBO7DmJnxrcDUm45
         uE6fp+6HvS4tZ8D4RhiOpKJjQPdjemBSVsLjjuBnUult5PU7N/yB7GIGKIV51LBWj7X+
         JeXM4ugkFK9y8j4id+tPEHBOeXWHEVBS9ROvQV1ADtywyYol9uYbi719kZupjoctJrOV
         aT8zDg+IM06XaHU5TqvblieRg68bKSF7Jym3Tr3lRMAyHDLAb5pxYHgSF21slJPjJ/2y
         RO6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776280967; x=1776885767; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eD9Gm900Z5a9PUDrOmqopWeHYJogEu8ArE7AzIHmAAE=;
        b=J+rVZ0zv8QCngGssyibiFe5yXydNle5a6XcycH700GH5TN5Egml3Nb9mGT5jKTrJnc
         Z3fdqPjKRw4NhAsrWL4LyJw53kbmcH55T4KoGHyrQLn2EsIAURJ253JBsg/KTZdm225N
         Zt/9xn4qjf1p5/SEUPh/WGypOnUC8Jc1LrrANIK2/vzQKiKTUkO4MFRZErhXgmFNP9+u
         FI7mQxUT4kBLDWWb2O/X6J1UaDSZdleNeDQvXodI4q8QKRzZ5hLCH3w0P6P7umvrYsLB
         Mj1rK5dj2ESfD+ZXpCyyZjOFv9c6I8DQC2OPN7x7yq1fbij7NqOZvNze2r6TG1Magsbz
         l1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776280967; x=1776885767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eD9Gm900Z5a9PUDrOmqopWeHYJogEu8ArE7AzIHmAAE=;
        b=f4/w9vmxARYYV+oLv4r77PD/maCZ15VJJNLHdz4KIIFDYD100ptpC5DLXRZT+EBQJu
         9ggZ+X8kM2Iac7IejkV3I2ZaJFn5MOdMVP1egYgU6xPRPnvc67bXRP3r8Non2btISYCS
         G184GyYhnmu9JR+j9GnFq16qhiQ18eUxCRNl+cCTYBizDoMlyQ9nzB30Gy5ipxU/y4Op
         NXkbomNSd6uXrtjOixhlxUZEAp+G98ns00XRr+wEmQQETpdFVwDMjWhVZCxcVU3hqSeL
         gpKz5Bz8d1ngQDvKsbJmOSRwcEJdOFab0O9cnAN0/9eVK18GjbHUsvM9nePByIwVXBGH
         Wv8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/rTuuwNsNtZH1LAQ4q+N9ZjuObbu/4sAvBxuOzCRPwm4K6DwVucgjHuWpJAuBw0X/iwCylZwn9IuhqL+SFXhXR@lists.infradead.org
X-Gm-Message-State: AOJu0YxRJBwgGR34GhzqiwT3Y5niWGQJ9TQGTYlRmXKXlcuXDt0CSb43
	zClZs2wg+VSzA46uHxdKDugaPOvX/B+q6XLaMIj59BnqIx1P88+v5U20mgCpU9vAyGEORNp8VxV
	tJ3dIeyLUOC2jIjc3ZOe4bMEcHE86wnM=
X-Gm-Gg: AeBDietLVAwgHqR+xSTzzTncGwpYVWqjZOxA59b8ZqMyiVRm9HUAhsvMBLhiz6qLSvs
	kmLeWoRB7KY91xJMKVtaSQcIWjOakFJFOYTHGwI8CnKTrzePu0F3UoL7Yt6rnJPCaGcUCAojcqw
	kVN5mLRd5zxkmP+e+pTyj5WEy5ogjFpQQsOO/5HeBqAw09iVMmETL9sq+pR84bDFT2RQP1Zsr4N
	FnjWPAniCjK2kM6bPX4e/IuuOkU3ze7dCVYiGKwzGbpjf/HgJWyJ/U6CNj7Y4AVqmZUb+zRKAyY
	kDcupKQaC8s/+VE7HazKr4slnwSQmyEbE8RhlF7ENPqMiBVtALym7/KH11NQCkS3EbiPw7F597Z
	/5d5+EyuL4fRy1KdypFZEteLCK7eM3HeGEpeq
X-Received: by 2002:a05:600c:35c7:b0:483:64b4:79da with SMTP id
 5b1f17b1804b1-488d68b27d6mr348751095e9.26.1776280967394; Wed, 15 Apr 2026
 12:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776062885.git.xukuohai@hotmail.com>
In-Reply-To: <cover.1776062885.git.xukuohai@hotmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 15 Apr 2026 12:22:35 -0700
X-Gm-Features: AQROBzBljds-87hBFkRrWzupkoEriKaz8fyEyiiLRxFEYFG8-E2Vo_k1EhMb2k4
Message-ID: <CAADnVQ+ZZyhrMXYJeZ+HK=L8AWELmbRUOdtvtqPMokgAzFaXhg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v14 0/5] emit ENDBR/BTI instructions for indirect
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Puranjay Mohan <puranjay@kernel.org>, Anton Protopopov <a.s.protopopov@gmail.com>, 
	=?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
	Shahab Vahedi <list+bpf@vahedi.org>, Russell King <linux@armlinux.org.uk>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Hengqi Chen <hengqi.chen@gmail.com>, 
	Johan Almbladh <johan.almbladh@anyfinetworks.com>, Paul Burton <paulburton@kernel.org>, 
	Hari Bathini <hbathini@linux.ibm.com>, Christophe Leroy <chleroy@kernel.org>, 
	Naveen N Rao <naveen@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	"David S . Miller" <davem@davemloft.net>, Wang YanQing <udknight@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_122250_411421_E66065B9 
X-CRM114-Status: GOOD (  15.42  )
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

On Mon, Apr 13, 2026 at 6:06=E2=80=AFAM Xu Kuohai <xukuohai@huaweicloud.com=
> wrote:
>
> From: Xu Kuohai <xukuohai@hotmail.com>
>
> On architectures with CFI protection enabled that require landing pad
> instructions at indirect jump targets, such as x86 with CET/IBT enabled
> and arm64 with BTI enabled, kernel panics when an indirect jump lands on
> a target without landing pad. Therefore, the JIT must emit landing pad
> instructions for indirect jump targets.
>
> The verifier already recognizes which instructions are indirect jump
> targets during the verification phase. So we can store this information
> in env->insn_aux_data and pass it to the JIT as new parameter, allowing
> the JIT to consult env->insn_aux_data to determine which instructions are
> indirect jump targets.
>
> During JIT, constants blinding is performed. It rewrites the private copy
> of instructions for the JITed program, but it does not adjust the global
> env->insn_aux_data array. As a result, after constants blinding, the
> instruction indexes used by JIT may no longer match the indexes in
> env->insn_aux_data, so the JIT can not use env->insn_aux_data directly.
>
> To avoid this mismatch, and given that all existing arch-specific JITs
> already implement constants blinding with largely duplicated code, move
> constants blinding from JIT to generic code.
>
> v14:
> - Rebase

Pls do one more rebase and target bpf tree.

