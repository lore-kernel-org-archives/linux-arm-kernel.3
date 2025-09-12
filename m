Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04248CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 13:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTkwyZRqolP6CKYiYk7ypp8uDK8OsYPpq6gq9kFsU4U=; b=rcsKa000it9G7KNbhYTlmWh1mB
	zZrDipjyly7l4neJS0mV/yqwX/EJA9APUbQaRzh6YqGToPEVLqjsvh5k9rjkAvmpi2K8SXP+RUtdD
	F6ANu4JVDkHuyfWSfHTUo3tIv+DUFk2muYiru/qbWQG6xtv/z9Iwx9fTxougsi2ihlPEE8uoS24al
	xQwAAGbDROlgEykZC04YD6ct1mkKXy3Az0zU+IUx4/TOOfZbEQHqHZPMzuhY7WQMa7ULP6X9N5BV+
	UDAA2VxvDxnudMppwYEuUGlqpCzn4uuqeVg7LOLz6CdQA488OgaJrIT/1ketIJoWOGl6750mBg1/P
	ZxlfrXyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux491-00000009efB-0H7G;
	Fri, 12 Sep 2025 13:48:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux48x-00000009edn-2TZ4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 13:48:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA45A4099F;
	Fri, 12 Sep 2025 13:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2132C4CEF4;
	Fri, 12 Sep 2025 13:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757684929;
	bh=chwM5K+xTzqEOy4QaouFWqu8+ltEBz2JlWDvhXp3SZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n7UHCh5B5vrhQNfG9nY1XhpwhsjSK11kr/oOJbHpuZo9EF78yza6cnHHzItS9Z3jw
	 wC5bc/tE+2UbPEZFl1OkREx8UKSZ2F+0kmRaV95SAZpPQUbUHuNoHJqQTXeR3q1VTs
	 u5yUyJm1KYXqJkk9EHnDaQMbBfof3aWCLVoISVLBgDgDl6suwCLi2Z9n5uMXFufpJg
	 GEEcPaTjjpVoQhBM1gaCRoU38n2RFPCQGO1ce64hIyDnKJA1TYp87le9OLn5sJjcrD
	 ZlB6kGXSiQg6OAfjoXqFTNQhfDUUY5yT/jIt4JUWYpNdmStOE086YToHUnFX1sx1sb
	 pcS1FjtLnc8pw==
Date: Fri, 12 Sep 2025 14:48:43 +0100
From: Will Deacon <will@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	jstultz@google.com, qperret@google.com, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	smostafa@google.com
Subject: Re: [PATCH v6 16/24] KVM: arm64: Add clock support for the pKVM hyp
Message-ID: <aMQku2zzNRppTRhS@willie-the-truck>
References: <20250821081412.1008261-1-vdonnefort@google.com>
 <20250821081412.1008261-17-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821081412.1008261-17-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_064851_652006_EA4056AF 
X-CRM114-Status: GOOD (  17.45  )
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

[+Mostafa]

On Thu, Aug 21, 2025 at 09:14:04AM +0100, Vincent Donnefort wrote:
> By default, the arm64 host kernel is using the arch timer as a source
> for sched_clock. Conveniently, EL2 has access to that same counter,
> allowing to generate clock values that are synchronized.
> 
> The clock needs nonetheless to be setup with the same slope values as
> the kernel. Introducing at the same time trace_clock() which is expected
> to be later configured by the hypervisor tracing.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

[...]

> +/* Using host provided data. Do not use for anything else than debugging. */
> +u64 trace_clock(void)
> +{
> +	struct clock_data *clock = &trace_clock_data;
> +	u64 bank = smp_load_acquire(&clock->cur);
> +	u64 cyc, ns;
> +
> +	cyc = __arch_counter_get_cntpct() - clock->data[bank].epoch_cyc;
> +
> +	if (likely(cyc < clock->data[bank].cyc_overflow64)) {
> +		ns = cyc * clock->data[bank].mult;
> +		ns >>= clock->data[bank].shift;
> +	} else {
> +		ns = __clock_mult_uint128(cyc, clock->data[bank].mult,
> +					  clock->data[bank].shift);
> +	}
> +
> +	return (u64)ns + clock->data[bank].epoch_ns;

So the comment here say this is for debugging only but, afaict, this
would also be useful for the cmdq timeouts in your nested SMMU series [1]
and would remove the need to mess around with the clock frequency in
the driver code...

Will

[1] https://lore.kernel.org/lkml/20250819215156.2494305-4-smostafa@google.com/

