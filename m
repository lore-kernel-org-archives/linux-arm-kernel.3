Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67849C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewfDI1ZgGJ9f7uoMqmTZW/ns6RfSEti1ZKdNzm+2NtA=; b=0j71vI+8FwaGWlUOYBF7NFWm02
	fbg+IePMOjtqITHGTsD4ltEWtNTHPsS8Xkqlkn9sD/Gx0sjflbMyFJSaxVNW8SzVPs/r2TGhHvOQz
	GONN2uhxt07pRsWW7BdhWuE8sC6I2fDB9wz+CmryyH6AF72a2Xg8fyYxfa11UI/EIu93HyUngdaQ9
	x1whkiaq6ULS4XPu8poTcQ6y+0UWRkNtp+JmBob0OJ+SlyOFIdoVskLBAHUtGvkJMO2MfbRroEmdG
	3AY52dbUV8ID+19dv18CALnQ1tH5d5xvMErUnll+PTGvd/IzVfUAyN0c56EJBRE2sgcM8cyvnLN2s
	i7ISQJvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SCQ-00000001pvC-2X0q;
	Fri, 04 Sep 2026 11:35:14 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SCJ-00000001prh-0KMI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:35:12 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7f48c750afcso825027a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 04:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521706; x=1789126506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ewfDI1ZgGJ9f7uoMqmTZW/ns6RfSEti1ZKdNzm+2NtA=;
        b=qj89fW52yuzhjgwbdYymMlPz80cY6eba0jFL/n16SGfSOPs3PfMX7QdYrev4uZgu/d
         22q95KbCqN+QUCO79JQ+Qe6DyRLbu8phTWsuuINKcL6L9QE3O3SzcAB2N55cV+Q6QhCx
         5yoVFwkJ65M98WHk8scFls2sVgcT2YYhYanCyPWftFaK7G48bXaYWKrS8vl1UzBS/tZw
         JgS+jIrgLS6a3Yfp6fqjxH/d2s5MMGerM+MFbLxuC77cFwveQRdpAown/WXSF3Vwyr7n
         NsdQ25pLi5I/4eyc0tvRQzG0AzAAENUteyBnXCm1KEaeV2KOcDx0i98mV+Pz+cdLJvAZ
         0R0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521706; x=1789126506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ewfDI1ZgGJ9f7uoMqmTZW/ns6RfSEti1ZKdNzm+2NtA=;
        b=tDwrOieo5f27mJSIIMJWqie3QPaxM8t4q+pgnI5+hWwWO1qtOOZi9t5oHwxk/uhvRl
         Ky3qbDNFixZT8juhmce7RWekEbh/gkFR5pMyQ/TklFfNWYRUHPEvD2unNfNahcb2yr6o
         wjEA607DQLM31UFZXKQLFFkdoH3qFc+HZx4eNCFmtWZqADx5oXNj9fkxQ4/+fcWuoc3+
         7x6vZhzM2aypFI1MbEQuw6C/Mnx3vn3+0neB4p/yE0UuPVN/m8iuWgAPHOJNVBL2IoKf
         NubPqgz2FlolKmqaQg5AXVYUiVM/H7i8ZNN5c9taOHpFOT4nNIWlWblsZydrB8Lwqg69
         N4GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvE0K7XoNWO0ODN3nddC2FmKkcb8zXptZeobRdHYeTWRCL3KPJt+V0ol7gFhYk2tB94ShLwLq6ZmO4RlmUH1Td@lists.infradead.org
X-Gm-Message-State: AFuF++l49VqGlMtteWcXStBe2lD9N/wpIO+mZs7ucdZIDh0zGvb1fFdd
	h99Z872suGcosRrXMykyV95D0St/bIHQ0H0c5oMSwZeKFtfQmfxr6Nzc
X-Gm-Gg: AYBFou1vSSeItZcATKYOIKPmnmaa4V5jDviFRY2IoF2drpFDFFk7lg6dQ1LYS/YzXaP
	3axfTSZWTZf3bP5TVhp3KB+BoTAr5HvOFflu4extwqIL3aLTUK5IJrpHJOmS0NWpkGNv9zrifYH
	4P60JvGU2j1WqRIgz3OHyq5vRtuL3ggsdmnsVDVSSCEw0LqbEUQkATZX7pEjz5yrc4LabMbokrO
	kH1wuZBihCN7wxhcoyu16/nzyj1VWDfFpPjIvIrt9ysYd3qOaKrpERWYfThta+DaZLq9+PiAifk
	kU0v+Mg1oeGQvjVFboYoh5SXydq5T4xm8bPg9rDRCHHxPLyuaH0A9yfIz+mlx8HWu7ao5UaVaHG
	dkeysfveAgQ4BtGbdFuV14YRgCxm89OKyfyoTISLitgoIgy1M7x8o2AFOLJ0X/eYaRXp738x2O2
	pFg1+gO0KsxNKySRkckS7mfkBIX1GFkZHHSN/aqdSzP+LJqtny5se78eQu69tHkBZ1n1E/x5pK2
	uIwxoNRHKyHSTU=
