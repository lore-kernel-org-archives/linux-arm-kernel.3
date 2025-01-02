Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB8AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 19:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZh0cnkfVSu+/JRcP5joLQksiefUKpoHbG7GgK9CBM0=; b=sNW4ugi5u68MMiQjlBVKu03zkR
	bEcUvs4EQ4NJzKAHnYiTXUyH/kqvnv8oGk47iG2XFbOJDoJCN57/O1nIEa8aK6jQ8GgkdaJ9vnAFN
	Tdb7L5XVrzvBh9OKCzohNNMVf5eT4bKtwbLYMlqj/4nQl2kT1SLaFba0vAtQdCWd6zv2STt0uQFLu
	9dSCKr0twMUGkRCnj90rpblNNLAVnLhFDAKQw+U749uNrpEmSshVx3ASv48Ajm7mmgKR2mgixFTk2
	MVXgkQBXQvNgbIVaZyCjculPfa5npEDuEEPhn/+eWzMOJnQHT1xVq1g/HfhNjETXAkhdY4Ly2sLqG
	IRjt1pDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQQt-0000000BDhf-2vMV;
	Thu, 02 Jan 2025 19:00:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQPM-0000000BDIe-2nmr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 18:59:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BBDEE5C60F4;
	Thu,  2 Jan 2025 18:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2FAC4CED0;
	Thu,  2 Jan 2025 18:58:57 +0000 (UTC)
Date: Thu, 2 Jan 2025 18:58:55 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Zhenhua Huang <quic_zhenhuah@quicinc.com>, will@kernel.org,
	ardb@kernel.org, ryan.roberts@arm.com, mark.rutland@arm.com,
	joey.gouly@arm.com, dave.hansen@linux.intel.com,
	akpm@linux-foundation.org, chenfeiyang@loongson.cn,
	chenhuacai@kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: mm: vmemmap populate to page level if not
 section aligned
Message-ID: <Z3bh74I1YhGWLU4M@arm.com>
References: <20241209094227.1529977-1-quic_zhenhuah@quicinc.com>
 <20241209094227.1529977-2-quic_zhenhuah@quicinc.com>
 <Z2W3qA7wbBTaq6DQ@arm.com>
 <a720aaa5-a75e-481e-b396-a5f2b50ed362@quicinc.com>
 <Z2rAr9APkgpkwOl8@arm.com>
 <971b9a05-4ae0-4e6c-8e48-e9e529896ecf@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <971b9a05-4ae0-4e6c-8e48-e9e529896ecf@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_105900_748089_2C567BEA 
X-CRM114-Status: GOOD (  17.09  )
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

On Fri, Dec 27, 2024 at 01:19:30PM +0530, Anshuman Khandual wrote:
> On 12/24/24 19:39, Catalin Marinas wrote:
> > On Tue, Dec 24, 2024 at 05:32:06PM +0800, Zhenhua Huang wrote:
> >> I have two ideas:
> >> 1. Completely disable this PMD mapping optimization since there is no
> >> guarantee we must align 128M memory for hotplug ..
> > 
> > I'd be in favour of this, at least if CONFIG_MEMORY_HOTPLUG is enabled.
> > I think the only advantage here is that we don't allocate a full 2MB
> > block for vmemmap when only plugging in a sub-section.
> 
> Agreed, that will be the right fix for the problem which can be back ported.
> We will have to prevent PMD/PUD/CONT mappings for both linear and as well as
> vmemmap for all non-boot memory sections, that can be hot-unplugged.

I haven't read your diffs below yet but why not allow PMD mappings of
the hotplugged memory (not vmemmap)? SUBSECTION_SHIFT is 21, so we can
have 2MB blocks in a 4KB page configuration.

-- 
Catalin

