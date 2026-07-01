Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE7BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 17:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WnvY/8pdLerNOMgVcd3eg+mIsfzQdgJqCy+yb7eu3E=; b=m0shI757EjuEcppEU1t7KIhkza
	UHn3AUEf2J8g1ZfP3ETFqeEt2AYZBKkgGGlCHzW2IfF0B/Hg3ycsriR/J1xBisBdZssNtbOcW9om7
	kzJXmCMU8R5E0vEe5uO15E9g/Td8W6TDFcFkDH2p3mFf7SPBbb/VyKwxLmUPgg4aToAP3ys1gofW5
	tJ6zrHe0XBMosvCfZb3vQLSc0/aDPTuQ/qJ+XtWC5lYk8+CtZCpqvhJ//akCtWu5CmLEM5Htrr1C1
	r9Y4uLJbIOtfRrE1XBvWr/hYb7YP4k5itdh1paIJjILkv5fwDoUnUsNS3oS0Gkc1EHTePO8dliX9k
	OyxAHIwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyzk-00000002kKj-3n3e;
	Wed, 01 Jul 2026 17:45:08 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyzh-00000002kIq-2mb8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 17:45:07 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c9b2ac97cdso70485ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 10:45:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782927905; cv=none;
        d=google.com; s=arc-20260327;
        b=PsADvfig8SRcJr5x+BCKerzBndPp9A1VZPWjc1GWtI/rm6vqU3qyAC/qB7fEY5J2F3
         oPfB4qfKzipdlOW7NCNrhBqZq4NWaShOTIb1IzBZHUvDgm2jQH/FK/N2c4Vdm5JhqxBR
         WWNQb0xbS96mlP33eCEZTPXHzl1obrFgfTClR+8/MM/43vMp1LkINI6DIYx6zf249lN3
         qarJrDQMxME5VNslra9X+83LwZi5hje3A1HKJb4+znj3K+hXGSkRAlzqlH7Xzcwh3BOw
         s8vm1TpVPKm7BAU5NIwnkPFENzLWNOfMQ82yGidIiYfLqpGk5Ymlosu7aXIUN40NlD5J
         Bc1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4WnvY/8pdLerNOMgVcd3eg+mIsfzQdgJqCy+yb7eu3E=;
        fh=qR0Qo6iir18Iao6qTu/WEUggYzBmPMeh6s6d1CJvKY0=;
        b=XfXKC6RWxgIws98hzmi5KV+StSDLQzfqjRPtl1sRpSwCV9E6c8teZ+ykxVyeT69hZQ
         j5hXURon2BW4wGeZH6Ewp+TUBnSK6s5jsgEDMhTR2zcGF175BcaYOQF1+W/vAa/vQ3Ec
         OVDL23rrfRXaIXMWKcr8gR/nEezbZCzrZQA4LmSFHNZvq+ftScjtLKyU5IomnJUhVrpo
         ZPrd9r+rQHvF5zJh5A3aiZU+iAb4mJRKVKOD0GVLR5s5YisqNFxirJpRzJjd6tvC8Ek2
         g8WUXnIZ/hjz57plm7cgfFrPtPJWd6Suayq1IX7Jfz4yDRz4lK5MZ+nzR1+KHu8iCUik
         q1yw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782927905; x=1783532705; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4WnvY/8pdLerNOMgVcd3eg+mIsfzQdgJqCy+yb7eu3E=;
        b=tcQSIZuPRAza7SoC0sony0q7ZUaTgNDatN1alyRlzDuqsJAzs6Ehe9IyDpTwibBHo9
         NqsdFYbFXAU6ECh9SuYDlB3oAURzWVO0bG3Nv7We7ziXUm4KOSW9YQFNo6x5J0jkZAmm
         dmzRvPqMSl+hXfc58+HA5xZzWo2DI8Q/RQPaDnMgjf++pwiPk7bsU6fhdg2kDkynL6ev
         vPKmrKR3w/boeZs81S1pXocPxGB2iEQOlbbY/r/uzaeCJkM5UVb9YtT81nkJXR8XtZRi
         m8tGSmnJb61puGREDNbnpLjvp8o9jPy3p4WBEVoDvYrA7l3O6VgFR5GWL3+HLdYPDLde
         Y6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782927905; x=1783532705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WnvY/8pdLerNOMgVcd3eg+mIsfzQdgJqCy+yb7eu3E=;
        b=JAa3lho3Xo1ZmBPsYQqu8kJ7q2RMZZCDwVN3QbjkW3T67Z+VevwG+7BKxsYLHsOLTS
         iuuWvuZbVmrYVAViDhbWkOAF6xVeyBhHVgjc7J0017r7jYv9ixmNBwPYMUj0Jx5/5BMD
         LvqUyt2VlyzzDFSWXqn8S+8CBQ87IDhei89JBxc1qOpjXNp/d2Uunv+xjjoKGck93Euu
         tamFXi4OdcZdTfpyiDALoVp8ct97UIDXhqtVYi7HZaUVFw4/8e/GvRrkKuxtEijB/rSi
         Ds1DsW3/fjegGT0H4CaB/z2+mdQxEV9hNcJ6SLgFp0226F8AYuEXvQTg6P/KWmKjZbzN
         ow3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpR3iyL9wSNOI8X+6fx+/ef5mwuwNSwZt6SbqyRmkMJ92Cik1ayO7FcS5YLaV1ddfv2n9olYv0Toys743ucn+I9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8gGGXO0op6SPKkvFW55F1S8sMMO4DB9EDeP/Hr/qGxxlc77xr
	uNtrDCRuvhRAT2UYzfdNB2SpHaw+j4VWkhi7F6i+xJGvUtSEmnKnewYGCB5T4rq6juPczqmcfKO
	yk41US/X7jriDo1DV7cHMQW275r38uMSi3oyDYL0J
