Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD005C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 11:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0V+6zXu1ZixQJ8ktO5+SKn8z2jHgggq58T5gsH9x6kw=; b=Xcdufpk0BofGYKgjfRByhQCalh
	HKc5G95ki0X/x+8dH6+rZ6jqrnBhYF0eqra12ZvYcN6Jxhalf0u9mE19SA0RlqHipUsS2f4JnTMPr
	GawIeCK+NYLUoa+oOxno6Qk/mN+0gD7mOf7az0ur+JRkd5GXIorDFFnGmhJg4y3wtrsTyoncQpp9S
	G88f4jAtt3+QL+tlFX8dQUCmdkYYQwn/Bq7QHfdFLxVrBmBSe9MUiNErxoMSBeOqx02Ei48U01f1R
	vEKo0B7sSzmutBv6sU3sFVe544L//g4aj8n09yel3I0eeqPNnteTRgtQMfeHe2oJ+Lo+PZNNcnr1G
	LooTGbRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10Gg-00000009BLU-0N5t;
	Mon, 31 Aug 2026 11:33:38 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10Ga-00000009BIa-39sM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 11:33:35 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso2895731a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 04:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788176012; x=1788780812; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0V+6zXu1ZixQJ8ktO5+SKn8z2jHgggq58T5gsH9x6kw=;
        b=r29mvpwmmeO52Y301vvrudx1/Z+3Y/IEX7PKmKVojWhUfmYkm6m49seUPPneEKjHf2
         PPUkCjO4lANm4PnZACHgax93sVMYtzNufkx+DRA+6WEkAuooNsAiPq1FdPuUjCo8CaDy
         a/u+en8TWaTksm317/b5qT1UZgaTAY6ONYst9zBaUDHbPmnF5YYJwjF8YNhM09qAcQOc
         x4fpN226blqYy5Ici2Bkmm3MBedTQYxHCUhmxh8ig7qYxjdESmOsTY7OjbVc9IpEfMki
         3CtT9w0m1M51NvgRvfUaT14TcWzNYsT1orT9+J4UkYZYgnO6ubYNJNpQ62RFpneGmZoP
         zIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176012; x=1788780812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0V+6zXu1ZixQJ8ktO5+SKn8z2jHgggq58T5gsH9x6kw=;
        b=Ac/Aclj/OE1Sy/XVGiANKC4/7PkdQYdqVnA8BI064V6aob5s0782v8UOlGKNEWIgjV
         T0f6Ifc76q2KqnFctDcIocuP97tjfWfQKECaOAoUGdgQaV7aVH1KfyCNlGe85qlLTsr7
         gVaKKkQNWDxMMEEu3oLknfrPR+rtibHioTBDxLLtdONlZ97R0vnY42aMjVqUV2Et1WlM
         JK+rlcwMOHVvHZfYmDM186RwujTPZjaNlkv3MRkt1gK8UbGEtWMAr5fz+30oVyRUElke
         T/aSXtOOiwRJKtCJybt/kI4qVopwkOHojF5w1wPiR4VX59BFMtlq9d8oJdYFTlLt17Lg
         lfzA==
X-Gm-Message-State: AFuF++nCctaLRCoIqAvyrTpNOtXMeuF1+EIGx49HyomPc2iCTBEcLsQi
	go6H6mU/BEG+4TSlAPZP09FRtCKdrUirmWmqx5A8w2dwDJLoSHD8WPLQFp0hEg==
X-Gm-Gg: AYBFou0ufRhs93LS+rOLTlobCq0geGYx6U1OjPSWQsrSu9vJtSPb4MKmlt4uxJiCVAC
	wcGa+NNGs9lJFwDZ7o8helMmoMtm9aaROHdhiO15GduAIhURSwjhR1rIa65140Q9jfZc+xpqT5B
	7CV4JpLmoL467UzNgHC6mte/4/R6ZCYY2XckdttnxGhFFTVA8LVhDaJYuro349nB1IBIUtXX1Qu
	un7ZIp26o8NtlbmNltYsKwD6M76OSc7dVqYMj33LIe/UT7ui0unpLe7MyaBvR7cgI7SY9VRC9co
	NMiYwjxWdz+zSIVDzSg+oQmuBM/3cPWWsKSSww1PYSDOOF2Mqpntp4isAlzy+dEQ8y3rknZ872L
	/ryAMifMAhk6eSJDfGo3sVPEGg5NsXZRrMbpVoIk9DWa9JpYKI8NX19NJjGjQPxVSbIDCPU4S8A
	IVflNBRCLUgHMlx9lv0m/JER+tzZiA2Nx6PJhPss3kY7TLDBp1amwbrf5ajFgoLyTJ8gWWkQB0x
	kBcICwddm6FqkBpGgJaZlM8ig9+Oz3TYKk8HyiYQz0eQxSFwt9r2UnwgFXCogT4bewvkL+2ug0Y
	IpRPhuxkBzPlLnDs96FQeWRo1iNA299f8EKK
X-Received: by 2002:a17:90a:d646:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39907231958mr322558a91.0.1788176011913;
        Mon, 31 Aug 2026 04:33:31 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm34111826eec.9.2026.08.31.04.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:33:31 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 31 Aug 2026 21:32:41 +1000
Subject: [PATCH 3/3] ASoC: tas2770: Initialise SDZ GPIO low
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-apple-shared-gpio-v1-3-e855b12e18ce@gmail.com>
References: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
In-Reply-To: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=iTXhJnYnvUyhcSvEeSQQcBq1TiwCB1jc+QCIXDOLjsM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlT04p0ojMTfJ47b7SRnZUfffPPzFsJ2mILz5YKajz7v
 DCFiZO9YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNX7BBj+2Tuf7OX2/MlUtqT1y8kYbgfvZ2sehv49cGLzGy4/i/pnZYwME77mzdr
 ycp8ic9rElYYiz4IcBZ6ZaqXve/UiTX3N7LlBnAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_043334_185124_F5A4E8C6 
X-CRM114-Status: GOOD (  18.38  )
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

On Apple Silicon machines integrating TAS2770, the SDZ pin of all
codecs is connected to a shared GPIO line. The kernel's shared
GPIO infrastructure relies on the first change of the GPIO state
being marked as its "default" state, and allows any consumer of the
shared line to assert that state without consensus from other
consumers.

If the pin is initialised high, the shared GPIO core does not
allow the line to be asserted without consensus. This breaks
resuming from suspend on Apple Silicon machines; the driver attempts
to restore the codec's register state and fails because other
codecs are still holding the line low.

Initialise the SDZ GPIO low so that the first state change on probe
asserts it high, allowing any codec to pull the line up when
it needs to.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index e79754edac5c..ecc37d4ac00b 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -886,7 +886,7 @@ static int tas2770_parse_dt(struct device *dev, struct tas2770_priv *tas2770)
 	if (rc)
 		tas2770->pdm_slot = -1;
 
-	tas2770->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
+	tas2770->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_LOW);
 	if (IS_ERR(tas2770->sdz_gpio)) {
 		if (PTR_ERR(tas2770->sdz_gpio) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;

-- 
2.55.0