X-Received: by 2002:a05:6820:1787:b0:6b7:83c5:fdee with SMTP id 006d021491bc7-6b783c60345mr1409156eaf.47.1788521705811;
        Fri, 04 Sep 2026 04:35:05 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243a9388sm6054536c88.10.2026.09.04.04.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:35:05 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Andy Walls <awalls@md.metrocast.net>,
	Hans Verkuil <hverkuil@kernel.org>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/3] media: fix typos in comments
Date: Fri,  4 Sep 2026 17:04:42 +0530
Message-ID: <20260904113450.15838-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904113450.15838-1-hemanth.selam@gmail.com>
References: <20260904113450.15838-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_043507_138856_B7F30B11 
X-CRM114-Status: GOOD (  26.21  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/media/dvb-frontends/drxd_map_firm.h                   | 4 ++--
 drivers/media/i2c/ccs/ccs-data.h                              | 4 ++--
 drivers/media/i2c/hi847.c                                     | 2 +-
 drivers/media/i2c/ov772x.c                                    | 2 +-
 drivers/media/i2c/wm8739.c                                    | 2 +-
 drivers/media/pci/cx18/cx23418.h                              | 2 +-
 drivers/media/pci/saa7146/mxb.c                               | 4 ++--
 drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h             | 2 +-
 drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h | 4 ++--
 drivers/media/platform/renesas/rcar_drif.c                    | 2 +-
 drivers/media/radio/si4713/si4713.c                           | 2 +-
 drivers/media/usb/dvb-usb/dib0700_core.c                      | 2 +-
 drivers/media/usb/gspca/w996Xcf.c                             | 2 +-
 .../atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h    | 4 ++--
 drivers/staging/media/av7110/av7110.c                         | 2 +-
 15 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/media/dvb-frontends/drxd_map_firm.h b/drivers/media/dvb-frontends/drxd_map_firm.h
index bdcc63576df1..a6585e53d879 100644
--- a/drivers/media/dvb-frontends/drxd_map_firm.h
+++ b/drivers/media/dvb-frontends/drxd_map_firm.h
@@ -10,8 +10,8 @@
 
 /*
  * Note: originally, this file contained 12000+ lines of data
- * Probably a few lines for every firwmare assembler instruction. However,
- * only a few defines were actually used. So, removed all uneeded lines.
+ * Probably a few lines for every firmware assembler instruction. However,
+ * only a few defines were actually used. So, removed all unneeded lines.
  * If ever needed, the other lines can be easily obtained via git history.
  */
 
diff --git a/drivers/media/i2c/ccs/ccs-data.h b/drivers/media/i2c/ccs/ccs-data.h
index 638df69804ec..522466b81929 100644
--- a/drivers/media/i2c/ccs/ccs-data.h
+++ b/drivers/media/i2c/ccs/ccs-data.h
@@ -160,7 +160,7 @@ struct ccs_pdaf_pix_loc_pixel_desc_group {
  * @main_offset_y: Start Y coordinate of PDAF pixel blocks
  * @global_pdaf_type: PDAF pattern type
  * @block_width: Width of a block in pixels
- * @block_height: Heigth of a block in pixels
+ * @block_height: Height of a block in pixels
  * @num_block_desc_groups: Number of block descriptor groups
  * @block_desc_groups: Block descriptor groups
  * @num_pixel_desc_grups: Number of pixel descriptor groups
@@ -197,7 +197,7 @@ struct ccs_pdaf_pix_loc {
  * @module_rules: Rules for the module
  * @sensor_pdaf: PDAF data for the sensor
  * @module_pdaf: PDAF data for the module
- * @license_length: Lenght of the license data
+ * @license_length: Length of the license data
  * @license: License data
  * @end: Whether or not there's an end block
  * @backing: Raw data, pointed to from elsewhere so keep it around
diff --git a/drivers/media/i2c/hi847.c b/drivers/media/i2c/hi847.c
index def01aa07b2f..710328d7984f 100644
--- a/drivers/media/i2c/hi847.c
+++ b/drivers/media/i2c/hi847.c
@@ -2187,7 +2187,7 @@ struct hi847 {
 	/* Current mode */
 	const struct hi847_mode *cur_mode;
 
-	/* To serialize asynchronus callbacks */
+	/* To serialize asynchronous callbacks */
 	struct mutex mutex;
 };
 
diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index be3ba284ee0b..041f3b02e222 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -122,7 +122,7 @@
 #define LC_COEFB    0x4B /* Lens B channel compensation coefficient */
 #define LC_COEFR    0x4C /* Lens R channel compensation coefficient */
 
-#define FIXGAIN     0x4D /* Analog fix gain amplifer */
+#define FIXGAIN     0x4D /* Analog fix gain amplifier */
 #define AREF0       0x4E /* Sensor reference control */
 #define AREF1       0x4F /* Sensor reference current control */
 #define AREF2       0x50 /* Analog reference control */
diff --git a/drivers/media/i2c/wm8739.c b/drivers/media/i2c/wm8739.c
index db62bafb447c..9eaf48f1c3a2 100644
--- a/drivers/media/i2c/wm8739.c
+++ b/drivers/media/i2c/wm8739.c
@@ -217,7 +217,7 @@ static int wm8739_probe(struct i2c_client *client)
 
 	/* reset */
 	wm8739_write(sd, R15, 0x00);
-	/* filter setting, high path, offet clear */
+	/* filter setting, high path, offset clear */
 	wm8739_write(sd, R5, 0x000);
 	/* ADC, OSC, Power Off mode Disable */
 	wm8739_write(sd, R6, 0x000);
diff --git a/drivers/media/pci/cx18/cx23418.h b/drivers/media/pci/cx18/cx23418.h
index 22486f39bcda..4ee45be757cb 100644
--- a/drivers/media/pci/cx18/cx23418.h
+++ b/drivers/media/pci/cx18/cx23418.h
@@ -24,7 +24,7 @@
 #define CX18_CREATE_TASK			(MGR_CMD_MASK | 0x0001)
 
 /* Description: This command destroys an instance of a task
-   IN[0] - Task handle. Hanlde of the task to destroy
+   IN[0] - Task handle. Handle of the task to destroy
    ReturnCode - One of the ERR_SYS_... */
 #define CX18_DESTROY_TASK			(MGR_CMD_MASK | 0x0002)
 
diff --git a/drivers/media/pci/saa7146/mxb.c b/drivers/media/pci/saa7146/mxb.c
index d759e8a87e24..129d41c1862b 100644
--- a/drivers/media/pci/saa7146/mxb.c
+++ b/drivers/media/pci/saa7146/mxb.c
@@ -37,7 +37,7 @@
 /* global variable */
 static int mxb_num;
 
-/* initial frequence the tuner will be tuned to.
+/* initial frequency the tuner will be tuned to.
    in verden (lower saxony, germany) 4148 is a
    channel called "phoenix" */
 static int freq = 4148;
@@ -429,7 +429,7 @@ static int mxb_init_done(struct saa7146_dev* dev)
 	/* some stuff is done via direct write to the registers */
 
 	/* this is ugly, but because of the fact that this is completely
-	   hardware dependend, it should be done directly... */
+	   hardware dependent, it should be done directly... */
 	saa7146_write(dev, DD1_STREAM_B,	0x00000000);
 	saa7146_write(dev, DD1_INIT,		0x02000200);
 	saa7146_write(dev, MC2, (MASK_09 | MASK_25 | MASK_10 | MASK_26));
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h b/drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h
index b810c96695c8..9744e00b0066 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h
@@ -56,7 +56,7 @@ struct mdp_ipi_comm {
  * @ipi_id        : IPI_MDP
  * @ap_inst       : AP mtk_mdp_vpu address
  * @vpu_inst_addr : VPU MDP instance address
- * @status        : VPU exeuction result
+ * @status        : VPU execution result
  */
 struct mdp_ipi_comm_ack {
 	uint32_t msg_id;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
index 47070be2a991..c2c2a3a63dfd 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
@@ -53,7 +53,7 @@ struct vdec_ap_ipi_cmd {
 /**
  * struct vdec_vpu_ipi_ack - generic VPU to AP ipi command format
  * @msg_id	: vdec_ipi_msgid
- * @status	: VPU exeuction result
+ * @status	: VPU execution result
  * @ap_inst_addr	: AP video decoder instance address
  */
 struct vdec_vpu_ipi_ack {
@@ -98,7 +98,7 @@ struct vdec_ap_ipi_dec_start {
 /**
  * struct vdec_vpu_ipi_init_ack - for VPU_IPIMSG_DEC_INIT_ACK
  * @msg_id	: VPU_IPIMSG_DEC_INIT_ACK
- * @status	: VPU exeuction result
+ * @status	: VPU execution result
  * @ap_inst_addr	: AP vcodec_vpu_inst instance address
  * @vpu_inst_addr	: VPU decoder instance address
  * @vdec_abi_version:	ABI version of the firmware. Kernel can use it to
diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index 0844934f7aa6..bd67e8e16f53 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -464,7 +464,7 @@ rcar_drif_get_fbuf(struct rcar_drif_sdr *sdr)
 					rcar_drif_frame_buf, list);
 	if (!fbuf) {
 		/*
-		 * App is late in enqueing buffers. Samples lost & there will
+		 * App is late in enqueuing buffers. Samples lost & there will
 		 * be a gap in sequence number when app recovers
 		 */
 		rdrif_dbg(sdr, "\napp late: prod %u\n", sdr->produced);
diff --git a/drivers/media/radio/si4713/si4713.c b/drivers/media/radio/si4713/si4713.c
index 0c0354566b0a..150d07f6b319 100644
--- a/drivers/media/radio/si4713/si4713.c
+++ b/drivers/media/radio/si4713/si4713.c
@@ -667,7 +667,7 @@ static int si4713_tx_tune_measure(struct si4713_device *sdev, u16 frequency,
 /*
  * si4713_tx_tune_status- Returns the status of the tx_tune_freq, tx_tune_mea or
  *			tx_tune_power commands. This command return the current
- *			frequency, output voltage in dBuV, the antenna tunning
+ *			frequency, output voltage in dBuV, the antenna tuning
  *			capacitance value and the received noise level. The
  *			command also clears the stcint interrupt bit when the
  *			first bit of its arguments is high.
diff --git a/drivers/media/usb/dvb-usb/dib0700_core.c b/drivers/media/usb/dvb-usb/dib0700_core.c
index 1caabb51ea47..5d2fa7037c00 100644
--- a/drivers/media/usb/dvb-usb/dib0700_core.c
+++ b/drivers/media/usb/dvb-usb/dib0700_core.c
@@ -560,7 +560,7 @@ int dib0700_download_firmware(struct usb_device *udev, const struct firmware *fw
 	fw_version = (buf[8] << 24) | (buf[9] << 16) | (buf[10] << 8) | buf[11];
 
 	/* set the buffer size - DVB-USB is allocating URB buffers
-	 * only after the firwmare download was successful */
+	 * only after the firmware download was successful */
 	for (i = 0; i < dib0700_device_count; i++) {
 		for (adap_num = 0; adap_num < dib0700_devices[i].num_adapters;
 				adap_num++) {
diff --git a/drivers/media/usb/gspca/w996Xcf.c b/drivers/media/usb/gspca/w996Xcf.c
index 79baa0c1a031..700c39fe307c 100644
--- a/drivers/media/usb/gspca/w996Xcf.c
+++ b/drivers/media/usb/gspca/w996Xcf.c
@@ -407,7 +407,7 @@ static void w9968cf_set_crop_window(struct sd *sd)
 
 	if (sd->sensor == SEN_OV7620) {
 		/*
-		 * Sigh, this is dependend on the clock / framerate changes
+		 * Sigh, this is dependent on the clock / framerate changes
 		 * made by the frequency control, sick.
 		 *
 		 * Note we cannot use v4l2_ctrl_g_ctrl here, as we get called
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h
index b8206d2f3d31..97e63082d254 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h
@@ -102,8 +102,8 @@ struct ia_css_3a_grid_info {
  *  awb_lg_*: Thresholds to check the saturated bayer pixels for AWB.
  *    Condition of effective pixel for AWB level gate check:
  *      bayer(sensor) <= awb_lg_high_raw &&
- *      bayer(when AWB statisitcs is calculated) >= awb_lg_low &&
- *      bayer(when AWB statisitcs is calculated) <= awb_lg_high
+ *      bayer(when AWB statistics is calculated) >= awb_lg_low &&
+ *      bayer(when AWB statistics is calculated) <= awb_lg_high
  *  af_fir*: Coefficients of high pass filter to calculate AF statistics.
  *
  *  ISP block: S3A1(ae_y_* for AE/AF, awb_lg_* for AWB)
diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 06c43b5f8a87..432404eceaea 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -2347,7 +2347,7 @@ static int av7110_attach(struct saa7146_dev *dev,
 
 		/* RESET SAA7146 */
 		saa7146_write(dev, MC1, MASK_31);
-		/* autodetection success seems to be time-dependend after reset */
+		/* autodetection success seems to be time-dependent after reset */
 
 		/* Fix VSYNC level */
 		saa7146_setgpio(dev, 3, SAA7146_GPIO_OUTLO);
-- 
2.48.1


