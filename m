Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67676D62618
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 11:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GEdFKTShC0ZpJHoWL5oV3syGXTsJmRbqldb2CgIg7Y=; b=2Jayv0AOWUocLlmaFTlwNK0Kxy
	YZ9miw2SJdKvHGBZD0XqyN3EPoDxyxfU7Pp8jZpO7nHjaa1jpORLzJnlrzjnjxJLIvB2LcBeR8BrV
	ZAwpxTnFu4uz4cVG0G8agvamHlX0OC3avhCPRGuhy+OB6wMeZ8VJ/hDcm67ySDjDgjdmfBjeDAi2U
	xaDZIMGiTaJPYldVlemPsgbtRt4ZcGPeFWnRgKEVxa3FHQaD0u7fL/iSpZ7htHahmT1TV6hLo3Ada
	nss+zYWaFi2wiv/37D8rtoTg4ixXpmgZGRSutauiD2j1HdOkStrS8EXOTj8MSOYe3XzuDEU8VjLoQ
	803mr/vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vit9b-00000006zdh-1Kxa;
	Thu, 22 Jan 2026 11:47:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vit9a-00000006zco-1GM8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 11:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0GEdFKTShC0ZpJHoWL5oV3syGXTsJmRbqldb2CgIg7Y=; b=VWxtjzJWeOPUANlglvrBkaLjRN
	F4BuPY2KOvWWSDW55ap2zHsYuzdfntJwudg4PBKAv4uWydKgo4OiBTdeLqWIafWfXnXYE1j4qY3Nw
	/BZtJP3/9CJD2FsRvvZ912OizGCGfki5i9yupwE8FuSyoO+3ZKIRw0aZXEeiykPyVY63Du+qmwFp1
	K9RWJt4M4P1tkAgi5djk397HlVeViPwrjTA6SZwEpafRTWbY9PBgiM8D7AdQOWntTkvAhAEvRwRR8
	7HQTXqzwgCjJS2fwVkO0sBkiTYjTsj/Hw9Q2xMvYs2fZ2bsLA7jIHNK+Mh1KPFKQXptUwcSQGSN9N
	6BITx+zA==;
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vit9W-00000000H2l-33kg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 11:47:08 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-45c93313721so285917b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 03:47:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769082424; cv=none;
        d=google.com; s=arc-20240605;
        b=jvSPxQuEWilN6SLVjRNPRokf6nH9ye9+VOQi8tH09T4AR9zNP4fWarIdBKzlAWSAhD
         oVgZa1xY5HCTjPMPhu3wa0MnNws8guSRLIvNkINzbkJ5dOgB5ySGqrVixJRzMa9QaF8f
         B/5GCTflF49ESHNhqLcdgr/HV7QRyb5vPevi5gNYGbDRv/g3HmDEuBLa4fDgV17B1Okf
         FQchnrlA6nO0mubdBzPzGR19od/9QrNS7EsS9Agemug1e90xqR3DzV+i+50LEAXiWvbZ
         IM6aaeeiRX3qnsrFZFqoWJwXRBgYr/xAYPhguikWwP6Dljt8hkp0XwvRMDmlEFPJsMqf
         GX/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0GEdFKTShC0ZpJHoWL5oV3syGXTsJmRbqldb2CgIg7Y=;
        fh=XtK4lejhyJb3WfO0LY8ppJLD1+w6KaK94jXxot4C/pY=;
        b=Bt+Whfm0ff70QkyfiHgpB6pX3tkE0k+X6l1PPpJqxhMqkhUr3L+dAKI7IGyYOH/T/U
         ILrKdGwQ2ESVsnt4JqPaBuiwXAVafkx9DSRyt8UuRVff9M9dMGX1r/skVy+fNIHeU+uH
         DZFGsa96AASYWAuV21uBVJK6eM5dOnFydRnCGbhv3BUOgEyZA3Nh9EKUhi5sUDeu+SR3
         xXMCZd6uFvj/DQPRlHhCVGvk4vM4WuRmBypskIbfmFoYnqf2+b8liuTaLcA9lg3INLb0
         wUUJxk5XnogbzotmjUt0TB26VPOd0UBpaMZYMI/xrKCs84GZlh+ZH5iApwlx28kCrKdT
         T0fA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769082424; x=1769687224; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0GEdFKTShC0ZpJHoWL5oV3syGXTsJmRbqldb2CgIg7Y=;
        b=Dy8p/j3dYMR+JlCR6DxswpLVrfj2ZBrE6f3bVrsko8K07LGOhD9exjfXndFaGHMYyS
         tm7k+KpBxrMTeixQl9t6NjxHGL3wa++Ay5C4O8Ba69WCygnEvXBB+dju8b2aEEcmGGJi
         DYZFBQt7JcHMxUDrZWq0K6OLBn9GEUeRtHUM5E5PE3rJybjxxuwOZ0jMoBiZFAzNLv03
         PkmGdzrF7g33EvCsb8RWDaxMtffWleUYxTofYzQp8C5e0DmzK7bVXcRZG1fG+rqXdwoQ
         6xLIeAfIL5obW6ByaFlAHtdJybaSBBI8Lq8eofkZ6HyD7gGBRLDjAAPZzCoRD4VoUx14
         ajDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769082424; x=1769687224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GEdFKTShC0ZpJHoWL5oV3syGXTsJmRbqldb2CgIg7Y=;
        b=j4sBI02wVcdvvx871Ir6eq4Gulmj5WXEX72ur834rDL4Z7eR11uhywe0cpHe4zWlvg
         itCbSQkq6iPfRrtaTO+9daPh9pkD6iHF2D7eMdBiTS6G1zyYs2pg9Q9QQCUZq5Oruz2O
         q/ZKvtc7GOoRauk8uRiJ5+H69HBWrYt0vlwZr1Cc+7m+XU8keAGNBEXPqwtgdvnfCH5F
         gMO1I2zl6hYJUKipTDZrkautW/kKZudFeVRH20dKhjLxsnBMZz6+fUSqnDhaxPO7Q1JG
         uJ+smxJx5lLJatvHQ535u06iSs/xMr3B9CQSlS2ppPUAewkQxbg7UHJnaLe9i24W3Dam
         S4ag==
