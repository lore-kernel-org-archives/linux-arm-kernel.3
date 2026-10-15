Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70525CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 11:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+QorVKMJYnLkrPsErRwwCkJsDT8x7ezxaNNbTsRw5I=; b=mEWM+4KiXpJXsAPXxSG1ets5Ud
	Lt164DIHe7+NokXNte7yHQlPycmOUuBuz++BSGAL8l4TlBFodPkxCV1Xvz2SG6Ia8MplSewxvlZje
	jpRBpN7W3nq9xAasbHkXELesN5fLKe9lKXbtLkZddAkPbiS2LPkCu8LJ66C6z+WBNg4IMIm+Segzc
	mXX1X5u1pEQ4nwLwWZohOos2WFRMuKFzZu9KA0To5tjQHphmItyXjV8mElnurtiPbrLWNcVhtLGe/
	0iVc82yQfafKTD+JnQ41lcvIejS8fgfy/bgVX3oNKLFLG3kcwF93uDRdfJn0h8YFnGvogH13rIeoT
	L5iz2rug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJEQ-0000000HVc1-3aF4;
	Thu, 15 Oct 2026 11:02:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJEN-0000000HVaJ-2oRO
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 11:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=y+QorVKMJYnLkrPsErRwwCkJsDT8x7ezxaNNbTsRw5I=; b=Jrqq1ZLQfuMGyp2D7mSntVJQNf
	uIb3kKLBg92tb55vqX7/A97UrfY+UoNagARa9tBm7G7WH3o1LAT7s06tluaPOnnsd0XrHRgAFpy0g
	6ZhHaILEnwXiEJD015CvS2xm201VU6X709GoQEjDTTWIkopMRB1GZzNq21Z7ZzsF0ilFs5w5rVbYT
	qDiWZTejBjAzrdlXn6MdyhbIVol2EVIP4K7CcH4eq5p1rNcyOVrhTde6H3SQqn/kauoHLrCixgGHF
	iPOv25fkgdgqwALgZlis7TfkJevqZGYvSG36R0os7ScuYTQ3ZBtXu4XijP856kl+6NuUvUj7QCrZj
	MvdJOPZQ==;
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHJEK-00000000HSS-2pp2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 11:02:38 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5be3db57938so446276e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 04:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062155; x=1792666955; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+QorVKMJYnLkrPsErRwwCkJsDT8x7ezxaNNbTsRw5I=;
        b=noAflkrawWWzvLq7vB8PE4GsdHtiZ82+DaHRRSpPhkVKcmRyOwZXhNrJaC2lyWcX+M
         WWSOuhpqgItG0cMmSI9SX4o/MzAdKK41Mw8PS5v/8ZogLsLN6fUb+DKznA8nz0wIEdND
         pTjQPoDoFJjJGCYfSCgVVjX1qJ47KZKoEjHgTOQiF7n/jG1ur5jshccR6qJpYtIHKd/k
         ta+8QI9xPetX3abnGneKnZqXEEaM/GpFqaJKiQmt9NKYMATWju4+l/UVrkWmsAj0Le6y
         E9+7dTlcIzNV3pIlbeJUlOwoPB/FnXhw2/NRlLgDhbq3ChO0UqbcP+FcvtUGbGwsNZ/T
         pX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062155; x=1792666955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+QorVKMJYnLkrPsErRwwCkJsDT8x7ezxaNNbTsRw5I=;
        b=uiTo4FVdnqis4DrfdmtvdzfC34oc8PdrbXKEX8ip3OlpdKHewPEhp0+gaoI/RRuCCz
         hvtgFz54V+N5cW1/WJYCyuMjWLmjwMuu4kb6kKGvqUgGg650XlxfXSwXAQ+hB5APASFN
         nWrJtdUl6sxtPARPWoYksQ76hUTEzL3GS1yAlctkGpXZv/XcAp0B4LCZCqdqbHaoiT1Q
         rJ0OdhlyUsx9Yaxxb8Outs+5+SNqkAAVTVTGUwQY6tDd3KeqcSttVDKpv4C0OD9r2vQJ
         uIHAqSiexIZF16IuUlNSDXFma7ih+dc5b1/IgRwv+aZA5X+Jhi0s14mEKUYCw9EgRVN2
         fPUw==
