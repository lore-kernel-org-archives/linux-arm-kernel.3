Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08C1CF8843
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZI9OvNHyteLma7cxTfxeTFiEdiK8jrJPjX74p/zZ2dY=; b=olXkijFdq9SSA9XY+u2+YeTkRA
	yKK+rIlY7pkE3qxgAixBXU+E9h3P951tfbthsgf7mFmAVb8A2jYVxkOkf3KVSS+pm2veL2IsX8CSL
	cD3qsU+pxgbyFEAUpu/uxPQ4+nMH8DUW9nUaYEbAXL23wYYdQUngjnodjgGRzbnPxtFSHUHtbiwTJ
	gHiTg+XXk8FMbjfu2JyS2xKux+xcmdD2NubVD9v1DMKSNPL74dg3RxxynMmm2hEoeZHvzhfm5E/O8
	5AoDXBk+nujOm/uEQOOE+1bbzBRtv5dJAE00DnRgcnal6kdFfgDWL4c74N2hL0s9qSuxsKLq1M28x
	sva3eoow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2jY-00000006YvI-0ldb;
	Thu, 20 Nov 2025 11:21:52 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2jV-00000006Yus-3TDP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:21:51 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8b2da83f721so74472385a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 03:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763637708; x=1764242508; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZI9OvNHyteLma7cxTfxeTFiEdiK8jrJPjX74p/zZ2dY=;
        b=EQNAiWjsKVLLvTgnyontw/1xWHk/8E+9LFMPqbpC2Z9Q+GxIVnm23oLxMObDXFvMd2
         LVEKRvitUBuveVNIaA6TFoO1izs57nyd8p+T7/cz+1sZEVbNxPcTnpKacBly8UV05cz1
         Znta5FjiEUtkrtY3a1CrOSyppIfxudiB2Xnf70JWWjJ17l4TiLLkD5lKM4UR0MAykSyh
         nFV/hsdbBN9LyCxizxFNfH0+oV4oACeoNyy6Q34Uhms8IfqDjCZdArxIR/rNBFdscuO1
         fTPJuRf4Wm0hx21OTlX6LHcEN6q9yxX3gCpjcZf3ds9ln7CAJAOBJ0tEhv1DfUtqSVbm
         2R3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763637708; x=1764242508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZI9OvNHyteLma7cxTfxeTFiEdiK8jrJPjX74p/zZ2dY=;
        b=tNgc80JGvEk3Ue1xpUN69GkdODWqYVj//7bCCmlKab5QPgctaJJo4LLK26nlWRs7dY
         H42BCqpk5y/M6189xJzafTR0s3q6gsK0UYEkwhhlrAqLpgtbg67OyWMP9CTBVGxq4F4+
         dsWI70OrWOFri6PtKKy4S3LAWCNKGYM90u8OqDmV/ufMwTZt4u/mTIuSXLCAAu6sojd1
         s52T7W5NGTUzvWRFAftSvhYBL+ZxxK9w6X62d/4inNfqf/w7jtdoLEQGmSmnxyPWZJdy
         W7x/LhhCNmkmbgoyFnFU6bu8x2w38E7iND9uqCt57ZxIzWj8lIJDDvFulwzU+y1KezGm
         HXow==
X-Forwarded-Encrypted: i=1; AJvYcCU0h0HEMzBEX9UiJAjmaB9QgOefDdYSqH0EmyKRD0YE/lxWCg5pLdKoegSmGmOmcZ3R2tOxcZq1PLE/1Xig5ijp@lists.infradead.org
X-Gm-Message-State: AOJu0YzEmhLDyxKTUJ5Uj/aTe7mBxTQHxAFbhtXVHms2cRcvR2VrFzRP
	m2/J54C+LliPye8TfGbsphsvjqMfSfha+t0BuIipzM43bbM5IP8sD4hDMhofM2i1Gfi2qakNYf1
	UotbFkrspWGMoPSYp7dgdaPm1UUeM7EnvQ2MH0S18LQ==
X-Gm-Gg: ASbGncvvcZJ/ZR1EHo9OvfBAcciCapPrAfaJOVXwIrzJ6KWu3H7kD2gV9NhmlvSkORd
	yfAzeq4Qxe5H3iN0XmOKKWECv+MZp0CT7dlSJm2/T3hQiMDaZ+Foz38tD/HJwxIKb+5I/oaqjnH
	w7fZ1W0nOLxMjzRxuMKcr85Q6u0+40ALd11VOJvBisuUQIjqWQQcCIQ5fFZdfVXWjO9OMj90j/W
	dj0w0+MYHD8vQMG4Y4pFNNS4Acsvt1Qv570t2VoVTf8xEBqwJjO6iyKHeLZkYW6uxpHVKlOWVMY
	yqcFMkfRccT7GNPNmf+qmo1l+LEw
