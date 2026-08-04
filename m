Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C56C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 09:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6J9elifCKAWEzypuHq/Sr8Czg7s6Stu3N7kACkBl3bI=; b=L6izC1VfJvXfrwhovyirClxy+O
	dycReVIlhgRTZWQDMdnO1WQ9LZktqs09Jd5hc1kWL+1OAbKOWwYX5+Dq++iPBzUJiUkPGfEzKrnGe
	vwDQP1R7snyrJAedmYFFsucJqPi+t4UrPqyeZcSQxQu74fWFqyCuNu+GKgRqOQ2Jgf2/Od5Md/xEq
	AK4VNkPKQ4YavFn8k8WS5S7kHD03P9QeiDgTrn/j2gbxzRNXnExKejl9vz6j277tv6CeJMfHUDBBT
	Th5dh2cmQD27eIxUD1T8ZEI45oGq43L6I2is8cZ3QfBO/Dj8zTktB+CuWJqktqqzQk28MENgrQcBR
	c0EIKRdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBEI-00000001QK0-1BES;
	Tue, 04 Aug 2026 09:14:34 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBEE-00000001QIp-467u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 09:14:32 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47fe45db360so211688f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 02:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn.de; s=google; t=1785834868; x=1786439668; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6J9elifCKAWEzypuHq/Sr8Czg7s6Stu3N7kACkBl3bI=;
        b=i+K0cIy7Wuk52TMWJCZUFVdWbbBjgBChnOTTz0lE3FiXgmBGJb1d4wGgg5ROikmSbW
         IYtldmWtVkKaFsq+1a2f6+kstMfMu0gINHpfslEsK0D/4vlq4ENoSmpqINR71KiTzdVK
         NaigMFqDFwRjK+2NZgcT+AI3NqF8ptl8txzvvtcRCnVKN46FNBTQzMFW1+nUe2eH8kw0
         hRTFDWzJre7CSj6R3+fpJqvMpuM92v4l8StoFvwswYkJOidz0DmHBSNB++/ldJpsrzou
         4S40ll2UeghFC/ZEjZMlu9VTNo6U+Q6VfJX0YsWbxnDMflkNOA5oxNksyxs/OWVJf69c
         GMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785834868; x=1786439668;
        h=content-type:content-transfer-encoding:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6J9elifCKAWEzypuHq/Sr8Czg7s6Stu3N7kACkBl3bI=;
        b=MPHl+DdvbSV8VH52VX03R47RWgcRL7dLWxIZRCjxg0XlO6yoiaBH6N28R3YP1N74Y1
         45nRZUSrm170soVKZolxgY/p5TaK/ex8J9viH7qz3utcsVpyHSgRVa3r55749ngYW+ZN
         6NUpnpusNsOM5cvhz5CIQxxOo4C7+V1MTXVMeEVDgiUhDy0NAjsEEjuCBKTCz7fadmph
         F+y7mn+5vqjRZwK8+cnfaIiO4mf2yFK+l9Y3901vlVsDtjV52eATM+n2RaEQirsiQd7m
         vg482sw64Lf4ln+kDJgzcoDPxEN52lwWcXforJIjG2GBsXjANEapIxgdvL3aNdw4OjeK
         46ig==
X-Forwarded-Encrypted: i=1; AHgh+RpcwCZuTGf28s673If11v6VSBcBX3LtkL4YxUU0VV7jRMcnsM0KZGclpBI5vuACGjql8Sw4wmQJR+0xP4sTYLlr@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0hZN/LtXv1aYDu6O8J1DDz9PjImCzYRqC/rZhcGckIovk3BCh
	jkBTPYvJs6lTIPIMZPMGRG0pni363J1StRpBJHm4kiiTB7z8sOvWCFWKn9v90SpbxXgaD2M/cYm
	IMSKArkPVEtuU3lv2ftkAejN6wMULgZzcjmYOZn+x+WUWH4uIylR768lwprbzUFCiluRkdw==
X-Gm-Gg: AR+sD1071xDx2Eliw4bwDFtcBovtayB9TbEANqQporiL+6vRLrwV2PEV/RbtoPbh1nK
	I4v/EjS3SvzLUPaUbEVqXyCKw01nkIZVKdwT53zZNjpMFPFJVY6l6Y5rq1SLCXVtO/p+CoPFKJM
	z1gxyOC/VQWSaauELfj4jWKIgY/TEvN0exR2/0nAYtEvsPpB4JGgqHZUHrzbABPIKIxgbajT3nf
	dlQFdycPquSFP14ZaSTQ/MOZ7Jl32aG/n5dpVh1vxg8zRFJ2DFbBHNux802xDl3w7R1J7Pi0fF9
	gCV5ABwdQKAdExqNXQET7k0ZTNjMizUX0cIrhVRaia8S8YyETwke2ABfrikX3slo9Ul+f1IkY/m
	szLQr4NRb6E8/hybC338jIDLwCnnPD8Hmv5ETUPevpbondKD9cEQyQGJf3IVTT5GsEq/2pvz+3N
	PNsnFhbi8c4Bp2fxXyfpirmRk9c2yCBbG6rPUSaa7KGtgTklik6PDJFTZkyZTwLNs9ctsbrjozZ
	B28RrNpnAkn2bgmB8ih/hHkcZ1703IGSoPZDgkTwEoYE5zQZYJw6cY=
