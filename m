Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64F4F99355
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 08:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u32hUgDFtAW/S/hIdP925Jy+vgVjRQXGlscaIUC48Zs=; b=1VRar8qTo0uwDAnDZmqdkVt8uq
	O9HRSHRXgcCpAZbOpGwtdnABdtCkVPvKR/MAmL4uESYS6xaMKRFldvhSehdKG1xLH+vqhyrKJRW1Q
	PegpPBCH94/nrConVA9hBUr5i8dcPBLQA87hPFw/oIa2Lvno/BriMcu5zJDy4vtRBecpivfCRYZ97
	TNyjkqnA/L965EpnTGDPvb9O2XgK0t+Z8W+aadTCRG3gjkZY+b+nqFqIwnqX6t4zY4SgxXxrs/f3s
	TWwyB+Pd4eLR1qBDOBtYqqcfQIXKLmVQAkGoulcBXLWyJ/SDk8N9zWShiXBOSNkGzM9a/fkHlBnPV
	/LkjSMwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFps4-0000000BHWE-0Vpe;
	Thu, 23 Apr 2026 08:57:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFps1-0000000BHTu-0vEO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 08:57:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 48EAE60052;
	Thu, 23 Apr 2026 08:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DAA1C2BCB2;
	Thu, 23 Apr 2026 08:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776934632;
	bh=5ntX/yXGaj6yZ4bq76PTKmMPNSGKbk0vd3cnMZFOzAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oU9EzKHXHhCS3oxdpn9a3sbRkYfo+xcSdzCVrOWCpxAHnCxEZFn8VCkBMCC9ttMCe
	 ZmOsm7aR37y6TpWP9iOqO1H/bLl05euPdKdKDVIn3/EXaVdap542NsVQ9UpoR0zliK
	 W6zZl5MdOk4F8lH3qgbKAxuLVaN5j4TTfmTc+wiILihAWlKlVUr52JybRvKy/vumPN
	 Tq0SnBZRVPKcYGHZVZRwss0lJ1hghu9jNVM6T/jeMvbVTxW9KmGb3vs2IGq6D7+MgV
	 JB7Rd/REPaGq3o+YDGY5Yoq8niGBRcf1irZf64DlB/VaqcQIjbHN+KnYdxpyR86sCH
	 SHHagNPzmWlPA==
Date: Thu, 23 Apr 2026 09:57:04 +0100
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Marc Zyngier <maz@kernel.org>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, zohar@linux.ibm.com,
	roberto.sassu@huawei.com, dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com, jarkko@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, sebastianene@google.com
Subject: Re: [RFC PATCH 4/4] firmware: arm_ffa: check pkvm initailised when
 initailise ffa driver
Message-ID: <aene4KFD5kbSbFRm@willie-the-truck>
References: <20260417175759.3191279-1-yeoreum.yun@arm.com>
 <20260417175759.3191279-5-yeoreum.yun@arm.com>
 <87se8sbozv.wl-maz@kernel.org>
 <aeNeNjfO7i128TIP@e129823.arm.com>
 <87pl3vb5bm.wl-maz@kernel.org>
 <aecf57rWloQwDh6v@e129823.arm.com>
 <20260421-married-liberal-ammonite-dffda8@sudeepholla>
 <aec/YSxYO1bOhXhn@e129823.arm.com>
 <aejN52lwaqfoMuGJ@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aejN52lwaqfoMuGJ@e129823.arm.com>
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

On Wed, Apr 22, 2026 at 02:32:23PM +0100, Yeoreum Yun wrote:
> Hi All,
> 
> > > On Tue, Apr 21, 2026 at 07:57:43AM +0100, Yeoreum Yun wrote:
> > >
> > > [...]
> > >
> > > >
> > > > Also, the FF-A initialization is not driven by a device probe, but rather
> > > > happens as part of the bus registration itself,
> > > > so it does not fit well with a device_link or probe deferral based approach.
> > > >
> > > > Instead, perhaps we could go with the idea I mentioned previously:
> > > > either introduce a notifier, or create a pseudo ffa_device
> > > > once pKVM initialization has completed, and
> > > > then let the ffa driver perform the additional initialization from there.
> > > >
> > > > Am I missing something?
> > > >
> > >
> > > In order to handle/cleanup some ugliness in interrupt management in the
> > > FF-A driver, we may introduce DT node eventually. But it will take sometime.
> >
> > Unfortunately, I think this DT node wouldn't be helpful to solve
> > this situation for dependency with the kvm misc device...
> >
> > IMHO, current situation, the notifier seems to good option. unless
> > we make the initcall to recongise this dependency.
> >
> 
> I think the best approach for now is to introduce a notifier to handle this situation.
> If there are no further suggestions, I’ll send a v2 based on:
>   - https://lore.kernel.org/all/aeS4rAeVQ0yJIPYw@e129823.arm.com/

I can't say that I'm a huge fan of that :/

The notifier will literally fire once, for a single listener. That's
called a function call.

Will

