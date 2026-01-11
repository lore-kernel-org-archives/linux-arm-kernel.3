Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9358BD25030
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 05:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2tU5Y032ehNBm7uCb7qJ1LdfjRktwX5kqC//2xMt1wE=; b=lksBYtGRe1XEkfblawt/WNNV4h
	4bZSMNI/W1Mhi2ksNDfbfBrf22++2k07mwMAhd5vpQvNF/2zY/s16q1AdHUBD3ZGICiGeaRmnhkCl
	UWrwAa+SXVOEOfux15yR4/60bzdoMjbm9MI/9x/I7qRnn0wnyFOhz3AeQ1kTKRbDoStviAcIXcrXR
	GNniCufsOGqjrw99HdgFxR8/SSDEprIPLMLcneixEG5Yz+pPSwnkzibpkFissycIQ5D/2500I95BF
	FqTpNmDPn27C4S0axU1IYwTwBdSbG/ZoZt/hxa2zC6au6JJzuYcg3ygt45J5HB2Fr8U/cTOk7hU80
	CAK/rBMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veo2C-00000003tMn-35RC;
	Sun, 11 Jan 2026 05:30:40 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veo28-00000003tM2-0trx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 05:30:38 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-81e8a9d521dso858052b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Jan 2026 21:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768109435; x=1768714235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2tU5Y032ehNBm7uCb7qJ1LdfjRktwX5kqC//2xMt1wE=;
        b=kWW2+g4ikf8/umPBRXaP0lETZCrUIbm3Zy3O6Ej60Zd3mqbeFi3SoQnRVgxkj2prcI
         KB1GmACpegGSn1PYPebyQau4HLEOUSlAnLkuMy0gW2JrI6yWcWQysd5hVxr5gOBSV1Ww
         JyrgfTHFReD7M99wJaWAySy2NIlym6e29BdhnDiyUNxxcjDlvf79thdP4sPw9GOxSKwH
         0k7CiLLEvUpbmbcMOJU8Gjk1l47vhJUSQqFGrvv6/WgLO/cl1sBWtbsW4OlIhN9rcJof
         k7uoqrZsV7v37JanQKND65snq9Zy0glHk/+yi+2TkM+4B226Omj/1bnZyqkBRGCGPj/L
         A1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768109435; x=1768714235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tU5Y032ehNBm7uCb7qJ1LdfjRktwX5kqC//2xMt1wE=;
        b=jV78owCV2MRyzV6LXnxfbVtXhYRTAVIsxYg1Ggl+3bNPAF7FKuN2UEDR7+a9R9lmI5
         FK2nzptgeuHbid8DIDvgw6g9KgjcXgKo/gNBq9hTEqrBv17qO+WHYlOhiFN+msZ3wgGc
         HzE3xx2Pn8RP0IR+i/Fm9oMrk4G9XQHe369nYMUOI8uGouF7njtKLHmjNsbDCXKCaOVe
         lEFCL5EygKTD0y+zEVPXfi51w0qMnyPmI7BgT3N8h+gLEYI+szLBuemzEuCwRV7Q/Fy6
         ayjV6EzrBkagzrXMlS9fRho0jjp8cKhPyNAWBletI3gab7IjeHtp4joHI8tmKwxC2oNE
         CwFw==
X-Forwarded-Encrypted: i=1; AJvYcCVZVJQCxhipkIA8So5BCDKITMcrKxuIdtshRBdYOBgYXxU5AmEdRue8ozwDSbIDrHcignvN96Z1VPeAh1u4ivEZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6DKN50KOpgCi5gYMWXL5eKsfpQfHkNUZS20uy5QymwJc56031
	/ofFIKYC5mn5j/mRYXWQHy3VPXFa8l2Vd4xaT3UtibGa4taY+c4s6zhw
X-Gm-Gg: AY/fxX5zK1c3qoxI+wYUo4rMTA1kYJDaqPx7i4gVTeU1tTOel/UMjuyLYUaI/oMIJPr
	5ato5DHCcA28UU5pBPbIG9mWj28t02XRADn/xSwd0pZAdCrFKNyjYLVOSxefRoUlktmeeQWw7TO
	QixPbUazfAnSe+h4ppSPGq+2bUoSgJK+oqq2cj+wcW2x01jR4WmhepXhe414PRmF2zKYkTVC9+t
	udG/5W+ASYjmMQIrAWFq9ngOyv0N5amqiQIvl23ZYXrW6wkujhP2Ytq4ghdw+QM8DEtRLDoEiGn
	rBN1lDqfVqtAJWQn9ajaEzAV1zh0oAUJRT4Ko0/kzmUuTsTRw1dRyVneOH76LyHUU4NZ+eL7wmv
	kxQ2P54/6bEAlB1StQt31yBt7IXLO49CfbBHauqcGEFw4OGUBoMBQ8bKcY4dxR7gC3NUGIfsyuI
	+dHUJZFAemCBXMNjtiMfv2Lmyu9OIzRZUEDck3uSoJCA==
X-Google-Smtp-Source: AGHT+IE9IHiQq4TCDxDRjV6As4aVF857MZMsEhTnrigePlGm/VD2v5ON2VzITLK2WPgiPhdmveI4qA==
X-Received: by 2002:a05:6a00:bc91:b0:81c:c98c:aeb7 with SMTP id d2e1a72fcca58-81cc98cb603mr11097939b3a.7.1768109434679;
        Sat, 10 Jan 2026 21:30:34 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f36f88f4bsm3503490b3a.36.2026.01.10.21.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 21:30:33 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: sean.wang@kernel.org,
	linusw@kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH] pinctrl: mediatek: remove unused drv_offset field
Date: Sun, 11 Jan 2026 14:30:24 +0900
Message-ID: <20260111053025.251983-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_213036_266750_11AE5924 
X-CRM114-Status: GOOD (  12.25  )
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

The 'drv_offset' member in 'struct mtk_pinctrl_devdata' has been unused
since the driver's inception. Drive strength control for MediaTek
pinctrl drivers is actually configured via 'pin_drv_grp',
making this specific offset field redundant.

Remove the unused field from the common 'mtk_pinctrl_devdata' structure
and its corresponding initialization in the mt8365 driver to clean up
the code and avoid confusion.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8365.c     | 1 -
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8365.c b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
index e3e0d66cfbbf..c20b9e2e02dd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8365.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
@@ -456,7 +456,6 @@ static const struct mtk_pinctrl_devdata mt8365_pinctrl_data = {
 	.smt_offset = 0x0470,
 	.pullen_offset = 0x0860,
 	.pullsel_offset = 0x0900,
-	.drv_offset = 0x0710,
 	.type1_start = 145,
 	.type1_end = 145,
 	.port_shf = 4,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
index 11afa12a96cb..3b96f3dd338d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
@@ -263,7 +263,6 @@ struct mtk_pinctrl_devdata {
 	unsigned int smt_offset;
 	unsigned int pullen_offset;
 	unsigned int pullsel_offset;
-	unsigned int drv_offset;
 	unsigned int dout_offset;
 	unsigned int din_offset;
 	unsigned int pinmux_offset;
-- 
2.52.0


