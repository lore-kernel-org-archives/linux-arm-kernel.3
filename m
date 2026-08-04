Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FB7C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 09:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U8iBjzi5EB2WI8WP3SfXRiDKDZBVj5v7DS4s8b6g/jk=; b=pXwbKzuszqlmxXwU4Kk6oJh4xW
	pek63pN4sExEbLSbgmmYRy5UtdtaOphpZ/bhU5Xt5TXrQrl6weDZyQByUxllUN4gBgarKYBEgGr5N
	Q7lAgBkhH+GpuAU4Nj7iif1W///J0lTBZhLyh0ZX0WSGsEez6+uiUCPCvbRJUw4saL4ACzAdUfPoL
	2O113ToYc3pJ5NH2IfxucX2v8mukVJLQ6fRPjScUhzfj+PnFQFrmx/VI7WRVhflpr2U4tL6h+MU+R
	O3Z39Mv2szofFqRv0enMLjaAKxRFKqw08Px7Um4jT6ngPoChyDukDnm2lf8b/Wmft8BZDpcN8SxR8
	eckV5KfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBv1-00000001U5d-2Zz2;
	Tue, 04 Aug 2026 09:58:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBuz-00000001U58-2mHM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 09:58:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so14922235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 02:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785837519; x=1786442319; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8iBjzi5EB2WI8WP3SfXRiDKDZBVj5v7DS4s8b6g/jk=;
        b=qVomHiJ5HVnAg3TJUMAaBN40eKfMKVB/tlDIKBYE0wvfkDN5OU68WEHHARKIgMW3Kp
         nszEceiOcwG0vE9xCZytUk6eAyXtk56aJbsr0NqB2qAAMfnNvVz9SLtuEYYfFl9KAmjH
         3MWn+NFhXqLuMIB1L1mpX6axmhZtq3kX3S0CQxs6YxcmGFhTmr1BQ6icpl7waFzgCK+5
         RrdNCCab4oISPmBywuegFI9tMvsCWwvvGw6FPT/X2Ke3DpBG4LsckvdePcIuKfzgENUj
         W7t0HYGW1c1KQuJtC3u5fTXzRGlk23s+adeZr7cYNQZ9Zha4eYlaGF7pu5nlzsnR6hTI
         eSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785837519; x=1786442319;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U8iBjzi5EB2WI8WP3SfXRiDKDZBVj5v7DS4s8b6g/jk=;
        b=DeeXfLJfn2Frq7843/QylEU2tn5ZtGq8H48DI3NGcz52cbhKXciuLZhK9PDOLwCSEE
         LG/uMSNOpfzBm0QSbaILDcGig9BccvkfatTLVpd12+KB1tfxXA1ZIMLkjfOR1zp0anQa
         B4EjsicVK/hJPeAWeP+gNRcjMjdA2WK0iMNz7QRFP+xGQTZmDIFKGzYvNtPm+Iv84NN6
         AzqNMU0014k53jsA759n5MAhi/PFuVQN/WrwmZZzrBaIQLfL75kiALAoT0mWkDDSeFSu
         3imf9Zn8di6cz5bNccpT3OCgl9YALVms11AR5fZfqnQ21ahB2i2gSnNSlw/xqznJ1q7W
         iANw==
X-Forwarded-Encrypted: i=1; AHgh+RqlHMYY9dwQa7u3laCuowtH5I57Sp8tkF+poKOpvIHzcjyRqvbJUCiItYlzVQ3gX0rWaWounyd4+gb+XBxMhabF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxws1H83EUz5wbwTKchpJgOrQOkS69sKGzLKMRiHrhCx+gr2M/a
	nqUu7hXZ3TmtxwjOzPTzY1Tq0cgYdbqqMXMrZYtndT+Fl/eYMk2CjGC8
X-Gm-Gg: AR+sD11Y9uW2au7XlS1JvkQKBmnYOUdkHxoxYfdKMDyVVbsYlxi2JbqZ8CvbqYZfmce
	YigrsNxHZpkFNIJyedK0QlR504YYMnH0p6c4BNzXD70J+ig1YYQ80SUszujA3x7PxaUpujByTgO
	hKfMr2VRnCvwY9Z/ty9p6mpW3LpD0HJkD68rYfr/lQuwBI60/egH5BO029ASVj8V7HSFdFTJV1q
	lUpr42kYJqKEMGVsIZdj4YAta/o7NO4+0HVVqq2kesn1ho93BIF4/L1buHhjP7NFY3FstVawqFZ
	S1IzL0FRiGKXUk7xPqF8VmJsIT/rm0AAxDMFq/ImT55tcjX71AgbMa0zmkSQfrRBLWAVCPcTO8G
	wG7qIMofKJPp+5WcHgE6nHDaSTgq/WCLGQNYTou97jTdE291nv5mq6N5QYIWxENkeAldqQodGDD
	NyBSSt8XTY+bJi1tiZWfX2xyMyLs3V/NpW2n6PQRRZBnEVKiVopsKY7fO2vFo=
X-Received: by 2002:a05:600c:524a:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-4980eb5cb45mr288946725e9.6.1785837519077;
        Tue, 04 Aug 2026 02:58:39 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807eb12c5sm186540075e9.3.2026.08.04.02.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 02:58:38 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	hlinux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: mt76: Fix spelling mistake "dowload" -> "download"
Date: Tue,  4 Aug 2026 10:56:48 +0100
Message-ID: <20260804095648.783881-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_025841_705272_B905634F 
X-CRM114-Status: GOOD (  12.36  )
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

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 2f925d22b9aa..9552fadbc17b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -3130,7 +3130,7 @@ mt76_connac_mcu_send_phy_ram_firmware(struct mt76_dev *dev,
 		err = mt76_connac_mcu_init_download(dev, addr, len, mode);
 		if (err) {
 			dev_err(dev->dev,
-				"The request to dowload PHY firmware failed.\n");
+				"The request to download PHY firmware failed.\n");
 			return err;
 		}
 
-- 
2.53.0


