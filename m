Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1971104950C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUGrWb/gw8VxqWW3Nu7S+GNq0XIM3l9bhtDm34EFbzE=; b=imDoFp59iWmRe6kmoj7VoLJNJw
	c2xxucepDLxVI+WpLzZrKbBz/GKOp7uLsFhyFCnwzA+tUqkl4CMpROmN1hrtuGoU5t1zAA0BCk96S
	AnsPScYgpXJ6vfgTqa/8Fhzp1JOFudnxokEr7psGiW02uN4eCgWwnZn5kihwz4BxsfUb4MtRgHici
	PxNQG71LAyf6igT+/piweFqAiE4SX8YIgM6fsWTFovgBflhVPDm7ipSESv+cUtj0650QXB600UM9B
	bHVx/6w+WYyNCGqwJYEyI9O8igP/QVJKkyJ4c2nmt0n2xASI1LOc8uhlL4RklI69rC6ewwvN2e0bd
	K2AW3Xbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FZa-0000000BEQ4-1ggR;
	Wed, 11 Mar 2026 09:09:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FZY-0000000BEPP-0OoB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:09:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 746E54416D;
	Wed, 11 Mar 2026 09:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2700C4CEF7;
	Wed, 11 Mar 2026 09:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773220183;
	bh=z54dQcyh6RQQ2entvvGCkeeoJxwhB+c230BoLQ4+ql4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nHgSGr/gXZ0kkkLWBeSEAhlrt2X2JCkA++zBDles9Q6/GIW/igNVeU8lYwa5R0Bzx
	 jhFk89/1myL8fFCAC32HaKKmtok16MFW4blm9UhJR95LVrVDWTD32XjFb2rhKL2oKJ
	 /n5KvIiEHm8jRvnFV2qFU49faZ7anKmwn0lojBh0H6g6HS7otgpSe8q6B/oCjGvs2a
	 eI3je8fupj/Hhtyn2nCYxkvTRVvR0ilzNKK2wGwgRu4N/UvYCKWUO299Nls6spnwGY
	 7Rc7efXqoTINAHXQZ4xce6tdy+ZqzeXFLE++j4r3aZw/lLiI2+baTaM7RSf6pIeVCF
	 jjFoywWStCkKA==
From: Thomas Gleixner <tglx@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, NXP S32 Linux
 Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz
 <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>, Eric Chanudet
 <echanude@redhat.com>, Ciprian Marian Costea
 <ciprianmarian.costea@oss.nxp.com>, Larisa Grigore
 <larisa.grigore@nxp.com>
Subject: Re: [PATCH v6 3/5] irqchip/imx-irqsteer: add NXP S32N79 support
In-Reply-To: <20260311081154.381881-4-ciprianmarian.costea@oss.nxp.com>
References: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
 <20260311081154.381881-4-ciprianmarian.costea@oss.nxp.com>
Date: Wed, 11 Mar 2026 10:09:37 +0100
Message-ID: <87h5qmraum.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_020944_171537_4A1E4421 
X-CRM114-Status: UNSURE (   9.85  )
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

On Wed, Mar 11 2026 at 09:11, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> Add support for the interrupt steering controller found in NXP S32N79
> series automotive SoCs.
>
> The S32N79 IRQ_STEER variant differs from the i.MX version by not
> implementing the CHANCTRL register. To handle this hardware difference,
> introduce a device type data structure with quirks field. The
> IRQSTEER_QUIRK_NO_CHANCTRL quirk skips CHANCTRL register access for S32N79
> variants.
>
> The interrupt routing functionality and register layout are otherwise
> identical between the two variants.
>
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

I've picked up this one. Can the ARM64 folks please pick up the DT muck
as that really has close to zero relevance to irqchips.

Thanks,

        tglx

