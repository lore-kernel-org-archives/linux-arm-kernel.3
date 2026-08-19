Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2B0C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWum0M/KW01JsIfiqiWfjLWjFJsrmJRkwJ5RSvWc/nw=; b=f9p2ATJOBObRX8PeSGyG+nm3dI
	bbGtUUbt2pt+EZy0UQotkTvxZCD8Gz3FKcXf2K1fni8Yi9A5LUOj7aHAPMrq2vlEv6N+9OquQSr1x
	TV/A43/EzjCNhhQwx153wDZJMXg344tQTZr9c7Y0MopJU/xDZT/v/8N2XvRTKm0HTaAi4kF/qNX9a
	nmuu1w/xy0Cns/myRUMUSAc+FD7NJt29rjTok/ONPsyliEjo7MAmNX+aW2RlR9kbRtAyCDXma9X8h
	/lkve8Y0yxJ1iOfMadO4fRof+bQwL2/OOksl8bSoHGnVg6Jxav4L6lhE+y97C0yD62I+zB0CG/NIf
	GFROZLLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwj88-0000000AB5S-06fM;
	Wed, 19 Aug 2026 16:27:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwj87-0000000AB5M-009I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:27:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 67EDF42BCE;
	Wed, 19 Aug 2026 16:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCBD1F000E9;
	Wed, 19 Aug 2026 16:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787156826;
	bh=tWum0M/KW01JsIfiqiWfjLWjFJsrmJRkwJ5RSvWc/nw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=MGi5NJrGmu5soIJH5Y4TrPdyTM51X+j9qrW50n2sQen00EnBLtz542mV9BAc94Ln3
	 h3AcYJQAHPnc32dPj6h9l1oMevVZWUdwAIbCAaGCBZQJvrc3RPLTU9t6+LrUup+Z5P
	 7WSvtJFiSATKDUES3jhDs8AtEK/Tl/plnRiBgRlsJ9ORXPbzjdMzvBlTo/vZbWESpi
	 XwW9WqEubaSsAOUMbH84TiC8n5sIhGasJsfNDMpCrbpg1abAeh/yLm0K3G4zrD6E17
	 Q9ZaOZ8woeEk675NZKTAV2kN4ArP4SowdFj2hesX/YnhEIIeNm+n39XAnzT9U8aO2h
	 lTrsFrXulQhKQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Zhipeng.wang_1@oss.nxp.com, Marc Zyngier <maz@kernel.org>, Frank Li
 <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
 <jindong.yue@nxp.com>, xuegang.liu@nxp.com, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/5] genirq/irqdomain: Add
 devm_irq_domain_create_linear()
In-Reply-To: <20260819090543.585131-2-Zhipeng.wang_1@oss.nxp.com>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-2-Zhipeng.wang_1@oss.nxp.com>
Date: Wed, 19 Aug 2026 18:27:02 +0200
Message-ID: <87wltmjctl.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, Aug 19 2026 at 18:05, Zhipeng wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>
> irq_domain_create_linear() has no devres-managed counterpart, so every
> driver that wants the domain torn down automatically on unbind has to
> either open-code an irq_domain_info and call
> devm_irq_domain_instantiate() directly, or register a manual devm action.

I'm not opposed to add this, but adding this as a prerequisite for a
backportable fix is bogus.

Just open code the domain info in driver and use
devm_irq_domain_instantiate() for the initial backportable fix and then
mop up the thing _after_ all fixes are done.

Thanks,

        tglx

