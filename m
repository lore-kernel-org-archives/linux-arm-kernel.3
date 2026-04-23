Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC425FDEE20
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 16:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAPFpMhF1ZEYol+etY/7Tq4z3JmtrUaJEuSJ15podCY=; b=1G1BkLr5Fulmtttv4lmFE/PSjh
	Fralpvnb/P5agOUhhAxE98f/u0+aRIL42tAH9+4yJQC+StDSAmBR/voKC4hssscdHSSZvGougZ6sM
	ucooH7zVBj8LPv+f2nqWzTYgWTFjXQshgNfoxwjdnCQ3pHYxJeKTIP7DakEON9b3Qd533gAYIJ24W
	xTDqqosQBaDCFVivNijjOzr60iBt0Oj+Nfi/yLWrPWCO9SG9zuVI0VMm99js8oe9l+/6aIJ/LdRIz
	shQyk8RNZBGSllQtsy7s5jw6yoMLTX5Q7E/zDiJ5OpqqIZXX4fsshvUkggQZOGcBZySsNGgYmEaAF
	oYFKVDEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFwbF-0000000BvZv-104Y;
	Thu, 23 Apr 2026 16:08:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFwb6-0000000BvUV-391C;
	Thu, 23 Apr 2026 16:08:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2497444539;
	Thu, 23 Apr 2026 16:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E765DC2BCB7;
	Thu, 23 Apr 2026 16:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776960491;
	bh=kmxFj256ZqyHHjW0JUrAO7Zmt5qTIX49xsO6Ct108OU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L3xMb9Y/ushFC9+3dS23UJfFvPmkTG9sQi//20kGlL2F0CCfXWC5+k1mT7WLjzsvy
	 RvlaKhLDls0BH37Cb7uJzkJf3ck68SPx9hlGp7EN3uMKqkNvMF7c1UyK614FxJf3Y2
	 cT4dMx+uiQOipcQjS+uT0jnjFP/OuuKvfKJWEZ52CM4je3AYoVOvddDLyuUDZmYWsj
	 G1R5MFRt1O95Q7jEHFB4KamBIjaNT/UCfW3nsLEzPf2nHAH/0Kh9X20bQLr8tbVcij
	 6vUlEE+g/U6DlZFUyAdgv93Te3qDuoCOakQip5uPbZD9t7DTNLd91AvkhA5afbG6kD
	 LLQMGx4EJkonw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA764F589D9;
	Thu, 23 Apr 2026 16:08:10 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 23 Apr 2026 18:07:17 +0200
Subject: [PATCH v4 2/8] firmware: meson: sm: Thermal calibration read via
 secure monitor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-add-thermal-t7-vim4-v4-2-d4c1528d5044@aliel.fr>
References: <20260423-add-thermal-t7-vim4-v4-0-d4c1528d5044@aliel.fr>
In-Reply-To: <20260423-add-thermal-t7-vim4-v4-0-d4c1528d5044@aliel.fr>
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1177;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=z46M+rsMVvol/Iu/vuO1m+rAUYrJ82iMmifq0EnDoU0=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ+Yr5wd19ruFs27aWU42aw5k55HewVi6/0sc32XtCv4O5
 WO1ZRs6SlkYxLgYZMUUWfrnWp54d/noma971FNg5rAygQxh4OIUgIlktTMyHPfQWLq7ha3QvZPl
 ZtAshjNGEyW09nUqnta2/+7sW6zmx/CHm00zOkon53rbO3H+9GSjI+ahpcZbnlbccH+13fOhwyI
 mAA==
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_090812_838288_E635DCF5 
X-CRM114-Status: UNSURE (   8.24  )
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Add SM_THERMAL_CALIB_READ to the secure monitor command enum and
introduce meson_sm_get_thermal_calib() to allow drivers to retrieve
thermal sensor calibration data through the firmware interface.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 include/linux/firmware/meson/meson_sm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index 8eaf8922ab020..3ebc2bd9a9760 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -12,6 +12,7 @@ enum {
 	SM_EFUSE_WRITE,
 	SM_EFUSE_USER_MAX,
 	SM_GET_CHIP_ID,
+	SM_THERMAL_CALIB_READ,
 	SM_A1_PWRC_SET,
 	SM_A1_PWRC_GET,
 };
@@ -27,5 +28,7 @@ int meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,
 		       unsigned int bsize, unsigned int cmd_index, u32 arg0,
 		       u32 arg1, u32 arg2, u32 arg3, u32 arg4);
 struct meson_sm_firmware *meson_sm_get(struct device_node *firmware_node);
+int meson_sm_get_thermal_calib(struct meson_sm_firmware *fw, u32 *trim_info,
+			       u32 tsensor_id);
 
 #endif /* _MESON_SM_FW_H_ */

-- 
2.49.0



