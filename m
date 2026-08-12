Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C91C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j6KCWAWmNrNpuSpnjsk1FRXfCkiyuhf2PnlqvNrU/3A=; b=3kfeeYAIn2Mi+MkZN6yEMJBqOK
	SjSRobZ7CKPnAH4f0woII+NXMgZLLWl4H61311PDAu6cMKVV2vVTRGdZ1Kvuj0m9jF4IPimpIkL7z
	WUCV3IC7gQfDsXoNwyvoypsap42ObQ9dU0UsI+EXRVldkOW3tzULYbaJu40X2MdxDD5jnObtEjbli
	n/D2aQpXjc1w76bfBx65OyALhMA6+czcrkvB7Qj3DH1BkL4vhW9FVZKNHsgVyiX9hhJdNK/CkRO6n
	9Mg5PP3KpASMufXFJcd1pmjPwHM8IHHP2KTSzThm4BL3XzouG1tSnu9WfYTt8OMXLkG4gMZO2bELI
	ll4h65ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu628-0000000Frt1-3HeV;
	Wed, 12 Aug 2026 10:18:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu625-0000000Frsf-3E04;
	Wed, 12 Aug 2026 10:18:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B82260A85;
	Wed, 12 Aug 2026 10:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BABD0C2BCB9;
	Wed, 12 Aug 2026 10:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786529880;
	bh=GmTbEPvkwJ5IHvxjuWI1y3VvjQ4yhh+Rh8rB8hiuHpE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=olH0SctUXdGKKkRp2o2Th9FpB9truE+eq8BkspfuknysL0rYrT4BFRDxYu/nwXryS
	 gi7y4nBapblXc4zHQGxzCY+tonmIDfaRUNbQP1Sk5gPquoumHmeqRuMmwjlM1ZpFOC
	 ZCUKy9heCHEgWj06gQOrKbOEnx1WJNLPwm6uFtgQYD5B+eK1Xvd+TrSFzG9jpb6tEA
	 eS27rBxO5bQ627g4Pz95wwaRVSvRc9JU8mH8CSQ+xSxB2AuUhhNIJTFtQh6VPIoYZd
	 jGG4sunfBbBxV/hmgjXt7WZHbO6rOhEq6dhi+HyFgISTcmcVczdAXYPl+0xNl+Uv9J
	 fGwx7Kahb+l7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F62C5CFDB;
	Wed, 12 Aug 2026 10:18:00 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 12 Aug 2026 10:17:44 +0000
Subject: [PATCH] pinctrl: meson: a4: Add input enable pin configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-input-enable-v1-1-81e5ca7772aa@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAEdIfGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Mj3cy8gtIS3dS8xKScVF1TQ0MzsyQTExMzS3MloJaCotS0zAqwcdG
 xtbUAY0ASUl4AAAA=
X-Change-ID: 20260812-input-enable-51166b444697
To: Linus Walleij <linusw@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786529877; l=2149;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=9SbIm6+8Ee1Yqah/Xj7ZLaezrMlBamtDl5jNdbzcGzc=;
 b=D7w+Kf1zPLXNaLWHPsaixnfXbBtvYYqUK5MBvXWe+kNz9Ckdy07+uAigRFK3asjPqxVVkefBm
 5oLbnS5j6n3Dfqk58YoCnHFz1xdZi88f7ZaNnuFs2Qg2iOAGA2c/0XX
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add support for PIN_CONFIG_INPUT_ENABLE in the Amlogic A4 pinctrl
driver.

Use the existing output enable control to configure the input enable
state, since the hardware uses the same control with inverse semantics.

Also update PIN_CONFIG_OUTPUT_ENABLE handling to return the actual
output enable state instead of treating any non-zero value as enabled.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 420f7915c010..39eb8cc7fc0d 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -469,9 +469,15 @@ static int aml_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
 		break;
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		ret = aml_pinconf_get_output(info, pin);
-		if (ret <= 0)
+		if (ret < 0)
+			return -EINVAL;
+		arg = ret;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		ret = aml_pinconf_get_output(info, pin);
+		if (ret < 0)
 			return -EINVAL;
-		arg = 1;
+		arg = !ret;
 		break;
 	case PIN_CONFIG_LEVEL:
 		ret = aml_pinconf_get_output(info, pin);
@@ -619,6 +625,7 @@ static int aml_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 		switch (param) {
 		case PIN_CONFIG_DRIVE_STRENGTH_UA:
 		case PIN_CONFIG_OUTPUT_ENABLE:
+		case PIN_CONFIG_INPUT_ENABLE:
 		case PIN_CONFIG_LEVEL:
 			arg = pinconf_to_config_argument(configs[i]);
 			break;
@@ -643,6 +650,9 @@ static int aml_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 		case PIN_CONFIG_OUTPUT_ENABLE:
 			ret = aml_pinconf_set_output(info, pin, arg);
 			break;
+		case PIN_CONFIG_INPUT_ENABLE:
+			ret = aml_pinconf_set_output(info, pin, !arg);
+			break;
 		case PIN_CONFIG_LEVEL:
 			ret = aml_pinconf_set_output_drive(info, pin, arg);
 			break;

---
base-commit: 761af93c9f1a100b8d9f71aa744b8f9abbbbbfb2
change-id: 20260812-input-enable-51166b444697

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



