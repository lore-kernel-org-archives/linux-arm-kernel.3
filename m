Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84827E677FC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 13:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wh8jWE/SuHQZpH1OicaEibZkdDUs8oXsmEh1paiPtHU=; b=j+g0SWzh+xU0d7mtIfC4gAyvVJ
	IbXa/TtPL6HvfpUFxgQsQFj4G5h94T66vCLU4eDTgZyF8peRgUFOA0ocCXPfgn8FQCkuI5rPniGNC
	0/EEJFj0ghE6nhldIQbw4BlVZk9tEuwq2wDVOAOJcunuH1e3E/MK7Q3td0/KAetXhgW+jr5Oao5JG
	UEJ1EVNiiRg0EhOS2UTgj6dTGrOim8IihAqY9NPENzAh3TSPe5cIwpXgQsAJpwg/vgO/zKWQWAKUX
	wRQN4B8+21kfVo9HXUm4yFWxRhxhJklUHjApzK43YTMoaOaOEdclMaNbjRRIWYM7GE3qkbIz2Sgbi
	mn92lvaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ETI-00000009o8m-34GD;
	Sat, 02 Nov 2024 13:47:20 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ERa-00000009nvk-49mD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 13:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730555125; x=1731159925; i=wahrenst@gmx.net;
	bh=wh8jWE/SuHQZpH1OicaEibZkdDUs8oXsmEh1paiPtHU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tEYyNh5C432n6QJ3/ReOh2iXRHf55sXiK2LY0BnUIYoVg4puSzL3VBcGUBYKNDZ+
	 mZyu8GUlLosI7z9Mt9wLbOeBUdfEt852Jl3vYp8mf77GIgvVBnGDpDjT7x9/A+/WY
	 ZDr426afeaHkiBiCz7+XdhJsFNbpjpflGXgOCLC+VSnQWnUCtJNM6ETgbGP949MkM
	 cXE1jMJurUylazlV3qogkEGACC+dnUQYlQlQamBNcV9Kb2xLrHhMFOUFUbxZdQ6Ux
	 U3m25wyupM0lTY30ejlkxJ5WZGHf4ePp15zOQJLdO1UrIeNCz0zLNddsTecCowRDV
	 oR3No6AZeKYfuBErQg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNsw4-1tVVWP2fFY-00Xw0G; Sat, 02
 Nov 2024 14:45:25 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>,
	Mark Brown <broonie@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	regressions@lists.linux.dev,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH RFC] mmc: pwrseq_simple: Handle !RESET_CONTROLLER properly
Date: Sat,  2 Nov 2024 14:45:22 +0100
Message-Id: <20241102134522.333047-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gR28kxpGv/paCHFYL+WOtD2omK8W76H6OxEFca2yYlzpt/S7qPc
 /02bKimVT4RMVrEYArMy4wu4g8NeZ2V/+caEDXvOpV9bkMQ6rIGVa4GSwcVTPoYteUOG1jB
 QNtiYQEllcjjBk4xs8tysy/1gw3IKr6WpZd1+a5UTJ93K5cOYrX67bgiiGJysPS0+lMlVqA
 B6iBdr4iiHwoZAiAv42ew==
UI-OutboundReport: notjunk:1;M01:P0:1HQhTF2m7cY=;vO7nMt2DEIbIhGRCHChaoucxQme
 UfAywgwv5ofAeu82VeQq2WMWl39EncgG4flGt4kuXwaAnCHJ9hFjJxEWBwl0sDbLl0pCfz+Ox
 iRZxRwl28uewevqRjIqZUYy0JBXJaMYrNQEs/kyUkp33Of8hZss46x3/t8HBeQljij1T3plLU
 pau0V5/s6AijvxPDLADhXYQ4B2/Ro6ND2YUcKxLf7lnqZm+gga6PvvZ7pek61pIZ+P6fLCr4X
 YmuC8TY3Q+/pX7WijVMwB1JfGIg6o4l19YtueVR0Y6K3wkGbzDrtxKPML752W6XmpairEuOfK
 NOruHozFz/xVnqG0J4mirtiP8KDXtZEMBW+aNyBx/3qvge3gSl2bkqnJwtYEjNnrABvYWhhXB
 9Lcp/xDsA1VmOy8Jj7LRp58JqMGQms0IcweMGgNb0IaR3Oos6h+Yv26hWAia+fax7Cm7muAaS
 s4XFWyz8lX/RNd8LUf1+nL9RhMrMiVIhhhQrYqI6GgGqsORzSDJQVMnIJRQnkFxhT/d/Pv6Gs
 t+Z+bMBNFFCHJIUACRJQmOTRO5OTnliwIEut72+xIbv3J8Z5Bk6+2od6egFQCXZO7mPX/DA5n
 /5DDSXQdaENQdzTxSMtXJWznc6MmG2d+kFCr4eyYETjLnA31rXdzIo8JWIoaO5DzovnGup0uy
 8BXIgkcSu7YLlP0EW9iVG43BVjClP4mSeA11VdIf/qZeCYgzXI7CLh5F5mrCXN+m11Oj7BrDk
 /1cVAb1/HPGyI3BgGe2yvEJ0zrrafdvWfna7iNyZuJbNlEXX9EEu50zc3gp4yjdRbLsCKq0jg
 CKqD7OXfURtqFKqQHXCt2CBQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_064535_434487_AE475C56 
