Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF6CCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 07:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFWIsHcR+hD5XAKLrrYCj9xMsNWxUYwTXzF4H7urqUQ=; b=yR1g7pOwWk4V7YkYr+UNXe5jTZ
	M2byhINJId66kYkU6eddPyNYM7Rg36yjs5pEgV6KArH1x3EEU4X3wSlTzE063sRenpIjQV2WBp4zs
	Sa7pelwx7QgxPnw6Wbq4YnEnaiifG2B2M17w+Pebol5eR6HtZ/20mcmyD8DnVUvT1Rxby15u+kxUF
	otj7wSxKNXh6vHTHhg0qMzbUmm+Ri6L3ISzWPp3bcI53sE4R8YJaR1TOVu8mvLY3R9jok7rGr8XqJ
	9vabRysO9/CyYwwON6WllNJmWIdPZdjTliZXX+YtVWOWdd+TC728i0ys1ORryWJwUvX7VH/NgZSg2
	iZbvruQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAk9c-0000000CB5D-1Xk4;
	Mon, 20 Oct 2025 07:18:04 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAk9Y-0000000CB39-0uhw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 07:18:01 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-363f137bbf8so36014141fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 00:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760944678; x=1761549478; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFWIsHcR+hD5XAKLrrYCj9xMsNWxUYwTXzF4H7urqUQ=;
        b=l74PjSoVUVaJpn43/vao9znr56PMAtpBfFocksCFL4zWkgCCacoHuO5RNR0/munsUa
         BJLdVFWKmsBnE2nyo1jURX7lxVae++MMYoBi8Cz09J6PJEtxGq0A752n0yNJe3DYexF3
         xRvTakdfWWIsxPh+q7l799pfc77YniDfMs11CAq9CN8G2UoQCZKOvb3Pxro7LAV1oeqV
         fdrg0lUYI+C9TD89HksucvXr51hsABNsMiZmkcs8A3zx4pJN+uzX3hHY9DlMX9jZCBXl
         jspfKz2MhbhqBohumrYJZUq0bCslkjYLtWVUsHeziBGobxDWOFyR/lWyoT6FVCThucfy
         zCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760944678; x=1761549478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFWIsHcR+hD5XAKLrrYCj9xMsNWxUYwTXzF4H7urqUQ=;
        b=aXVaJ4h5YKR456vVjfu1RsxXQEWjJMdHuCWfnfcKHsw0zjS8O4sKQpd+YXXnyVt+EO
         CfgL0xTykPjqoBpytT7tngXR7/qHeJMTK3w/uwCB0cfJt+9HtUOvEGibVYohXI7y/Ogo
         avILEbq6d6q07witEo1UkOlMkGmgVv4hGp/9dt8lCwB49aq42xwlpiYf/UOtfcMoQI+O
         8aBxF5FdjTZ5MHaodzuEhLaE2SVkbZ4jL0BvLW0w/HfQOumU1RLWgH5ib0cAgH+j7/XB
         TqnFPYCVtRm8MKi9FAcl/tkaMPU/aoup82f8Vo3YYzUbQdYU2yMBtCLEJi+//US9vQ2y
         42kg==
X-Forwarded-Encrypted: i=1; AJvYcCX/B6tB+xGgGu6/bcixKBZ+XEk/K3SHrqZ2h69qchBJJwM3JwcXz8bVHZzFkUXkqW0pP5ojByKZEyznRK6b8zjz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+pMjIAv+mfX200aDMW5yRbEttVqXV6TTcwkrbNGN0rLpnot+r
	6w6AANV34lC3EzfKe9UhnAKcbHDzOhlBdO3JQIiCu+wLplnFyg1/W5EE
