Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498D9E6F072
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mre2uzg37555dFycG1pot97jCQNzgXS0YqsC2Jzjfo0=; b=NBTMC0BtUAfWi7bkgnJFhVYVMN
	Y1LJ5Rs9pZ9kVjdLFX+9jxQtPEX0JVWOhoQ8GtSBn9V5lYn7XF18wCPTMEKYmjb4v41325LOF+06n
	E72KbH/osEfWvoj5qZ4Hjo1Dgzeo+WvEzr4Am+8lcCdHLcA+/V9AE6Xi4ZSWq0XgiAy38V4Y0MbH1
	SrrIdYnm0OXBMPnlZJubDxzVh8g9guHFU48IeWV5eSteYBugiQZKUrglOAY0WQdFK/6N54vpVSaTF
	ytXfvVVm6slYeuWHibh5SUDs2gYY1BO7JT5f6ALLAS9Idc5x7fXZdS317iK3nNq2dD2F8Or0gkZgJ
	dsQZRUsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXxyE-0000000Eh16-4Asj;
	Tue, 23 Dec 2025 08:42:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXxyC-0000000Egzx-06cQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 08:42:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2uH6C1890693
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 08:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mre2uzg37555dFycG1pot97jCQNzgXS0YqsC2Jzjfo0=; b=Bu/BeUmptRljjQNW
	8Mh9j+pBmgMKinOSorvrkHow52p6i58sU6yQ8UseuiNqGS3f+wSD6RwZ7ctRhI0g
	7d7tEa6p7Y0/5t5XfzSojpYX+3DPc37a8YXxMFBReKrMveIbU0x7VKht5ypdqLEx
	GqDY7lexsubJOMux3voxtuyzRxfOfDkA/xGlS92XorGJD+rwtViheg7IxEsgHCLA
	eY/S6U6HmAkU8aP/bivZCYgJ/52rXIRghlSt/qAu//9Es7GvK12PB5RwAL+1CC1b
	hZdU4fZ4g0CA+tbrBSFwMlXnDgvu1RJW9Fvppj/A7xmFlBBlOiX8RHJyT6+b+rJ5
	JIIgjg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770aju6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 08:42:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a13cd9a784so51238555ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 00:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766479334; x=1767084134; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mre2uzg37555dFycG1pot97jCQNzgXS0YqsC2Jzjfo0=;
        b=J8hNyorHxJJn0XwKChJOXtOdafbwlHn3Mpm0a4u9OiMDUm3K1dRtwpxV5ixuUYZIy3
         SxB7hgO3JaMZjVfh/qLnmuv/7RKIaJ9k54j9aArFMcAIQ6CTTZ4pOmg7njc83hiQBlWQ
         06L4Csn1QgJtvdB9miKtErD00ljjC3WuEaUWYZxZt6B5EYDm9B/SF26r7PQbHBSg2+/J
         j/DOjv5QiczaLhEv1FGKzXouxFR1qp0fTeJaiShax7baE8rZH7rKiL0NmQRiKpd+Gg4E
         IYMsakYDWtfd7FIwfQUEuUSuS3aMjzLcRw3cHjuobWOpVKSLf9k0tg08z3nfAC+Jc1r1
         rOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766479334; x=1767084134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mre2uzg37555dFycG1pot97jCQNzgXS0YqsC2Jzjfo0=;
        b=fZq6wYaxhwSIMZ0NtEdcx1w1wkbEcDGTEIlXCV3RHw493HjCDidaFumbe7TGcXoNIt
         G4DMLt7gIaNcwmcflpuNq59BewgjtX9+UiTH/rd9yOd2FNEYsgcIR2NSnDfkMay6ZzyH
         O//2YMKHqIuL0nbAlNI+Vh7gSracjjR7O6+BDgpEpeLycUKnsEPQivejWhTlECD6/IcA
         hn8JdsS93g1Y478CTal8Y4FMfZxJHnoeRBqUBdEVPaKku9rD2b+5KK3eRIypEy6VEsWN
         AAyf4g7+Caqb48WphrjJe1lrpbr5dO74tzJr2Tgd15LaSS6plYnFa64al5rWBS0Joqyy
         aerQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM4cpg3pgnBrvCiyg/2mCnUN3tC6NC+krHknbYHyljGnNJJD4rYWBlEbNxsK0IDWrj+xorvDAXOOxSQN7TtlLy@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm03yQPIj3ZViceDm/Gf2y97w7B4WyQL96LmHvnxCWMTOiGulo
	bs+4Amdqb5cQrZgpH/ChR8cG5FuBBMCTSfJwK/sS9rkqPoUfiKHFr/qihvRI9daHy/5V2iaP3+B
	9LeSu85m86ka5Kvx5rEPE1g8Hzig6ZmqO9k7WJQO/3VUyhpofv5HkMt474ThkUeXIAIrtmPoWVD
	SBcA==
