Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C204CFC272
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 13:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRHZBynpa1Xg/GWZaZ4PlRksyos/x1P/fCt/M2a4Jjg=; b=KUy+1/zry41M+DFKRzOVijV8vZ
	pZJ+wxGiIqCj1ngjhEJ+2jjeoe+moM13iQVNMr451sq9cQNE+4HOo66ihEa0Zg/U0vr2w/aQLYh0H
	4b8+K+jD6W+8PgIv8gEafP2HHPJMbCoUOLUXv9GbP4bQCjxT07lC4z/S5Dslr/MgyulZem97PlsjD
	rK3ECXQEdSO49Ns7u0PaUyk3v9QyCKuNgB3BZVmC0wOma2RtnN8VATNofei8gifhEHcvVEMizBQf8
	KhAP/8syUylOFqU6868ysO2QLHQUEJ3J+YmsaeQEYWCT9SMpTsZ+mFf+LEQoAL8N4PQhxDz4oPGDO
	dwqI6h/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMR0F-00000008P84-40yD;
	Fri, 21 Nov 2025 13:16:43 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMR0C-00000008P7e-3i95
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 13:16:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763731001; x=1795267001;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=eme6ZS8FJJxzqwbZg8ZaCh+HrZE7enpHSIvrum+fCgs=;
  b=YfHJv4YAHxSVZHEQe7KJT4PwE6zkEbqbC6L1uQ2Hdy5XEpPNXX0E8UHd
   lWl8bVFh65jNwqnK8fAO1aa7DxeL9bmzezWSB/DqycXXrU3kZ3W0WLpcF
   xSNxyLm+Sw07BxyZ4amIaQ3BDbhu4kbCLiJnTZOhDCy7fTF479SnNZd+W
   ar+z4VzyEdd9ejNXIyQCX88GGbmBBABxwp+9byS+2u9jx3+qvPai+sMBU
   Dm607cwDPv20nCXbnZbqYSAM0DnvtJYRTT+RtNrwWJQJQUOf5dUYByTms
   eqMPjAW98hwzJsWACc4JPgchK8fqp/bu1a3PLM7DmFmODVjPEigNGrcog
   g==;
X-CSE-ConnectionGUID: WGGN8zsATImmD2aOGIACKA==
X-CSE-MsgGUID: i1CIYvdWQPiNhpH69PVHoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65715168"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65715168"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 05:16:39 -0800
X-CSE-ConnectionGUID: BYD38/rGScCo6JrhPcAgwA==
X-CSE-MsgGUID: TeF7mPGHQ7+l5Q7FZNI3vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191803187"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 05:16:38 -0800
Received: from [10.245.245.66] (abityuts-desk.ger.corp.intel.com [10.245.245.66])
	by linux.intel.com (Postfix) with ESMTP id 6FED820A8406;
	Fri, 21 Nov 2025 05:16:35 -0800 (PST)
Message-ID: <efe52356123168be06811abd08a99f65d6980baa.camel@linux.intel.com>
Subject: Re: [PATCH] cpuidle: warn and fixup on sanity check instead of
 rejecting the driver
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Val Packett <val@packett.cool>, "Rafael J. Wysocki" <rafael@kernel.org>,
  Daniel Lezcano <daniel.lezcano@linaro.org>, Christian Loehle
 <christian.loehle@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 21 Nov 2025 15:16:34 +0200
In-Reply-To: <20251121010756.6687-1-val@packett.cool>
References: <20251121010756.6687-1-val@packett.cool>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_051640_938912_3F58B36B 
X-CRM114-Status: GOOD (  21.83  )
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

On Thu, 2025-11-20 at 22:06 -0300, Val Packett wrote:
> On Device Tree platforms, the latency and target residency values come
> directly from device trees, which are numerous and weren't all written
> with cpuidle invariants in mind. For example, qcom/hamoa.dtsi currently
> trips this check: exit latency 680000 > residency 600000.
>=20
> Instead of harshly rejecting the entire cpuidle driver with a mysterious
> error message, print a warning and set the target residency value to be
> equal to the exit latency.
>=20
> Fixes: 76934e495cdc ("cpuidle: Add sanity check for exit latency and targ=
et residency")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/cpuidle/driver.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/cpuidle/driver.c b/drivers/cpuidle/driver.c
> index 1c295a93d582..06aeb59c1017 100644
> --- a/drivers/cpuidle/driver.c
> +++ b/drivers/cpuidle/driver.c
> @@ -199,8 +199,11 @@ static int __cpuidle_driver_init(struct cpuidle_driv=
er *drv)
>  		 * exceed its target residency which is assumed in cpuidle in
>  		 * multiple places.
>  		 */
> -		if (s->exit_latency_ns > s->target_residency_ns)
> -			return -EINVAL;
> +		if (s->exit_latency_ns > s->target_residency_ns) {
> +			pr_warn("cpuidle: state %d: exit latency %lld > residency %lld (fixin=
g)\n",
> +				i, s->exit_latency_ns, s->target_residency_ns);
> +			s->target_residency_ns =3D s->exit_latency_ns;
> +		}
>  	}

Ideally, in a perfect world, driver.c should verify input data and
reject bad input, rather than correct bad input.

So ideally, if there is an idle driver between DT and driver.c (like
intel_idle.c in case of Intel), that would be its job to correct DT
data.

But I'm not familiar with DT platforms, so I don't know if there is a
driver/piece of SW between DT parsing and driver.c that could handle
this correction at an earlier stage.

The reason I think this patch is not ideal is because it changes the
input data at the core framework level, and in theory the change may be
surprising to users. In general, sometimes rejecting bluntly is better
than correcting in a possibly unexpected way.

Artem.

