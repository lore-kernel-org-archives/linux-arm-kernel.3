Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB819CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 19:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wByOLPXiT9PdoFohP3YN91tzflVyNxga+TQMPZo8YjU=; b=lqzNkOydpCu50SwIWx3f1NatgP
	prYggcIg3HoviS6iwOik/lNs62hIDJEcTU/0VkLZO3REysod7srOIjVouIjOGLZCnrxwq1CrQkqh2
	sO8+r/9/7cEfNCrEGCKWerBPKdlv0kqiSUmcVkWr45w9NNVOBnZxsGkXPV2IwRvS+BtaAxa+3DHVf
	lX4KPuwKmu3m0mzY7lLuCxnSxVxKaiRrwiXXqn0uwMPXoJ7n45OZ8uMzKOfjImrF0wx8PiUlExrsk
	tEMcFvNicGIdq/ctKvPBU6xzN8C7Z9BBIEzQ5NJZ+980/kwBtYnNULMp758KYX32CkPW6gHj65SQx
	xO/+mtgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2HU-00000006Ia7-4A0f;
	Tue, 09 Jun 2026 19:38:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2HT-00000006IZz-4386
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 19:38:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 75E5743046;
	Tue,  9 Jun 2026 19:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874851F00893;
	Tue,  9 Jun 2026 19:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781033915;
	bh=wByOLPXiT9PdoFohP3YN91tzflVyNxga+TQMPZo8YjU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=C5uKct6CFAHyGKr9yH2F+BXO0ZvXZkFWO2bwyrudbe8jR6lk1OWKa+UVYxWSi0uGz
	 v+AztB8A0GWr6dJ6+dXIiFxRZxV3NE6Py7KkBmSHV97VY6H7Gzyx5DdUdAV8Z1NRL/
	 fCTok+s2RuuHN+x6SunvO5H6rPR6QyOR5sNQ1oelgmBGq+h5EZ0xX1bNBkMB12rfNd
	 FgZqBI00D6ir4LqU19QOkrNsaAubu7WsfnSUaLR50xLYGIU06aluLWLM9xK52+0bUn
	 WCKTywi2pcRz05n5NkX+r9XJsbDbH/+XHa769ExIks1XVRz5mnEef65JxunQAQQ6pY
	 rjO8kwSI91qNQ==
Message-ID: <094d85c9-145a-4d7e-a55d-35da920592d1@kernel.org>
Date: Tue, 9 Jun 2026 21:38:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] can: flexcan: disable all IRQ lines in
 flexcan_chip_interrupts_enable()
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 Haibo Chen <haibo.chen@nxp.com>
References: <20260609142954.1807421-1-ciprianmarian.costea@oss.nxp.com>
 <20260609142954.1807421-3-ciprianmarian.costea@oss.nxp.com>
From: Vincent Mailhol <mailhol@kernel.org>
Content-Language: en-US
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmdfB/kCGwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
 F4AACgkQq1/riG27mcKBHgEAygbvORJOfMHGlq5lQhZkDnaUXbpZhxirxkAHwTypHr4A/joI
 2wLjgTCm5I2Z3zB8hqJu+OeFPXZFWGTuk0e2wT4JzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDl
 dOjiq1/riG27mcIFAmceMvMCGwwFCQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8V
 zsZwr/S44HCzcz5+jkxnVVQ5LZ4BANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <20260609142954.1807421-3-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 09/06/2026 at 16:29, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> flexcan_chip_interrupts_enable() disables only the primary IRQ line while
> writing to the IMASK and CTRL registers.
> 
> On multi-IRQ platforms (S32G2, MCF5441X), the additional IRQ lines (boff,
> err, secondary-mb) remain active so their handlers can fire while
> registers are inconsistent.
> 
> Disable all registered IRQ lines around the IMASK/CTRL writes. This
> also fixes the resume path, which calls this function.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> Reviewed-and-tested-by: Haibo Chen <haibo.chen@nxp.com>
> Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>

Reviewed-by: Vincent Mailhol <mailhol@kernel.org>


Yours sincerely,
Vincent Mailhol


