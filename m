Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E415E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 06:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mre2uzg37555dFycG1pot97jCQNzgXS0YqsC2Jzjfo0=; b=szyZaYBgc+3h3GNcHMkXPfiBnz
	RmMS27fHU73QRDsuxOJzKso22uGj4+y+SpVqO9Qx/quSpK6awI6FEooXczCfO+EOvrYi1i1cpgeqD
	OG2UxBjCxPGrN2wCokLRoChCcSfXsrgxdjANA+418qOOmFyI4GJerl/b1y4hlEAcCzYE1AYiVdZzJ
	gYrYA2dfVhs7tYS2dPVm4TuMWT066MrnuNaqTviZRDttLcbMSwQ1/tgcx+RGAn+6re/7uN2EBWwGd
	znNj5VGK9HCnRFn20ehaQZ2thOws9JdpCBak2Lxd+sh3BsIVOhngTA/DF0eyndW5N+yxCetIz6GX+
	26wYrO9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZ0Z-0000000DEHy-2Bc6;
	Mon, 22 Dec 2025 06:03:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZ0W-0000000DEGJ-2N3K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 06:03:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLN1OBL3395346
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 06:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mre2uzg37555dFycG1pot97jCQNzgXS0YqsC2Jzjfo0=; b=f5Q8x1w7zRgJGjc3
	tO75rouwa3bOExaF2DNG48czCYFGPuJOAE9Nnz5V05RWdZ5mcmZm/RiHhRwDbXQv
	AksaAqpetMmYEzM1ILWX08YuuPqPCOt2yww5evVSPa+kWI+Vhm9hlmTHOAqt7dLR
	jQzAfZdkHXKlAR4uqIXtvjeDl2iTv0yVv9A4ckLbDk8gDk35j6xTmoAf6O2JdDfD
	LHukUrYia34iGoeICMil/69mbGjVtLLQAoIX1yYalvhtql25F281km0P4JFDm5IV
	CR9pv/tgI0Sf388vKKYv1wqULUzFEL26JhSoWH+V3qHAIMxmOB8QBYgflKaX5Zs3
	R/vWOQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtqkvs5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 06:02:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7d481452732so7056100b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 22:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766383378; x=1766988178; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mre2uzg37555dFycG1pot97jCQNzgXS0YqsC2Jzjfo0=;
        b=LojXKiG2ndYq3kgw4egDB2SgHuZbTp8A1gikAA8izltSDskX5sNXniS2npNryFfqp4
         Xo2xxeB6TZUHQ8Qhb65A1MQN1sicrIZ3eXUcTKbgcVisdo9Phz923FonnBamjhzAcBBK
         yZkxscxSfehEnr2fp1X5+6ykEq58pTchwLKSin32urAOrUJsITrcDFDb+cwNQGyQ3dB8
         ki0vsqmhP1N4UA49anfDqi+t/zPMQjvenReqkC7jyR07EVm6p0vTZU4KeHutgiGzK/Nz
         eZO7rRCoOdCMa8KEG8ic0fUSOjV/9eVzhgpAmQ1lkSaK+LTge6KswurJZB82Og0o4/9x
         li8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766383378; x=1766988178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mre2uzg37555dFycG1pot97jCQNzgXS0YqsC2Jzjfo0=;
        b=pKA2uImg7of5Qm2GRxtntH5bJBGAQOn+dWmDpBllEfDTVwt457irEvfMTNsikoDIKq
         chZOEUjlQl/4UQpXqU4x9gyNBZubcwbgQ+dqOrOZzBGJLWkBnXIKLFOorhNWR3I+4NNI
         0bzk14S6IfpD1gHenaWQgxPrT8/Bxx1ywpvBZzIBSV3BgjlZ9pMUhNq+Ali3vhI7CjfP
         MUm+HCjhUj7R8Tms3DgrlZr9l9jV2HWOdkTsah39tKsa5nQNuu+cgBT+3Yg+mu1VEbiG
         YdFOkRkjBOLo+AyBMg3otl4zVZy3t0UlHRRmBHeKd2M27MNeu9HbcfTvBlgjb/AmJ8KC
         y6zg==
