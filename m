Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E88CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 06:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQvnHof+a1v1Eo43/K9+opNP6misBMbwYQ9JP0aPt9w=; b=UV8ECQYXv+mUshrJz+ZDHuv2Ro
	G5HiTrRvwKWH7paaXollcLH3zB5Y/m1f1R7yaeLga08gEYUHqtQQSFrwmU8GGWkDW++udGF7VHS+Y
	DyrqlaFw5jVuM9WUNcWwEHEULDwJeXDHFLDiu6A7Hd78BkOZNqq1perhAznWdVy50JtL490Zq4fPr
	P5braB9OGciViGH50lJFvyhHcdRHeYVDrgWZlbNZdLhSCtoaD2k7iTCkRHbJL9I2edLSE2ox11riH
	UWtdb4H8bPthmMlK8oFh/Nxw/oOPVGg5ed1WfsHtrV0ccFxA0VuY+tG7+SWJOLh5/X3eHYEf9SbnA
	BenFIfig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zvp-00000008woP-1iPY;
	Mon, 22 Sep 2025 06:21:49 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zvl-00000008wkT-2OoZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 06:21:46 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3696f1d5102so10868301fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 23:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758522103; x=1759126903; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQvnHof+a1v1Eo43/K9+opNP6misBMbwYQ9JP0aPt9w=;
        b=i4hu3vDYXANAt4doTSjE+dXiFVp35t3a5HQn+prraikTGMuAyXlYtzNYy7TFaqzD/t
         x8r2A52YlnvqrHa7z0ughdbObuA+ocKE3ej+1nDwecnWkTjA+NWaDTmXXCqwEF8zx4u+
         prXGpW8XBKG/k6wGFZYKI61i6MXkXoibp+KLShWuxvkjDaXQmvZqtbm1f7MSQbbf9+9U
         PFadLxRu2/rJXzdJvwsXP9gaiEqpP3pujnyEoucVDS4dLqex6zkhk1C1xvOok9mmhTcE
         WS846kmtBBycurjtX9elJai9shvMgfHBATazpQY2tnqe3tFfOMCS8HfTRgEdtIBjZL2N
         cg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758522103; x=1759126903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQvnHof+a1v1Eo43/K9+opNP6misBMbwYQ9JP0aPt9w=;
        b=nnbCtMu9JIDvjrET5+wTXKED26UkGCkL4bGPCxj1S9d6/z23Kyr+FtCgweM8OPA7Jj
         rx+5S4zNFFVfrzqv5Ul32obMnVpx+nXySRaGgbcXljvfxdAwtQNXAH9I8CuE8Wq/n3lE
         Lsz4uUYnzIV6f2hVY0Eeo0+7TekDS+kQSp2fJdn7GU1a2ZNZjURpJ5xW8dT4TMlpPlQT
         TnPlTJ7cfiAz5KH1v2FNwE3KfxDP4Y1/jRLnpEqUCZmKzrmxlvxzNGDU5ES9AZZCmQWY
         4zjLR0y5zAeUAoFcw/awsjW3QM4AEhGAAgZM8Mo2A9XQOcacN3b8R7nwSHL0+whesACv
         Z5bA==
X-Forwarded-Encrypted: i=1; AJvYcCXWXE0gjGos0icFC2HlPIux8eqxlkpxtIvyCE5zhSo6zNC+cJ+clDKYdqsAcyHGozhh93H3264Ht6P89dY9Mfx7@lists.infradead.org
X-Gm-Message-State: AOJu0YyYl5WbJ/ZQuaH5gEDtXD+036FxoeNGtudxOSODQeJkEs2eoFFF
	kYI4SWvdKNCRQf7Y/OjxF9BxVSWawcOz70ybXIYdqjmxH7IMfTJKjWvH6lk82eq6
X-Gm-Gg: ASbGncs9ZakzUKNDRswdxWltdvisF1ZPI3NTmm1GILRRkxR6RczBJcqnAbVuvzIRyks
	8e4RGNEpQ1VlQEuMe6BFy04+h2NL95nbFxYjj/11dzGFzCzz8gG3wcO8gskLLznYHmRQJ+oQcZQ
	kODqh70g71cuNPj0JNpTHdARdS3ESwQKBJMz+JtKjM8FKfxh6Vgu9mjR5A+HWbwev7Cqcm9o27C
	mYDgoZPM0e96kreutXkT6+9F9nkXZalKVRumIL7ucwWme57JJplcn+ohk4je5bGld0bEs3/hPrN
	+VfKYB3ot/9ICGoI/mAmm69F5ITJZN6qRITz5eCycRSIDwbho1/eAbVw9iTkr6JOEruoDc0QByK
	lQNhPsh1zxduT5uCBCKuNbRD26RkE6j60aBhyHqqIg+Oc1+e0Bt8sAHfMYvX2qDG7/WI=
