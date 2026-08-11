Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33E3C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 12:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dA0DiMJYo6Co7ip9aLY71U3LlTdqy5LziCnokKFtcGE=; b=fhqvrjUI6P/CeixY8rKG37XICp
	7C9gmS3mheh/Af1c5bZJdI/3fftbJK5zoYK/IUmIBDtYOQPMGIrFpBk2hSG6xZhc+V2O1La8TVG6k
	UCoR7MBX02dBpu7g/MiaucS6NTHZBpSv2VshzzWMLX3k0q0Vv6qPzMXNR7YIVnZkxG3NtLoErD2yr
	6e7y1ABNENPA6JShGIR1FDJ7nxOALR7sAKh/0cGyIhFQo9yXzn0T00ejVwxgJyA2Q9RFtJGfqyuY0
	MslXY/auPp+5i2lzL9RNe0j4KjaGCoUmVk3I6qkzn0EfbLczm+rvPXBe0/r0ENB+n35HONNDDgAys
	E4VFMb3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlU0-0000000E0dE-3lO4;
	Tue, 11 Aug 2026 12:21:28 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTe-0000000E0M0-438H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 12:21:15 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso3313695b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 05:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450866; x=1787055666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dA0DiMJYo6Co7ip9aLY71U3LlTdqy5LziCnokKFtcGE=;
        b=TCtCV5gjHeXquJqn2tIvJGLvg4yHdSmFc8lzIYgqgfTvsZQmr+QeakWTjH4hHwwYed
         /FD0MyTvs3DqiyurA5hZP3PJ2pgJJNT5op3ZsbjUxesNdH7GKJkmNLKZUtiW9zykjy+A
         ofoTnnsVJvgfp2LSmgMfLC3bNbiwrtWwsLquA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450866; x=1787055666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dA0DiMJYo6Co7ip9aLY71U3LlTdqy5LziCnokKFtcGE=;
        b=oYY4ENfksMWrqOfjclOA2TdYhkXbVaUWMD+lYFI15flMBxuWn0OES8RQs/3CcGvpKO
         hlvDlqVU3b1q+tH7evepcg9HbJePP1N1woZV4nCAT3szW0cd6Rkh4TLd4LQBRTbZ/e61
         /AlOoE6EH97hiCd2yf49TFxCL9ViqiP6vyUTqXhNFGTvb4zPX8G0izZcoL3XYyojgnkw
         UgldsSTXXADQ/mw8XefTjiYF2iLYv+HxUtmQYYHJNg7Gg0kTmLqkqj17BPFi/5yOoPQ0
         G41VGjLscoZFq0KIqoFNrGEQQNgubjvW0deqPcCrrAuQmAlxxh2tRnYzOrUhqPqv5N9U
         /lyA==
X-Forwarded-Encrypted: i=1; AHgh+RpqDyEzM98GVYKtRTXHKN/m15AYiCIxzAMtCsHFwTQj3EMPcgNngSvSE0UHbDXHsJfxAVA0A1axXEeQXKlLEIUy@lists.infradead.org
X-Gm-Message-State: AOJu0YyOX/y84Zv5PkTtJAy5elYCzBoqlR21nU2wuzjCYCdA9i+aXe9Z
	ewJc6+GXlFxd6s4CVGnc3fK4PHunEDqfPTmFrVa1DDYzfXLo6otkBHPVlAvP9zs61w==
X-Gm-Gg: AR+sD12UrSfpB9NHg1PkCURqLcHLpNyJGzRsXv9S8I3H0JFk+rVTmMyTGn5Tw2zTSB9
	IVAGJ9Zk3Ml3U3WDjbdSUJODR9LXca5PBK5eTflR92K62xjdJdsTI35OvkExb/c5tqK7qOpoa2i
	CbWFBQDD3eko0TQ5heStcyr1A8xqFVydJ0yRV4t9vet5VFRa3sE9RDYOgK7/Mzq2F+/edcAWcYy
	4Xfn8q/KfSu0t8IcfeZRxEs5PLIEy9qSim2toQn4nUpFpZDMgY9rZjImkqh9ofA+Pszp88M0Upi
	eZlDofr3g9ix5IEp1OWfdi+y9L2c1mxOOp3awoxbQN8phEOGK4mVj/TIG1dissYo92JoovYFqUF
	NrCppKyBbs541TwL/GrjwRearXFD8d9kpywJBk9lb3ZdwqvkmQ2L8M/Lg4tVs5EuPykmWvhgV5l
	/ImE8ITe4txTfJqToTS2yvjfJZ0GZJKEae24ShyJ3gBYme2cGPRUsxTa75seEl0YObMROPSSMIN
	RmfKF0sJYOeKzU39r+5zrLpcQFbUGZpDU7qnNJLdSdx/w==
X-Received: by 2002:a05:6a00:181b:b0:847:8504:9946 with SMTP id d2e1a72fcca58-84fa882d05emr2571459b3a.25.1786450866341;
        Tue, 11 Aug 2026 05:21:06 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:21:05 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/9] platform/chrome: of_hw_prober: Add delay for hana trackpads
Date: Tue, 11 Aug 2026 20:20:07 +0800
Message-ID: <20260811122011.3539250-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_052110_874300_9579EFCB 
X-CRM114-Status: GOOD (  18.51  )
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

Up until now, the MT8173 elm/hana device tree has set the dedicated
regulator supplying the trackpad as always-on, simply because the Elan
driver was missing proper delays. As a result the delay for the
Synaptics trackpad was also omitted, as it was not strictly required
under such a model and delayed the availability of the trackpad to the
user.

The Elan driver recently gained proper delays after power-up, with
adaptive skipping of the delay if the regulator was originally
on. The I2C HID driver and I2C OF component prober library gained
similar adaptive delay skipping. The device tree will be fixed to have
the regulator not be always on, and proper post-power-on delay time
added to the I2C HID device.

Also add the post-power-on delay to the ChromeOS OF component prober,
so that if the regulator is off at the time of probing, the prober knows
to wait for the hardware to initialize.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index 8562a0e89dc6..54d8941617e2 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -70,10 +70,8 @@ static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
 		/*
 		 * ELAN trackpad needs 2 ms for H/W init and 100 ms for F/W init.
 		 * Synaptics trackpad needs 100 ms.
-		 * However, the regulator is set to "always-on", presumably to
-		 * avoid this delay. The ELAN driver is also missing delays.
 		 */
-		.post_power_on_delay_ms = 0,
+		.post_power_on_delay_ms = 110,
 	},
 };
 
-- 
2.55.0.679.g6767b8d81c-goog


