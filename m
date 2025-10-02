Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F5CCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 14:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFWIsHcR+hD5XAKLrrYCj9xMsNWxUYwTXzF4H7urqUQ=; b=0Jr6FW9YgFvwXZY50N3aFfmwxL
	bWLeJ3qkFqBDStA5lf4R+qyHMiAfKwKWxYukdopLrwwVqpzxfzPdhh0L3pi11pfpaaqQT4WCfr2Eq
	/snXi8E4uysqaDvDCx+j8RlgIyUXVg/+krtDeXf/iFhrRyI10vELyXWIkBL1HdDmyYSiNagDW8LUj
	sZ9d/xvRdF+ejd/YnKRVXAWyL9F9TLrlsnDZ7RJaPPZb8KP35C/ZhfRqp7StuKtzSwfjg5qtneuQM
	Nv5d25GG6Dq79IJ76nfqfH3xTuiNJ/UBir/ZTywzN8TBkuAtI7amvxtWYxAD5LxOPZ0f5lVB32XB0
	oUS2SqGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KVd-0000000AdpQ-14Pu;
	Thu, 02 Oct 2025 14:42:17 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KVa-0000000AdnY-3R3Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 14:42:15 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so1173653e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 07:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759416133; x=1760020933; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFWIsHcR+hD5XAKLrrYCj9xMsNWxUYwTXzF4H7urqUQ=;
        b=lDCCTcYRrppqca6IluWNLBb/OMaooYm1/BRW7xTj2E5EOd3Kzoj+F/ZSrmxuFFwXzt
         +LPrqrp9V9ARzfqfnAe3HYMc5V9byPHW8kQdKF8M5YBsj6R/JSzYxKiqi61Cxfjb9eI4
         0/RlulFR84ES+OdIgraUyaaNZBXJJOtZNemOgAxOBmoV5UTe2QVtUOQ4Bshg2pv9MvZm
         EWkuVmXirSLiEOJ7kPHpowOPls7HiUrmhq7r930ul6F3CiPdcUw/xsvWvrhnN+vlBjYF
         CfZQ/oTiwriGVyh2oB+YNJeYvHgb/HxG0HSA6z1nN9dfkeUuIDZ8IR4ZhEGYt8jW7zXb
         0/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759416133; x=1760020933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFWIsHcR+hD5XAKLrrYCj9xMsNWxUYwTXzF4H7urqUQ=;
        b=HzbeJF8YLhCJcAg8oEHO7+IVKG7cOh+11g3PBk5sjPlUmb36i8C87D3kIOlrGHQytM
         hw/5BCeC9utjqwemT1VDx+l0SIXfHPweuwUBqGHTrJS+gdKz34EsAqXDr+3PUnSt8dXa
         7QUcQMrtDGAG26WA0ZW8IrwvxeM7kJrsz+dLe7xwyUXbWURwEAmczWMgc59a2d++xaVA
         VHhmIEcIRb/kBGb6s3CsI9IHVZKHgGEbPGslatr87Ynd7JPLP6S+xDhJdx4+MZ2Vkdh8
         K/zXDcGHv3hofVvLExbPgxeiQEJ+Qp8CrXdKicRO38nhj2clr1EipNm917S7qfKP4ueK
         f2NA==
X-Forwarded-Encrypted: i=1; AJvYcCU/CSPNdEZryZGuEk5bNXhSeFAr4HeqCGX9gGlpCXeoLczdnQLBY3ToYkqtUNeHNwlGuPbld0Q5/Fevk3lQJUbX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4ZuqLpmonKPcbFZAwkI1fEtTUx0VJHLwMv5qBKl96EPxvLsOe
	EYpFQNya/G9tE0OdgZBxqj9ro3KhkmkIAaZFlxPkRqT07Wo7+99V0rY5Qeoxy83mNdk=
X-Gm-Gg: ASbGnctyKmDYtqXiyO9rbj9fER/cAUy4a37oECi2t67BYTuNcy4MWL6PmwsMz1q3RnW
	7JClF4GCROxEd9TU+5tHNwHlwm38KfXXXqfpzLz6BRRfodAttar3TA3mLctRhEySfaeafYOExt4
	+nj4a5eFp7c8sj2IDWzTEkqHxosHA6wZMqPEscvSw/gK+5PMebj+LkwrElF5N3oG1iKV6GU2mac
	xrVOf+nSGkcdNb2ciyG/UUWmDPzBTUmAX7c70YWKubmqarmJ22TYdxWVT0WWuUCx+STQLZwlc5L
	en1AvA5xKg9O0PulZy8Szlbq0xHbM0IuvBTiwjECv9lZJpOVULI1bwFWzA9aqh58XAV45ESpXZO
	+uENhHcnP2EyrSblVejX0pPzOErUjqMjY7XpZPTGbw9y9fw6TcAo5ninJ3AcFD6hSnvbpctgHxm
	7wLGPvQzpqMOa1Y+k=
X-Google-Smtp-Source: AGHT+IERyyKNqaNT87ECbJ5igCLeF2vmtOluPcZeTEexFXRyoqikIqVU1Kihwsqb6e06ppVs/cqtPA==
X-Received: by 2002:ac2:5144:0:b0:57c:2474:3743 with SMTP id 2adb3069b0e04-58af9f3fbdbmr1909198e87.32.1759416132486;
        Thu, 02 Oct 2025 07:42:12 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119e60fsm884712e87.94.2025.10.02.07.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 07:42:11 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 02 Oct 2025 16:41:32 +0200
Subject: [PATCH v2 1/5] i2c: core: add callback to change bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-i2c-mux-v2-1-b698564cd956@gmail.com>
References: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
In-Reply-To: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo3o8oVrt5yyWpCE40+l9t5c9Od5JLxFteQjmrX
 kRLdZyjpHiJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaN6PKAAKCRCIgE5vWV1S
 MoukD/9SOOM6WikhU2lmPNMj4+dJCYO99J4XPsNEowIK8TxfnGgdELVbwsZNKv9adrAE4yB14I9
 +Jr4kyZBfn5rd73hUyjEkLRSwJkH7cd9XvT4Wl3Sn2bcBpHZn2K8TVmnnsB4sPm9el6yyXrp3nT
 wu5BVfPzO20IEb/T5H+04MUiO7xP5FzOuNGH+HEK1/Yh/D2ob4rXLTrumyE27fykyH1kflc3LeZ
 Ow8SA8JZNH5eIGFynPvqUn7zkgGhO+xcTz31ZEkdfOQGRRQxujw7A48ETiSYd6wEVbfxFYY+ux+
 qPGO2w6Q0TsrVgZS7DsRVKnCH+axdzBeQe+/uytOA5xwNVxykQwgwQifLDIdmWZGQWrlnN2Ha16
 CJfzHEuhp7UO7xPfEJLbwdrHgsu038kstxWa/aBvc1EDpLVUR97Q+SkiZRDlNZZdFjBb1+UxYYb
 4USWj4ouQdYRoqsOUGcO/IwhbwFBFhLP9EN1mS7GogUthsn+9BQJoIHMHNQp0pLO+DrTGo1reQs
 lgC6+EIakcViy6S6j+dkBadSx5A5uNUl1L6B9Vny1OI20er6Zokk1K7ydsoy3rJ7VvV435wjWq1
 EtrScWdMBQxLhCIFXh1EM6Fc8InxDkULWWtcOLtWM49qrkeuClh0fjBorrkvDzcKJV6cd48TeGk
 vngX1nqXomPLx+g==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_074214_878944_7B22D605 
X-CRM114-Status: GOOD (  14.77  )
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