X-Forwarded-Encrypted: i=1; AKwUvByTYmJnyyOa+GRHzg6SNnw6yiRSZxfKOu0CjgXjCQCB2fiopHrDnmcA5RrGiZaflJV8CtcXSDQM1eqy3z47zx8M@lists.infradead.org
X-Gm-Message-State: AFq9FYIwAg9wBlDWet8bodIG1cEQ2/glJpxFUBf8MifB/75lMpTOB2T7
	q1Yr2BP4aq++YFdqvP723vH5qcekscCc2/1xTvj3GIi7JE6HPdBFUm1lg26DsWwL
X-Gm-Gg: AYBFou2sNzdNqsoHlD4e1pDEpS6kVWBWb2RUNdYFp4A0F53+EiqLXbFvgoTJ2F3Q+8w
	IVwR79XqKEM+eLxEecbY7FhSDTdqWGb2HDx15nySi8NfAdKhRSdODinUzPSS8fuMX5AgGwNnk6X
	sfrsjdI8jZeZY4OzFH2UavUPPqYNp74Pzh2EP4TLPeYf3LmgA8kymEKVcpExRZHyYPw07vpxR2F
	5as+RIjfpUL/IejxwxWBxk2jzMuA9ORRi0QAZswjAfHqXS7BUXCOMvOx9tquK8WB0mCRFnhFDVF
	mMmY9Qqq8Nrgs/E3IpiMvBdYiUtf7KbpMhl6dR28zIXgcnnj7+bhGjeYyY+O8qjNlI/6J/rYhYn
	WeMjdfPPDMoMLOvTPDBDT3ZxiUsDypwEu6LkVF3J5GqAtnlQip0KU+VeQSO/J8nLn31V3KUT4Zi
	HQmizKAGMk+A33NinDE23FzqlGxeP698KD7YZmM+9ewtx6x9KOzSdDHSWblYPeDpbvfxgxjWzRh
	15rf72gYuyvrkDYhm0OlplAy5gLVQF89NLjGJQ+E/9Lnpxdq5U9rR9zIXVogA==
X-Received: by 2002:a05:6512:4404:b0:5b8:999f:718b with SMTP id 2adb3069b0e04-5bcea0c31b7mr4505668e87.12.1792062154506;
        Thu, 15 Oct 2026 04:02:34 -0700 (PDT)
