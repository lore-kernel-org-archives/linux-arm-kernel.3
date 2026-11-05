Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425BF606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oKV36PwB;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cfoa0iQ/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lMUN+xrYwfUilVGUkr08RcCdBhNpdwdDbuRbBKh66bI=; b=oKV36PwBoZrehR
	zNxhULY/XupWv7yD0cq8/AjcqsmLn1KBKZGU53QsWJkqZrv2cJALR9MV6Cep3zZ6Narly4In9st+P
	VrY5HcCjOBxPMPdeRc8Q/JgcFlNjiwClxZkkBxZyiFkl5mJNAhs8z9nW7kHVQ8TmHG+Qjz8vV/ppK
	43ZrRkpHmHPYMQ3dxqMgP92UKIowduaRMeYT02VhYPLeFtMR728Q686g0Xutgy9Dg6ofm3AooYdmN
	kRoeVfuU0LWXqEvpNr/X5U5qh0prgacitWyIr+vi8wx5923IZIHXvI0ZvDJXwXAP+GigU8Q75AfaR
	EhDukbif/LydKbyfWhFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyrm-00000009LNi-302H;
	Thu, 05 Nov 2026 14:55:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyrk-00000009LMr-0KWi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:55:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33039168F;
	Thu,  5 Nov 2026 06:54:56 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0DBE3F632;
	Thu,  5 Nov 2026 06:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793890499; bh=BHV2xnfEREO1PuiaY/msWQZl+g5su3hEZwIcHuKszOE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cfoa0iQ/wLbaM/wUFNF6yhe0347tlMbx+10T4E3cFVvKkbcECt68p2+g3KvnuS1L1
	 TUbxpPXPqrpdZ3WrgfpBlir0EXoT9q32sIUqUAMRFb90dLbvNIgUVbL+Hq+QEyfTYL
	 FjNFds86xP7/OanwfWPmYNF1BOp1/YxJO9lc8o1A=
Message-ID: <a876b77b-c4e4-4019-868a-af12c93f441f@arm.com>
Date: Thu, 5 Nov 2026 14:54:55 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] perf: arm_pmuv3: Add pmuv3_event_implemented()
To: Amir Ayupov <aaupov@fb.com>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Daniel Pereira <danielmaraboo@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1792907332.git.aaupov@fb.com>
 <cover.1792989860.git.aaupov@fb.com>
 <23ffe461b8d7b04f78118154dfc9ea1d2a14978a.1792989860.git.aaupov@fb.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <23ffe461b8d7b04f78118154dfc9ea1d2a14978a.1792989860.git.aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_065500_240803_B03F9A5F 
X-CRM114-Status: GOOD (  24.69  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26/10/2026 05:48, Amir Ayupov wrote:
> Drivers outside the PMU driver may need to know whether the local CPU's
> PMU implements a common event before relying on it, for example a trace
> unit driver checking that the PMU counts its external outputs as
> TRCEXTOUTn.
> 
> Add pmuv3_event_implemented() to the arm64 asm/arm_pmuv3.h, next to
> read_pmceid0() and read_pmceid1(). It reads PMCEID0/1 on the calling CPU:
> events 0x0000-0x003f are reported in bits [31:0], and the common events
> from ARMV8_PMUV3_EXT_COMMON_EVENT_BASE in bits [63:32] from PMUv3p1. Move
> ARMV8_PMUV3_EXT_COMMON_EVENT_BASE next to the event numbers in
> linux/perf/arm_pmuv3.h so it is available without CONFIG_ARM_PMU.
> 
> Suggested-by: James Clark <james.clark@linaro.org>
> Assisted-by: Devmate:Opus-5.5
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>   arch/arm64/include/asm/arm_pmuv3.h | 19 +++++++++++++++++++
>   include/linux/perf/arm_pmu.h       |  1 -
>   include/linux/perf/arm_pmuv3.h     |  3 +++
>   3 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
> index 8a777dec8d88a..acd62c4f16743 100644
> --- a/arch/arm64/include/asm/arm_pmuv3.h
> +++ b/arch/arm64/include/asm/arm_pmuv3.h
> @@ -173,6 +173,25 @@ static inline bool pmuv3_implemented(int pmuver)
>   		 pmuver == ID_AA64DFR0_EL1_PMUVer_NI);
>   }
>   
> +/*
> + * Whether this CPU's PMU implements a common event, as reported by
> + * PMCEID{0,1}: events 0x0000-0x003f in bits [31:0], and from PMUv3p1 events
> + * 0x4000-0x403f in bits [63:32], which read as zero before PMUv3p1.
> + * Must run on the CPU whose PMU is queried.
> + */
> +static inline bool pmuv3_event_implemented(u16 event)
> +{
> +	bool ext = event >= ARMV8_PMUV3_EXT_COMMON_EVENT_BASE;
> +	u16 id = ext ? event - ARMV8_PMUV3_EXT_COMMON_EVENT_BASE : event;
> +	u64 pmceid;
> +
> +	if (id >= 64 || !pmuv3_implemented(read_pmuver()))
> +		return false;
> +
> +	pmceid = id < 32 ? :() : read_pmceid1();
> +	return pmceid & BIT_ULL(id % 32 + (ext ? 32 : 0));
> +}
> +
>   static inline bool is_pmuv3p4(int pmuver)
>   {
>   	return pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P4;
> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
> index 02d2c7f45b527..792283d29d7b5 100644
> --- a/include/linux/perf/arm_pmu.h
> +++ b/include/linux/perf/arm_pmu.h
> @@ -124,7 +124,6 @@ struct arm_pmu {
>   	u64		reg_brbidr;
>   #define ARMV8_PMUV3_MAX_COMMON_EVENTS		0x40
>   	DECLARE_BITMAP(pmceid_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
> -#define ARMV8_PMUV3_EXT_COMMON_EVENT_BASE	0x4000
>   	DECLARE_BITMAP(pmceid_ext_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);

Could we not avoid this change ? Or why not move both of the definitions ?


Also, I would need an ACK from the arm_pmu maintainers to accept this
change via coresight tree.

Cheers
Suzuki


>   
>   	/* Only to be used by ACPI probing code */
> diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
> index d698efba28a27..c21f185a283d6 100644
> --- a/include/linux/perf/arm_pmuv3.h
> +++ b/include/linux/perf/arm_pmuv3.h
> @@ -78,6 +78,9 @@
>   #define ARMV8_PMUV3_PERFCTR_STALL_SLOT_FRONTEND			0x003E
>   #define ARMV8_PMUV3_PERFCTR_STALL_SLOT				0x003F
>   
> +/* Base of the common events reported in PMCEID{0,1}[63:32] from PMUv3p1 */
> +#define ARMV8_PMUV3_EXT_COMMON_EVENT_BASE			0x4000
> +
>   /* Statistical profiling extension microarchitectural events */
>   #define ARMV8_SPE_PERFCTR_SAMPLE_POP				0x4000
>   #define ARMV8_SPE_PERFCTR_SAMPLE_FEED				0x4001


