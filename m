Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61045F89242
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 09:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggbpmUffQi8VX8XksWALw6V7f7zNBtNG4MtIIJHGvpI=; b=qkFYHeksLY7BkOjrRakh4x1C3C
	jBs6cTFr3QaUm30vx4QD/+vPEucyWgBa0ZCI5Bp4Ht9Mql9/Jva8kcJbEOm0JqKoU8rk0PH3VCoNS
	Izq9ouTBYAS7ReDhWCostvmbSVYvMfX77qBsL+ADGDqewzUGzXFlMReDRM2fQx1BPHZefyf8+wSjO
	9bbcnMxikW4MYX4/wrGmDg4B7d9npRP7HmTl9mt0IThbusyG6MvZ0OzBF8hK4ZeYcztpXPoBoqJmb
	k9mQK3hZjkUc0QDehOA+iL9OmxrGAXOwbAq/xj3dDuRgA3ax/Mv230zb9eAXaWPaVGhic+GFDWX3V
	YmYRbieQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7sI-00000008NjD-3X0b;
	Tue, 21 Apr 2026 09:58:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7sH-00000008Nj4-2dGf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 09:58:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9ADEF60125;
	Tue, 21 Apr 2026 09:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5FAC2BCB0;
	Tue, 21 Apr 2026 09:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776765512;
	bh=fexoY8X6Nq2k603tJTu41pqTFs2zfJKg3RNrn/E/JGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mv9mPaLbyWMAANPZxFQ2Jqxq5kFDbd1iBmp7XwiQCZ34zvxiCQb7IK7U19EJ8GtjN
	 lStK/YU1TztoxxoMGN8Mn/84E/Y9K3sUSy+rVKnQtkFcroPboRGRl41yDoOkjiyccB
	 cEKvJwFMCY8AI6VIgzizisSEx+xZzU6qh1lrtgWn/Er+MhqcuWVCJqH/NRjentTI12
	 toheS5KdS76FCvNVprwVRY72thTgkj5FLnepiLvc2M4bvwj3hwo6AuFsLMHCXm/STS
	 kwqhEchqckpqu4N6n/vSViRDaNHQjbYX8st7sR2rtHzXKMws2uy/3uIBMXzExC1rKz
	 hAcEKZ2+yuOkw==
Date: Tue, 21 Apr 2026 10:58:27 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Huisong Li <lihuisong@huawei.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, pjaroszynski@nvidia.com,
	rmikey@meta.com, kernel-team@meta.com, stable@vger.kernel.org
Subject: Re: [PATCH] ACPI: arm64: cpuidle: Tolerate platforms with no deep
 PSCI idle states
Message-ID: <20260421-accomplished-ethereal-whale-0e1cba@sudeepholla>
References: <20260420-ffh-v1-1-6b4c10fec442@debian.org>
 <20260420-sturdy-unique-shark-c4ca8c@sudeepholla>
 <aedGoi-Fk5HPK0OO@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aedGoi-Fk5HPK0OO@gmail.com>
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

On Tue, Apr 21, 2026 at 02:51:42AM -0700, Breno Leitao wrote:
> On Mon, Apr 20, 2026 at 04:12:38PM +0100, Sudeep Holla wrote:
> > On Mon, Apr 20, 2026 at 02:27:13AM -0700, Breno Leitao wrote:
> > > -	count = pr->power.count - 1;
> > > -	if (count <= 0)
> > > -		return -ENODEV;
> > > -
> >
> > Does it make sense to retain this check like
> >   if (pr->power.count < 1)
> >   	return -EINVAL;
> >
> > Though I see the assignment to pr->power.count in drivers/acpi/processor_idle.c
> > is through unsigned int. So I am fine even without the above check.
> 
> I don't think the check is necessary. When count is 0 or 1, the loop
> for (i = 1; i < pr->power.count; i++) body won't execute, and the
> function will return 0.
>

Yes but the point is to handle invalid pr->power.count(0 or less) which
is not possible here though it is signed it because it is assigned from
an unsigned int during initialisation.

> This seems like the correct behavior — if there are no FFH PSCI states
> to validate, there's nothing that should fail.
> 

Agreed, but I was thinking of error in parsing _LPI being propogated here
but again that's not happening here.

> Additionally, returning -ENODEV would trigger the "Invalid FFH LPI data"
> error message, which would be misleading since the LPI data isn't
> invalid, it's just not present.
> 

The point was to throw that error if _LPI parsing fails.

> That said, please take this with a grain of salt since I'm not deeply
> familiar with _LPI states and their expected behavior.
> 

No worries, I agree the check I asked for is not needed.

-- 
Regards,
Sudeep

