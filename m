Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7976BC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YnrIcak9MnTuq1PIcIeffGKhfewNQREoFw5G3CgkVE=; b=MAbbMpyzMzbNn5
	nvGcTfLvaqnG3IRrWubIMUnPO1nns2DJSzpaoEQUSHdpj/Z0wK4vrXazXe6Ir74cnOxLDnjpkcmE0
	ePVLuVnijVsGFcxMZgaWwoiQnspgs/uBxVpoioGgZ8IKRor0+orC7uNtLFq7mVR1Rs3Hnb4O9gZkC
	6yKDENvpPNgMPM3Z3/QwYJDAEbVt/kxY4d+Ld/Q/DPL5V3Pt0aeCbkbLGb9/cBLW87D8VWISCK9y7
	DloVG7LU1U12xebU86dyJUj0k2xxv6h8TUDxDvDAN7QpCO9bmWOAhaotgdatJ72BDPkvPyXXuzvYa
	jZTcQC5AUlwMcVTEomdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm64t-00000008ri5-2ILm;
	Tue, 21 Jul 2026 08:43:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm64s-00000008rhq-1sZr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:43:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B2CB560AA1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9821F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784623429;
	bh=4YnrIcak9MnTuq1PIcIeffGKhfewNQREoFw5G3CgkVE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=USYURl6kL/GvGuhsLkNzCmOf95k2kPvCE25wF4wem7mnhFXq0MaGrMDyEm6Rm3Oi+
	 i9TjOtrHE8C+3wH6xrI9W0YKGB6RvSS8rh2RT7MckLPo0EFXa1dcZg1Vg5UCbXOZTr
	 8dH4AbH22PxpiMF6VP+IGlGaauP5R3Vi+lTwEYUy2Cy6NTXtvdf6KkEpUmcsgnEB9T
	 Na20C2XIockmKxlojg/uI8BDY9W5LZBqfXw+x/mq6r7pigTIaarkpTHf64/ExxD9GH
	 pXWax0LzEdpuNJUPujmg1wV1QPRmyA59ptfETIuy2YUv4AKtT9aP8UtCGsOQ0ebl43
	 eC9LMg4wEyz8A==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso9519337e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 01:43:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrAAAeXYx0+Y9tU2yAGCPzw3Rc6uOPctlYGJehT9IIrcnXOAWjHdudEp8vPH74ohp0WRHM5PyDMySV/raR+R3OG@lists.infradead.org
X-Gm-Message-State: AOJu0YyeZluMMOYrV6n1b4XPYItJ5kPNV4ru2pxapTGSOJD/hnzX4/ia
	BuFdWTow3IHrlZPZZuh1d3f1YGv+YYUOGJzqitrb2u/s/TbFKT1eQpzTGMeI0zDGdCQpoufITBx
	wlLg8quWKLI5VI5x3Pl3PvyyA3oygjp4=
X-Received: by 2002:a05:6512:124f:b0:5b0:f9d:f7d9 with SMTP id
 2adb3069b0e04-5b28f9a723emr4081425e87.45.1784623428144; Tue, 21 Jul 2026
 01:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260721081858.1169276-1-ruanjinjie@huawei.com> <20260721081858.1169276-7-ruanjinjie@huawei.com>
In-Reply-To: <20260721081858.1169276-7-ruanjinjie@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 21 Jul 2026 10:43:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLmHw3ccWQj-AWvgrj7z6iwPk=MC0-UMaUqLeNpsbxW54g@mail.gmail.com>
X-Gm-Features: AUfX_mwlDg8vIJsXHYz3fmkT6fCMHFLIFkEllyMO4HcnVtqsYTlYVhuDg7LEE1c
Message-ID: <CAD++jLmHw3ccWQj-AWvgrj7z6iwPk=MC0-UMaUqLeNpsbxW54g@mail.gmail.com>
Subject: Re: [PATCH v17 06/15] arm64: syscall: Rework the syscall exit path in el0_svc_common()
To: Jinjie Ruan <ruanjinjie@huawei.com>
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
Cc: mark.rutland@arm.com, kees@kernel.org, catalin.marinas@arm.com, oleg@redhat.com, will@kernel.org, peterz@infradead.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, linux-mm@kvack.org, yeoreum.yun@arm.com, linux-kernel@vger.kernel.org, luto@amacapital.net, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2026 at 10:19=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com=
> wrote:


> In preparation for moving arm64 over to the generic entry,
> invert the nested conditional flags check within el0_svc_common().
>
> No functional changes.
(...)
>         if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
>                 flags =3D read_thread_flags();
> -               if (!has_syscall_work(flags) && !(flags & _TIF_SINGLESTEP=
))
> -                       return;
> +               if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
> +                       syscall_trace_exit(regs);
> +               return;

What about just:

if (...)
  goto trace_exit;

This is easier to follow IMO.

With that:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

