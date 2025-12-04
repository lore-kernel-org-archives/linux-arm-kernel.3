Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111ECD20694
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 13:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BiNjOZmAVdmFCT/h0Fx8xqDnfwmtfIhKs7a0qrI0Rs=; b=jorXHK5mCVYLUinTwrj6KqL08p
	mvguKw+idW8LtEvhakPwBPhf+nLE9PrvOQeHBKIK51eZRu+52CKgypQjXoMRLSQNKDl9KDrLZZyll
	ge26EI8DLjUSsOyfrNT0nuMLNpuJhXOKi6o6Hrp5ol6XFdZED7xdEBn3dQT2woMfHrbVmdcGLrVAD
	mXpc3S5EPa6MWQmM0R8wm2bU4lKcFS7GHZmhA+D2phxbK4JBx2wTvim3iOAzaEQeREh8y6CjCKiOW
	eciZwLjZk0Q0E9yTeGDwMo/MPxl8RVmjGCZQJioJfTzWmZnJOd0rKky1JfASfvpixz++H0FN49f64
	/2RWTG1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9ek-000000084wa-0AV9;
	Thu, 04 Dec 2025 13:46:02 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9eh-000000084wD-1kUv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 13:46:00 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-8b2ea5a44a9so88268585a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 05:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764855958; x=1765460758; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+BiNjOZmAVdmFCT/h0Fx8xqDnfwmtfIhKs7a0qrI0Rs=;
        b=vVCsDsCAKTOLYCoRBHCI/Ao1x1J6N0eB0iWruSwHaM6pB7LV3x3/tMytyvDJqbDney
         hYDTU44MM+ToyoL9qbB7Wcs20/EVU7FPc/AWBT9A4UuZz0Ca3Gekgd0/olX16iaW+WJS
         Nk2u850cMieo8hYUrOf2J2vr1w5/N07lmaYe41ima7h/J1jefVKYiaMYRSA70ooc677O
         CMUljXORKrA8ETtx4GfcQkHubHViP90+siH+L/lm3X5yciwH6gN2DULSJ/pCPF6OOdz2
         Sugzok52G94rffO+OvlYvNFZgwKEv9eZ5h4bUvFIoGqnWIW8FsMvWGEB9yGh2kuQNkP0
         rR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764855958; x=1765460758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BiNjOZmAVdmFCT/h0Fx8xqDnfwmtfIhKs7a0qrI0Rs=;
        b=RnRBCISLuf5l1dp51e7V61VZ9A6z/zH9EZkDUqRdoUuVtr/PtTN0mDox3yyHwMgfFG
         h8LP+p62thYIJVaZIVYVPyaQEQSJTbI9o3GbOlchEyWtn8Bhgg/yjK2nDkcY3ubodbgj
         Jc1y/02OiPIbztNpM80BrdlL2XLk54+u794K7zAuVybbVD+nr4EhdAjSUJg8Kj//dgFR
         6R8lzV1ldSrgUqOsq0t0SpgOmU9NEQzO+luvuLROKvuvU+AAijdhz1MAFFHTuScrnXJP
         SJBiPodT4DnrNt0i2sWBQ/EBSrJRuPDBWZcLxNaFnH79pIc9aRlRkIVgEioEJ+Zr8ZFG
         YYWw==
X-Forwarded-Encrypted: i=1; AJvYcCXzWvYKkj7DVUKVRILwgd5DbwOP+pwjdfL9yFMgK75HDUvQEgsjfGfDxuwyPCUIPPhE+ovrx7DiehvhdTmZqLjS@lists.infradead.org
X-Gm-Message-State: AOJu0YxlaVODQMrwAJHSvJjW8UBuT2whW9JZGj1sjEu/BNJ8N3M3/B4z
	6C5SjbEB8eWjr6Fcfj2XOa5leU4usoNtJMtXPQJ/Usimymk6TOa7nrLBX9cXg2a0AJCLvffW6t8
	bJeTgROnkt4qjFKJeADt2nk1pHJLXJWFWCtJewQ3wUg==
X-Gm-Gg: ASbGncvI4tQ08B8AO4Pgorj8ctEFxwAdzJRhPXQ4J9WgkW1DE1TxJ8OA0smiEKWwpty
	olJD772VddUrPEojoC2vmneOCuw/QMJVRlMMgr4Ido7ENZiq4z01Tgfq6HXEPw42A4j0CX8K3hd
	5zBLkA9Saosiymb2+DL+6EtK8yr5JykSsDI4aSkpAkExXfgaR91jfb4UlzLwL/7YCsOGVbutdQZ
	ORHwzNxUnnAoiyfAkdNPcP3MWUjnKS1uGt/xmmKdrr5BgPQPuWouM3JRuh/Qjrwrw1Si+2Ponou
	a90kJhczme+yQfV2AA+35lRm0hkJ
