Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372AC10A1E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 11:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1Z9MD0P3+W6uowOTKwxONeryUThesOLTV3fUIqlgZA=; b=Kps7aA62lfLG7OkdEmL46ZEblb
	i9OrXG7CmHyFAPOBfqIsXiw7ZrzH4MPoYWiQ7rpMpBj83e+UEjfEPicKl//tN9ga5fyMAijUz3GLU
	sU+aVDh6OBSfcC8Y69DrXeqKOyiIAXZ/a3wYmAJ8HMAQpEMxnbwX751m0z4JX4E9UPJQukVi+uHud
	rp3QH/esw2C+yuWY6HBMz+rCX8u40s/AU4cZ6Y7FlwnEKgYcyD6+dlyJFoPeLf2RP8xHTTLnSmR71
	xoaP42m7ASPyqHlgLqyQn+KklEEKXDGPv3BFZGm5B1eO2BCygNOj+cQMAX1OZ7jOP/egWYYIq2u5x
	T74KObDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5iTQ-00000005JRh-0Gn6;
	Thu, 26 Mar 2026 11:02:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5iTM-00000005JRD-085q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 11:01:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E3E54325A;
	Thu, 26 Mar 2026 11:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA73CC116C6;
	Thu, 26 Mar 2026 11:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774522913;
	bh=cBYIciqF4XISq/WTZKspw6Udl0Wcav49Oqx5YmJNA9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MXBsn1Hc4q8uWGw+iRgZ7S//+jHoBIhR7v9OotYZboduheWkRk4OZnOlVK1CEplGk
	 UVf37Ycvmr6g+6vL8o+qK3TZ3XzbvJqb6rUj4EnhltaZec+MVlqFzC//tajJD2D110
	 RUkqHnWNxgwxrsR+xpBZfVozTDWClCeDXsSicwPa2pqZ/wBQpqHgsHxZqJ+eho91wG
	 IJaVeuNmreyOIImMBQR98Nxrb7lAYWpUmPM/KtCnSyO6YbYNuZyuUIXktTYyQAb81Q
	 FhGzjlGjO2xWPwVqnH4ju5WDfAcEcO3FLBJ3x7Gt66A2HC58t+0/MyBpDofAm8/tRQ
	 9m3aTgJsk98RQ==
Date: Thu, 26 Mar 2026 11:01:46 +0000
From: Will Deacon <will@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: bpf@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, kernel-team@meta.com,
	anshuman.khandual@arm.com
Subject: Re: [PATCH v2 0/4] arm64: Add BRBE support for
 bpf_get_branch_snapshot()
Message-ID: <acUSGgfXfX_GUEh0@willie-the-truck>
References: <20260318171706.2840512-1-puranjay@kernel.org>
 <CANk7y0jnY-V7Hv912gwc45jSx2UqLw5PBcdOdoFfS175bNuDmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANk7y0jnY-V7Hv912gwc45jSx2UqLw5PBcdOdoFfS175bNuDmg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_040158_426566_0A8C71AA 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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

On Thu, Mar 26, 2026 at 08:57:14AM +0000, Puranjay Mohan wrote:
> Hi Catalin, Mark, and Will,
> 
> Would you mind taking a look at this patchset when you have a chance?

Adding Rob and Anshuman, as they wrote the perf driver for BRBE and are
the best people to review this stuff.

Will

