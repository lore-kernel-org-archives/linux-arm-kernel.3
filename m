Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459A4D35699
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LgqAxD6UfwmKx5Fd0jcW4Pat4uqGsb1EaPQx1jaWDA=; b=VuKNQFi7UrobVMjwSzXVsaeGZe
	UFdq7g9s/bYJorXs3BFfy30+VocR10qKQB6Y/QP9FWaBifjRPOZ8EL2PwTtGg45JtXIxWi5dDWkhC
	rov/vlVkrBP/FgbfdlwCWiRAJLVZL/0f6ZioDQBXkqK4M/0H88zq0/AqHlbdarY8WZgTKchGP1QDX
	UA8j9HKNn5VwrRq9AqwweXKfq66iUqpQkrq/Eyk5NlHBNPOC1LTOCdFowN7DzQYJWKiDD0LjNWAJA
	FWxGlapzwUvqbayl3g8zd0aI14uCMQM28dyd5eJdqjXC/JL7eh3o++no8RFRbFYwKrfHecKOBDuzO
	g4zrqcGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2GY-0000000Fmiy-339h;
	Wed, 28 Jan 2026 09:55:14 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2GR-0000000FmeM-405K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 09:55:09 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59b6d5bd575so6806388e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 01:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769594106; x=1770198906; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LgqAxD6UfwmKx5Fd0jcW4Pat4uqGsb1EaPQx1jaWDA=;
        b=TqoughU12HHOQ5cuqK2delM9L750z3drA12S35XyJFepHdYDbmOqmdemLr7RezBvYt
         rvu5Yr34/SxOYkwJYvC6WhJ9aeUUAzo3JMCBO0BjYWQ9XzcnTlfFR5xb3zAq2XkPWtaP
         iYcP602+3SfEasRTTZYREtTfmJ0X/TdCcpbhYjv0uiAnoczU1Gp/UTJsjImp4PU1QHFW
         KIzSIxyHQyIooPU/3PAIQ+yYxL6VZ/1r2fQb8haAh+OqJCusF88P5yk6UzxoBeeY19xA
         Xqc5JXA3ggh1wkYb1t/ovb2WzTsuJZt8EYU1TkSu18sgUum161CithewXfiltI2gkl7C
         wcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594106; x=1770198906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7LgqAxD6UfwmKx5Fd0jcW4Pat4uqGsb1EaPQx1jaWDA=;
        b=FR/MUhxe+k/u2rP/yxy9j+iA77GMqxruAj/H1g630GCyxIRq5nroip56uTTbgGWG+W
         uy3i6e0P4YRWNv7gBNc3WqWXOUsJzEsovubBOlWBvCoHKMe8I3U1VOpC5uh/G5bS1Spc
         cPO+2fHmlqcaFuHFpaAEYXGCidCm54BJvOVVZ8xE2VhpRlz2UgXkHWUukBwOZE92drRC
         Mc1W5nHvCgaqHMvmAk39axE+VNbwHMcLRFHr3u7HQiJZtUPactp0+QW2fVO62xP5ILTo
         +QDBgQTBS9FiepmTnGP9Kjqta3kca47a5kAwk6+aS5Jz7/Q3Y+wOjPRnneXP03dGRAe2
         wkOA==
X-Forwarded-Encrypted: i=1; AJvYcCW9nsLLLjJgL3JmJFsqmN74oearIN2p54foo6x+kHoSP1G/pFwfmKmYK5vM9733bINorbfIqCthnYXKfFBHVVrU@lists.infradead.org
X-Gm-Message-State: AOJu0YwL1eQjbVHcs2bWA3DT0rzXxD9eJ6K2XeMt/y7ZsUs+1OSLFUdY
	3Ap1XjavlBKWXbwI36/9vzRBAmJpy7BFVUlPAcUE9A8ED1rz34+VwM4y
X-Gm-Gg: AZuq6aLVfv30oAHc/l4ghzBXbdYeTB7pUxUiexoghIy3HyvNT96/RsRRqfDBg4Mx7kD
	y1mlOYzhumeRIH0CdpbTBmV96aA8905sUGng9TXBPr7KkzSEamHK69nKeI+F5E9HiX3p6Vkst3n
	qb3yfES+BsqnmR/ov7nzuW9UAF5J/JFqayfuQ8OiJ5u0zn7mpyfsSQ+vyMpHFvCgBJWnq/oOWJZ
	SdgN/0MUxzTvLb6kQFYEq39SrWx6IMyE1LS+9aYWiH59ePqmcXDhMXNuJG2mFr5JeF+8ppJFnEn
	VmAyVSjg1r0R35gUhOlKa8UMv33GXoPOP0dYxw8puYYN1eo9a6bAOHHoDHk7u3QUBNX1N9kNbys
	o22OgycEw1/G+rDeGw7HtbBrOt65LE2y6CdkrneuVY+JrPd+5vrS9ljBPiX3PnmqcHYziJuA3ph
	tZPw0Zs+DjbkY/bzDXOnpsUrN3NLLWZB+UhQRPxK1nAzdVPAQRmUnSHM7t
