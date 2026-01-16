Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E5AD4A5E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 02:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6nAh9WEhv1qlLYlwYCxGfWKAW8xbg4sxdf3jcwaJzM=; b=a6G000TY7n8nMZkRTBimoIf9ve
	t/nI8+8LukBlwr2sXHb3z+xYzF6ryeCwRxFZEJge9XGtxG2odeahvSuLZdo8XVrwFO8fMNBLUHtBM
	ojFmMuDhQEALNxrQVAEhFQeRK0/XRCcfBx8ZieWAVOs4K3xghjVuDaJUb55MJQ6nFkizOgai7I51k
	nNyS26KQvsRD1zKbGEY33YyG1ps0eKdUtFSKv3dNjlyN+vYdHKAT3Gp4CavUxdyqEDLzBeYs+6WwD
	1gVNIEzv4Af+HVe8ZtTirBXgeujnUjFYuN940NTMtzR4XgzJNgPVccD/sMc91cZFu4NXjbmJTPeJ5
	S9ANA8bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZuZ-0000000DUIO-48lu;
	Fri, 16 Jan 2026 02:50:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZuY-0000000DUHg-0uYh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 02:50:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E79A5441E5;
	Fri, 16 Jan 2026 02:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6E0C19421;
	Fri, 16 Jan 2026 02:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768531805;
	bh=C6nAh9WEhv1qlLYlwYCxGfWKAW8xbg4sxdf3jcwaJzM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sW2ZESQ//gOu2/bLdQZ4ley/N1w///Apqjmm5Avw+uXTeq7ksem/4gyTBtX/W7hEi
	 qNvhMfjamV458nTNHtpHAJysXx1B0DPa/MgO/mpAvUggTchmYOk4okRIg1hG0esLsP
	 SWyQ1VpBaF4GqZMi2bxzd7Rt9SNlqCv/ZtaLeL2WjRmQ3P55983Vi3JMdToK2/Dz4j
	 Hvxg0eQ9U60P6OI+O1tTAooKuG1gKs6nUabRa3juh6Uvc4cI9BOeh1BLPy70Mt1rO3
	 hnAS9XokyYokFP1ZlFd5M/k1a3r+TMVxhMnlkTu5c5JDds7qVPGh0he2kuoZiyUFg/
	 6PSZ6YfPeXKRg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251224112239.83735-5-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com> <20251224112239.83735-5-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] clk: scpi: Simplify with scoped for each OF child loop
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 19:50:04 -0700
Message-ID: <176853180402.4027.9954621949957528699@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_185006_284362_0BBD612A 
X-CRM114-Status: UNSURE (   6.08  )
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

Quoting Krzysztof Kozlowski (2025-12-24 04:22:41)
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Applied to clk-next

