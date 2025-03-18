Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A18C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 20:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfifQjUc0e35cL1wF3reseSTOSxYe3hmLoF6fArzI88=; b=4iAzAa1C6hjbNYHs7NXr/Phb2c
	iuAuzp3g/esODOvOwRDWmxdfSm9oX3O+Sda3rn74MnhBQFkHTWU0mSIA/+Qg3Wuwe1tZ6W8nVMDsT
	buPqf9ETW3ZMULnw9V5rtQkQVH1oBIThBJzdY8XcVcOr6aP5h1nD+wblWIggFg28KKsz3CA89Ci9A
	dZDtJAbIypXPJt1NTdrJc/aCg2uX2P4xTPuynci858KHircGrZBByTOZVCRV91aU90hF61TvQgJBO
	+yD1t7AdloXZvpeNS/sMm9I6957LTcRMDfgf/kwNVmsBuoHJpRPluW4DBxoDp1YUO1s4lVxjRSrFz
	ksNDpuow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tudMc-000000070rV-1oov;
	Tue, 18 Mar 2025 20:16:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tudKv-000000070W2-1zZe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 20:14:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 025EF6157C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 20:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87019C4CEEF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 20:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742328892;
	bh=d/sSThcAJ1FNOkIt4xuEgK6TkWWhj5jMwQxg8sRwZlE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UE6e/o48rc+ViKpLcaVyDCfILBmJtDpz8KCbN7dmodQqOvLotLDM80ntBrgYueOgo
	 0U1Duo5oXb92E2LewBPDzIBfLATasvimDQujs05DxwkbTcjhwiqFJUoQdPE1a7rSUb
	 5Edf/XqKiJHbbh7EblcAR+U/qXynAHeWUJ1OnxjHcTUJaipiOl/u4hijVPI8ucaHU9
	 Q+rkLKmU+LVKrppoCcUqtby2bMvLLdoch3JoFm5WRk1b+0fio+RTBEGJe+TpViGf0c
	 NTuzVJk4S2kT3Y/t1EygJ/Mh6aeUKFs3907OqJ+NMPSGK5Y0cqgGbr7m1knNRtbVrH
	 bco6CQ1rpMjZg==
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3ce886a2d5bso60403055ab.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:14:52 -0700 (PDT)
X-Gm-Message-State: AOJu0YxcDYQ9QYDP5NJNXJMAC89ilm+kpQOhkyCM+J1pcKDlqXP8SW97
	oBAlgsV7jjNZsRLpPV5YECiTiV20qZ27TDyc8usvnSbywEGp3NTg2PL46V3R+9bfkAtMpWeVBB7
	PCYI8D0lRhI5TtRONSrxMpH8ivFI=
X-Google-Smtp-Source: AGHT+IHtAfQRa5ygS0+xhQYljeYFtmhnJ0xVV7lJdlI0Pu/Z5ueR2htXv0YGBlFbTqjgA63bOgGEydLfCjMz7N9NFQw=
X-Received: by 2002:a05:6e02:3312:b0:3d4:6f37:3748 with SMTP id
 e9e14a558f8ab-3d586bbcfcamr1456735ab.16.1742328891937; Tue, 18 Mar 2025
 13:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250308012742.3208215-1-song@kernel.org> <20250308012742.3208215-2-song@kernel.org>
 <iajk7zuxy7fun7f7sv52ydhq7siqub3ec2lmguomdd3fhdw4s2@cwyfihj3gvpn>
In-Reply-To: <iajk7zuxy7fun7f7sv52ydhq7siqub3ec2lmguomdd3fhdw4s2@cwyfihj3gvpn>
From: Song Liu <song@kernel.org>
Date: Tue, 18 Mar 2025 13:14:40 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4A73c0AjpUwSRJ4o-4E6wpA9c5L0xWaxvHkJ3m+BLGVA@mail.gmail.com>
X-Gm-Features: AQ5f1JoxrCAHtT-wypdFb1RI64YEPNsCvi5X7wvvH2VhOFtJbGsL8mOcDVjXOYg
Message-ID: <CAPhsuW4A73c0AjpUwSRJ4o-4E6wpA9c5L0xWaxvHkJ3m+BLGVA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: Implement arch_stack_walk_reliable
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, 
	indu.bhagat@oracle.com, puranjay@kernel.org, wnliu@google.com, 
	irogers@google.com, joe.lawrence@redhat.com, mark.rutland@arm.com, 
	peterz@infradead.org, roman.gushchin@linux.dev, rostedt@goodmis.org, 
	will@kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Josh,

Thanks for the review!

On Tue, Mar 18, 2025 at 11:45=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.or=
g> wrote:
>
> On Fri, Mar 07, 2025 at 05:27:41PM -0800, Song Liu wrote:
> > With proper exception boundary detection, it is possible to implment
> > arch_stack_walk_reliable without sframe.
> >
> > Note that, arch_stack_walk_reliable does not guarantee getting reliable
> > stack in all scenarios. Instead, it can reliably detect when the stack
> > trace is not reliable, which is enough to provide reliable livepatching=
.
> >
> > This version has been inspired by Weinan Liu's patch [1].
> >
> > [1] https://lore.kernel.org/live-patching/20250127213310.2496133-7-wnli=
u@google.com/
> > Signed-off-by: Song Liu <song@kernel.org>
>
> This looks incomplete.  The reliable unwinder needs to be extra
> paranoid.  There are several already-checked-for errors in the unwinder
> that don't actually set the unreliable bit.
>
> There are likely other failure modes it should also be checking for.
> For example I don't see where it confirms that the unwind completed to
> the end of the stack (which is typically at a certain offset).

If I understand the comment correctly, this should be handled by the
meta data type FRAME_META_TYPE_FINAL.

>
> See for example all the error conditions in the x86 version of
> arch_stack_walk_reliable() and in arch/x86/kernel/unwind_frame.c.

I guess I missed this part:

diff --git i/arch/arm64/kernel/stacktrace.c w/arch/arm64/kernel/stacktrace.=
c
index 69d0567a0c38..3bb8e3ea4c4b 100644
--- i/arch/arm64/kernel/stacktrace.c
+++ w/arch/arm64/kernel/stacktrace.c
@@ -268,6 +268,8 @@ kunwind_next(struct kunwind_state *state)
        case KUNWIND_SOURCE_TASK:
        case KUNWIND_SOURCE_REGS_PC:
                err =3D kunwind_next_frame_record(state);
+               if (err && err !=3D -ENOENT)
+                       state->common.unreliable =3D true;
                break;
        default:
                err =3D -EINVAL;


With this part, we should cover all these cases? Did I miss something
else?

Thanks,
Song

