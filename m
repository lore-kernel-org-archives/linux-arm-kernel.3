Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B54CCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 06:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFWIsHcR+hD5XAKLrrYCj9xMsNWxUYwTXzF4H7urqUQ=; b=GpCr7XUKq9wT2oW4hfFLwhROTR
	V3J2cQFyH4JLkmkxd5YYslZn/l7lc6R1cKYg6D1M3gWKdl5Ly1yBnV6SRdFDrcOQSqS4NCKw3l/lk
	Otmmh0LiJS5gqDLdw869CWwoz2t7EpW/sK3JdmFNw97sanW/d5ss8iDc1dq1YI9CJPOfU/bjfCgVL
	jlJwCLq6n8jp9VAEGzJuLngI3sgNSjkOLSsYILRgWqPA0wOseMhxkWa/MiAML9ITevJdnj2EjCURb
	aK7GEWxb0h25IDd4tA7UHbcEHj37ZghvE/NgXA5sTwkwOG6vJxfxJefiKOYUzY9G2+XHyG1CjSisH
	wf/aDzfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zvp-00000008wnu-0Tf7;
	Mon, 22 Sep 2025 06:21:49 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zvk-00000008wjd-0ku5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 06:21:45 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-367ce660b61so9802061fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 23:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758522102; x=1759126902; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFWIsHcR+hD5XAKLrrYCj9xMsNWxUYwTXzF4H7urqUQ=;
        b=TlAk/XkNHUKtS6fuq2tLQ+Eer6jKC48pzY4vDUXt3RE/gm2Fu1jk7ic9msocOgYnl3
         /iowKzNnfqz2Q/ukd9hj4ajq8rEZEBmmtrrqNj0p2xUZb7TVUOq6kfpmIgKb1qzweT4J
         wf4CAxp++qkKCqyuwYjXNsqOCkW2VIy2bmH+xkDyrzokeDtfqL7O2xXwQ+A8Wm/1pveG
         N5XPEFFmiuOoE+siA9Vexk0j/jKC9VO7BiwOqr0wMHHuUcczMW8u49g34ECWrIBetEjT
         wUjCxK73aFC2Tnw6liPikwGc0wvP8AEfl5HYziwKg0Q/kJMskfUmo13mOmUcrflpx6zF
         ZBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758522102; x=1759126902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFWIsHcR+hD5XAKLrrYCj9xMsNWxUYwTXzF4H7urqUQ=;
        b=q7e+jblRfladVdLpXPWb2nuqFcw/VoI1JlNcuZgmegbxkMI/txthFS6EKCiSBSEBaB
         XsrwoO+i3K2JpNc6twTIWyZupb8k3plRjpyJMTLJWSArXUdQ82P1k2PbfWozS5077Dso
         IbFHjc1sd6cF7SbSpNfIRPbjGTKkiQBeEIlERbNLa9Z+ipLeKJfdMemhVBbjVTqysXT2
         fb4lsJ3mdcREX51XyUzl59kzoTWdf0+zFQFUjs62SyrJmvjt+V4tKsCV5ZWnGCizRTjj
         70ymmv0YMFqdwoqdlkTlf98rSUbVXizS6y00MKnPiVsi20t781OEmvTchBLQ7QJ6eP/7
         mwGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkI7+NIQOmjlrjCnlLvVH/6E51QV2rxtT3jg1ZU0UoCCpaExmd7neF5hBycPQbUDqQnwpYz8iZ2u6WakRzORjj@lists.infradead.org
X-Gm-Message-State: AOJu0YylisZLBnLgcx9irE4q8ug0WIDIBDrmDYnH8FaG6neze9BWZQJ6
	83MJSxbp37AqDVVVeAHEpG/3ywf5AodQXxM0qmpAAXJ042/J/FilxbKl
X-Gm-Gg: ASbGnctA8LFeab/mQPwmeRiWzFhyY/9G1gprp8+FC2QWm7uAw2D1U8WxA2/yov06BrC
	v2K3A0kFB0froNH+Yc+iMLVtUTk/S+irVzMJYdzfNqUeajJWvMC36k1viCnK/XoKXmcJIk5br7+
	CnOzSm6xlq28Xs1DkxYfGuGNwgIAy/VIV1OcmI2YkJ2UsHMq22EANHmcLVVGvQP1VOQtaiV/BqE
	7crmYNyg4vxulFDsbRoo0Rl1+nHKEQX2Dz6QZ8gjiPj5zWUmE2dKM3NIaREuaIvy4Ucoxksi3Gl
	Q4PbuXsz8ocq4MgDMU8IDIGJhRlA3D6DsrBaZ3UpbZuVlqlZAsr4rj427tQ9PkHKw81QYmbkf3D
	O3HhqSkVu8Ub04DReahpbrVh13dZVXqhEZ5rvSAsAjv57ch2EPINiCRnWYW7uxhw4+yw=
X-Google-Smtp-Source: AGHT+IHyYDfi2dmbXnYLZBfsnc/6AkWfJ4kKJQShnqMnsThBP+9pZ6e76HoP1InW2I0Ma+PZ15A50w==
X-Received: by 2002:a05:651c:2550:20b0:366:9bc9:4b73 with SMTP id 38308e7fff4ca-3669bc95204mr17702801fa.13.1758522101971;
        Sun, 21 Sep 2025 23:21:41 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a99e99e6sm26982661fa.56.2025.09.21.23.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 23:21:40 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 22 Sep 2025 08:20:56 +0200
Subject: [PATCH RFC 1/7] i2c: core: add callback to change bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-i2c-mux-v1-1-28c94a610930@gmail.com>
References: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
In-Reply-To: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo0OrOt6PCwljxald5m7gc8+WsI9kpekTN+Q/Rq
 gbzc/+JJ1KJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaNDqzgAKCRCIgE5vWV1S
 Ml33D/4jURdHc7ZD+yGYnP7a/o5h0NzCtJOSCoXVcslKAcrezYI1mKiKUpA7cH0pqaP402/dB1o
 4UqBwRSE6phGhHOLyI1Da23/uF3tKaOR1xTOH15XJi9KJwhLIOWyPrLAf7L01ROvcSAK+aUPmTC
 w6jQzpzKirmLZWunBp8RtkLsIXZ+69LIn/Iaj01IjtE5bhWdLGAmVAGlmn5ZH1LZVOXFWmqqi5s
 jbx31cFHESNh1aNmbszEF6RZaoK3keyxl6xG/EEWOxV2TsFg0FJ08XeP5pbg6zhlKR9+sftC0hK
 B47jZaSIONjU0wzB7QjmvD9GtZh64vmHCab865FhR8udfElK5I/dz9I+gH/9dMadpLQMtBoPJb7
 Lw2aZRQjwo0bOYIYqehCVOrxYWMLFfF7pZHbavriuINk1yyeKy8BJW/feCL4KH1tqMOsv7SRMbC
 txk2z0uXcqfCw3wBakgNARonovBe7eVzK09pKVy3EVnz57+4hTge2Jmj8rjbhZ4V/MvJZ9CvW3W
 nI4Z2a0UmxngD4AJzi/+kbi2V6eaFJqXJNdkc29kt/KReJNdUmHHh/cuIHC39p5xHq6NofMWqry
 zGMg1B9qVbYTHbRMbyStwVZ2Dyxwgph1y1l+zuNJFViwkbJH8yzM9YUOsuqwGt9wcwcJiw/8rib
 hGMwGk6CRvJw7wA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_232144_258589_12720D59 
X-CRM114-Status: GOOD (  14.82  )
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


