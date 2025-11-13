Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8805ECD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 17:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71lVmJnPUGpleZ4mKAV+ATu2lJgo6JW7DPtl5X40bXo=; b=z2HoQxrVujSg+sa9vfYrXel+tW
	qhBa1kxCE8hRTNijQY4E/PO0rRjk5TPlozUfZOlRemnj6B5U6FhNUidN9YYW6oh3YGhvlrATp+Hb/
	R4KycXeWo3RUj3TabOCeU7CuGs3X8kCtrnULLaQwKSvrMuAK/GNUqF8Y1ywUaVtAI8gzcr3qsE9ma
	0KftG3MuurT7SXX7pOseZy8+zfjqSHpZfkFrD7nSgmXxb5wVNyzUxs7DOLK7JH78fYTK+Q47b9ipi
	kMTIUQe3Z+xKz0HLgtfikcyAEjih6y9tF4TDXR2lo1C46PEWBuL2QqVn+W451hjZRri8Cc/JPNZLH
	dAbqQPlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJahx-0000000ApzJ-1hIk;
	Thu, 13 Nov 2025 17:02:05 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJahv-0000000Apyf-0F7O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 17:02:04 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-295c64cb951so241625ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 09:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763053320; x=1763658120; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71lVmJnPUGpleZ4mKAV+ATu2lJgo6JW7DPtl5X40bXo=;
        b=JmFS6+StkK9qIr0o6KGYq6lnHTT+rFqHz1B3cPl5IS6SktserwM/OW7e5bEAdRO2iF
         0pR/4k2v7WdxNAPCL1YguQMngJe2RgdASIhHVMvS9InHtXM2koGaIXdsctT1ypq8YDKl
         pcWQiHLUkayX4VoL4lSVACfUz1x/peNJObyyIIMjqyjWQN7WjU6ecqVGt0kZEaT8jPZJ
         UaZST2/pgsgFyU2tswYDiArxl7+JO1WpwuV5E4m51vucmqX6KVXTJufCV+X7RrVDdHQJ
         PfTG6OQVfeMAinhpEFMawFLREJpcTHXzSdDEWnB/eKk6tKyocIS2gAqhhCndYpmVWN5X
         aMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763053320; x=1763658120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=71lVmJnPUGpleZ4mKAV+ATu2lJgo6JW7DPtl5X40bXo=;
        b=djFeRzkjj1t5lC6bcsF/xAq9z3mS2gchHIbTO0HnQwcXQTeVqHQlwg67TVknuAw8vC
         gWI6hjg9eKlGYflecYicUcfk8B9klBhMIBo9wRwRxpWopCHISQVuTqt4nXBGDcJoUTmT
         6axn+v5QVqxkO03PNylw3UWJkM6XEkBmwWKNqdkRF+uT4bjzNcfzDlFFPeDAnVRUBbPp
         L8by/+t75J/VV1a7COZ223TaW9wUE0XMnIb9Ceaio/9eDQIfgj3viPq/au+KkcsKHlkT
         4INVe2P50dNqMdEG5LL2jsQhrUNOPhVQiPsVvpjz2TmuIluxq0FRa707dIBqd2qWFzmN
         RsMA==
X-Forwarded-Encrypted: i=1; AJvYcCX8L+oMt9M6nxW31G1Ib28ivMOrnl6dMiDIF4pN8+HcdQdR4IikW4S2BEUfE85I3CpG4aMrXs4+yhgtuYrhQYXA@lists.infradead.org
X-Gm-Message-State: AOJu0YyDHXfU2JsUZEXgm0Aoy2tm53CzT9FKB/pad0dKbq/hYuxJWnnf
	xiGW+qUapJ7EWbQDu2dVQDChUzZ0i646lx4ZTkeBCRKU/x0SPiiuRHeiG4gZ79Hku+OFKVRDNCw
	/C22xyiZoctBbw5K+FXXfIY0DNLPTWdvL15/DgASc
X-Gm-Gg: ASbGncu/EKq9zSl0MrBkBHbcOHkJKnossF7q+tJXEB8aPDmGrzvOEq2mt5emormG+8I
	jNhhRsYQin58h0CW1tSwOA5zE9H0f8WK7423J9IhTTAVfgIjvEorACBRSuiw2nLvxLGc380Hoq0
	dRGdeXL+6r8ONNRIkxa9gnE3SBwKFdbpLsEaB21XH9zIdV/BMiB3HIscKWQn7twCLsTExGbz7Ke
	aGMA7uF2VdXbUEdP1agkRnocRJt7e4nk3oxe+0If0mwJYdluZWduMcZEOxWAUijnujxEvhK8yss
	gNeJO1t7s+I1O6fimkR+HM4kvUFd73qydxVQU5+QCzPcpsM=
X-Google-Smtp-Source: AGHT+IGPRC+CQUBmBgdB89n61eAw0eI7sbJGyZXKLvUJxxPGOF5tt6zXBQxQuv/YyuQenUu73z2Yj6aCC42mzV1WO3c=
X-Received: by 2002:a17:903:1c6:b0:290:d7fd:6297 with SMTP id
 d9443c01a7336-2985b7b9694mr6318995ad.2.1763053319900; Thu, 13 Nov 2025
 09:01:59 -0800 (PST)
