Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A347DC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 23:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXIOzY822ZbNj6Zi0lXst7TJoBz0pxnoTDtcL7T3MoE=; b=iZF3mwmefQcgCwGRSZEp4qDOC+
	ef8ScM2yJoUNbFU54GnEautXBKEttGxllP/awCN1fNFNQ9dbicOVHYCpHTMA6y0bb+WV19wki0x24
	SnQqaJnhTVzKGPTDhmOeMUOT7bdyoilhrZEroT9BcwFyw4ctYbp85vCXXFG+cOKxsJxVaLDJgg9N4
	kmCuj9jjvvHN89JEZuWSc/8YNoDPfLA6qtPlUbj4q6PE9Fs5fgaKNQCx73tqDjAhBMJxC0dAYYB4b
	nMCySFrhYiq1kbfIjXuk7Xl+i9xvHYsQIgniWwM/JtfcPBCxRSunzsrr0jrvD60kC4Vtr7kQb21iw
	Bv31ZtpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYCoc-0000000DMGH-0Rth;
	Wed, 15 Jan 2025 23:28:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYCjA-0000000DLD0-1k76
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 23:23:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 31B015C5EAC;
	Wed, 15 Jan 2025 23:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91373C4CED1;
	Wed, 15 Jan 2025 23:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736983391;
	bh=CXIOzY822ZbNj6Zi0lXst7TJoBz0pxnoTDtcL7T3MoE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=EP0NUy+PlrO9mL2q+KmyUaDXGhAHDEt1C605a2XWvc+sQ44xay7Yhtnm4LpeWImGr
	 XJhq9HRdISRK4rTqfq+VtM/3LUnoOlHoLqH/WB6fqWGaM4b0XT6whDwV+RMXhN6qdV
	 RjjnMFmoZ1M6gy4qMNAVGUZbPwzNZccediyx1hp7rLU15QFpvkv4PAbEAGcUGHyWbK
	 ceJ/JYdve1Ee8ENRE2gy+PySLsO3FBGeZjXXNC9E7nMC12fb2gp2ImgzA5p9L7Njv2
	 NCmgSyVWJLTa122EJtNYAiGGuwqYRb0qU0uQRo4qQt9OMezpmhVgfTcNHH1UX/ApCn
	 YjrKxwx8Lqxpw==
Message-ID: <4af9d643e1f0d3b291d7cbe7445bfd2b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250114182021.670435-5-dario.binacchi@amarulasolutions.com>
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com> <20250114182021.670435-5-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH v4 4/4] clk: stm32f4: support spread spectrum clock generation
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amarula@amarulasolutions.com, Dario Binacchi <dario.binacchi@amarulasolutions.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 15:23:09 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_152312_502785_CE50168E 
X-CRM114-Status: UNSURE (   6.31  )
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

Quoting Dario Binacchi (2025-01-14 10:19:49)
> Support spread spectrum clock generation for the main PLL, the only one
> for which this functionality is available.
>=20
> Tested on the STM32F469I-DISCO board.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>=20
> ---

Applied to clk-next

