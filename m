Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706A8E8B381
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 23:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhW0Z5/bDcVlEnz8k3eYAJjeqv5PflWO94icC/kx//A=; b=mO1xcVZfXGo4I4QwsLVGjXLJZs
	JNJpXVLj6vcOQ9Ms29hqpGat0OsBsPJ4SJizjrxbaQP0uewJqhjP0nZLG5XsfsXRBsUcYaBS+yRNU
	4f7dSiX58SatCD3QudSMHq45wNoxkOlTs5YnJe01eEEKpYMgpRrvu9SXpJLFOddLwew+b/iRKuscT
	97YStj728s3zY93jhvgVb4rgfmqM+GvO7k7X3uahUqdLr4IVuCM8qfrMyGMHrifNQVdv8E/DgFv+D
	9rSlUX+zlflbw12dfLeswpndTezgQ+Ita3BmQrKZI2k80ZMB9A0QV5VO+D8kseSO1Nc2JUgaYoIbw
	fEwt5V0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPTu-00000007WnW-194Z;
	Tue, 03 Feb 2026 23:06:50 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPTq-00000007Wmo-3fG5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 23:06:48 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a76b39587aso13975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 15:06:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770160005; cv=none;
        d=google.com; s=arc-20240605;
        b=lq52TGhXfJHgvAWYMhkPq6Un6+ckXxK13UUDZDbIi+uBcVBXlkaw7MOG3iCU3bMhdh
         Pjl+4KAtGIbKLN/WJrHU4Rs3M+2YRTrAL7i3gQOeVe10eynLEFLn8igx8VmlILk2x3KK
         ph63/CuMFVaL90jdmZP48s8ges8OIkFruR4goohjek5hqp/bF4InsPpTo3xi70Ta1Kj9
         jtBjkXR1WEnSq5YTRDiQAUsqKWk/i/NtKPKnFfmA0spO5/mOzAaZlIF3g1TsMdI/pdzD
         WqFzUpaeYr/CTiQnThK0hhhgoXQtwgc0I1XbAya1QKOG1rNQgcd0yIOngNfLFejQPfk8
         7uWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WhW0Z5/bDcVlEnz8k3eYAJjeqv5PflWO94icC/kx//A=;
        fh=Axgq1q9At7UHRi0quxjREMlsxndJ5HgUlle0JOjuYmM=;
        b=UexDTyC/fL1D00i6Jy9hEIJiTbJHRlkZ9iFf/l4VDK1ZJio/2HAkBTP+KQI0ava9hu
         KmDPitt3GHhxFXboV+kLiQN0TQx8hbpOkG3RKjAs3EDWnUvlPlpBAnrBx6JeHzJnwhHP
         rayVdtD39FCUelR5NsDrlwX7YFs6K+PYZzLwO7UhXMn89u5W/v7nYYkFoXggUCIowghH
         p7fagmzCzHchqhXZQTK0GNFXC8RvRvlW1tBMAXS59jrKglkqvPAaMF21MGV8JAfJsD2R
         ECg8frCJHL9b+tB+40qNjGpz/weRNGa2IlNCkcvfTnXj12hHrz8dWL0iwBPffEsiSC9V
         pTwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770160005; x=1770764805; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhW0Z5/bDcVlEnz8k3eYAJjeqv5PflWO94icC/kx//A=;
        b=JGf3T+jUBam5nCmkS3GKWVYHn4UQTmYHqyRmc4oCUCPy6vIE26fBeqMsWaAmerBuL1
         itqwbArzu91Qj1LJXEp/j4xuiGOEMgH6WnRcE2S5vbHCuBwix1ctbRS0x/DhaS2w/WM0
         isT0kfcpiUA0F5vCZt3LN/iD1u92QT7ygqnibw9v6AMuSi2iEN9e1G4cbCOyzVGJmgnd
         AbqfNERNZqkDqPPdgrxFPzLuckhojY0jXvs+MrOnLVA9qVNRf2Dv0WOujZeq4yS6Zje8
         cQ/391VpV2CmIJG79zVnBFROhAJrUFGOLfrLf8Ly5fZnout2N9Kh0TJbLuGA3DreaQHY
         pehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160005; x=1770764805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WhW0Z5/bDcVlEnz8k3eYAJjeqv5PflWO94icC/kx//A=;
        b=kNh9Z4OxzeTrYqUnv0V42Bjc9wL+XRXf6/J5owwbDUSJOA37TMnot390FFFZh2pgWv
         dRwqhdD1trSN2QSN7ML73bIojgprfQK6JlbmYvGjTlqNfpfg0LgOvtRulPqUE9CUgSsz
         krHtvHVdsqqJ4/04ortHpiNgRPDJAT+cQRf4+T1hiZWBNLHqyyfBIgBPQt+PVM/0su4V
         jGxMeo9pABtqfjkf3iXR373xFUCwyZso+fIw9R2HDu4E0xufq+nEsJacy05GAfLPOzyo
         FmCOC+cMSq74AQCUU2enTYW28ogPBTNfvomr8AUdtS7EL5vMKCybj45cla6Jr+U7iONO
         zVfw==
