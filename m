Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD2FC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 06:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LSO9pwN1muhnQIbpJa933nRtnrUUSNFdL7pIcWwb4o=; b=hstzaEq7M/LvJ4DSm+PHMDCWe0
	wnF2ccndlxRm4njK5F6FbQUJJoGRJdRXrsCVfeZav4KJ4TbbtGBfWX/eJv4REtGyO2wNKa1pH5+Mw
	6zElTIaBmMnILxPoBo/dV4bjS95lUUBuLB8LrO3yQoJSDGJWwC+bPo4O7BqymJKLH+hrCz9+g6xSz
	ST3HDhzrpvYOdWRRpKhvLtABBe2gOEpk+jOCPyuO+Xiq5GYPYy8NDAjdg2xMk4B9Z27K96O4d3wpp
	XlBy/TzanI7bH4JyYiXMa9PF9fEVyG1OcQakVUBhZFJzN86FrqsIoJCAf3AA7xf9FfXUItonIL/IU
	hHgL6TPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzLc-0000000EDY1-3JJ3;
	Tue, 07 Jul 2026 06:32:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzLY-0000000EDWj-3tPC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 06:32:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748fQB2449650
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Jul 2026 06:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9LSO9pwN1mu
	hnQIbpJa933nRtnrUUSNFdL7pIcWwb4o=; b=Olz3loFVejUIpEvp4bvY2LsmGFt
	13nhc5lzgxUJsx9Y/AbjJhjLPYj3hlkiRGsvAPHvJ0Mtn82LXGJ0pCKlkDvJJnSe
	uY3EczA0NZjxcaytS9uwKD3q3dyerQ6fi5Z/vG7izEXyQeBvWQinhQDvryAjlBfR
	a7bBu4vrYkGU9tDmQ1xOjj375JR+eYweawXO+DvT+0clE/6AsExjQlQZLlD1wDY5
	zXj/JMDMqxvuDRhFbyHhhOET4sBJKvaOvSUGna9Rr6xDNOFGoncaQ7SvkQf8/+oo
	UH1EB2T2fK0a5F4B5t/72eF/wmdbH1nSAZ0ceb4Y8WvKfO6OjNsjsc8jSTQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su70ggf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 06:31:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-384d033f7f5so320224a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 23:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783405915; x=1784010715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9LSO9pwN1muhnQIbpJa933nRtnrUUSNFdL7pIcWwb4o=;
        b=cLhiFyQqQi8bYxifpwCzd+Knjlhc9aitPhQb7odHb69DGJGl3VvdYkHAIXIvcgVSlV
         3/zv6U8rPNal4AVt5G52Bfvmc/PZPqipbpUze1mx3Z/rMJ63DAWcJpsjrf3bVuRl5Igl
         5fb8swkw6CvBi9Pbpgm8bJaDR1tD39kM13U/rvZ/zB50bzk5bCWj/1GMArY/DJ5by1PP
         BQ+F4qpx5gYJBZydyWyCzXc0b8pXA2JVFw0Q0/8AN1DptVBB3rceYHucTH2LL2aKi5n8
         0RlpoGEUtfAa5UFQl4QTCzFBifTNFqFlfhGNFQP5ek+CSTlbIfvsrwgiuI5NkoVIZfGG
         JQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783405915; x=1784010715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9LSO9pwN1muhnQIbpJa933nRtnrUUSNFdL7pIcWwb4o=;
        b=YqmFXrYKiSdIqxEpwlqP6WhCLRiud+MVI2e0KGE8UtlMZu+gYc20dHlfO9WgVJcBjD
         v1KPCJUTg8YB6deQf0pccq4XohSsFAKsXeAIjNeQbtvQ8TxoCNGk1ex+c6YYdxg8KjYY
         uW9/ZHz4rdRq1LenDlnYFNnDehnT+gPZvxOEZJV71vtLYYm/w+O/JalLJIS94BM975cS
         40b8J7q1gNc+eTSmkM8LlaEkZNZz6cmmHHUOCsKlBCI8xZx5Uey4KCH81IomQc45NUhn
         zVpKJeRrMQOGNXTFjxCn0V4R2iP97Ai92JmNGX97QUPpgZ+Hbz/nIwPkYhfmOj0QgX3z
         W4nA==
X-Forwarded-Encrypted: i=1; AHgh+Rq0MhUW1FgMF0+A+a4s5bqTjDTHnQYrI4NW3SV/JyYxUDNaVSEKWX3aN9a6+9/Vx9ZwwQPiEPnVE4qrKeHeYoLt@lists.infradead.org
X-Gm-Message-State: AOJu0YxWt9cEfBAUUW6wjGHQz/VBSns4E1hr5q1WllRwyBAeapFrcqQr
	c+whgE/UZG6iF4png6D4fw/oqNea7z4mBbx9Es8Ej10A7IyC8SJ+reSN19mTrQjGFs0Ud4FPLyY
	YxUabMuyPJqjbRwRksIhVXxdTYx1GkNZpun95hk+mgYdX1M79irnAaIJG4eFMXRRZCqwvyQmVGx
	JN5w==
