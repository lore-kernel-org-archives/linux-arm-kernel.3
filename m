Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3C8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 10:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8HePeeifvB/opdYPmqi87Awn5dRCasskHjfVg9hPOIo=; b=p7UEgT6xfBIrmPi1Xuq34vLA4T
	tRL9MmO6fiAW5KlLjuarilHMF2ATch/GeLNLpqORVrHYd6RosSEGUfxdc5VHKmbHOPpqLPV1YInXI
	Okk7mSaIDT5bZ8XXua2QpVbTFp0daqBHDQx79XMEqGJN+UmpBQVXDs6wIPQ0QXnVJToPdwEspO9u0
	DgtLfu9xyO+eUp8CCXci6TWrT1mfeuohICklT0xSSGCHt/B0swpv5Cc9rT4H5taB0+gXiV0/5thdw
	0AqR43649QZqSv6Y6yZ8OzLIWDErAdBJc2Bltg4rFKomNRkwNDGNQLCSWWcDrjQTJwlchFG0m6COF
	CO1+3Drg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEyE-00000004Dcu-38yJ;
	Thu, 02 Jul 2026 10:48:38 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEyC-00000004DcJ-1F4q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 10:48:37 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c999f162c9aso776206a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 03:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782989315; x=1783594115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HePeeifvB/opdYPmqi87Awn5dRCasskHjfVg9hPOIo=;
        b=g+WiyOFCNbKxuvWFdvB296TKRzRGZU7hcq4tOk3eb77cSaezx+r6effvVbxiT8FTjG
         pOOgRmVJFcDvzqWoruBSS7BS5CiyJ/2knTeXW593yf1c7MLRRmQTFfjImSsO2PwlFJMy
         ush7sv3Bhy8aehnrvbrypD7IjlbncCYGjxWtkdZVi57+rJJdU3QSfvddR5z8wRzt49eq
         jqt3g843cn2Gx/p4Czi72tthKDwi56+uEG+SWh+g1lHiz0LO8K1uhtUbvP0Cbrx43qmL
         PqjWvRFumZZcREGjY2GndgIYmAq4nkJDgGjB35Qj9l+gB5adEGujU/BtnqYB/BpixGup
         AW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989315; x=1783594115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8HePeeifvB/opdYPmqi87Awn5dRCasskHjfVg9hPOIo=;
        b=MK2KDQ/hz8pujPideiRtHJdiZ3Q99dWK6a/US1mcCf54AWsEY7+rYGCFJ5i4w0CRcI
         yz85FryBMCg14yJDr64iv1flQKGRVlbytFw4o12+Buml1OrFNK1uRwtH7iqecVPAs/LP
         axcecFrI2HzY9KdMutAUb1b4gWOVnEmysM/eRe1mNzyPViEIumlYIQ3xD5r5VnYI1w4Y
         LOgl2/io+8fdkts+3+KVbqoCfo0IJdxRSGmbJqLgIVrE7ders9gEWQrE5eZ6zuMstIeg
         CLjv672eTeMYXGKjrwTZboYV/eTAoi2z5lTH9dCluU+7F6Xyokj0m+kvPTVDcrbV7NdY
         sNJA==
X-Forwarded-Encrypted: i=1; AFNElJ+8iU9/zeDRd4yMh3j3FDPhLnNkSCYg0E7Wfnwogdra6M5xlD4q9wDPw7PY8yA/y/H5N1fzOg+XC8hs5zKRdAwK@lists.infradead.org
X-Gm-Message-State: AOJu0YwX4aCYRuTzrEsvtnuhx0NHkNh/giSR0tHNwTV/A+fIU2O8xvMT
	yoKxt4Y5k5uMsXKXD7S5luMi0eduwal4B9DShM1LR+VJH3+ZEN8zEvNV
