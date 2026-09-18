Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58E4C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 18:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVvhZgH185vXWHMF4dY7CFrAOe2TUu4g/2/OXvW5ueM=; b=CP/irxNi/6A4rRRkZIGUVJrzzh
	l7ap9McrU5x7wu6reakOoMin6CeHCQQnYuRuSBwrMwQ58TJrnoyVdpk0DqyH3L7ffwnbRd1k1J2Ux
	WNYVGYGQDIffh4lHcWzBqbgmxigo0L1ogu1k5atSAhM/R9fqKo0lj5imXgV7HrbqfsHV5cxG7Rcf0
	gT4Avl2y8AJrVDTPVILgGLV3yslcK/xSvFXtgjTV9G/Lzcm2PhMQn0zmcYeYn2lzq5ldEQh0I+EYo
	OahXryL4xPcOzUcHkMUR8N2ncxl5Uc6+0KxzQC06lf7jkA03ke1kMsc2kPjFyLYTYAHAslp3sZ1FO
	IRpgPmHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dYo-0000000FLNV-1bum;
	Fri, 18 Sep 2026 18:43:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dYn-0000000FLNM-3bVM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 18:43:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BF0641AF4;
	Fri, 18 Sep 2026 18:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CFC71F000FF;
	Fri, 18 Sep 2026 18:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789757025;
	bh=oVvhZgH185vXWHMF4dY7CFrAOe2TUu4g/2/OXvW5ueM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iHusVHAnEvbBJ/dcOKnqLymSTSqjISrwxzsETIoFwmR170jNYckovMD5RJ2BtiCAa
	 qGOfM5eyiL1y5y8lZPaU6gQQJcShp3bJ8qJY6BO4MkXVhklK4Ajb9kEHeNONBs0iiu
	 Qq5uNu9MRVoTCkNUHbF51q9c0yqOYu9wN7WS0y2ya8YY+ZuqUFKPygDu07Qx3t+qPy
	 QCF3k0pBN50nXT7gjV38j/AqYnJjKwHCajuPluqE7ZC1uFqGKl0QSeSebcNNXYxmVM
	 2ALbq0ujV9LaHSLD7yBLG7rkWttkx3Oo6D9KY1Op2/aZJyx7R06qQTwMrdB1qXoIRr
	 xzK7S6t6G/u4Q==
Date: Fri, 18 Sep 2026 13:43:43 -0500
From: Rob Herring <robh@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Simeon Marijon <simeon.marijon@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: add binding for STM32MPX TAMP
 backup registers
Message-ID: <20260918184343.GA1358633-robh@kernel.org>
References: <20260910-upstream_nvram_reworked-v1-0-521c16175cef@foss.st.com>
 <20260910-upstream_nvram_reworked-v1-1-521c16175cef@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-upstream_nvram_reworked-v1-1-521c16175cef@foss.st.com>
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

On Thu, Sep 10, 2026 at 04:11:22PM +0200, Patrice Chotard wrote:
> From: Simeon Marijon <simeon.marijon@foss.st.com>

If you respin, drop 'binding for ' in the subject.

> 
> Adds the binding documentation for TAMP backup registers.
> The backup registers is a part of the TAMP device of STM32 MPU.
> 
> Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

