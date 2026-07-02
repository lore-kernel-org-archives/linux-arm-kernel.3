Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1298C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOLhbH57Fit41sYED3YzTSdJ1tqwyQs+QYySkLyPWHY=; b=C8+pZa+arjKWNyolMmuEz+wc8+
	vvMNY6ciwCJN+V5d+VUs5Yv79Q/kLsa1DK/d959ypo+h0g3f4gm9c5vCHvgE/8D702SHHkXheL6SO
	cy+dhQakvdZCLgSDK4Rgvlj/yGboAVqQQ61Dluqp0eWeFiZVV/yGAc9Jl4jS2BQpcA3Ns4ZQwQrQA
	nmWms2uPmVFSs4LR5pOjUwzXYFdSMBsWt2pRRfobo3PsoxA5nxhswZLoafkEUMGYRcOyNcaKalDwq
	6IFqgwFDigKrmbEjrdQXP29OArvbpVS/53lYd2tbSKc+qfQIXeGBRZUYljK4vwT/piLmHVUNax6jk
	ZotCndIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfF6M-00000004FB4-3pI3;
	Thu, 02 Jul 2026 10:57:02 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfF6H-00000004F4N-0jep
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 10:57:01 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so6845035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782989815; x=1783594615; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOLhbH57Fit41sYED3YzTSdJ1tqwyQs+QYySkLyPWHY=;
        b=pIbXXNVtSLG2AJCJIdb8/XcvOub3sI6kNQSwkBYa8vi2fET351Mv7Oq00EkKNesjPt
         HECycgQSxOYc8cGUKDYHEnJaQ8oT5gpJ2ZQux24Eydem2O2Qxsn99EH0kBvgM4x8WMzT
         qmd1MauCtU2A1et3DJP9iaEZppsKZjMRMQlRQUy1MLbMjuoYAdW1ZRYZWcCe0uHFKhPu
         l0099MGiFvwGojAlGIlKmqfK5x24e5EHQQI+zQIGJwGrN9JmriYOHu+Su/4YFd0aIPt1
         a9VwbASMOK+SOejfBNJOOQPSWSA9Ru0pN+wBqtDLSB4RdHUtwMr1Wb3tQIF3cPl6Xk9V
         T9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989815; x=1783594615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MOLhbH57Fit41sYED3YzTSdJ1tqwyQs+QYySkLyPWHY=;
        b=EnK6ZizUSn/1uxx0yHgBDoFXKZnp2nzUlg5qwEmX+0Ua7vS/ZB6zzujvDROvPsT9a3
         lZUaHnYR70aSbjTBth2IXWlzLP0uS9VMBvKUwWspyxssrQldI54pRZDdkqJoPuv1ePxG
         4CN08IWvzCQ9PvbrjiUEEUQf8b7kqeVi7EdHcGoBrFMp47ASMOvoAaUsdYsFEMlCRf8M
         sXnyIwF4VZ+0eoyAdGm71U0pa4clmVOf6Sx9ZpotpUU6xiHzzYIcoXGKsK6TAkTH598/
         nRjhBz0T63rCq8U6Uqs6a2hCJq+NZ/GllbU6iUN1ugB67Z1JWp1bWe6wTNEzHwHd0C3e
         XmIw==
X-Forwarded-Encrypted: i=1; AFNElJ8wEd7FaxSKiJbIRyGwSBucQH1kGWQRUb6PW2NE40CkjkgaS2liluOTi35S7Vf6fpCvnvyIJkW61IwTstINp9Ax@lists.infradead.org
X-Gm-Message-State: AOJu0Yz96ycEOWfTnwwMSRFGzfPWZQ2jy4vS8YXMGiztgIF9RRvdEDo+
	fkW86yuujWs5KOnJIDhdKTV6saxJE1TMl7JqiQS/6LHE6pFekueAtgL6ThfwA0rS/18=
X-Gm-Gg: AfdE7cmse43kMCstxsmycS0j38TFeMJ21WMZMGB7m498DxYlWNKXYM9hj6gG/SUbXFU
	b5rLRGPUUrVU3eIj/Ful5Qlfrin5elwgfFvub5HkrudqohxqnPGYkq/H0rtQpVu2t6ggYzuXXvU
	G3fUHgliR0jRkagqjUcT+o24sFwbls7YOqIuRTx/mjjgVvW+DGi/dh1coUOudOJehyvsqjBgt0h
	8hAxyX3Y2moTnma0rxOC6qb056lb5wjM21dO8aZ9OjwigxMbz6nVhc0oOyVT1Az6q0xjOKlr1Rl
	MAPNtZbegL9YeTIexI//5YWw4p8RutwpzGLq3udKv8egpLVBNJ++F+THASWTD/84S8PmelWNZ05
	PFBCmzPiP93EVBbsIqQKgxIXbrL7SFYbODyQ/mSMt39xw8Q8W/nH/uhz/4oeKvIGbCklWz0wrR/
	kE8go4A5fzpF2NFAUHknRn
