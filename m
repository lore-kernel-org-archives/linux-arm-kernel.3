Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC9BD42BBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 19:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsDwXecVIrAlSTQ6V1mobheD8FZMwXU4s1gVF5Uq0Iw=; b=b6KUFOr9qjd/ZFclvJ5Eax7xdw
	b3kgG0lQLt09PjniyNjQeKQPt75XrnovEbjncOPgPNsgimh7Swg4olmXfs7/ywA0xdX15ZhsyelLn
	8U9KKBxeJoMxr1I8AAdYEx8eD01jtXcnAcmRB+mQlkpY8XWQyppZniIESMz2dGe+D/EQrSeEfF/iH
	bOmMAoFnDAkKamOMIq5V3odb7wP9Fq/S+hN5W7woN9nf3Z8FB2YB9tFmRj6kkYktgEbXMRoKJLSLE
	N5TbHqFNwJiCa4Z+HOf9RXrFLDvhBZv7ojnMij10GePoW7k1UnUyxhXxxqxPdj6h1QsfG4isCemlo
	dmkTC7tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAwG3-00000004fAi-3cxY;
	Tue, 12 Nov 2024 19:08:59 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAwEE-00000004enf-3HSE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 19:07:08 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71e681bc315so52914b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 11:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731438426; x=1732043226; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsDwXecVIrAlSTQ6V1mobheD8FZMwXU4s1gVF5Uq0Iw=;
        b=EAymyHwMGM/xDCfFjYZyHU7EPciCBoAXO76dgcK0iQlZl9FtttN+JeiP9yyV6cm5AW
         U5xJHXmgZ2AhCKYHSx5KJo+W6J+SiDp8oMfgJVOh0alFQ7JqATlZlrQcMicQXUCMoKml
         4ziV87IgR8l7+L/iogwHPzE61vrNUgQyGPi8VBy/bt/EIjGRlp5ZOe/bpAJGqRswK2Ip
         r1Cv4r6DEsQFWvAD2/WQDcn19r3Ssu7UIAHtIfuRPggeQVBcZGHMGZNaBN1FZWNe50z3
         INGIzzivIlO3In7tiLiUngdu4UwAtuP+3Qdo6nHRBeeQ+aUAwBLAKssfpEd01MQHGHxv
         /KMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731438426; x=1732043226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LsDwXecVIrAlSTQ6V1mobheD8FZMwXU4s1gVF5Uq0Iw=;
        b=ocTgr6qtRNi25ca7doPCe+2AiadjMvJZkX5l3frkSseUYKaZmNnhRYlNEjg0vmLLrw
         0EJG43N8wcjrXkS9pRno87nipOzoWEJ4NmiX3AwbUh0JGERRFycK/DuVdC2AWuDViUUB
         fYZ99fdpOCMNfY3tpsVAaMsfHX2f812fGc7KhC0Hjr16c9im+FrZQEMjXFqc6sg2Q1KQ
         rO7/8Umfs0WemP69aRJGOY5FlFg7tUHFFqge1zd15DzhvseqLyw1qBSD8MgQPEdmCjDw
         ii6BEMoO01HqFqpmJ4NW3lqRePgI6t/di86bs46ujIT2gINOYFsQ91kFlqemXNTcviXe
         tQvg==
X-Forwarded-Encrypted: i=1; AJvYcCWMTmcQxNj8y1ZWm82esBl0t0WEWlJMwPgJIcfQ2BOiqJV8s8D9b4iH7zW+kFS0Hu03F6GmbcZMQl61BYlFAPtN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5EoAcw/GQ8KY/rfHy9CHQR1xMWXnxpGQJB+DVlt5GmSNz/xex
	UPwHWiorp72qE9cS6DTlFrkZVJ79evBSLW1D5QnfN8/AcTlvbrkSjfc3JeUnOqiOUb0usQaDNFS
	otjHj3AOarg/JVMRv7CWxk7QzQrMtWdDHXyC9gA==
X-Google-Smtp-Source: AGHT+IHB097GZ6fVk/rpRwAIUQNKKHv7J0PFUbREBu/PTKn/4UbitylkvuPDjSzAmny8aHcHd88vY6+lORGpbC6yPhs=
X-Received: by 2002:a05:6a00:841:b0:71e:6a99:4732 with SMTP id
 d2e1a72fcca58-724140a67d7mr26723911b3a.11.1731438425637; Tue, 12 Nov 2024
 11:07:05 -0800 (PST)
MIME-Version: 1.0
References: <20241112113422.617954-1-alexghiti@rivosinc.com>
In-Reply-To: <20241112113422.617954-1-alexghiti@rivosinc.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 12 Nov 2024 11:06:54 -0800
Message-ID: <CAHBxVyFUoiBNbJUCieS1cnVyTwUOModNL6b70wbMV4-z3GJEzQ@mail.gmail.com>
Subject: Re: [PATCH -fixes] drivers: perf: Fix wrong put_cpu() placement
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_110707_010272_F5A41AC9 
X-CRM114-Status: GOOD (  18.62  )
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

On Tue, Nov 12, 2024 at 3:34=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> Unfortunately, the wrong patch version was merged which places the
> put_cpu() after enabling a static key, which is not safe as pointed by
> Will [1], so move put_cpu() before to avoid this.
>
> Fixes: 2840dadf0dde ("drivers: perf: Fix smp_processor_id() use in preemp=
tible code")
> Reported-by: Atish Patra <atishp@rivosinc.com>
> Link: https://lore.kernel.org/all/20240827125335.GD4772@willie-the-truck/=
 [1]
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 391ca1422cae..1aa303f76cc7 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -1393,8 +1393,9 @@ static int pmu_sbi_device_probe(struct platform_dev=
ice *pdev)
>                         goto out_unregister;
>
>                 cpu =3D get_cpu();
> -
>                 ret =3D pmu_sbi_snapshot_setup(pmu, cpu);
> +               put_cpu();
> +
>                 if (ret) {
>                         /* Snapshot is an optional feature. Continue if n=
ot available */
>                         pmu_sbi_snapshot_free(pmu);
> @@ -1408,7 +1409,6 @@ static int pmu_sbi_device_probe(struct platform_dev=
ice *pdev)
>                          */
>                         static_branch_enable(&sbi_pmu_snapshot_available)=
;
>                 }
> -               put_cpu();
>         }
>
>         register_sysctl("kernel", sbi_pmu_sysctl_table);
> --
> 2.39.2
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Tested-by: Atish Patra <atishp@rivosinc.com>