X-Received: by 2002:a05:6512:b28:b0:59e:92e:7d07 with SMTP id 2adb3069b0e04-59e092e7dd9mr612809e87.24.1769594105281;
        Wed, 28 Jan 2026 01:55:05 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bfe83sm459483e87.97.2026.01.28.01.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:55:04 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 28 Jan 2026 10:54:27 +0100
Subject: [PATCH v4 1/5] i2c: core: add callback to change bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-i2c-mux-v4-1-dee49ce276c0@gmail.com>
References: <20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com>
In-Reply-To: <20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=eRPT6fwWSu39UFp184/6KNALMdSEu1tiZOm0jan9AEk=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpedzehXVLc5la3fttcAt9Pf63CW8xGjrpt9Gtl
 m5Jrx2wvzCJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaXnc3gAKCRCIgE5vWV1S
 MkRqEADXrxdBsBlenpKcAm45b1vgUJl5qzd/GhpRErNbr50L14Aj7bdwJ2ihLfpLoh60Qft2yBy
 NNAl7O56qyFBmGeWfyLSQehsIh775Ud4kJ7icMlu3t8clHbjFtCrnlygOiTL6HjIHg8pQiivtRl
 GYv6hW7pFiU2cmCQ7c9PEx5J7o3WM3f3R/HWi+VS1WP7+0WGVjEV+7mnQjOFAAfpl1vtf0UfqLn
 JFXWQ9WvO1sTUUAMtAklTsoztuIL6csWXW/4KJlJV3TwmylgA+4Hojjfm7mDMrjC8VZ3e806uLk
 eG1iPk9kvJuKpkWng6bVCPmlCcocTgEtgDLe5HkAV+MUaBFldysjcJiooWse/4mvGui2ZuhfNoe
 9hsXpZqX4pxg7vHNsF+7IjgixG5VlAyB+kufL3Ul0X5m8Xh+XrMx69S0041/Eon1ROMHxWZEqBQ
 7VeysczxzbQRPSrAPv0bUHW1Aq4z9xLC2KxAzzto6P1IAdLgliqaB7W47k+dYFSEzRVlBx/RgGe
 rzPrux72Ged1sYyIBsVr8oo/WV5bKbfg69dk0jGBjUs7y7mxh87UrBeZwFgYtT4r3+xGb42CtYw
 702+BI6VraEFM4CivtIYhY1Eaay41GgmI5F/gTmMF5XX5FwzWJwTyAk1SI62UyoRViH1Uf/KiTE
 X4kYiUc2CpYCVHQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_015508_028705_86AB10C8 
X-CRM114-Status: GOOD (  14.48  )
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

All devices on the same I2C bus share the same clock line and the bus
frequency has therefor be chosen so that all attached devices are able
to tolarate that clock rate. IOW, the bus speed must be set for the
slowest attached device.

With I2C multiplexers/switches on the other hand, it would be possible
to have different "domains" that runs with different speeds.

Prepare for such a feature by provide an optional callback function to
change bus frequency.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 include/linux/i2c.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c..d147e388dbab 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -742,6 +742,8 @@ struct i2c_adapter {
 	struct rt_mutex mux_lock;
 
 	int timeout;			/* in jiffies */
+	int clock_hz;
+	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_hz); /* Optional */
 	int retries;
 	struct device dev;		/* the adapter device */
 	unsigned long locked_flags;	/* owned by the I2C core */
@@ -835,6 +837,17 @@ i2c_unlock_bus(struct i2c_adapter *adapter, unsigned int flags)
 	adapter->lock_ops->unlock_bus(adapter, flags);
 }
 
+static inline int
+i2c_adapter_set_clk_freq(struct i2c_adapter *adapter, u32 clock_hz)
+{
+	int ret = -EOPNOTSUPP;
+
+	if (adapter->set_clk_freq)
+		ret = adapter->set_clk_freq(adapter, clock_hz);
+
+	return ret;
+}
+
 /**
  * i2c_mark_adapter_suspended - Report suspended state of the adapter to the core
  * @adap: Adapter to mark as suspended

-- 
2.52.0


