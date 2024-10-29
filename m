Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1078CD3A661
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 16:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQz8aWNJEQb0hYRI305JSO2GyZ3HgKzHbB2pMhfUiOc=; b=tPt0bclaj9W/DoA4Dn6easgODK
	AYTWj1URu5Q0yn60DeX2TQ3NGE+Zsy9IIp0NQZPUO/QsQsDMT59TjAoqdB/lQAEbtRy2/FSipMDvA
	cGVwEA5NPIub/O86/6Zs75yBwi7y42+jtWr7FSgXXZCD4ODCmMnT6jJGOAvSVMofvCVt0/n5XUUv+
	T6Vh3IwtALRcFLzlmVZcaFWdnBDxK7vhhCCBo0b64izXynlpcgKXK1XgjFS8w3nshpmTubdeozASG
	icld+AgTahpOHIS+rvWFBlznz83Ialxw9tiBeQ4kqBcW2Z+QUtubA546QGi6ph1ZKQLROLSE2bJfl
	sj6iBtBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5om6-0000000F4JL-2npb;
	Tue, 29 Oct 2024 16:08:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oQd-0000000EzEz-2cRC
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 15:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vQz8aWNJEQb0hYRI305JSO2GyZ3HgKzHbB2pMhfUiOc=; b=nXMxvdFT/wLlN+fxpt83Hegsiy
	bSGXvVXoosb9TmaB4ddbOfkI7RDtMMqKSHHOVVYR6bDsvWozWbt+4FmAGCr7QCaRVji19FrTMq9yH
	sGldy16psJ0YdoLI/Hj3nN5L8JGWhVfjVgdyOo6YtRR4x2E61/QQOsbxNXCAaoonS9LuhSxg8fg+v
	CB2a1yeMI/HA8WUE0SqAZuRVCOhCxlzs5sqYWjzba0Y+0lEUM8h+CGJ6dUTkoJDd29JXVajmpj0MK
	OFFLTP8mooDvVlXvrDyiEhN3W+NNzxEgynn9OBkmYQkjYKyZwlNFLrznJijCj4rU6EGT5iBKiNAqL
	jiQvacGQ==;
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oQZ-00000009vlN-2VKq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:46:42 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49TFkRGD106334;
	Tue, 29 Oct 2024 10:46:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730216788;
	bh=vQz8aWNJEQb0hYRI305JSO2GyZ3HgKzHbB2pMhfUiOc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WqGnqM0OW+qOg617u2qutQsl7mdLk5Ih1C2CBbP9OZhXgJqvjQxcmDB5fKHOAssBF
	 yIez7rAbp4sKl3UgKtFm9eXWos9fxVRO2p7YJHa4GIsRA/JYjDtouJ3/VZEUs/8fsm
	 Et34RLJSDsPtlYIatSoBWV/gnrfv3q1WVWvkCB8w=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49TFkRDO009833
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 10:46:27 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 10:46:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 10:46:27 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49TFkOZm082409;
	Tue, 29 Oct 2024 10:46:25 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: minor whitespace cleanup
Date: Tue, 29 Oct 2024 21:16:22 +0530
Message-ID: <173021674668.3859929.14808047445194901227.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240905154440.424488-1-krzysztof.kozlowski@linaro.org>
References: <20240905154440.424488-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_154640_448587_8B9C5F87 
X-CRM114-Status: GOOD (  12.70  )
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

Hi Krzysztof Kozlowski,

On Thu, 05 Sep 2024 17:44:40 +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space before '{'
> character.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: minor whitespace cleanup
      commit: cf0e756c8d0425f9c4bc739a0506ae4645ff5ba0

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


