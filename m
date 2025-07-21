Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399AFC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 14:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DLCx+sqKyQ6H6n1t1Iho4DguHkaJ1c+mG90AYPKk4U0=; b=iREGsbGcNUJ46wezDKLpx7nZ88
	c2H1WYZ6nzukmuYHLmzE/pEoAziEn+tKg8GS4/2UwJ0gY34sIQsPYbczTSOo3XWSF1SNVVTgbCxM8
	g7qBw8CK4qngaROYuJbkexN00v85Rwlu+Ds7AAu6rVhKvUWmO61I4E2FBjk8yduASk2yMNUBLdUU5
	ObHGzbP605WPPgJe6rqMx16I2MxFeOwMDcpgKvBMGvXPM78uji+y/MIAclZA5CSv+zhJMy13XE5tV
	iKKSFgOU1vQlYz1aL2KlQTOxnDw7/hQR3xHF3MTBHGPrrfebgZqHM3JXxSfc6WduPjJa8znIVsFhr
	7E9SwOaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrSO-0000000HWBN-006Z;
	Mon, 21 Jul 2025 14:25:32 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqEy-0000000HLPZ-1ihB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 13:07:37 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so24151175e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 06:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753103254; x=1753708054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DLCx+sqKyQ6H6n1t1Iho4DguHkaJ1c+mG90AYPKk4U0=;
        b=k68jPQPUoWTk9FI5jBKjy7AjfMK/VfUPShASXB5/0RSb8KaEQYghJMioDwwwQjT+aJ
         /a/OYlnDnN/5KXpiZGR/XAlus8vE0xZhVApxCTU3EmxQq2ez3YlTE8SgMWrS+rekY8f9
         qcg1SzaH6eogjN+ih4kKHroFuOSgBJShe4oOGuviu8lSd27Ha1W3U/veSanWUYHXZEkw
         exoTJ3v/YvDzrLrvkKWQspCIjaxjP9fE5CLhwR0RUEUgPfHK/QHBBOL3l90VN3GMN6o6
         2DrprLd1m0nMWck/0dQbyxHNRfbxXuyTx5/X84Vq2hE/COVVmuvmWlCjGCXpAF8HHTg8
         F2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753103254; x=1753708054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLCx+sqKyQ6H6n1t1Iho4DguHkaJ1c+mG90AYPKk4U0=;
        b=DfyKCL/E+p2UNRjCd7LlmbXg4zZ0QEFQIMlff7FXu1S1dDhBb3H//6RY0TkKCkN+84
         SI6kpc6WL6g/fo0wCDv5GpJvOXtXMJVSfn5DBfaOd6g4LtB6IP8zGsPeIocaZoDYKNHL
         NkTVjXS/ki/i/VJEbknbLq2sFttUqf9qW2i2K18ILQHzUNuOspdO+/HKhWpRzP8MKpaV
         NS3I75Ol9wTuk0QhI3cXQecK839p7b75f2bhIR9j1LaXEU8OAf0Y0ZPuz/guDTlVC/jm
         98+r9HCzhzI2Yw7Uj4OUx9XzTyVasgU8LNIeCe/nWrmRzukL0sJRRd64UnVnrm9l5kww
         VVWw==
X-Forwarded-Encrypted: i=1; AJvYcCV1gq4eEjHO1DHHoBPKmYGXoDx0MBR6TvfelEeKgv61DxIPCnQQYIPD2j90rjzMrOKn9sqgLJ0SEjaRa5JbQHap@lists.infradead.org
X-Gm-Message-State: AOJu0YxcMoYg7xUjXkHHxVPZAKNI4TE0wX7mwMGbWbJIMTDhUBzbpKQv
	2gklujXIrIm0j47JeYpWD84H/E5rc64GzVAgePXynoflT3GjBoWLZhaF
X-Gm-Gg: ASbGncsQAkD5NCUz70H0R/QkyQBO0ToDnEP0cGx3YqQS/N8uc+P3YBvjoQJNuqBCq/z
	brd5dSMSEZes0hR9zpcyi9ecTkrmNb2CeJ3j14MK+hnwG+qFTgxVcnFK12L2b6xpuUbsbLDdT6c
	dHr2dJpHpznDw712savML9AqRIHaZDzULCsDSzZHT52LNAb3iLFWt+B23Arih5jyjsL1edg1Mso
	RiuLoqV4iJWXDRsfgbTNh632r5VVUAxp2Kl8Wn5Bn9m45BL6HaTD1R0zS1pntVDSziJejBV+Wsk
	W+DzpN9Mt7erRfzFt0HWQjMFe+eq9qFmIZBYWD/+f6Rd1xvNGgAQRnfulI7gjRZBpS5r2fNNk6v
	XX7AABeAe3F7KZpHmnRlo/lpyIYSYY6d8j/t+5+9YgwUxFK0qyCV0hamzm0lOspc3iGQYIH9hhQ
	==
X-Google-Smtp-Source: AGHT+IHmDCTmiGnsqtX1YVYWRcIXEER5wbunM4O6C5Aoi5lFM6U8OAVQsEhiHj1NA9lOUgYhy7795g==
X-Received: by 2002:a05:600c:4f42:b0:456:eab:6344 with SMTP id 5b1f17b1804b1-456352f8f1emr129426955e9.15.1753103254113;
        Mon, 21 Jul 2025 06:07:34 -0700 (PDT)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.2.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f2bb4sm157681365e9.8.2025.07.21.06.07.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Jul 2025 06:07:33 -0700 (PDT)
From: Jack Thomson <jackabt.amazon@gmail.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@arm.com,
	arnd@arndb.de,
	wei.liu@kernel.org,
	romank@linux.microsoft.com,
	mhklinux@outlook.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	kvmarm@lists.linux.dev
Cc: roypat@amazon.com,
	Jack Thomson <jackabt@amazon.com>
Subject: [PATCH] arm64: kvm, smccc: Fix vendor uuid
Date: Mon, 21 Jul 2025 14:05:58 +0100
Message-ID: <20250721130558.50823-1-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_060736_468894_A693B731 
X-CRM114-Status: GOOD (  14.21  )
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

From: Jack Thomson <jackabt@amazon.com>

Commit 13423063c7cb ("arm64: kvm, smccc: Introduce and use API for
getting hypervisor UUID") replaced the explicit register constants
with the UUID_INIT macro. However, there is an endian issue, meaning
the UUID generated and used in the handshake didn't match UUID prior to
the commit.

The change in UUID causes the SMCCC vendor handshake to fail with older
guest kernels, meaning devices such as PTP were not available in the
guest.

This patch updates the parameters to the macro to generate a UUID which
matches the previous value, and re-establish backwards compatibility
with older guest kernels.

Fixes: 13423063c7cb ("arm64: kvm, smccc: Introduce and use API for getting hypervisor UUID")
getting hypervisor UUID")
Signed-off-by: Jack Thomson <jackabt@amazon.com>
---
 include/linux/arm-smccc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 784ebe4607a4..50b47eba7d01 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -113,7 +113,7 @@
 
 /* KVM UID value: 28b46fb6-2ec5-11e9-a9ca-4b564d003a74 */
 #define ARM_SMCCC_VENDOR_HYP_UID_KVM UUID_INIT(\
-	0xb66fb428, 0xc52e, 0xe911, \
+	0x28b46fb6, 0x2ec5, 0x11e9, \
 	0xa9, 0xca, 0x4b, 0x56, \
 	0x4d, 0x00, 0x3a, 0x74)
 

base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41
-- 
2.43.0


