Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F93EC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 15:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/dbxaiPStg/QuX6EVqwVigaoYbaqasF56BIGaXeKFQo=; b=qRLTIDcs2AHYT7
	utX4aYQ796L2RcjNprQhSakVty1rHmYxkaF7iwChtsB4nhJGJ6NH0NgNtiheQsGCKcOy71QglkM5M
	Q8yTtKEJZZpEZ1n5oJ8MYB4aBAOVw4Tl82wYKqu5RC7b9LaidkvVl1ROuBrmBC/jVJpptdXp4eq1t
	0fk7+MBmQGKFWMUFXx1awsA36HUQRKMpNfExWppHvdvbQVKdKZ2e8523QthRz0Ng3+nrx+63RvXc7
	VPRWzw9zVDEVdLklBG8q7yjHrqbfMSJgamUt3RsVU4x0sm6ulpyVtWS8QhOBRf+ZD4YANaxz/r+Z9
	kZQi7jLyOz4ZFVc3/Hxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FGW-000000059rw-3hDZ;
	Sun, 06 Sep 2026 15:58:44 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FGU-000000059rd-28wP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 15:58:43 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ceab75934dso25818135ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788710321; x=1789315121; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/dbxaiPStg/QuX6EVqwVigaoYbaqasF56BIGaXeKFQo=;
        b=O/RC4xZjNjGTwig29HR2nzOvWcolvi1fuAHGokayqfx3GQLjlK5mHbue7v0NsFe2/L
         j+qgqaLRL8AZHj0pu4xkofwiZkL+2ypJFNTvaYge+I0ocGcJ7uwl7YBzOGr1TULFOQP4
         ZExkvkLdc/aDBFln0HV5j616t3ODvQN8s1FEdPTe/XT69RkUGLR1KGi4T0jmGEVZzSX4
         JjD5XfWlVAXL1YuJ+MetU/SnI1LmC3cMNIGFsKdpLw5leI+00EDaIlmagSmwjDGgpe3g
         AoMVFtm5U6Mm7st7ZPInYkfPls2UDhWzrg7qJftFlVSMmgFjirexLCKogL3fkAn6+2Mo
         7NSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788710321; x=1789315121;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/dbxaiPStg/QuX6EVqwVigaoYbaqasF56BIGaXeKFQo=;
        b=PwEvD3hvYHxAMD7K2AKZBwDhqbSwHo0+UKFQDaO48xFPAyk5V6dupqjP+XG1c1y3P8
         iEzEC7CkE6yP+SsnqEzfC+qPiS01YkILyzXNy/4fKNFR6oqby5RPQ1eavCWcBoI9Kiwv
         HCx/wYa11F/c5O6p2SN45FchxN8Ci/TLp4N2inxfQSVikpUX7ufL3vL2L2Liz5e1uo8d
         ESubgurKXS9jZbDpgkGt4JN5sqw+gMOOdLNGvmgEoQqnQZclIHi4YmMdcxs6jGhpoVze
         kuJ9UYBugyx47+Pa7v95oeMyVE8ZR8EKQg24aBQpbwZq6rJiW7XUmP3FEgRcskVKDUYe
         i6zQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHC71dMxv0JD1Pr3Y9OYDqEh71BmGkH0Ty2OmX+D8ocCqOcBeORKbHHDLeKU3RZKp71xDyN9Z6aj9xCtkNz0d6@lists.infradead.org
X-Gm-Message-State: AFuF++mweEoYnkvmlwJHwbIpzXRD4o7OpTT4+U5AhQXmNGadhkXJ+FoB
	XlG3+7Q3Bw6rqYCqlwKmydOkV4wJox4bjdcRJjbA1FwW4lyfkUpv49b7
X-Gm-Gg: AYBFou0PGxZyDQp/swnAWj9OI5VUNvIfSRAjqPfdHO3S9/b43AaG4yBUScLwYyeg8PU
	0CR1SpMceYFBiiDla90ZPohlrMKANFn5as37YcUYCNpN974+O3qxRVP7yjb1bs67KnMp7gjcgQx
	hVDQjFhjL/3CBskFZq/oGoBdWj9WDMR8rVfS/ZVszJKBIPoQPSWBEw3pTSkRU4ZHyWzl20Ikf/Y
	5wa6DbK5yrP1D5X2M/AdWiIs6MC67sS2KHMTu/kHPXJd7L5+bzl09YAHnfMBZ09SiNfjxRheUsT
	MGknP/miRdS8njgJBhl5NqGaCpfMtSuEbrCvM07qXmG8t87OnjxNl0e62Kr2Nl9S7xE+8yWPkWB
	l7y64YnFq70OJ+XExK5ol40ShYYVUYo7YyjNazO0S2yG3XkZ+kwFCVAby3iip3+M6+MxXulVg2/
	LrqMMol7vHm16BCVmczMYD+5WSqES96nI8rmKUa9ia69SnGGpLiLPH48o6SDuvBfjdKFZA/CI3B
	rGUbzHAciLOtv8DXdLCr549pYy+X85DyCOj2Sg2bMyArSWXSpf0wevGEVJAeR76TS8=
X-Received: by 2002:a17:90b:57d0:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-39b260d28eamr26240194a91.1.1788710321449;
        Sun, 06 Sep 2026 08:58:41 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260f64ecsm15941401a91.8.2026.09.06.08.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 08:58:41 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH 0/2] iio: adc: sun4i-gpadc-iio: two fixes
Date: Sun, 06 Sep 2026 23:58:33 +0800
Message-Id: <20260906-gpadc-v1-0-92d3dc8ef355@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwMz3fSCxJRk3RQTwyRLM5MUizRDcyWg2oKi1LTMCrA50bEQfnFpUlZ
 qcglIs1JtLQDWtQlxaQAAAA==
X-Change-ID: 20260906-gpadc-d41b964d8f17
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Quentin Schulz <quentin.schulz@free-electrons.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>, Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788710316; l=477;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=K8U4gG3AQblf7ICtp1xRLfTb5Hvus1HZE7hzEe6OtnU=;
 b=KKdnvVHGc9z66Nr5HNx4ntRPqRtsqEijnBCzDHcZaEUJXlQxGGQqVwgyS6ym5BVtkrrzwfg//
 vFo8QEpNRFWCBfN3nxQpm1Vo5vSvRI+QU5qCcDHZdotA0ms+izqTQNT
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_085842_581913_EBD9A148 
X-CRM114-Status: UNSURE (   7.97  )
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

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Felix Gu (2):
      iio: adc: sun4i-gpadc-iio: drop underflowing pm_runtime_put() calls
      iio: adc: sun4i-gpadc-iio: clean up on thermal zone registration failure

 drivers/iio/adc/sun4i-gpadc-iio.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
---
base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
change-id: 20260906-gpadc-d41b964d8f17

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


