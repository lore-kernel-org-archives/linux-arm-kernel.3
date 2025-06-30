Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757CFC8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 16:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8pHTrUEcGe6WdpAUlyhQvIpo4p8iXNvnGE/h+atsss=; b=kwUVcXLEpNwchhPIGYSO9NjdH6
	QDBt1ZePD77KVNtBdbk3V8PP5p+YKgU2pOwHIEVQ4Bk9Ujdvge5eji2x3cI1RZMQvl46Stm54RW7Z
	ADQd/iPJAu5Ks8WV8C2pWQWwvBxT5S/XKGdGcHRCoHXWkUe8Hvfxe23sQUHTNOcrZOZdh1GaqOCVe
	yLZIoF6rkdIlEEwEjbCDMfcELEaRwzwh6/C1vB/fzYblklHKOlM3Dij0kk5Tve148c4SoVvXz1/ZU
	zjR0fq2LmoYp8XUZFCvdRuVZn8PQ5So+xmGkv/SCzJvy6m9OjvvtSVci6at+jzr2LT4ddGenOzr0s
	MsVmoXGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHAk-00000002rnE-3SeK;
	Mon, 30 Jun 2025 16:15:58 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWGak-00000002mKk-30CQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 15:38:48 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3ddc99e0b77so489355ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 08:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751297926; x=1751902726; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8pHTrUEcGe6WdpAUlyhQvIpo4p8iXNvnGE/h+atsss=;
        b=UtBQ5JLYryHoibRiYsqpiSzT4arFXmgyUD5g3+fPGFgoycRCvyNmf3RwRuERp6hUPs
         0l+/Q1uyXHX0PkXus5EGkS+hH6BqJ9gGa+22c+VRJR/YsuDVi24PYOQl7Oedv4HqS25p
         aUqQ6778eojwAfKd/2Xvt1s6ZXXKeejKz3jDTW7jVB2rI0eHcAB4w5uVE6rkoTtobZFX
         oetRrqozwaO5ss8hDUlLNvmqoa7Fx5SZ6Jq2QkBUUemCAR2tgGdl5RT3bGyuC6R0PUZl
         y9WTbHPoE+zY3ivvLBQRVCBOGxbdvS6cPInTnUscEb9shNPljpA2mUx7SoZyCJOlpAw4
         3Cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297926; x=1751902726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8pHTrUEcGe6WdpAUlyhQvIpo4p8iXNvnGE/h+atsss=;
        b=LYWt+iwMvjeJLuPSjJdR/ozejD1hjN9t2eDU9PC0f98fiFu8Q5XRpTlBA+aL55C55k
         I4C3dXIfT1P3zA+yKu0ohu2uCqd+40e3SXT6CU2EdOUrNDBKC57JfUQc5Ipbffbxnc3j
         09Gh8Hy6es0hY5tNd+MT503UtSnm7wJseiWoSEPzAn0Zi3kflNn+sxU/HRglPSgxbF9L
         6NIArHQCimXdbAwHUtk7tUi1NcRYIXpqzqOjRPqQ74EFfmazNg7ZT1JGS7xC9pjWFqb2
         Pjh/bV3VXL7WSmv8GuXuY46xTVELxBf78AOu/MxKPMPdXcx2xiHDPBRi84db+BjQdKxY
         iN7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPhHeGbq7bSAzg3NUyz5FkyiGQX28apyDw6xd8bGCjYpyGtQU2oeWCfbSQ6qKYBl88We8dzZ1hjcRteI4WulLF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+ASJoZLmOIzef/DmemtG34F/NYHx98pEvUmDKy+4vpHVIQWqG
	G+LiuTxDuiA2IWSL+acRrMVQQC7XfXsy6bGwA/6OPvbP87Rs0d3o5ZoBzQlkfXVV1+xBf1wjTTl
	wufvlHi/tj93vxAHjChVzOlVgE/DWV+U6KLh6tgOk
X-Gm-Gg: ASbGnctLDUMqpaaIz/cEkRO81YRO18pVntT8rp9w2rg2wISIzvLbh7ZbRSjahskP3u4
	Deg0A9I/EZD0og0poZw8z32JvgIWv+Xo9V8SrcDC/raVKhOUrNoVLtOo4PMhs0t3f5L746cil6q
	OMe0K8AFvb8VF1k5SKAejn5uI+htzPOeav8lJ8gAWksFvAFZGMn2Kk29K7irnc8Im6hqrqJ2Qq7
	44unmrLJw==
X-Google-Smtp-Source: AGHT+IHWAVAMI8QT9eGJcy1Dz/MUqM4kKkgHbIFGRnRbpDP3mlZrGKmhK69cnZjnige15KSJimxL8+8uvBWPiDVJgMM=
X-Received: by 2002:a92:c265:0:b0:3dd:d288:eead with SMTP id
 e9e14a558f8ab-3df5587f1f2mr7193765ab.18.1751297925487; Mon, 30 Jun 2025
 08:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org> <20250605-james-perf-feat_spe_eft-v3-10-71b0c9f98093@linaro.org>
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-10-71b0c9f98093@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 30 Jun 2025 08:38:33 -0700
X-Gm-Features: Ac12FXz-XNRDh5SWs9KqIAss_dxekSdRnzTpiZe4QDr_HQFGVYwsbdMlOQVPWnw
Message-ID: <CAP-5=fU24cknDdD8Lxfshqei7Twf9zRA6uOrQNJqvAVyrzgi-g@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] perf docs: arm-spe: Document new SPE filtering features
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_083846_790957_423D0E5B 
X-CRM114-Status: GOOD (  34.92  )
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

