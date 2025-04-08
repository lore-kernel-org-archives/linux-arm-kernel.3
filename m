Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE911C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 18:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KrpT+jmLuV0pMig4xoM27D18t14gkY3tPjFQzNc4T6g=; b=ibnmYw2E6NRKhGM62OeWUxrqJp
	NLRASTFeFT72CWJl7oXXsmRAZnQxN3YQLTvFE5O/CMnOipKnWlNlmbyX2OahuqPEoua1JmnV0Gbzs
	+PBc/eENFJMK6WoDwbUmkEmqVrWZJPauujg2hicakYoZAnJl8/R86u9JOFYeCeKGk6CO2vbI4ynq8
	y6vkI7RPbUpgWzxft6C+qY7Anh31BuvVzPIi4MfmW+cwi+qtC0+1fsTIQX2FvmtR7gQPiERewrC1e
	IZDAP8I/bQbcdY72k1v1UaBAR3zqNsH2CAwW/yFRJc+IhAmt1cQqis9MDk9cW7q/5B0mfx9xToakq
	50zUc3/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2DXk-000000055JZ-2aoB;
	Tue, 08 Apr 2025 18:19:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2DNS-0000000546f-0OuH;
	Tue, 08 Apr 2025 18:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=KrpT+jmLuV0pMig4xoM27D18t14gkY3tPjFQzNc4T6g=; b=qMde5UPV9VyuD8krnXJZ2h+eVG
	41YqqH4FYRiok9UwjLVNr3Bhuwl3RCROMnpSQjAfaGmIl3UYIqv6A3zFo3zt0eKPsGy/OHxmIO+nf
	3G4wygcUqsc0dY6V4OPhCRzkd3zrb2JipsFTHf5M59OLUtLKbjdcQQGloRTiC2icn9n8CS93znjse
	o26wliWVzpb7MmkRdXwrnylcauM/YshXk9Pm8WfN4nayzV9t/+RNKp3+UPSwmikrPSBiyfRaJ8QJ+
	444gW5RQEWVQVZnRIN78KSi1ADZUTxAP1XurnGDFw1TK7KGscrjK2VlNeK5XGbRYMARmyve3GIWYi
	HM0VXwag==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2DNO-00000008NdZ-465L;
	Tue, 08 Apr 2025 18:08:48 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso39787995e9.2;
        Tue, 08 Apr 2025 11:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744135724; x=1744740524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KrpT+jmLuV0pMig4xoM27D18t14gkY3tPjFQzNc4T6g=;
        b=mb3FHvdxI7W+CJiMtFTzpNFZvIj1omXkfL573LEk4h1S2AVLc2kJ1ydiQcosTt+G9M
         C2BUKqunQez5lhGYy2m5gNUVbOOv4Zjt5B2GkKGV0NN8/mYzRpOD4uFAeRuYb0/hM0Tf
         m/uAAK3gPwH0hmx565vWoilMsK5ZAbOzKrHVGBixTGmIcSt7ypZ6heisiZLCEPp3MCZq
         2ByB+C7pwzb8CjwUjr4ifUzv/Pk/dTi55aLeKVrw7KQjn+vCwBzsVC52Bl4+Wp8ufT9H
         Bx49zprwHBFJWIK0Ig68ELVRHDsTQ0ZygjZcxCBV2HoRwyY4qRIRTjYCAFE9ka0s6y0v
         NIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744135724; x=1744740524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrpT+jmLuV0pMig4xoM27D18t14gkY3tPjFQzNc4T6g=;
        b=C5ZiIYgzLyd9yiHLZurCKqAUyKXS0Rst7pwOSJmr12dLnEfRxjWeqsUMTFSLP42K09
         /0F7dnXzpNlkz+zMiyA6kPtdM86INzVZOkJPA1JwIcqOX8t1DsibiBZ/THfATtaKCKCk
         uxov1Bv7DW8Q77jGS6bn0AuuJQUdxLoX/PQ+sArUD2vaB1QoRDvRiHf56j8DhG39u6HR
         qI3EHna9Tco1RT5wyfMa6w0mEjtkwRT0DMjDlyJMbxtoNTXXdg1MzPQGaZDnE3qI/NAP
         iphaJod6ubV3oaujTr8mkApWsRXkBxn+d8uPhNJHwdGUvHKlDRqpdVi7d2flrru+1/b8
         r8vQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1kzid3XAmxrOsBNJDeSRqjxX7LtLzvt/b881u0t+Ch6zSvqvHcsONwDty0cDczAp++uf8ID1qhZKIf8mWkDIT@lists.infradead.org, AJvYcCX0/9ooWQ12HX8k9zCYdsITghshUmoBv7yxqcM2g0dsdd9UfiYzZB+etBnbVFD3A8ZgrXFzVRd7pE/1w4Z7RX8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf70na5Ykesv84E5gKQDUgU9iv+ESD9iogsKwL/1FrcfZmsQGw
	Eqihzec7JfW4EQX3KkyjmrCtKSR1b5Z9ZHwWN9sYiuaTpOrPiRAN
X-Gm-Gg: ASbGncsboH7oy6vCwEQf8ViVNtGjFMc6nxYhASrxpnDSiH6WlCXgZfCQhHEmmkpnTck
	y7nj/47f6APNuVoumU98aHcRqoPeHYH75hGhE3Cdha0IQrzj/Focd1xJzvljaVawdKoh2towzXt
	TcU3j2wiDdUhQc92ih5WjPvBxN98sJKDky4N9rEC2ybeCocboZE7H1Za1zxikUy+go5iy50gEJw
	GNcFOW1/zXDpD5TU5qOy1OuYU/b5N47vqi7o8vExCJN/VQdsu367ZuBxN+Rp4Vw6gw1rya9jaix
	FlkyuHHHG970APEYyHjznG6SVAzZulstpXm7nL3AgwWGoqziFqHGOAmg
X-Google-Smtp-Source: AGHT+IGyH8xe4Xn7pdARQCUYSDd+37MKMCz08gGeVjeUKpJyPaAluAtZl33+vtBRvWnulgqkjovgyQ==
X-Received: by 2002:a05:600c:5104:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-43f1ed671edmr789965e9.29.1744135724433;
        Tue, 08 Apr 2025 11:08:44 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:5b45:5642:beb0:688f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226dfesm15864058f8f.97.2025.04.08.11.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 11:08:44 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com,
	Bo.Jiao@mediatek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RESEND] wifi: mt76: mt7996: avoid NULL pointer dereference in mt7996_set_monitor()
Date: Tue,  8 Apr 2025 19:08:39 +0100
Message-Id: <20250408180839.19997-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_190847_091980_7498E03A 
X-CRM114-Status: GOOD (  10.84  )
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

The function mt7996_set_monitor() dereferences phy before 
the NULL sanity check.

Fix this to avoid NULL pointer dereference by moving the 
dereference after the check.

Fixes: 69d54ce7491d ("wifi: mt76: mt7996: switch to single multi-radio wiphy")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 91c64e3a0860..66575698aef1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -414,11 +414,13 @@ static void mt7996_phy_set_rxfilter(struct mt7996_phy *phy)
 
 static void mt7996_set_monitor(struct mt7996_phy *phy, bool enabled)
 {
-	struct mt7996_dev *dev = phy->dev;
+	struct mt7996_dev *dev;
 
 	if (!phy)
 		return;
 
+	dev = phy->dev;
+	
 	if (enabled == !(phy->rxfilter & MT_WF_RFCR_DROP_OTHER_UC))
 		return;
 
-- 
2.39.5