X-Gm-Gg: AfdE7cnAiQh7mBigY+xpNkjhHAOTP6biUjuKht4sMTIgxE+7Ou1I4DYAP9iJBZ7Vf4w
	aALB0O3ZU2NllHV59xCHM6aMaN71YfPK3QPxX9fYhu0G8uqh+Ro/qpyHSGPN8QMFrbgq/OoFPbS
	bLoQ9Spg792ezIKAFvf47fMVTVta6QQF8Mxti0MGTrJBywolpKsloQvzGSCPlDZHGLTy3/sfzDK
	Z/5zbKYksArb3PQxYEH25cb9xPlXYqA6K1Ytq28gzHFCmcrdbLFp1dHNMn5jFJdOCVGK63xiUd7
	Val2K3NMd1DTC7m2HS4cFLba0/JDwgy6i6o1MQKq/iSsVBZQT/gya7tJE4HN9clLCJYlg6M8Ceo
	gQwpZG3HId7iTsfn3pZXTxYo72su3TQiA3fjhnE3iRsXmRdD3bKEn1UV9QAhmz7fRgFL/CAJFJv
	0vOUUM8JWqB3BU+c8SyefvPfwF6g0BLVzOfLX45Hi3fqRTWO6J1GpfKP8UY31xay5+EvB8J2W4R
	pl+en0X8/qOBkMZlkFoNbSWFw2vY8+vb1KD4RPNxMk=
X-Received: by 2002:a05:6a20:e20f:b0:3b4:669c:ee32 with SMTP id adf61e73a8af0-3bfed3b26edmr7042853637.37.1782989314653;
        Thu, 02 Jul 2026 03:48:34 -0700 (PDT)
Received: from leonardoc-nb (201-68-197-145.dsl.telesp.net.br. [201.68.197.145])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f116065c5sm5936815eec.11.2026.07.02.03.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:48:34 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com,
	bparrot@ti.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jsarha@ti.com,
	jyri.sarha@iki.fi,
	kristo@kernel.org,
	krzk+dt@kernel.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	nm@ti.com,
	robh@kernel.org,
	sam@ravnborg.org,
	simona@ffwll.ch,
	stable@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	tomi.valkeinen@ideasonboard.com,
	tomi.valkeinen@ti.com,
	tzimmermann@suse.de,
	vigneshr@ti.com
Subject: Re: [PATCH 4/4] drm/tidss: Fix sampling edge configuration
Date: Thu,  2 Jul 2026 07:48:01 -0300
Message-ID: <20260702104817.1219078-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730-fix-edge-handling-v1-4-1bdfb3fe7922@bootlin.com>
References: <20250730-fix-edge-handling-v1-4-1bdfb3fe7922@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_034836_340835_16030247 
X-CRM114-Status: GOOD (  12.98  )
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

Hello,

We tested this patch and it introduces a regression on our panel.

On our board, a Toshiba TC358768 DPI-to-DSI bridge is connected to the parallel
RGB output. The bridge requires data to be driven on the negative edge, and
this is also reflected by the `ipc` variable in `dispc_vp_enable()`, which is
set to `1`.

With this patch applied, however, data is driven on the positive edge instead.

According to SPRUIV7C, both `MAIN_CTRL_MMR_CFG0_DPI0_CLK_CTRL[8]` and
`DSS_VP1_POL_FREQ[14] IPC` should be programmed consistently. However, if we
follow the actual bit descriptions, and ignore the sentence saying that the two
programmed values should be the same, the data is driven on the requested edge.

From SPRUIV7C (https://www.ti.com/lit/ug/spruiv7b/spruiv7c.pdf):

MAIN_CTRL_MMR_CFG0_DPI0_CLK_CTRL[8] (DPI0_CLK_CTRL_DATA_CLK_INVDIS):

        Clock edge select for DPI0 data outputs

        Note that this value should be the same as the programmed value of
        DSS_POL_FREQ[14] IPC.

        Reset Source: mod_por_rst_n

        0 DATA and DE are driven on the falling edge of clk
        1 DATA and DE are driven on the rising edge of clk


    DSS_VP1_POL_FREQ[14] (IPC)

        Invert pixel clock

        To set data to pixel clock relationship, CTRL_MMR_DPI0_CLK_CTRL[8]
        DPI0_CLK_CTRL_DATA_CLK_INVDIS setting should be the same as the [14]
        IPC setting.

        0 Data is driven on the LCD data lines on the rising-edge of the pixel clock
        1 Data is driven on the LCD data lines on the falling-edge of the pixel clock

So, the proposed fix to this patch is:

```diff
- regmap_update_bits(dispc->clk_ctrl, 0, 0x100, ipc ? 0x100 : 0x000);
+ regmap_update_bits(dispc->clk_ctrl, 0, 0x100, ipc ? 0x000 : 0x100);
```

Reverting the patch also makes the Toshiba bridge work correctly again.
However, we can confirm that the patch is needed, otherwise only the
positive-edge case (our case) works correctly.

In other words, the two registers need to match semantically, not numerically.

