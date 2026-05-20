Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048ACCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 14:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=om+KGVXb1v83gsKZbVoHyS3YW/veq0SaXYYsGEnL8tE=; b=mfEfsrRdKbTaUYd2KIWiOTsas4
	DNsROj6OGxwt9ut9fT0K/WtNE3DWtxYCoIJ112M82j2kTtrKy30NSBK9jtwlWIcO6dulwdoxGfYsT
	hINuFIxtrPUWiyPu3O25wX353OgcFkit85i30cVPgC3XO9fNr/fFcpmfFDLwzOwrk0JDJoKe0tuQo
	8aVy1MtO1FO+7+aMX32kU8k7Qyi8CwgA11/Lz+hVbDnJoJrprvo8cqgrY2MwcSVjGolBg7Jx95GF9
	DkUOdINwoPt225sWwhJnYZrKhgvIMeRNx4azGkO+Gd24IWtBLGBDqFfC5geoF4/JUHgJVEiFbQ/wl
	xVe/4/kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhu0-00000004oCz-10gx;
	Wed, 20 May 2026 14:28:04 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhty-00000004oB2-16qq;
	Wed, 20 May 2026 14:28:03 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779287279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=om+KGVXb1v83gsKZbVoHyS3YW/veq0SaXYYsGEnL8tE=;
	b=Ww8hfLdg1WrnrWSZ0GSDdRKcsGO0FjkmzA68x8417AphntwNQ95/Ic0A7e7BD28qxOUQ7u
	USNfyHSDD18+2C2YhkUefphFm2qV3ctOessGUK3SaBgrt+rFWCEQXs0ZHzf2bBjDQkD9YG
	Tba4lZLBg7J6DpXACIT+3RLGn+CEIsYtHoYdVZDEr8tu4qYZbbbzFlvclluZWVH7P1bPDL
	66wNjrreKbmlxcKcmvKBiUPZQoy7ireSpkmzmzqyw6zwn8Pctabkp9FnpGkmnTs0VjyM7s
	q5mytU5tsXNaphP5Noegyt1ELHiPdVTmK/ldR9zZjf1vVpe9maDZO2RPSIAOWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779287279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=om+KGVXb1v83gsKZbVoHyS3YW/veq0SaXYYsGEnL8tE=;
	b=p6DVFKliYYsgAURxBpaRYT7Hk5ua4GDGSRDqPXhpWcVsyOM9qh4PYu0ulWL2k8CsUp/hrv
	a23MVIQltojjbCAg==
Date: Wed, 20 May 2026 16:27:54 +0200
Subject: [PATCH v5 2/8] nvmem: core: Enforce stride and alignment checks
 for nvmem_device functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-rpi-otp-driver-v5-2-b26e5908eeac@linutronix.de>
References: <20260520-rpi-otp-driver-v5-0-b26e5908eeac@linutronix.de>
In-Reply-To: <20260520-rpi-otp-driver-v5-0-b26e5908eeac@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779287277; l=1341;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=1lpYj5pFLwL7UBmIPyOk1IxVfJCvdzB+umU9I4v0Q0I=;
 b=sTbqCOrVZ0mMIXlIVQA+XvK13l3B8jyW2pPgQhTSJCm8e9jmGMtZl7stobEtbbPVN1Qw9PhdU
 fK6ydnW4bwvDm+bUkWqPoZ+Em/CHqTufAuxDmzVvqPGS4pFT1qDpaHv
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_072802_451747_9B0024AE 
X-CRM114-Status: UNSURE (   8.73  )
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

The stride and word_size attributes in the nvmem_config struct are
currently only used when reading/writing through sysfs functions
bin_attr_nvmem_read/bin_attr_nvmem_write and in the nvmem_cell api.
Reads and writes with nvmem_device_write/nvmem_device_read still allow
unaligned access.

Add a check to these functions to enforce word_size and stride_length
aligned reads and writes.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 drivers/nvmem/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 311cb2e5a5c02..6b313f63d07ef 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -2068,6 +2068,12 @@ int nvmem_device_read(struct nvmem_device *nvmem,
 	if (!nvmem)
 		return -EINVAL;
 
+	if (!IS_ALIGNED(offset, nvmem->stride))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(bytes, nvmem->word_size))
+		return -EINVAL;
+
 	rc = nvmem_reg_read(nvmem, offset, buf, bytes);
 
 	if (rc)
@@ -2096,6 +2102,12 @@ int nvmem_device_write(struct nvmem_device *nvmem,
 	if (!nvmem)
 		return -EINVAL;
 
+	if (!IS_ALIGNED(offset, nvmem->stride))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(bytes, nvmem->word_size))
+		return -EINVAL;
+
 	rc = nvmem_reg_write(nvmem, offset, buf, bytes);
 
 	if (rc)

-- 
2.47.3


