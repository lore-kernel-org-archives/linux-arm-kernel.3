Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A872E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 11:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHd86CgFN+A0zZ482ESQ0Jwc5FHNViFNXh8Giwjs8PQ=; b=zu2FTNv8rSRnUPvau0mQw/VR2z
	tYivBPodWSOFSOoxbgVTxoPA341Bt3KE8YsAZUIoBElKmCsOnddh/QoOTqTxtbgYRTymF54aKxPbk
	mIQ0+0z5SrFOAgwVoCJlIe9xagIiPdUeUZZoDERH7h7zlf0pUR3JSyHOG/qyw2GkQZrDBpeAWu4oV
	VsqTPEyyv0DxYr3yqaYFT2HuV++0qWeJIBiJq3Wskf1V+qrj375608d4/mZ8EBot9jDrUoO5kkhFA
	OaII/SCVtM4OnO5aUsPoQSlmANcML+XRpfa4tMMhTRIO/2o55ufejwhxs6BwUfUwYQaYeFLQiqn6Z
	52j5JSAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQP7r-0000000DgRe-18CZ;
	Wed, 25 Dec 2024 11:00:27 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQP4Z-0000000DfxH-1G72;
	Wed, 25 Dec 2024 10:57:08 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 939BC12002B;
	Wed, 25 Dec 2024 13:56:52 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 939BC12002B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1735124212;
	bh=dHd86CgFN+A0zZ482ESQ0Jwc5FHNViFNXh8Giwjs8PQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=rVTEioeGm71YqPhpX6WvJeRaZD0VCWAfZyZQaGLovEYa72qV64beApDHYZHMkhFKK
	 IJDIJML4sHbedxxuVXVRroGwCy9vMV5QHL55WGmAH4ojaQgQOKFoS4tzcicpAGy6ye
	 PaxWVKrP6u3uq/D19yvylTSz7nMwJ+mbaoSPTgXFiBKaOMQYTZylPtdK2z34p5/WSl
	 EzsynvzUnpiQyBOJ1B3pIeae+xIpukOalEZGFfpBsZZl+gB4mmTCo43BVXEAMg/qhd
	 7iYFBAaVFbb95tf0y07OP4AJvApJOSBbENU/uDjhampMSBj0IEr3XZX1Bz4d1CBgct
	 MwRLigBn2rIGg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 25 Dec 2024 13:56:52 +0300 (MSK)
From: George Stark <gnstark@salutedevices.com>
To: <ukleinek@kernel.org>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, George Stark <gnstark@salutedevices.com>
Subject: [PATCH 2/2] pwm: meson: Fix computing counter register
Date: Wed, 25 Dec 2024 13:56:39 +0300
Message-ID: <20241225105639.1787237-3-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241225105639.1787237-1-gnstark@salutedevices.com>
References: <20241225105639.1787237-1-gnstark@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [176.57.76.93]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190053 [Dec 25 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49 28b3b64a43732373258a371bd1554adb2caa23cb, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/12/25 07:56:00 #26914998
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_025704_181078_0D14B0C1 
X-CRM114-Status: GOOD (  11.55  )
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

High and low values in the counter register are incremented by 1
internally unless they a zero and constant bit is supported and set.
So decrement by 1 calculated high and low PWM periods before applying.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 drivers/pwm/pwm-meson.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 8c6bf3d49753..51839936ec89 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -214,6 +214,15 @@ static int meson_pwm_calc(struct pwm_chip *chip, struct pwm_device *pwm,
 		channel->hi = duty_cnt;
 		channel->lo = cnt - duty_cnt;
 		channel->constant = false;
+
+		/*
+		 * hi and low reg values are incremented by 1 internally
+		 * unless they are zero and constant bit is set
+		 */
+		if (channel->hi)
+			channel->hi--;
+		if (channel->lo)
+			channel->lo--;
 	}

 	channel->rate = fin_freq;
@@ -342,6 +351,7 @@ static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	struct meson_pwm *meson = to_meson_pwm(chip);
 	struct meson_pwm_channel_data *channel_data;
 	unsigned long fin_freq;
+	bool const_enabled;
 	unsigned int hi, lo;
 	u32 value;

@@ -356,10 +366,16 @@ static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	else
 		state->polarity = PWM_POLARITY_NORMAL;

+	const_enabled = meson->data->has_constant &&
+		(value & channel_data->const_en_mask);
+
 	value = readl(meson->base + channel_data->reg_offset);
 	lo = FIELD_GET(PWM_LOW_MASK, value);
 	hi = FIELD_GET(PWM_HIGH_MASK, value);

+	lo += (const_enabled ? !!lo : 1);
+	hi += (const_enabled ? !!hi : 1);
+
 	state->period = meson_pwm_cnt_to_ns(fin_freq, lo + hi);
 	state->duty_cycle = meson_pwm_cnt_to_ns(fin_freq, hi);

--
2.25.1


