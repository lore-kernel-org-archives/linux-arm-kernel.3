Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81826C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 12:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUX26WpwvVrJFwxAmnUDIQNXofqL2zgl9QzvPbM33SE=; b=mWHsMepJrTcYhK67Daiz+s4QZB
	23EhGxEt8y8vXcexoMtid1i+ykQxjOeML46akxKaltAR2K3EHnlLtUz/mYEnnrPxR8anluBEdMMSI
	+l9ZcMJzaBvX/cPPRzSfuOB0NO8pgXLEYNCkEeKzykm+yn/tchix7bUeOC9TqorBuWZzc9FiTiThJ
	Pep+xSJJ7Ha+f0RwFOmbHyGRhZxL415vU2IVY6Y50NwpYl8yUtbZAn5bbQkJKBLCKCh9Iga/NpmZd
	thAFwceKJRPPLi91iO560LU0DXfBt6XvTfjtVAc2k4O0BfhmzPnC4s3XZGlcRhMMT7VPUHoMUQ2sX
	FsBQLnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRCu-0000000H5JE-3mPz;
	Wed, 08 Jul 2026 12:16:52 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRCo-0000000H5FM-2RkT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 12:16:48 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5b0117dda13so469795e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 05:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783513004; x=1784117804; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUX26WpwvVrJFwxAmnUDIQNXofqL2zgl9QzvPbM33SE=;
        b=l9G5KvM6qy93jZ3j/mSuqvss4H4XWDXd/Kl9udeaFanEBLaXBrtRC5mXaWiK5lWbCJ
         SHy+Szosn6BTZBiKlejLfu5FQLhVl5+nFiUyhSwN6bETtCYlOLx4UlskAUAl0POBLFcr
         mtpNKQX4949LQAg+aKcIkr1w7a1/h5FiGKm2HgOSa96epaEUBgo7ZgCYgg0yQ2UQPwVP
         G12HGowI444xQdIyFyKcPzHg0/tJY82FD7rQc9kaWU4CK3ur2eq5XAObvUplGb/EUCyT
         TNm4hDYg9CKmxbpPTIF+DU+3WgdLKHVvj4uDK7N8BlqeNLoI/2KaMSmVfsxjokSVt6nf
         Wb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513004; x=1784117804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mUX26WpwvVrJFwxAmnUDIQNXofqL2zgl9QzvPbM33SE=;
        b=keAELxJ64vxxCAVOwO8W5OIAmGi/M+gA59QN8L3Wh02kA2R9QqQv5YtC3bfbquzGul
         kbGO8vNWjejHUd3bCU+pF6mJeiCu2KsjCe0JtEA3z7QGvktADgaW82vYgHfeQfwUuBiS
         XAEk5EFv3t04AvVn+rftUtIIgUh++WeaqL08elzo6BGwFKzNlB0u9eW5brG5+llSrsmT
         7Bcigvq6b9Wy9+1nhe62MXjekgcwcVt1glwwBENSOCjl/zSG1tItpFoFdvDjV4KtOWYQ
         I6utJ3hl8f2XEI8gw3/ImtaJb82hlZwBd6AHpriY81cJ+kYilnCVIF6umP2dZTJQZ+1r
         6XGg==
X-Forwarded-Encrypted: i=1; AHgh+RpGNsbcbEowTt9EZxfvLKt+uPZVh5jl3adNuMCkHQxuN7TMAO2r1kpcEtLFVNhA7Yy4+1EJo9Rjkkg5BZB1XIdO@lists.infradead.org
X-Gm-Message-State: AOJu0YyPyQ/fSKiEaeY8BDdtVzeRQxguJ/CT5Hjdo2rn8NiUacK6WlmS
	DW2eMc1Y2+Br8fFLoiTikcEy54bUxamYjW9ET8YelLlLT3EPGEmRVEhdW9SNpJ/lHjg=
