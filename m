Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE876C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nn4Lhwi6wj905Yh1K+BGwOU5DNtShR8+dwNym0HIX8=; b=B7UItcuVxtfdlKFIgBy31yB5Wf
	jroKFzw5hK+yAHDmjDA8gXwfYSwsHrLiNEto4IPgxB0iEqEjIf0u84vb9hL5xInbL4seWDqX/T/QD
	6GwX/2DOU33OMNhwflqEJxvRu3myhv/VhFbgaMpBuCENm6osgwNV++nw3NpcgBL9elSoaN6iySkjb
	q9NXl2D7V0BSapljkOgo/NvTs8Z8ks8aiNBa3ExxlfrWKE9puWxdmWwLLuIOp/kk7Nsurwd3VeyS1
	f7On+ycp9lfyI07FlK4DyobCcgvQkKALkWXBvLxMUq57oiyV+dFvNsOicsT+SlpVBzONcexBNUQrL
	OU1WIZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5RT-0000000CemZ-0Ocj;
	Wed, 30 Apr 2025 11:17:31 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4kS-0000000CXhp-2Twb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:33:05 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ace333d5f7bso1162443466b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 03:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009183; x=1746613983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nn4Lhwi6wj905Yh1K+BGwOU5DNtShR8+dwNym0HIX8=;
        b=n+m3ZUncC7Iv+YE/oxfdVLj8vfDPuSoS8Wpjci2sh97c5piIFhZl4ub4EOwLzustTt
         NidnFW65HkMFVa9JwgXTeIkUhor/Cb0f9SVl47l7McT8M+Y3JWRjTj8b8mw6doQw4L4v
         a3Dd3SbVvTAx8Yf2S1IcUgEcJ5UTv54Kj2hwYdlK3Bum/DYwdqMrdJU//Y4h16Huh4/t
         14sXasBbxZz1IuUEPiKd/Uf0kAdJAzXV/p7tD3YcIzzaaUkp03VmQdJtc1AgXMwy0hBV
         vKklGiTFJxQ+o/iPgnBY34JsQWcDMAvKUrFzp6W01gqVXf1UCsb6+yUBuCIZzJcWl/XI
         CHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009183; x=1746613983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nn4Lhwi6wj905Yh1K+BGwOU5DNtShR8+dwNym0HIX8=;
        b=sviqK4aMq50GnNqQsX6CPMbjT01hBdXueSjBshg9Pp7cxj1xxMDhA0K8MzT9mjIfXS
         +ma1xvPa9qaCnTIIvj0hF9Wp9S9U7V/H9FqA59XxWtRqxypTW997A8a8DSY3t4HJkkS8
         EypfmGMlaYlZ0kfl1hV6A1gP8JOWPRX1GyxzeCj/Nkkz/ZJN/Ab6wo8/x7rjwl9ICQQv
         nWmjPmviSQwxJtGGRtwj9Uv8rfQfPHAdgFPuxkgSBWGDXUphsoE2yhPFbbHfEhHpkswm
         ZPA7SeaoRhxceAgupdLNNz+z4xTm8mImEGyfFYij/C2qoU4PYUVWwp6RPSAOXkUWJ7tQ
         fYwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp6cwfbCXDXHDc2XjCojlkz1/hlwKXLp/C9gryK/3waT/rC9kSWS4oR9j8eFUpK9W7kpJhIZYGK3JLdyy5KW6i@lists.infradead.org
X-Gm-Message-State: AOJu0YyZjwf3tR7a1j3Moje1tkyP6hi23V2tqiRfCtI1jWPN8JC31pqb
	Q/deHrLEJtfYEoXM0JTUCuOQtiI1eU+PGfyF03g6mf6aS3cGBpFy4XmBVBNZzik=
X-Gm-Gg: ASbGncuD3B7Hq4iqlfH2BjI8lIs91+nu5HS2trHIm/mhLHV+kzZsg9WAATsn+8M4wIK
	AhBp9CjnYW3xFZgU00yWWW7isWPncU1RYGhvQfolfKQKGPBYcaeEbvkinX/8tkPaxQkKvYaBE2p
	yYcIwwV9nNGXfLb5Z1sn7I6zB5pXZaQM6bfaNyrMy3QfrllAtoAAOiJ03YW/T/+N28FOYdjmazg
	SUisjKuZtxld33jlCrikVXbNNUVRnuVUBu22lZU03/Tx7SrjGEj5UoSF69p9E1Y8EWvlvhiqixJ
	UxfV3u+gweRzP+CVIxxTYrZb1YMruEIxhnI06MtOHu9M2dLfvGV4k9dWfITNGLEZ1nteYe0=
X-Google-Smtp-Source: AGHT+IH2N+37bdEAp6umDXJ/Tn+PS9iQBAS/tLfvtmUbmUfhbibyBqoqYkGkCT5w9FYdpi9e+fyJqg==
X-Received: by 2002:a17:906:c10d:b0:ace:6f8e:e857 with SMTP id a640c23a62f3a-acee1f240cfmr179989866b.0.1746009166269;
        Wed, 30 Apr 2025 03:32:46 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:32:45 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/8] soc: renesas: r9a08g045-sysc: Add max reg offset
Date: Wed, 30 Apr 2025 13:32:29 +0300
Message-ID: <20250430103236.3511989-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_033304_655080_0B6BF2D7 
X-CRM114-Status: UNSURE (   9.84  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add max register offset.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

This patch depends on https://lore.kernel.org/all/20250330214945.185725-2-john.madieu.xa@bp.renesas.com/


 drivers/soc/renesas/r9a08g045-sysc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/r9a08g045-sysc.c b/drivers/soc/renesas/r9a08g045-sysc.c
index f4db1431e036..2eea95531290 100644
--- a/drivers/soc/renesas/r9a08g045-sysc.c
+++ b/drivers/soc/renesas/r9a08g045-sysc.c
@@ -20,4 +20,5 @@ static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initc
 
 const struct rz_sysc_init_data rzg3s_sysc_init_data __initconst = {
 	.soc_id_init_data = &rzg3s_sysc_soc_id_init_data,
+	.max_register_offset = 0xe28,
 };
-- 
2.43.0


