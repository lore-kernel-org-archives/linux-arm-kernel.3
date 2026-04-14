Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1DCF9D0DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 16:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FdXE2tVp66RJrAxYD1Fn/hCeXeICiymZD7gAr383aF4=; b=S/iOI6kOWha2IBjj1023YXizB0
	NzCoeHLhAmWhYKyRhRyMCO+S+o+56MncDk4yYIGqkOtIzx6ifglNi1sIqXqIg85oo0d93wrICK8ZT
	Et9s08y4hyocrYRO2pLQ5EQzsSVBNEj+B+t4EgbEFuAA5IPaX6asMoAoGPEx/w9cL14yXSIc/wjFR
	f7maPBBXI258wEBDiNB6UB0/EaFGHi2/IY2r+GibtjOd5AYceM3VOgS4rEHzGMXC5I+PtL2QdQ7UX
	BFJh+Sj+amgc0UqkvMvJmCovKJNvZJdfSZoh/CXf9X0+hldckDvwd7gqaJmeFXs1iy5ubxhuRS68s
	laxbFD7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCggG-0000000012m-182S;
	Tue, 14 Apr 2026 16:32:04 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCggD-0000000011i-1sXc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 16:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FdXE2tVp66RJrAxYD1Fn/hCeXeICiymZD7gAr383aF4=; b=f7oDisXdB29ztjU627r7TbiRs2
	z5xgC0uzYAUQyBwftf25Zi9Na8S12Zg3JYr2SriHdpKwl1NdB2zVetQb+8FXQg1ljsuOyiAR8ZJgY
	FGNC8Iz70NZrs8VNe3mDkvOcYG7SwbBFDN1toDiWHi4/FLiAh9tPHddphByjYZGECqUm8H8Qn+JWx
	x+TCUyjSRBrzb0YBDTmgsNp1JrFyIK9mt1ctcvVvFv7RMQMMwXFD3uXOINRtDbidzYkpAyXNzWWxT
	DOTW/hQS4hMttMtqessxS4Exckl4nI8sPqysMJ9E49OUHrg/11GAGnkPMVeo56fNAQo1KS74Za570
	U4G4HieA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wCgfr-00DCFn-1Z;
	Tue, 14 Apr 2026 16:31:39 +0000
Date: Tue, 14 Apr 2026 09:31:33 -0700
From: Breno Leitao <leitao@debian.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: "lihuisong (C)" <lihuisong@huawei.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, lpieralisi@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	pjaroszynski@nvidia.com, guohanjun@huawei.com, linux-arm-kernel@lists.infradead.org, 
	rmikey@meta.com, kernel-team@meta.com
Subject: Re: [PATCH RFC] ACPI: processor: idle: Do not propagate
 acpi_processor_ffh_lpi_probe() -ENODEV
Message-ID: <ad5qxncafOiTeLNg@gmail.com>
References: <20260413-ffh-v1-1-301704f69e2f@debian.org>
 <af9c679d-899c-4832-b902-e621b5987f12@huawei.com>
 <ad4UWJ__dnDQtrj8@gmail.com>
 <6694ca7c-13bf-4e7d-9621-bc992cbf96a7@huawei.com>
 <20260414-cute-shapeless-dolphin-c5b2fc@sudeepholla>
 <ad48gItCwrC-ar34@gmail.com>
 <20260414-excellent-hidden-dodo-5bb98e@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-excellent-hidden-dodo-5bb98e@sudeepholla>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_093201_506360_0177102E 
X-CRM114-Status: GOOD (  24.15  )
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

Hello Sudeep,

On Tue, Apr 14, 2026 at 03:10:03PM +0100, Sudeep Holla wrote:
> On Tue, Apr 14, 2026 at 06:14:19AM -0700, Breno Leitao wrote:
> > Hello Sudeep,
> >
> > On Tue, Apr 14, 2026 at 01:25:53PM +0100, Sudeep Holla wrote:
> > > So while I understand that the kernel did not report an error previously, that
> > > does not mean the _LPI table is merely moot on this platform when it contains
> > > only a WFI state.
> >
> > Can you clarify whether datacenter ARM systems are expected to expose
> > deeper idle states beyond WFI in their _LPI tables?
> >
>
> Of course any system that prefers to save power when its idling must have
> these _LPI deeper idle states.
>
> > Backing up, I'm observing 72 pr_err() messages during boot on these
> > hosts and trying to determine whether this indicates a firmware issue or
> > if the kernel needs adjustment.
>
> I consider this a firmware issue, but not a fatal one. What matters more is
> the behavior after those errors are reported.

I understand. While I'm not a hardware or firmware vendor myself, I can
see how they might consider power management features _optional_ for certain
server configurations.

> If you force success, either through your change or through the PSCI approach
> suggested by lihuisong, then in practice you are only enabling a cpuidle
> driver with a single usable state: WFI. That is not inherently wrong, but it
> also does not provide much benefit.

Given that this isn't a critical error, would it make sense to downgrade
the pr_err() to pr_debug()? is it a reasonable compromise. I just want
to avoid these pr_err() all accross the board, affecting kernel health
metrics in large fleets.

My proposal:

commit c98007f9e10fe229672d29c3844c96705cecaed5
Author: Breno Leitao <leitao@debian.org>
Date:   Tue Apr 14 05:28:28 2026 -0700

    ACPI: processor: idle: Downgrade FFH LPI probe failure message to pr_debug()
    
    The "Invalid FFH LPI data" message is printed at pr_err() level for every
    CPU when acpi_processor_ffh_lpi_probe() fails. On platforms where the FFH
    probe legitimately returns an error (e.g., no deep idle states beyond
    WFI), this floods the kernel log with per-CPU error messages that are not
    actionable.
    
    Downgrade to pr_debug() since this is a diagnostic message, not a
    critical error.
    
    Signed-off-by: Breno Leitao <leitao@debian.org>

diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
index ee5facccbe10c..ab93a2c10a9ad 100644
--- a/drivers/acpi/processor_idle.c
+++ b/drivers/acpi/processor_idle.c
@@ -1259,7 +1259,7 @@ static int acpi_processor_get_power_info(struct acpi_processor *pr)
 	if (pr->flags.has_lpi) {
 		ret = acpi_processor_ffh_lpi_probe(pr->id);
 		if (ret)
-			pr_err("CPU%u: Invalid FFH LPI data\n", pr->id);
+			pr_debug("CPU%u: Invalid FFH LPI data\n", pr->id);
 	}
 
 	return ret;



