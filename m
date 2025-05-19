Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BA3C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 10:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thc9Vq7/RmCXhsKg1ZE9msCk26tcpDfiOGUflEBD2ag=; b=PI6sVLEzORB4ffxrbKRC92W8lm
	MQFp03kOuo318trL/0Wg1ekGUMa0GC/PeRNLpJOFDO50jsRbjuFqJ5nJXZBif9361muOqiZYeMMCi
	rhhEx7wNdcWljpxae54iYm4DyID7UpVf2kTunve9K3JXCSem1VBD7JxSOuwniiWBLXUBmKR9lgvwA
	852BNPQH+egLQRhU6jtRbZ3r6crXR9RqS3ih+gVb2WJjzcAc/xLEfOz4HI1fDSjVOG34g/xCeS0i+
	qPuivJfng103/U0Q9ZXke5RIXh2cwKu6TIZLuj6I64YILEX2CObrC+eVkVvBIfI1wgU3NZ5QBtVXk
	RQXa2/vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxJ5-00000008iY9-2U2b;
	Mon, 19 May 2025 10:01:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGx2n-00000008dIx-07X9;
	Mon, 19 May 2025 09:44:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7B9BCA4C95C;
	Mon, 19 May 2025 09:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6F8C4CEE4;
	Mon, 19 May 2025 09:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747647863;
	bh=2/LB0JgJrsL1rxN13GlzeiLNUAj6gCH+jyeYbsdhuck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ifr4TaPbvbw62JQOtExEmw1IyI1IOF+9geyhvsnXDtMH9tur9SwdU4nJxzJlW0s5K
	 8t4tA1HjujMJR7Wnvk6yCM6VIBqJ6Kx+XQoOscpejlUffUY4/fnR44hAy14rNgNlq4
	 V4HWYr/p3VorRqmx2d/Ew26Y3GKHsyTh1OWrqccnmadj2NfWQY5kMa9z5zO9B9cGyr
	 GjMIobnOR74y9yoBSEwAe+YeBY5vgutPpvDZ4JWqE5b+EmJ+4RnjrMgJf1+XQjK0S3
	 9nlrA3409bdrzjdvo1rcqgijnxNjKIUNyTiCBibS0eBTg4g5XtREDkY1ytVFqmEd/l
	 MKzmSwRETwJMQ==
Date: Mon, 19 May 2025 11:44:17 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Laszlo Fiat <laszlo.fiat@proton.me>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] PCI: dwc: Link Up IRQ fixes
Message-ID: <aCr9cYhtcBJZ-9Fj@ryzen>
References: <20250506073934.433176-6-cassel@kernel.org>
 <7zcrjlv5aobb22q5tyexca236gnly6aqhmidx6yri6j7wowteh@mylkqbwehak7>
 <aCNSBqWM-HM2vX7K@ryzen>
 <fCMPjWu_crgW5GkH4DJd17WBjnCAsb363N9N_h6ld1i8NqNNGR9PTpQWAO9-kwv4DUL6um48dwP0GJ8GmdL4uQf-WniBepwuxTEhjmbBnug=@proton.me>
 <aCcMrtTus-QTNNiu@ryzen>
 <5l0eAX7zaDMDMp1vJhvB9MVKXSPn3Ra0ZiP5e2q1E4rwmADBB6MlREZO9cuD_zvclAOhhBE0-NFthVbOajeSCfYjchT-83OgLbjclOgx3T4=@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5l0eAX7zaDMDMp1vJhvB9MVKXSPn3Ra0ZiP5e2q1E4rwmADBB6MlREZO9cuD_zvclAOhhBE0-NFthVbOajeSCfYjchT-83OgLbjclOgx3T4=@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_024425_133245_F42C0C7A 
X-CRM114-Status: GOOD (  17.27  )
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

On Fri, May 16, 2025 at 06:48:59PM +0000, Laszlo Fiat wrote:
> 
> I have compiled a vanilla 6.12.28, that booted fine, as expeced. Then compiled a  version with the patch directly above.
> 
> >  We expect the link to come up, but that you will not be able to mount rootfs.
> >  
> 
> That is exactly what happened. 
> 
> >  If that is the case, we are certain that the this patch series is 100% needed
> >  for your device to have the same functional behavior as before.
> 
> That is the case.

Laszlo,

Thank you for verifying!

> 
> Bye,
> 
> Laszlo Fiat 

Mani, Krzysztof,

It does indeed seem like the reason for this regression is that this weird
NVMe drive requires some additional time after link up to be ready.

This series does re-add a similar delay, but in the 'link up' IRQ thread,
so even with this series, things are nicer than before (where we had an
unconditional delay after starting the link).

Do you require any additional changes?

Otherwise, I think it would be nice if we could get this queued up before
the merge window.


Kind regards,
Niklas

