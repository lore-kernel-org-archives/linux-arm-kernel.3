Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73ADEC44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 12:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dprxgYd134ZCbde7II6xEs/NYUu1NZeUWNqjC0nuXDg=; b=SDy4ZspB7rr76G9hxpSnFVQYf/
	KJx6r1v8PKz8O3HaJCNk+uGrfvz21kzi16qarIowu33tOpcbb11F94UtJCTQkfpwSXUD0vvcFRAG+
	4OC4gPNcmtuDkeb+5vK7ldNjqu4Mk5lblFu+kh/m8Y0eS2hznw3jZC9Y4Xxp8+U2ESvV/5gw/77oE
	V4PWgIDdjpokrIEREGklcwjJmR/U/Bp4tsvS1l9TsI1Vvm6HzRDT+3rZFGmSl4IB0do+/UlsxxOmB
	Z7gY6fNPVUum4ta8LCTBLrsdgx66yN/5+oMWsvbjsvD2R5EaS0nDtk3dJjutp9JChQSdjjALbfDTf
	JzLBCfyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRCv-0000000H5JK-050s;
	Wed, 08 Jul 2026 12:16:53 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRCq-0000000H5G6-2HEu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 12:16:49 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5b0117dda13so469821e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 05:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783513007; x=1784117807; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dprxgYd134ZCbde7II6xEs/NYUu1NZeUWNqjC0nuXDg=;
        b=XoUr2imEH6Wf2ni8sSXKHgONPQzZMoWWShdhdDkooI2oDmxAjRVgW+HU33i5b5dqyb
         7hMsGCp8whl1SfaqxmY+Q0Abv8L6OD3UVmXdRiD9nWFxZFp87PnkdQEQmQT30lGdW/Uf
         Yl5UPZxhewyf5xPpOhSjs9eJTFbn2Zs6q84Ey4DrgUi0Gw0bpF2olJ6EqC4k6IHqJOnz
         yxKg4rPNGMp22TFgLT4ZOMdHEVZOokwinRQOmDZt7cH5HOtXpljNt8U2bXIR18v6fb2T
         0dzgDbGi6zGdyfveKzRXUsPxwuMNLZvbwhZywyA6wpGxgVkVAp8HIEPVnbLvSlwP17MK
         7CRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513007; x=1784117807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dprxgYd134ZCbde7II6xEs/NYUu1NZeUWNqjC0nuXDg=;
        b=QdlGjuukgaYzUubr5Kwofsf3DtK8xMZIDN3PIhYSS9oTi2fwj23Tk3Gzfc8LkxKKgV
         19zT8TIiEO1+r8mdFah7r4sntUW2ht2mQXhLn9lctvRPm51oBATMzNR84LgPud4F3Kg1
         AVH9VDPSdvHnnvRgRJVb3p0fYG4Bs/gq07S3WBuArLEMl0XXI9LGhbl8nnJ8Th7xe+M0
         Fk+qOydLEQh0KXdwgro730LkPOVC9CLgagtMiTsbsDHI5Qd95EZTVSNk1oU6GIqf+dH1
         8Gp2TmMh2ok10W4L7jO/Vcp9Vy77YbPvQKYYCwOH9pvfa2wxMQP9aSRbwvMghMlpUBSi
         dPDA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/hMkLBoTb1laI15n9SJXdSACf8h+Omd8ZlL3Xg3QdIz2+Z6b7YgKC677vkaEhzwp3RdNu6RI5665tFQiAjbw3@lists.infradead.org
X-Gm-Message-State: AOJu0YzlwTNGqLglEZMeJ/RDY20TR2hPfwqifRt/TVmxpfhi0zSS3NCl
	wl1xWviQt2BbKVYghSGOC5JSJEmz8OazbulyXfOHUEa7afLqFEriSy7syXEZDlfarlM=
X-Gm-Gg: AfdE7clc9OETJ9vFWPflyw70lSbsZTS4dYiqAa7wxmmWcfRCoZj1cEdjEyR0fYxeeDg
	U8SZ9yVLF7xYcvSEaddcCYqqAuCBFGGCH42soD4S8OfEhHGGQO05A8ms6M8Msr5O7JSeHdrTuR4
	I/QIN7ULDUmy9WibfqpsJ6E2DvBVcRHlw0lzSqovP7FiMtIrbsjWvtX67Jy866NX5h9A+MABnXL
	J/swNaWew84CLz/Opbtoh4g1UkmK55wLpqonfTnRwG/kHRjlo+FkZB8ICaBi9BY7ButLBKDpEba
	r0tmK5C8TUrkvHoeoOgDaMNH/Z/rBAEVMbLiD124Gt0JhZp9iJt8aiJU+hgmQNgYqiOnLadnGLw
	LZO4azN/1dwhqZJ6rM4Xh23RU+jrAgfFGZZLp7LBYUt8QUMxRWMuzGoPRtxGhn6HhVGrWla8Xgb
	IVcUEpek5JGyuihdA+QmCLf/k9jvScYBZzDVyEjfbO4M7AR5MuT3EEEX20Tg==
