Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778EDC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 03:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KZUnuuFf09iEV4TXLpHshSHcyHegz5o15LfPCufyx+E=; b=bUwQ3a5uFNtrx/iFxQWyRWqAKT
	GYJ5DEhy6CUTa/+M4WMmq+YIH9/FQJSRfY73ToYngZWgi05pGWCM8iO5mjmdHdXHfcLaZqvGYHxpR
	4ja0++CwosFzS9v7x+sueg4+CI7T/WJszG1/RGMfbf/Lo7aQftkyIKra1jmOL/FZ2+ZmTUslfHaf/
	wFUgbxHX+wN1NQNm1Sl0YqGedXsmIfIjFO1A+JyQbV8UYZwArTtb7PU5ofBa9CEDCa4d9AScCt691
	Fp598km6ANSLuzPfQUxRIutRe7VZNIGQ4tZpYlSZu9KT+ogqQ9nQ22PipxlzuC/O4B9MoB6WjsH0D
	FBUjzF5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gcr-00000008GXs-2uFU;
	Wed, 16 Sep 2026 03:48:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gcp-00000008GXV-0bIo
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 03:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=KZUnuuFf09iEV4TXLpHshSHcyHegz5o15LfPCufyx+E=; b=j+2DKK/okMtFFlJqeHvDbGoiSn
	5IwOYa2surdSEPq7QQUAqd2wbdqf46f3Vq85OrCe51YQo5IVB0tnzVBIEjZIXhkeltdypzlmZ92tE
	L6CvWoFgWkexw8tsbEUetR6bNpVNAU/1lUFN+xsaQfzpKoDqyq2M2UXe0lcT4iQIwJbL24G5pjIPt
	qb8RPcseq4/lAdEXuKpM9uAkW+TX9tuGff5TOyilDnPur3KE/Bm6RQWZSaHoUlADBa4aZsHjYzkq6
	5fTusnDVLlDSIVR9jtCzifnQWGV9tp3wfl2LOoE75RCDWwjauXkQ3W6ogN1iy7PicYIBwScneVaCM
	YBq25E6w==;
Received: from mail-oi2-x06.google.com ([2607:f8b0:4864:32::6])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6gcm-00000007Swj-0DmR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 03:47:58 +0000
Received: by mail-oi2-x06.google.com with SMTP id 5614622812f47-4b374c2cf2cso925717b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 20:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789530474; x=1790135274; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KZUnuuFf09iEV4TXLpHshSHcyHegz5o15LfPCufyx+E=;
        b=iiNFxP9H3IBkL/7KykMaXJN5e2ArvAlNyybj0IxDf2rUKxewi0dFdCxzb5dhaHwtOk
         ZXZmCbo4JP6Zip/3gQBZyZJQp4U85VjlW9RJzx573AC0IiZEFQD+nIalBExJ0gaN3zX5
         IrgrMvbSE0OUiE0iZOK9/dOANUpePWpk/GyRmEBvyh2fHaGjRzHECmWndnmJuck/c4MV
         f9y2tl3g251cPKT0Uv9uecv0aeiiVhRysiT7XSL2e6ZM78eocvYJmSvi5//9UZL8+he3
         j5Nbpj3Kq1MvhDycdMRJOsE6eoMj2UazazSekyqrAB/MT56rbclIRmcB/qw4a06MOjYX
         Mm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789530474; x=1790135274;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KZUnuuFf09iEV4TXLpHshSHcyHegz5o15LfPCufyx+E=;
        b=PeZR2kwauxhE1bBbMGEe1zBvrIwaNhJ6Tv4sQDHDWPvivtHHHoOnvSoFWOb0CDdd1c
         MpBaoXae5lqUfu9o5os/kLy38zX2/zbDiRU/bsNyPpqsWKjBsnee8WYdzneDZuaGiJls
         +ZjHQNHGQQHCEypVffZvg5ZJDcjq0Xtqaz3HfM9nBzCmMvt+MKoMmckGxhYy5S/1YRdu
         YEi6/GNKky4/LeBYtSO//X/crClEYsyKXZWEU2fKf7WLE2cl1yH+BCVu2KQm5lLq9uu5
         20y4eft5syOw1L9mi/C0IU/0G6+6DG6RK0FrfNz7x7EfRWBnmn7z1MaNKGaeSJislTko
         onLA==