X-Google-Smtp-Source: AGHT+IEWX9HPunh3YhWgZ0OJpf6A7fWOFQJRUkGvS83H4cItQAhSmXJL+ooteVneLl47uCXET6TCdA==
X-Received: by 2002:a05:651c:235a:20b0:35e:b926:6a9d with SMTP id 38308e7fff4ca-3641ba80310mr35742121fa.32.1758522103183;
        Sun, 21 Sep 2025 23:21:43 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a99e99e6sm26982661fa.56.2025.09.21.23.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 23:21:42 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 22 Sep 2025 08:20:57 +0200
Subject: [PATCH RFC 2/7] i2c: mux: add idle_state property to i2c_mux_core
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-i2c-mux-v1-2-28c94a610930@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2406;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=9bgM+F7I6nEBFXYeWO7UL9pGB4ld3ARupPlzJMnONCI=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo0OrTfjsniWp6URWZI3ApnyPsD8hApZoRIAM7A
 qI2Xt32A0+JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaNDq0wAKCRCIgE5vWV1S
 MhRgEAC24JGh3ARAKo2IuHAVAizurwI0LVGbgPTLOp+OuMCKJH2ti7is6Ni7R1PdOuI2QkMPf0F
 3V1Llz0v8ml/2axaF0X020StWV1zlx7ZXqrCHIepvG0DP2S1jVUXQ2LRRfZoAfOhzkB1v6yNBU+
 kluu4zCd6lPhMpQOzx/1fbsT9cRScclGTSnL+jGdDIQdP6bPhciANQnlQVgSLOkK7H5vc5uObrM
 21rWaoj24i+moR5Ty+YMoPX+8fTdelLGqf+JPQl44trRyXPo9t23pbFDdAxrA49Pxhetq5UsvJw
 lEb0Gc20/sG+m2C4ua+scQVO/fa/aeTiXPN/INQdKjsSRU0qH+1i0zOAL0QVgB9GkrCWkqWwKUt
 8HmQt5rTv1V+dls5Q0+igckCg0rcCQOzN/eL7Wwx5gEalLOUBLYcm04DGOQSTqIfRA5ePlzIfbv
 SY+/69JT9msuRKl3So16O0vrjKazP1P0u+ZaUY3Hy93RymzI+qutLHJuCByu7CFvr0rKvz8BtFH
 RXEBFv0cLojjXWhV/TPSSSSk5cQ02Cnpx9aaV8rkHGcQUNUHOh+n4CuTXygWFJzyYlxKaJNCURZ
 J4ZBGP5FgMQIFXAQ41qfy1crDEoZxg9ssaInr6eivS36tjhFIWaiAHYmxkrhHZOjD6Bob3j5CdP
 yvK0IZpMDl6Lpkg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_232145_642358_9A12AF2D 
X-CRM114-Status: GOOD (  14.17  )
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
 include/linux/i2c-mux.h | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 4d8690981a55dc0e1b35454971923791e6ed9f7f..5caa927c0caae512af029f0d1ae9b7f845ba3f6f 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -250,6 +250,7 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
 	muxc->select = select;
 	muxc->deselect = deselect;
 	muxc->max_adapters = max_adapters;
+	muxc->idle_state = MUX_IDLE_AS_IS;
 
 	return muxc;
 }
diff --git a/include/linux/i2c-mux.h b/include/linux/i2c-mux.h
index 1784ac7afb116ce64e9e9fca1ee127c2bbbd2fb9..9e230ad69377b74f9ec809c40ccffd95538c4595 100644
--- a/include/linux/i2c-mux.h
+++ b/include/linux/i2c-mux.h
@@ -13,6 +13,7 @@
 
 #ifdef __KERNEL__
 
+#include <dt-bindings/mux/mux.h>
 #include <linux/bitops.h>
 
 struct i2c_mux_core {
@@ -22,6 +23,12 @@ struct i2c_mux_core {
 	unsigned int arbitrator:1;
 	unsigned int gate:1;
 
+	/*
+	 * The mux controller state to use when inactive, or one
+	 * of MUX_IDLE_AS_IS and MUX_IDLE_DISCONNECT.
+	 */
+	int idle_state;
+
 	void *priv;
 
 	int (*select)(struct i2c_mux_core *, u32 chan_id);
@@ -38,6 +45,20 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
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
2.50.1


