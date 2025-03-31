Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498A4C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 13:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RqYvmo1+63hE4DUnTOfQUG6qgRimzlpGgLI65lJ95Q=; b=1vCobaDvET7ULv50iQq+/VDVBj
	wIZcTXMoozgnYjMKdgDDWsA49obeGwDID9idybO1j+ZEYe1j705lNOi1sAH54+lRb6ZcAw5wJSjTX
	fjRajYkBphuEuBqFK2FKrSGzJadNdm5OsysW4glVGbo1sMfSWedL67nrOWVecxqCJ8alAN3wkVzco
	0+kz0c6kyaGnJaXg3zOX32OoUjqGvYgrBaXadJh2gCdVZlTC0L0Q/B13I13Ta20IomXlQYYQeFrjr
	4KU90OsPcXI1+giyPapMmG1yOv+Tuj3fD1KCpshUD80Lixu+313g0kU25O6QrZPlfuo+yuzGZzLKu
	GSTxxfOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFWa-00000000U5P-12BB;
	Mon, 31 Mar 2025 13:50:00 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFUr-00000000Txn-3Yjs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 13:48:15 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZRCBh03Zpz9sbC;
	Mon, 31 Mar 2025 15:48:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743428892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9RqYvmo1+63hE4DUnTOfQUG6qgRimzlpGgLI65lJ95Q=;
	b=u2Txhu/pFD+mb7d5yvwNb99Axh74qUezDKL4vtc1Q5s+TVMQ1Z1UDvF0UHRp9ubC9Q7J84
	SghQtkFciAjeCQDE4DFFVGEvU4taVNyjCkOta/FM4VdIB13a6H7Rh1MPIeiHzuZv74wYtC
	IpW68WP3P8Tj668HnQpwAsvtc+udLouWLpSqPXmKpxVqdGRT906dB83ajzNy/N0aNgx0fx
	QgwkXjDYrt5vULK0n2kcuEBTd8vU7Q0fyZdDnS4AH4BYJFzWntT3unGIhA5dtwBICN7HJT
	muq214yZd32J1vW3YgOrnzyapyv6StNJqF7i96asDmZQEqTyVbrbUf6owOGLSQ==
Message-ID: <daed453d-5b52-4bb6-810d-9195491e04c0@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743428889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9RqYvmo1+63hE4DUnTOfQUG6qgRimzlpGgLI65lJ95Q=;
	b=lc/nK/HGdnYy1zFMmImCHE0GuW93KXWyGIwHwRKiNopDIwcV9lkCL3azV9QutivFu25zKM
	clU1gVg0vXBzuHDBOBEK/vi7DVXBN1pfxccqN8T8P/IaA8l63tYg4fmJanyRWihi6ASwRn
	ZNqpgUO0EM+stOy2jJJE0B3237qSC1qQrCrCAwVQf1R5t/wcJfj122/PaY1OBnX5awfKF7
	4ypNczXQHG3b44NNN5Iy78OjPQt9calfabsOOoB04Y7ZhY6ttCVoZruNX6VJdn9AbOasS1
	vrVP27Y8id7goZGEfpGcMTjcfNLjdJNiJt2KfQV2kGtpNXStAc9PEha0TRhS+A==
Date: Mon, 31 Mar 2025 15:48:04 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] arm64: dts: renesas: r8a779g3: Add Renesas R-Car V4H
 Sparrow Hawk board support
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-kernel@vger.kernel.org, Junhao Xie <bigfoot@classfun.cn>
References: <20250330195715.332106-1-marek.vasut+renesas@mailbox.org>
 <174342765546.2641812.18254954916877172569.robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <174342765546.2641812.18254954916877172569.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 307f491e7583be5091d
X-MBO-RS-META: 3a3a1xx19f3anshqfe6z94mdr4ak1cfq
X-Rspamd-Queue-Id: 4ZRCBh03Zpz9sbC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_064814_030876_49BA0AE6 
X-CRM114-Status: GOOD (  16.11  )
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

On 3/31/25 3:32 PM, Rob Herring (Arm) wrote:

Hi,

> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>    pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>   Base: attempting to guess base-commit...
>   Base: tags/next-20250328 (exact match)
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/renesas/' for 20250330195715.332106-1-marek.vasut+renesas@mailbox.org:
> 
> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: clock-names: ['core', 'ref'] is too short
> 	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
I believe this will be fixed by input from Krzysztof on 1/4 which I 
already added to V2 , thanks !

