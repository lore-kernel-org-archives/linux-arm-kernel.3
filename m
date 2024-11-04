Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF4ED1CA09
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 23:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpEshnq6i6G+Np3ZVcF5ef21yjGyMRFFgjDXZD1qG8A=; b=323HkbW3+Mj/4wxzw2Dg69UfcO
	+QViX0DevPRa/VFytWFfR8odn+CB1wrpQQQIPDLdB1F4DNuQ0n6jV9WM1Bfu4vcanJbJwUEu+oYF9
	dmoG+H5sXOfQ4SrfzyPXsr6He4E4xzrwMvNtUpggmGMskhg6EYfS1CkoU8tNLunMzEX4ZvTLOCQbj
	sCxMOO4a5qxYZ+nHwoFoMMI7qqXp7suxRVrZzobZm8TQo7s+sxO9uDxUDg46cWTh8ChGB16ON7Om3
	xmCSwVNf9gjLeOhb6Khm43DWAhTK+HO99qu2RzYXJO/22jMhQVscLg50CMsL1vKcfNExf6ZsBS+bx
	EIEAPIWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t864P-0000000FLTz-3fvy;
	Mon, 04 Nov 2024 23:01:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t84r5-0000000FCuB-2W53;
	Mon, 04 Nov 2024 21:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gpEshnq6i6G+Np3ZVcF5ef21yjGyMRFFgjDXZD1qG8A=; b=QE2mZAIep+zRaWFM3y3Js8Gtnb
	pbTbxBiMzErkM7tQOFY1wSnnhlm1EsywqEO5CWocZsjX9MGfIbwiqexLwasaOGYO88Zbd5SYNAwst
	VJ7X17cQR/Ne8X/zS1AYO9yK66/2QJfjkmXXfS4sXOrgdIocEmUFpOWtZIL3aSpdZ+AxTQS4dIpt8
	fLtjt1IGf5+SlELSbzLC8BJxOpKFfYjp1V5bhoMb8y4rnSX0zCe381fUV51cOidUy3XfJivmpSikN
	VYkh0gTwZQBz65NlZVFQ1/3Z31j3LQ7PG03KAelKTkY2rgF3ku+HMGLoTx+Hf414fF19wgNx7g2jN
	SIe9gLDA==;
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t84r2-0000000BaKF-1Dtm;
	Mon, 04 Nov 2024 21:43:22 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7b13fe8f4d0so333383385a.0;
        Mon, 04 Nov 2024 13:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730756597; x=1731361397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpEshnq6i6G+Np3ZVcF5ef21yjGyMRFFgjDXZD1qG8A=;
        b=YEg18+Lb+4OsheWy+xmuf6BU2jKlZa/t7Ww9AQq9R79a7Ax1FRpt7feZChZUuRNEEm
         OZMb9DmBkt99ezbJyKKO3T9D29U83xOvaGVQd+vnGNxN/y8kez0HjhMjhDHSlkOdH4zw
         sLKxG9QmcOeuBd3yZ/iT6jfMAqE5PjhjCU698PJiIXAUOeeKL1U0Z95Jb6MKXQEImbzT
         ktWPaPBG89bpJHnVdZ14ROWMlb3JDlE8Uq+9vrn6bS344SqqI1nhSb9GhJqJ10bFEkSG
         ODVRWfIzchsYJmfbt+UwrQREjpwNTmF3HfQOZiqawBDM12HA52PGCC8UYzBnUbapSaTb
         fWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730756597; x=1731361397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpEshnq6i6G+Np3ZVcF5ef21yjGyMRFFgjDXZD1qG8A=;
        b=ThqaYRn3dyQNirOF3UvQmKuAt63d0e21j4t1H2Z1F9OytOGuhwL2Bt0lDn01mxb/FR
         NXtpUcmjKltcqwZh+c7MkTWGmu8AOFB2HyYKJmrOEHPw0n3UxfODX1yYS268L+h51WJS
         GjznMOOhN0JJc/aUguf5+Jks8u0rue8dP4UpAccbyW9b526QVOGT+Ujjfq76qqehOgqP
         Hg7w01CokBv1Mx9EZtiljsVtMnfzRiai9F8ZGJM5x0K8sX4RkjxLrD/jfxHZrHrfHsco
         JKeDqIlKf58QzWyZ9doB/DKQggflGsu7deFazORRrG3ANmn9fZbCLeoioACiMrXHzrA0
         J7OA==
X-Forwarded-Encrypted: i=1; AJvYcCWIwp0ztJYOfQtLmmsCj2P9MJ4VLB+SjyzRXnLCOhViLRxlqrs2W/3/CMyXFXwcXsugBLHUKI6NjS47KK/Dwg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDozeLnHKgVT//CdfuTiDwEdASrolGA2rQbyUGat0A/fwdIslZ
	ZUcz9IgEAMRauLwLuX7icizphgz2EQaw9PPElr36TfD/Q4YKJu68
X-Google-Smtp-Source: AGHT+IES5Vzl7DJKtNHPJ7UmtrOwkZwfCRkFo15pFheXgrIEAUHkNDpzR2YA54jau7pQhc5lYfGEsQ==
X-Received: by 2002:a05:6214:5f01:b0:6d1:7854:ab49 with SMTP id 6a1803df08f44-6d351a8f23bmr277872066d6.11.1730756597159;
        Mon, 04 Nov 2024 13:43:17 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d35415b1edsm52553916d6.75.2024.11.04.13.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 13:43:16 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: rmk@dyn-67.arm.linux.org.uk,
	max.schwarz@online.de,
	dianders@chromium.org,
	david.wu@rock-chips.com,
	heiko@sntech.de,
	vz@mleia.com,
	andi.shyti@kernel.org,
	wsa@kernel.org,
	manabian@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH 3/3] i2c: rk3x: Add check for clk_enable()
