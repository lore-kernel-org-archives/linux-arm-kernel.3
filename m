Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF130CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 06:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSCXO5ebFzrbDFffOZrTB5SiL0l0DGtqGmy2MCgq5Cg=; b=bq6jNr8WF+6RemViF3Knlh9z5a
	hNn1ht0j1wpObDWaQ20ZMjdh1EhOfosWMn16K/4HXRtRnVJeO1yEFejqaLbqcPXDxVvwlsr9K66OV
	m+LWjrUm7Ipp8pLZrUNHp8reR5PNRasKnU7Qx/NswGQ46ZVzU8R8ReMj/CEAqzljb6hUjEy+2MIaJ
	9SbTik3nGcjY8aNjJHRnalF6S7Zi5vjjIM5PKL2RdoahT/9dI4H3wT2g5iS4DUjA4/mVEt8SBWT/3
	9TQbqmGwAHB2UpB8dxcYUaoFBc+5Z/OAoRlX0052KbRxHCgpvY2P7BBlXQVPlc9o0miYHX/ow5RC5
	rH7oyv0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLM-0000000ENNk-3079;
	Sun, 04 Oct 2026 06:05:04 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLJ-0000000ENKm-00UC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 06:05:02 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso529223a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 23:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093900; x=1791698700; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSCXO5ebFzrbDFffOZrTB5SiL0l0DGtqGmy2MCgq5Cg=;
        b=ZchvqLyWOdzYSRQTo5OLlHmW3DWUly7LSiGyoqySgRR3JMuZhfYe3KcVKRF29mbPZV
         fY5rprNC+gftsHVVtwr6NU+AztO3V1M+G3FggEomumsNlq/UTDh7IMsDx9oV/ohG5lY3
         dmducqZSnU0sP06JTBn80QZV8y+PWszHoUV7yDHXr2Atsa4mgK50B0lVjCPDUtQGRGvE
         YH4g/iMamC85jdukoHvzlveYs4tedkaE3FR8nVq1JOBqK6lsRBX5+Ny+JEjL8YIqOFcF
         7ab/S2tHLeu+ghRmk9wFlqH1B1LoFHMlVuL/MVE4E1R0eOGojunZl5zC8TVlytcZLgX5
         W2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093900; x=1791698700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSCXO5ebFzrbDFffOZrTB5SiL0l0DGtqGmy2MCgq5Cg=;
        b=VvIriaUXUqhv6bo0TCiuavaezSOuAjEMNUsG1/4fSMR5wD8Q5b+PLXKpTuZwrKfyt7
         nfkiNPL0VmtR0+U6s8HWuA/meX04BxxeNMbjO6kbny3FEg9TxX7dZ5NFx6HaS4KeyKa8
         ZBZdbhdjI3bsTlKsZDgYGXO4lKODbxmj+WBaAdHFsoOg+kF4HkYawOpjq2wm6pvaNJif
         MtsC/zzlbbn1ZmCyND6FcY0FafGcfrvCeqcSHyxdSsm6prAmrt6tpU1qYxfofULcJ2YD
         4OrUIsgNQvM51xRsvDCQFyT4gWZVXGbrFLYglLjD3rEVZICxwXo6lgpCFvGh6ohzyoCn
         AY8A==
X-Forwarded-Encrypted: i=1; AKwUvBzzI/LZNc20bX9li7Fb9xH0y3Q1/EBS5kJgPY2MWMcyBhy7hsKwqvi8nGs5FedA6d9uPBzUQ9nnpA5V/52YHI0x@lists.infradead.org
X-Gm-Message-State: AFq9FYKcbGlnoF2TRUnrdwX0W3rdJN2qC9tSmYIFTNoASuLIMngugOu9
	6F67gnvDvHfD+gqQRnVOMb+qHWvDQysfH0djwmYDLXwf1MIt2pc/NrkP
X-Gm-Gg: AYBFou16NBFIsk1w+pqvbfsxfU+puSdY1FInrSUaK1LdrYGhZ14lPumjmI3VNnaS4ha
	grKw7n24PIy1MVyS5Ipom9dCDDy92Cd1upxG+wcaaRyU3uSgcAL8UAxidH/I4oREk+NBrFaG5+O
	k23BRHh1cs1IUZio0YOSdnc63a04Jh22Jl+Gwk2TXK9Flech3kZ0hOeBGrIGZe0dwKwQXMtogO8
	XS/AgeyOxByfaT2nPID3SAmfPAjFOddpSGe0oL0kz7oXkr0NUn3TfROQkUQGzizJrACMOsBWUdS
	X1AjPcwGJC1GpnCbPpXfl/Ff1ZqBLXpk+qD0jKHGeXL5iwxVS0bHzXxpd9lelI841bXVHpM1fho
	/O/Ei7QXi55UkTmCfujGkCRDz48cmvW9vQWiCkMvVi4yFkwFStt2FqxBehTcy+31btMGjcsN0BU
	mb+fVUBRmA8nTYmoq0RbzJNsR9usWp8h4tzd/h1Ggb5bNhBOtzxzAV5gNNFXx8YSQtz6CcVEdcV
	0Wef9NUPrKQ/o4yYZYOtxuS3SobN/bebYrzXTZjRUqjUY22FWJiW3Ahgf4lnhgaO7Xp7+Vl4GKu
	9W6m+m5+z0KCytrqS2H9uoB74f669gxbX9BDejsvHY+gB8xP
X-Received: by 2002:a17:90a:c2cc:b0:3a4:e89a:21bf with SMTP id 98e67ed59e1d1-3a7873db396mr2835623a91.39.1791093900190;
        Sat, 03 Oct 2026 23:05:00 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:04:59 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:30 +1000
Subject: [PATCH v2 03/21] ASoC: dt-bindings: cs42l42: Document
 #sound-dai-cells property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-3-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=829;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Tg9Fb0S/kn3WqXmtsngaJ/pCDuNRSXzw1e4JgFn2CV8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+RM2Kmkv1uvQWTh/GVrPtZXmXm2312b5qR2vFcma
 s/nKbo9HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKme4MHwh5/zmoP++ubfe22u/Q+uY2q/VPFuA/vh/VM9301VOuK8YRojw9Fnp1N
 arHpenZUxm2ntFt9WGnNK5VwTo6rAozy3h72anAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230501_099619_867B3499 
X-CRM114-Status: GOOD (  10.37  )
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

We may need to define #sound-dai-cells on some machines where this
codec is part of a simple DAI. Document this property to keep the style
checker happy.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l42.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index 6c100cb36699..bc759eaadeca 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -26,6 +26,9 @@ properties:
       The I2C address of the CS42L42.
     maxItems: 1
 
+  '#sound-dai-cells':
+    const: 0
+
   VP-supply:
     description:
       VP power supply.

-- 
2.55.0