X-Forwarded-Encrypted: i=1; AJvYcCVKuNDWhsMsF9V/TdzhyCQJC1/bAzKsrtvQw7KSdpgwVE8RM0QWnwS7xR2a7axPHIFs8QANVeOiFT75w24ffhUd@lists.infradead.org
X-Gm-Message-State: AOJu0YxIdXSp5vdAv/FmKcNjyyHomrXIsmtdRRNdifgDoDzaN87QrZxG
	ilyY/6jryOdd3kZr6QS8xrgvMkeHx6QlH8um4/pQriGCFw9jB3mVXY3i2dKzcMJVSxhqVKEriu2
	6cGi6u5BJT/XQpi2t4TbiIs1FckLhXSk3685bhKzmZhyqJ/rGGOFgD43Au6D4lhx0452tfY2SWT
	4RFQ==
X-Gm-Gg: AY/fxX7iwuuGd8RUPzIGqiA/sfG9x/Yor7xlXEWAW0RDo6Df7Iz7GeBcxO3nIel2+Cg
	KSHss7ZXfTclBoo75Wzxe2Li+/1QDmso35VSkrCJWS2LKgTthRnMIdLwcui6Kt+DCuTRjreFNbm
	FrWTyvCeWTXZ58H+jQeuhkdyG8tp8hAHeKmnSoUaSRkLgFQz/VVlkgX92J26wXTSQO1LWXfrvry
	8OSWDG6s0JU9gtkueMI/jUEAg3vgW0A6OhubQqTsh7bIgLannv/uk7wLtYcuWQamyrq3PEPtMry
	nnUZ1/j7gahEOoCoflGImDvtcNp3kkXoDLSm9501TzxSjcUXKy2Hyb5+IsX9LGfjNixpM9PH7tF
	UVgm/IqfZiStXCyTe6QfTu3urNFsh503DYfsNf/sf3aMDWRxSQUjeH/0t7KSdMxV2FLdUrsOH
X-Received: by 2002:a05:6a00:414b:b0:7e8:450c:61b6 with SMTP id d2e1a72fcca58-7ff6607cf9emr10021327b3a.38.1766383377607;
        Sun, 21 Dec 2025 22:02:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHab+72LO48oblslbZ+SDPj+sy4aNnDsVVZ12RIZNhS47PMv94hmfjS4oe+ZRNNLJsbwGaKHg==
X-Received: by 2002:a05:6a00:414b:b0:7e8:450c:61b6 with SMTP id d2e1a72fcca58-7ff6607cf9emr10021287b3a.38.1766383376978;
        Sun, 21 Dec 2025 22:02:56 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e892926sm9070130b3a.66.2025.12.21.22.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 22:02:56 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 14:02:21 +0800
Subject: [PATCH v6 1/4] coresight: tpda: add sysfs nodes for tpda
 cross-trigger configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-add_sysfs_nodes_to_configure_tpda-v6-1-b27143d45c86@oss.qualcomm.com>
References: <20251222-add_sysfs_nodes_to_configure_tpda-v6-0-b27143d45c86@oss.qualcomm.com>
In-Reply-To: <20251222-add_sysfs_nodes_to_configure_tpda-v6-0-b27143d45c86@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766383369; l=10025;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5iJlQIoDWyy/yMLiYfQHee+qPvXguqsKK6vOAMkX94A=;
 b=eMynoqargOk5K7grTg75zh8VPvPDVcdZbDW1eA9kSBmGEfuO6koY2ChL2iPfOZoJsIJbTrdaD
 Znvg8J3wCGlDP93cBr0DRChPyEnNFSOFyRe6G/bysiz/vR0OdxHH8Ik
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: oT-k_jMbHrji-xnRbdF70M99sWMpAOKu
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=6948df13 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=yIbM8MDk91bntAnC_RsA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: oT-k_jMbHrji-xnRbdF70M99sWMpAOKu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA1MiBTYWx0ZWRfXyJIDnsg4MeuO
 fG74H8EfBEM2Q4wRle59s8jI3l+YBduL9W6f0gGFnyFuhQt8hgsCDhS6axaLfxQsphyUgsy2kqo
 yhFndMM3mxu8aj8frEjnfpo1exwhgQekgU39gQVYbKjq1U8MvALltYSkvOP1sDV03TcM176DzMf
 DwjBNDjfK//d9oEnGDEvLO/kCD0BHmvJazitt7Hgzf7iejGsmY49pBmTUzA9rGv3evXm9O0JZ+y
 QvM9le16rNGIFrLJjGEAfTEXY2zQmvwAEddMmb1bI5IQrtCZRR8tixkK33J9+OX1vvcjGEw31uu
 JYQkhmI2nk1zu3JLEuc6vjqIKBC2tUNwMGzzQ3pl9x9YgxVtvL6FZupu3NdlncwyQgIKJrW7zjV
 7BC3nreNkCa2JbDkbqgtCGhEfv1T2CrkeX4NjXk+12lBTbNhH+TlDXRmPMsyOpNuciupotyN+RQ
 tKLTrXBO/nTHxWEZfkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_220300_739539_D987E440 
