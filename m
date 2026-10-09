Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26370CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 16:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdgP+LEBhWdZ6XqNXqiPHmxSydOTb01rv311lK+N6t4=; b=Z5LRI3FmWn6c5nIn/vqT0zvwvy
	lJH5ogmcGhrQiapF6BPMCJ9Awe3tw1IJnV+zACMr9Yhj/u8YXV43tRJNAS/Amxtr7QBteWE4AEIgk
	J9XtDcwjemoFKigOz6CB50TzYLxzSdwZScs3z9/U5yL2Hk7mCtYyIGUZRtSwqrvRTU2n0J/oIABn0
	kkYY7VXzNQLnPwh74yVSf1tFO6hrVcVn3Kr1Ij77SelVc1RkEiCbJFaDeClrCPwLV5RDd5g3povXJ
	GozkhYdPk7ES8gslXNDtWxpf5I95jMwOTgy+iRlNZ/QTO/IMgvcE9N5sumrnYPhLVRGtomm3OkkAA
	+fCJkB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDZT-00000006fGq-2Y6u;
	Fri, 09 Oct 2026 16:35:49 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDZQ-00000006fGF-2jpv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:35:46 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso356885e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 09:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791563743; x=1792168543; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vdgP+LEBhWdZ6XqNXqiPHmxSydOTb01rv311lK+N6t4=;
        b=lEtEBk2a7H0caxJP+2Vl/cz6nkmSVRv5RVqrUg3oAe7VAIKDW+jJ41RtMpVl4W4pUk
         WrQpaQVqnTOLz3KCjz2n2N1LDGtcJzgIWjyVaT/x5JV9UJ0+CcHjZfAPtK2bYdsIsfFj
         3QZPQDOTBVSC8j6Ms7J7QBrNIwRibLSbNb4hUOs4Af5bilwmiiIFaM4uJcBey3J6Tffi
         5FcpaBzZt3YbbH8Il6Rwj0PneOdjLZ4ULEl8ssDf9qsfVRqcoK0EHiQQn2sxuXezXms0
         9KH7yQqfR3DXzo+3NVxzvmAlq9TIm3IQ6xJrSc7NayOoWbYg0q47a4e0PBz3WKHQuXr9
         XddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791563743; x=1792168543;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdgP+LEBhWdZ6XqNXqiPHmxSydOTb01rv311lK+N6t4=;
        b=kCJhTBCQbtgzvpwyV5HScnMVnjmwxO7OoUWnw+3vELiV8vsN6g8wogk45R71hNGKJ9
         TSewslPD4pQXaTv7+MUKoq6XvzTMvWc6Mypi8xH7mTZasWTT4D+SiuFMpcFBMwySWv0B
         4QLEvI/H/Vt6s2Sj750QZsV4/zKn/m9puDilfwEp/AAg0iJDEmYIHbIs2l5X26sttd2Q
         ul9IC96txNGgpHHVmGqCf1h/6wNB3qVh0EqHUpLfr8BJZbM5/YJn+eNNP3Pt17wEmB86
         FEJDcnd89UjGEu4MzxG3UUCLtcKyefiSH8ifnxfXHvLc8+ZKByBiMiIHHHBXHFYfbb2X
         /0/g==
X-Forwarded-Encrypted: i=1; AKwUvBxJeRZFzy7wSjV52q7TAvgsbt2lvA8yJelrrBkkbdNN7NeMp0zeWZ9GEdyZ8GMIjvhGNM1C21rihK7EAIlaImMN@lists.infradead.org
X-Gm-Message-State: AFuF++nX4s3bQMGBRI/Cmh9x2a4VkC2KaKuJo0XBqAubbB4uI8HWP4f3
	6qBbYrRAxZS9Nb+VpYuZD15sokAR84fHxQFySdcZrgyGJ9bbsC96sH9Km/xB6oRUbmI=
