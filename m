Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D4CE9B368
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rotfdbhs6NEPh3v50FusRnJ31s7q/imy3fVneA4hxns=; b=dADz4UusJCZ9pVNdKQiMcxINkD
	TS7huN5htcKHTX4uu90H1LcccxxNrSEm6tDEqr0YPdbaA8+ezJZXUwC2rdZLuMWyYpoB81fTMu+zt
	9bDOA6Pqh5oU2LraT3dfAnikQ12+Pp2vJ+gVtA+vr2JX/rf7bc4nyYNklilg69z5UhyzLKuDcy5e3
	reOHqzAWkw9fYNPeZwLdQfOf/+OJqxoHNAsSNg3YYOnws+Th9PO1XMnKxhoMRw6BTevxya93dCvEz
	gLGbJbi20tOMUL17IBVLndsOCtjFRvCLTnyWBDSA55etHotTWXy+EKACxcRZOuTbrCvhJSSyqZgR2
	m+JFISfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx18Z-0000000CmUO-20Rs;
	Mon, 02 Mar 2026 11:08:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx18X-0000000CmT9-0Bi3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:08:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E78AE44546
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Mar 2026 11:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFA5C2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Mar 2026 11:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772449707;
	bh=8XEX/rnkazMSSq065H7yUtYreYrkU2RTr4vXU0hxBRY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=YbBfJQwvA8ZDkIbUHvzWd9bxFP286FyRi+6wLAQuE9q8TwWFcVlk9AQhC8fvsEHcS
	 yHatcnsbSspmtVtFlLwV8ZuOzJQTnegZmndCvXut4EfjMqaPL4fj3qz8c5eU7bkzIq
	 aL1hYJm3MSE2Sqahow2ntysCczX6gR+UuA0PZCR1B+bpZSYhPLWeOopNMlZaPIcUWb
	 ddwp8wxhX5dIZ7yAPFwPy3yEX0e20B7fJvLl9pCRMmzGAqvpVP3T9hxb9RyUXXa5vM
	 MVYoBQBbJZxn6wNsQRX52rnOZjDo6YpD/LwSyuvvP9Aqu1+Az9pysnm5MQk0BruDSF
	 uaXLV6f5/t7YA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-389fa0d1040so57614831fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 03:08:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXD6JN0S/BKSGX75pVmPcNqHRdu5K68n/ZuZCkd6TcAQQVXu/9V5yFDNtIsLiymt9KGMWGi08CXnIyZIlq8+lm@lists.infradead.org
X-Gm-Message-State: AOJu0YwtKy+Exx03xebxo5JWcPcljZW6fmaiHC1brUOZiufNj1kQPdr/
	BijLtiRy8wgWFSiyod8io3WMvLJHT1iBZevYpn/+ZS+NwTCmKbERpX0bOOiRBPyMhHODaOpzaD0
	jKNVogHTGcQUtI25Mc5pafIZyC1m1VYIViyhk+1qKeg==
X-Received: by 2002:a2e:a546:0:b0:389:f206:385e with SMTP id
 38308e7fff4ca-389ff105664mr79983601fa.2.1772449706034; Mon, 02 Mar 2026
 03:08:26 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Mar 2026 03:08:24 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Mar 2026 03:08:24 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com>
MIME-Version: 1.0
References: <EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com>
Date: Mon, 2 Mar 2026 03:08:24 -0800
X-Gmail-Original-Message-ID: <CAMRc=Mc1+GX52A56kBLD0XytvL=E7kpjLDiqNkR=fici4-qUnw@mail.gmail.com>
X-Gm-Features: AaiRm52-e8hf8gRuhG83BjnYTwr36APGjOHw0TgBET88GWBunjS2IaxxLxeXJKQ
Message-ID: <CAMRc=Mc1+GX52A56kBLD0XytvL=E7kpjLDiqNkR=fici4-qUnw@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] i2c: allow setting the parent device and OF node
 through the adapter struct
To: Kalle Niemi <kaleposti@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Branden Scott <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_030829_124752_49FC9DCA 
X-CRM114-Status: GOOD (  19.09  )
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

On Mon, 2 Mar 2026 11:38:27 +0100, Kalle Niemi <kaleposti@gmail.com> said:
> On 3/2/26 10:55, Bartosz Golaszewski wrote:
>> On Mon, Mar 2, 2026 at 8:47=E2=80=AFAM Kalle Niemi <kaleposti@gmail.com>=
 wrote:
>>> On 2/23/26 11:05, Bartosz Golaszewski wrote:
>>>> In order to stop i2c bus drivers from dereferencing the struct device
>>>> embedded in struct i2c_adapter, let's allow configuring the parent
>>>> device and OF-node of the adapter directly through dedicated fields.
>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.c=
om>
>>>> ---
>>> Hello,
>>> Automated driver test system bisected this commit to be the first bad
>>> commit, linux-next next-20260227 was tested. Failed tests include drive=
r
>>> tests for ROHM PMIC and accelerometers, which are connected to
>>> BeagleBone Black.
>>> The failed driver tests all fail to first i2cget and the tests stop
>>> there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such file o=
r
>>> directory".
>> Wolfram: well, now it would actually be useful to know which commit
>> exactly is the culprit so maybe splitting the changes is not a bad
>> idea after all.
>> Kalle: which i2c bus driver fails here? Any errors in kernel log?
>> Bart
>
> Hello Bart,
>
> i2c-1 and i2c-2 are failing. I am not seeing any i2c errors in kernel log=
. I got two failures without the dmesg available (this is bugged test seque=
nce, and not a kernel crash), but those got the same stdout message "Could =
not open file ...." as all others.
>
> -Kalle
>

I meant what driver are you using but I suppose it's i2c-omap.

Can you try the following change and let me know if it fixes the issue?

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index dd8cec9b04c6..01656f82d2c6 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1548,6 +1548,11 @@ static int i2c_register_adapter(struct i2c_adapter *=
adap)
 	if (adap->timeout =3D=3D 0)
 		adap->timeout =3D HZ;

+	if (!adap->dev.parent)
+		adap->dev.parent =3D adap->parent;
+	if (!adap->dev.of_node)
+		adap->dev.of_node =3D adap->of_node;
+
 	/* register soft irqs for Host Notify */
 	res =3D i2c_setup_host_notify_irq_domain(adap);
 	if (res) {
@@ -1561,11 +1566,6 @@ static int i2c_register_adapter(struct i2c_adapter *=
adap)
 	adap->dev.type =3D &i2c_adapter_type;
 	device_initialize(&adap->dev);

-	if (!adap->dev.parent)
-		adap->dev.parent =3D adap->parent;
-	if (!adap->dev.of_node)
-		adap->dev.of_node =3D adap->of_node;
-
 	/*
 	 * This adapter can be used as a parent immediately after device_add(),
 	 * setup runtime-pm (especially ignore-children) before hand.

Bart

