Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2449BCD3423
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 16:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gU8wGABgGbVaNUsM1tHa0aLaqckse0CQ3IDkZfd/MY=; b=nbAC/RbBKi6FJP3UCjmVVl0WPK
	CSsjNWkwqdfGsibj/hV8JVU1ZA/+OGzJcmaVkvagPhbfwOzuePUZDUKHh4SsomwKOudkyL7bcFF8u
	Y4OnvAwdpUovSGCoxaFhETKfx7hrgzx6rN4Dn37WrZz2Jim0P8M6IXJpthCLwJsLgshcg9MJmQY5e
	FsmIwSgPekWvy0IFosvs/Tu9/jcMmoiofmMW6ONl8Vcq5ErtSHiet4jJ4LcdnXhnx4B0dx8Z0l+Kk
	RiOr/oEAOUoEIE904P36A8cjmiHG3y2NvN93D+hMhGI8qGuHUASfP+/G0NpCfq4nMR4yEB9/4kZjM
	+kclaVmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJDUs-00000009Lej-3ZNX;
	Sat, 02 May 2026 16:47:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJDUq-00000009Le4-0kLw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 16:47:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C1293439E4;
	Sat,  2 May 2026 16:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4943CC19425;
	Sat,  2 May 2026 16:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777740435;
	bh=zymvXjOjeTSggFeuoM050BBTeP4ivuV+K0ZODz63sG8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C2a0Vi3QX0WD3xutTIXFvjrVMuUqle24NF4BAQHxyUpWgq77agsQiQDARZ48oGEr8
	 zWeFVrQ+2yNo3XsQXXseVTkoumlvbwMcqRQ9Yrv9/oCfoJJfiKSyfy/R/1KWeM8Ejx
	 j3kgXK8lc2stL15qKUXCkaF9uBbZyYkkj9ca4JUpNJEbRoD1qD1piUoN2e5hAWLFZo
	 hmI8PjcAL1L79x9BIkN1E2eRROzi9GCkLp+6y/VFSfpgKhQs2XFoSYrQPXb4whpnxD
	 2Fh+iykG/8DvSFLTzfAlLeLNrYwBZESP4BuukCRYY4PUWPAJsNa9OBiyeLZcaDz2BO
	 p7nB8soAtHKMg==
Date: Sat, 2 May 2026 09:47:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, daniel@riscstar.com,
 mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 00/12] net: enable TC956x support
Message-ID: <20260502094712.69b29dc8@kernel.org>
In-Reply-To: <20260501155421.3329862-1-elder@riscstar.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_094716_236704_9E24BD63 
X-CRM114-Status: UNSURE (   6.07  )
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

On Fri,  1 May 2026 10:54:08 -0500 Alex Elder wrote:
>  create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
>  create mode 100644 drivers/gpio/gpio-tc956x.c
>  create mode 100644 drivers/misc/tc956x_pci.c
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>  create mode 100644 drivers/net/pcs/pcs-xpcs-regmap.c
>  create mode 100644 include/linux/pcs/pcs-xpcs-regmap.h
>  create mode 100644 include/soc/toshiba/tc956x-dwmac.h

Please add an entry to MAITNAINERS for tx956x stuff?

