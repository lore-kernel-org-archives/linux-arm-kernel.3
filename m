Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01268D3399B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8mX4PXEjoqXMUGgb5Mn9KAI5YZMFTWUiBiXo2pQxEU=; b=OBXekraZr5FzJcy2NW9i47UeMf
	Nl4TlFv/fpYdWTxOfs/kWjjMec9SC/kCDWELiXlMAKoKH1LVRM516X2pLg5U9ShYIMrICClOeeIBr
	Of+zRzelffWd72FF4FNimaxCwCq0dhrpYHyUo8183KOWHkyiDYfqaJ/phzDzGJ9aGBIw+l2FMnVK+
	QQZfpDwLuMBLJIPz9Zz2wBUdxKvtAKtrZziMB6tiOTz86gVMV+vvkpG/4QE4P9g4JAAu0qJUGviJS
	UDd0UsjmAvzN13j3G2L+eGPpXwX8weMgyiMKXM9AzjyX1UCdv3Repj2rHhR8fdFiGF9GrBLF4hDSk
	TqX1j71Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Sko-0000000BWEA-4AN8;
	Mon, 28 Oct 2024 16:38:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SRq-0000000BTDj-2FeY
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Oct 2024 16:18:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=C8mX4PXEjoqXMUGgb5Mn9KAI5YZMFTWUiBiXo2pQxEU=; b=CSixJc9KbGoYLDfMbDpJHLrYeW
	aeqSc6UBpwLif9DvpVrg/Kg9xn2TRK3rAuUoDII7dSly1eXME5mL2ZMwuFA+twED1xRHK5Xyj8jE3
	PB1J6eq1bxEYglvPRauXsodP5jp+wcoUCpULXLVnsekUjdTUXxyfzI12GHSHVxQDctVyEjUmYlyjC
	a7BWHea/obZJrLtPXkdC6Daj+AEl52k1zVOzqV8U11nC4JNIrUbzjZkGZrdpp2aSMheR9OJnXRUE2
	NMXhOoN5ws6i7ZrvSC3bUOBf+5jdQBKOtrFCVUHooMo0YpdQEy/v/H2uPF/O6t7WAU9GABJvcqCVp
	XZjdmJaA==;
Received: from [78.133.40.109] (helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SRi-00000009hqM-19H1;
	Mon, 28 Oct 2024 16:18:22 +0000
Date: Mon, 28 Oct 2024 17:17:14 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Jakub Kicinski <kuba@kernel.org>
CC: Richard Cochran <richardcochran@gmail.com>,
 Peter Hilber <peter.hilber@opensynergy.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>,
 "Chashper, David" <chashper@amazon.com>,
 "Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>,
 Paolo Abeni <pabeni@redhat.com>,
 "Christopher S . Hall" <christopher.s.hall@intel.com>,
 Jason Wang <jasowang@redhat.com>, John Stultz <jstultz@google.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 qemu-devel <qemu-devel@nongnu.org>, Simon Horman <horms@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_net-next_v7=5D_ptp=3A_Add_supp?=
 =?US-ASCII?Q?ort_for_the_AMZNC10C_=27vmclock=27_device?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20241028091256.1b0752b4@kernel.org>
References: <78969a39b51ec00e85551b752767be65f6794b46.camel@infradead.org> <20241009173253.5eb545db@kernel.org> <c20d5f27c9106f3cb49e2d8467ade680f0092f91.camel@infradead.org> <20241014131238.405c1e58@kernel.org> <c1eb33ffd66d45af77dea58db8bdca3dcd2468c4.camel@infradead.org> <20241028091256.1b0752b4@kernel.org>
Message-ID: <5077F160-52F0-4E76-B2B9-F0EA9DA76FB4@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
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

On 28 October 2024 17:12:56 CET, Jakub Kicinski <kuba@kernel=2Eorg> wrote:
>On Sat, 19 Oct 2024 18:49:24 +0100 David Woodhouse wrote:
>> > Yes please and thank you! We gotta straighten it out before=20
>> > the merge window=2E =20
>>=20
>> Hm, as I (finally) come to do that, I realise that many of the others
>> defined in drivers/ptp/Kconfig are also 'default y'=2E Which is only
>> really 'default PTP_1588_CLOCK' in practice since they all depend on
>> that=2E
>
>AFAICT nothing defaulted to enabled since 2017, so I'd chalk it up
>to us getting better at catching mistakes over time=2E
>
>> Most importantly, PTP_1588_CLOCK_KVM is 'default y'=2E And that one is
>> fundamentally broken (at least in the presence of live migration if
>> guests care about their clock suddenly being wrong) which is why it's
>> being superseded by the new VMCLOCK thing=2E We absolutely don't want t=
o
>> leave the _KVM one enabled by default and not its _VMCLOCK replacement=
=2E
>
>You can default to =2E=2E_CLOCK_KVM, and provide the explanation in
>the commit message and Kconfig help=2E

That works for me=2E But now it's my vacation time so it'll be at least Th=
ursday before I can do that=2E I'll offer a preemptive Acked-by: David Wood=
house <dwmw@amazon=2Eco=2Euk> to anyone who beats me to it :)


