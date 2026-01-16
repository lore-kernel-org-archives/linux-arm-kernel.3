Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E154D4A5EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 02:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3Jva90IEIEzzjSj6QCrxX8cTuh1SiHfpusgkKjtJRM=; b=GO3WvZIkCuYingQKujB0VdiBh7
	BiekkBMM52ur2zldsGa612Ai2tiZ67mSPhEZ4Qh5q1ItPAaIp+3gbdb/Ky/o6IEB/cTJ0/siAXNcJ
	/b9kn6KaIdy99DLEq6zf8ypalyAKFO9X/E0K2uuwkQ+n6PGA06lPl+uQ03jVuMJ7h9O8AIUbNrb3+
	LhBEVoMLWFdDEG/YX0MLV7ICKD1phUGgTdKczi1LS2baE5ttMfIwj6ZfOJAOQqKTfmiIo2eb9MLqY
	OuKUqlbhrcDPjHzizUWJQNAjFbYfEWtI+A0qelpUbJXIR1rkaGTAx4OnLdpHAs5vG9b1shY6k1kaI
	kyPDk/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZuW-0000000DUHP-2soY;
	Fri, 16 Jan 2026 02:50:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZuT-0000000DUGz-38FH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 02:50:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D0D043DF2;
	Fri, 16 Jan 2026 02:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F02C116D0;
	Fri, 16 Jan 2026 02:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768531801;
	bh=r3Jva90IEIEzzjSj6QCrxX8cTuh1SiHfpusgkKjtJRM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=O4GoxoenZ0jdMpTJh6n7/FYxPjAWOmLfrcGOFYBneqioD8A+W4sLKprtKEQchq7K7
	 CiZVtlGIZsN8Z5DX637gogpbP/s0xnw/lnt+qR04WBwPuMiI7vfV1tNGFtIKZu4mj5
	 i99m4DTHozGgGbApSJDX4RUrwRBAzVM16T1ZZWHNpdTnp8BXa/8CYMZrDMcXEe3hdY
	 thTNxLDKSTb79DqUVKPJxyUrWfohHjYfow5RFnIAHqg3nT3/1fwxWX/ieTwXP2NFBi
	 b0aYrTafBR7hhsZulnrODUi6E1lhwdTc0kZQNq31/TbiQRvgggwKP9wf3trJMfO6nz
	 KuaoypT/zu6TA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251224112239.83735-6-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com> <20251224112239.83735-6-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] clk: versatile: impd1: Simplify with scoped for each OF child loop
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 19:49:59 -0700
Message-ID: <176853179908.4027.13756853598348225764@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_185001_807141_C7131D18 
X-CRM114-Status: UNSURE (   6.28  )
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

Quoting Krzysztof Kozlowski (2025-12-24 04:22:42)
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Applied to clk-next

