Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709E2CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQxx/KluC/+d3m4FrK0wA2hEdaOutnyxgsFe7NpoS3U=; b=ncdLgKJWXg02AZZRrofzocVPxc
	UTR2/TGgh12K2N4jcWKXAliLCF2GzlOXjXiEWSGxI+S2PaN1vJX7eR6adXtqQ6ZVRMDv/JM/tqtlW
	gUzjHVsNYeIhow6HlKcipgOV9qYcFjoLIrznV0fh75DSzSkyXzVBKuTomIivcKk0ArDOLo+TLmyY/
	rUabVI7JHOF3Bl26LGxC/TsxFMNr+71Ed9+ow7cQgNm2iIuk2MjTGt2wNxa6HvnWM30bKdZylnzG9
	YLvIRCGKByq8Uk1armtWJGzo11ILqbZv/roJzy0X2HizzBmLFbTXW+dktwJlwj6FuTHvu7IW3mnKZ
	9ORS/XhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVgL-00000002Nqy-0eBg;
	Wed, 22 Oct 2025 10:03:01 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVfw-00000002NnU-2DDR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:02:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5B689C0B8B3;
	Wed, 22 Oct 2025 10:02:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 122CB606DC;
	Wed, 22 Oct 2025 10:02:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA036102F2393;
	Wed, 22 Oct 2025 12:02:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761127353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hQxx/KluC/+d3m4FrK0wA2hEdaOutnyxgsFe7NpoS3U=;
	b=NpyqG8GPS3jm4yxonp42vl4Ry0tGC45F6XfYs1a5Ew8l7wYjqtSGnA9SXf384EEz3qA380
	Dm9YOFIPfX56DKFm+/i9/75CR0Imkea6nrNtrDoKmZQ9xjh65MIV+DWry3E5GXGLr8LI1m
	E8o4jF7POwrN+nG6AYnNwAN0HZSsYX0Kmp2QpUa2j6r5ABqlVILy0zbcK3g/dUDEsSXnK9
	I/jyrvuYDJwWowyK8EJfJp/6e1US5wQpvK3oUk9G/GY14yAhCldyxWExLqC2e8d/tHVvFS
	MiYz+1eqSfD+K73TOQmYWqUtr2ujw+rLgonZQTwWz5pmGxAwxAnsKbUZpYX2tw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-renesas-soc@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>
References: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] dt-bindings: mtd: physmap: add 'clocks' and
 'power-domains'
Message-Id: <176112734652.141620.5938048164419652638.b4-ty@bootlin.com>
Date: Wed, 22 Oct 2025 12:02:26 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_030236_745016_0B3A30CF 
X-CRM114-Status: UNSURE (   6.32  )
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

On Thu, 02 Oct 2025 16:23:11 +0200, Wolfram Sang wrote:
> Physmap supports minimal PM since commit 0bc448b49e8a017e ("mtd: maps:
> physmap: Add minimal Runtime PM support"), so support it also when used
> in DT configurations.
> 
> 

Applied to nand/next, thanks!

[1/1] dt-bindings: mtd: physmap: add 'clocks' and 'power-domains'
      commit: 4e7a83ed83120858f676007706197aa5594d4dd9

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


