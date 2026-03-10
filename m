Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F88FD4F2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 20:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=maRFdwFBItYsUxmd+9t8qBnRnOAkqFEhAXgbmQcZeFE=; b=N+MgzX7lWhyeOoQNzUqhouIQqE
	iKSb5v5EX7ArGFZLqPTbe/1svh04Y6KLEhqIuyoMCfxXz4WgdBKcUF3EMbAFQHDsXBFaRee15rUZT
	G3447PNdP2CR3Cqvt2zWbQKosQQLIcw6S7rbNRf7agF26QQc/KmG4brJaVQHcqxZ51W77YfMMKZ0Z
	lrdZ97Ub8bPux8ala8LC/hBHrti6UYZKIGojjciOe9+28l+PHo6WZvkdaTKfla3ACpdZs52HUetCF
	4hxS8M37InlfSUFY//OfC3jpy/QAwV+uyckhn8/kSBN0jEQ/HslkxaG1/qdMi2vfV/YSaAS33zVsK
	tKkhilGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03Lx-0000000AEF4-3sve;
	Tue, 10 Mar 2026 20:06:53 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03Lu-0000000AEBy-1Cxi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 20:06:51 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-82735a41920so4945701b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 13:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173209; x=1773778009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maRFdwFBItYsUxmd+9t8qBnRnOAkqFEhAXgbmQcZeFE=;
        b=lIqm4WZj/zjBg4NhowP4X3bYcQ68UFEz37FJkneK3n4TR1cCTZWLMESOjpg15tm8YN
         l+TgtsO8R7n0wbxV/x+PMZ61iOVBFbbuO5FCz7WsthhOQoW8u397Mgy7EphF+cgrfEC6
         Ieuy/pMJ7RDSBvGNpMeNLucJixqmKCsoTkg49EWp6cnkY5aPBbsmPTxnBCoXEPsR/007
         jW7vhfcbUufP/9NuzFkRrt8ML+BU0MRpRgaaPLFnDmbbr3KkHvQmXgNgDmbwWPQV8VIj
         +O7xIApJZGkjUw3zBhYc7RkeNaQwZcJ+Af+29r168Mt2La8VovTJbuMVfsGRmQ1/Fdmz
         HTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173209; x=1773778009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=maRFdwFBItYsUxmd+9t8qBnRnOAkqFEhAXgbmQcZeFE=;
        b=dmXmPSIxGp8Flyyy9eQkXff47/BK4gLtoyu1YddsAimiJiYG9pFLjKMiqqpYgm6oqK
         1jcXQMhkJqUPoPDJBoY0CVmByPkmpx8seeh2p9Z5GF27DD8Q630Gp64RUVK0ZLvztXEd
         /eSz5OaXzL2RyNU8txvem5ijFrcyxbuxShDhOnF/RvzH1tMrWrHE1Wyr6wAT/c4VXdN7
         Ew2IVGSR9kndnY8rns4LqCPV8QAvBDpptaP5adl11Dxs0vzf5Ry5klSluycf/VBmfH4u
         PuSTouF+P1e4HNJKWDOLYWp7ip7foFmLMC6TqWULblfJUkly5TARwsfnal8L7oFTry55
         USIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi2WzKCAL7tVMSb5TJeSygXVB5O0ffOSKGwggyqmvIhYc2ah5F+LoLJwIM9kHXvcxB40V7VuRs5oyjG/zTXqqm@lists.infradead.org
X-Gm-Message-State: AOJu0YzWotNCB8+cOcNwLnxsWzGF0RvlANu+rFJ2NISzXcZY3k9BbTlX
	TvDGQOm+nkP8p7SQnfZo1A//b18FCz6l/FR3y0ZBZ9nSE11h4rHYT0/G
X-Gm-Gg: ATEYQzwxCDRrMpNDxH2zPdJJ8VONQCdkvaEhZfLpUQdVbmLK7rqx9hUjiFDrwf3QvQy
	Oxuf47ZvKjqE4tgscNXBQfILx1owboEySZ7NQhCLOmSInRxMmx4LdqH0WZL7+lmjxe6O6z/gZQH
	fXevaR0DqeWOg2SbWrFEk3HDOmE4U/Anm6/HyxUXIStVQBzJS17KtWnKbzvZyffyPgMJZow5HdN
	t1qi7Czt09jcdledEe609eP8yNYr2iGBMFc83OgMYAf/Xl2T3JI1YkGDurTv1ybiyiKXU+6ZhX2
	8zHYVGdW7o9WG74XCAeeYI2Pap7hNsvpMt/H+vIP2EBOhytvk53bazblancYbcccwpwQxGBB2fp
	H5o4DJ6OKK4n6tH7udVDLhw46IOv/6ZQkyLPnvRyhIuN8RJwlc6oObObV6fqrL4rNi1PG0Vvxta
	zX25SRKYQLBT4zd+usU8WbxDtOZDkpsYlQqO71kekH+xazUtzL