X-Received: by 2002:a05:600c:c494:b0:498:8e6:d463 with SMTP id 5b1f17b1804b1-4980c657c57mr147306445e9.1.1785834867640;
        Tue, 04 Aug 2026 02:14:27 -0700 (PDT)
Received: from localhost (dslb-092-075-058-142.092.075.pools.vodafone-ip.de. [92.75.58.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4068fb7sm42625623f8f.0.2026.08.04.02.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 02:14:27 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: Andi Shyti <andi.shyti@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: iproc: recover the bus on transfer timeouts
Date: Tue,  4 Aug 2026 11:14:05 +0200
Message-ID: <20260804091405.171214-1-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_021431_347752_959D9156 
X-CRM114-Status: GOOD (  19.24  )
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

Just resetting the controller is not always enough to recover from a
timed out transfer, the bus may need to be cleared as well.

So add support for generic SCL recovery by switching to bit-banged mode
for manual control of SCL and SDA signals, and using it when SDA is
still low after a timeout.

Clearing SDA does not reset START_BUSY, so regardless of clearing SDA,
the controller might still need to be reset as well.

This is loosely inspired by iproc_smb_sda_low_recovery() from the
non-upstream iproc smbus driver implementation [1].

[1] https://github.com/opencomputeproject/onie/blob/master/patches/kernel/3=
.2.69/driver-iproc-smbus.patch

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 92 ++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bc=
m-iproc.c
index 66bb3bfdaa4c..1d3732c76c09 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -15,6 +15,7 @@
 #define CFG_OFFSET                   0x00
 #define CFG_RESET_SHIFT              31
 #define CFG_EN_SHIFT                 30
+#define CFG_BITBANG_EN_SHIFT         29
 #define CFG_SLAVE_ADDR_0_SHIFT       28
 #define CFG_M_RETRY_CNT_SHIFT        16
 #define CFG_M_RETRY_CNT_MASK         0x0f
@@ -56,6 +57,12 @@
 #define S_FIFO_RX_THLD_SHIFT         8
 #define S_FIFO_RX_THLD_MASK          0x3f
=20
+#define BITBANG_CTRL_OFFSET          0x14
+#define BITBANG_CLK_IN_SHIFT         31
+#define BITBANG_CLK_OUT_EN_SHIFT     30
+#define BITBANG_DATA_IN_SHIFT        29
+#define BITBANG_DATA_OUT_EN_SHIFT    28
+
 #define M_CMD_OFFSET                 0x30
 #define M_CMD_START_BUSY_SHIFT       31
 #define M_CMD_STATUS_SHIFT           25
@@ -715,6 +722,76 @@ static void bcm_iproc_i2c_init(struct bcm_iproc_i2c_de=
v *iproc_i2c)
 	iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, 0xffffffff);
 }