Date: Mon,  4 Nov 2024 21:43:10 +0000
Message-Id: <20241104214310.6048-3-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241104214310.6048-1-jiashengjiangcool@gmail.com>
References: <20241104214310.6048-1-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_214320_416962_9920DEF1 
X-CRM114-Status: GOOD (  16.36  )
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

Add check for the return value of clk_enable() in order to catch the
potential exception. Moreover, convert the return type of
rk3x_i2c_adapt_div() into int and add the check.

Fixes: 7e086c3fc2df ("i2c: rk3x: add i2c support for rk3399 soc")
Fixes: 249051f49907 ("i2c: rk3x: handle dynamic clock rate changes correctly")
Fixes: c41aa3ce938b ("i2c: rk3x: add driver for Rockchip RK3xxx SoC I2C adapter")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/i2c/busses/i2c-rk3x.c | 55 ++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 4ef9bad77b85..a4662b0dbd8c 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -871,7 +871,7 @@ static int rk3x_i2c_v1_calc_timings(unsigned long clk_rate,
 	return ret;
 }
 
-static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
+static int rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 {
 	struct i2c_timings *t = &i2c->t;
 	struct rk3x_i2c_calced_timings calc;
@@ -883,7 +883,11 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 	ret = i2c->soc_data->calc_timings(clk_rate, t, &calc);
 	WARN_ONCE(ret != 0, "Could not reach SCL freq %u", t->bus_freq_hz);
 
-	clk_enable(i2c->pclk);
+	ret = clk_enable(i2c->pclk);
+	if (ret) {
+		dev_err(i2c->dev, "Can't enable bus clk for rk3399: %d\n", ret);
+		return ret;
+	}
 
 	spin_lock_irqsave(&i2c->lock, flags);
 	val = i2c_readl(i2c, REG_CON);
@@ -904,6 +908,8 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 		clk_rate / 1000,
 		1000000000 / t->bus_freq_hz,
 		t_low_ns, t_high_ns);
+
+	return 0;
 }
 
 /**
@@ -942,19 +948,27 @@ static int rk3x_i2c_clk_notifier_cb(struct notifier_block *nb, unsigned long
 			return NOTIFY_STOP;
 
 		/* scale up */
-		if (ndata->new_rate > ndata->old_rate)
-			rk3x_i2c_adapt_div(i2c, ndata->new_rate);
+		if (ndata->new_rate > ndata->old_rate) {
+			if (rk3x_i2c_adapt_div(i2c, ndata->new_rate))
+				return NOTIFY_STOP;
+		}
 
 		return NOTIFY_OK;
 	case POST_RATE_CHANGE:
 		/* scale down */
-		if (ndata->new_rate < ndata->old_rate)
-			rk3x_i2c_adapt_div(i2c, ndata->new_rate);
+		if (ndata->new_rate < ndata->old_rate) {
+			if (rk3x_i2c_adapt_div(i2c, ndata->new_rate))
+				return NOTIFY_STOP;
+		}
+
 		return NOTIFY_OK;
 	case ABORT_RATE_CHANGE:
 		/* scale up */
-		if (ndata->new_rate > ndata->old_rate)
-			rk3x_i2c_adapt_div(i2c, ndata->old_rate);
+		if (ndata->new_rate > ndata->old_rate) {
+			if (rk3x_i2c_adapt_div(i2c, ndata->old_rate))
+				return NOTIFY_STOP;
+		}
+
 		return NOTIFY_OK;
 	default:
 		return NOTIFY_DONE;
@@ -1068,8 +1082,20 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 
 	spin_lock_irqsave(&i2c->lock, flags);
 
-	clk_enable(i2c->clk);
-	clk_enable(i2c->pclk);
+	ret = clk_enable(i2c->clk);
+	if (ret) {
+		dev_err(i2c->dev, "Can't enable bus clk: %d\n", ret);
+		spin_unlock_irqrestore(&i2c->lock, flags);
+		return ret;
+	}
+
+	ret = clk_enable(i2c->pclk);
+	if (ret) {
+		dev_err(i2c->dev, "Can't enable bus clk for rk3399: %d\n", ret);
+		clk_disable(i2c->clk);
+		spin_unlock_irqrestore(&i2c->lock, flags);
+		return ret;
+	}
 
 	i2c->is_last_msg = false;
 
@@ -1149,9 +1175,7 @@ static __maybe_unused int rk3x_i2c_resume(struct device *dev)
 {
 	struct rk3x_i2c *i2c = dev_get_drvdata(dev);
 
-	rk3x_i2c_adapt_div(i2c, clk_get_rate(i2c->clk));
-
-	return 0;
+	return rk3x_i2c_adapt_div(i2c, clk_get_rate(i2c->clk));
 }
 
 static u32 rk3x_i2c_func(struct i2c_adapter *adap)
@@ -1365,9 +1389,12 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 	}
 
 	clk_rate = clk_get_rate(i2c->clk);
-	rk3x_i2c_adapt_div(i2c, clk_rate);
+	ret = rk3x_i2c_adapt_div(i2c, clk_rate);
 	clk_disable(i2c->clk);
 
+	if (ret)
+		goto err_clk_notifier;
+
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret < 0)
 		goto err_clk_notifier;
-- 
2.25.1


