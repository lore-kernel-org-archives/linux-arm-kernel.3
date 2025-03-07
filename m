Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D655C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 01:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRcpbMCmSTtf8OzCIeJhkL1o7h95pO1Ek6cj8Lqm8K0=; b=qA31XBzHnYEQ82W6sd2ihVD6eB
	US/tJZu+/s24ecWOA4WnqFvj5D6RMj5R4wEo4VCzGurT87ZL7k9dKK+Xw3A47fBHn41oLJu/gSOeL
	6AktVnct8SV3ojaGG0yS3+ONXTxsbF3+UAsotFhG4PdiE5DvTGWseWIg4Lh5aDJS66XZjBPJt/jVs
	jGMDgQmVVHOOjCvFEgFi3TxQIALMbc+qY82vmKWQ+TFDgPHVMwi9cOtbb6lc6yX/JiLuchGaqTC7D
	g+DIMmoA14w0YHHnrfhc56nM1ZEx1CDGqIQV3zp3prd/zXae16lp1hAiDyAkBb1cVP/qyYdDjlkun
	Siu5lceA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMWQ-0000000Cniw-03qE;
	Fri, 07 Mar 2025 01:29:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqM3q-0000000CibX-20h5;
	Fri, 07 Mar 2025 00:59:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C2FE5C5B33;
	Fri,  7 Mar 2025 00:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37826C4CEE0;
	Fri,  7 Mar 2025 00:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741309173;
	bh=Cg2qsx4qx6dQxL2dKMoV09fLDr7a4hn6EBItwZqDGGk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Xx49e8odjgKN5abFOiSV4WP/FDGjg6AN+86g670RJ4qn7DNDD6tzDFYOf5sO6pYyg
	 J9uIA95n5YPjL3ubaBjCrbvqO/lwtwbrBPvSulpqdMwTdF4+H5O+MSorPu282E7sIp
	 WGJ05Mge/msv+7DjZ7soWwFlJCMjX5LTiP8Xndj5HiEDpr1Cfoizm0THFCdyq98nJs
	 0s2TJysz2Q0ybXYPB42JpVxbGuwEYcntGG7VjIBoSJp7zY8QgZqRJdmtqUBYKoGKwK
	 EncNbvLjrOCcLU5aGpV9/7TwEVK9R3DoU6vLDbykGzcGDCapLljk5XvGICRlR8A4ZY
	 FITRCI7Qg0q2g==
Date: Thu, 6 Mar 2025 16:59:31 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen Wang
 <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
 <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Romain Gantois <romain.gantois@bootlin.com>, Hariprasad Kelam
 <hkelam@marvell.com>, Jisheng Zhang <jszhang@kernel.org>, =?UTF-8?B?Q2w=?=
 =?UTF-8?B?w6ltZW50IEzDqWdlcg==?= <clement.leger@bootlin.com>, "Jan Petrous
 (OSS)" <jan.petrous@oss.nxp.com>, Simon Horman <horms@kernel.org>, Furong
 Xu <0x1207@gmail.com>, Lothar Rubusch <l.rubusch@gmail.com>, Joe Hattori
 <joe@pf.is.s.u-tokyo.ac.jp>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v6 0/4] riscv: sophgo: Add ethernet support for
 SG2044
Message-ID: <20250306165931.7ffefe3a@kernel.org>
In-Reply-To: <20250305063920.803601-1-inochiama@gmail.com>
References: <20250305063920.803601-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_165934_567558_C0CFE448 
X-CRM114-Status: UNSURE (   6.51  )
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

On Wed,  5 Mar 2025 14:39:12 +0800 Inochi Amaoto wrote:
> The ethernet controller of SG2044 is Synopsys DesignWare IP with
> custom clock. Add glue layer for it.

Looks like we have a conflict on the binding, could you rebase
against latest net-next/main and repost?
-- 
pw-bot: cr