X-CRM114-Status: GOOD (  23.78  )
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

From: Tao Zhang <tao.zhang@oss.qualcomm.com>

Introduce sysfs nodes to configure cross-trigger parameters for TPDA.
These registers define the characteristics of cross-trigger packets,
including generation frequency and flag values.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  35 +++++++
 drivers/hwtracing/coresight/coresight-tpda.c       | 109 ++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpda.h       |  63 +++++++++++-
 3 files changed, 200 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
new file mode 100644
index 000000000000..735ce0e494da
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -0,0 +1,35 @@
+What:		/sys/bus/coresight/devices/<tpda-name>/trig_async_enable
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable cross trigger synchronization sequence interface.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/trig_flag_ts_enable
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable cross trigger FLAG packet request interface.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/trig_freq_enable
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable cross trigger FREQ packet request interface.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/freq_ts_enable
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable the timestamp for all FREQ packets.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/cmbchan_mode
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
+		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 3a3825d27f86..2186223ad33e 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -137,12 +137,32 @@ static int tpda_get_element_size(struct tpda_drvdata *drvdata,
 /* Settings pre enabling port control register */
 static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
 {
-	u32 val;
+	u32 val = 0;
 
-	val = readl_relaxed(drvdata->base + TPDA_CR);
-	val &= ~TPDA_CR_ATID;
 	val |= FIELD_PREP(TPDA_CR_ATID, drvdata->atid);
+	if (drvdata->trig_async)
+		val |= TPDA_CR_SRIE;
+
+	if (drvdata->trig_flag_ts)
+		val |= TPDA_CR_FLRIE;
+
+	if (drvdata->trig_freq)
+		val |= TPDA_CR_FRIE;
+
+	if (drvdata->freq_ts)
+		val |= TPDA_CR_FREQTS;
+
+	if (drvdata->cmbchan_mode)
+		val |= TPDA_CR_CMBCHANMODE;
+
 	writel_relaxed(val, drvdata->base + TPDA_CR);
+
+	/*
+	 * If FLRIE bit is set, set the master and channel
+	 * id as zero
+	 */
+	if (drvdata->trig_flag_ts)
+		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
 }
 
 static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
@@ -258,6 +278,87 @@ static const struct coresight_ops tpda_cs_ops = {
 	.link_ops	= &tpda_link_ops,
 };
 
+/* Read cross-trigger register member */
+static ssize_t tpda_trig_sysfs_show(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct tpda_trig_sysfs_attribute *tpda_attr =
+		container_of(attr, struct tpda_trig_sysfs_attribute, attr);
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	guard(spinlock)(&drvdata->spinlock);
+	switch (tpda_attr->mem) {
+	case FREQTS:
+		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->freq_ts);
+	case FRIE:
+		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_freq);
+	case FLRIE:
+		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_flag_ts);
+	case SRIE:
+		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_async);
+	case CMBCHANMODE:
+		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->cmbchan_mode);
+
+	}
+	return -EINVAL;
+}
+
+static ssize_t tpda_trig_sysfs_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf,
+				     size_t size)
+{
+	struct tpda_trig_sysfs_attribute *tpda_attr =
+		container_of(attr, struct tpda_trig_sysfs_attribute, attr);
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	switch (tpda_attr->mem) {
+	case FREQTS:
+		drvdata->freq_ts = !!val;
+		break;
+	case FRIE:
+		drvdata->trig_freq = !!val;
+		break;
+	case FLRIE:
+		drvdata->trig_flag_ts = !!val;
+		break;
+	case SRIE:
+		drvdata->trig_async = !!val;
+		break;
+	case CMBCHANMODE:
+		drvdata->cmbchan_mode = !!val;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return size;
+}
+
+static struct attribute *tpda_attrs[] = {
+	tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
+	tpda_trig_sysfs_rw(trig_freq_enable, FRIE),
+	tpda_trig_sysfs_rw(trig_flag_ts_enable, FLRIE),
+	tpda_trig_sysfs_rw(trig_async_enable, SRIE),
+	tpda_trig_sysfs_rw(cmbchan_mode, CMBCHANMODE),
+	NULL,
+};
+
+static struct attribute_group tpda_attr_grp = {
+	.attrs	= tpda_attrs,
+};
+
+static const struct attribute_group *tpda_attr_grps[] = {
+	&tpda_attr_grp,
+	NULL,
+};
+
 static int tpda_init_default_data(struct tpda_drvdata *drvdata)
 {
 	int atid;
@@ -273,6 +374,7 @@ static int tpda_init_default_data(struct tpda_drvdata *drvdata)
 		return atid;
 
 	drvdata->atid = atid;
+	drvdata->freq_ts = true;
 	return 0;
 }
 
@@ -316,6 +418,7 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.ops = &tpda_cs_ops;
 	desc.pdata = adev->dev.platform_data;
 	desc.dev = &adev->dev;
+	desc.groups = tpda_attr_grps;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index c6af3d2da3ef..c93732e04af2 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023,2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _CORESIGHT_CORESIGHT_TPDA_H
@@ -8,6 +8,25 @@
 
 #define TPDA_CR			(0x000)
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
+#define TPDA_FPID_CR		(0x084)
+
+/* Cross trigger FREQ packets timestamp bit */
+#define TPDA_CR_FREQTS		BIT(2)
+/* Cross trigger FREQ packet request bit */
+#define TPDA_CR_FRIE		BIT(3)
+/* Cross trigger FLAG packet request interface bit */
+#define TPDA_CR_FLRIE		BIT(4)
+/* Cross trigger synchronization bit */
+#define TPDA_CR_SRIE		BIT(5)
+/* Bits 6 ~ 12 is for atid value */
+#define TPDA_CR_ATID		GENMASK(12, 6)
+/*
+ * Channel mode bit of the packetization of CMB/MCB traffic
+ * 0 - raw channel mapping mode
+ * 1 - channel pair marking mode
+ */
+#define TPDA_CR_CMBCHANMODE	BIT(20)
+
 /* Aggregator port enable bit */
 #define TPDA_Pn_CR_ENA		BIT(0)
 /* Aggregator port CMB data set element size bit */
@@ -17,9 +36,6 @@
 
 #define TPDA_MAX_INPORTS	32
 
-/* Bits 6 ~ 12 is for atid value */
-#define TPDA_CR_ATID		GENMASK(12, 6)
-
 /**
  * struct tpda_drvdata - specifics associated to an TPDA component
  * @base:       memory mapped base address for this component.
@@ -29,6 +45,11 @@
  * @enable:     enable status of the component.
  * @dsb_esize   Record the DSB element size.
  * @cmb_esize   Record the CMB element size.
+ * @trig_async:	Enable/disable cross trigger synchronization sequence interface.
+ * @trig_flag_ts: Enable/disable cross trigger FLAG packet request interface.
+ * @trig_freq:	Enable/disable cross trigger FREQ packet request interface.
+ * @freq_ts:	Enable/disable the timestamp for all FREQ packets.
+ * @cmbchan_mode: Configure the CMB/MCMB channel mode.
  */
 struct tpda_drvdata {
 	void __iomem		*base;
@@ -38,6 +59,40 @@ struct tpda_drvdata {
 	u8			atid;
 	u32			dsb_esize;
 	u32			cmb_esize;
+	bool			trig_async;
+	bool			trig_flag_ts;
+	bool			trig_freq;
+	bool			freq_ts;
+	bool			cmbchan_mode;
+};
+
+/* Enumerate members of global control register(cr) */
+enum tpda_cr_mem {
+	FREQTS,
+	FRIE,
+	FLRIE,
+	SRIE,
+	CMBCHANMODE
+};
+
+/**
+ * struct tpda_trig_sysfs_attribute - Record the member variables of cross
+ * trigger register that need to be operated by sysfs file
+ * @attr:	The device attribute
+ * @mem:	The member in the control register data structure
+ */
+struct tpda_trig_sysfs_attribute {
+	struct device_attribute attr;
+	enum tpda_cr_mem mem;
 };
 
+#define tpda_trig_sysfs_rw(name, mem)				\
+	(&((struct tpda_trig_sysfs_attribute[]) {		\
+	   {							\
+		__ATTR(name, 0644, tpda_trig_sysfs_show,	\
+		tpda_trig_sysfs_store),				\
+		mem,						\
+	   }							\
+	   })[0].attr.attr)
+
 #endif  /* _CORESIGHT_CORESIGHT_TPDA_H */

-- 
2.34.1


