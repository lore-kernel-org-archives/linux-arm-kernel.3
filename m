Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77DDC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 22:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJB89FzkhwSIbHXzs/7zaZZGPG1GIi2QRgI16BLxGOI=; b=EqzSJfBl6FdCCuKyasiLY8SMaA
	PzkoMoxaZSMbVUhL3Z6ilEwHYgxymhCSC0mrxjJX8Rk+RCsAY+X3LTpvnszWeNN6p4axiTZuGWPl4
	kAn2GI/F9eJ81ZbB3+f6jwWXPjcDswUmbKXKbVTEmvQRZhnuQfSEsuof5uYpp0QESSIpxIlMvsUeN
	9UOqG/UTFzetO0nS4DFkyyHybDBikz2DDcdb9v0nWYMJjk35j/8HdZAfo6T78vqgfn+/qXdRwV/35
	3NyL8aPadJpYMUttkUAfJ5cm6Hy33qBsr2gVL+TOPfi0qfe9qN2ufGCnjeYvNff3MkaKihouhEXVm
	RDdq2Rdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8aK-0000000CpVR-2MIZ;
	Fri, 28 Feb 2025 22:11:56 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to8Sb-0000000CoHV-1tvf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 22:03:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D6DD96115D;
	Fri, 28 Feb 2025 22:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82329C4CED6;
	Fri, 28 Feb 2025 22:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740780236;
	bh=AJB89FzkhwSIbHXzs/7zaZZGPG1GIi2QRgI16BLxGOI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nPmoMjVplmDLnKgNTdpJMp/9BWvtz7PIMQNubFIwAKooZsBFcs95QFMcHEN3Gw4E4
	 tQ9I9TkSCDYsmwxSTmFR47mVCJ2OxmjbRmQy35IxMG0mMlc4/+fyxRI/UdZtE5/vUM
	 s/yTKfRDh3Pyt8I0Fjg1DAXB28K0qCpne2/RwUs352zf1hiN4VC5xdL1aSWedb0duq
	 ZLnkRxRZCb868YrJcV98HI6Vmd8vrIOWk9nil4mtHZ4LoNfjy+xCGK4Ey3fC+lYpDw
	 3Y7gmah0vMhqUxDcAnehiDwhVSb6Qi8CGoDkLnortrZ5WNgXXUB+WPqeYNyKN2dbsa
	 +hUgvlML+AP1g==
Date: Fri, 28 Feb 2025 14:03:54 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Philipp Stanner <phasta@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Huacai Chen <chenhuacai@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Yinggang Gu <guyinggang@loongson.cn>,
 Feiyang Chen <chenfeiyang@loongson.cn>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Qing Zhang <zhangqing@loongson.cn>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Henry Chen
 <chenx97@aosc.io>
Subject: Re: [PATCH net-next v4 1/4] stmmac: loongson: Pass correct arg to
 PCI function
Message-ID: <20250228140354.5efff3fd@kernel.org>
In-Reply-To: <a7720a091ea02a6bbaa88c7311d7a642f9c7fdff.camel@redhat.com>
References: <20250226085208.97891-1-phasta@kernel.org>
	<20250226085208.97891-2-phasta@kernel.org>
	<20250227183545.0848dd61@kernel.org>
	<a7720a091ea02a6bbaa88c7311d7a642f9c7fdff.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 28 Feb 2025 10:26:24 +0100 Philipp Stanner wrote:
> > Since you sent this as a fix (which.. yea.. I guess.. why not..)
> > I'll apply it to the fixes tree. But then the other patches have=20
> > to wait and be reposted next Thu. The fixes are merged with net-next
> > every Thu, but since this series was tagged as net-next I missed
> > it in today's cross merge :(
>=20
> Oh OK, I see =E2=80=93 I'm not very familiar with the net subsystem proce=
ss. So
> far I always had it like this: fire everything into Linus's master and
> Greg & Sasha then pick those with Fixes tags into the stable trees
> automatically :)

Admittedly the fixes vs linux-next material routing is a little tricky.

> Anyways, I interpret your message so that this series is done and I
> don't have to do anything about it anymore. Correct me if I'm wrong.

You need to repost patches 2,3,4 once the first patch appears in:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/

