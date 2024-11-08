Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896DCD5C0C4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 13:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1p77c5f46fGoPaVLzCPx/GSglvzQAh4d6x8dFwGg/y8=; b=n8VlVlN2eCb03R+b2HHf2rmAVi
	oSsxF9f8D1Cl/vQlq+yRg8vfB61FrRZgMlqyOSOcZQCFVfoV44V6QGAd3SnhpV9CVzKopj2cVmDoW
	zdQJ2fhU/aQGUCwlPCXAFHg9DOwMYsffclG0Y6qhHC+x2QBC/sz1/U1LFdPmGnCUI4ZGtlp7la8np
	d/26VqUjCccPbescmRtT42m6h6nyePfNWyQu8zbaCv2mJlCdx7dq5A1VzPrs/q+Cg80fMLCE9W8IS
	bxiRAfQqJbpYlEnk4XH/tlAFWDDCmKcLk9MxNy6q3IaBjujYjxG7+mKFgsawGccDYoSSn6ZaVTuAJ
	Cg7ni6wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9OjL-0000000Acik-4AGW;
	Fri, 08 Nov 2024 13:08:52 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Oha-0000000AcTr-3TzE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:07:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1731071212; x=1731676012; i=wahrenst@gmx.net;
	bh=1p77c5f46fGoPaVLzCPx/GSglvzQAh4d6x8dFwGg/y8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HfE64W5urkFxX4SCcp8HQXVGTR1zZkCyMFklSNKtICLvfOu5YTeLhJ5xLrFpogIX
	 ZnAT/5dMV5fAI9lBJiA76slejh60mdaK9SuSEGC8X7VSk0G3V0rJbv0uZzpAkFEIU
	 O/wxsdezOExa+aajoCf9AFoNQ+Cimt3Cran844SBUvSBpXlzhgHE5cku4i9EVjYMV
	 wjDcswBkEOofrcNlpcxuQadtF+BSJsADpUv/PuSWnuQ5EFt+Dwx3Py4+ChKSsWbWy
	 oddEdmrBvm5fZhB767aXYffKp2/3eJ4rUpuF3YrQQGmKguOKEOhnhn+owv5exINuB
	 KYaU48JNO518sBK2Dg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5GE1-1tqo2L0f5B-0138g2; Fri, 08
 Nov 2024 14:06:52 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2] mmc: pwrseq_simple: Handle !RESET_CONTROLLER properly
Date: Fri,  8 Nov 2024 14:06:47 +0100
Message-Id: <20241108130647.8281-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CzNb5FcPCkmFO2MkOQP2r9VgtLh5nVVcu0PLyDmwl2n2DXTR+S0
 Iy+HY8QIyh9L11L6whQivHPt+eXPpMJLChqWvCPbAZSdkbhXntTROQFkOFt9uTgp1T20kne
 EB1Pvx3htSxUxjlrDm0QH+OyYEBJHuZwDPq1QfiNWPvEhDRaOMRTy7UYVdcBe6CRCqtZOlz
 VRlVEDrQo6Iz+8pOqbOjA==
UI-OutboundReport: notjunk:1;M01:P0:gyABekB2yNM=;RmfHHNj/19FzHkpHw5x4UlPlRBE
 brzDjfQ57McqGPHjgDXwKHAd0M760e8vSRklNkAZHhRq/RPglph50Pg9WSUJSPsu2HWts5fNw
 tuU/qnI0nTDkCskokGahbdyjzJaCO+ESMwxwPoEqcBeRZmjOBdvswtITBV3kxxL7mS3FVlXVV
 PV1KmO4Irv0Q6hUZNSG10h89CXy/eIavVU7Sef252TkG8acklOHA3lTksTEXajmWYfYC7CRhx
 UvH60/SkX/YExWkj9W5yfn4FPWlnl1dlwQ+ECYU73zQwAoz2Ox00NEHrQ6ZaJSfvPJm8+yz+R
 VXzzfUeHrsW0uBu6c+RxsEaV74nOfly8H9uAn3FWkgewPsKQsHvredBuAJTVgBSkVkttI3Z5V
 9FtpxzeSVBCKlDceXS+a88GlyH/aI7TCFmIM5AKqLXl8xOsYgPynVUbs4g19Ur6abw/7OzNQ/
 rzGhkakRyElQU7lVqhR7+58t+ukpOf6aBfbu1Mkgkg4spPryDzDugwIFwqWC13AfFBf+U3lya
 L7+xIMUJE3ZHuSz5Y/WUHcgl3/aCm3Dn+63G/ytwtNCyQR+x80l71+1QckE11Nk8fsraGW773
 yyeNRt0BehJ55oOc+KAe8WrV3ETdBqEjEEbOjxsAXRhaMIhFwJx+mKMLA53anaQovc90EThgc
 sLNdn0v+aj4Gz8HGc46RpHet/a2fUEoGu9xEIxNZGyMkd9YvnceEng17cft/b4drS3fXg1cZd
 mn+9kritsgGFvsMKHGdLcY6Y9gKJX84hji7IhiWhPuO2XyDAK3nQ9S6iyK4+9yitFEI/AHC6C
 KFybgvsHpieRyKXkqV90M9ouSRi+bJn2rjGvuuSQT+ZNXSFwUVXOwMepBbTFYLC4Y6l6/M8Vh
 SuywGD4pF+u241xTuCU0YIx8xLlhzbCH22MCKK8CRtlgY3Tr2mlZbh2J6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_050703_187524_44BF3D9A 
X-CRM114-Status: GOOD (  15.58  )
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
resets no-ops. Instead of enforcing this dependency, rely on this behavior
to determine reset support. As a benefit we can get the rid of the
use_reset flag.

Fixes: 73bf4b7381f7 ("mmc: pwrseq_simple: add support for one reset contro=
l")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/mmc/core/pwrseq_simple.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

Changes in V2:
- add explaining comment as suggested by Marco Felsch

diff --git a/drivers/mmc/core/pwrseq_simple.c b/drivers/mmc/core/pwrseq_si=
mple.c
index 24e4e63a5dc8..37cd858df0f4 100644
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
@@ -137,15 +136,18 @@ static int mmc_pwrseq_simple_probe(struct platform_d=
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
+	/*
+	 * Fallback to GPIO based reset control in case of multiple reset lines
+	 * are specified or the platform doesn't have support for RESET at all.
+	 */
+	if (!pwrseq->reset_ctrl) {
 		pwrseq->reset_gpios =3D devm_gpiod_get_array(dev, "reset", GPIOD_OUT_HI=
GH);
 		if (IS_ERR(pwrseq->reset_gpios) &&
 		    PTR_ERR(pwrseq->reset_gpios) !=3D -ENOENT &&
=2D-
2.34.1