X-Gm-Gg: AfdE7ck0fUq9h/ivTQW88eYL4hLRJC7bxO76ueFANKpa5Ch6DN8WiIcgtsJ1D8Pg1VQ
	hVBXrOJAZuZXtw3p6m2DjbwzNDo465+WJsOjqdJr7yHI3TATRBihy9/jMwlUxu26QXV/vnYa2bY
	xdMHoQ57TjnS20G8ExkTmotB7eei9j8T41m4sUe6A/p3Hv8Xa/p/4jNjw0isJbuiCNki0L5VcaU
	z76UXyqPOQE4BmogIT0ko0L3VlicbL0lp6MlEsd9HMdz5OIdhAFim8hfXPSHtaSZiHKWmuUD04k
	s0aBtgADRKBmrXrTiSDPvyoiv4YMimGiU8I04r6CsYQS1evGI38KYqqhDurfSOiS7jkZGBZP4R4
	WUXKIf0y68taXevZzUjWV5b4koNIfMrWDb/gdmAWLoZdHDtpYEEigZwlTKWZaS56GxNVxeHAZwt
	0MPhnUwKMDLmDdcr4LTbUxVgj+m5KrOshxyVypEWBuXQ==
X-Received: by 2002:a17:90a:c2d0:b0:383:5a16:bd67 with SMTP id 98e67ed59e1d1-387e2f3cfaemr1073914a91.4.1783405915268;
        Mon, 06 Jul 2026 23:31:55 -0700 (PDT)
X-Received: by 2002:a17:90a:c2d0:b0:383:5a16:bd67 with SMTP id 98e67ed59e1d1-387e2f3cfaemr1073885a91.4.1783405914795;
        Mon, 06 Jul 2026 23:31:54 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483ddd1sm4661550eec.9.2026.07.06.23.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:31:54 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
        lukasz.luba@arm.com, philip.radford@arm.com, brauner@kernel.org,
        david@kernel.org, souvik.chakravarty@arm.com, leitao@kernel.org,
        kas@kernel.org, puranjay@kernel.org, usama.arif@linux.dev,
        kernel-team@meta.com
Subject: Re: [PATCH v5 00/23] Introduce SCMI Telemetry support
Date: Tue,  7 Jul 2026 12:01:37 +0530
Message-ID: <20260707063137.3222972-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703123601.381275-1-cristian.marussi@arm.com>
References: <20260703123601.381275-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2MCBTYWx0ZWRfX7coQF95fj9KT
 T7R02gApnv51E4sYZIcrl1+Y+eUYeneTSeic7PMhMv4Ym1kSqcSf5ik0DYCwQsBGuA7P3xB/Ks7
 eMEtuB3tVDbjLh8tXvoz171LnWBUZnDxVhd6fzgbNAnpf6gAVyb0fl+JxQw2zVPGfqsTS6Ad8L0
 5aHJo1MSh89JlBhDuljskbPhAtJCG4WfaqAjWEg+rRJGSzSUjyuz9mjqpvbslUsvlyQBbupbWK2
 jCT13J4k+w1MnQBSjYLhaTGoesjSWwA8njIqO97rKvUKKavI3LJi8BkJzzrP8S8WUybYxbzmmpg
 0TPqFSwfabDIxcMQQjhzVGxxQ6me3JRr24XAwbeh+WT5syflmVOBQ2U1iq12DKQsD91gyFBVelP
 mcEUGK/RqI1xDrPfY9sgFQWS0HSrQhtF/FO0ltQ+R0zhVO+GkIgzRotsyHhX2seZi8HlAreATka
 1LPiGfOEPfEhCFC/tww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2MCBTYWx0ZWRfX7t+87fGZTDYZ
 uqgFbDIwfTDESpw9Mqx0PeA/kg0WMFpSFoQHaCjk+U/VQFxxqqvPQfK+5e26d71kzXk4Ph0pklN
 yWxIrGi6Vl72BkdObmoh7oAzRh3f/zc=
X-Proofpoint-GUID: 6JyQynsu2tKcNbc8fyZ9--64yHHVcqvF
X-Proofpoint-ORIG-GUID: 6JyQynsu2tKcNbc8fyZ9--64yHHVcqvF
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4c9d5c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=UIZCFarK5jCvrK1TzyMA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1011
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_233158_560845_7CE71252 
X-CRM114-Status: GOOD (  22.43  )
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

Hi Cristian,

Thanks for posting this. I think the direction of not forcing these
Telemetry Data Events into hwmon/IIO/perf prematurely is the right one.
The cover letter explains the core problem well: most DE IDs are
platform-defined, and without external metadata the kernel cannot reliably
know whether a DE is a thermal sensor, a performance counter, a power value,
or something entirely platform-specific.

That said, I think the current layering is still too SCMI-shaped for the
ABI it is trying to introduce.

The thing being exposed here is not only "SCMI Telemetry"; it is a more
general kernel concept of telemetry:

  - enumerate provider-specific data/event descriptors
  - expose capabilities, units, data format and topology/grouping metadata
  - configure collection rate and collection mode where supported
  - collect samples with timestamp/freshness/validity information
  - track generation/state changes
  - optionally expose provider-private raw backing storage for debugging

