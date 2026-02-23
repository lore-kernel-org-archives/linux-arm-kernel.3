Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD98EA4FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 14:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZXG84vOT5vo62fVrV4g27oZ8qKjWT76ti4NF1pkRLs=; b=cIp+bq9BZLynjevksELQXtbDTZ
	Tj2o5zorqxvSZuDREJV+3amnXQaRYQkEts02l7PJ0VevHNKfdtIi7AJE1XsIm8LfQEE2DMEVfUBCc
	9xnq0tBkvHCp6S2PtyUmgeybYd10nSClXhuIz2WcVggYo2wiNA2/3CsGaHIKErye97u/iZZJZAn7A
	5D74acImeGDyFnBzVNxdWjOkXmrwYQjezBSUYxzjctLlt6yWCnQ06j3DSonbKq/cYc8fVFS3rE8N9
	yULbyzSZ4+7wsu6isWM0VpJG/6KzqxzJAc0R2AeMaQfJ9hb7DEalpMaPkFrLAbzKMZ25dUSFqbsrC
	RthDJBRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuX0W-00000000TWX-3FAE;
	Mon, 23 Feb 2026 14:33:56 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuX0Q-00000000TT6-3hjb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 14:33:52 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-59e614b3dbcso4357944e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771857229; x=1772462029; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZXG84vOT5vo62fVrV4g27oZ8qKjWT76ti4NF1pkRLs=;
        b=ByPsmhYC2TvQ86egSo+5nuN0QoYjlTCQQHSsCSt2Miy9+YCQx+f1lcyKAVuNsjkSHA
         Usas1vlXU9G/925XD8stxtxHFH1d4D5K7/6wC1D2Sj4Hj89h3/PmBHpjipA3GiSXaNFt
         EEIaBaf6pKOyfgySIFIQK+SQFi3HXtPQoJO42MtoBU5L1PdbYvQ0D1jAZQedbfY6tA4/
         2vR4YVj0QQQvgkGbjPEiztot2XsHFpeqCEYL7mIT+HEa86VSdolb0fvRsl+F1gH8cFRo
         PZ14qQXJkJLfDUXWslaHmG/c/RZkrEE/j4lQnipGF/iX2C7D7bvwOVYnULvOmkABRmxn
         yeng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771857229; x=1772462029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ZXG84vOT5vo62fVrV4g27oZ8qKjWT76ti4NF1pkRLs=;
        b=XxZuXkV0J5Or2TB+6dgWyVlkcviCEPlQEFw357r/phs7MbYnMBaHU/+sOJWPFJiDLa
         THYwNO2+HtR2k0xuwbgX7tDSrP12r0am4QtWBe7O6u6eMAPpzMFF53GpTE25B6xnYTSe
         URtmpOsnug9d2Lc8hLdU6zNxsWeFT4K25aLDGfg3/YnzpyXPADAbEU45wPvbyUHHDNPe
         EI/Mg3pNxTwvceluzkcNcKhrkmdEmCpTfNMUJFKrPMUzOYaL8LHsUrK6aWU8U3YlShki
         7+tWGk3bM6BAc07ryJDSgM/R/Yxr0LGuU7NKb/QHldHodHIIgcM+AgXzNsb1UtTp174V
         VA1g==
X-Forwarded-Encrypted: i=1; AJvYcCVFIPylboGY/TJzPBrAq075vuYUGk2QJCdHscbH90XQLG1vf+tnnQit6oOqcl7hNY/pZMKUjgU/hKp1b20NY+Qp@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1zThedOsWXmdhfw0UAylU+0hmq4G6Wo4w7rHPT7XM8/J59Ni8
	rI5tGmL7JuYzR5hWKmv1XsVVGnEyO2BtG52EB4TPb6vF+ikDMLYUHySN
X-Gm-Gg: AZuq6aLeZZ3CiZGJ6ot4OIdpJx6UMdlUk3ZfVwvoYBMIA1iXPHafanbqMudmuMD3ncd
	I5VvY/yL6qG8T3FN51/aq1WhvJZd7t8YHfXXVA8lL5eHSU9b/YVdkFpVnm3hXlVdHzXt/ALIAJ8
	cK1Hgxo8nOLdMEydjSjNyxD9v22SfFOxVcYYIcrRx6TYKOLpfpnxp8+Vc2dHKtgLDGfQbq0oyhT
	PmnMzvKhy+E7XGW+/li4kZWC4VH3xyc5/s0/w67CSYj6ciV+DJ5ZJnjPDWaf3hW0HP+ZL7vTt+L
	+DFI6I7I63vXEfyKlwsXmAEby/2DBSl453o2Z/5UEEUmKjwO6s6sq30rUDrnM/mrN0jutRSWKc9
	oCs7cmeoq87S4M+Khbqdg2/13XUCM6TDPvt2odwq0/Yt/qIuTxxAEC9tQCk6KTv9XtYAU4I+qPe
	vIQv+vpaJVJxygp7SJSqumwSou4SoyxmuJo9FgMgng6wc6y15gLv8HXRdpyfHn6fUei6zn
