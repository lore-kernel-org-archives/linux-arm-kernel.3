Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268BEC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPI27XPPYRRK0xWqV54WIVswQxSYJsBtgx975xO40PU=; b=pMymSI5LuNSxck+VdFwwBUAwF/
	f18ri8w4AjR3mI/Rm3O+yiQfkI7T9AHbL7SmsisThZ4C4Tevv/rpZTl5APAkqPbU54goWnzwwVe8B
	PpYfLe064sKLaYGwdCWNRxjVspbzp7LZoR/rhJJIhYQcnumIoAZpsZcJCDI5eA5FdAtXAQxdICnbK
	gj2MYQFiNlQ990tx5aB7Ij4vek1h3ObANQdWj5m//OtmWX8bylEU2hGzDZjyi8u6/9zF91P+P4Ufp
	2w3fcI6Zrlo6cHsm+zq3+bCnlrJKrtZWT9GvHPZpsSHH0/pOn19wvCYr1aamod4oqe2aqo7Cf0sMX
	EMaC7EpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uvz-0000000DtjK-12Yn;
	Thu, 24 Apr 2025 11:40:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tm1-0000000DfVA-3Y6w
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:25:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kPI27XPPYRRK0xWqV54WIVswQxSYJsBtgx975xO40PU=; b=n0L4Mb7GplxEQWMdzbHdujy2Ts
	eRt9w5PrCOo89TOuJArKAPiNNeRI+klcDrVhDL6zu7PJ9if+84LLfjtTxGhmvCXYmUJGWTZP5m6fE
	GhNH1cVKasiy+eXPsQ9uMIvr3MzcFGJbAk1bRtD6V9qsZ+vHEmL4pMssgjj5TSb6JGqhmPSkYq+Vt
	4aYXgxo8b1pWUGyYouAA+ycK+QWXWGQ9aaedKoV1VWO1qhNWU4iRbuviD6fsy38xV7O1nAPSsVP8I
	EGXC8buN5WCsXJWu09xcZ7gaUbRx079FQ6DOxfQW7RyzYEdMSWUo4DEQHZSgsLm8a1Rm5B1SfWF5/
	CAjX2mwQ==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tlx-0000000BjWN-2Nbz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:40 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-227d6b530d8so8435005ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 03:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490336; x=1746095136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPI27XPPYRRK0xWqV54WIVswQxSYJsBtgx975xO40PU=;
        b=m9lzWOrWXlGdV9nf0IzreDTFqD/MHM85zYEqVqZ+gYsEo5SvJpI/eIASsXc+Db/55g
         VtsQJ5ft7W1YpucXIL6rXXBJ9mJH9NClD9fSicV0wHmMMLL3RdFLO0NbzF8y5y5bn/uH
         JQKv0N1BWAX811sJ+l7PKo3MSxchVggPbxSIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490336; x=1746095136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kPI27XPPYRRK0xWqV54WIVswQxSYJsBtgx975xO40PU=;
        b=LDZtJU2zcXaoKTtvM3xxmFlgm67K++TSPWhbTi/0G6jzWizqslRfzW8NtBSPvITlFh
         xcJatifi8RMVpgEEpEAQw1lDL1qPQONjtgFIPqI1W5hhQRQ2+g49PWAko9RBaiRhzPBp
         wXboPS+df2uTDG9MKxvtV+opLg7IR3L9WibTO91mpprNFpZzXRN7WPQc5zhwMFg/GN/N
         NAtIqM3k/LxQFOQpcHVpjjomkVf95NEyRzCmvofJxpYbXQV4DRWlbnXrtL34DxwHDNZr
         hhRpgA51o3QNqZ0IbMwI7fwHaR0/PqnLuee1FZflNQRO2xJldkDeGUFfdqnxw3WAwMBL
         pY6w==
X-Forwarded-Encrypted: i=1; AJvYcCVqHJRpxPmkkwWQ4XE4Y1xVAnBdSBY/yo1ibIxjRA1US2kekrRmyIwcm2njeyazB6OBA2Nlc2EHM4hq39MYXQRf@lists.infradead.org
X-Gm-Message-State: AOJu0YwmhANrqAgyYMsu5F1YtM9KlRd3CdA/0cKZMuCPyn9+e+SJjxkC
	aOzrXz1ecsoI1W/AW/pe05my1WETogdwSJL7E7EhEPWOsYDztwJQjT4cyqC4Jcw1E4/NJX5OMAQ
	=
X-Gm-Gg: ASbGncuzjPE7rRzoBTVIE0ZVTuIAxwfx4U4K6LXM8lzsV9q5gUZm3VYGWG47aBdNZjw
	eq57mGg7Ouyn5Mziqu2vTdFtYMdYIz+acDwIhMsWvIqfBrOk6WPZYkObG33rMh+kXbRcl4rEwKO
	vwnLv7qAd6zM/3Z1FnzjYVRvhtx90XSdhN0mUdEowiB0pYFW7aZvLLfxRWWnOWdSzKNV2vFu5pL
	CfZhkmqUyEMzZGhGhp8QeCmdLeQ5X8r0ifum+czC5vMC0QvYIcnZy9wJ+fW9tcPO+TOf/wReKih
	KOgsPVjHs8PvGwWn7a45EZR3vJgC7qS1p5dv52oTlF41E89nRgGZinmFUQ==
X-Google-Smtp-Source: AGHT+IFl3f1jhKy5TreVsC3n6Tp6f11IsZEiWWY1AzKzoKnuU1FfQGTVtrsgZqmOG5uoeu4Ajq1oKw==
X-Received: by 2002:a17:903:28c:b0:224:76f:9e4a with SMTP id d9443c01a7336-22db3c0c147mr26537035ad.14.1745490335985;
        Thu, 24 Apr 2025 03:25:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:35 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/13] ASoC: dt-bindings: mt8192-afe-pcm: Allow specifying reserved memory region
Date: Thu, 24 Apr 2025 18:24:59 +0800
Message-ID: <20250424102509.1083185-6-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_112537_768319_456E252B 
X-CRM114-Status: GOOD (  12.11  )
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

It is desirable to reserve memory for the audio frontend.

Allow the "memory-region" property, to be used to point to a reserved
memory region.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
index 064ef172bef4..8ddf49b0040d 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
@@ -23,6 +23,10 @@ properties:
   reset-names:
     const: audiosys
 
+  memory-region:
+    description: memory region for audio DMA buffers
+    maxItems: 1
+
   mediatek,apmixedsys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek apmixedsys controller
@@ -95,6 +99,7 @@ examples:
                       "aud_dac_predis_clk",
                       "aud_infra_clk",
                       "aud_infra_26m_clk";
+        memory-region = <&afe_dma_mem>;
     };
 
 ...
-- 
2.49.0.805.g082f7c87e0-goog


