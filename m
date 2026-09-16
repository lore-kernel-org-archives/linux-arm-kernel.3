Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FBAC88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 04:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=; b=hpV46cDx4aPULArP1JqvICrpj4
	cjFZyi1kHM5S5xyShE54PnJKMGKY7brQ5NpMRtvrwiKBiNZFfx3Y0svAlaGEMNDyuABZWUZbvWb6L
	R5rrqTMzG03A1HApFfyqzx0oEcBHpBzFaPSSAGCw2C+XweBp82u9L/fq+IWypWi4Vw3lTXFQ2vyXX
	j33Ov91Cpbj7nPozrMLzBnpD0gl0S18zHYrVRFhbxmmyryH9GD+TS+Q2PO9xx4uoR6zwUAT0Sv+yI
	C/3qvEDmBM9fEF1CS9LS1SLmVv0vjVwwtdVc3nxs6mmb5ozSHZDKji2HnTR952X3uGg343MUyw3iB
	RTGRamZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6h3f-00000008I5o-3x1B;
	Wed, 16 Sep 2026 04:15:43 +0000
Received: from mail-oo2-x0b.google.com ([2607:f8b0:4864:31::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6h3X-00000008I0e-1aWm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 04:15:36 +0000
Received: by mail-oo2-x0b.google.com with SMTP id 46e09a7af769-7f4ddb9adf4so2110073a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 21:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789532134; x=1790136934; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=H+fiDDJCGHI5iEG+ttlc41ZuK2tghnQeGFQfS/Ytosj4r9+YAaxeg/6g80AuMDO+mh
         Dd0flpA/gxkMwTtqOFU40ukHXxtu769MZBXYyQkr40AW14NVrWWbaxezpTs2HQkOqQJ4
         ML53Z482f4Ja/ZhdPMUVNmdRuK69kSLevFEiSBCR98Xw8eSZljk/Nh7D0QikKkE7UTFr
         XsqOV7unin8DYdhUGIzxwbUVuC+9Wbr+aPOfOB0UZhe1MTDG1fGnrDL/XMw7P9d00GTE
         4+ZTH+ab+oaKGUcwhHmIjylcVqj2qB6VjCiKfUnSlt11mjeLkKE+SjGGZjZz+VhJ3k1z
         euLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532134; x=1790136934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=0N1RuLPqCrI83R2S/2MM1gwRUsAlOTfhraVYu4tvDJ62HWQR4z+ktpgDN74fX/ZH1J
         9cNb7e+1DOVi7eNgCylP/afLKXMKK2BxJ7AapM41C1hLM9f0yHoVyASwlQRZBwGfXBX1
         ObavAZIbgXbaWpdYQ/33Fu/LIIZ4OhXU9QsFQg2XA6cc87+XNKWh5vPamV4rjSZNPL1C
         GAoJrYHJYxc2AcN6818Jzt6uKuNQaTXBJubThO5INp3pxzfsG0ayjKMuQWHr9N6+FSmu
         xbFPEsGq9RwlMUyL9A4YQ7bzzV3rw8F1BhinabGwq+67VFdfMW59uZBkbRFyOL67wnVQ
         eocw==
X-Forwarded-Encrypted: i=1; AKwUvByiOSlxffr1Q7fRGqa7bc8SLTSDcPqTMSZhmkfH4nwsYAFE/IoJhM5b0lSG0sZEaDvMvlT46wJFrDOBgbRRIMAb@lists.infradead.org
X-Gm-Message-State: AFuF++lQS5IaXK6c0bwWWw9ge/s/EfJoWOPaMdY1i+PjTyi1Tb/TtEc4
	smE1Qdh5Er9qctqCoSuMXrL4XD/1iQVQXuw51N3nMYNOQZ0+ckwY6/DT
X-Gm-Gg: AYBFou2lZkm1kvaHGAx0mWgkHtswisk3wRIY2dVVIKDfyOelUjKZ6e4a48soamFFQ07
	tTik33HOGAuzG9qWDVsQctnG2njInekLtoJ2KrUMvdRcQlhW18OleGLasqJ9D1p7v2gKt9RvAHS
	3qwEpVpBbcafVtceNa6pAIfx/25rwcNpzvtvdcSESGarnBbkRuBx/vFa5qsGA8EnPDKJ67NlD4l
	5hXbB55EfnagNDZHglGPoy09iLWd/YwmWh6fLlcrHwKFMZ8XsfYFyTlEso6/GVYNI5m2bVMuMRq
	hhqRA1JnEHQDy2XuIzTANQk4dttJ3VW0aCiTVQ2woIcbPYfD8THignQkvt0MeSwI5/h/13BQaqq
	5kEisDjH2xBbv0PJaE0iq8cv9dlqQ4dONnRytgdzqA9j4exlqsVcx/RcVE9AzHESkRJI/XulvOa
	17G9runCEXSFYoYNir1QUprZvqFhnqLfs3LBFscVYWsKKF+3u/qHzdAfFwhEgnP43RiIo=
X-Received: by 2002:a05:6830:a257:10b0:7f6:8bfc:ddff with SMTP id 46e09a7af769-80b2cdcbd2dmr963693a34.5.1789532134233;
        Tue, 15 Sep 2026 21:15:34 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80b07ad0373sm1440484a34.26.2026.09.15.21.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:15:32 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 15 Sep 2026 23:15:28 -0500
Subject: [PATCH 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-3-d35d2ac3d6f0@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789532127; l=822;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=1otP8UYV9viBZZ+f8NwjITACufQDeLB/kdjE9I9R9IM=;
 b=Qdf5f6KxhlBn6zznJXIHm5ylt2/6A7HbBfAy+GlK4uGnXRE5GEfZMjssKRRjN1v/McHSPhcj7
 o1QFlFIYqhHBqBAzYR+NCPtMKgwVYgLdEInxZcyBNZ1KMNPGeCtuh5w
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_211535_427468_84866AD7 
X-CRM114-Status: GOOD (  13.65  )
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

The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
devices array to allow the corresponding driver to probe using compatible
string.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 9ec951996588..5d5f816492aa 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -261,6 +261,9 @@ static const struct mfd_cell mt6359_devs[] = {
 
 static const struct mfd_cell mt6397_devs[] = {
 	{
+		.name = "mt6397-auxadc",
+		.of_compatible = "mediatek,mt6397-auxadc",
+	}, {
 		.name = "mt6397-rtc",
 		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
 		.resources = mt6397_rtc_resources,

-- 
2.55.0


