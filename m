Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E38CCC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 03:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIaOslUUuQA0fJiLjrDXk3itkuEZwobsIpmCK9CnT84=; b=vgORbQFp8CIvDzHNaFULKsTQhx
	ivnp2zJZPoCZubDWyUOWS211KXEu1Jh161a75kbyoP19FagVY+jgDbPxus/5a73Qxz3ZJLYI7Vfe7
	y0DPXlnxXBphsrJKCc/rb0ID/rIIXsEACMMV7UUIwNTGu0CNcexoVt0XxusxFDksNWcQaMb62PXBf
	p7IAVvCHetq9kVsKR0ZlO9lPu8mcvRNJN+XnS28LrHo8Y2oHzMROlBKMBp2N7Akt50kzyDj5mkE3z
	G6isB9ITMgtLIbQP8Tv5o0Yia7p/cC6qRqkhqtyyAOVf9eyZWzld5sCd3cw4Y7F+rUz90SzogEFk3
	t1PeZEUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTFZ-0000000Bsj2-3WOP;
	Tue, 13 Oct 2026 03:32:25 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTFX-0000000Bshk-2kY3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 03:32:24 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so1885269a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 20:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791862343; x=1792467143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIaOslUUuQA0fJiLjrDXk3itkuEZwobsIpmCK9CnT84=;
        b=EPmk7qbgIXbavm1eI9oEdvYeBOjMIdll9VSVpPbhwzHaLwO5kPtlVjZePPBqg5ZfWk
         MxrjKWk5IT+506ZctAXEaeaJl9eznpxW5GxJesomvtt8hi+ItTcpM3C2HMJgjqtStn7Z
         nUwkixG7Cnek8GM2uc1XO7FGWOqzA6PweKtl4MqglTcsv64tNPUkkhrxg+K6rGapfK9v
         DPqu8YfsYQHdZWc4STDZr0d3Yg+9nGwhpn3gvv7L4qYaGaDhpy2GZEaeFhMxI81LC+R0
         iiyqgo2Gb+ZmoI6jb9rS7E/0PFb5AK8jf3GHRDwquWnPjho0ISqRD5bDeMfIIg/qEoTz
         aX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791862343; x=1792467143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIaOslUUuQA0fJiLjrDXk3itkuEZwobsIpmCK9CnT84=;
        b=wkfvAZbrDiMQPHXGNZ/PH3ykJ7IJy0z4r/C7UlB0VYV87RKD9EyS79qZ2w5GLaMAkc
         KwOnBErEh1nScdpEqGFBFJo9vmPOHYciY5gPlcINT8cQY6t2SZG6LY53xbNDrArLNbjm
         GsBbiS+V0uev8HAwDbBtkvO9isiW0ojiGTi/mcyKaHfc62ohZnVgy8Y/lz58OLwqwtIW
         Fm2FdjxrEWD+V6tyT53GQ4qoXZl9cGXeiin/vsdtJ7w084xTzDc/mepYO42djzfVVZk7
         MrkvzlhTtofL4brCXMy0DpjEKjE5ujuhU9roSkMEOBAtgAqh8s0sULuPlsg0Y9S3pKDg
         WanA==
X-Forwarded-Encrypted: i=1; AKwUvBwTIc4b58rfH/ORkSjgfVoB/6DFMENP9u3aGsmiiB775SrbtzmQvcW+d0DTtf3C13faZYz3BgIFtEvf7+ZCllRX@lists.infradead.org
X-Gm-Message-State: AFq9FYKB4kpyMdQabzJBGyJNzOLauPPaQ+DoIT3iH7BY7ma4XGKlqzlD
	KU4C4jhghbtfwdk7eRF+Jp6tHCMIS7yn8BGC2fLIVSs8r1hCCxStp+b7
X-Gm-Gg: AYBFou1U3XcPcjru/VPCvVRp1p3AGj2Hp+F7lkFQpcs/vE985UZ4RMcGFQdOKQ65orP
	33iTxWr+VwvHbYDgMRLSkBc1ZEXNBJs+kmnNA3Zl8rN0Pm4ODQCBpzVpR9eTCE8hrAHMhB2Pp4Y
	V/k5V6YlEgnxPV9MAOTUjbLZomRji8cdjDLWFg+S4J6HN/FMrZLdm47jUw/05mxhUqhhNIuUkWV
	brTJJjvWcSs3mI5hOENsqIND4DBxI9jXY7oaKgr/wc6lAdecVQNMZ86tQIJV/y6WxS4PDFHFAE/
	it+Tuo1gVAZKkQtZrChVVMxK+EqLHCetOofUcQUFZwfWXitO+U0fk/u/h9UAd8VKHq69EtyNCoR
	AxFCpLVIHlAqehDMNgEeFIkFxz9f1J+pe/laqLiXq494G8yH3WgB/FQoEnhoM59LCHtgprFeDcX
	yyaEf+fdMp7t34EY3g8MxR2x0lzLpW4XVkDbNr8xEar5bbycigvvP5DzLSWo4xvAdjrRcU2sM=
X-Received: by 2002:a17:90b:1d48:b0:3a8:d01d:327c with SMTP id 98e67ed59e1d1-3ab3ab3762dmr10150604a91.46.1791862342549;
        Mon, 12 Oct 2026 20:32:22 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36fdc75esm19541303a91.12.2026.10.12.20.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:32:22 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net-next v8 2/3] net: stmmac: guard against a zero channel in the aux snapshot handler
Date: Tue, 13 Oct 2026 11:32:06 +0800
Message-Id: <20261013033207.1684328-3-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013033207.1684328-1-zxyan0222@gmail.com>
References: <20261013033207.1684328-1-zxyan0222@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_203223_698464_BCBC086A 
X-CRM114-Status: GOOD (  12.40  )
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

timestamp_interrupt() derives the EXTTS channel index with ilog2()
applied directly to the PTP_ACR channel mask, without a zero-mask
check.  ilog2(0) yields -1, which lands in event.index as 0xffffffff,
and ptp_clock_event() uses that index in test_bit() against a
PTP_MAX_CHANNELS bitmap without range validation, reading out of bounds
from hard IRQ context.

The zero-mask window is reachable: stmmac_enable() sets
STMMAC_FLAG_EXT_SNAPSHOT_EN before it programs PTP_ACR, so an interrupt
arriving in between passes the flag check while the mask is still
clear.

Check the mask before applying ilog2().

Fixes: 8851346912a1 ("net: stmmac: Assign configured channel value to EXTTS event")
Cc: stable@vger.kernel.org
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index b9a985fa772c..2a076e228e9a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -242,7 +242,10 @@ static void timestamp_interrupt(struct stmmac_priv *priv)
 		       GMAC_TIMESTAMP_ATSNS_SHIFT;
 
 	acr_value = readl(priv->ptpaddr + PTP_ACR);
-	channel = ilog2(FIELD_GET(PTP_ACR_MASK, acr_value));
+	channel = FIELD_GET(PTP_ACR_MASK, acr_value);
+	if (!channel)
+		return;
+	channel = ilog2(channel);
 
 	for (i = 0; i < num_snapshot; i++) {
 		read_lock_irqsave(&priv->ptp_lock, flags);
-- 
2.34.1


