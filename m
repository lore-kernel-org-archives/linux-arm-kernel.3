Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E95C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 17:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZMJ+k34BZvUJWvOS5Phgh0C7i61GvZ10ImHVj3eCI4=; b=hGEI1V1RvlMB65+4jeIOGs+NtS
	Qn1xJukEOKfDiuoRlDCxuVlQJv+8gcOU8c+GfP9Fo4Mp2Yd2PzuIquL+yPATdm/nbxKlW6+7rpu7B
	7yHNTMAvIghQ/OBq8N4iIJni/Ldb8bx8gwaltmvDuE5FGnazV6bs416wxUbYj1zAEiZPQ/nqxHx/0
	15wGg8BEcRjYgIq75TZVt/IOWqJ56lgsO3+xrzpTvUPO6CnO+Y4PO3gIsTIm344BSG25hvHCbh37q
	JG+5bNIoYH4nyLOS1Q0IcgjEi03RdzbDm1WHUFtKEpNN3FR+Ft3n1FiEWaIxepkjkkFVzroBJ5YRo
	7QHA2cUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugnnU-0000000HKY7-46yB;
	Tue, 29 Jul 2025 17:07:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugnEt-0000000HH7b-1us2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 16:31:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 330F243720;
	Tue, 29 Jul 2025 16:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE32C4CEF5;
	Tue, 29 Jul 2025 16:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753806703;
	bh=1dkxZGkmuXVhfESsKgV+CRMmTLpxdc9oKXATIi9vcIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p26GeTUqOA1PeWl1t8jitMJV6dUSclnyI8FTib78TlJdGSUqKco9fXR0TqdNL//2N
	 1O4Jm8HPbyFdVhL5AvaUkL1Ovv0tI9tgZdxku4C4b6rLOYLNzVYnn3wMku55diK4/J
	 cibZ0RSpKIy14kxmVDjBwj3bVQEVH+TXEmErN6mGswnMkGkH986dsBZbR/NC1a9JcR
	 DCvLbCm03u4ykOdru21TAcXgzYpZuJZwGQ/2ZYNXCz09gFWbBs3/I6t92v3BZInM6o
	 zhvpOgFZqSDqEHa4CCwTnHrEMd3Riy3zsnd4mHmVlgntTzqcyIx85jW6F5A61z8y5o
	 8YfDKRtqeVBOw==
Date: Tue, 29 Jul 2025 11:31:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 04/12] dt-bindings: display: st,stm32mp25-lvds: add
 power-domains property
Message-ID: <175380670133.511931.13043391606503114133.robh@kernel.org>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
 <20250725-drm-misc-next-v1-4-a59848e62cf9@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725-drm-misc-next-v1-4-a59848e62cf9@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_093143_511520_372CD7BE 
X-CRM114-Status: UNSURE (   9.00  )
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


On Fri, 25 Jul 2025 12:03:56 +0200, Raphael Gallais-Pou wrote:
> STM32 LVDS peripheral may be in a power domain.  Allow an optional
> single 'power-domains' entry for STM32 LVDS devices.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


