Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A3AC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 16:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/7lbrLsVGX6maQoBKXKGK0v/L55Iip7Mn2w3HMZN6Ds=; b=kuSP9cIcrTCz6A
	axVOviH4vfD4CIkbJ9TuHWdiVjS7/LMzvTEwVUHAO/6UGPEOjTxinnCF/lLTluIxJgGEuMD7VIZ4e
	pba79KdlnJc7KTwvHM4sbFHpbHx4bOusjgYtrqM6vQzRou0zBSY8SaajljtSgfi1HVbIxxKLaMiVS
	kHAEzKR8ht3f1Swo7PExjZxYQDCGggKMFv4tvuidV9a8piSf4f0EKxBV7HE7LZIUO3ylCSOS2C6gZ
	wPgDJSKdYWA8AabXt+fu0dE6GkxxbC6MCYMKw1CFcNQKppWI2+pRD6KiXWvocsYUi2gtGTYrD5ly9
	bmVDxlvOWJjBYbImIvjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfVC-0000000FYwK-3Syj;
	Fri, 21 Mar 2025 16:45:46 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfQu-0000000FY3s-1fxB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 16:41:21 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so336493766b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 09:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742575278; x=1743180078; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/7lbrLsVGX6maQoBKXKGK0v/L55Iip7Mn2w3HMZN6Ds=;
        b=Q160LKui3b0J9XTNGWLi8sCiq++YAc3xQL/kLmzdg5AIn54/tVctvWhXtlMe0/CWII
         XyVRFqK98mgGBl6vl2h6hcIINF+tL0/mzHw5oBzEHv5GEcGAKB8b+Xa2KqKM5rWRVFFM
         xzqRNqC92WXvx1bB51BvLUdSfdXB7VzNLTQ6R1652z3oO7WMdKB00hT4blzUpg/nok7V
         vCUhPMz6u86Cb72/yZE4WVR0gcViF2hpmBSiW7CjnhiTgPWDA0zWUWL9o+zd+HjXod24
         v2EcZ0R35RluSBptKYigrJgIzucs7KaqIDUYd2binvLs/d1UMi+qqxogsJj/RsXbcx7q
         yQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742575278; x=1743180078;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7lbrLsVGX6maQoBKXKGK0v/L55Iip7Mn2w3HMZN6Ds=;
        b=TQtC7/h2cE//gsg7LSX9Lh+rz+UPEBKxYQlcxL6ECqU0pW9aC2scQrFXmDaRcY4gBg
         /4Sx4vMLYDEfyoyH14IWWSFVA3+IgMZKE0n20rYsb82AwWNk1FD3KFDrZmyuFSRsLArF
         CFUVv6M3wVGgxrbM0FWq9WXF2YIhZueCpZBL3DfY625kDBQd+HVEa962dwzP7mOqUPhJ
         Bn1WKqNJU9eYG0EMf2T3RzfyKzpnV3Emw9q2MsBYHCeRSyLnQF4MxaQ5TfNFQaoSQ+uG
         EBZ6JMUw95aKGjcK7EY3HUJmT6+PgHKAb+GvCvM9YXm4X9VtNcJm8tZADSe83NGZ+erc
         Ngtw==
X-Forwarded-Encrypted: i=1; AJvYcCVX2BKzuFXTF0sBTRD4JEajP7Uf3Iyp/VsdRqp3hChDoPVRMJ7wV+6FhKrE7KVE2JtTSTWJBrQ0/CZnJzzz4pff@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8RHbLln/aRH2Ywl8Ob9j6qINdMqm79uUmQwWjLTsFuB10jMxR
	eedAOZZf9M3BrGRXmZBHD5XD4pJ5VRYrLpcWHB4iaioO9sNt1H1kq/GsGFyaMu0=
X-Gm-Gg: ASbGnctKpqNPmdYFypZPNwN5/kv49WaqPUiyGe3YH0sHCmE+ohjrlP9JaN02B/N6R/u
	hk1XD/ZjsAn31Bg6D1Pilo5f6D15GHn5PkYd4vyBKNIKtv6NyxENjuXDtGsF8pQ94aS/FbcDziz
	9fbZr87Y915kR0jpV1V4Zp1vpELl6OqQcO3+3l5bNA3d+CGwv3L26qBgd1GIW1YdMD3foS1Ahd9
	uUFM/acD02Zout2SM0KhOIzPCjGKphtEoK0Az4PObJ5W0hlN/RzhCkg6vrZBZqF50wNKmykzW5+
	p5AVJiR5shQHhQLvv4g+doM+z2VbI/+MWX8R4CHfXJXFRp1/HdqY3UPvMPwFvt9TIs/ErTsXmzq
	ZdX79d3Hu7HB1o8T+KYam+MTAQms4
X-Google-Smtp-Source: AGHT+IHh8NWOl362k+c3d40t/J+WkLnIig/7cGdwwswOV+7z2+Wk0kA3DxuBF3HLDuyvLxlH3NNKMw==
X-Received: by 2002:a17:907:ec0d:b0:ac2:972c:f732 with SMTP id a640c23a62f3a-ac3f22b13eemr457901366b.33.1742575277903;
        Fri, 21 Mar 2025 09:41:17 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efbdc78esm184015666b.134.2025.03.21.09.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 09:41:17 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/2] firmware: exynos-acpm: allow use during system
 shutdown
Date: Fri, 21 Mar 2025 16:40:56 +0000
Message-Id: <20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJiW3WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyND3cTkglzdxJL83MxkXQNjY3Nz0yQDU8PUNCWgjoKi1LTMCrBp0bG
 1tQAfgEpcXQAAAA==
X-Change-ID: 20250321-acpm-atomic-033775b051ef
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_094120_434997_45D7C777 
X-CRM114-Status: UNSURE (   8.91  )
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

One user of this ACPM driver is a PMIC driver that needs to communicate
with the PMIC during late system shutdown and at that time we are not
allowed to sleep anymore.

This series address this by switching the code to using udelay() in the
specific case of system shutdown. This approach was inspired by I2C's
i2c_in_atomic_xfer_mode(), which has to deal with a similar corner
case.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (2):
      firmware: exynos-acpm: use ktime APIs for timeout detection
      firmware: exynos-acpm: allow use during system shutdown

 drivers/firmware/samsung/exynos-acpm.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)
---
base-commit: c4d4884b67802c41fd67399747165d65c770621a
change-id: 20250321-acpm-atomic-033775b051ef

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


