Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01260C43211
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 13:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUR0v8eIPO1laa2TUdjOFv7kCYeCaDsPqFnvjV81+rA=; b=gOgJ5KdatHQbeNuv0cE+pXXlyW
	QzBi3YJPXXFysXiCuSPopHOcRcFXKA7/79hjY0Rhlud+wzbzD4etr9hiKppSmv0lQCPPtFi+xcdd9
	l/5Axdy/Wwq7x/CDki/GwrReFIehC3WlGM0oHAwf9LGst8b01iFjRzgoumCZtRQm0f381OLlfYBPD
	1158RVxwwygcswUCsiS7Jxo4KXBpBiBMHrjCdYmrdC1Nfucv8xtlvQKrM1GbfMVrSQuJ7cV3UEpxF
	VhWnh7wJP7Ajbmj2gCKLu+TYrsXvFnxW/nIvFSUDPoba++eiRYyRTlw4YooOQux07NFgATsMg/POq
	09kO9ZCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdSf9-0000000CU6h-3UPN;
	Sat, 27 Jun 2026 13:01:35 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdSf7-0000000CU60-26Jz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 13:01:34 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so13508995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782565291; x=1783170091; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUR0v8eIPO1laa2TUdjOFv7kCYeCaDsPqFnvjV81+rA=;
        b=q3KS3Vz5/z0jqhGSQR0VmyIciukWmKiTRRKTFqTLkAdw+ssOhIdRFVKb5nhwhQS95M
         OsnOu86CKjlICeS4BKFpQeagaK2yeqshaqGQ7RAa4HjjYTBMhwdSusdQET+GqYti5tKX
         efbyAE1dvfL03gxA4wXR3j78bRQbEv8/L+OeYemQXz0wcZctvB7ahcZm/OQf3b9ZoHpG
         98Gk7FxkHz+8xceiU9DWq9nl/LWhEfpyuAz6WvPEK6HVEqq9xAURPuQNQr/gMazw0qsr
         73EPpFjpLdQDk5Wf313rENBad7qKifZLIKywIlOH160en8dfjNXGH/kkFCd9XuLdDPmP
         pmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782565291; x=1783170091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kUR0v8eIPO1laa2TUdjOFv7kCYeCaDsPqFnvjV81+rA=;
        b=PdEvtT/4GIl+voZJzWjg4V9eDIVzVeio78yR9ErGz83c8Io7I8ztxbqA5Q0rxJ6W2O
         R4QqT+3ZwoxD7plMI+BG8+QObFmqgtlQ2ZNZsrrNXfSoIj4kTWZ0m4h43iyn7Af30vMT
         QThNQqWg6EHIbW/8f2TMGV6td3PPH0VVXX1deS57ucxUDB7OOU6asUfEQ9Ccr0CbMkMo
         FnQvrUg7S5wAQIX9ap8jCAmqonCBDNrBWGT7yUKDemLuHowP+ab3kY/KWh09JGBRKFg1
         oOIaKWMy4o9F8NNdbRGXvsQRa5xBJ7shRaZEXZi+0A/Lj+NjYWb1U2DjAtLVTWcJHf1b
         RHlQ==
X-Forwarded-Encrypted: i=1; AFNElJ9LZ8aH0wUL2wHkfLWNNGTBNyR+MJP78Wjfd2JnzLml+kuBSlzCOaTx/TjRKHcrxrSCIJTenZuFaQfkO9j28jlZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzyz+dUX6cLRK5k1mZheXVy0+mW+XSEfkoDXiMehIQ2ffjdaWsy
	jw7IdM72w1aSSbAR78lGndHEYYyyqQIVJiBtnmbmkvRoUKjfcFf4ICRR1QcMOeYRn4VG
X-Gm-Gg: AfdE7ckMR9BQ166n8nTXch8alrNFNzAQiN5NEPp5A5jCClYX9iRySY36NL47dRA1o2o
	Y+VYw4GbHP7ZP55k+XooD6StnXYnPz12fsNKvD08hadYs5y2raYc4J0v/mALQUuymBTgXaY1OX+
	WTexJaX2XLPbkb5bReFPYAwTIgOA2FFUM6sqD+SZl8NlClN74YhU5nHfYQAzIrbh9wPBCfxxTwD
	pEHHLSieyCUiu2QAmZe1PI0KiB2ide/kf/OLERgcbFXFGyCurr9Q7E8/t/RVuXRATeNDYFKXC/K
	ba+5Vnzr1J5t5qKmxmWX4vYIO1CXVL6/MOrSGGyxaMoD4zgbKvGyCAfbL4Wg/vt2ZZHvY2H3h5A
	kEJlPAsZi5IL99NAJuwcHxA/CPoxRv5cEioeaY18TbF5vKrK80/sKKr9HmFE+k+H+S5tuY1XYWl
	GnX/6qyi0RUnOxFJlsG4dguh3rfzUje8J0qkwT/HNQpHi1uKvfNSEOd+/Vv+9YP4e31jY6oFwp9
	LlhmNQfmZpw9QS+wVcsxGxUm/mekwZPnZ0=
X-Received: by 2002:a05:600c:e555:10b0:492:4a70:faaa with SMTP id 5b1f17b1804b1-4926685af4cmr112906525e9.11.1782565290833;
        Sat, 27 Jun 2026 06:01:30 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c00a34esm82809035e9.0.2026.06.27.06.01.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 06:01:29 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: Re: [PATCH 0/2] media: meson: vdec: fix two more VP9 reference-frame lifetime bugs
Date: Sat, 27 Jun 2026 15:01:26 +0200
Message-ID: <20260627130126.78749-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627065534.88527-1-doruk@0sec.ai>
References: <20260627065534.88527-1-doruk@0sec.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_060133_555962_B8B5D455 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
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

Please drop this series; both patches are wrong.

1/2 is mis-attributed: codec_vp9_flush_output() is the .drain handler and is
only followed by teardown (codec_vp9_stop), never a resume, so the "dangling
pointer on resume" path doesn't exist. The real stale-prev_frame deref is on
the source-change resume path, not flush.

2/2 fixes a real NULL deref but in the wrong place: the early return also skips
the current-frame MV-write register setup (HEVC_MPRED_MV_WR_START_ADDR /
HEVC_MPRED_MV_WPTR), leaving the hardware to DMA-write to a stale address.
Sashiko's review is correct. The right fix guards only the prev_frame reads
while keeping the cur_frame writes; I'll send that separately once tested.

The rm_noshow_frame() use-after-free ([PATCH v2] on the list) is independent
and unaffected.

Doruk