Received: from [192.168.1.135] (81-229-40-193-no2450.tbcn.telia.com. [81.229.40.193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3739b5d1sm905465e87.22.2026.10.15.04.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:02:33 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 15 Oct 2026 13:01:49 +0200
Subject: [PATCH v13 2/8] i2c: mux: add idle_state property to i2c_mux_core
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-i2c-mux-v13-2-778a12cfe93b@gmail.com>
References: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
In-Reply-To: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3427;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=PydZrvt86mLHkEgBvRO47u3zMGloSwDUhiZhopFMTMw=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBq0LKoIcY9A9AvCh5SSkNgUH2sA6MzgWGCpMpJD
 E06xQD8236JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCatCyqAAKCRCIgE5vWV1S
 MlhuD/sHP9hzPuDbWoiGI5oiApoeF7AO5OTE+Ih2rYrBbQSQTnM3aUCaCY9EoRwpHw7s4NxTcDc
 Ng8jOu840EZ6aLEei9FlV0T3ibI65xxQ8FDrACZzOc8t26wIT3Pp3I3B/kEhhJ7IjedJxnxwJ2M
 XMdcJtmJuY4LkuGyYg6qs+2jtObGtKHZyjS+948NTUXXOhur05lfDw0ItuT/ipgsDLS3ARS636k
 jUIl9DL4dAZcBVQAySS4dqZNiEhzHZ4oQwKrnebhnggOEcqHM/kZPiT0ixJzBIDDlHDifHnHVw0
 v4AwNrmX5hHJsL9EXKyRssYut5636uyoCORAavn1lfBJTul8ldre6RrzJe8Xim8tn2TUENm7pxx
 IhC0pTYYS5+5lVc5NWAhh1Em7v8Tbcyi1DTdD6buIF/uet2V2I/DFyyfeVbnD6O+7lmBLfsqKSn
 b6ZSzblNKKNWlDav3tFH7nGNOufo89epKLFWQbPPLrUIOV1XPCez9vUNeRvsphkJ1H3bfBQE62B
 /+HzmxudhAkV6ydctNGhcm+ZI6aHHhnLmjuSO2OWCVifk7Kz03kLSFDiGXKUX9TVTLumWGRQ2dp
 9L5yX6Gim8QwZx91chiubHWKYZh78CkloOtBj8b/082kwHMZo0Bf0h8fsVdnuygz/XmESsx4TE0
 LHaiyT3mh9pvkgQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_120236_905415_E740F9CA 
X-CRM114-Status: GOOD (  18.59  )
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

Possible idle states are:
 - I2C_MUX_IDLE_AS_IS: Leave channels as is when idle
 - I2C_MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
 - I2C_MUX_IDLE_UNKNOWN: Unknown idle state
 - <n>: Enable channel n (starting from 0) when idle"

Default value is set to I2C_MUX_IDLE_UNKNOWN.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/i2c-mux.c   |  1 +
 include/linux/i2c-mux.h | 57 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 53428098ddc7..94cc019b222f 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -248,6 +248,7 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
 	muxc->select = select;
 	muxc->deselect = deselect;
 	muxc->max_adapters = max_adapters;
+	muxc->idle_state = I2C_MUX_IDLE_UNKNOWN;
 
 	return muxc;
 }
diff --git a/include/linux/i2c-mux.h b/include/linux/i2c-mux.h
index 1784ac7afb11..17690f4f0dbe 100644
--- a/include/linux/i2c-mux.h
+++ b/include/linux/i2c-mux.h
@@ -14,6 +14,11 @@
 #ifdef __KERNEL__
 
 #include <linux/bitops.h>
+#include <linux/i2c.h>
+
+#define I2C_MUX_IDLE_AS_IS      (-1)
+#define I2C_MUX_IDLE_DISCONNECT (-2)
+#define I2C_MUX_IDLE_UNKNOWN	(-3)
 
 struct i2c_mux_core {
 	struct i2c_adapter *parent;
@@ -22,6 +27,18 @@ struct i2c_mux_core {
 	unsigned int arbitrator:1;
 	unsigned int gate:1;
 
+	/*
+	 * The mux state used by the driver when idle.
+	 * Possible idle states are:
+	 *  - I2C_MUX_IDLE_AS_IS: Leave channels as is when idle
+	 *  - I2C_MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
+	 *  - I2C_MUX_IDLE_UNKNOWN: Unknown idle state
+	 *  - <n>: Enable channel n (starting from 0) when idle"
+	 *
+	 * Default value is set to I2C_MUX_IDLE_UNKNOWN.
+	 */
+	int idle_state;
+
 	void *priv;
 
 	int (*select)(struct i2c_mux_core *, u32 chan_id);
@@ -38,6 +55,46 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
 				   int (*select)(struct i2c_mux_core *, u32),
 				   int (*deselect)(struct i2c_mux_core *, u32));
 
+static inline int i2c_mux_set_idle_state(struct i2c_mux_core *muxc, int state)
+{
+	switch (state) {
+	case I2C_MUX_IDLE_AS_IS:
+	case I2C_MUX_IDLE_UNKNOWN:
+		for (int i = 0; i < muxc->num_adapters; i++) {
+			/*
+			 * idle_state is incompatible with channels that have a
+			 * different clock frequency than the parent adapter.
+			 */
+			if (muxc->adapter[i]->clock_Hz != muxc->parent->clock_Hz)
+				return -EINVAL;
+		}
+		break;
+
+	case I2C_MUX_IDLE_DISCONNECT:
+		break;
+
+	default:
+		if (state < 0 || state >= muxc->num_adapters)
+			return -EINVAL;
+
+		/*
+		 * idle_state cannot select a channel with a different clock
+		 * frequency than the parent adapter.
+		 */
+		if (muxc->adapter[state]->clock_Hz != muxc->parent->clock_Hz)
+			return -EINVAL;
+		break;
+	}
+
+	muxc->idle_state = state;
+	return 0;
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
2.55.0


