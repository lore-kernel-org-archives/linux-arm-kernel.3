Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C69EC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1icS1ornuLOryc0NeZcleF/lysfwDHdeIVIyTWVEzA=; b=JZ8GzpD1k5MP/eYIlbM7+tMVE4
	UD6rCUMCAgRhjGNDGuRyODkyB+iVx7sVYigr3667OwWuLUjMD3Hmzfmn8AnPJK6ERRMZhTA3tDLMk
	nKh4HUlIFAZ2cZSeDoStQJbAMQTZ0Ak13lejAIs6NF9GpPo4iDdeSe9uQ7b45Lr0uCBxawA3xYh8n
	hVV1bSRMpsZQpNwMZcX2ZADzUdkTZs1ok1dBiYhSRYDPi44XYj4acM/rnAD3YANzNRzrvLz44J80F
	NJcevEg98Rmgbg0qUMQ0/lri/5BFypylhYDEQNG1gGM2hH3Tou8XWM1bOVuGHY2lHx/yp989ICJDN
	O1FuyCWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tifH7-0000000CSu4-2WCl;
	Thu, 13 Feb 2025 19:53:29 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tifFf-0000000CSiy-1O0t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 19:52:01 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DC5611140222;
	Thu, 13 Feb 2025 14:51:57 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-10.internal (MEProxy); Thu, 13 Feb 2025 14:51:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1739476317; x=1739562717; bh=+1icS1ornuLOryc0NeZcleF/lysfwDHd
	eIVIyTWVEzA=; b=KV6je5oOvDIlLt2IcOKKIavwfangEhqoB+zLeVLNjrhtb8ga
	ko1I6oJrJzwJI0euTefgVhxm2kbY5xzyv2RV2XCFsCh7EnNqhbcvsRqV8TUI4Lsz
	A3xdPdxGbH2jaoJGSDReNrRP3Mm0/JXhOouR4F7Aendba5svC5sVxkdbwzXI2lR8
	D7ITQRsq4RMkmL2/PwqTGWO2IcgAGRQ4y5sz03KJ/NAh2wWA8sJBmdjeo5T2CnoN
	TAC1AUr9D+bRPVP885VVIcHpLCS3Efyr83E6Y1jACHBmlbkBYVW//mF91GcdjpOy
	lvcME+rNn7EC0Ob76NDXPOjKN7Z6cjgXTuokYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739476317; x=
	1739562717; bh=+1icS1ornuLOryc0NeZcleF/lysfwDHdeIVIyTWVEzA=; b=j
	NKk9yU4fJCx9uyRFkIOvviP8jixh33cVwdZSooMJ+mN45xl1qK8kPJ7gtQazgoKg
	gZzzEtUpWM6MCbI0bVduq4FqPWQNZtmrc1oChTGj1eom9nJ9B5a/t5u3RuXXUzv0
	6LAOM6CnoVuwaQHvVMzs88DEEWNPqzWjzaCa9nD1AlPjhsNsFY0/LrblA3ciQszb
	va8AgUyDnN6tFl1In4C/7l1xs7JqONRMoyx5Gh3tLOm8qo7ZYXNMGS6F9EYtOZur
	LQmqHnXKQXfpWzEbnJdfTElldsIwW7ZMMBVKMiVI7ToQDzO4tCtW+tdBKV1akjYx
	cwbUuyl/aST1GzFrV7+lg==
X-ME-Sender: <xms:XU2uZybhXhFLU0OeqFw5r7L3mpSEfL0QlDD6zoef10vdrtLeWXWdwA>
    <xme:XU2uZ1YdrG79cucHNEjBZ2JiNE7dxcAYNFCF6qEx33LDHyzJK7N-rQANe6tywi4bv
    BnyIcJJWSdZvs02QqM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegjeeiiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfuvhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvg
    hrrdguvghvqeenucggtffrrghtthgvrhhnpeelfeetueegudduueduuefhfeehgeevkeeu
    feffvdffkedtffffleevffdvvdeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghr
    tghpthhtohepudejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsthgrnhestg
    horhgvlhhlihhumhdrtghomhdprhgtphhtthhopegshhgvlhhgrggrshesghhoohhglhgv
    rdgtohhmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlphhivghr
    rghlihhsiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgriieskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehm
    rghnihhvrghnnhgrnhdrshgrughhrghsihhvrghmsehlihhnrghrohdrohhrghdprhgtph
    htthhopehkfieslhhinhhugidrtghomh
