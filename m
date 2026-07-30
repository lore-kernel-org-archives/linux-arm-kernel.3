Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7919CC5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLJjqOKfhyu7g7JHPGSZLeYWicOZ0Mup3q40HiWWSR0=; b=FBgW70l1ojP25jf8J7RarYmD7B
	X4//eZfs09M/JX7cSr/polgDO8cZCUgONqnW0DBBPjmA3BZMRs+yMevlth1m7lRwV6sUMUFuqtvd1
	vuu4ZzV0q+rgdXdrwV3lqwpA9gaD+OF1GJenUQurI8BFwpo8ZJHG+4KzD4xOuDOLQRPPuej0lM7JF
	ipZULMQV4f2ce5sOVxxvHq9GnCP1MUXmVuMIy9nDWi5zsIXoKEMe16iqdIUhpBn3tXXAkBL1nCEjy
	Xohog3/IPafrORkzVYK1J54qAxx1wF1d7rC6VRJM8+4JV7duhcHWDtntBX8bQN2Tk6Up/i2KRJ89g
	W51x2afQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWrw-0000000BHZa-2xKw;
	Thu, 30 Jul 2026 19:56:40 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWro-0000000BHXp-44JM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:56:34 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8485b358552so339691b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 12:56:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785441392; cv=none;
        d=google.com; s=arc-20260327;
        b=W66cmx2KzL0Kg3GXUDlmxp4RdiOsrEFnOkAAuzgKCJ3Dd5bdFlWri+yrdbbydrD6Oy
         8CNWESjEHl/155KUhgWjCdD8V3gWry1J25DxlaZJEH8mo4XVT64rrKajt0ZZIo92ftM0
         8xkj/dwqMz9WDOgI1bd/2yNQhaPEahTNFWdCRxIGwxacmup5iA1ScEeQgfPOtEdyfjvC
         pKuCgXbOd9kw1Ui6AoULcT8ZWmy2aAY3HSmmImUQYdjiPObC0HMftfOEPhupR7QGFyiI
         EixpYYwxzmTXUxUcf4/+wgVnTBs3VdBu8MGhpvVMmAw+CVTPNCEXhflitxJIkinyhK41
         LWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qLJjqOKfhyu7g7JHPGSZLeYWicOZ0Mup3q40HiWWSR0=;
        fh=mWmaehAFuVafpjDPdE2aGBAa/kBycHViiVhw10qkX8Q=;
        b=VOKLmqiwsdnW4FstPNljmtu3mYK528ratylL4YNl7UknacZfoATTjGNqcF2mkLvkKQ
         m1zSMvTJ/wEBpHf4obIyOcPGeB2LZd4Y/5eXFC3jSLRe/pBHcnHT+1iYB6q/hoKjCmGb
         swJp+ca7PLHNpUxhexaU69f2af2f05h56Uaa5TTjxKpHuY//PDeqZ3jYvdMBxG/pEWtK
         Iy2SH40gLGNCklAHqDJH4jA5mqt7mEx70qsxKLJul/g27eVuwdUtZGHGN6w+hxT7BbXP
         cRFonRRIbL2WsEdwggwpYAjNq2YsHWXtaZ1bMp038IVKEWNCEkej8i1zlZC8lXtlEkpN
         09SA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785441392; x=1786046192; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qLJjqOKfhyu7g7JHPGSZLeYWicOZ0Mup3q40HiWWSR0=;
        b=DDYmRx09Fblb6UkOXtQYVGQR9y0fMsM+f+2vk1aSEy2JtAC65EMpaKXysRBkRzrwTu
         6WxF4ENWe5bTmI7KQhFYG1SBrEt2+PkADxKEh/7DDFVyUlKuAJ4dwc+RVf77aqDBFTMq
         zqg1+hsDekvW+VAFMaGOUJRUmHxABSECDxAsqTK2LnUk00WMgS3App0sr6qn90K8ioZP
         etpEh8GoeuUkGpQAt76b5Jpivi6EWMu+hp0Rw31tQxJD8cTCKKwWTS3ARHMpwd9vH3ac
         fTh3iJoFeQyWflv/L3GMjW+uw/Hu+9IJ47O7fldPDHZ8VwYHD/mFNgvg/zhDj1dTku1l
         ksoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785441392; x=1786046192;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qLJjqOKfhyu7g7JHPGSZLeYWicOZ0Mup3q40HiWWSR0=;
        b=EcbgG+IR+C4l0DuqnNLkwqmGJHMug7pD0NVH2I/WhrRjvj1hbGJna1IMV7PkM73m1T
         2aAbdKV5IffLVpD/D2QY4MMKpI5sYEoSiMYUb2+iD7kjl8+bJim2/vWkbeFmhv4XlrNf
         o9NNRZomhNihgqJQVbhEVtsd9Jw4HQ0c+sPIiN+4CzuwsoL7S1Q0FCPcVkwGLNtmm5v5
         0Mi5Y/u0HlvgxqUuJlf7F/82ZMXcDK3JCC2s0CKg8iLtXZINoURkRx35zOYTdfytIYnu
         eTAP09suKS/ab1GgxCtcCvwMpkt1nL/XyTDSaAbbxsgUTIIqAIALxQwgewy0zvM5NIGM
         tDzw==
