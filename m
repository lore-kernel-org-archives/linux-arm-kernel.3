Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A47C83000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmfsA2OhiUuurT3qzGeJg02WiUOU6K9p7+fbqabEQsk=; b=PABV+S+Y0HIBY1ZejhPyFTEYcl
	/hkGJUyqEwQwMo2r393JhWliUilB9Y72JJ+fW4X9GGn9/rK0P7DzRDMsg+1CdInv6xvEmmLT3jg9e
	+liqbhN8k1uDxXts4OsMqh+cttRXu4Vl4BUyzFQwkDxpIpwoV1wsRS+3liqW3xP5YENK/freScPTW
	9a4ThubshyYpZU8kgsya/BaRIdNHK4+wuvUnb++0YXo5aEO/VrEIvTHlFtldkwhdyHERjHhSWV8L0
	3xYVV/OeIgDTeh/rTyFaprhsLPE5ixVnWNkcu0nskLIKBFRnFY8rhaKwGVHCulDs2PhFxcGnlu/IJ
	AOJTQUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEPz-0000000Fayr-18fv;
	Fri, 27 Jun 2025 19:07:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEFv-0000000FXkl-3FcC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 18:57:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B32685C6D77;
	Fri, 27 Jun 2025 18:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE84C4CEE3;
	Fri, 27 Jun 2025 18:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751050617;
	bh=Q3Aa6FDJc1vC8i1sfsCmVuaZkXCyAxo264Ny4DnLKEw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vBNnpx2TjAZAJR8GpWgF5jRRGVK8oai3b2GYy+DHwsDgiwu815u3TJMlbD6SEerEM
	 djbc8ASKliMqQ32IJ0jJj2nnlPVobSeqb8negZBfmgx6IthsU8Djq4MMqZH7ot2/nZ
	 li3esq3vAWedz5LN1Pujgy+ieQdL2IvBAOgLv8Ac=
Date: Fri, 27 Jun 2025 11:56:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Will Deacon <will@kernel.org>
Cc: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
 dianders@chromium.org, sumit.garg@linaro.org, kernelfans@gmail.com,
 lecopzer.chen@mediatek.com, tglx@linutronix.de, song@kernel.org,
 linux-arm-kernel@lists.infradead.org, jonathan.cameron@huawei.com,
 zhanjie9@hisilicon.com, prime.zeng@hisilicon.com, yangyicong@hisilicon.com,
 linuxarm@huawei.com
Subject: Re: [PATCH v2 0/2] Update the watchdog period according to real CPU
 frequency
Message-Id: <20250627115656.824d10b741f6b6cbaa629ea4@linux-foundation.org>
In-Reply-To: <aF64F2cW3aratui5@willie-the-truck>
References: <20250512130919.23915-1-yangyicong@huawei.com>
	<20250512160612.c10464075df3c7842b13da11@linux-foundation.org>
	<aF64F2cW3aratui5@willie-the-truck>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_115659_906964_C3E87BDC 
X-CRM114-Status: GOOD (  11.64  )
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

On Fri, 27 Jun 2025 16:26:15 +0100 Will Deacon <will@kernel.org> wrote:

> > Can I assume that the ARM maintainers will be handling this?
> 
> Argh, this has all ended up in my spam for some reason...

So you won't be buying these ED meds?

> Lemme go fish the patches back out. Andrew -- we can take these via
> arm64 if you like (although I have some comments on the code first).

No probs, I dropped the mm.git copy.