X-Forwarded-Encrypted: i=1; AJvYcCXAqc2LXxZbrtDabkmcugVEuEpRHn6+dVQXZJUw296V5YKImiRlBQA+GeodOoOZ9829YhT/Qhc2TYLNRD+ui+T5@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7MVGCrhZGtoMLb89lYV/xiYGoU+RhPYm6IIuc5vT4zdiMb0Ic
	Qvs1opwDnvBEhcnyKDp4LIEjL4gZNSoJ40FaDgjg7JZioFkWVPl8sEeq8zUXn1ig5NKSsOXhLUD
	rFdYuLgbrepOEfxv/XgnN6ExkJpkzeKQ=
X-Gm-Gg: AZuq6aI+9nlldx6tLNeDnqEHsu7oPBALegY9YBlwlRZbQsPej6Fqahs9jBgMWoMSmlt
	kr+P6ZhwJYfuwDxfnxL15ZM7IC49ficrubVKsjNJ0GDPTYRyaqPbSYIKTMgICnbSC9l9TJvs7LA
	28nuN0mBsSyTf1Xw9JpFBqYtBicXoCSEobpB1ufy7vnQjAUJv2uIFof6Tp9V/cstQJVFVLyYN5q
	B9TBkTCWzZ1Ns71VrZnM8y7YV2shhUquV8Xa2LPU7FmQoWAFAIpSdK9mTFsT69wL/SnU591
X-Received: by 2002:a05:6808:538d:b0:450:340:2693 with SMTP id
 5614622812f47-45e8aa24273mr3205271b6e.42.1769082424420; Thu, 22 Jan 2026
 03:47:04 -0800 (PST)
MIME-Version: 1.0
References: <20260122073127.375139-1-irogers@google.com> <20260122073127.375139-3-irogers@google.com>
In-Reply-To: <20260122073127.375139-3-irogers@google.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Thu, 22 Jan 2026 17:16:52 +0530
X-Gm-Features: AZwV_QjrC7BYx4_l0qj0u58o9jMWpinoFh5JfqyMmM-71XKtG3yyoT8qR6m_7W0
Message-ID: <CAO9wTFh01Qzn9tAiXf8_eGd7AAJiKzjmHNw-hBBCzcYR9Mb8xg@mail.gmail.com>
Subject: Re: [PATCH v1 02/11] perf annotate: Fix args leak of map_symbol
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Zecheng Li <zecheng@google.com>, Tianyou Li <tianyou.li@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Howard Chu <howardchu95@gmail.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_114707_035366_F68065CD 
X-CRM114-Status: GOOD (  13.24  )
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

> @@ -1119,7 +1121,7 @@ static int symbol__parse_objdump_line(struct symbol *sym,
>                                       struct annotate_args *args,
>                                       char *parsed_line, int *line_nr, char **fileloc)
>  {
> -       struct map *map = args->ms.map;
> +       struct map *map = args->ms->map;
>         struct annotation *notes = symbol__annotation(sym);
>         struct disasm_line *dl;
>         char *tmp;
> @@ -1151,7 +1153,7 @@ static int symbol__parse_objdump_line(struct symbol *sym,
>         args->line    = parsed_line;
>         args->line_nr = *line_nr;
>         args->fileloc = *fileloc;
> -       args->ms.sym  = sym;
> +       args->ms->sym  = sym;
>
>         dl = disasm_line__new(args);
>         (*line_nr)++;
> @@ -1172,7 +1174,7 @@ static int symbol__parse_objdump_line(struct symbol *sym,
>                         .ms = { .map = map, },
>                 };
>
> -               if (!maps__find_ams(args->ms.maps, &target) &&
> +               if (!maps__find_ams(args->ms->maps, &target) &&
>                     target.ms.sym->start == target.al_addr)
>                         dl->ops.target.sym = target.ms.sym;
>         }

Hi, a noob here so please correct me if I'm wrong.
Looking at symbol__parse_objdump_line(), shouldn't we be calling
map__get() when initializing the target struct? Since maps__find_ams()
now calls map__put() (after patch 1).
struct addr_map_symbol target = {
    .addr = dl->ops.target.addr,
    .ms = { .map = map__get(map), },
};
This would match the pattern used in call__parse() and jump__parse()
that were fixed in patch 2.

