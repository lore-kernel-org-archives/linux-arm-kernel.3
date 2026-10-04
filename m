Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424B2CA5FEF
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 06:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAbS6Ry1BsMnnYJR5/R26PS2NZwQTbS36NknU/TPiuk=; b=29DP6m2Z1PC7P3+0ZN7AQN1DEQ
	BquU504nF6ZRJKhC8FWSOaQLZEObKbD3NRfqoILQZUoabKD5wfqGIcdShrW7G8+ft5ouBV6eZpuk5
	g+4+pPbvowi5bKBLYQR0RSr8bZ/m6RjTqB/PuABQvKqP+RdbaiuypLRdqijSDpNOEsFHDb71CMm4+
	a0N3GZlk6duH1qMKSYyoUJrgCPDFUaqRrZG3/HzHtthnhmJI3L4WS1oEoDbetcKabU/Xd/MngYlCI
	XD+6qDtJGFyhWGc+u6smNh1zH2LtN1jxG0WnbqMzXBYEBUfHXUp5TTq+4WJ/b+WtoLC9CZptqGWtf
	GjxuY+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLH-0000000ENJN-1n8g;
	Sun, 04 Oct 2026 06:04:59 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLB-0000000ENH5-2pxA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 06:04:58 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so595271a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 23:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093893; x=1791698693; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAbS6Ry1BsMnnYJR5/R26PS2NZwQTbS36NknU/TPiuk=;
        b=cmbNZfyMYEm9Y1H3w0lokXSd2nnjaW0Nd0olVPhFRPbq47/esfwpm5zIJmXhbh0l/n
         VThQGq1xKywonMxtPcNWjuOlg5UeJsJoJVNfO9RRWro5ny/IwDO908Pl3HGJtMb3ATvZ
         4ooYsYdniJawzgK6hmUoZABB0Z/UVWE88jf8BoCPQ08gin/EsCZ3tGHNFQwKp96k3tfw
         2Qvo6kBWnlhxfF5qiK7hQ9vyla07Le/93k2Dqe6QJPILZ85WG9KR2OCTNHyVpOnMJhYz
         Bkn9fmzlZNcmwqwHqPXERPRcGzcqqhxpZezT8aVZ+j5752VJtJWLMe8WLTPCxakn9kvm
         d9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093893; x=1791698693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OAbS6Ry1BsMnnYJR5/R26PS2NZwQTbS36NknU/TPiuk=;
        b=PRGrT9FdIJyDLStWhN5Gn08gZPNPBDy8upqmjP+EZ9O38ySxuZgekfarv2fpxROn3/
         WcneCsnGSMUvu4bd7TtX0oaV9bROjDtBZUjqKRI1CJmKEuKoKmiHBhH4kjEkR3nHxtw8
         X/+DAU9fyTgaHwaRr52u9/sxvTPG5qfGiZNckSjyxDIE/Wtu0EV864IO8ewXAqrW/4bA
         K0HZE0yaFlFfoKX22/BayzQHWuoFDpr3NCBlPyXu7YmMBZFfqbMYc7Rnvxn8v8mI8KBB
         sGnraGHKcKEiJMEBbjRP7Gihhiz2Lkn7BkxuXA6tmaX0MIJgDhoRffBQhz3v4wxnuIb6
         UHjg==
X-Forwarded-Encrypted: i=1; AKwUvByfCMO6nrR5V10Jm1cD+FwrqskbnDQiKvYc2tGiCtuMPM47Vw+MwtrnvPkKUe5xwuas+XISFi7f8RkiyoujyjYY@lists.infradead.org
X-Gm-Message-State: AFq9FYLINXqVPYQNieeyqk61q2te4l3yns50HU+jP2Q3YvoXEQxdfsFT
	DVbpWSKbU1BJLepFRruoHZA/Lb+vBy8Z/vDYKuKg6QU+HU2klZ7FN7/c
X-Gm-Gg: AYBFou3d0qQNUUvFcC20d3JqaaxwOs+LhT0BRNGl+spHMqnR1s2050P76QFIQOFTEVE
	eoyTiY9esLv09n3y5SU9SGZ89kU4I0x/+HdK+a3/E3FFQW9YAAUWHqmh0vzNAtbk2I3imxLQ6Yp
	Yc83StZL/uDdYvC0+LhlA3GmuO7Z9YyvGIQCaebQWd+CAtUbTjScMURkDryNfit4umTANSt8Itp
	XxbcG2FTW2dD6rRy1a9Av0S4FownflvKYwSf/1WlaOE3Z9HCc/WLtIe0zpcCx1NUoe0b6yjd28u
	izjNo5oPSClvWiMU31sWbchNwIqtZqlRWoDulyjDrF/zs38UuuiReW9590XqThOwynXR1TvGoam
	B2pWVI0CBUsS02DpVqzh8SlmE0vOJXRIgPWOo7L7HtiPgFA6818EefbvimxikcJGwVqFGkcbKeG
	W6/EwwrItEfPRkrf4i2E3zMha8J2ynBR61Y3PGqhket9si3td1Ec4SYUTjz8rK3V5afRy6CWfGq
	xFkaOkV2D5hvBpT0G9jO+9olIWdRvXkpsIm2nP7+sQD6ZIhX2fW6OqBDmT2pgnZtjezTzbOpHP5
	U53hGw7f60/cibuwGFH78gNpdth5T3BTjLBgVtJyMEeVvms=
X-Received: by 2002:a17:90b:1fce:b0:3a7:f45:5cb4 with SMTP id 98e67ed59e1d1-3a70f4567cfmr3377395a91.26.1791093893061;
        Sat, 03 Oct 2026 23:04:53 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:04:52 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:29 +1000
Subject: [PATCH v2 02/21] ASoC: dt-bindings: cs42l42: Do not require chip
 power supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-2-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=853;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=sNwquOknKR60E7qr2ALmDm6xoE+cnxL/XwbQaJrtHA0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Qcf6e/dmXwp77y4Lcv86eFfgvnVs47fDFu24L67
 mtu71cu6JjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1XjFGhhmGhdzFc/juOUVIeuyPiu5Z17TyhPiD4v0ezvfWXI1df5rhf815z4L
 A1HMdWqW/dt0u23Wm2JnNsO/ln7tnspkVu3je8wAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230454_702181_4592C5F0 
X-CRM114-Status: GOOD (  10.43  )
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

Some integrators do not expose the power rails connected to the codec
in a way that can be expressed in the Devicetree. Do not require them
to be specified on such platforms.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l42.yaml   | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index ab4c7d22dc0e..6c100cb36699 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -187,11 +187,6 @@ properties:
 required:
   - compatible
   - reg
-  - VP-supply
-  - VCP-supply
-  - VD_FILT-supply
-  - VL-supply
-  - VA-supply
 
 additionalProperties: false
 

-- 
2.55.0


