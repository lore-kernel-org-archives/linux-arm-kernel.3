Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BD2C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 20:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7I/mAqse8rCEQiCw7fM9ha7XwySoiXoh+gsW3HYhTc=; b=u/+9hi5hHN2AMDYWgOAr5N8BOO
	bouk78LQMpEMk6PNrDgGfi3JyGMOk2w0B/WpK8WvkKVRRxGXQqgo/3/1e1sO/05HN+eHki1hxhhch
	WjbLKmo2qojAMNy/aoNwJ6hroR9trg5rXvPHqXKNA3VkromEvCBmd3J9QaxD8J6nuy4g0CS7BMqm4
	eCSNg4XPdyyeaCuiTF/Mt/EISs8+SPVVsxeINU31mZV3yfVe0F/UChytn14vnGWfCXZPDhAqIz14b
	yPhzfgTT/juQyMWY6czDnnRanXSxaFcX3t1qAuSbcEKgZLCLy7RIt4VCt3CNcrvu8e7LjG2HeSk53
	5Fc5dNbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hsE-0000000GRwX-1Eiy;
	Sat, 12 Apr 2025 20:54:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hcs-0000000GQcO-1xgZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 20:38:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 135B35C0FA4;
	Sat, 12 Apr 2025 20:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9FDBC4CEE3;
	Sat, 12 Apr 2025 20:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744490332;
	bh=wNYXzw5DmJDatYJ1BMioEnL4R5AmfwnRAAULrwduwbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VCuAJj+XagMTaoz0MvHU8WvZ9hVBMRmlvhLMSwHCQrpe0b2qHEHKQ1uVzV+JtbomX
	 o4tz1PUlChUmxhGaydXldfcqgXEWyvldirD4U2/WxQiF2Lm3vrfhJcCFYN9AGw/fKN
	 B90KfXf76wG9ugWMeNH3i2yq8Rf8Ywrh4a3sPXBbViOkwZzn+E4+DDA8sDXe9ueKIn
	 eGs8kT4vogbPdMbYa5jMlDRMJzJU0Umz/KtDwkpwzIZzEPGqghHa/mmRCSMXYER6Fc
	 IsAZyuo8w13voxNWJselPtYJma9E8XOjSsGofFN077xLUDH6twSifmd4jvhRdCuJ4n
	 gHZ08tBklerjA==
Date: Sat, 12 Apr 2025 22:38:46 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mark Barnett <mark.barnett@arm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
	namhyung@kernel.org, irogers@google.com, ben.gainey@arm.com,
	deepak.surti@arm.com, ak@linux.intel.com, will@kernel.org,
	james.clark@arm.com, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	adrian.hunter@intel.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/5] A mechanism for efficient support for
 per-function metrics
Message-ID: <Z_rPVq2Emx697SIA@gmail.com>
References: <20250408171530.140858-1-mark.barnett@arm.com>
 <Z_ZcRiHTGljxEEdN@gmail.com>
 <2fa741d8-13c7-49c0-a6c5-540a7c2cf3a7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fa741d8-13c7-49c0-a6c5-540a7c2cf3a7@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_133854_620602_1453A1CF 
X-CRM114-Status: GOOD (  24.70  )
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


* Mark Barnett <mark.barnett@arm.com> wrote:

> Tool Integration
> ==================
> 
> We've been using a python script to process the data into a report. We can
> look at implementing this directly in perf report, if that is required.
> However, I'm nervous about making the new feature the default behaviour for
> the tool.

That's OK - but it should be very simple to activate for perf 
record/top. A single option or so to get some sane default behavior, 
without having to micro-manage the period values?

In particular perf defaults to 4000 Hz auto-freq samples (at least on 
my x86 devel box), and it would be nice to make this new feature work 
well with the freq representation too, without complicating it too 
much.

> This feature has been integrated into our tools [1] for the last 12 
> months, and has received a lot of testing on Arm Neoverse hardware. 
> Other platforms have received less rigorous testing. In my opinion, 
> more work would be needed to validate the PMU hardware & software 
> characteristics of other architectures before this can be made the 
> default.

Sure. As long as the switch is simple, I think it will be a popular 
change once the kernel feature goes upstream.

In other words: please add a simple, idiot-proof switch to perf 
top/record for maintainers with chronically short attention spans who 
want to try out your kernel feature. ;)

Please Cc: the perf tooling people to those changes, in general they 
are very open to such features.

> Burst Sampling
> ================
> 
> I like the burst sampling idea. Increased I-Cache pressure is an inherent
> weakness of this sampling method, and this would help to alleviate that
> somewhat. I'll add this in the next spin.

Great, thanks!

> Period Jitter
> ===============
> 
> Yes, we can apply this to both periods. I will make that change.
> 
> I'm not sure I've fully understood your suggestion here. In its 
> current state, the 4-bit jitter field acts as a base-2 exponent. This 
> gives us a random jitter value of up to 2**15. Is the suggestion to 
> change this to a fixed, absolute value that can be applied to both 
> long & short periods?

Oh, I missed the base-2 exponent aspect, I assumed it was a flat period 
in the small integers range, a kind of micro-jitter to counter 
resonance with the finest CPU microarchitectural base-frequencies.

What is the typical useful jitter range in your experience? base-2 
exponents sound a bit too limiting - although the prandom32() indeed 
smears it between [0..2^param). I'd guess that jitter would rarely want 
to be larger than the long-period? (Although that might not always be 
the case.)

I'd generally err on the side of being a bit too generic & generous in 
the design of ABI parameters, because we never know what people will 
use it for ... Within reason that is.

Thanks,

	Ingo

