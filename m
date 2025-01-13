Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68612C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 14:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntDSP9NBqde2ne2PTQLM76C9YokBfgo9U0qc1q22R24=; b=q9oTwe3x2x/JVjf5H9pWG8EqqU
	bcrcBEHJ7tAVbQ+i+anjwtIfCm6SqagtHQIU2dQlgoqM+CrBwIVH8sZ7Ega0alQ2cJbFDTkO3BJHR
	aToCNsMX8VRnbh0yo/C/s8917EOtlfgWT/YjYYx4gik+JNf6MCakCt4NtAj1vPcFj2X9+ojbvghiu
	gq+pk3v0VK3bqqTT11+1A9Sx9fiiaYQ9boMSBzlqRY17zSBsG/yd6gyTPTizreydT0tPa4ZGyOdIO
	Lu9ju56ZRmieotCWhc5/7Gfnc+5RvgOXEbXBR6mkLWE42lo8zzVP4knd1yacp66mnwyD+hxxcxh4z
	lqzd7IWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLj5-00000005Sx3-0ONh;
	Mon, 13 Jan 2025 14:47:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLhV-00000005SXQ-2m5a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 14:45:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 966555C4AE2;
	Mon, 13 Jan 2025 14:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A543CC4AF0B;
	Mon, 13 Jan 2025 14:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736779556;
	bh=4Vujzbm4kNtV5/o/KXPggv4nUMTIKxP0LOJAZ9i8Z+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cjGQw4qrc+25VwrU5o7c9G3d/cR+3CwDJHhEQLzEagi/U7UsotaPFVUfY5mHihKPM
	 ukP5fL2SRcmpEtGWyI5yFsXX8LS09ahNaQE30YcFWnTS4U6dGx3OhImPgnoSir5OL0
	 fSkkiFeSOy1h5QOSf2yTbdTDuVCT73Hpy4bnFcS8qSWoFm2Zkssdqb3/L9cbdcX7+q
	 AYbcvhxZA+tV+1TqTQcGkiWDwG5SHCgshXTJj05m0o5U9yGH0jjEQkaMmK16Ic3ovU
	 M3F6JXJRcgdrURmFSPsuUuQRuZXpOPAicnrl91k9kRkz3AgC0XIE5+EjEhwXNxXgoy
	 Bz8YtOupu7h4Q==
Date: Mon, 13 Jan 2025 11:45:52 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
	irogers@google.com, yeoreum.yun@arm.com, mark.rutland@arm.com,
	namhyung@kernel.org, James Clark <james.clark@linaro.org>,
	catalin.marinas@arm.com, kernel-team@android.com, robh@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	Michael Petlan <mpetlan@redhat.com>,
	Veronika Molnarova <vmolnaro@redhat.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v3 0/5] perf: arm_spe: Add format option for discard mode
Message-ID: <Z4UnIH8SXQC7kGXL@x1>
References: <20250108142904.401139-1-james.clark@linaro.org>
 <173652065683.3245172.11665292685923367751.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173652065683.3245172.11665292685923367751.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_064557_742155_7266CB77 
X-CRM114-Status: GOOD (  21.51  )
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

On Fri, Jan 10, 2025 at 04:22:48PM +0000, Will Deacon wrote:
> On Wed, 08 Jan 2025 14:28:55 +0000, James Clark wrote:
> > Discard mode (Armv8.6) is a way to enable SPE related PMU events without
> > the overhead of recording any data. Add a format option, tests and docs
> > for it.
> > 
> > In theory we could make the driver drop calls to allocate the aux buffer
> > when discard mode is enabled. This would give a small memory saving,
> > but I think there is potential to interfere with any tools that don't
> > expect this so I left the aux allocation untouched. Even old tools that
> > don't know about discard mode will be able to use it because we publish
> > the format option. Not allocating the aux buffer will have to be added
> > to tools which I've done in Perf.
> > 
> > [...]
> 
> Applied driver and docs patches to will (for-next/perf), thanks!

Picked the rest and added it to perf-tools-next,

Thanks,

- Arnaldo
 
> [1/5] perf: arm_spe: Add format option for discard mode
>       https://git.kernel.org/will/c/d28d95bc63cb
> [2/5] perf docs: arm_spe: Document new discard mode
>       https://git.kernel.org/will/c/ba113ecad81a
> 
> Cheers,
> -- 
> Will
> 
> https://fixes.arm64.dev
> https://next.arm64.dev
> https://will.arm64.dev

