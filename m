Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9AAD2C11B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 15:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9J3xuoO7BMRrGz4nEq0kI6+LjSRzpXpahSI7GPNBGDA=; b=4GviGxPykgwttTy25bBChECqFQ
	TkHeUiyuDrMX3rLuf6qj2dSF0j42Np+YHQOz5L/xUS1X0jlV9bhB0NcWPJ5RObAxPLmwlkPomI4aY
	zQY+bBG53Rkjc9yG2rmDODQi8Kif66TVLqBizOofh1Yqs7jzM/aYCmzTE/eL83sl133thUa/wRnqk
	SdIcQD2sKjzDF8IdlWLbirn4gxiQe6iN0VRmKdIex1Dco2vdDZnra2kcCCEuys8N127m9mfOfCJ1n
	/5twDUBBquVK0/u6VP1rL+sUAGkLB/2f5LKMfVV6tPtxgyyMhEUGUKQonEqMFF0Ssaekpvm8QZ54V
	MErsMoSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8L8I-0000000HNLQ-1pum;
	Tue, 05 Nov 2024 15:06:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8L4x-0000000HMpO-2spk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 15:02:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DC997A43441;
	Tue,  5 Nov 2024 15:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F37C4CECF;
	Tue,  5 Nov 2024 15:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730818966;
	bh=F4WltQA5cg1waDpTGeUJMLZeM55/Ra2Tw+9xSUZNrPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EnKCQfcjgccBD0sDZsefLbxoJ6gIKqphICvj9eBlJCI40IImHiiuETIG4v+5lI39n
	 UFvNzzzq5UHQ36Ch287qG3mseAlo4zKR8clCaBZbRXOC7xMA53KWoro8XoXqT9Y5IJ
	 c99VsROCKwcUtr05772b3TYBpEvr3moWV6e9wInKKrnThRuLLa0U5DJFKfVcJltiva
	 HFyEQ9wX4EaxKFrXCqj2TS+3pQju9clS4WdZ5MTdZgcsU66byoRIdpE8J67GDxt6yK
	 8AuylbZ2Eep6jSfmCQMnPKfcmctQAdnWfpCVs77n6U8JbWIxcSddPVU9qxQkMza5BW
	 23o7+FZF2ojCg==
Date: Tue, 5 Nov 2024 16:02:43 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Christophe Lizzi <clizzi@redhat.com>, 
	Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH 0/2] add I2C support for S32G2/S32G3 SoCs
Message-ID: <b2nsny2ipcd37ke7jzbjptal2b63lcss5gs2galrdfqdu4u7y6@v3swrb3vzs74>
References: <20241104100044.3634076-1-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104100044.3634076-1-ciprianmarian.costea@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_070247_811363_7F66BDAD 
X-CRM114-Status: UNSURE (   7.18  )
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

Hi Ciprian,

> Ciprian Marian Costea (2):
>   dt-bindings: i2c: imx: add SoC specific compatible strings for S32G
>   i2c: imx: add support for S32G2/S32G3 SoCs

with the change proposed by Frank in patch 2, I merged this
series in i2c/i2c-host.

Thanks,
Andi