X-Gm-Gg: AfdE7cnL8jy18vDzy/r80o+Vk5HS9XxqWF1RRVruXMGlDyZFkXaAe4jjkmu3Xjyj6Rn
	NH4dXTgBeSQV+z+XxnFttI0GbImcLC2kMzEgXetqfW/CpE5AQ6MqVXHkKWhwRk0Ooum829NLm0Z
	f3tVcNTZxw0Ly0qxvOXORvk+sRLJiEpUd6QuE5i3y3iTq4f1N28t+BqIqdCP46FkEg3+MDz+oiS
	lmVwWJpyKxTGxIIlhrFAR4EDYg0Mib79Fz3ks/0/JhnSh+WAgrs/lamVw94rUnJsLmnjLNt3A==
X-Received: by 2002:a17:903:41d0:b0:2bd:6dad:7ccd with SMTP id
 d9443c01a7336-2ca77f00e4bmr2394415ad.25.1782927903977; Wed, 01 Jul 2026
 10:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com> <20260701-counter_delegation-v8-20-7909f863a645@meta.com>
In-Reply-To: <20260701-counter_delegation-v8-20-7909f863a645@meta.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 1 Jul 2026 10:44:52 -0700
X-Gm-Features: AVVi8CcF30QiINVIR-rPJZ0l--luoek-SQcSIaomJxOhJ6SUjI8adFi78wHcNvk
Message-ID: <CAP-5=fVBe7Rsf4tkaRiMVPcAD1rHr7PxT-8XpR208C4jaANmmQ@mail.gmail.com>
Subject: Re: [PATCH v8 20/22] tools/perf: Add RISC-V CounterIDMask event field
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_104505_695242_9349C842 
X-CRM114-Status: GOOD (  21.17  )
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

On Wed, Jul 1, 2026 at 1:48=E2=80=AFAM Atish Patra <atish.patra@linux.dev> =
wrote:
>
> From: Atish Patra <atishp@rivosinc.com>
>
> Counter delegation lets supervisor mode choose the hpmcounter for an even=
t,
> but the hardware may only allow a given event on a subset of counters. Ad=
d
> a RISC-V specific "CounterIDMask" json event field, handled like the othe=
r
> arch-specific entries in event_fields[], that carries the allowed-counter
> bitmask through to the driver's existing counterid_mask (config2:0-31)
> format.
>
> The value is the bitmask directly so no counter-list to bitmask
> conversion is needed, and because the field is RISC-V specific it is a
> no-op for every other architecture's events (unlike the shared "Counter"
> field).
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/pmu-events/jevents.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jev=
ents.py
> index 0cf9d26315b3..516fb73886ed 100755
> --- a/tools/perf/pmu-events/jevents.py
> +++ b/tools/perf/pmu-events/jevents.py
> @@ -396,6 +396,7 @@ class JsonEvent:
>          ('EnAllSlices', 'enallslices=3D'),
>          ('SliceId', 'sliceid=3D'),
>          ('ThreadMask', 'threadmask=3D'),
> +        ('CounterIDMask', 'counterid_mask=3D'),
>      ]
>      for key, value in event_fields:
>        if key in jd and not is_zero(jd[key]):
>
> --
> 2.53.0-Meta
>