X-CRM114-Status: GOOD (  14.05  )
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

The recent introduction of reset control in pwrseq_simple introduced
a regression for platforms without RESET_CONTROLLER support, because
devm_reset_control_get_optional_shared() would return NULL and make all
resets no-ops. Instead of enforcing this dependency rely on this behavior
to determine reset support. As a benefit we can get the rid of the
use_reset flag.

Fixes: 73bf4b7381f7 ("mmc: pwrseq_simple: add support for one reset contro=
l")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/mmc/core/pwrseq_simple.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

Hi,
will trying to reproduce the Rpi 4 regression from here [1], I found
the issue above. I'm pretty sure the Rpi 4 regression is caused by the sam=
e
commit. Unfortunately I wasn't able to reproduce it.

[1] - https://lore.kernel.org/linux-next/6724d7d5.170a0220.1281e9.910a@mx.=
google.com/T/#u

diff --git a/drivers/mmc/core/pwrseq_simple.c b/drivers/mmc/core/pwrseq_si=
mple.c
index 24e4e63a5dc8..b8782727750e 100644
=2D-- a/drivers/mmc/core/pwrseq_simple.c
+++ b/drivers/mmc/core/pwrseq_simple.c
@@ -32,7 +32,6 @@ struct mmc_pwrseq_simple {
 	struct clk *ext_clk;
 	struct gpio_descs *reset_gpios;
 	struct reset_control *reset_ctrl;
-	bool use_reset;
 };

 #define to_pwrseq_simple(p) container_of(p, struct mmc_pwrseq_simple, pwr=
seq)
@@ -71,7 +70,7 @@ static void mmc_pwrseq_simple_pre_power_on(struct mmc_ho=
st *host)
 		pwrseq->clk_enabled =3D true;
 	}

-	if (pwrseq->use_reset) {
+	if (pwrseq->reset_ctrl) {
 		reset_control_deassert(pwrseq->reset_ctrl);
 		reset_control_assert(pwrseq->reset_ctrl);
 	} else
@@ -82,7 +81,7 @@ static void mmc_pwrseq_simple_post_power_on(struct mmc_h=
ost *host)
 {
 	struct mmc_pwrseq_simple *pwrseq =3D to_pwrseq_simple(host->pwrseq);

-	if (pwrseq->use_reset)
+	if (pwrseq->reset_ctrl)
 		reset_control_deassert(pwrseq->reset_ctrl);
 	else
 		mmc_pwrseq_simple_set_gpios_value(pwrseq, 0);
@@ -95,7 +94,7 @@ static void mmc_pwrseq_simple_power_off(struct mmc_host =
*host)
 {
 	struct mmc_pwrseq_simple *pwrseq =3D to_pwrseq_simple(host->pwrseq);

-	if (pwrseq->use_reset)
+	if (pwrseq->reset_ctrl)
 		reset_control_assert(pwrseq->reset_ctrl);
 	else
 		mmc_pwrseq_simple_set_gpios_value(pwrseq, 1);
@@ -137,15 +136,14 @@ static int mmc_pwrseq_simple_probe(struct platform_d=
evice *pdev)
 		return dev_err_probe(dev, PTR_ERR(pwrseq->ext_clk), "external clock not=
 ready\n");

 	ngpio =3D of_count_phandle_with_args(dev->of_node, "reset-gpios", "#gpio=
-cells");
-	if (ngpio =3D=3D 1)
-		pwrseq->use_reset =3D true;
-
-	if (pwrseq->use_reset) {
+	if (ngpio =3D=3D 1) {
 		pwrseq->reset_ctrl =3D devm_reset_control_get_optional_shared(dev, NULL=
);
 		if (IS_ERR(pwrseq->reset_ctrl))
 			return dev_err_probe(dev, PTR_ERR(pwrseq->reset_ctrl),
 					     "reset control not ready\n");
-	} else {
+	}
+
+	if (!pwrseq->reset_ctrl) {
 		pwrseq->reset_gpios =3D devm_gpiod_get_array(dev, "reset", GPIOD_OUT_HI=
GH);
 		if (IS_ERR(pwrseq->reset_gpios) &&
 		    PTR_ERR(pwrseq->reset_gpios) !=3D -ENOENT &&
=2D-
2.34.1