X-Forwarded-Encrypted: i=1; AKwUvByFaIOw6mCgck23BvkULMU6hpBOL2CkXxoBurecSjorhJ8srAypc9SqAaOZUjwzehuxVekJzpxf6bjlCkqxcwul@lists.infradead.org
X-Gm-Message-State: AFuF++loRLMH1Si6oDlYYO5/8UUnUycxBLK8V9pdP7zX+Z5WYMvZ6OBE
	MK421Ld0gJmmiDnppD1XcbfS6/tzzI2cESQ1S/JmENbEwbjA+bXVGDPb
X-Gm-Gg: AYBFou2lmnQbMMf8fIFmaN+E/UoBqzr61lMQeBl8biOtO5kV1xRrR5E4l+mXeKvaFC+
	cNXcudTx6ljyadXy3CFURe41Ed3dwafqHfCKdQnF1owogqCOuN2g5wLimIjXy2loSWbQKnGq6qA
	CbPfZe8E7Sx0x8f7sy/3HI640MIp6DtboYMfAbPANdix3LMy7f83QWybbJafeJzm3uvrCLJI/7Y
	7CH5IGWFXk5XLxSTDQq20g71fMcn1WtNGR9alD5XimIifPZ6j4BdHDYtCaSFXwMsnY4cvyH728v
	auZs9JXsWukPsB7FugijMwm8N9f+Vyqpnt4h7H9iWv74rnwyBzrzWX6qi5GBXQxKBIUAm0XK++K
	7Ed3Ahsq+mCTpNMgXTL+E/FkpGFvBy2fMdfqFPyViWAzNn82ykH8LHx2A4s9haSTXaz6PHdFz+Y
	6QAunB6xLibotui6lZT8m5iH+oXIhMXoWRdr4Y3wZgNyg6zs0tKC1cIEsS92Nau01D0w8=
X-Received: by 2002:a05:6808:4fcb:b0:4c2:e38d:4de3 with SMTP id 5614622812f47-4ca4a9047a1mr1733472b6e.17.1789530473675;
        Tue, 15 Sep 2026 20:47:53 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ca2377aae6sm1446666b6e.7.2026.09.15.20.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:47:53 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 15 Sep 2026 22:47:50 -0500
Subject: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add the MT8173
 keypad
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3Nyw6CMBBG4Vchs3aSFgwXX8W4qPQHJ4baTKlRC
 e9uw/LbnLNRggoSXaqNFG9J8goF9lTR+HBhBosvptrUrRnsmfWuGZwyfpxjWhVukTDzsva2a/i
 Jb3SeJ+/HxrYOZuippKJiks+xud72/Q+w0P5JdgAAAA==
X-Change-ID: 20260914-rbrue-suez-upstreaming-mt8173-keypad-fddc316ae098
To: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789530471; l=2015;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=iB6N5HJd5gxJ6JfDRUspRgFcS0Yl2pln4xko2Z2q6Tg=;
 b=ALF9MhZ4iDbh4vFTTUxFBuixvjgq+QLsNGyPYSFi+QRZHCViQOngwQy98zKiBOP33E4wyYcbz
 YQjSzhJfhYlCnTGnNHLmhDpo9Ie+KvCnRBPR12NrzDy5tFpdqQ85FYX
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_044756_447268_0F83653D 
X-CRM114-Status: GOOD (  12.18  )
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

MT8173's keypad controller is the same block this driver already handles.
Its register map agrees offset for offset with the MT6779 one -- STA 0x00,
MEM1..MEM5 0x04..0x14, DEBOUNCE 0x18, SEL 0x20, EN 0x24 -- and
mt6779-keypad drives it with no code change, so the node only needs the
fallback compatible in second position. Add the mt8173 string to the
existing enum, which is what mt6873, mt8183, mt8365 and mt8516 already do.

Verified on an MT8173 board (Amazon Fire HD 10 2017): the volume rocker
reports through mt6779-keypad with no driver modification.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
This is the binding half only. The board device tree that uses it, an Amazon
Fire HD 10 (2017), is not upstream yet and comes with the rest of that
board's nodes later; adding the compatible first keeps that submission from
carrying a forward reference.

No driver change goes with it. mt6779-keypad matches on the fallback, which
is how mt8183, mt8365 and mt8516 bind today -- only mt6779 and mt6873 are in
the driver's own match table.
---
 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index 914dd3283df3..b45dbf805ac8 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt6873-keypad
+              - mediatek,mt8173-keypad
               - mediatek,mt8183-keypad
               - mediatek,mt8365-keypad
               - mediatek,mt8516-keypad

---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260914-rbrue-suez-upstreaming-mt8173-keypad-fddc316ae098

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>


