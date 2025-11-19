Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BE7CF2597
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 08:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FiIFVMX2MR+XXmvXnG9d1/8nmYiayzPl3ENasC1cOTY=; b=PdCUSpzIzVxm2C8PfhtCOgM4ms
	7UxnqMretVTnSYBNZiVuCSK1+Kxde9xJtxh1bfnYtOfbAkX0x178f9uX4EmtkKb5sM5BK8uT43O4E
	eKsfHjp/SRnen6qQ9EpicCNaUKlStCBAiIaCy4SsIHDc3h2/b39ognz0pZ7XWaetnwJBctRY5ePs2
	oITAk0LHgOsYexaxiBZhx1qxXCc3VsNGIBSgAtP+P/7VqThudU0+LwY6sEttbQHnIMXxQX8q99ijZ
	yDXZ/hQeHsGe9bkuRWT1N7lMUbmMP6pfbnrAUlvM0jPrK9nQO2b85piCqi1FguZPhMa96jDSP4oke
	FdsrsduQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdGM-00000002lci-3Oik;
	Wed, 19 Nov 2025 08:10:02 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdGK-00000002lbL-3IwS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 08:10:01 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42b3ac40ae4so3866094f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 00:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763539798; x=1764144598; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FiIFVMX2MR+XXmvXnG9d1/8nmYiayzPl3ENasC1cOTY=;
        b=A+HQS0ySoUj9QvVBNjtc3dNp8X0LMCWQU6DIQCxbGYaw95Wmc1YftUiwmvUuuC9WDD
         CxJGhgQjTPGttHzklDD+Z5FnJ4fm537+pCccTZRD1J5dJ1mka0bWpBVLc6lbuOMXQyGV
         TthXH7R/duMGlk3fIPT4cm4R24g2Yv9q0JQjACKLBxXwyuP212PSVxspqz7D/zJPYcNN
         4aWzgRWxkBbB+J6mINtvmITu6O/EBiQe3c2eS0d0Oucdatg+t2k+qU8uVULWuVKAcqKk
         8QNb7GtIgMS/yZEq8spgz+emZ0RU2DI1MKM3tUkoCQR/akMnAxeIsglmEaO8eNoqSrDa
         /ntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763539798; x=1764144598;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiIFVMX2MR+XXmvXnG9d1/8nmYiayzPl3ENasC1cOTY=;
        b=rWhgJEXNpXeqJUGDwA5Ts4bCnF2oCnOiUSbGRaLBq9OpZ8XheRZv755zZ/VkgOGXYu
         L5MdktFi82JL7U6T6aewwsne1A5pfQpzE0v2FY8oIYVk6P/scFPvNhyEtPD0/gVMjHP5
         n6JvYKQV6YbWSBs0cnLCzcIVlXYfkULhg9/eKT6i5YMt0QdSi0otBGUAs/Qr10r3DGCt
         rO12yp/vzLmJrGt56nPdlnHIXbhNHPVHTqbG1MvJ/ucq+U6AkBjDzmDOF+ZRZ2Mod38U
         wg92oBYs7Suh8fLJ6mYz/zqWHW3++P2uvqYIoiCdoUJAEJjwJHX0+Ack4A2aAciIseZX
         0LWg==
X-Forwarded-Encrypted: i=1; AJvYcCVPwc5piKYg12CDIr/riDiqYLFm47lhvLKMnrW4Jg4BngDKopOsFg6HdDjZIqYpcqyFf6PlmHmE1ogTYH0LiVtH@lists.infradead.org
X-Gm-Message-State: AOJu0YxXSgNQ9u881JKg9DKOgdLSI7CWCkxRFCuALV/YAhci0p1pMZb9
	XiikgGoRvP2itsEMrpzExUDJrxtV1kG2kXHyJyPHN7S1+/0l+/j/pnqALAuVonuIPfs=
X-Gm-Gg: ASbGncs1+vbFlwqxpswSJ/6bvNYmHeFIFfYaL075MWqeB04QPmYOyn8Bxl/9TDWJyx4
	88SK5tLKqocCME1FTx9+845Zu0Iaf60k2bfQ5YBOurlz7LE4NVfD4PRrWwUP50oTIRI6bFLsjkl
	mISSqYrIooD2aPXHTPSHkTxjPcwzt+7Y7ggjpEh/Ed4QOrC4lUvsywIRo//v/BdfPzrPk7kLqPm
	7hyU/qQHeAlZSRFZGDmOGV3MKrjS331PbpaCyY5xdsFG7d31Cu6f2pgt3PMl9kPYECzfw4w8KKb
	P+4AFFyK9OPwkamnmfyRSoFc+j8MFqHcF6XCl0QafVqte4QmTi/QJAvKvMuh4pj375IWh7MXzl4
	CODigO6r9BNSe40TBDAzDWObz88cXzMeukIucJ8POQwpCZwV11IwxntgzFlVfX/y4i47fei2dD2
	f30wZlIM7GS4na+eOMRAq0bhNIoTY=
X-Google-Smtp-Source: AGHT+IE1q82L18y3VRPhHfEId7f170t/V5fSl9Cnt7w8NWmAat0eSm35Q1/LPz22OoVfb8I/7QAR9w==
X-Received: by 2002:a05:6000:4383:b0:42b:3c8d:1932 with SMTP id ffacd0b85a97d-42b59345301mr16798960f8f.23.1763539798470;
        Wed, 19 Nov 2025 00:09:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42b53f0b60csm35501317f8f.22.2025.11.19.00.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 00:09:58 -0800 (PST)
Date: Wed, 19 Nov 2025 11:09:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] media: rockchip: rkcif: fix off by one bugs
Message-ID: <aR17UkYsfAxCZ4fe@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_001000_842248_0F0A249F 
X-CRM114-Status: GOOD (  13.79  )
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

Change these comparisons from > vs >= to avoid accessing one element
beyond the end of the arrays.

Fixes: 1f2353f5a1af ("media: rockchip: rkcif: add support for rk3568 vicap mipi capture")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../media/platform/rockchip/rkcif/rkcif-capture-mipi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index 1b81bcc067ef..a933df682acc 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -489,8 +489,8 @@ static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
 
 	block = interface->index - RKCIF_MIPI_BASE;
 
-	if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
-	    WARN_ON_ONCE(index > RKCIF_MIPI_REGISTER_MAX))
+	if (WARN_ON_ONCE(block >= RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
+	    WARN_ON_ONCE(index >= RKCIF_MIPI_REGISTER_MAX))
 		return RKCIF_REGISTER_NOTSUPPORTED;
 
 	offset = rkcif->match_data->mipi->blocks[block].offset;
@@ -510,9 +510,9 @@ static inline unsigned int rkcif_mipi_id_get_reg(struct rkcif_stream *stream,
 	block = stream->interface->index - RKCIF_MIPI_BASE;
 	id = stream->id;
 
-	if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
-	    WARN_ON_ONCE(id > RKCIF_ID_MAX) ||
-	    WARN_ON_ONCE(index > RKCIF_MIPI_ID_REGISTER_MAX))
+	if (WARN_ON_ONCE(block >= RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
+	    WARN_ON_ONCE(id >= RKCIF_ID_MAX) ||
+	    WARN_ON_ONCE(index >= RKCIF_MIPI_ID_REGISTER_MAX))
 		return RKCIF_REGISTER_NOTSUPPORTED;
 
 	offset = rkcif->match_data->mipi->blocks[block].offset;
-- 
2.51.0