On Thu, Jun 5, 2025 at 3:50=E2=80=AFAM James Clark <james.clark@linaro.org>=
 wrote:
>
> FEAT_SPE_EFT and FEAT_SPE_FDS etc have new user facing format attributes
> so document them. Also document existing 'event_filter' bits that were
> missing from the doc and the fact that latency values are stored in the
> weight field.
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/Documentation/perf-arm-spe.txt | 97 +++++++++++++++++++++++++=
+++---
>  1 file changed, 88 insertions(+), 9 deletions(-)
>
> diff --git a/tools/perf/Documentation/perf-arm-spe.txt b/tools/perf/Docum=
entation/perf-arm-spe.txt
> index 37afade4f1b2..4092b53b58d2 100644
> --- a/tools/perf/Documentation/perf-arm-spe.txt
> +++ b/tools/perf/Documentation/perf-arm-spe.txt
> @@ -141,27 +141,65 @@ Config parameters
>  These are placed between the // in the event and comma separated. For ex=
ample '-e
>  arm_spe/load_filter=3D1,min_latency=3D10/'
>
> -  branch_filter=3D1     - collect branches only (PMSFCR.B)
> -  event_filter=3D<mask> - filter on specific events (PMSEVFR) - see bitf=
ield description below
> +  event_filter=3D<mask> - logical AND filter on specific events (PMSEVFR=
) - see bitfield description below
> +  inv_event_filter=3D<mask> - logical OR to filter out specific events (=
PMSNEVFR, FEAT_SPEv1p2) - see bitfield description below
>    jitter=3D1            - use jitter to avoid resonance when sampling (P=
MSIRR.RND)
> -  load_filter=3D1       - collect loads only (PMSFCR.LD)
>    min_latency=3D<n>     - collect only samples with this latency or high=
er* (PMSLATFR)
>    pa_enable=3D1         - collect physical address (as well as VA) of lo=
ads/stores (PMSCR.PA) - requires privilege
>    pct_enable=3D1        - collect physical timestamp instead of virtual =
timestamp (PMSCR.PCT) - requires privilege
> -  store_filter=3D1      - collect stores only (PMSFCR.ST)
>    ts_enable=3D1         - enable timestamping with value of generic time=
r (PMSCR.TS)
>    discard=3D1           - enable SPE PMU events but don't collect sample=
 data - see 'Discard mode' (PMBLIMITR.FM =3D DISCARD)
> +  data_src_filter=3D<mask> - mask to filter from 0-63 possible data sour=
ces (PMSDSFR, FEAT_SPE_FDS) - See 'Data source filtering'
>
>  +++*+++ Latency is the total latency from the point at which sampling st=
arted on that instruction, rather
>  than only the execution latency.
>
> -Only some events can be filtered on; these include:
> -
> -  bit 1     - instruction retired (i.e. omit speculative instructions)
> +Only some events can be filtered on using 'event_filter' bits. The overa=
ll
> +filter is the logical AND of these bits, for example if bits 3 and 5 are=
 set
