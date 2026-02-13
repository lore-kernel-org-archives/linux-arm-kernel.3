Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97089EDF150
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 11:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LgqAxD6UfwmKx5Fd0jcW4Pat4uqGsb1EaPQx1jaWDA=; b=s0RpLMFx1PodjmBtstfKqvbB6V
	rXqLa1kE07P7Vz9448E4/km/OwOaDdcX8SUYuA+o9fQgQsKImKiaQpuij+6RX8RaaZhxp4h82hsLr
	BOhqqTZ4MHsbsxqdwSlRFO5410i1848cMbIraZOFxnTd03JC39yM4ZO1Nb3vYn2t/V12QGN9lHjYD
	O7nNd75aiuvVQLwaGDWHGKuU+aoIF77LJUCAFrAoAdXItoWwa3XWpQdoxiUkDlxGrf2WwBR1aMGGu
	eKukHJ6qGejUa/v/wOZZrtOx9hZqTe/CsPdzRizQTYDUGMmwYPmJK+yLKiMRugb3cvLgZ9QJkQieO
	s8LroIHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr1n-00000003MrT-26c5;
	Fri, 13 Feb 2026 11:08:03 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr1h-00000003Moq-3G1B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 11:07:58 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-38709888abeso6234911fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 03:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770980876; x=1771585676; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LgqAxD6UfwmKx5Fd0jcW4Pat4uqGsb1EaPQx1jaWDA=;
        b=cqQoQiP8PeRsv8J4ymd37FZt/HrGhxz2veNfT8ReD51rSiWRIllKI0R2ySAIR3pIVT
         xK9YwzJg8td1TjHYJzIQz29iWxFTFEI+P1WIRel64S15GkvP5/bptnsE9VgitdY/JrFZ
         tUZQxC3byhynatBDJgj21rJu0Kl/2QacCENNB6J4voQMI5UNQamfvGVPG/htJzfHqTzZ
         +LJvLEHLt2D1zIdwVD/1NhNa3yh7gkccGMwUD0bRAvgevvhNUWUExY8wuEFV/1lric0E
         Ee/0EMizB+xw4AR8VcuMkUha/fJhPuCkXxft+TyZJoZzvoZU442c+1ebT+0SkPAQRmNQ
         btJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770980876; x=1771585676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7LgqAxD6UfwmKx5Fd0jcW4Pat4uqGsb1EaPQx1jaWDA=;
        b=CVgDGCZPlwMvWXStDlMjqWcqlsBorQW+q9ezeBMiz9L0mVXiP1GiLW14j8PUKqoXdl
         uMX3fCbrIBbbOod2NEuCtebNWANvz11SB6fPVxaC5dUl67jyg9wnklUMHag7UEf/l+9q
         TYlmO2VUAVnu/CSJeZosl53TUrw0X6fj1e3IbB8Sx3OV/xk+ITq7MJrrO438fN19pkVV
         JJSL0JdeT8gymHKoFHxi3M356QoXdtXhav4O6TSZ8N81Lg31r/mq2acdpbPQzml1y/2X
         UR1VItOTX+65gdiTUSnlRQuaTr5R6p1fU/31qCeDpZOezw1xRDOUtT0szbiIJokYYDcv
         /zlA==
X-Forwarded-Encrypted: i=1; AJvYcCXhWObOCGwaun/Ir1yRgYxn+MbLQUuvLV0cd1BaPXefeD3XQLbgQBOLB7avxn/Yjw5wz2K1FLuUDwkaRmXZUylv@lists.infradead.org
X-Gm-Message-State: AOJu0YxAyytlN4RyJ+7PaA5yTudG4ULiZFX7QPVxm/lANmDIKtfPkQxu
	twlyK7L39h4PYwPSqzHfGOBXTDoOv6ZY4IMbZd2NFdRXjKLI3b+SBtfW
X-Gm-Gg: AZuq6aKmOh6+xuTaV/xG3t4+99DEVF3kT0ERTxAqmeG2J/KYNuKHyKDY6/DvFGVKHGm
	kqIWW9D62gvBN4l4rjPK6q0EP+TwRsvDQemw+xSwenq/74qPjK95ak8Cwn5MQfe9MtNbWJAO83W
	+5DnI5cUdujgXM41Mma3NmQ1SWhJB3Q4v3+4WrliamLKd+QbeswB5sGMPe2kVSALBnqo9laO5j/
	qSLyGV6hSyNad4UO2ASdKqycK7WYBnEboCGtjVJrlz+75SbscGLuZ0LxWfnSwvASDHszxDnd2mX
	6LfCGdDzEIK3kHMRnd0vfa9iKpHQH4Pr+3CeYhcwxFqmIAOnjJUA0hnVyIIiAF9tmPdEAisQuqM
	MAatGSJcYPhEMgIr7w/7k8Zo/TaWqq3E5J2Rf72aHsfUDTbCU0tdKz185VzCQxurFPdHug0rO50
	i+5w66QKIpFwLMoKOmVSXSevXGzvdUhhWtz19P8rH+hSKvhm1mTzGZL2LndvSWqS5J42yP
X-Received: by 2002:a05:651c:515:b0:385:b735:4fa0 with SMTP id 38308e7fff4ca-388104ed3dcmr5707731fa.7.1770980875385;
        Fri, 13 Feb 2026 03:07:55 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068924c3sm13635831fa.1.2026.02.13.03.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 03:07:54 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 13 Feb 2026 12:06:50 +0100
Subject: [PATCH v5 1/5] i2c: core: add callback to change bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-i2c-mux-v5-1-fb2cbf9979b3@gmail.com>
References: <20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com>
In-Reply-To: <20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpjwYAOcTbfDdGyuIUMkxx9uPWkK7ETY2/cJ3ME
 4K7m74QleuJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaY8GAAAKCRCIgE5vWV1S
 MqLYD/9U0GGb/59bRkWRe3Vd9n15zS9gSWS6D5pjlLovgKJzfMpAwTJCt6jhJlISgg0/ZSZCOiJ
 kT6IvfdKCas38bNpTPq06XdOIlGuWYXocy4SMUmmurTDe2RDP3wY14o2cgbe+e8alLWml701cHE
 sea+iijidaNNBFldYucq0Oo4ItfjqyEKZ64cmtt1jbu6WNDa5VYT0DDiD4YwYP3yimIeo57gASN
 W6VZvh5T84OxXFDCKXvArAgqu9/Nmz4JGrpeXXhABd3dNzdinkIRv2wbxK1BEg+Dmki/FiggZUq
 wShfC0Hy+YGNfKAXKDpOSJPnoV/suh7EPUy3nefT9XClLty4JwETs+/8uCqe5j3mXXfFLBeWKkZ
 xAkNHu2V2JbjbNxPPZLlg9XZTvLdWekZRhVbXYi5ZTiiiUx1ohpSh8Qlp65clxA+hQVCutN9yQn
 dTio5Yf24T+8S/oj0VpQNZxT3wa9JYLhR400yXtW7MrRTFaV2SVMYCbAVtC/CwyG0EYaFI+wb42
 2Y29s/Ls0SdmOvtadHSir0Wh4lZIQ197eNnrIJv6+jH7ulfberV6hREs5nStMGI7QUwxzVMtDee
 EnOUHuH37xGpsrdERAtAUT2JmTvLJnznqG4FwSVzKziv71l73MPvvcwg5PE8R7bYNH/Z2PscB4R
 Wq1P1dKs4WudEEQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_030757_842496_AAC4BDBA 
X-CRM114-Status: GOOD (  14.30  )
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


