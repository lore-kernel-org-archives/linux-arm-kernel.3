Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C085CC369C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 19:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2iUCs5cFH/1eRLoXilHgWHuOuB3Ys6PpPjSztItutY=; b=lOh6LDobWC3rpaR+thM2HQlx9w
	XlQP6iD2yFrKSrivwhwo9TJIxRVOMmjMMipRbHjtvIKf3esaLM60BssvDLP1tlLZxArL/DeTMgxfF
	VZRYlYYHNnJyShumMDyFmCKM1SDjzNYBHTsRU2MG+uJlGnIkXzgiCIxVsw4H2Q1hz/0cfVP3/omJi
	cOYm9IPhVFhVHiTZ2O75vffuYgFL05QoToU9XKfeFNNtOF520o49Dg31iPko5WFtOOB6IbTULKIYp
	cx+HyTkyeHf7Zlyo6xfM6MUlCiL5dMcTy1Y8nLLnR8F/WdCJF6Yh+VG6a6i4VIsVUjNM0ry2bJqg8
	MUj7xZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u58ku-0000000Ajvb-1xVD;
	Wed, 16 Apr 2025 19:49:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u58j4-0000000Ajdv-0kFi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 19:47:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AFE7D6156A;
	Wed, 16 Apr 2025 19:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B57C4CEE2;
	Wed, 16 Apr 2025 19:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744832831;
	bh=0PhO42tR4MBFdqcoAgVO0dfRkfAO0bYzQ9epoxhkTl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oLpXnQw5WTydD8dgCkBMddqP/yUox0iV1OaMVqsQAEY3dSrmErVVzuHjpU7cl5+5C
	 07UrFlwuF2QJvnZOgPif4jm800A4eDdqIfSpm/TC+TGrruqgWUL8j5P7h78yKa1Bb0
	 a03MF+nu6rzL5ze2svO2CGcV1sPtHJqmv0Io9mMnVhHmBbPxP8f89QMCwLMQBfC4HF
	 dXxS6tW99Ka4+LDRqjQi2WckyJofqEqIKpcqL0NQbABS8TnOcH8M1vp1lonaC2dkbx
	 MAtS/vIxgL6j+bUIW3cI48px4FxxusYxz98zglW7T8Mkt5wkzGJ2R9S8HnyUmFz5X/
	 FzXrUBFfHUuJg==
Date: Wed, 16 Apr 2025 12:47:08 -0700
From: Kees Cook <kees@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, elver@google.com,
	andreyknvl@gmail.com, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, yuzenghui@huawei.com,
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas.schier@linux.dev
Subject: Re: [PATCH 2/4] ubsan: Remove regs from report_ubsan_failure()
Message-ID: <202504161246.AB73A176C@keescook>
References: <20250416180440.231949-1-smostafa@google.com>
 <20250416180440.231949-3-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416180440.231949-3-smostafa@google.com>
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

On Wed, Apr 16, 2025 at 06:04:32PM +0000, Mostafa Saleh wrote:
> report_ubsan_failure() doesn't use argument regs, and soon it will
> be called from the hypervisor context were regs are not available.
> So, remove the unused argument.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Funny. I wonder why I put that argument in there? If we ever need it
again, we can just make it conditional (and let the hypervisor pass
NULL).

Acked-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

