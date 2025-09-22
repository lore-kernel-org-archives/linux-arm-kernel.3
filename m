Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC566CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 06:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGqOJ9/wDsjD1e8/2jE4mLqygiZZmNcpMQ5EJRhUWNI=; b=hPTTrct/vXDjsuK8/4F0QZ3Njb
	0J/RZWKw0pJMBTnLN1vUgzoNVrSRJq2n+KmJBFGCCwjCjb/1EKil9a1SNjh97QdwUo7m7ZBZBDm6+
	B2ZkglaMH0CCGDqJhErM5+/LrdWEzCJmpAUEnDnuhTYJjZ/2fDBg7+bKQQrpLZNh3gWTc6ea1EXTm
	78ZhLt60cxo9j0Q7HnczwgpXhsTDMCayNZTjo984La4F0vSwzstISA98iPjOsoWpBzfIdUsi1A7tm
	pOQ5pjptuVAPHwOHk3q0pJSpUG8ZawZEN0VsMZGGcEPo31vp0YWdG69mUmJ1XvcsBeVQJDdHaHPjM
	Z8WoSe9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zw4-00000008x01-1TYB;
	Mon, 22 Sep 2025 06:22:04 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zvr-00000008wp6-0nQk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 06:21:52 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-36295d53a10so31574531fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 23:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758522109; x=1759126909; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGqOJ9/wDsjD1e8/2jE4mLqygiZZmNcpMQ5EJRhUWNI=;
        b=naaTuFADKUiwG9OheAW6ufUCvSANvn61Aevi+o9qOzLCgXbiWwx/9hHW1v5mFg0HkX
         vihvqtQOxjpyLSo1K9qsjrUssQHbO7tIXINorCBksAC25ZcPhKwixyayvKYwn1WXPeNT
         StaLd/gbAMEZCXYrUHPykmzUBkxdDAPbO5EFLy0iQVh8Vt3W1gHOz3rhvemqXofP9PKS
         6ys0nQ2CvjNuX6ZXzA+h/hrTTkwZxzwVm3VaaMghhZuFDO3y+mTXzekPk8D/wJyikRTn
         vdPb2lO00PUmMJqIT8FwTW9TmjAWLdSZ//TkjoQ96sezX4W/Eweae68oH6slcm+qm/LA
         kdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758522109; x=1759126909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGqOJ9/wDsjD1e8/2jE4mLqygiZZmNcpMQ5EJRhUWNI=;
        b=VlN2eqkG3erer3SWx3I5OgtxPzkdk0V89o7SKxKnbM+384ANXrCydh6j02i4qtiBY2
         z1vPQOX9llgu5D1nOkBpVx0v6z1se1MXR14pJfgftJpkR40N/o6UEyQJVLv4ZWZgtpiz
         aKsAgOkiofTJfLQztC7PkQlUSTnWrtcB95LE6OQ0KbAnM1zJ8Prq6uI5HKqskrcnWBse
         YHszR3rBZUTrNaHOQxygwnb/kE9hZ46eKJl/lxA25RCdi/UWvb24eQy1X+nOoWjJ890J
         85iWUKdRqyuQU+ZtJJ1ZOrG09m/DSRJWw/yOK1VGWrI15o0jdXLU7C0M9+MXF0ePh1jK
         xHaA==
X-Forwarded-Encrypted: i=1; AJvYcCWlShJfDOWLxDa2eYEQM2ohzq8AE6obglkcpKX1ohV0YIp2AzrarH0A6prvxOOvrsuwKp5nRK62mRresDWMm+AU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6a+uTV6JzTkMH3G8aMEYJbvl7rvnvC8yW7gOAoxUlhPQqp3mn
	tGmgatGUoTzLyciDDtkUG9DEfDHfu0fbpf18GJ26yBvU54z3/pxdWpmr
X-Gm-Gg: ASbGncsiHywwwFXXyozx+o6Pe8xzDb1V0iKVxvygm/BdHpCPYzbZhUFY9dFrGb6c8Y4
	ZM485j4oD9IXZMc08fKfslrhEhDG57Cny3eZ7rIHBCIfBPKvJg1wevYvNpD1e9L0HYRXFKJzjB1
	bjmdZvtCdUaTEpzLbedTincoaDUAdvFHGR9Yxua5fFII/d4q1oYqH3cfbiaYQzhaoKPnaT5XaHY
	hv0SZW2K+V3eg3aqwT7V4wAN0AB7Ul0XmR69WLJbM9zn9ytgpS8JGkPslLqwESbWlj0n7xNbtga
	Q/aEx+PrzUP7/7V2P86fh9RqzIe0llnV0vB56R8kKIZlHsKAiP1s4oM/4zu3og1hq5pmzWl12+3
	J3sgK24pjcQpfNHUoBb1wASQu8yDd0KASWLZA8geQGRJaXMccLwKLOhs3+urGdI38Xcw=