X-ME-Proxy: <xmx:XU2uZ88ZTFgef8cAWzc8dX8o9v685TS2_ZzLi1GHY__qmJsqtlyaSQ>
    <xmx:XU2uZ0pjTonlmsWbpyay6fwx5DEuaYtHCISTD-LlOH_Rt5IW_YyOfg>
    <xmx:XU2uZ9qGENScLPwOvIevVSsLZZr_mP0EvPTI5fjO6sPoTgr-C4H8LA>
    <xmx:XU2uZyTjDwJjL5mJ7S5FefJZ0FIiRnjdZGnvxbGeCdqbxiJwG7hfiA>
    <xmx:XU2uZzZKl2o40-GDvILbgU7vTYyK6xpADGju3BZ9aQPnlOz7YPfR1-yP>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0C5C3BA0070; Thu, 13 Feb 2025 14:51:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 13 Feb 2025 20:51:31 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Marc Zyngier" <maz@kernel.org>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>
Cc: "Hector Martin" <marcan@marcan.st>, "Bjorn Helgaas" <bhelgaas@google.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Mark Kettenis" <kettenis@openbsd.org>,
 "Stan Skowronek" <stan@corellium.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <ae7bdc0c-c691-43a7-8cd7-b1c22c7623c0@app.fastmail.com>
In-Reply-To: <86y0ybsd0d.wl-maz@kernel.org>
References: <20250211-pcie-t6-v1-0-b60e6d2501bb@rosenzweig.io>
 <20250211-pcie-t6-v1-7-b60e6d2501bb@rosenzweig.io>
 <86y0ybsd0d.wl-maz@kernel.org>
Subject: Re: [PATCH 7/7] PCI: apple: Add T602x PCIe support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_115200_108787_6F7115C6 
X-CRM114-Status: GOOD (  16.45  )
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

Hi,

On Wed, Feb 12, 2025, at 10:55, Marc Zyngier wrote:
> On Tue, 11 Feb 2025 19:54:32 +0000,
> Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
>> 
>> From: Hector Martin <marcan@marcan.st>
>> 
>> This version of the hardware moved around a bunch of registers, so we
>> drop the old compatible for these and introduce register offset
>> structures to handle the differences.
>> 
>> Signed-off-by: Hector Martin <marcan@marcan.st>
>> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
>> ---
>>  drivers/pci/controller/pcie-apple.c | 125 ++++++++++++++++++++++++++++++------
>>  1 file changed, 105 insertions(+), 20 deletions(-)
>> 
>> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
>> index 7f4839fb0a5b15a9ca87337f53c14a1ce08301fc..7c598334427cb56ca066890ac61143ae1d3ed744 100644
...
>
>> +	else
>> +		rmw_set(PHY_LANE_CFG_REFCLKCGEN, port->phy + PHY_LANE_CFG);
>> +	rmw_clear(PORT_APPCLK_CGDIS, port->base + PORT_APPCLK);
>> +
>
> Can you elaborate on this particular change?
>
> I always assumed this was some clock-gating that needed to occur
> *before* the link training was started. This is now taking place after
> training, and the commit message doesn't say anything about it.

It's been a while but as far as I can tell APPCLK seems to be related
to the IOMMUs attached to this controller. If it's disabled all reads
from the respective IOMMU MMIO either came back as 0xffff.. or SError
(don't remember which one it was) but pcie itself worked just fine
(until any device tried DMA ofc).

At least on M1 this entire sequence only works because we already
setup PORT_APPCLK_EN inside m1n1. If we didn't do this (like e.g
for the thunderbolt pcie/dart) the DART probe would already fail.



Sven