SCMI is one provider of that model. It happens to transport the data through
SCMI v4.0 concepts such as DEs, groups, SHMTIs and TDCF. But another firmware
or control-plane specification could show up later with the same broad
telemetry model and a different wire format. Call it XXMI or YYMI: the
protocol mechanics would differ, but the kernel consumers should not have to
learn a new in-kernel and userspace ABI for each one.

The common ABI should therefore avoid treating the DE numeric namespace or
the wire/storage format as the abstraction. The useful common contract is
closer to:

  - what is being measured: component/type/instance/name;
  - how to interpret it: unit, exponent/rate unit, data width and signedness;
  - how it behaves: instantaneous, accumulating, average, state/counter, etc.;
  - how it is controlled: individual event vs group-wide collection;
  - how fresh it is: timestamp, sequence/generation and validity/error flags.

So I would strongly consider inserting a generic telemetry layer above SCMI,
with SCMI registering as a telemetry provider rather than owning the stable
userspace ABI directly.

Roughly:

  drivers/telemetry/
      provider registration
      descriptor/sample/config abstractions
      generation tracking and poll support
      common userspace ABI

  drivers/firmware/arm_scmi/telemetry.c
      SCMI protocol implementation
      TDCF/SHMTI/notification parsing
      translation into generic telemetry descriptors/samples

  optional provider-private raw/debug path
      SCMI SHMTI mmap or dumps, if kept, behind explicit privilege/debug
      policy rather than as the baseline telemetry ABI

With that shape, future in-kernel consumers could bind to generic telemetry
objects and capabilities instead of SCMI internals. Architected/well-known
DEs could later grow adapters into hwmon/IIO/perf where the semantics are
clear, while platform-specific DEs remain available through the generic
telemetry interface plus userspace metadata.

This would also help avoid making the SCMI protocol's internal resource
storage part of the ABI. Right now the public protocol header exposes
structures such as scmi_telemetry_res_info, scmi_telemetry_group and
scmi_telemetry_de, and the chardev indexes those objects directly. That feels
too tightly coupled for something that may need more consumers later. I would
prefer copy-out or iterator-style provider ops instead, for example:

  info_get()
  de_count_get()
  de_info_get()
  group_info_get()
  intervals_get()
  collection_set()
  collection_get()
  sample_read()
  reset()

where the backing arrays, xarrays, lazy enumeration, SHMTI mappings and TDCF
parsing remain private to the SCMI provider.

The sample side probably needs an explicit common result contract too. A
sample is not only an integer value: it may have optional timestamping,
provider data width, stale/not-yet-valid state, partial collection failures,
hardware-fault indications, and a sequence/generation value that lets
userspace detect races against reconfiguration or shared-memory updates. Those
details can still be backed by SCMI-specific status codes and TDCF parsing
internally, but I think the stable ABI should expose them in provider-neutral
terms.

I would also be careful about freezing the raw SHMTI mmap part as a baseline
ABI. It is useful for bring-up and high-performance tooling, but it exposes
firmware-owned shared memory layout and TDCF parsing rules directly to
userspace. If this stays, I think it should be clearly separated as a
privileged/debug/raw provider facility, with a precise mmap contract:

  - required mmap length
  - vm_pgoff semantics
  - page alignment
  - VMA flags
  - cache/coherency expectations
  - lifetime across reset/remove/reprobe
  - required capability, if any

Even outside the raw mmap case, telemetry can be a sensitive high-rate view
of system behavior. The ABI should make access policy explicit: who can
enumerate, who can read, who can change collection state, and whether
production systems can restrict sampling granularity or intervals
independently of what firmware advertises.

For the stable telemetry ABI, I would start smaller: descriptor enumeration,
sample reads with validity metadata, optional group-aware configuration, and a
generation counter/poll mechanism so userspace can detect reconfiguration or
partial re-enumeration races.

One other point related to this layering: configuration appears to be global
to the SCMI instance. Any process opening /dev/scmi/tlm_N can change
collection mode, sampling interval, DE enablement and timestamp state for
other users. That may be OK, but it should be an explicit policy decision.
A generic telemetry layer could make the model clearer: multi-reader with a
privileged/single writer, or fully shared global controls, with instance-level
locking and generation updates after each visible state change.

So my high-level suggestion for v6 would be:

  1. define the generic telemetry provider/consumer model first;
  2. make SCMI Telemetry one provider of that model;
  3. keep SCMI/TDCF/SHMTI details below the provider boundary;
  4. keep raw SHMTI access separate from the stable ABI;
  5. define common sample validity/freshness/error semantics;
  6. add generation/poll semantics to the common ABI;
  7. make lifetime, access policy and configuration concurrency explicit.

I do not think this invalidates the protocol work in the series. Most of the
SCMI parsing and resource discovery can still be the provider implementation.
The main question is where the stable kernel/userspace contract should sit.
My preference would be that it sits at "telemetry", not at "SCMI Telemetry",
so that SCMI, and any future XXMI/YYMI-style provider, can share one consumer
interface.

Thanks,