=20
+static void bcm_iproc_i2c_prepare_recovery(struct i2c_adapter *adapter)
+{
+	struct bcm_iproc_i2c_dev *iproc_i2c =3D i2c_get_adapdata(adapter);
+	u32 val;
+
+	/* enable bit-bang mode to allow manually driving SDA/SCL */
+	val =3D iproc_i2c_rd_reg(iproc_i2c, CFG_OFFSET);
+	val |=3D BIT(CFG_BITBANG_EN_SHIFT);
+	iproc_i2c_wr_reg(iproc_i2c, CFG_OFFSET, val);
+	usleep_range(50, 75);
+}
+
+static void bcm_iproc_i2c_unprepare_recovery(struct i2c_adapter *adapter)
+{
+	struct bcm_iproc_i2c_dev *iproc_i2c =3D i2c_get_adapdata(adapter);
+	u32 val;
+
+	/* disable bit-bang mode again */
+	val =3D iproc_i2c_rd_reg(iproc_i2c, CFG_OFFSET);
+	val &=3D ~BIT(CFG_BITBANG_EN_SHIFT);
+	iproc_i2c_wr_reg(iproc_i2c, CFG_OFFSET, val);
+	usleep_range(10, 15);
+}
+
+static int bcm_iproc_i2c_get_scl(struct i2c_adapter *adapter)
+{
+	struct bcm_iproc_i2c_dev *iproc_i2c =3D i2c_get_adapdata(adapter);
+	u32 val;
+
+	val =3D iproc_i2c_rd_reg(iproc_i2c, BITBANG_CTRL_OFFSET);
+
+	return !!(val & BIT(BITBANG_CLK_IN_SHIFT));
+}
+
+static void bcm_iproc_i2c_set_scl(struct i2c_adapter *adapter, int scl)
+{
+	struct bcm_iproc_i2c_dev *iproc_i2c =3D i2c_get_adapdata(adapter);
+	u32 val;
+
+	val =3D iproc_i2c_rd_reg(iproc_i2c, BITBANG_CTRL_OFFSET);
+	if (scl)
+		val |=3D BIT(BITBANG_CLK_OUT_EN_SHIFT);
+	else
+		val &=3D ~BIT(BITBANG_CLK_OUT_EN_SHIFT);
+	iproc_i2c_wr_reg(iproc_i2c, BITBANG_CTRL_OFFSET, val);
+}
+
+static int bcm_iproc_i2c_get_sda(struct i2c_adapter *adapter)
+{
+	struct bcm_iproc_i2c_dev *iproc_i2c =3D i2c_get_adapdata(adapter);
+	u32 val;
+
+	val =3D iproc_i2c_rd_reg(iproc_i2c, BITBANG_CTRL_OFFSET);
+
+	return !!(val & BIT(BITBANG_DATA_IN_SHIFT));
+}
+
+static void bcm_iproc_i2c_set_sda(struct i2c_adapter *adapter, int sda)
+{
+	struct bcm_iproc_i2c_dev *iproc_i2c =3D i2c_get_adapdata(adapter);
+	u32 val;
+
+	val =3D iproc_i2c_rd_reg(iproc_i2c, BITBANG_CTRL_OFFSET);
+	if (sda)
+		val |=3D BIT(BITBANG_DATA_OUT_EN_SHIFT);
+	else
+		val &=3D ~BIT(BITBANG_DATA_OUT_EN_SHIFT);
+	iproc_i2c_wr_reg(iproc_i2c, BITBANG_CTRL_OFFSET, val);
+}
+
 static int bcm_iproc_i2c_check_status(struct bcm_iproc_i2c_dev *iproc_i2c,
 				      struct i2c_msg *msg)
 {
@@ -803,6 +880,10 @@ static int bcm_iproc_i2c_xfer_wait(struct bcm_iproc_i2=
c_dev *iproc_i2c,
 	}
=20
 	if (!time_left && !iproc_i2c->xfer_is_done) {
+		/* Recover bus if SDA is held low */
+		if (bcm_iproc_i2c_get_sda(&iproc_i2c->adapter) =3D=3D 0)
+			i2c_recover_bus(&iproc_i2c->adapter);
+
 		/*
 		 * The controller may fail to clear START_BUSY after a timeout,
 		 * reset the controller to recover in that case.
@@ -1064,6 +1145,16 @@ static const struct i2c_adapter_quirks bcm_iproc_i2c=
_quirks =3D {
 	.max_read_len =3D M_RX_MAX_READ_LEN,
 };
=20
+static struct i2c_bus_recovery_info bcm_iproc_i2c_recovery_info =3D {
+	.recover_bus =3D i2c_generic_scl_recovery,
+	.get_scl =3D bcm_iproc_i2c_get_scl,
+	.set_scl =3D bcm_iproc_i2c_set_scl,
+	.get_sda =3D bcm_iproc_i2c_get_sda,
+	.set_sda =3D bcm_iproc_i2c_set_sda,
+	.prepare_recovery =3D bcm_iproc_i2c_prepare_recovery,
+	.unprepare_recovery =3D bcm_iproc_i2c_unprepare_recovery,
+};
+
 static int bcm_iproc_i2c_cfg_speed(struct bcm_iproc_i2c_dev *iproc_i2c)
 {
 	unsigned int bus_speed;
@@ -1163,6 +1254,7 @@ static int bcm_iproc_i2c_probe(struct platform_device=
 *pdev)
 		 of_node_full_name(iproc_i2c->device->of_node));
 	adap->algo =3D &bcm_iproc_algo;
 	adap->quirks =3D &bcm_iproc_i2c_quirks;
+	adap->bus_recovery_info =3D &bcm_iproc_i2c_recovery_info;
 	adap->dev.parent =3D &pdev->dev;
 	adap->dev.of_node =3D pdev->dev.of_node;
=20
--=20
2.55.0


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany
Phone: +49 30 610 816 100
Managing Directors:=A0Dr.-Ing. Hagen Woesner, Andreas K=F6psel


Commercial=20
register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569 B
VAT ID No:=A0
DE283257294 <http://goog_1008408251>