X-Google-Smtp-Source: AGHT+IHIV7zUxX7vwPq1KtOa4ec6yAwSEMzkL8MwxJxJvLc9J7RQ3VXe0x+vXH5Cd+BIqWwNLNkHjzlSJPaVZhF8NOE=
X-Received: by 2002:a05:620a:29c9:b0:8a2:d235:8136 with SMTP id
 af79cd13be357-8b32acf12ecmr207316385a.25.1763637708007; Thu, 20 Nov 2025
 03:21:48 -0800 (PST)
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org> <20251118-james-cs-syncfreq-v5-10-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-10-82efd7b1a751@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 20 Nov 2025 11:21:36 +0000
X-Gm-Features: AWmQ_bknpz8FJJonzf_St5zSPFDMr0k02Qpchp7EFZ42n9c20DmPXOAgT7c9Ghk
Message-ID: <CAJ9a7VgQO0_FuZj2CD0yAW10xefJNmqRC-0DxJTG9FJu6h-o6A@mail.gmail.com>
Subject: Re: [PATCH v5 10/13] coresight: Remove misleading definitions
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_032149_906350_BAC68041 
X-CRM114-Status: GOOD (  33.25  )
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

On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>
> ETM_OPT_* definitions duplicate the PMU format attributes that have
> always been published in sysfs. Hardcoding them here makes it misleading
> as to what the 'real' PMU API is and prevents attributes from being
> rearranged in the future.
>
> ETM4_CFG_BIT_* definitions just define what the Arm Architecture is
> which is not the responsibility of the kernel to do and doesn't scale to
> other registers or versions of ETM. It's not an actual software ABI/API
> and these definitions here mislead that it is.
>
> Any tools using the first ones would be broken anyway as they won't work
> when attributes are moved, so removing them is the right thing to do and
> will prompt a fix. Tools using the second ones can trivially redefine
> them locally.
>
> Perf also has its own copy of the headers so both of these things can be
> fixed up at a later date.
>

The perf version is used to reconstruct the control registers for etm3
/ etm4 to put into the trace metadata headers in the perf.data file
for the decoder to be intitialised correctly.

perf_event_attr::config uses the ETM_OPT_* values, used directly for
etm3 since they match the bit pattern in the etm3/ptm config register,
and remapped for etm4 from ETM_OPT_* to equivalent ETM4_CFG_BIT* for
the etm4 config register.

The reason we do this re-construction - rather than read registers as
we do for the other metadata - is that the register value is not set
at the point we are recording the metadata - it does not actually get
set until the etm is enabled, later in the perf process.

On this basis it would seem that any changing of the attribute bit
ordering has potential to break perf decode. Probably safe to remove
from this version of the file though, but overall, changing bit
meanings in the underlying variable may possibly need a fix in perf
and  potentially a breaking change for earlier versions of the tools.

That said, for this particular version of the header, since it appears
to no longer need the values due to earlier changes.

Reviewed-by: Mike Leach <mike.leach@linaro.org>

> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  include/linux/coresight-pmu.h | 24 ------------------------
>  1 file changed, 24 deletions(-)
>
> diff --git a/include/linux/coresight-pmu.h b/include/linux/coresight-pmu.h
> index 89b0ac0014b0..2e179abe472a 100644
> --- a/include/linux/coresight-pmu.h
> +++ b/include/linux/coresight-pmu.h
> @@ -21,30 +21,6 @@
>   */
>  #define CORESIGHT_LEGACY_CPU_TRACE_ID(cpu)  (0x10 + (cpu * 2))
>
> -/*
> - * Below are the definition of bit offsets for perf option, and works as
> - * arbitrary values for all ETM versions.
> - *
> - * Most of them are orignally from ETMv3.5/PTM's ETMCR config, therefore,
> - * ETMv3.5/PTM doesn't define ETMCR config bits with prefix "ETM3_" and
> - * directly use below macros as config bits.
> - */
> -#define ETM_OPT_BRANCH_BROADCAST 8
> -#define ETM_OPT_CYCACC         12
> -#define ETM_OPT_CTXTID         14
> -#define ETM_OPT_CTXTID2                15
> -#define ETM_OPT_TS             28
> -#define ETM_OPT_RETSTK         29
> -
> -/* ETMv4 CONFIGR programming bits for the ETM OPTs */
> -#define ETM4_CFG_BIT_BB         3
> -#define ETM4_CFG_BIT_CYCACC    4
> -#define ETM4_CFG_BIT_CTXTID    6
> -#define ETM4_CFG_BIT_VMID      7
> -#define ETM4_CFG_BIT_TS                11
> -#define ETM4_CFG_BIT_RETSTK    12
> -#define ETM4_CFG_BIT_VMID_OPT  15
> -
>  /*
>   * Interpretation of the PERF_RECORD_AUX_OUTPUT_HW_ID payload.
>   * Used to associate a CPU with the CoreSight Trace ID.
>
> --
> 2.34.1
>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