> +only samples that have both 'L1D cache refill' AND 'TLB walk' are record=
ed. When
> +FEAT_SPEv1p2 is implemented 'inv_event_filter' can also be used to exclu=
de
> +events that have any (OR) of the filter's bits set. For example setting =
bits 3
> +and 5 in 'inv_event_filter' will exclude any events that are either L1D =
cache
> +refill OR TLB walk. If the same bit is set in both filters it's UNPREDIC=
TABLE
> +whether the sample is included or excluded. Filter bits for both event_f=
ilter
> +and inv_event_filter are:
> +
> +  bit 1     - Instruction retired (i.e. omit speculative instructions)
> +  bit 2     - L1D access (FEAT_SPEv1p4)
>    bit 3     - L1D refill
> +  bit 4     - TLB access (FEAT_SPEv1p4)
>    bit 5     - TLB refill
> -  bit 7     - mispredict
> -  bit 11    - misaligned access
> +  bit 6     - Not taken event (FEAT_SPEv1p2)
> +  bit 7     - Mispredict
> +  bit 8     - Last level cache access (FEAT_SPEv1p4)
> +  bit 9     - Last level cache miss (FEAT_SPEv1p4)
> +  bit 10    - Remote access (FEAT_SPEv1p4)
> +  bit 11    - Misaligned access (FEAT_SPEv1p1)
> +  bit 12-15 - IMPLEMENTATION DEFINED events (when implemented)
> +  bit 16    - Transaction (FEAT_TME)
> +  bit 17    - Partial or empty SME or SVE predicate (FEAT_SPEv1p1)
> +  bit 18    - Empty SME or SVE predicate (FEAT_SPEv1p1)
> +  bit 19    - L2D access (FEAT_SPEv1p4)
> +  bit 20    - L2D miss (FEAT_SPEv1p4)
> +  bit 21    - Cache data modified (FEAT_SPEv1p4)
> +  bit 22    - Recently fetched (FEAT_SPEv1p4)
> +  bit 23    - Data snooped (FEAT_SPEv1p4)
> +  bit 24    - Streaming SVE mode event (when FEAT_SPE_SME is implemented=
), or
> +              IMPLEMENTATION DEFINED event 24 (when implemented, only ve=
rsions
> +              less than FEAT_SPEv1p4)
> +  bit 25    - SMCU or external coprocessor operation event when FEAT_SPE=
_SME is
> +              implemented, or IMPLEMENTATION DEFINED event 25 (when impl=
emented,
> +              only versions less than FEAT_SPEv1p4)
> +  bit 26-31 - IMPLEMENTATION DEFINED events (only versions less than FEA=
T_SPEv1p4)
> +  bit 48-63 - IMPLEMENTATION DEFINED events (when implemented)
> +
> +For IMPLEMENTATION DEFINED bits, refer to the CPU TRM if these bits are
> +implemented.
> +
> +The driver will reject events if requested filter bits require unimpleme=
nted SPE
> +versions, but will not reject filter bits for unimplemented IMPDEF bits =
or when
> +their related feature is not present (e.g. SME). For example, if FEAT_SP=
Ev1p2 is
> +not implemented, filtering on "Not taken event" (bit 6) will be rejected=
.
>
>  So to sample just retired instructions:
>
> @@ -171,6 +209,31 @@ or just mispredicted branches:
>
>    perf record -e arm_spe/event_filter=3D0x80/ -- ./mybench
>
> +When set, the following filters can be used to select samples that match=
 any of
> +the operation types (OR filtering). If only one is set then only samples=
 of that
> +type are collected:
> +
> +  branch_filter=3D1     - Collect branches (PMSFCR.B)
> +  load_filter=3D1       - Collect loads (PMSFCR.LD)
> +  store_filter=3D1      - Collect stores (PMSFCR.ST)
> +
> +When extended filtering is supported (FEAT_SPE_EFT), SIMD and float
> +pointer operations can also be selected:
> +
> +  simd_filter=3D1         - Collect SIMD loads, stores and operations (P=
MSFCR.SIMD)
> +  float_filter=3D1        - Collect floating point loads, stores and ope=
rations (PMSFCR.FP)
> +
> +When extended filtering is supported (FEAT_SPE_EFT), operation type filt=
ers can
> +be changed to AND using _mask fields. For example samples could be selec=
ted if
> +they are store AND SIMD by setting 'store_filter=3D1,simd_filter=3D1,
> +store_filter_mask=3D1,simd_filter_mask=3D1'. The new masks are as follow=
s:
> +
> +  branch_filter_mask=3D1  - Change branch filter behavior from OR to AND=
 (PMSFCR.Bm)
> +  load_filter_mask=3D1    - Change load filter behavior from OR to AND (=
PMSFCR.LDm)
> +  store_filter_mask=3D1   - Change store filter behavior from OR to AND =
(PMSFCR.STm)
> +  simd_filter_mask=3D1    - Change SIMD filter behavior from OR to AND (=
PMSFCR.SIMDm)
> +  float_filter_mask=3D1   - Change floating point filter behavior from O=
R to AND (PMSFCR.FPm)
> +
>  Viewing the data
>  ~~~~~~~~~~~~~~~~~
>
> @@ -204,6 +267,10 @@ Memory access details are also stored on the samples=
 and this can be viewed with
>
>    perf report --mem-mode
>
> +The latency value from the SPE sample is stored in the 'weight' field of=
 the
> +Perf samples and can be displayed in Perf script and report outputs by e=
nabling
> +its display from the command line.
> +
>  Common errors
>  ~~~~~~~~~~~~~
>
> @@ -247,6 +314,18 @@ to minimize output. Then run perf stat:
>    perf record -e arm_spe/discard/ -a -N -B --no-bpf-event -o - > /dev/nu=
ll &
>    perf stat -e SAMPLE_FEED_LD
>
> +Data source filtering
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +When FEAT_SPE_FDS is present, 'data_src_filter' can be used as a mask to=
 filter
> +on a subset (0 - 63) of possible data source IDs. The full range of data=
 sources
> +is 0 - 65535 although these are unlikely to be used in practice. Data so=
urces
> +are IMPDEF so refer to the TRM for the mappings. Each bit N of the filte=
r maps
> +to data source N. The filter is an OR of all the bits, so for example se=
tting
> +bits 0 and 3 includes only packets from data sources 0 OR 3. When
> +'data_src_filter' is set to 0 data source filtering is disabled and all =
data
> +sources are included.
> +
>  SEE ALSO
>  --------
>
>
> --
> 2.34.1
>

