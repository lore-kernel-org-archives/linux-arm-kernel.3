Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EF5C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSx084TFnzGFnpguxyZxDPEBlEGv6khf3RChBzg4a7A=; b=LwMe4mNnobYPZT5z/svYUPGu2t
	0cFEU1INX/O8BjXLzZ3wYLqlu8aRpThZBKcRli2OIE3qzWeiOBazSoVh77Gk6GVMPmJ0C8OjRzOdv
	UZ1V8P4JXi++lbIQjy654AH7FHCiX1617L1B3oZo6uRy27qtNCs5ttv/WleKWIn9drHK0HM/mWiFE
	iugaPkhu6dddgRYerCLBCLhNEdXmLI1bMrRqdYJ30c7W17z16QURW7s3RqDSvg+DB66wqO+8IVKTf
	U94erwYLBS3707a9mY0g8hY2wFSmuPDkEm0+k4MbsrMdbWnL3vybYZ8M48WRnYVbIlNAcZjdcOE1D
	8vKhuXjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmddo-0000000CjrG-3K6A;
	Wed, 22 Jul 2026 20:34:08 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmddh-0000000Cjp1-08QU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:34:02 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso49883005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 13:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784752439; x=1785357239; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xSx084TFnzGFnpguxyZxDPEBlEGv6khf3RChBzg4a7A=;
        b=KohINwxpa/PgFMxOVZpiVStVoaBHoh95XzLV/lKQdIl8ZykmFTrVgTtolv1CNIRHRu
         rS27fxxP8WsukTNWoTd08M1R9BIewFN0K1946tXz+gkrnWpibkKt99hqUqkIb+R/fH/N
         qZNFrVdf/onLVIUkezLZnRcFYHHboYHrgHiGg8NvrJHMpXYdAUd4mKRLPxTVlqdfKd6A
         nQW1W/iXSO9LaKpleCy/U4rS+BMFkYjoUDEudW1Hj7CiojhUD5juAqBW4FTrFO/dXFvR
         iC/bEsuPWXXq8FieqPHz1FQLpaimMz1Ic5dYndDe6dsCGEI8RR72mt0E95yZuq4S2YoC
         lGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752439; x=1785357239;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSx084TFnzGFnpguxyZxDPEBlEGv6khf3RChBzg4a7A=;
        b=GJnSUVuba2Hl9muze6fhX30Yf2AFOZN70ukiXOUZ80rihZe/BwMYCDKDPUE1g19fUK
         mzjtfj2jUTaUjsUJWjPwbvA5UNpDv2L7gIlLyGoHc6R5JyziQLanUPjRs+P4umEtTPLX
         7qFcplTU5BU2PN0vH3RB4gWpkfwEqG/ZIj8RhT5+iXU6zCwzeLD/JQ1UJnlq+GSVGT8G
         nmcy3r/3u2ioJfxprID2ArMCGju0npmHiQdCCXKIsNJYyT7V8Haj/S49zCi5HNE6aPqx
         fXRUWrpswnqTAKWnSje92W2GJxAZKXoRRXXmEcdH+vlRi2PBlSzjVgijRDjBV+PHxwn2
         jvHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq/SfA11vM7VGbnH1UAKLT7ROmPuzGTRXl193djgRULSwAU3K7uxAgccFCwBL0ZYT6N4fSIo2e4okg5Vt9LUeWW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5A+q3eIU2ot3tmKLUhmhOrKH+BV+SjdahXofEfr0wsvMok7KN
	m9DNS7HVlBs38QSZA775bRPPvOYZLz99S8ffMYNfI7n2wkUyKTmQfyf3DB1t/gRbmb4eBA==
X-Gm-Gg: AR+sD13BPN6vMKwWS2F7kCy5EVkak4iMMtWp8tk9v8yN1dPYmRRWTNFlElPH/UJahnE
	JygYQ3iQFdbD9hPU4om3qM3jyvLjfLgWasCoKR+8Gh76rBOL147OfkRdgIJszPbug38YUPa8yQX
	C7PSFgYXq2v/hCcNVvIHgDbNYrp8f6mqMdBsY7y+UNPqfiT+fwhSB6bYD9cOCe7LQKdUJjyWrLf
	borQmSTClqJVHkR2QfhecEVIjhatSFq3sQHkMoJiu6CnA3p8ZfV4sJ68D8VMIxYFOSTHYZnCvLG
	+8ikl54IwOYiAiJQFL50jO7NIp8pVOSCIVNnRpzbMstc2lcqbr42DrTcfwR3vVFD/c2qEZnebwo
	+AVgeKuRSyalaYrxvID/STl4Eq50ljKEcEy6TbOoIJvuvq/Tb3RAbCnSoCgGs+WtnKziOF1vGJa
	LSPjVaTfcVfG9o4z5W96r8LZlF
X-Received: by 2002:a05:600c:3152:b0:495:3fe1:4ce4 with SMTP id 5b1f17b1804b1-49573ce8ef3mr3009655e9.26.1784752438954;
        Wed, 22 Jul 2026 13:33:58 -0700 (PDT)
Received: from coolemuke.fritz.box ([2a00:6020:b320:1a00:c256:1463:a40b:d8c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956ab2f0a2sm63134945e9.1.2026.07.22.13.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:33:58 -0700 (PDT)
From: "=?UTF-8?q?S=C3=B6ren=20Hantel?=" <fugininsane@gmail.com>
X-Google-Original-From: =?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>
To: linux-pm@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Rossak <embed3d@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH 1/3] dt-bindings: thermal: sun8i: Add binding for the A80 THS controller
Date: Wed, 22 Jul 2026 22:33:39 +0200
Message-ID: <20260722203341.2917852-2-fugininsane@googlemail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722203341.2917852-1-fugininsane@googlemail.com>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_133401_088120_ED2C0863 
X-CRM114-Status: GOOD (  12.28  )
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

The Allwinner A80 has a thermal sensor with four channels which shares
its MMIO block, bus gate, module clock and reset line with the GPADC.
Register-wise it is an early version of the THS found in the A83T and
later SoCs, with the THS registers starting at offset 0x40 of the
shared block.

Add the compatible to the sun8i THS binding. The A80 takes a bus and a
module clock plus a reset line, so the existing conditionals already
describe it correctly.

Co-authored-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Sören Hantel <fugininsane@googlemail.com>
---
 .../devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index 3e61689..718c44d 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -18,6 +18,7 @@ properties:
       - allwinner,sun8i-a83t-ths
       - allwinner,sun8i-h3-ths
       - allwinner,sun8i-r40-ths
+      - allwinner,sun9i-a80-ths
       - allwinner,sun20i-d1-ths
       - allwinner,sun50i-a64-ths
       - allwinner,sun50i-a100-ths
-- 
2.43.0


