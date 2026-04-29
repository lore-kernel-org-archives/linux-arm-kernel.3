Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82233FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/NHAdqcAIjrljj0o3r/rYGwX1SP5NW5sDQNpjnh8ik=; b=WaGzGE06O8b37sRIhIskO9yQ3A
	UQtr5JIPxDkjZS+1/WLy3rlLx1Uj6WSWvVbFt4UaSBXcJsQ7P9L2cFLs3Opv1AhirWZYn6tCXFK0o
	3Cfivq2ljwduSF+PKv5didLCv1fBSwI07eRh/EMR8c6EVzR2EzvJNF1yaGle8D55F95uvOt4vAB9t
	92VDB0Z7P03PM/rbxH9en4ZNZ50hvGTUFzJoTquUtNrh4un6eS/+65xOrggWZnzn1b0oHy6SIWcQP
	y5bveK7SL20AjlUF3Xl77Knp/AJSwQpt9o4VvQxp4O+MPQRM1/EuOvum87BsHtr48OGd1cg8T1bul
	5UZIytcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1R7-00000003MMQ-3bfO;
	Wed, 29 Apr 2026 09:42:29 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1R4-00000003MKt-1XhE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:42:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B278C4E42B3E;
	Wed, 29 Apr 2026 09:42:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 673E4601DF;
	Wed, 29 Apr 2026 09:42:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9764510729AB0;
	Wed, 29 Apr 2026 11:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777455741; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v/NHAdqcAIjrljj0o3r/rYGwX1SP5NW5sDQNpjnh8ik=;
	b=itAreS11Ry6MEWWqWOYHc1aSTrU6m9Qq4JBLgvZon8eOjxMlu5Y39z8tvF69EPy1LzeRZi
	aCyGs6XkIMz5o8jwV4WM5v1y/2Jb/HfWZtPSKZnsMqb1oW8EdL4LENANSiQbn9XqA3KRNE
	tO9szqPFMjgNu2MEvYDzg2fFdimpsdwyOxJopylgjaPfOvkSBGJGFfT7Uy3lWOq5JPhc+7
	Y1JuOjJl3A/KzjoiR6CaxeIHTThQBtm8T8XlTr8cLzCDcQdgcvEgtUapVBJhYUBBRCc1fp
	ktlO2a1Qm+MUzEUTJAjMQNcMOhfRI9/o/vKslhFOBmZyPq9fcTPyIM/GBzx25A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Russell King <linux@armlinux.org.uk>,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] ARM: at91: remove unnecessary
 of_platform_default_populate calls
In-Reply-To: <20260429-lushly-greasily-c14c01c1aee8@thorsis.com> (Alexander
	Dahl's message of "Wed, 29 Apr 2026 10:02:28 +0200")
References: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
	<20260105-at91-probe-v3-3-594013ff2965@kernel.org>
	<20260423-stoke-ocean-139dbe306256@thorsis.com>
	<20260424-worried-renewal-924d34ed945c@thorsis.com>
	<87tsswfnmy.fsf@bootlin.com>
	<20260429-lushly-greasily-c14c01c1aee8@thorsis.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 29 Apr 2026 11:42:19 +0200
Message-ID: <87lde6cdc4.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_024226_532462_86F6FD84 
X-CRM114-Status: UNSURE (   9.38  )
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

Hi Alexander,

>     [    0.958298] bus: 'platform': add driver atmel-ebi
>     [    0.958451] platform 10000000.ebi: bus: 'platform': __driver_probe=
_device: matched device with driver atmel-ebi
>     [    0.958566] platform 10000000.ebi: error -EPROBE_DEFER: wait for s=
upplier /ahb/apb/pinctrl@fffff400/ebi/ebi-data-lsb
>     [    0.958649] platform 10000000.ebi: Added to deferred list
>     [    0.959429] bus: 'platform': remove driver atmel-ebi
>     [    0.959540] driver: 'atmel-ebi': driver_release

Interesting.

If you look at the very last line of the driver, the EBI driver does not
use a standard "module_platform_driver" macro, it uses some kind of
run-once probe that is kept in an __init section:
https://elixir.bootlin.com/linux/v7.0.1/source/drivers/memory/atmel-ebi.c#L=
637

And this seems to be incompatible with probe deferrals:
https://elixir.bootlin.com/linux/v7.0.1/source/drivers/base/platform.c#L948

I would suggest trying something alone these lines:

--- a/drivers/memory/atmel-ebi.c
+++ b/drivers/memory/atmel-ebi.c
@@ -633,5 +633,6 @@ static struct platform_driver atmel_ebi_driver =3D {
                .of_match_table =3D atmel_ebi_id_table,
                .pm =3D &atmel_ebi_pm_ops,
        },
+       .probe =3D atmel_ebi_probe,
 };
-builtin_platform_driver_probe(atmel_ebi_driver, atmel_ebi_probe);
+builtin_platform_driver(atmel_ebi_driver);

Memory taken by the probe function will remain mapped. That seems to be
the drawback.

Thanks,
Miqu=C3=A8l

