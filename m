Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B13AC4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 16:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4nlqSDTQfKgXnssLdmt4BpD3msEFfZZnZiCI8vkwJk=; b=d1o2XkQdUWuC3NzUDTZbM0wWrq
	y0pUXQd0W1EhBkxKyFMpk2C1jIQ3hySIihBgtyFitig84O9zFv11IvUlIewoHeB7OmwYhKHdXt+Tf
	ncQ95ifMyOIvooBrqc+wosoCMV133GMrYDvmollLUClq1B+JGz11b6bxXMcZEUDBC8JuZHriLnR8Z
	MNqcGR9r/tkTKqE9OwJUmNZnkrD2C2hopqGWtBEZk/bagCIByrF6dP53z8yluZWJPanQLSXJ+H5HF
	sQCB1tjBW9pLN939MFeA/JT+IV3l7Xd1ZQvxXF1iUzx5YnoIb9tMATQMTYHDzMfgQDUKaRG4DRR4r
	JTvCWrxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZhg-0000000CK6L-2WRB;
	Wed, 22 Jul 2026 16:21:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZhf-0000000CK5k-29bL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 16:21:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 76421600AB;
	Wed, 22 Jul 2026 16:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F581F000E9;
	Wed, 22 Jul 2026 16:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784737310;
	bh=X4nlqSDTQfKgXnssLdmt4BpD3msEFfZZnZiCI8vkwJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K1Yl/ye9GP5zGKTMMfFEQjKOVnbf06k9O6M9LFLkIXuL3qh8TZ4CE1JuxW+NQxlt7
	 j6DdGu1sHJhsqKlIh/tvLdfemqB+/FJU+2jHRsbhCfmd2/RxFGIBRi7FQ21FqrJlLZ
	 TWrVkMVfbhn5cv6lGEuM4mp0802PWhXMSIKzx6NU393U8iT7usXc41YoxRmbQNqRAK
	 ZWau1UuybNFE2JOfF6ithDRuCR1LdESOauAZDApQWntLyTj6Hto12+L6kuGbX34yaM
	 3ibRtv/kBrl9v1RCfklHGv5Ljsq+8D27BKJkzmOoW/LSloBTphcwdM8rrVADvm4V21
	 giYYr9J77kX5Q==
Date: Wed, 22 Jul 2026 18:21:31 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com, 
	rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, 
	arnd@arndb.de, gregkh@linuxfoundation.org, daniel@riscstar.com, 
	mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com, alexandre.torgue@foss.st.com, 
	ast@kernel.org, boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, 
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com, 
	inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com, 
	livelycarpet87@gmail.com, mcoquelin.stm32@gmail.com, me@ziyao.cc, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com, rohan.g.thomas@altera.com, 
	sdf@fomichev.me, siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com, 
	wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 12/14] gpio: tc956x: add TC956x/QPS615 support
Message-ID: <p5sfrfa5prxsuznqdjnuusgkj4vyl3aom7gorpdxb2iroxjpgp@7wyx4rceybac>
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-13-elder@riscstar.com>
 <dhnylud7o5dhaaq6kvbes4vkml3ppa5ev542j2lyxdijibknzg@pfcy22wz6jav>
 <df217d83-272a-4d4c-8aba-a87e4b8869fc@riscstar.com>
 <z6fllvxd5r7bln6t6o5cacf2k35c47mnavvkmda6l4gnjaanin@52o34je2alxw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <z6fllvxd5r7bln6t6o5cacf2k35c47mnavvkmda6l4gnjaanin@52o34je2alxw>
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

On Tue, Jul 21, 2026 at 04:43:21PM +0200, Manivannan Sadhasivam wrote:

[...]

> > - Does the TC9563 chip have only *one* function on its embedded
> >   endpoint, supporting just one Ethernet?
> >     - If so, this driver will have to be modified to support
> >       the second embedded function and Ethernet controller.
> > 
> 
> The driver assumes only one endpoint, but the binding lists 2. So the driver is
> not complying with its own binding now :/
> 
> So technically, the driver supports 2 integrated endpoints.
> 

I was wrong here. Driver supports only one endpoint and that's due to TC9563's
hw limitation. I confused two functions defined in the binding with endpoints.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

