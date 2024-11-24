Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F90D68BFD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 17:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0H0B4PsbvygCHE/KEfXOAhneQ94ZEiR6b2nVna+Pf0=; b=aq5vKNduJdwCckrIRyaFZ1/AfW
	cVMUVi6yU+Icr4H989P99uwyL1s/AJFsb3cchun8X7lIMqY55iO6qV/o3w+iBfG9dKprcxerFr4R6
	OofVxu8UsXKjFr0GvQ151z4l7LHVFSqg4av0RJ605xH/pPYSTwMAmtMTAyPKggTViWvPQB0MUnSDV
	0DEBNY5jltJY8jNk3vb2GhSQmtu9nbM4ez/GigiZY9+DSa7vmiaH4WqZ1vTyf/GZXz7iBDftE67O0
	SkDsGkSpB7AV7cLM1BNv6KbZclAaRARo21GqPmwTOa/sVGNdHWCjH4wZgZWVtoTLF0Y8/2LIPqsIm
	DEjrl1kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGoI-00000006RwH-2us5;
	Sun, 24 Nov 2024 17:54:14 +0000
Received: from saphodev.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGnL-00000006Rq9-1zBS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 17:53:16 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 8E648C0000FF;
	Sun, 24 Nov 2024 09:53:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 8E648C0000FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1732470794;
	bh=CjUEiOEgo0/5UmQ1LrntixY7y5S5TqQ7OyWWeDdh65g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MtfJ1aP1TWoXyGX13fk0D4zDWT6012ivrO14N2vKUvgAB+RUpnmetfbAXcfxdHd0q
	 Ppew/pZLCeeBO/TISWpvoxkAY4o5kGaPSv59pqFW4HiV9Ph4Tczj1EtMjJe5hoELuQ
	 r1bCDwRbEAT4Gx6JOPRFng1riprLSnSDJANTwOBM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 1E94E18041CAC6;
	Sun, 24 Nov 2024 09:53:14 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/9] ARM: dts: bcm6846: Add iproc rng
Date: Sun, 24 Nov 2024 09:53:13 -0800
Message-ID: <20241124175313.717344-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241019-genexis-xg6846b-base-v3-1-8375a0e1f89f@linaro.org>
References: <20241019-genexis-xg6846b-base-v3-0-8375a0e1f89f@linaro.org> <20241019-genexis-xg6846b-base-v3-1-8375a0e1f89f@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_095315_588273_1C521BE1 
X-CRM114-Status: GOOD (  11.01  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Sat, 19 Oct 2024 22:39:30 +0200, Linus Walleij <linus.walleij@linaro.org> wrote:
> The bcm6846 has a standard iproc 200 RNG which is already
> fully supported by bindings, so just add it to the DTS file.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