X-Received: by 2002:a05:6512:3091:b0:59f:6c3b:6d3c with SMTP id 2adb3069b0e04-5a0ed8a0556mr2804029e87.29.1771857228506;
        Mon, 23 Feb 2026 06:33:48 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb16344sm1631709e87.37.2026.02.23.06.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:33:47 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 23 Feb 2026 15:33:50 +0100
Subject: [PATCH v7 1/5] i2c: core: add callback to change bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-mux-v7-1-ec75b214718a@gmail.com>
References: <20260223-i2c-mux-v7-0-ec75b214718a@gmail.com>
In-Reply-To: <20260223-i2c-mux-v7-0-ec75b214718a@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2473;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=koxBCehUmN3RuwVhQnNS8zqbXgiVP6LXVx/A/SkLKJU=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpnGVU3pImY+NWazZLlexByac0kY/hMMlKtqzJv
 e9xVfT04j6JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaZxlVAAKCRCIgE5vWV1S
 MhosD/0XnbcAzCIPj1635aCrdLCtY5TJLNP8ObSXOAaHcIKi3jRWMFcPXPmuEYnvcHxyZrQtThM
 gVckS2NTcVX+3Cj0fblydVNv70lOKxRPlYjnXNkjXF7N27AvOb2A5eY5URJ2bYNOMLFftfWOhkE
 QREkYMV5eSG/PJuTDkdgg87uy3FjuLlYxzrYTAzr5Dkzlfq9QM+2gYNrcNMzIbcEwpGAIDHAgcW
 STCAV325YoV0LVvczNkH+4MwSnjM5GBIPHvry/wFKppUwjsWphoPWYMXBIYWn3AW2pmuI4n5gbI
 NQmoRzcphKsMKFTmtF68krmuqEqO6BagZKhsG7BmEXLPIQQRuNvpd8/IKGuFTH98zLkYULRIBhx
 SrvfgNqKRrqtEtI+FjstCJxw7knWC3jIF9kSYNKyjgLbXIXqZkIf3capDa2uZTgzkKSRxrZWdkB
 s05Qxa65bq1RyNzVEkFL5tpbOwXLprRFJ7+lLL+/JoNhMkXihwy+rBeQjABrHIttue9u7jnI7Bz
 cILhNd+Il6GTNL5czhX3PbBI4VMt9U7yCUylUgTLJMrWOWeb6nfYrpuMoB+KEOFoHSZ2VXIdGyD
 bilSw+JZ0VvDLxOK+SazGOYHERiYfMwtpJWM5znhM7XJlvIRNMYePCr5cvCwLbdTN9UfqWYaLir
 AMnPiXBBEk5N6Sw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_063350_958889_AF1DB63F 
X-CRM114-Status: GOOD (  16.61  )
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

As a side effect, several bus drivers keep the bus speed in a
private structure and can now have this value stored in a uniform way
instead.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 include/linux/i2c.h | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c..f81decb3f1f7 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -742,6 +742,8 @@ struct i2c_adapter {
 	struct rt_mutex mux_lock;
 
 	int timeout;			/* in jiffies */
+	u32 clock_hz;			/* bus clock speed */
+	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_hz); /* Optional */
 	int retries;
 	struct device dev;		/* the adapter device */
 	unsigned long locked_flags;	/* owned by the I2C core */
@@ -835,6 +837,38 @@ i2c_unlock_bus(struct i2c_adapter *adapter, unsigned int flags)
 	adapter->lock_ops->unlock_bus(adapter, flags);
 }
 
+static inline int
+__i2c_adapter_set_clk_freq(struct i2c_adapter *adapter, u32 clock_hz)
+{
+	if (adapter->set_clk_freq)
+		return adapter->set_clk_freq(adapter, clock_hz);
+
+	/*
+	 * If the adapter is a root adapter without set_clk_freq implemented, this feature is not
+	 * supported
+	 */
+	if (!i2c_parent_is_i2c_adapter(adapter))
+		return -EOPNOTSUPP;
+
+	/* Update the clock_hz for non-root adapters, even if set_clk_freq is not implemented,
+	 * to allow * the clock frequency to be propagated to root adapters that do support it.
+	 */
+	adapter->clock_hz = clock_hz;
+	return 0;
+}
+
+static inline int
+i2c_adapter_set_clk_freq(struct i2c_adapter *adapter, u32 clock_hz)
+{
+	int ret;
+
+	i2c_lock_bus(adapter, I2C_LOCK_SEGMENT);
+	ret = __i2c_adapter_set_clk_freq(adapter, clock_hz);
+	i2c_unlock_bus(adapter, I2C_LOCK_SEGMENT);
+
+	return ret;
+}
+
 /**
  * i2c_mark_adapter_suspended - Report suspended state of the adapter to the core
  * @adap: Adapter to mark as suspended

-- 
2.52.0