X-Gm-Gg: ASbGnctI+83A3QeJ2ZCTTnDyt8TzxYZmcJRRST+cn9vdpUn1tqcj+XeUpwMzipFPZyv
	W7kKEZvYRKTWASlrEvimNbajjzwFq5iCQU6VEwhjVwMUBGZ3tUhWvglTXwBXoKLL3DRbO6mr+p/
	WJo5zpyWODUKEqEAVG/vype7HPOREqm4Wi7hBC8Qogqp/gaqttV0UXwb35UxcC4J9aPUtCW2zfQ
	8rZMETk1znsu2xOl4JVanDeeClV7CMqxJk7D1CToJ8UTu96ND2jEepw96tZGEfzPY/L4EXz0EDY
	6hFY03Yd9IUuPayguU4PgD5Q9njl1uRwdf62NdY4AjsfYv38x+0ybtPAwjr2w4rniFOAztNn3mg
	z+g5PvSu+wxpM9zCK8XGXz7gs6KsykAlxxmlEnTx70boJrOsSmWnpBbDTBnLxtczUwsK5zGx746
	/TcoERR24Z05sT1dFOJdgIn7jJ7s7WBL3AdRw5a6MvogUfTALpZC/o1/Q=
X-Google-Smtp-Source: AGHT+IHXByz8VitGJjgs3nH3R3vZgX618KuW3LJgEm0Ki4juvIMqSu3YilgibjYpLhrcCwdymQlHCQ==
X-Received: by 2002:a2e:9a0c:0:b0:351:786c:e533 with SMTP id 38308e7fff4ca-377978ab86cmr37067571fa.15.1760944677919;
        Mon, 20 Oct 2025 00:17:57 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a921ae62sm18863341fa.21.2025.10.20.00.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:17:56 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 20 Oct 2025 09:17:24 +0200
Subject: [PATCH v3 1/5] i2c: core: add callback to change bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-i2c-mux-v3-1-908ac5cf9223@gmail.com>
References: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
In-Reply-To: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1672;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=5vuOIHtLq7CFaEidcZicx94qxk7qZlaIZNjnBzwUQCQ=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo9eIJOGymSysyiJWdt2FAXU9oW4MmgLIfe0XX0
 4y5pTaPSXaJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaPXiCQAKCRCIgE5vWV1S
 Mr39D/41YR5hxoU0Mg4dWKd+5pjXIF2UTG5GSN1R+tXLqNmx2OdXPIGIkovXdgmYHUjNa1tBR90
 2giVBkbZLDeXNYYQEAUtm5qvpvp/8usQxSjjP+uFPF/Aef5wokgaN7AgzeMxOzJMlHRgyJSrmzc
 wm7Skn/P2U/Y3s0fhc4oMR0yGN6CCtb28h5HEffgwi+MwgA3n791Rj9diEsokY/SgcgLR9hnk7Y
 S0/0lnkOvOHPAg4OSGYFTvHPTYilRhk3zn+7Z0oci8JYkOqafe2KPBn7z/+DJBZxLcQEUNENxKY
 RurpcfSDe4KfwHPWM9KZ3XU2S6gkt2cslYH5n575XjBwSy/MNYAGKNNbq0eg5z7S/ytUNniCisz
 f+O0QFKJyuWIo7KQMPoIxV6eGDqigYV0jgbcUP3+j4oC22UcCW70PFwFjBJPbPSF0A/UYefzf+z
 B49NvCs4Aa+xMUfz8w3jC1xOPHwvqKdxEWXzwJQRSO/JMrybif7ugMEqTYcmzigjajTUKgbTwJH
 Z+FgOE0KSUurN3H/H/6Ugsn6B1IFZAgxzvF/XxoVeeCsXIW0pnYP+xETiiZ+oJExzpC/2K6gc3v
 16WDV+P0PNZf9SBYt9hCcR5z9uusyMHsSjJwL8l+0JhkikVO3sS0nm0mvVVtLIxuhFB7ClWb3US
 eOBtKLUftn5S49g==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_001800_300065_7D34F7EE 
X-CRM114-Status: GOOD (  14.98  )
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
index 20fd41b51d5c85ee1665395c07345faafd8e2fca..d147e388dbab27966beb4dfbf869928b429e082c 100644
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
2.50.1


