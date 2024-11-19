Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39F9D44157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 12:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlfMZQ4DgQrFKcas76Ke7AUU5dNNyOcvl5kzGZtWTCQ=; b=AHzLamx2A4SiLt4j8A3NOn/gql
	Cojn0twSx07YovlniiZSlFGNsPjYf6QYBqNNhhKoq22TAcQW8gPMyqWOuEfhQyA3W1lDCCO0I35XF
	ZM+Y2fI1Lpwva6S+u1fCPXvAEdmb6XDZeKG0x/p0q3ffdv6TfaaYuQawdxox5tw4ZNywp1252HIZw
	8FNACnxAHP278q+o/i23qbAxsrjOPdYkT4vhcTwiL6IebD88BPHbmPHevXAVIx089b3ENfADmBNoz
	Qz8UdjFhZxVgKeUxDp1j/9yXs0aKKXakmYxIdcLrkc6Cg2vzxrt79o9Kz9h0J10WlK9O8QliAs0Z+
	lftBo0nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNo3-0000000CRGo-3Eo9;
	Tue, 19 Nov 2024 12:58:11 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNjU-0000000CQHS-1gOx;
	Tue, 19 Nov 2024 12:53:30 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 08FD610000E;
	Tue, 19 Nov 2024 15:53:27 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 08FD610000E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1732020807;
	bh=SlfMZQ4DgQrFKcas76Ke7AUU5dNNyOcvl5kzGZtWTCQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=XfaAxOt8xJL0o2bn3DElg0ZCWAij29HHkhbit0ttw7XFteLn4SLBOOabt9Utnrg9I
	 mvmE3/7E5yo5OC+7Fjqf4udXGCU4t4iAzLaLeokoP9hMl68/eByu7jIa4Si4E/dUdY
	 i2gkFFEWBUXx+o1Vu+bBxWr+5gaIOsM5huoaCx40/DohYEV6OrXAl1tQRgOMwij+Xx
	 9cSlxWWUKO1EgytpoeIzmSibeuvaJenxNFtz6XU35t02ZUZbbVDNC4OOiNKnazpJwa
	 Hrot9p1bJZufuaXF7KW3w5Sfa2Bq7wm1P7g6gLaUeJBeJbPYzSP5g/DrV57BEeXa/2
	 QHNemeT/uGfDQ==
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
Subject: [PATCH v3 4/4] pwm: meson: Enable constant and polarity features for g12, axg, s4
Date: Tue, 19 Nov 2024 15:53:18 +0300
Message-ID: <20241119125318.3492261-5-gnstark@salutedevices.com>
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
X-CRM114-CacheID: sfid-20241119_045328_806007_71FC9DED 
X-CRM114-Status: GOOD (  10.06  )
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

g12, axg and s4 SoC families support constant and polarity bits
so enable those features in corresponding chip data structs.

Signed-off-by: George Stark <gnstark@salutedevices.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pwm/pwm-meson.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 3cc48c3dde5e..806e06c2b92e 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -554,26 +554,36 @@ static const struct meson_pwm_data pwm_gxbb_ao_data = {
 static const struct meson_pwm_data pwm_axg_ee_data = {
 	.parent_names = { "xtal", "fclk_div5", "fclk_div4", "fclk_div3" },
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+	.has_constant = true,
+	.has_polarity = true,
 };
 
 static const struct meson_pwm_data pwm_axg_ao_data = {
 	.parent_names = { "xtal", "axg_ao_clk81", "fclk_div4", "fclk_div5" },
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+	.has_constant = true,
+	.has_polarity = true,
 };
 
 static const struct meson_pwm_data pwm_g12a_ee_data = {
 	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+	.has_constant = true,
+	.has_polarity = true,
 };
 
 static const struct meson_pwm_data pwm_g12a_ao_ab_data = {
 	.parent_names = { "xtal", "g12a_ao_clk81", "fclk_div4", "fclk_div5" },
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+	.has_constant = true,
+	.has_polarity = true,
 };
 
 static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
 	.parent_names = { "xtal", "g12a_ao_clk81", NULL, NULL },
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+	.has_constant = true,
+	.has_polarity = true,
 };
 
 static const struct meson_pwm_data pwm_meson8_v2_data = {
@@ -582,10 +592,14 @@ static const struct meson_pwm_data pwm_meson8_v2_data = {
 
 static const struct meson_pwm_data pwm_meson_axg_v2_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_v2,
+	.has_constant = true,
+	.has_polarity = true,
 };
 
 static const struct meson_pwm_data pwm_s4_data = {
 	.channels_init = meson_pwm_init_channels_s4,
+	.has_constant = true,
+	.has_polarity = true,
 };
 
 static const struct of_device_id meson_pwm_matches[] = {
-- 
2.25.1