X-Received: by 2002:a05:600c:37c6:b0:493:a5d0:d1a1 with SMTP id 5b1f17b1804b1-493c3cfb686mr59304145e9.31.1782989815167;
        Thu, 02 Jul 2026 03:56:55 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6372a31sm42649685e9.13.2026.07.02.03.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:56:54 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 02 Jul 2026 12:56:40 +0200
Subject: [PATCH 1/2] ASoC: meson: gx-formatter: prepare on attach
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-fix-24-bit-i2s-playback-v1-1-bcd3a43fe32a@baylibre.com>
References: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
In-Reply-To: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3733; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=KNk3Ydn1EVAsr7JuVTIdcH5PBqVqNrLHBwSrm2suX8o=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFluzl/iFTavmra14WhqXMnXrbxNBk/2/k6/8truOttr7
 433nHwzOkpZGMS4GGTFFFlYpt/7XVCq9tA44WQBzBxWJpAhDFycAjCRdF5Ghu/JHjWfhbg6W5m3
 9D5fqc7o+MxCw8TxeWv9pXM/V3VuucPwP8LksofO6uO6l6pcH7nU8XxUK1Kc3Pp3XegvkW+vwnK
 l+AE=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_035657_252419_364F2842 
X-CRM114-Status: GOOD (  23.23  )
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

Instead of calling the formatter driver prepare and enable at the same
time when 'gx_stream_start' is called (which happens at trigger time),
split the operation in 2: prepare is called when the widget is powered
up, whereas enable is kept on 'gx_stream_start'.

This resolves a problem related to i2s playback in 24-bit mode. Commit
c7852d2dcf66 ("ASoC: meson: aiu: align I2S design to the AXG one") moved
the content of what was once called 'aiu_encoder_i2s_setup_desc' from
'aiu-encoder-i2s' to 'aiu-formatter-i2s'.

'aiu_encoder_i2s_setup_desc' was basically accomplishing two tasks:
- reset the i2s pipeline.
- configure number of channels and physical samples width.
Before being moved 'aiu_encoder_i2s_setup_desc' was called in the encoder
DAI 'hw_params()', whereas after the move it is called at trigger time
('aiu_encoder_i2s_trigger'->'gx_stream_start' -> 'gx_formatter_enable' ->
'aiu_formatter_i2s_prepare').

In parallel 'aiu-fifo-i2s' (DAI FE) already performs the very same reset
of the pipeline at trigger time in 'aiu_fifo_i2s_trigger' and then it
triggers the playback.

Since the DAI triggering order is the default one (FE before BE) this
means that the pipeline reset happens when the BE already did it and
started the playback. This cause the 24-bit playback mode to be
corrupted.

This commit re-orders operations so that 'aiu_formatter_i2s_prepare' is
called after DAIs' prepare, but before triggering them.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-formatter.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/sound/soc/meson/gx-formatter.c b/sound/soc/meson/gx-formatter.c
index 311e63affb23..c7333f624b15 100644
--- a/sound/soc/meson/gx-formatter.c
+++ b/sound/soc/meson/gx-formatter.c
@@ -15,27 +15,38 @@ struct gx_formatter {
 	struct gx_stream *stream;
 	const struct gx_formatter_driver *drv;
 	bool enabled;
+	bool prepared;
 	struct regmap *map;
 };
 
-static int gx_formatter_enable(struct gx_formatter *formatter)
+static int gx_formatter_prepare(struct gx_formatter *formatter)
 {
 	int ret;
 
-	/* Do nothing if the formatter is already enabled */
-	if (formatter->enabled)
+	if (formatter->prepared)
 		return 0;
 
 	/* Setup the stream parameter in the formatter */
 	if (formatter->drv->ops->prepare) {
 		ret = formatter->drv->ops->prepare(formatter->map,
-					   formatter->drv->quirks,
-					   formatter->stream);
+						   formatter->drv->quirks,
+						   formatter->stream);
 		if (ret)
 			return ret;
 	}
 
-	/* Finally, actually enable the formatter */
+	formatter->prepared = true;
+
+	return 0;
+}
+
+static int gx_formatter_enable(struct gx_formatter *formatter)
+{
+	/* Do nothing if the formatter is already enabled */
+	if (formatter->enabled)
+		return 0;
+
+	/* Enable the formatter */
 	if (formatter->drv->ops->enable)
 		formatter->drv->ops->enable(formatter->map);
 
@@ -63,6 +74,12 @@ static int gx_formatter_attach(struct gx_formatter *formatter)
 
 	mutex_lock(&ts->lock);
 
+	ret = gx_formatter_prepare(formatter);
+	if (ret) {
+		pr_err("failed to prepare the formatter\n");
+		goto out;
+	}
+
 	/* Catch up if the stream is already running when we attach */
 	if (ts->ready) {
 		ret = gx_formatter_enable(formatter);
@@ -87,9 +104,9 @@ static void gx_formatter_detach(struct gx_formatter *formatter)
 
 	mutex_lock(&ts->lock);
 	list_del(&formatter->list);
-	mutex_unlock(&ts->lock);
-
 	gx_formatter_disable(formatter);
+	formatter->prepared = false;
+	mutex_unlock(&ts->lock);
 }
 
 static int gx_formatter_power_up(struct gx_formatter *formatter,

-- 
2.47.3


