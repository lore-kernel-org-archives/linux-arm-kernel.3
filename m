Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9696C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 11:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0U1pp57kNGjRsF9u4f7an6nWWJAn+U6qP/rZvkgRDk=; b=sDbqH75TUGZ7f3ATOjjZ+i5MRT
	/fU3fMQoaN4kwbhOc8OYd/QGOsoKv98TocryADFtTsqcre2T/MGJDOJj/m6zVeiliIUmfJl1SBQSM
	vdgGLYSQ9+rS4uN//EFCzgSV+zfB+FeLOcNln8qMv7is4Szm3ZGhK4TpQ8Cx9k8sk6PD99UUXo1BQ
	pPWL+Yv1JdXQccOqRum2SJCsm6K1l/3lAHMngriydjzCjRRh0AB7fUmEti9kDzhK4HJRXprg4gwBS
	slyvK0oIk/+5NE7+8jY7ll1kRie1r2i/9Qe5m1qkcmrknwJDreIGK+WOzRkmub2jQwmIi9gfEP6Pg
	Ts57IwFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6sP-0000000EOy0-2LPa;
	Fri, 27 Jun 2025 11:04:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6i7-0000000EMk6-3ViM
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Jun 2025 10:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=R0U1pp57kNGjRsF9u4f7an6nWWJAn+U6qP/rZvkgRDk=; b=dfSa2AZjtqQLhTil+r8ez1gmKk
	m/6rYxaesj1veFL1tZ5RVfLCJG3oaix/dL9qShcl0timzlznsLHyJPF6iPd18vom3M1t/BOzcAFEz
	9qtmr3ylpHVi3YikiZ27cJ3tq4C2jpxUgM4zBw05ZAHFRal3+zYkx5kNXryhSSx7fsy19OMDxi8fc
	PHupLFwM/4nO4zCXQgh8BCl+g3ebs5o35oVqwN8fbIns0GZNofPE0U6UqyxovUr3lOEuogojRHtUg
	ohxWJTOpTELWQK/ps92f729rKTxWLYL9qR5l+5gR74WQc09evD1pHVUOxdn6wMpeouj84cu9U8Q8u
	aSS6vJbA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6i4-00000006J3H-3Mtq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 10:53:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6E3ADA5231B;
	Fri, 27 Jun 2025 10:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CC2C4CEE3;
	Fri, 27 Jun 2025 10:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751021611;
	bh=VCjbvRdf6XSyodZZQyEnO3752BxeuOjhcMPqXymOMWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kwzJ9fZiZW0Z7dWIRbocLMuMAmCxPeBuzff8/2znikaRc1brjLdOwsYYf2XesGt1d
	 duvcWDO8WMkc4zpbViTfwO/sg3qDNiOdTBOn1GFuvls0iP8rAu1Mz0RkaFkXx0Vvb2
	 ge/2qRgFkb66/3uv4nwbwV9pDqZl0lakEs8KP0lQsAJEww0LVJ+vSNSC09pg4O1VXT
	 cE/0Z6NocHUxvdPi8s1MfCCau6V+qftv/mVkKVCekNLTzR3ypRxUJPqSbOZBmTAxSK
	 zVIFkX6ZroP0LjIUo88wDbNQDZtNeOdfBcGR3K1kpUmXP6qWIdIZDT2mT98EDZ8eKe
	 FQ7MnywY0WvcQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250610-nvmem-bit-pattern-v1-0-55ed5c1b369c@kernel.org>
References: <20250610-nvmem-bit-pattern-v1-0-55ed5c1b369c@kernel.org>
Subject: Re: (subset) [PATCH 0/2] Extend nvmem patternProperties and then
 fix W=1 warnings in Apple dts
Message-Id: <175102160789.6398.6252477701848323795.b4-ty@kernel.org>
Date: Fri, 27 Jun 2025 11:53:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_115333_194399_4D00A7C3 
X-CRM114-Status: GOOD (  10.20  )
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


On Tue, 10 Jun 2025 17:17:33 +0000, Sven Peter wrote:
> This brief series fixes a W=1 warning recently introduced with the Apple
> Silicon PMIC NVMEM nodes. We have cells that are the same bytes but a
> different bit offset and these currently result in the same node name.
> The legcy layout already allows to specify the bit offset in the name as
> a suffix but this isn't possible in the new fixed-layout.
> Thus first adjust the fixed-layout cell patternProperties to the same pattern
> as the legacy one and then fix the node names in our device tree files.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: nvmem: fixed-layout: Allow optional bit positions
      commit: 6aa656ce94693c8712c004045375e2221b157659

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