X-Google-Smtp-Source: AGHT+IF/TeSZNNywvIRUljAsJ0vS8hh9ONjlM/mrinOWxQwCICFrieYSQl60nuXiOfIxLqeEfqqlcVfgiDzyNM1AfYM=
X-Received: by 2002:a05:620a:bc6:b0:8a9:ef98:6835 with SMTP id
 af79cd13be357-8b618158045mr347919285a.33.1764855957706; Thu, 04 Dec 2025
 05:45:57 -0800 (PST)
MIME-Version: 1.0
References: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
 <20251201-james-perf-config-bits-v1-4-22ecbbf8007c@linaro.org>
 <20251202114300.GV724103@e132581.arm.com> <53b24702-eb3b-4e08-bca3-70402eaf4db5@linaro.org>
 <96c54895-cebe-4247-86e6-d41b8be0dd40@linaro.org>
In-Reply-To: <96c54895-cebe-4247-86e6-d41b8be0dd40@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 4 Dec 2025 13:45:46 +0000
X-Gm-Features: AWmQ_blxXenv19pw3rr9VLrADJwMIARDaOtETNn7Wt5gmB_nqIfN80W4UUwmDoQ
Message-ID: <CAJ9a7Vgn+HBSO0d3s-x+vjqk3Zfm2shpW1di12_OEZVSN6S0yw@mail.gmail.com>
Subject: Re: [PATCH 4/7] perf cs-etm: Don't use hard coded config bits when
 setting up ETMCR
To: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_054559_487817_C03452EE 
X-CRM114-Status: GOOD (  34.03  )
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

Hi,

On Thu, 4 Dec 2025 at 10:55, James Clark <james.clark@linaro.org> wrote:
>
>
>
> On 02/12/2025 11:53 am, James Clark wrote:
> >
> >
> > On 02/12/2025 11:43 am, Leo Yan wrote:
> >> On Mon, Dec 01, 2025 at 04:41:07PM +0000, Coresight ML wrote:
> >>
> >> [...]
> >>
> >>> @@ -746,7 +779,7 @@ static void cs_etm_get_metadata(struct perf_cpu
> >>> cpu, u32 *offset,
> >>>       case CS_ETMV3:
> >>>           magic = __perf_cs_etmv3_magic;
> >>>           /* Get configuration register */
> >>> -        info->priv[*offset + CS_ETM_ETMCR] = cs_etm_get_config(itr);
> >>> +        info->priv[*offset + CS_ETM_ETMCR] = cs_etm_guess_etmcr(itr);
> >>
> >> I still think cs_etm_get_config() is better than cs_etm_guess_etmcr().
> >>
> >> For ETMv3, we directly pass CONFIG to the kernel, and after validation
> >> in the dirver, then the value will be set to ETMCR.  If we already know
> >> the config value is consistent between user space and kernel, why
>
> One other note is that since moving the timestamp field, this is no
> longer true either. The value in attr.config isn't directly put into ETMCR.
>
> >> introduce a redundant "guess" operation here?
> >>
> >> Thanks,
> >> Leo
> >
> > Because userspace doesn't always come up with the same value as the
> > driver. For example right now in ETM3, ETMCR_RETURN_STACK isn't set
> > depending on certain conditions that userspace doesn't know about.  ETM4
> > has the same for TRCCONFIGR_RS and maybe some others. In the future,
> > other versions of the driver could do different things as long as we
> > don't break decoding.
> >
> > I didn't want the function name to imply it was doing something it
> > wasn't as that confused me a little bit. It's definitely not "getting"
> > the value. Maybe "guess" isn't the best it could be, but it's not far off.
> >
>

Perhaps cs_etm_synth_etmcr()? We cannot read it directly as it has not
been set at the time of creating these headers. (unlike the sets of
static read only IDR regs that we do read).

When in perf mode the only configuration bits set in the ConfigR for
either ETM3 or 4 are those generated or implied by parameters on the
perf command line.
This info has to pass from perf to the driver somehow. Evidently many
years ago, when only ETMv3/PTM existed the easy way was perf.config ==
etm.configr, now that is no longer feasible.
As long as perf and the drivers interpret the command line attributes
in the same way - all is well.

As James says, the actual configr can differ from the synth one - the
key is the bits that control the trace format - e.g. cyclecounts,
rather than trace filtering e.g. userspace/kernel that affects the
drivers configr but not the synthesized value in perf.
Decode cares about format, not about filtering. Additionally some
things - like return-stack are implementation dependent - optional on
PTM, not at all on ETMv3. If the trace unit does not support it then
the drivers ignore this. the only effect on the trace output is less
compression if retstack cannot be used.

Generally decode needs to know about things that affect format and
function, rather than filtering.

Mike
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