X-Forwarded-Encrypted: i=1; AJvYcCU1Dvh5iFuhC5UNVRl0mvIGvsNCdL/+ztAueiCVQuPPIAd8rEIWkLV/opNzi4dFkgNZYageJ3w9IPd2lmzh/Eug@lists.infradead.org
X-Gm-Message-State: AOJu0YwHag7+NAZiJF64vDYcqs9fyVVA+gtX0iCtQkK/IpRbVY0SaRwn
	bpNIF0EbOb/JFH5I+Pz/2yYmuwyKM96o1hXtgVitu0SV2EYgdqfDrmQOcE/62TZh6op9MOF5dUX
	TrcjjL9u7pcjLto94vmGqFBBNt/0frCZbLdasfx91
X-Gm-Gg: AZuq6aKoXIU451DhsLxqKu+jPy9tgakCQltYOVnYFwADTVQRa4WawAnbADbP8HUgUcV
	IgzAaOhtoMIhtAVYjyGBlV5CnZ7b0grIpE9/BMqBFntuJ5GifE4qG2w8WPnz7DcPM3BHh+5/Lsb
	Q1AKmunHFC9bcH9aPnnzoT/DmFzdz/7bM4A2h698YE6ysUDusOtlWywgqnWymhVNhGOMuCRtXNN
	8ECUkUSIMETKp03mdeObI+e3/BcbhTPuczl9xE8R2Dxug//f82izSNfEay60icJknnLM2LVjfEE
	Orc8gkzbberBEJAPU85AUkmB6w==
X-Received: by 2002:a17:902:e543:b0:2a7:7f07:340e with SMTP id
 d9443c01a7336-2a9344ae075mr1024005ad.4.1770160004714; Tue, 03 Feb 2026
 15:06:44 -0800 (PST)
MIME-Version: 1.0
References: <20260203024356.444942-1-dapeng1.mi@linux.intel.com> <20260203024356.444942-2-dapeng1.mi@linux.intel.com>
In-Reply-To: <20260203024356.444942-2-dapeng1.mi@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 3 Feb 2026 15:06:33 -0800
X-Gm-Features: AZwV_QgPh6Zuh81ytCB2QhBaLQojIu2yqs-k71pIg-mHSzTgbaREXv2IKP173Cc
Message-ID: <CAP-5=fU7V2KT6Ce+mk5YbyHggxvRfsoiSzZk4g0CYcNK4NGT2A@mail.gmail.com>
Subject: Re: [Patch v3 1/4] perf regs: Fix abort for "-I" or "--user-regs" options
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Zide Chen <zide.chen@intel.com>, Falcon Thomas <thomas.falcon@intel.com>, 
	Dapeng Mi <dapeng1.mi@intel.com>, Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_150646_918388_68E88223 
X-CRM114-Status: GOOD (  23.54  )
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

On Mon, Feb 2, 2026 at 6:47=E2=80=AFPM Dapeng Mi <dapeng1.mi@linux.intel.co=
m> wrote:
>
> Fix an issue where the `perf` tool aborts unexpectedly when running the
> following command:
>
> ```
> perf record -e cycles -I -- true
>
>  Usage: perf record [<options>] [<command>]
>     or: perf record [<options>] -- <command> [<options>]
>
>     -I, --intr-regs[=3D<any register>]
>     sample selected machine registers on interrupt, use '-I?' to list reg=
ister names
> ```
>
> The usage of the `-I` or `--user-regs` options without specifying any
> registers should default to sampling all general-purpose registers.
> However, this currently causes an abnormal termination.
>
> The issue was introduced by commit 3d06db9bad1a ("perf regs: Refactor
>  use of arch__sample_reg_masks() to perf_reg_name()"). This patch
> resolves the problem, ensuring that the `-I` or `--user-regs` options
> work as intended without causing an abort.
>
> Fixes: 3d06db9bad1a ("perf regs: Refactor use of arch__sample_reg_masks()=
 to perf_reg_name()")
> Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/parse-regs-options.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/tools/perf/util/parse-regs-options.c b/tools/perf/util/parse=
-regs-options.c
> index 8dd35f50f644..b44b47d9059f 100644
> --- a/tools/perf/util/parse-regs-options.c
> +++ b/tools/perf/util/parse-regs-options.c
> @@ -66,12 +66,14 @@ __parse_regs(const struct option *opt, const char *st=
r, int unset, bool intr)
>         if (*mode)
>                 return -1;
>
> -       /* str may be NULL in case no arg is passed to -I */
> -       if (!str)
> -               return -1;
> -
>         mask =3D intr ? arch__intr_reg_mask() : arch__user_reg_mask();
>
> +       /* str may be NULL in case no arg is passed to -I */
> +       if (!str) {
> +               *mode =3D mask;
> +               return 0;
> +       }
> +
>         /* because str is read-only */
>         s =3D os =3D strdup(str);
>         if (!s)
> @@ -104,9 +106,6 @@ __parse_regs(const struct option *opt, const char *st=
r, int unset, bool intr)
>         }
>         ret =3D 0;
>
> -       /* default to all possible regs */
> -       if (*mode =3D=3D 0)
> -               *mode =3D mask;
>  error:
>         free(os);
>         return ret;
> --
> 2.34.1
>