MIME-Version: 1.0
References: <20251112-perf_support_arm_spev1-3-v3-0-e63c9829f9d9@arm.com>
In-Reply-To: <20251112-perf_support_arm_spev1-3-v3-0-e63c9829f9d9@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 13 Nov 2025 09:01:47 -0800
X-Gm-Features: AWmQ_bmZpgw7lXxzv2FCuAKiN2hVXWb-V-IiXd3o9kNnnrnUCNcZLuky19EZHhk
Message-ID: <CAP-5=fXiiWRDPzONNNZQZc4QOBQoz=kRnJq77on5r4w9aDx-XA@mail.gmail.com>
Subject: Re: [PATCH v3 00/25] perf arm_spe: Extend operations
To: Leo Yan <leo.yan@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_090203_124099_25056B12 
X-CRM114-Status: GOOD (  21.35  )
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

On Wed, Nov 12, 2025 at 10:24=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> This series enhances tooling to support new operations:
>
>   - Support for MTE tag since Arm SPE v1.3;
>   - Support for Advanced SIMD extension and SVE operations;
>   - Support memcpy, memset and GCS operations;
>   - Support extended operations for atomic, Acquire/Release and
>     Exclusive instructions.
>   - Enhance the data source for associated info, like floating-point,
>     conditional, data processing, etc.
>
> This series is divided into three parts:
>
>   Patches 01 ~ 06: Support raw dump for new operations;
>   Patches 07 ~ 17: Export the operation info into records, so that the
>                    information can be later consumed by samples.
>   Patches 18 ~ 25: Set the operation info into sample's data source and
>                    SIMD flag, and updated the document.
>
> This patch series is tested on FVP for native parsing and x86_64 for
> cross parsing.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> ---
> Changes in v3:
> - Rebased on the latest perf-tools-next branch.
> - Link to v2: https://lore.kernel.org/r/20251017-perf_support_arm_spev1-3=
-v2-0-2d41e4746e1b@arm.com
>
> Changes in v2:
> - Refined to use enums for 2nd operation types. (James)
> - Avoided adjustment bit positions for operations. (James)
> - Used enum for extended operation type in uapi header and defined
>   individual bit field for operation details in uaip header. (James)
> - Refined SIMD flag definitions. (James)
> - Extracted a separate commit for updating tool's header. (James/Arnaldo)
> - Minor improvement for printing memory events.
> - Rebased on the latest perf-tools-next branch.
> - Link to v1: https://lore.kernel.org/r/20250929-perf_support_arm_spev1-3=
-v1-0-1150b3c83857@arm.com
>
> ---
> Leo Yan (25):
>       perf arm_spe: Fix memset subclass in operation
>       perf arm_spe: Unify operation naming
>       perf arm_spe: Decode GCS operation
>       perf arm_spe: Rename SPE_OP_PKT_IS_OTHER_SVE_OP macro
>       perf arm_spe: Decode ASE and FP fields in other operation
>       perf arm_spe: Decode SME data processing packet
>       perf arm_spe: Remove unused operation types
>       perf arm_spe: Consolidate operation types
>       perf arm_spe: Introduce data processing macro for SVE operations
>       perf arm_spe: Report register access in record
>       perf arm_spe: Report MTE allocation tag in record
>       perf arm_spe: Report extended memory operations in records
>       perf arm_spe: Report associated info for SVE / SME operations
>       perf arm_spe: Report memset and memcpy in records
>       perf arm_spe: Report GCS in record
>       perf arm_spe: Expose SIMD information in other operations
>       perf arm_spe: Synthesize memory samples for SIMD operations
>       perf/uapi: Extend data source fields
>       tools/include: Sync uapi/linux/perf.h with the kernel sources
>       perf mem: Print extended fields
>       perf arm_spe: Set extended fields in data source
>       perf sort: Support sort ASE and SME
>       perf sort: Sort disabled and full predicated flags
>       perf report: Update document for SIMD flags
>       perf arm_spe: Improve SIMD flags setting
>
>  include/uapi/linux/perf_event.h                    | 32 ++++++++-
>  tools/include/uapi/linux/perf_event.h              | 32 ++++++++-
>  tools/perf/Documentation/perf-report.txt           |  5 +-
>  tools/perf/util/arm-spe-decoder/arm-spe-decoder.c  | 56 ++++++++++++++--
>  tools/perf/util/arm-spe-decoder/arm-spe-decoder.h  | 61 +++++++++-------=
-
>  .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 53 ++++++++-------
>  .../util/arm-spe-decoder/arm-spe-pkt-decoder.h     | 40 +++++++----
>  tools/perf/util/arm-spe.c                          | 77 ++++++++++++++++=
+-----
>  tools/perf/util/mem-events.c                       | 66 ++++++++++++++++=
+--
>  tools/perf/util/sample.h                           | 21 ++++--
>  tools/perf/util/sort.c                             | 21 ++++--
>  11 files changed, 359 insertions(+), 105 deletions(-)
> ---
> base-commit: da8fcfba0854dbe0b0eca465d35620c9cf4c89c1
> change-id: 20250820-perf_support_arm_spev1-3-b6efd6fc77b2
>
> Best regards,
> --
> Leo Yan <leo.yan@arm.com>
>