X-Google-Smtp-Source: AGHT+IGwN2JhhPE7hHQ65uaLB0URi5QMIY3lqEciWVWM+KDMGsSo4o4IH62XENx1ZoUvR5i/oC859g==
X-Received: by 2002:a2e:be21:0:b0:36c:3b69:2cfc with SMTP id 38308e7fff4ca-36c3b69e759mr673001fa.8.1758522108996;
        Sun, 21 Sep 2025 23:21:48 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a99e99e6sm26982661fa.56.2025.09.21.23.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 23:21:48 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 22 Sep 2025 08:21:01 +0200
Subject: [PATCH RFC 6/7] i2c: davinci: add support for setting bus
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-i2c-mux-v1-6-28c94a610930@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1607;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=ZRFvSmAGP6q+vBY0PuMHuuVxT+alZd4ni1G4olWQ04c=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo0OrnD0paauU8/1PUKU/MWNI4rWluhwYS4jfbi
 KOJB16EP9+JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaNDq5wAKCRCIgE5vWV1S
 Mgp3D/9Cz7yhGXhmLHWthsXVuKYbL0YxQVy1e8U724NkO8lZES31r9eFAf692OBdoIcKJ4S43HX
 fmkgWg1lbJLADJ380iZdDVt9jzTj3SJZ+jhjwPbNnOFPqQpQ0WQuzCiXmjyfQQwt76bSsxwoWE8
 7NrytWx4w4y0dxGrtQX3A3VFX5kJNOlpfHNtKwAm46T9L3PIBkuyD4fPH4+JOb1nOV3+CVKNVia
 LpS54IMFKNyXua00Iq7dqhEMYrZ/BECI3ygwKXJBXrN/hv6FCUQTnWM0UcUnaUTHzfbW9ziUvju
 OgtMe/o2nqSyGjhfAkpQ7LdCfkCccxdN9sazjhZWc3M8YSS0TstSc1MuwuhyXVHi/YHE6Yb4IdU
 KV23LyBnyMkGaxKwAHCw3j+gizljEDhcmNv1T6micBVKLhqmoLOLid3eJH8Kk/ylH2ejmemIbMS
 Fq1WAZfTw1cqWBWgUlO7q4VWuDqAZsfg2ZxG87lfcpu2n6orpniH+Gi8Gb8Cs4w/cWVF5g6hR3y
 uJj52cFUqy4+ctxslVzxti0dxWVdslFvnYKzUjugX5dCYSz2xo3rT/emfFU68W1eTkf6dlQA9WN
 jxIfCoibU1rNARox5JK+m6wwnbXDgxEUKFLyZgvVOg4AjcIo54pAyLmjQn64jqkIjAMzgxcLXq1
 JX0MkjYuPwatmwA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_232151_270700_461DF03D 
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

Populate adapter with clock_hz and set_clk_freq to enable support for
dynamic bus frequency.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 6b18938457d0c5cabc323c364d9330c2890df107..d3e47738f8ee7e8f69fee49509dcda396c9b7fb6 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -279,6 +279,27 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 	return 0;
 }
 
+static int davinci_i2c_set_clk(struct i2c_adapter *adap, u32 clock_hz)
+{
+	struct davinci_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	if (dev->bus_freq == clock_hz)
+		return 0;
+
+	dev->bus_freq = clock_hz;
+
+	/* put I2C into reset */
+	davinci_i2c_reset_ctrl(dev, 0);
+
+	/* compute clock dividers */
+	i2c_davinci_calc_clk_dividers(dev);
+
+	/* Take the I2C module out of reset: */
+	davinci_i2c_reset_ctrl(dev, 1);
+
+	return 0;
+}
+
 /*
  * This routine does i2c bus recovery by using i2c_generic_scl_recovery
  * which is provided by I2C Bus recovery infrastructure.
@@ -810,6 +831,8 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	adap->dev.parent = &pdev->dev;
 	adap->timeout = DAVINCI_I2C_TIMEOUT;
 	adap->dev.of_node = dev_of_node(&pdev->dev);
+	adap->clock_hz = dev->bus_freq;
+	adap->set_clk_freq = davinci_i2c_set_clk;
 
 	if (dev->has_pfunc)
 		adap->bus_recovery_info = &davinci_i2c_scl_recovery_info;

-- 
2.50.1


