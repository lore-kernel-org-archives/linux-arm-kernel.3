Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756EAC5AD2B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 23:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PovC8tV+FAuVh4jx5hdX+cj317qClrsgi5NccKsJXzY=; b=W/i+uToTrNABNTCey1Y+qcBjij
	E4y0cDjVszVGpmDrIuxWJAlo46icQDjYL0WM5nBIat/L1ceYZ4Y0TVyVa2zIahlOQFiuOfC6SIrvJ
	oelchxTYohFemowcVpS1bSKV+3P8PKnuuHDYBLlsjl8U9HtKRkXADcaVPh0w1XKrzR9jbP7ArWcSE
	TZ9H2zjUR3enN4l8j4QaHT6RviV55j6tw4p2PBM4lFQfj9FRwIrRlYIVcxlyvZZ/lBm0Efmqs6ogz
	CKNCPcBwDDHiZ8tBy2IvPIRuBITzPM30Qp4dq/iCPn2yYVQS+EFo00FIoTZJiImTMuA2F8oTMr4OR
	JtKdkh5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTXo-00000008qQT-2q2o;
	Fri, 07 Aug 2026 23:00:04 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTXl-00000008qPl-3jON;
	Fri, 07 Aug 2026 23:00:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1786143593; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LLvs2gpzS8SgUtUeacIC+uzGYsrA51G8l+88ra5+zuOVvfPhbzDxcn5hA9Qx4vze4dBxsH2fEHaJOuy+KVY7xg82Jo9ibM9xX/7fRL7JY45G5/eCBCO/EJk1+9erZrTwqeo3ut/wCSO/LwluLBSTyhwKiP65QnRD/J9y7NMmfDU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786143593; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PovC8tV+FAuVh4jx5hdX+cj317qClrsgi5NccKsJXzY=; 
	b=hv/wsn2ijQkgORKJ7b0MjtG2iTAEQkVwgr1utp3aGUuITv5EBw/ZAiUXHmCMBKSa+NsYa+qZO+X2hg4E+DSd8tQeLWeQdiRWZvANI4IdMKVM2xjb2ow9ky4mc+HBNXlLLkulWZdN0afYpXxS7asXKcaqs0rheAc8TJFs6rsK9hE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786143593;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PovC8tV+FAuVh4jx5hdX+cj317qClrsgi5NccKsJXzY=;
	b=XeCRWaiXBEkaCg/JPc5k0y2jYej7omXUEAkV69DJrmxWCawPoKVeAEYZv/6RS739
	gQmdeVP13IIi8B9bsX39gH5MNe+IQPjt3lEksjayj5Bq6FtYY4/bU+H61C0MhvG/0zd
	n6zT2PKhOXXsN8MICg9TBwH5pWR5hT0XurlMt0aA=
Received: by mx.zohomail.com with SMTPS id 1786143591981605.2798606263314;
	Fri, 7 Aug 2026 15:59:51 -0700 (PDT)
Message-ID: <00d6ee9d-0ef1-41d4-8cd7-affb320b84f4@collabora.com>
Date: Sat, 8 Aug 2026 00:59:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] phy: rockchip-samsung-dcphy: model TX and RX as
 separate PHYs
To: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <20260726-dcphy-rx-v1-v2-3-cf9cc34a412a@gmail.com>
 <7e55b8bc-d11d-4b25-99ee-d5d181be158f@collabora.com>
 <CAPwA33Jnp6N7a=2tcrgEzFxXRpbxEO25ktrRDiea--9Uy5upNQ@mail.gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <CAPwA33Jnp6N7a=2tcrgEzFxXRpbxEO25ktrRDiea--9Uy5upNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_160001_994243_1FF040C6 
X-CRM114-Status: GOOD (  24.22  )
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

Hi Jason,

On 8/4/26 07:38, 楊智成 wrote:
> [...]
>> This approach with the "first" variable seems unintuitive. If you need
>> reference counting on the BIAS block, then use a state variable
>> "bias_powered", use a mutex that protects it, and call
>> samsung_mipi_dcphy_bias_block_{en,dis}able (from
>> samsung_mipi_dcphy_power{on, off}) unconditionally. Those methods shall
>> acquire the mutex, check the state variable, {en,dis}able the BIAS
>> block, set the state variable accordingly, release the mutex.
>>
>> [...]
>>
>> Not sure whether you actually need to track the power status of the
>> individual PHYs (maybe you actually need to track the BIAS block status
>> alone) but anyway I would appreciate if
>> "samsung_mipi_dphy_tx_power_{on,off}" would set the "pd->powered"
>> variable.
> 
> Both of these lead to the same change. You are right to be unsure
> about the per-PHY flag - I checked, and its only readers are the two
> "first" computations, which only decide about the shared block. So the
> two flags become one count in the parent, taken and dropped inside
> samsung_mipi_dphy_{tx,rx}_power_{on,off}, and the "first" computations
> go away. I went for a count rather than a single flag because the
> release side has to distinguish "the other direction is still using
> it" from "nobody is left".
> 
> The shared-block helper will use lockdep_assert_held() rather than
> take the mutex itself, since samsung_mipi_dcphy_power_{on,off} already
> hold it, as you noted.
> 
> One thing I am unsure about is the enable/disable pairing. I could not
> find an enable for this block - the four BIAS registers only select
> bias currents, reference voltages, the HS output level and the BGR
> chopper divider, while PLL_CON0 in the same common block does have a
> PLL_EN. If that reading is right, there is nothing to turn off and the
> release side would only drop the count - in which case maybe the
> "enable" name is worth revisiting as well. Does that match your
> understanding of this block?

My understanding of this block comes from the TRM and the downstream
driver. TRM states that the BIAS block is common (= shared between RX
and TX), but Downstream driver does not care and just writes the
settings for RX and TX unconditionally.

There is also something weird: the register description in the GRF
indicates that RX could be in CPHY and TX in DPHY mode. But CPHY and
DPHY require different values for the DCPHY_M0_BIAS_CON4. I'll try to
ask Rockchip people about this.

BTW no objections to renaming this to e.g. "*_configure()" and use a
flag "bool configured;" if required.

> Separately, I noticed "first" also guards the APB reset, and only in
> the transmitter path - once 4/4 enables the receiver, a receiver-first
> power-on does not get one. I plan to move it into the same shared-block
> path so both directions behave the same, and check both power-on
> orders on the board before sending v3.
> 
> I would like to fold all of this into v3 together with whatever comes
> out of the PHY_TYPE_CSI/PHY_TYPE_DSI discussion in patch 1/4, since
> that decides how the two PHYs are told apart.

OK, makes sense. Looking forward to v3!

Thanks and best regards,
Michael

> [...]

