Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBA4D44158
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 12:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=059kkIYqpn0ehFSmAg/GBS0dpyJTqN0Io9RSk7P5TWk=; b=wZvgipbx4XACBHUI9DiTc3zuLI
	lb1FQNQDobFvKO4H3ZymOL+LsGlbFQIhvBkFjLgA4jO2J0o5l5MnjNl359vfBNHgavGjnFPPDULSw
	fUkzmnXuHYF/GjRhdjX9AGnd8A2ZPBm8HLAUCsyRfMnIPORRas/dZO5XocG3VzsLJ9nNMLKR4mzlC
	T9V9UhN0sIuhvHoq6ebYxh+IRZbAtVHabUFbq32X+RuP32NgMp3coLa3POOX1+cvI4qrCt/43GaAt
	mKYZEboEt7gDOePrc+5IVyGil0X+X+UXb7+rudxeddpgEILsERFI4Sfh5btfV5xrM2JvxSy+qo0Uv
	XVXTG58A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNn9-0000000CR8b-2vfa;
	Tue, 19 Nov 2024 12:57:15 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNjU-0000000CQHQ-0p6g;
	Tue, 19 Nov 2024 12:53:30 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id CA5DF10000D;
	Tue, 19 Nov 2024 15:53:26 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru CA5DF10000D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1732020806;
	bh=059kkIYqpn0ehFSmAg/GBS0dpyJTqN0Io9RSk7P5TWk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=J2QL3MacK0LO38lqp+Mn2nOqlMhnD3C5Jy3wWygH3YzHN+LdkY4ng5B6CcFHdTW8K
	 83SlWByFK9r9t2i/V/mDjXSlvMlApCd25GkRsM56zvM5lNaQACeKUYUExAF8k2E+xV
	 1kUuX6C6/mmNcI7F4lJnShg7tiVhpfhMtoOn6dmTWbDOQOTw8jYJ3CvBomCTwko48G
	 PN5t1KtnArh+fYjgrAxqPUehQmSpy8I1+/bmRF6c4BoZXQ81osIg6zuUvsB5Ak2+Yg
	 quWYJ3owHbkOpxpTC0X+cqh4UQQn7ApruiosqAJ5hMhAvtXO+wEfOXy4JpiZQ28InJ
	 AFetk3gw5NdGg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 19 Nov 2024 15:53:26 +0300 (MSK)
From: George Stark <gnstark@salutedevices.com>
To: <ukleinek@kernel.org>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, George Stark <gnstark@salutedevices.com>
Subject: [PATCH v3 3/4] pwm: meson: Use separate device id data for axg and g12
Date: Tue, 19 Nov 2024 15:53:17 +0300
Message-ID: <20241119125318.3492261-4-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241119125318.3492261-1-gnstark@salutedevices.com>
References: <20241119125318.3492261-1-gnstark@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [176.57.76.73]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 189267 [Nov 19 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/19 08:41:00 #26886618
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_045328_572489_98A8EFA4 
X-CRM114-Status: GOOD (  12.45  )
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

Add separate devce id data for compatibles: amlogic,meson-g12a-ee-pwm,
amlogic,meson-axg-pwm-v2, amlogic,meson-g12-pwm-v2 due to those PWM
modules have different set of features than meson8.

Signed-off-by: George Stark <gnstark@salutedevices.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pwm/pwm-meson.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index d7335efa3db7..3cc48c3dde5e 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -561,6 +561,11 @@ static const struct meson_pwm_data pwm_axg_ao_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
 };
 
+static const struct meson_pwm_data pwm_g12a_ee_data = {
+	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
+	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+};
+
 static const struct meson_pwm_data pwm_g12a_ao_ab_data = {
 	.parent_names = { "xtal", "g12a_ao_clk81", "fclk_div4", "fclk_div5" },
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
@@ -575,6 +580,10 @@ static const struct meson_pwm_data pwm_meson8_v2_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_v2,
 };
 
+static const struct meson_pwm_data pwm_meson_axg_v2_data = {
+	.channels_init = meson_pwm_init_channels_meson8b_v2,
+};
+
 static const struct meson_pwm_data pwm_s4_data = {
 	.channels_init = meson_pwm_init_channels_s4,
 };
@@ -584,6 +593,14 @@ static const struct of_device_id meson_pwm_matches[] = {
 		.compatible = "amlogic,meson8-pwm-v2",
 		.data = &pwm_meson8_v2_data
 	},
+	{
+		.compatible = "amlogic,meson-axg-pwm-v2",
+		.data = &pwm_meson_axg_v2_data
+	},
+	{
+		.compatible = "amlogic,meson-g12-pwm-v2",
+		.data = &pwm_meson_axg_v2_data
+	},
 	/* The following compatibles are obsolete */
 	{
 		.compatible = "amlogic,meson8b-pwm",
@@ -607,7 +624,7 @@ static const struct of_device_id meson_pwm_matches[] = {
 	},
 	{
 		.compatible = "amlogic,meson-g12a-ee-pwm",
-		.data = &pwm_meson8b_data
+		.data = &pwm_g12a_ee_data
 	},
 	{
 		.compatible = "amlogic,meson-g12a-ao-pwm-ab",
-- 
2.25.1