X-Forwarded-Encrypted: i=1; AHgh+RqzVOBAw3skYzxHBZnmCSYqeHVhwtgz6G4NGzADHL4mmbZIZ7N+i4rXsM8SSwVAoSa6/yLXaIpjo0TQVHya+T6w@lists.infradead.org
X-Gm-Message-State: AOJu0YxgknPPnX7tJoTg0orL5xLcuRaDj+B8kwGWrbF0uehHpOcMcFMz
	FmAJ9Zk8iDjJKuCv4qYzhGjiPx30j8skM+ftZn2hYiwM0DmOqS+yYReaqPbpdu0QOUI/dJiHhXm
	KGmRbCM14Fp8tWpZ10vDGO4/xPqOdd3Q=
X-Gm-Gg: AR+sD13atu9pWVU1HAV9BXWDRoJ1TXT2JnPVgnVmjLREVWyawKj+IqiIrDjDLJ1CfJY
	w5+7VJtqzJr2CMghOs5n4hkYPIGFEJN5YjVvo1UiFJug5O6PkKjjEzVHebt3pNkEJKcTmEb98Oo
	M5matYotlz4HrfDex7He7X3P5ILmNJqSpPbe+x+mWG75IWr0fi3wVow2ENhPdm4aPA6YHaNCbDH
	me+9CMVJwZ2g/je7fimh5L9Fo41ThX6QYIZn347Q8s/lVnNGp3d8McRR5Zn73PkcgTdA1d0ShEM
	9NFGAc9iQ6VAIH7BgfYI8GqfUa0pB5O6u4haqzw5YpotztLcZgje1oCsYlnuwkTlONDtreTnDoR
	PLp+PK1OI4jbQly0/PpHapcnOX45VlS4PvtrI4Q1uzQ==
X-Received: by 2002:a05:6a00:928f:b0:847:904c:8452 with SMTP id
 d2e1a72fcca58-84ebc3cfb0cmr3687688b3a.38.1785441391979; Thu, 30 Jul 2026
 12:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260616155716.2631508-1-puranjay@kernel.org> <20260616155716.2631508-3-puranjay@kernel.org>
In-Reply-To: <20260616155716.2631508-3-puranjay@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 30 Jul 2026 12:56:14 -0700
X-Gm-Features: AUfX_mypllbuQtwnAyQGtjj8wrW31i_okmt7jn4Zb1OXf9HqTBm6BS29OcrxDXw
Message-ID: <CAEf4BzYrwthXzMP-oyxfnFyFm+N0ZD_cEB8Sz7pYn97RMPgb7w@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] perf/core: Clear the whole branch entry in perf_clear_branch_entry()
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Stephane Eranian <eranian@google.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Usama Arif <usama.arif@linux.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_125633_018026_9E3A2DEC 
X-CRM114-Status: GOOD (  27.75  )
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

On Tue, Jun 16, 2026 at 8:57=E2=80=AFAM Puranjay Mohan <puranjay@kernel.org=
> wrote:
>
> perf_clear_branch_entry_bitfields() resets the bitfields of struct
> perf_branch_entry one at a time and deliberately leaves from/to alone,
> since callers overwrite those immediately. The list of assignments has to
> be kept in sync with the struct by hand, and it has already drifted:
> new_type and priv were added to perf_branch_entry but never cleared here,
> so stale values can leak into the records handed to userspace.
>
> Clear the entry with a single struct assignment instead:
>
>         *br =3D (struct perf_branch_entry){ };
>
> Every caller writes from/to right after the clear, so zeroing them as wel=
l
> is harmless and the dead stores are elided on the x86 LBR read paths.
> There is no longer anything to keep in sync when a field is added.
>
> The helper no longer touches only the bitfields, so rename it to
> perf_clear_branch_entry() and update the callers, fixing up the
> br+nr/br+out spacing on the touched lines while at it.
>
> Fixes: b190bc4ac9e6 ("perf: Extend branch type classification")
> Fixes: 5402d25aa571 ("perf: Capture branch privilege information")
> Suggested-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>  arch/x86/events/amd/brs.c   |  2 +-
>  arch/x86/events/amd/lbr.c   |  2 +-
>  arch/x86/events/intel/lbr.c |  6 +++---
>  drivers/perf/arm_brbe.c     |  2 +-
>  include/linux/perf_event.h  | 16 ++--------------
>  5 files changed, 8 insertions(+), 20 deletions(-)
>

