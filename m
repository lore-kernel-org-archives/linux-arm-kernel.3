Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C339C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 07:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXCHgsII61RG+BUBR7dsv7oD4lN1OAQX9QZyrYgHcvA=; b=mBN/bJWZdyUMtnghkQeA96DVhI
	qJUcFS37JyGu6xe4cptfW55ivZV5GpW04LmW331SRYvbtb/+USys/vdSK9L3WaT94A6JwYKHwwZlC
	2wNVN8pMPNhij7bvn6qlVC2YmnJG8V4YJouO+gupSEI75tz4fJ5ql2WB+c95HSqpj7QgyLRV5r8sa
	bWA5AO0jVTiriZdpoXY0Ygc1eQ0QIkD9bpc7uuizAHK1r+dPmldIhvybZupu5P5ORWCQ5ZALw5ZpY
	aaNEbPNm6Wtt6mXKS7dQpFLPMZh97CVcS9+wLlfMX2ibSFscG+Oygp1DXh1329hrjP8e1o884rrKn
	3rXOKPlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wju5l-0000000E2FW-454C;
	Wed, 15 Jul 2026 07:31:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wju5h-0000000E2Dj-32r0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 07:31:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 655154E40DC6;
	Wed, 15 Jul 2026 07:31:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B90B6035C;
	Wed, 15 Jul 2026 07:31:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B5BFB11BD3BAD;
	Wed, 15 Jul 2026 09:31:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784100693; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=cXCHgsII61RG+BUBR7dsv7oD4lN1OAQX9QZyrYgHcvA=;
	b=xCZht4U04fO/TOsAkFDrKLYpZe1uko0+yNhTkhKLYV0ZEv+3eqD4UtcWXskfavCsrolDcR
	NFxZ3wQdjcKFa+RY6/xRQDnO1bE0wu4Jh1lfp2lUchK8hLun1idHajZmvE1bpN6ubuCgon
	otdq3TlljGiyQPUJxFWAOpqs8gTm33txPz0cTwKtS0rMQoW3lKe1gQ8r/lRTfmVuXno+aO
	G4mB2VF6oh3dgaWwkO7FkmHqTk06eL+7WQv3927/CHT768lK30Fpjds4I/4x1ftOCqpsc0
	DOGMvje48XYFUqfRj7bcusaxmbaW+ktUD4PPjCy9Eq1wzmCGryTs6PE1uE5deQ==
Message-ID: <dc21b2fc-ae11-4fde-a5b9-09e2c6bee5c9@bootlin.com>
Date: Wed, 15 Jul 2026 09:31:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/10] net: stmmac: move XPCS lifetime management to
 platform drivers
To: Coia Prant <coiaprant@gmail.com>, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
 robh@kernel.org, krzk+dt@kernel.org, heiko@sntech.de
Cc: netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, Christian Marangi <ansuelsmth@gmail.com>
References: <20260714191341.690906-1-coiaprant@gmail.com>
 <20260714191341.690906-2-coiaprant@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260714191341.690906-2-coiaprant@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_003137_902868_56CC39B1 
X-CRM114-Status: UNSURE (   8.28  )
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

Hi,

+Christian

On 7/14/26 21:08, Coia Prant wrote:
> The current XPCS creation logic in stmmac_pcs_setup() is problematic
> for several reasons.
> 
> First, if a device tree specifies a "pcs-handle" but no select_pcs()
> callback is provided by the platform driver, the created XPCS is never
> used. The phylink framework requires select_pcs() to actually return
> the PCS to the core, so the pcs-handle property becomes effectively
> useless without the matching callback. This is confusing for developers
> who expect that specifying a pcs-handle in their device tree should be
> sufficient to enable the PCS.

I think Christian's work on fwnode PCS would help a lot with that PCS
handling in stmmac:

https://lore.kernel.org/netdev/20260618125752.1223-1-ansuelsmth@gmail.com/

I don't know when Christian plans to iterate, it could be worth using
that new fwnode mechanism here ?

Maxime

