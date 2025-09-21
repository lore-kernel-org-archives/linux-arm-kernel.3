Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F2FCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 17:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/lBJw/pvOeOhA+TnoE8B9EgHverZBvwU1Z9gNAbIbE=; b=aatgNFJhSbB1lAFkHIYB6eFEe5
	EhhGVzhvsfiw4YS2MugNRjYKt0q8s1Gs0N+DyMW6rl6x9hNSAIuWrp4+OApuwCr0qY1BAo+ToY2PO
	8fMTgC7ffRUWZmEy7Uh1fyR7XrL1RSD7Y+1F99E8ekIKJCV2578u1CuO42CT13JNv3+2xfy/N9lCU
	wk5sG/HnmV4InKKJzzbdWWQjZQzvHP77ES9LVho0MFYqn3EWfBZYfGSdsRX3BNJHNbL2azm22OfdW
	wfx++ULmmcj9PfpMjfncYcNjxPzFV4u2ybrEajg8tbX++Q9xnZkMozZ26bCXTeBnhBsIcLhSHeeYL
	KpoqYc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ODM-00000007y9K-0ShE;
	Sun, 21 Sep 2025 17:51:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ODL-00000007y9C-1bCC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 17:51:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 668AB600AE;
	Sun, 21 Sep 2025 17:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E615CC4CEE7;
	Sun, 21 Sep 2025 17:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758477066;
	bh=e/lBJw/pvOeOhA+TnoE8B9EgHverZBvwU1Z9gNAbIbE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=utnWX05/rsIn1ShsYYQQjUjEpkqzGWCNfoKPCRIbfgNZyHfKxFOZtvWJppj6U6cvC
	 WMvyP9nTRqm4EEonMC8BI0pZLyktz5kDMjV7s4f4TxO5iu5GORbRq8Avv9+wL/dr/z
	 MCp/Olzf7wjDJSJEIwsWjIL6CkTIdojhXUPG8kksZYbk7txcQwdfV2DVbbE+m5noyu
	 OGIUOk7ORLhJX9Z3ACX5VXJqhvg7Djc1/3rdkKVJtpflAWzlBPivFRoSqyc6ZbUpQV
	 8gWRng22bVbrlLSuLGf/emRwdTfSaZALXmyjkcHzgXOpV7e3KPYzQjl7yNUos1/Kgu
	 5A2cX9kHttFVA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250913-pxa1908-genpd-v4-3-55e4cf32f619@dujemihanovic.xyz>
References: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz> <20250913-pxa1908-genpd-v4-3-55e4cf32f619@dujemihanovic.xyz>
Subject: Re: [PATCH v4 3/4] clk: mmp: pxa1908: Instantiate power driver through auxiliary bus
From: Stephen Boyd <sboyd@kernel.org>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Duje =?utf-8?q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
To: Conor Dooley <conor+dt@kernel.org>, Duje =?utf-8?q?Mihanovi=C4=87?= <dujemihanovic32@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Date: Sun, 21 Sep 2025 10:51:04 -0700
Message-ID: <175847706450.4354.2268547686521833352@lazor>
User-Agent: alot/0.11
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

Quoting Duje Mihanovi=C4=87 (2025-09-13 14:12:50)
> From: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
>=20
> The power domain driver shares the APMU clock controller's registers.
> Instantiate the power domain driver through the APMU clock driver using
> the auxiliary bus.
>=20
> Also create a separate Kconfig entry for the PXA1908 clock driver to
> allow (de)selecting the driver at will and selecting
> CONFIG_AUXILIARY_BUS.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> ---

Applied to clk-next