X-Received: by 2002:a05:6512:a351:b0:5ae:ba7a:1790 with SMTP id 2adb3069b0e04-5b011463d96mr446741e87.11.1783513006560;
        Wed, 08 Jul 2026 05:16:46 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbc6sm4471459e87.41.2026.07.08.05.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:16:46 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 08 Jul 2026 14:16:14 +0200
Subject: [PATCH v10 2/7] i2c: mux: add idle_state property to i2c_mux_core
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-i2c-mux-v10-2-09dca03c8a15@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=vnuM7kAv6UZYVTKxBCbKpa+2q5drZUiYDWWf72AF6A4=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBqTj+ZIeiEY9dQXZiMT2fIww5fOHHhJFEr56Zm6
 ckTIvC184uJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCak4/mQAKCRCIgE5vWV1S
 MlTYEAC03316kkiScZ6WDaKlYfKvfC96yu4poE+QyJ50unYADe31KxTTRvmM+iMhIXKZPdQ93AU
 Zu+pEEDfIBy+/Q3v8Ks+9NI1OKtVbexmzkVZcvoZtgpArn2zPYTcrQZW+y4siq3O+suCfCDWIWc
 RqvAC0mFykVipVHtnSf+vm+mffOZOGIDS6FBhPTbcEzSxqRJsUtMX2C368QXMB78qskG//WOHQ4
 pbn8j8U0f8DGGcKoGZ7OknatGCL+lq8x0Bz7rJ+CLxsfUn2EZy77/Asa+pXkLIBje5GaxstDATS
 p4rLw0/dkZLoqp8KI8FvipT79c12eFsgO1xUqqnrz2RYl6199suUiz2BCn0fvnfi1aAFC/AYY1B
 7+M2Sif7XNhEUSsLZNnU2nZ79L0Qp7g7ILSQ2SanN+79beBBvKlqx/zA8M4RkaWWkynnjse6n+N
 5UGSB8almhq5Dmxe6+bI/+p6YjxkG99E7PSEmJ85g4jaC+KcQIOEPXZqB0dOSNh/l7zQbCj+T2+
 1A9taM/fatS+K3Ae5ZGjjRS46DaxJq2iMua0IrtaJQZGRgAlYqWB0LA6C3HwBzvEXVQYrKX7pFW
 JpKem+qgKaa8BmI45utBZl0jnLIQvv4UnLhiQv6E6cDEIBkGX7He63rCc9ffoBNqrg9QN2vC/Pq
 2wJqQkqqrPufyTw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_051648_618777_F5E02188 
X-CRM114-Status: GOOD (  14.04  )
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

Muxes treat their channels differently when idle.
Let the mux core have this information to make it available for
internal use.
Reuse the same state values used by CONFIG_MULTIPLEXER.

Possible idle states are:
- MUX_IDLE_AS_IS: Leave channels as is when idle
- MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
- <n>: Enable channel n when idle

Default value is set to MUX_IDLE_AS_IS.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/i2c-mux.c   |  1 +
 include/linux/i2c-mux.h | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 681a201c239b..edf16683dc83 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -247,6 +247,7 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
 	muxc->select = select;
 	muxc->deselect = deselect;
 	muxc->max_adapters = max_adapters;
+	muxc->idle_state = MUX_IDLE_AS_IS;
 
 	return muxc;
 }
diff --git a/include/linux/i2c-mux.h b/include/linux/i2c-mux.h
index 1784ac7afb11..624fadbaa703 100644
--- a/include/linux/i2c-mux.h
+++ b/include/linux/i2c-mux.h
@@ -13,6 +13,7 @@
 
 #ifdef __KERNEL__
 
+#include <dt-bindings/mux/mux.h>
 #include <linux/bitops.h>
 
 struct i2c_mux_core {
@@ -22,6 +23,17 @@ struct i2c_mux_core {
 	unsigned int arbitrator:1;
 	unsigned int gate:1;
 
+	/*
+	 * The mux controller state to use when inactive.
+	 * Possible idle states are:
+	 *  - MUX_IDLE_AS_IS: Leave channels as is when idle
+	 *  - MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
+	 *  - <n>: Enable channel n when idle
+	 *
+	 * Default value is set to MUX_IDLE_AS_IS.
+	 */
+	int idle_state;
+
 	void *priv;
 
 	int (*select)(struct i2c_mux_core *, u32 chan_id);
@@ -38,6 +50,20 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
 				   int (*select)(struct i2c_mux_core *, u32),
 				   int (*deselect)(struct i2c_mux_core *, u32));
 
+/*
+ * Mux drivers may only change idle_state, and may only do so
+ * between allocation and registration of the mux controller.
+ */
+static inline void i2c_mux_set_idle_state(struct i2c_mux_core *muxc, int state)
+{
+	muxc->idle_state = state;
+}
+
+static inline int i2c_mux_idle_state(struct i2c_mux_core *muxc)
+{
+	return muxc->idle_state;
+}
+
 /* flags for i2c_mux_alloc */
 #define I2C_MUX_LOCKED     BIT(0)
 #define I2C_MUX_ARBITRATOR BIT(1)

-- 
2.54.0


