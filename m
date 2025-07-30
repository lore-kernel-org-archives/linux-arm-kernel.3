Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C73BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 13:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAoOGAraN2pjrqttev+Zr8SnyWszyLGEI78fJRIM/2M=; b=5B5+itBuxVlsGGUsT3teP8nlcb
	REYhSuZGqCxBR9r7dWcYhzB8L0VuwWiikjvWfdjGzko8Cye/Pdz/no/lwtFrYDsTFPYEAivBOMdog
	v2UbjTZNH7Z14VkM415SOl0U2PeHsKsIMVtNEy72ohdY18sykMhu2U55Pf/GWTuoV8aRz3XrpA3WQ
	/9lBIL9DIftEXYTxKfCIU0Y1Uq+K4Ro76Ji7s1IhiNCAli4LgeSIMJf1n8ZQg5oUShSLchuyB5d39
	bPrNgdvvDW8ugYgN6w6xnYUdyD31z6GOr8sfZOoNeKYtfsv3mF255fkD7DPNyaBlWfyW1rKkPPUkn
	o9Xs2Nog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6yy-00000001cWx-1cTn;
	Wed, 30 Jul 2025 13:36:36 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6wR-00000001cH1-3sD7;
	Wed, 30 Jul 2025 13:34:01 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 56UDXhIe027054;
	Wed, 30 Jul 2025 15:33:43 +0200
Date: Wed, 30 Jul 2025 15:33:43 +0200
From: Willy Tarreau <w@1wt.eu>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alchark@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
        heiko@sntech.de, jonas@kwiboo.se, krzk+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, ziyao@disroot.org
Subject: Re: [PATCH v2 1/1] arm64: dts: rockchip: rk3528: Add CPU frequency
 scaling support
Message-ID: <20250730133343.GC26787@1wt.eu>
References: <20250730071145.GA26734@1wt.eu>
 <20250730132026.214754-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730132026.214754-1-amadeus@jmu.edu.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_063400_387092_A477EA5E 
X-CRM114-Status: GOOD (  21.77  )
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

On Wed, Jul 30, 2025 at 09:20:26PM +0800, Chukun Pan wrote:
> Hi,
> 
> > My point is that if you disable cpufreq, the CPU is running at 1.2V, which
> > is even higher. I don't know why it's running at this voltage, maybe as
> > the result of initializing some regulators, but that's what we're getting.
> > So the question about safety of running between 1.13-1.15 resolves to
> > "it's at least safer than running without cpufreq" in the current state.
> >
> > And as I mentioned it's clearly linux and not u-boot that is setting 1.2V,
> > because under u-boot and during kernel selection and image loading, my
> > board is at 0.95V. It's only once the kernel starts to boot that it bumps
> > to 1.2V.
> 
> If opp-table is not configured, kernel will initialize the pwm-regulator
> to maximum microvolts. This can be solved by configuring the pwm-regulator
> in U-Boot (waiting for U-Boot to synchronize the DT of kernel 6.16):
> 
> ```
> &vdd_arm {
> 	regulator-init-microvolt = <953000>;
> };

OK thanks for the explanation, but will be stable at highest frequency, or
do we expect the TF-A or PVTM mechanism to automatically reduce the
frequency enough to keep everything stable ? I'm asking because right now
I'm booting at 2 GHz, and I don't imagine 2 GHz to work fine at 953mV.

Also, if we'd set this to a low enough voltage that it results in throttling
the CPU, it could significantly slow down the boot for no reason. If we
consider that the configured max-microvolt is valid, then better continue
to use it. And if it's not valid, then maybe just fix it without going
full throttle to a lower value either. Just my two cents.

Willy