X-Received: by 2002:a05:6a00:ac0f:b0:829:7e6d:cf1f with SMTP id d2e1a72fcca58-829f721be36mr107593b3a.51.1773173209251;
        Tue, 10 Mar 2026 13:06:49 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:06:48 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 7/7] staging: rtl8723bs: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:13 +0530
Message-Id: <20260310200513.2162018-8-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_130650_337112_36F4F024 
X-CRM114-Status: GOOD (  13.13  )
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

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.

No functional change intended for kmalloc().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 ++-----
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 37 ++++---------------
 2 files changed, 11 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 8d259820f103..2badf7d1aec4 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -627,7 +627,6 @@ static void hal_ReadEFuse_WiFi(
 	u8 *pbuf
 )
 {
-	u8 *efuseTbl = NULL;
 	u16 eFuse_Addr = 0;
 	u8 offset, wden;
 	u8 efuseHeader, efuseExtHdr, efuseData;
@@ -640,7 +639,7 @@ static void hal_ReadEFuse_WiFi(
 	if ((_offset + _size_byte) > EFUSE_MAX_MAP_LEN)
 		return;
 
-	efuseTbl = kmalloc(EFUSE_MAX_MAP_LEN, GFP_ATOMIC);
+	u8 *efuseTbl __free(kfree) = kmalloc(EFUSE_MAX_MAP_LEN, GFP_ATOMIC);
 	if (!efuseTbl)
 		return;
 
@@ -702,8 +701,6 @@ static void hal_ReadEFuse_WiFi(
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BYTES, (u8 *)&used);
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_USAGE, (u8 *)&efuse_usage);
-
-	kfree(efuseTbl);
 }
 
 static void hal_ReadEFuse_BT(
@@ -713,7 +710,6 @@ static void hal_ReadEFuse_BT(
 	u8 *pbuf
 )
 {
-	u8 *efuseTbl;
 	u8 bank;
 	u16 eFuse_Addr;
 	u8 efuseHeader, efuseExtHdr, efuseData;
@@ -728,7 +724,7 @@ static void hal_ReadEFuse_BT(
 	if ((_offset + _size_byte) > EFUSE_BT_MAP_LEN)
 		return;
 
-	efuseTbl = kmalloc(EFUSE_BT_MAP_LEN, GFP_ATOMIC);
+	u8 *efuseTbl __free(kfree) = kmalloc(EFUSE_BT_MAP_LEN, GFP_ATOMIC);
 	if (!efuseTbl)
 		return;
 
@@ -739,7 +735,7 @@ static void hal_ReadEFuse_BT(
 
 	for (bank = 1; bank < 3; bank++) { /*  8723b Max bake 0~2 */
 		if (hal_EfuseSwitchToBank(padapter, bank) == false)
-			goto exit;
+			return;
 
 		eFuse_Addr = 0;
 
@@ -804,9 +800,6 @@ static void hal_ReadEFuse_BT(
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BT_BYTES, (u8 *)&used);
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BT_USAGE, (u8 *)&efuse_usage);
-
-exit:
-	kfree(efuseTbl);
 }
 
 void Hal_ReadEFuse(
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index c9cb20c61a2b..303139a75551 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -179,9 +179,7 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 	if (shift == 0) {
 		val = sd_read32(intfhdl, ftaddr, NULL);
 	} else {
-		u8 *tmpbuf;
-
-		tmpbuf = kmalloc(8, GFP_ATOMIC);
+		u8 *tmpbuf __free(kfree) = kmalloc(8, GFP_ATOMIC);
 		if (!tmpbuf)
 			return SDIO_ERR_VAL32;
 
@@ -189,8 +187,6 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 		sd_read(intfhdl, ftaddr, 8, tmpbuf);
 		memcpy(&le_tmp, tmpbuf + shift, 4);
 		val = le32_to_cpu(le_tmp);
-
-		kfree(tmpbuf);
 	}
 	return val;
 }
@@ -223,19 +219,17 @@ static s32 sdio_readN(struct intf_hdl *intfhdl, u32 addr, u32 cnt, u8 *buf)
 	if (shift == 0) {
 		err = sd_read(intfhdl, ftaddr, cnt, buf);
 	} else {
-		u8 *tmpbuf;
 		u32 n;
 
 		ftaddr &= ~(u16)0x3;
 		n = cnt + shift;
-		tmpbuf = kmalloc(n, GFP_ATOMIC);
+		u8 *tmpbuf __free(kfree) = kmalloc(n, GFP_ATOMIC);
 		if (!tmpbuf)
 			return -ENOMEM;
 
 		err = sd_read(intfhdl, ftaddr, n, tmpbuf);
 		if (!err)
 			memcpy(buf, tmpbuf + shift, cnt);
-		kfree(tmpbuf);
 	}
 	return err;
 }
@@ -326,22 +320,18 @@ static s32 sdio_writeN(struct intf_hdl *intfhdl, u32 addr, u32 cnt, u8 *buf)
 	if (shift == 0) {
 		err = sd_write(intfhdl, ftaddr, cnt, buf);
 	} else {
-		u8 *tmpbuf;
 		u32 n;
 
 		ftaddr &= ~(u16)0x3;
 		n = cnt + shift;
-		tmpbuf = kmalloc(n, GFP_ATOMIC);
+		u8 *tmpbuf __free(kfree) = kmalloc(n, GFP_ATOMIC);
 		if (!tmpbuf)
 			return -ENOMEM;
 		err = sd_read(intfhdl, ftaddr, 4, tmpbuf);
-		if (err) {
-			kfree(tmpbuf);
+		if (err)
 			return err;
-		}
 		memcpy(tmpbuf + shift, buf, cnt);
 		err = sd_write(intfhdl, ftaddr, n, tmpbuf);
-		kfree(tmpbuf);
 	}
 	return err;
 }
@@ -491,7 +481,6 @@ static s32 _sdio_local_read(
 	struct intf_hdl *intfhdl;
 	u8 mac_pwr_ctrl_on;
 	s32 err;
-	u8 *tmpbuf;
 	u32 n;
 
 	intfhdl = &adapter->iopriv.intf;
@@ -503,7 +492,7 @@ static s32 _sdio_local_read(
 		return _sd_cmd52_read(intfhdl, addr, cnt, buf);
 
 	n = round_up(cnt, 4);
-	tmpbuf = kmalloc(n, GFP_ATOMIC);
+	u8 *tmpbuf __free(kfree) = kmalloc(n, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -ENOMEM;
 
@@ -511,8 +500,6 @@ static s32 _sdio_local_read(
 	if (!err)
 		memcpy(buf, tmpbuf, cnt);
 
-	kfree(tmpbuf);
-
 	return err;
 }
 
@@ -529,7 +516,6 @@ s32 sdio_local_read(
 	struct intf_hdl *intfhdl;
 	u8 mac_pwr_ctrl_on;
 	s32 err;
-	u8 *tmpbuf;
 	u32 n;
 
 	intfhdl = &adapter->iopriv.intf;
@@ -544,7 +530,7 @@ s32 sdio_local_read(
 		return sd_cmd52_read(intfhdl, addr, cnt, buf);
 
 	n = round_up(cnt, 4);
-	tmpbuf = kmalloc(n, GFP_ATOMIC);
+	u8 *tmpbuf __free(kfree) = kmalloc(n, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -ENOMEM;
 
@@ -552,8 +538,6 @@ s32 sdio_local_read(
 	if (!err)
 		memcpy(buf, tmpbuf, cnt);
 
-	kfree(tmpbuf);
-
 	return err;
 }
 
@@ -570,7 +554,6 @@ s32 sdio_local_write(
 	struct intf_hdl *intfhdl;
 	u8 mac_pwr_ctrl_on;
 	s32 err;
-	u8 *tmpbuf;
 
 	intfhdl = &adapter->iopriv.intf;
 
@@ -583,7 +566,7 @@ s32 sdio_local_write(
 	)
 		return sd_cmd52_write(intfhdl, addr, cnt, buf);
 
-	tmpbuf = kmalloc(cnt, GFP_ATOMIC);
+	u8 *tmpbuf __free(kfree) = kmalloc(cnt, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -ENOMEM;
 
@@ -591,8 +574,6 @@ s32 sdio_local_write(
 
 	err = sd_write(intfhdl, addr, cnt, tmpbuf);
 
-	kfree(tmpbuf);
-
 	return err;
 }
 
@@ -880,16 +861,14 @@ void sd_int_dpc(struct adapter *adapter)
 	}
 
 	if (hal->sdio_hisr & SDIO_HISR_TXERR) {
-		u8 *status;
 		u32 addr;
 
-		status = kmalloc(4, GFP_ATOMIC);
+		u8 *status  __free(kfree) = kmalloc(4, GFP_ATOMIC);
 		if (status) {
 			addr = REG_TXDMA_STATUS;
 			hal_sdio_get_cmd_addr_8723b(adapter, WLAN_IOREG_DEVICE_ID, addr, &addr);
 			_sd_read(intfhdl, addr, 4, status);
 			_sd_write(intfhdl, addr, 4, status);
-			kfree(status);
 		}
 	}
 
-- 
2.34.1


