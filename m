Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65535D3941F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 08:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lxv/KM4QBdN+qoM0q8jf+z4WWd2AC3JR0U0nTb/A3eA=; b=2KnOvfWXOLP9TfcxhZ64AbGPme
	ItXUOBjn5pZOS59zGzIoJF7pYX04vLszdOELEEjS+wmEpmUltEbzp1N7jbAnUqggBuOO2nzXWMTsE
	6R8Aee/u5lwpfnUnQfmHtX7YVx+hY8gdTVxHlrK9RpFPKa05OtGglc91IU0xA+5ytEay/b0WFHZkP
	iGKGG9bXpREZAZjk+kXaPCWCf3WJ5ejrQWuIOS7+A2EGij9oTooyZ4hmLyR595cjdy2BThoLFD+/I
	xmcp3DyWq7Wgm+FO4+WYbH0i2iHJwrPeHTQWXtSc4UzazAEamF/NveFDJBsztsb+K/9KqgxgRNe0a
	pffCk0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Zl1-00000001hfz-2jCc;
	Fri, 03 Apr 2026 08:19:59 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Zky-00000001hel-44rq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 08:19:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 625ECC59F5A;
	Fri,  3 Apr 2026 08:20:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88482603C1;
	Fri,  3 Apr 2026 08:19:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44CED104502AB;
	Fri,  3 Apr 2026 10:19:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775204391; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Lxv/KM4QBdN+qoM0q8jf+z4WWd2AC3JR0U0nTb/A3eA=;
	b=F6hB5JdrwfXSjFksrqsxC11MQsaSmL6BKBsVvZH5aUela+3KlPzq839s8ek97RKs/WzVeI
	xxKyMBR0Xln+0TyX60Wuc7fmAa7MiL15fQhX/A8yHHk+vkUjCrVWLFUwMW9Y4rxxrZ167n
	ejqwX0AQN+QACuzHGEdisip9P2cGjtbE4ZG7OfxV1hAvdRVjB5aaJJhX6TxuoaSzzfvvNO
	L5Xckmw1pQNXNUtUI6nodJ01+GTXVefs/ldLo1ZXo4UssopIpv/r5ij7p1ozSxBc+ghQ3S
	/913bKKZ+QTRojt5olYEFRrEILngT65R2T15t48P+/B/wE812eFxDVE35Dukeg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Daniel
 Baluta <daniel.baluta@nxp.com>,  Shawn Guo <shawnguo@kernel.org>,
  devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS),  imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE),  linux-arm-kernel@lists.infradead.org (moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
  linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 1/2] ARM: dts: imx35: remove empty clock-names for
 nand-controller@bb000000
In-Reply-To: <20260403074634.774234-1-Frank.Li@nxp.com> (Frank Li's message of
	"Fri, 3 Apr 2026 03:46:30 -0400")
References: <20260403074634.774234-1-Frank.Li@nxp.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 03 Apr 2026 10:19:47 +0200
Message-ID: <87o6k05ucc.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_011957_149384_67C7D4D2 
X-CRM114-Status: UNSURE (   5.73  )
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

On 03/04/2026 at 03:46:30 -04, Frank Li <Frank.Li@nxp.com> wrote:

> clock-names is empty in nand-controller@bb000000, which is wrong.
>
> Remove it to fix below CHECK_DTBS warings:
>   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: nand-controller@bb000000 (fsl,imx35-nand): Unevaluated properties are not allowed ('clock-names' was unexpected)
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

