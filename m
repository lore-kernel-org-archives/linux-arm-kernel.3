Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798F0F9D0CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 12:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uproPa0wovE0vExP1gpIIrYvV3qSxZqfdZRO8Daxj94=; b=2KJNvC7qTnsGJOz0/8rWYBm+6H
	tHNGddJtwtpFz159GQZb2XZh86oyFE2iS1mRTdCNsN2WZeTo8YZV73kuGiybJYL7OSMr28C5lCEEM
	6z6lcfcvrAp+4XePeZGAKAepOEyNyOOxa511mzhW3JR4K/wOOeuDHP8DOKGpkGelYvNqhi1N75T4P
	TFQTNQpdzMdVc/9rEj+ENjtUxBZbc58G1ecCQyb/LPipl2TzbzTEmyZzcKv1vI/IYbZnxLAts842S
	id9rWHutCh5qat/t8gGDfvGwWzA6JdCi5QU8A7nU5IHi6T5DIPFHou7ls486MmwwKKrZOmpzQKlFI
	g91oZuGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCcq9-0000000HIIZ-0Wj1;
	Tue, 14 Apr 2026 12:26:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCcq8-0000000HIIT-0pax
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 12:26:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D74560130;
	Tue, 14 Apr 2026 12:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFCFC19425;
	Tue, 14 Apr 2026 12:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776169558;
	bh=0mxqJDlo804wnC50q8gJO4xhJeZDLM0HfNEaZTltFmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=peOoUo+2oGBuWmDUjhvX9j/hAewpeDfH2u+jmtg9Dh71UufFfYnP+oXNdP8B243Ov
	 mWZ5nU9nj6eGX/KYBtL0By0CKbVANPc/N14231R33UPx8OMAKbsSairbuhpDsMsXcq
	 YArLLwOrd5COXe6TiDL5EaQFbr/CpJDQMEsiXFz4eWVLGxu2jHOKH1m7rH/VYZslim
	 lYB/MuuzemJin6TsIlbbst0ypigj7vJzy2Y+3+INJdwgnrSKs8DQZyLX7nNWRhawID
	 5xcL0XphJ/tbYLYIwtCWUe+ni2O/2syednpzfAim22Y+OwLg6CPz8enh6GAmNq5WwF
	 02sQK1XTaHRVg==
Date: Tue, 14 Apr 2026 13:25:53 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "lihuisong (C)" <lihuisong@huawei.com>
Cc: Breno Leitao <leitao@debian.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, lpieralisi@kernel.org,
	catalin.marinas@arm.com, will@kernel.org,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	pjaroszynski@nvidia.com, guohanjun@huawei.com,
	linux-arm-kernel@lists.infradead.org, rmikey@meta.com,
	kernel-team@meta.com
Subject: Re: [PATCH RFC] ACPI: processor: idle: Do not propagate
 acpi_processor_ffh_lpi_probe() -ENODEV
Message-ID: <20260414-cute-shapeless-dolphin-c5b2fc@sudeepholla>
References: <20260413-ffh-v1-1-301704f69e2f@debian.org>
 <af9c679d-899c-4832-b902-e621b5987f12@huawei.com>
 <ad4UWJ__dnDQtrj8@gmail.com>
 <6694ca7c-13bf-4e7d-9621-bc992cbf96a7@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6694ca7c-13bf-4e7d-9621-bc992cbf96a7@huawei.com>
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

On Tue, Apr 14, 2026 at 07:31:29PM +0800, lihuisong (C) wrote:
> 
> On 4/14/2026 6:21 PM, Breno Leitao wrote:
> > Hello Huisong,
> > 
> > On Tue, Apr 14, 2026 at 05:43:51PM +0800, lihuisong (C) wrote:
> > > But it is a real issue. Thanks for your report.
> > > I think the best way to fix your issue is that remove this verification in
> > > psci_acpi_cpu_init_idle().
> > > Because it is legal for platform to report one LPI state.
> > > This function just needs to verify the LPI states which are FFH.
> > Thank you for the prompt feedback.
> > 
> > Would this approach work?
> > 
> > commit 6c9d52840a4f778cc989838ba76ee51416e85de3
> > Author: Breno Leitao <leitao@debian.org>
> > Date:   Tue Apr 14 03:16:08 2026 -0700
> > 
> >      ACPI: processor: idle: Allow platforms with only one LPI state
> >      psci_acpi_cpu_init_idle() rejects platforms where power.count - 1 <= 0
> >      by returning -ENODEV. However, having a single LPI state (WFI) is a
> >      valid configuration. The function's purpose is to verify FFH idle states,
> >      and when count is zero, there are simply no FFH states to validate —
> >      this is not an error.
> >      On NVIDIA Grace (aarch64) systems with PSCIv1.1, power.count is 1 for
> >      all 72 CPUs, so the probe fails with -ENODEV. After commit cac173bea57d
> >      ("ACPI: processor: idle: Rework the handling of
> >      acpi_processor_ffh_lpi_probe()"), this failure propagates up and prevents
> >      cpuidle registration entirely.
> >      Change the check from (count <= 0) to (count < 0) so that platforms
> >      with only WFI are accepted. The for loop naturally handles count == 0
> >      by not iterating.
> >      Fixes: cac173bea57d ("ACPI: processor: idle: Rework the handling of acpi_processor_ffh_lpi_probe()")
> >      Signed-off-by: Breno Leitao <leitao@debian.org>
> > 
> > diff --git a/drivers/acpi/arm64/cpuidle.c b/drivers/acpi/arm64/cpuidle.c
> > index 801f9c4501425..7791b751042ce 100644
> > --- a/drivers/acpi/arm64/cpuidle.c
> > +++ b/drivers/acpi/arm64/cpuidle.c
> > @@ -31,7 +31,7 @@ static int psci_acpi_cpu_init_idle(unsigned int cpu)
> >   		return -EOPNOTSUPP;
> >   	count = pr->power.count - 1;
> > -	if (count <= 0)
> > +	if (count < 0)
> >   		return -ENODEV;
> >   	for (i = 0; i < count; i++) {
> 
> This count already verified in acpi_processor_get_lpi_info.
> 
> I suggest modifing it as below:
> 
> -->
> 
> git diff
> diff --git a/drivers/acpi/arm64/cpuidle.c b/drivers/acpi/arm64/cpuidle.c
> index 801f9c450142..c68a5db8ebba 100644
> --- a/drivers/acpi/arm64/cpuidle.c
> +++ b/drivers/acpi/arm64/cpuidle.c
> @@ -16,7 +16,7 @@
> 
>  static int psci_acpi_cpu_init_idle(unsigned int cpu)
>  {
> -       int i, count;
> +       int i;
>         struct acpi_lpi_state *lpi;
>         struct acpi_processor *pr = per_cpu(processors, cpu);
> 
> @@ -30,14 +30,10 @@ static int psci_acpi_cpu_init_idle(unsigned int cpu)
>         if (!psci_ops.cpu_suspend)
>                 return -EOPNOTSUPP;
> 
> -       count = pr->power.count - 1;
> -       if (count <= 0)
> -               return -ENODEV;
> -

It was intentionally designed this way, as there is little value in defining
only WFI in the _LPI tables. In the absence of a cpuidle driver/LPI entry,
arch_cpu_idle() is invoked, which is sufficient and avoids unnecessary
complexity, only to ultimately execute wfi() anyway.

So while I understand that the kernel did not report an error previously, that
does not mean the _LPI table is merely moot on this platform when it contains
only a WFI state.


-- 
Regards,
Sudeep