X-Gm-Gg: AY/fxX6LMBEbrKBRi2/MhTu9eZlInyiQOgx+uvDZMROIMcW7eyQW30kTaBimQGOE56S
	thmNpUrToOj56wpTAuldZtm9tKgbLrDc3VEJzAOeotbPRwGKmJoLRDbpFf7cdZw7jitH9LgL7Gy
	96nkM0SinZI+OawNL512sEgWVTsilGYLBKEAf7y0TS7Hd0nIJnpPZyfzMw1lpf4dn37GECcnI8u
	dSRyGT2cB6i0VrZpUWuK8NVdNK2M0Rv+pr6T+XfzAovWFMlsxDsrCGtvC5DQVBmds4KdMFrOA2G
	swcW71td3BrjA6zZ9XtcE2WtKWdYcQLuVLxzZgqAcChxwdUGpMjL4KgMpltFEoOs0fV/r5FhAHf
	mUdpuNveLvwF3J/VWP7Vhk6nIlDICBKG8WyW69AQ1X6DkHmPdiC5KxdZsaItpFNlFxJLRFfT5
X-Received: by 2002:a05:6a20:e210:b0:33b:5a3f:3cbe with SMTP id adf61e73a8af0-376aa0f02a4mr13250258637.54.1766479333842;
        Tue, 23 Dec 2025 00:42:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmuQc3fig76UCETuHGfvRrKwlR3bF7XbxTwfpIOMiPWo865QPhB1UyCsF1XXkGFLBZor7V1w==
X-Received: by 2002:a05:6a20:e210:b0:33b:5a3f:3cbe with SMTP id adf61e73a8af0-376aa0f02a4mr13250233637.54.1766479333307;
        Tue, 23 Dec 2025 00:42:13 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961e045sm11163561a12.1.2025.12.23.00.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 00:42:12 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 16:41:45 +0800
Subject: [PATCH v7 1/4] coresight: tpda: add sysfs nodes for tpda
 cross-trigger configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-add_sysfs_nodes_to_configure_tpda-v7-1-db4e6810047c@oss.qualcomm.com>
References: <20251223-add_sysfs_nodes_to_configure_tpda-v7-0-db4e6810047c@oss.qualcomm.com>
In-Reply-To: <20251223-add_sysfs_nodes_to_configure_tpda-v7-0-db4e6810047c@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766479326; l=10025;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5iJlQIoDWyy/yMLiYfQHee+qPvXguqsKK6vOAMkX94A=;
 b=l3H915rw3Q3wACgqpoWr3XCEguaJKok4FYlbAoKM0czI0jzGAqNBlprboZMYgFAIiikBEBvt4
 YBYo61iHOptC/c2VLAeAg6hR7Rdg2DZM/4RMKKAUM7QDgQABH/QboZV
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3MiBTYWx0ZWRfXyLEqwVIWSeGB
 ZuQrPQyL/iMIop1oeCRLbZ0IYSuPu+UGnmXM5AUZE7SlL9bIuMvNW0eSBfrdoJw3s283YIdRPx0
 CRRhsN+nb7CBiedHcfRO6tehNNSwhfvN45Lsbxgh/nCXMjStkLJpPwhXstzbvctnauub2zWlRTY
 MVXP2+pKfliq09lTpzk3m/ng9So3ZPI7SaEi0GdtAYUSByRvQSY1XJ1VQ0VXhmAAnsMls4ArkNf
 Y4vDbxDp8hIzFeYL0cp3gHIK8TJH6f+H7ZkVeUbNbhUUn4HKs47nC4ZVwJbc3poGr4634opSMpf
 /iSR+QWVWhAX+kedh1iQSlxDbx40ZDxBLycu6WU7UU6Jj560fRUVUp9TYnHTkknxXpJWfWH5kKd
 1iTa9sWiqDDZl6OtaFU0+c6c3t6arbelBjddZFXN/58oxzGw5fr6p8gDvemMBX3ADZN0l5dS+9O
 +MLdOyVWimpBsE/36WA==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=694a55e6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=yIbM8MDk91bntAnC_RsA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: O_Z80oS0H5OH1rpQKtMkLicFK3RRwygI
X-Proofpoint-ORIG-GUID: O_Z80oS0H5OH1rpQKtMkLicFK3RRwygI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_004216_185544_A882EE7F 
X-CRM114-Status: GOOD (  23.48  )
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