X-Gm-Gg: AYBFou11hpEi9JLELTNH1l7HJc0INrl5146CKDmjnD6HXfj3dFyEFG+fdtfGD2Em+8C
	EGK+tLvr0118us6Z8me5XA5M1AQcTAG+yuw+yBrSXeiTuMUpOx/aI3tRpNnnvwF+jhxdAfhVtCz
	A3vzhdX90Y5U5rT49ifAOW3DeIj73h55LC6YRODGMLpKjvz+thss4FefuPGV3MSvY38D5P8PrvH
	w0wMtBgz3WAPHgOy5dZmdfj68SLVovlbKCzB0QOTkKxXa92FOwe8kA9yzZke4JGBQhdH0SQ4Dwx
	GHZc3QoWeMY5JCOg7GXQyRh9MQdKJWA8J/D+ZrIWSFHaaAZIBNsbqUp8MEkLxNsTepx+sHd1/ZC
	lgYrLv2DFv+5e0Lkdlret/S6VZf18HL4oqcv5ojjK5fJ9C/reW7dKWbFVtQLmREpIPTAt7vFhbD
	kcNFcUtu+iEU8/6IHHPUhCY8xcpuXt9iqAW9PdjuRKiJvbyymAbZ4cY8vUaykNgiL9SHZ/WaLF/
	eLAAXse2CWvo/SBYw==
X-Received: by 2002:a05:600c:154c:b0:49e:74b6:740f with SMTP id 5b1f17b1804b1-4a18e4aa310mr46374285e9.17.1791563742740;
        Fri, 09 Oct 2026 09:35:42 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf0abcesm77676145e9.1.2026.10.09.09.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:35:36 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 0/1] clk: nuvoton: ma35d1-divider: use direct
 formula instead of divider table
From: Jerome Brunet <jbrunet@baylibre.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: sboyd@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com, 
 yclu4@nuvoton.com, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261008064307.2757324-1-a0987203069@gmail.com>
References: <20261008064307.2757324-1-a0987203069@gmail.com>
Date: Fri, 09 Oct 2026 18:35:25 +0200
Message-Id: <179156372588.266328.9518640684856472728.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=hXThr6zhVSCw7eyzumaxd3t+XIOLHCoMx09cTROxa1I=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknxa9c4Xp3chEv912jdY0Lyx62bFlyooVrXsa0g8q7m
 R3Utq3p7ihlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBE/mQz/A+f+3KnCVfj+dMr
 2jxPsrd8Ldkcxnt+f4NZrfZUgRUe8U4M/1PyMo7YLTddV/+/96D5CjnH+z26cqflddy9lhuyyxX
 msgIA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_093544_719801_17A98301 
X-CRM114-Status: GOOD (  18.30  )
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

> The MA35D1 ADC clock divider register implements a simple closed-form
> relation, rate = parent_rate / (2 * (N + 1)), but the driver models it
> by building a clk_div_table with one entry per possible divider value
> (up to 2^width entries) and feeding it through the generic
> divider_recalc_rate()/divider_determine_rate()/divider_get_val() helpers.
> Replace the table with direct arithmetic in recalc_rate()/determine_rate()/
> set_rate(), and drop the unused mask_bit mechanism, whose only call site
> passed a bitmask instead of a bit index, causing an out-of-range BIT()
> shift.
> 
> Changes in v2 (addressing the Sashiko AI review of v1):
> - Fix a possible division by zero: 2 * rate in determine_rate() and
>   set_rate() could overflow for very large requested rates, making the
>   divisor zero. Rates above parent_rate / 2 now short-circuit to a
>   divider of 1 before the multiplication.
> - Fix the mismatch between determine_rate() and set_rate(): both used
>   a ceiling to pick the divider, yet determine_rate() reported a
>   closest-rounded rate, so set_rate() could program a different divider
>   than the one promised. Both now use closest rounding, as the original
>   CLK_DIVIDER_ROUND_CLOSEST code did, via a single shared helper
>   (ma35d1_clkdiv_get_val()) that also clamps the divider to its valid
>   range.
> - Not changed: min_rate/max_rate are not checked in the driver, since
>   the clk core already applies them and the previous
>   divider_determine_rate() based code did not either.
>

A cover letter is not strictly necessary for a single patch,
if you have text or changelog, you can add it after the commit description,
after ---

-- 
Jerome