X-Gm-Gg: AfdE7cmUpA70EQnAAwLNJWOJJDlnvbGXzANtUbD5aHibc5vDAyqmOutWXcMur+NhXfH
	cq9PG/eNNHbIWSfYnw4WnKqJD2NpuDLwMejejD1QOJvQUI4ZSolYTN5ocvC5/d4MtnTyT28ghws
	InlB+fJcdsNHzE2F2+OeLZ2qX50qOSvAZELgDGEtnejArKGnWK9FYK74/IVwScqboCj42zJzyG9
	cdChdEhWLCcY/cLgmRW/n/fKWTYa15xf7KLVEyy9Hpe9nBA7mp6bftSohesqGnAzJXm82SyB4xg
	8sc+109gtWcIGXNnd6/mApKzltfwodfSgS+8PJgTTmENzbx/g6BPgE6FvTIMyBLfCQF3XkgDqAY
	X277Y6JzmcniE2VdzOIQeG31ecSq54VqPW1XQKiQEpsRh3XnWgDP9vzOnYXYgZAd8U/SBsF626s
	ZdG03bJF+lUrCIhUwgJPwPGXlW5+cFFTgoJDk0X8YXaCNlRDZvSU6WaOdmvQ==
X-Received: by 2002:a05:6512:2305:b0:5ae:bd53:70f6 with SMTP id 2adb3069b0e04-5b011463cf2mr624254e87.4.1783513004130;
        Wed, 08 Jul 2026 05:16:44 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbc6sm4471459e87.41.2026.07.08.05.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:16:43 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 08 Jul 2026 14:16:13 +0200
Subject: [PATCH v10 1/7] i2c: core: add callback to change bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-i2c-mux-v10-1-09dca03c8a15@gmail.com>
References: <20260708-i2c-mux-v10-0-09dca03c8a15@gmail.com>
In-Reply-To: <20260708-i2c-mux-v10-0-09dca03c8a15@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=utkdIrJtEC44DqqTUyxORrRSv5x0AbtRsT4oMW64lXM=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBqTj+US5C5h6YJPHKyg1kXnT7uGDQt41tAj01+Q
 Q/k9ARFUR6JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCak4/lAAKCRCIgE5vWV1S
 MgC0D/9EB/lGjZgB6dbelePtnyOsjC2haV2h6OkN2vGF0Nu+yPgaGMEOAcv217k+w4byZn9re54
 62OQ4lQQ0pSD0/329QijKx2ALqdJv1K5zGzjFZRQrRsinZHtwNGF76jFudbvToWsneG5lBy8GXm
 6ynHtHO7gj4UjB72ukZF3x3Pa0T7aXJTusds4JqMuOwTd6Mc+mHbFPxeilWiaLyCLB3eTASs1i5
 YhhoUqOY1gPJ+wGylbnGzFa4ldNuokx1vvSm9nJ631PFyQxNlo4iV5ONp/pwimmcSBPiqnkKUOW
 xd1uTKLxRUjK5e5lcINMS1HC+im0h6P3INTLwKuZmGg4cQrPHOoP+g0yy4AfqntAJESqGI+uVa6
 2skTPtFbMov0hZGpW0XKgFDokrYUr4KkxFfy+MdRMdmpjJoUX7HzbtZ1rHNmnfNInNxSllmskJ/
 rtBWfkOYPby97qplgtdgCbxAvFSUwXrw6If679jcqcq+3d/79v0psOSOdSpiA2zU6gqZUoGkZMm
 gE+JBbvDKHOtGiXINcFF8kF7ccAMP66Icr7vnH1CwUxHeTZS5jWQmi97j0S2G6i7Oaca/PCMVBX
 AncZPfSP0z2XDj5fCQ2bCIQyOHdZF3cCKLrZ6TvdApxTumGsEm9xyHB8x8Xp5cAsg0jFJ64aIz8
 oAEbyziSuLOWQCg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_051646_792609_4A20C517 
X-CRM114-Status: GOOD (  15.36  )
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
 include/linux/i2c.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c..c5ba07f03ada 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -729,6 +729,9 @@ struct i2c_adapter_quirks {
 /*
  * i2c_adapter is the structure used to identify a physical i2c bus along
  * with the access algorithms necessary to access it.
+ *
+ * @set_clk_freq: Set clock frequency for the adapter. Returns the actual set frequency.
+ *      This function is optional.
  */
 struct i2c_adapter {
 	struct module *owner;
@@ -742,6 +745,8 @@ struct i2c_adapter {
 	struct rt_mutex mux_lock;
 
 	int timeout;			/* in jiffies */
+	u32 clock_hz;			/* bus clock speed */
+	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_hz); /* Optional */
 	int retries;
 	struct device dev;		/* the adapter device */
 	unsigned long locked_flags;	/* owned by the I2C core */

-- 
2.54.0


