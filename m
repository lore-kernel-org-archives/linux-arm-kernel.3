Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F9BD49798
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 03:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7PGTzmjpPUY4RIlcJXB5Q1jmNe+Wfb9Ofzi2ziDYRw=; b=4qO+g8etbx+SatyfX2ajYfH4Y5
	mAm0yqk/CUbi82DulRoa4p9XRJc2vaXPeVzMCizw5RdmVp1/kYJbs0pDfCn053jgjNutyOthgKc2e
	Un8EZoH3tdH/9jvc+cBGXdcnGqKwgdrAdkCPX+DqH4xKxFF8QIoO22oYgvvjWJ4eqR7lGiPP1pDjd
	rxe1flIpmeEgUskrTMdpkSs7cB8F7RrnlC2w81iZ3BzJdpNM1X+Jp4nbWXv8HaKCu63zxyL5YKIhK
	n6A5jzFGLDZooG0alNpN5Qo2Jcfd9rZSOxsh78v7vkeP7irSY+jSLLV1aFu7kbmtWs7c+7MX674Ho
	C9di/LQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHx3x-00000004w6j-2TK9;
	Mon, 02 Dec 2024 03:25:29 +0000
Received: from mail-pj1-f66.google.com ([209.85.216.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHwyZ-00000004uqa-3jAi;
	Mon, 02 Dec 2024 03:19:56 +0000
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-2e56750bb0dso2655362a91.0;
        Sun, 01 Dec 2024 19:19:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733109595; x=1733714395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7PGTzmjpPUY4RIlcJXB5Q1jmNe+Wfb9Ofzi2ziDYRw=;
        b=QjbsIBi5q1q32Ubr/a3dfWk4PeyN0f4grw8FldU++aZ28CMK9p4fvDMhmquo1FysPy
         AwC8G74yfrIXAka2a+DxeVSJ8cdFAnqKxjQXOJyTf/Z3b0TidULpyvqZC8r2+fMUBr8X
         N5dRnIx4zrBbbERWl0qJ7wU6NxukOFRz52zube5IbrOhweeINbkG1qZfOrQ3ZB4VLsdU
         OklOU8vKNUzJ90kPOWzzPDpVG59x6PAm5YEYlV64CNuHK12gwp+d8ld3D32sbGpU+taU
         vtt4vqIMmXjanuBKCw3vwvZNU+72XJ80cyZH8RlN7fEOyfKPDtalDv7XOes8mzZeiyb7
         1Wvw==
X-Forwarded-Encrypted: i=1; AJvYcCWXqhgL0n4wo5q9Xjye+H+AVo55j+6j9pEm8Hi8Z/kDl2XSRctOq+utNnbc9SICEjF/rfVxFwWdfDaFNl0OT7d1@lists.infradead.org, AJvYcCXeabbXZpY/PMSSWt1dnimlzts0wS7aQ79kWMYNO0bEq+Ug5hnx/YjRdjBx/utwtmNf54F/PmVOEBpVJgCt80c=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzQCUOwpH5kPYDYg0iae/vpGTnM801/zUuSLaLWcsyL5LKCB7+
	O19FT1KMVYRx9jGxMk3IwFxU4H2y2fXI3o/TXOBoW6xm+UYrYd+C
X-Gm-Gg: ASbGncunnd09XAEzkG0x1Xd9KQqapCc7i7HIhv5t/aAO+3UJwFd8nD0G4caOtCWN1Tf
	RRga3+GjfltEtiS4RDu2TMY2agTEG00X/qbFUTfoWN28zMPMv/k7OxbjwbWiHOp+Y3WkhGFPm7c
	z3xN88qUBzfjRGtIZLX8hs4UZ+TAfY3caXpiWHwFE7JzQUbk/EZ4FRhh2b6DwpDto7iavyu7wDp
	9yLL58+2oaCB8z+IdmD1IEzLEQJcCeutE3B/f4zONJSEXckrz9IPqAH3TyCpsNBILS8McfDHQ==
X-Google-Smtp-Source: AGHT+IHPuvPyPPD6cvd+D5abHos051/bvNzDVRAVaVZTftg3J9BWL4z22siyBxu7rg8pdYMhYTe9LQ==
X-Received: by 2002:a17:90b:3505:b0:2ee:b4bf:2d12 with SMTP id 98e67ed59e1d1-2eeb4bf2eb3mr4701338a91.22.1733109594893;
        Sun, 01 Dec 2024 19:19:54 -0800 (PST)
Received: from kylin-ThinkBook-15-G2-ITL.. ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eed19aa971sm540723a91.1.2024.12.01.19.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 19:19:54 -0800 (PST)
From: xueqin Luo <luoxueqin@kylinos.cn>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: howard-yh.hsu@mediatek.com,
	benjamin-jw.lin@mediatek.com,
	StanleyYP.Wang@mediatek.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	chui-hao.chiu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	make24@iscas.ac.cn,
	xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH -next 1/2] wifi: mt76: mt7996: fix overflows seen when writing limit attributes
Date: Mon,  2 Dec 2024 11:19:16 +0800
Message-Id: <20241202031917.23741-2-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202031917.23741-1-luoxueqin@kylinos.cn>
References: <20241202031917.23741-1-luoxueqin@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_191955_925511_CB38517A 
X-CRM114-Status: GOOD (  10.49  )
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

DIV_ROUND_CLOSEST() after kstrtoul() results in an overflow if a large
number such as 18446744073709551615 is provided by the user.
Fix it by reordering clamp_val() and DIV_ROUND_CLOSEST() operations.
This commit was inspired by commit: 57ee12b6c514.

Fixes: 6879b2e94172 ("wifi: mt76: mt7996: add thermal sensor device support")
Signed-off-by: xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 5e96973226bb..3a175222f8ba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -85,7 +85,7 @@ static ssize_t mt7996_thermal_temp_store(struct device *dev,
 		return ret;
 
 	mutex_lock(&phy->dev->mt76.mutex);
-	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), 40, 130);
+	val = DIV_ROUND_CLOSEST(clamp_val(val, 40 * 1000, 130 * 1000), 1000);
 
 	/* add a safety margin ~10 */
 	if ((i - 1 == MT7996_CRIT_TEMP_IDX &&
-- 
2.34.1