Another one for tip/perf probably?... Puranjay, maybe send the first
two patches separately?


> diff --git a/arch/x86/events/amd/brs.c b/arch/x86/events/amd/brs.c
> index 06f35a6b58a5..68c5f42965e9 100644
> --- a/arch/x86/events/amd/brs.c
> +++ b/arch/x86/events/amd/brs.c
> @@ -343,7 +343,7 @@ void amd_brs_drain(void)
>
>                 rdmsrq(brs_from(brs_idx), from);
>
> -               perf_clear_branch_entry_bitfields(br+nr);
> +               perf_clear_branch_entry(br + nr);
>
>                 br[nr].from =3D from;
>                 br[nr].to   =3D to;
> diff --git a/arch/x86/events/amd/lbr.c b/arch/x86/events/amd/lbr.c
> index d24da377df77..08401fd60585 100644
> --- a/arch/x86/events/amd/lbr.c
> +++ b/arch/x86/events/amd/lbr.c
> @@ -181,7 +181,7 @@ void amd_pmu_lbr_read(void)
>                     entry.to.split.reserved)
>                         continue;
>
> -               perf_clear_branch_entry_bitfields(br + out);
> +               perf_clear_branch_entry(br + out);
>
>                 br[out].from    =3D sign_ext_branch_ip(entry.from.split.i=
p);
>                 br[out].to      =3D sign_ext_branch_ip(entry.to.split.ip)=
;
> diff --git a/arch/x86/events/intel/lbr.c b/arch/x86/events/intel/lbr.c
> index 72f2adcda7c6..295da179fa74 100644
> --- a/arch/x86/events/intel/lbr.c
> +++ b/arch/x86/events/intel/lbr.c
> @@ -755,7 +755,7 @@ void intel_pmu_lbr_read_32(struct cpu_hw_events *cpuc=
)
>
>                 rdmsrq(x86_pmu.lbr_from + lbr_idx, msr_lastbranch.lbr);
>
> -               perf_clear_branch_entry_bitfields(br);
> +               perf_clear_branch_entry(br);
>
>                 br->from        =3D msr_lastbranch.from;
>                 br->to          =3D msr_lastbranch.to;
> @@ -846,7 +846,7 @@ void intel_pmu_lbr_read_64(struct cpu_hw_events *cpuc=
)
>                 if (abort && x86_pmu.lbr_double_abort && out > 0)
>                         out--;
>
> -               perf_clear_branch_entry_bitfields(br+out);
> +               perf_clear_branch_entry(br + out);
>                 br[out].from     =3D from;
>                 br[out].to       =3D to;
>                 br[out].mispred  =3D mis;
> @@ -920,7 +920,7 @@ static void intel_pmu_store_lbr(struct cpu_hw_events =
*cpuc,
>                 to =3D rdlbr_to(i, lbr);
>                 info =3D rdlbr_info(i, lbr);
>
> -               perf_clear_branch_entry_bitfields(e);
> +               perf_clear_branch_entry(e);
>
>                 e->from         =3D from;
>                 e->to           =3D to;
> diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
> index ba554e0c846c..effbdeacfcbb 100644
> --- a/drivers/perf/arm_brbe.c
> +++ b/drivers/perf/arm_brbe.c
> @@ -604,7 +604,7 @@ static bool perf_entry_from_brbe_regset(int index, st=
ruct perf_branch_entry *ent
>                 return false;
>
>         brbinf =3D bregs.brbinf;
> -       perf_clear_branch_entry_bitfields(entry);
> +       perf_clear_branch_entry(entry);
>         if (brbe_record_is_complete(brbinf)) {
>                 entry->from =3D bregs.brbsrc;
>                 entry->to =3D bregs.brbtgt;
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 48d851fbd8ea..e034be4a473a 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1467,21 +1467,9 @@ static inline u32 perf_sample_data_size(struct per=
f_sample_data *data,
>         return size;
>  }
>
> -/*
> - * Clear all bitfields in the perf_branch_entry.
> - * The to and from fields are not cleared because they are
> - * systematically modified by caller.
> - */
> -static inline void perf_clear_branch_entry_bitfields(struct perf_branch_=
entry *br)
> +static inline void perf_clear_branch_entry(struct perf_branch_entry *br)
>  {
> -       br->mispred     =3D 0;
> -       br->predicted   =3D 0;
> -       br->in_tx       =3D 0;
> -       br->abort       =3D 0;
> -       br->cycles      =3D 0;
> -       br->type        =3D 0;
> -       br->spec        =3D PERF_BR_SPEC_NA;
> -       br->reserved    =3D 0;
> +       *br =3D (struct perf_branch_entry){ };
>  }
>
>  extern void perf_output_sample(struct perf_output_handle *handle,
> --
> 2.53.0-Meta
>

