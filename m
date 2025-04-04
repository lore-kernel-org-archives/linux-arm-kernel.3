Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0658C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 13:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fex/0eMatylft+JGQYRFLgzOgTYQlU1joTJCA/2VSsk=; b=rRV07SInrjtFy5CJqOVdfzt89T
	WUt+AhS48E1GezBe55uSC5l2DMSJ/CWYaIejiFhi1bEPRifdCfAeRuGFA8ChAlPn9gSIJOguJ/fTz
	e+iXasouxQWb+U6Y1oaooYrqpdEDaTchwfup0UDKWXPrdzPOK8iAfxQBKcgBxaVz/1Pv7fucMBRvk
	rPf3ieq5NeFF8GG+4G6zTxhrsH1zfa/bSjHZyUAmfS83RGJolyDSGz02GRUp4ySyBe7E/oj0Ut2tO
	QJc+lh7ZfhJVJXSNzt1fsKCqxrM5soWJKIlWkc6rPMAoMviz50By2USpfBOE8aV4hNfEQVmy3mlSj
	QNrPmRvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gjR-0000000Bkqk-0NXu;
	Fri, 04 Apr 2025 13:05:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ghh-0000000BkhL-2FMa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 13:03:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6760D44FEA;
	Fri,  4 Apr 2025 13:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04D4C4CEDD;
	Fri,  4 Apr 2025 13:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743771804;
	bh=VKS0+pJnSKPr/yDgnLfPzCkGDWYd0/lQhSYDHe/+6dA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dm4Os5c5HiiHKMFMLtyK10MrkoouADFBXOuGYhZ9NYG+RKuB0danG9d8b1/q5omIF
	 TrX9YYN13EKoFIZLIYiBlKHe+lKAcEy1L1g1uHbrpWb8ZPmTknjZk083ADJ7CY4T9h
	 ZKs8y5mZcWkDa3RMOaR1U7pzSypZKfs16w32fRSnPcPOYVNnQi/+sfQD6E7YA2Jzqh
	 rdlCOzX5MN1Rvbu81k42Hk05CJZhvpHd3arNK4CwcrLgvDgWrLofzEhxG2M/PdBEok
	 /lwFrGViHa5QLWag+ztYyVMDN9qMS503HOZ2vJ9ao3p3ODZmgeY/pFXatvyMA+Wd29
	 QzHfPBFrdA+xw==
Date: Fri, 4 Apr 2025 14:03:17 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Eric Auger <eauger@redhat.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Florian Weimer <fweimer@redhat.com>, Fuad Tabba <tabba@google.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	James Clark <james.clark@linaro.org>
Subject: Re: [PATCH 00/10] KVM: arm64: Backport of SVE fixes to v5.15
Message-ID: <20250404130316.GB29089@willie-the-truck>
References: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
 <1b4ce8d2-2e0e-49ef-ab91-4a831e22b8ed@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b4ce8d2-2e0e-49ef-ab91-4a831e22b8ed@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_060325_590292_C79327DE 
X-CRM114-Status: GOOD (  10.53  )
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

On Thu, Apr 03, 2025 at 12:16:20AM +0100, Mark Brown wrote:
> On Wed, Apr 02, 2025 at 11:59:32PM +0100, Mark Brown wrote:
> > This series backports some recent fixes for SVE/KVM interactions from
> > Mark Rutland to v5.15.
> 
> *sigh* Forgot Greg and the stable list here - will resend, sorry for the
> noise.

I think you made the same mistake on the 6.1 backports too:

https://lore.kernel.org/r/20250325-stable-sve-6-1-v1-0-83259d427d84@kernel.org

Will

