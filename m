Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE29CE6F07C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7mN3BkUNBaIaOkmlbuW8OFHgs2JKr51ekn2SvPyheI=; b=2IDMV+i2JAo+uN6yQDODYbO9ol
	hZ8DsfRMf1OABilfwpNKhltYq46L0Z/sFoTiEyGos7YwUyWyscJF2QIlGzSZXLVeOobdx+dbtysik
	5e7dOP+wBjczZfr7k6BV3zWkPfloxbQ5Eq2VFTmtQOZ6GhnEiM2lUZd0n6+bTv/okg5C6Bp1nWwPR
	6P7Xt9EquP2LpkbLuRhoNkACqSv24ImZr5k3A/+gbr6M89snqHC4sTXsaUNk+iE2rr0aQ9W5fw6Py
	JbhZ+xjTbxr8/x7ZP/jLCbJigx8pkomTc5OSzwN8cLNzI0UTB4VES3qLDq9wbVTAFHf8eUe4MEZmh
	BZoWSmDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzLc-0000000ErfD-3tEw;
	Tue, 23 Dec 2025 10:10:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzLU-0000000Erb4-2spX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:10:27 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7H4pQ4044741
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z7mN3BkUNBaIaOkmlbuW8OFHgs2JKr51ekn2SvPyheI=; b=FBOaI6bcsH5bUMEw
	loW7yPxPiHxCfHCPzvJtc3QvAMevmIWxnYp9PqaqsDn4jexnort4GjEcBad2oneR
	cLi660aZLZowKf7k264F9GA3Wq9T3FXHEwGLbOJtfioDB/UF/obWnLNnCaVDqqSW
	eKGoL+KNKNOOYfrNb7LyYzJ6oq1WpUzYSaVjNoGE4DiIVJx88vTaPpIkSFt6bMRa
	Fb2FuiHCdBimdJ7MoXk7j+nIBblsvMKnshmFDsXTrkMdSmrkMorGdSn/AjRc+X64
	7buMyaCz4zQzQn56lq6U/gdI/JZO/L7XXSMKMjmLVEKwgCvDSWPGj3d2LpUHSOkb
	V5BbZw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuha7da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:10:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f8e6a5de4so67043615ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484623; x=1767089423; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7mN3BkUNBaIaOkmlbuW8OFHgs2JKr51ekn2SvPyheI=;
        b=UmK8D7h0zApdK/AtDvM7LobTbVp76qeCQ1qjMqRudl8ZlYqL13jGpZPO25Co90coRz
         6Rt4dYOAZXzNdI9ixdJehgyUCsztQdVfcZ97Eo7qvWZAbMYjZoHIjLMyauxIiDoT+NXG
         Epv+xInpiPOCtHPozAZDBqPDwzWA/jPbV6Yp8fVAbkrbdFlkQ05oSLL4ESQ2fa4QC/ec
         +mzeZqaJfOIKdAcJsptLPFyjJHLWzLeBYP+4mGSBcCqBNYBmolthj22De3f8pitr83aQ
         lRWIVTUCauxGHqll/Dv6qHx8Wo7c8HWU8R6/K8hWJO3A5uq45eDwX/B+w0FP1qES0x3m
         gFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484623; x=1767089423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z7mN3BkUNBaIaOkmlbuW8OFHgs2JKr51ekn2SvPyheI=;
        b=j58Y2FlNXRG9SqCbmDkLsNHR6dKpiap0fe8n6G2p73wKaC/iVyAb6LBcAPe7ywK+N/
         NVgxg5yhTkE37eaDeOyEZXMyZ7ki0jM6tlHHqpklhoQ1aiwKOUBvXqalt8Fs4ObFW0R+
         JdVwaoQwSTQGLY6BHKF92iZH0EoR9JliRzRivFg+9I+roZE4LicFGpIoboViooqseDRs
         T9EnaR7IWYmFh4BvNdp5xxUNpybJZWiaZFM9mSiF50k9GrHzNpaQFqFMr8YDF+PBMubo
         imC1YSVY6oHT5MKHSMetLp3lM7oDfO585GTQApy+Hk5hQ9bhjftniV548p/uQ4qYKbQZ
         THDw==
X-Forwarded-Encrypted: i=1; AJvYcCW3hgYm2yJEazITVjKEZ0ix4QpWImEu6/kUmCmnX3NDO/bqXM1hdHCoaI6NRczpii9Q66tIm7U5v/xR61rAUmK2@lists.infradead.org
X-Gm-Message-State: AOJu0YwKSJ67dfDZLessVjR+NLiYk/O4DNRQVJn77tsbRAyPmzH8ZcrW
	lzv1iBu4uuWnwSQzQUA+r7iDlayIrQb9Fu+o35NXYN45Lh+sIRJ1m/zGrjFp1VHtv5XY3AFuInY
	ehPd/ueWBn1WSws4boVdp+gyA8RimJynNa3yNFVwDPhqK6zpylgat1XK1d6iJQ9HwG0aYa2u/Qa
	Q5k6YSHxSvjBiN
X-Gm-Gg: AY/fxX7VM8Jt/tTRi9N+stn0GDRI1DlGgNAMhPl4PVpSeuERQs1TcjThKTxnx6/wPip
	hUvMBwldPv9dbVRGZvI4GoHY+uNeTeWFmDMHG1J684+WHVHsIX0cLfo3OdHUDQFHwA+ixkYlTU3
	5JuYMIdS4QG0iCPN2g/ZLvoZlthEa+yNPJIIqPutDA3ZmIzrM0T4tSFISb+ciiAV+lAaKkMkn4M
	8YUARLtqMcV39OZmWKGOFbIhudOW6Xuwwf97BWu4EiOLzmP79LqGoS0XJY9cZZg9bDI85y0zk1z
	SoeWsVQ7loDA+eAkU+Dy5VTUjd5850Y2IHETxKPWKa8UeL2ojcjFuqN/0QNkn17PU3w4mDsUhpm
	0o9o3n63R3PiQbzjFOyyrttJu+P6ZYWj+bH7ocDmEQnpVww5/XK+m73PA4raJ5g2Q4+rhNAcA
X-Received: by 2002:a17:902:e746:b0:2a0:d074:e9f4 with SMTP id d9443c01a7336-2a2f2c4e3dcmr136127365ad.59.1766484623145;
        Tue, 23 Dec 2025 02:10:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgsPtM2LO+1xkqBBAXxfoaYMXrx0J52zpPMUVlt/Ux9UF8DqRlUzaibDDRMQDMNpar8qq+Og==
X-Received: by 2002:a17:902:e746:b0:2a0:d074:e9f4 with SMTP id d9443c01a7336-2a2f2c4e3dcmr136127095ad.59.1766484622671;
        Tue, 23 Dec 2025 02:10:22 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6661esm120824625ad.2.2025.12.23.02.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:10:22 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 18:09:53 +0800
Subject: [PATCH v8 4/4] coresight: tpda: add sysfs node to flush specific
 port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-add_sysfs_nodes_to_configure_tpda-v8-4-4c95db608b62@oss.qualcomm.com>
References: <20251223-add_sysfs_nodes_to_configure_tpda-v8-0-4c95db608b62@oss.qualcomm.com>
In-Reply-To: <20251223-add_sysfs_nodes_to_configure_tpda-v8-0-4c95db608b62@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766484607; l=3701;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=81dX2nTlJr2gpRluG70T7YUTTcZv6ubCht7Nlur4GXg=;
 b=FvZ9kNSl2e5b9eKViO/BPeuoah03ZoDuyXlXfX0w1R7qUSRmAI62644Ak2+mcvJErrfEB/GTR
 t/lL3b3fwt2BSeDwnblfbG64SLmrxF9xRxn3d3JfeUHVZ2K5Mqz7hR3
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: UvToUaSfuZqkoErcoX4EALeqFnwBge1y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX2ciWLofxCbBn
 DgaVckjNmy5RXsA2zLoaPIsR+y2uf/1iTyAKXrynzaloU0Q76OiLKPafhWHKWhdaeIDEGRiiTym
 0vn2O71GbfkbcenfogEUu3bPx8iUb5F6lfNh6Sg7FBfZ934VqJ+eMBdp1NHxYhs38gHV/WfCvNt
 Qd1dhtVj9cc/6EUIsjQ8hz0IudHrhcss9OPK6pl8fEXx/2caKPMYqiiugP/yyWmuIcKJWEqhFkW
 YpK6A2gWYXUBL/yfA7aFATOjEyHaBS67KV4PgGdWHHAfNQ7jiHp+xquNEkqKTHJL/+BJguPBhFW
 hDU1p2jzR079SfaTE/ft5eKQ6jMs0o+pntYll+FmVafeQiPMWAtwJluORVMhA26R2gj0BflfB84
 sRZxgPRkYaBxUAkEfhBy5ZqjcZFo3q4OI0B/5mXKX4BaHByozWEEvlPGEcmI/FRpRBUzCmH2Gmv
 /4oDwp9ekGqOlTYQzkw==
X-Proofpoint-GUID: UvToUaSfuZqkoErcoX4EALeqFnwBge1y
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a6a90 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Uaz1Er67hVaxBR8z2rIA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_021026_197709_6965E89A 
X-CRM114-Status: GOOD (  15.87  )
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

Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
for port i, forcing the data to synchronize and be transmitted to the
sink device.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  8 +++++
 drivers/hwtracing/coresight/coresight-tpda.c       | 40 ++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h       |  1 +
 3 files changed, 49 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
index c989eea1ef59..48b8fda1b796 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -59,3 +59,11 @@ Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
 Description:
 		(RW) Set value the of the syncr counter.
 		Range: 0-4095
+
+What:		/sys/bus/coresight/devices/<tpda-name>/port_flush_req
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the bit i to requests a flush operation of port i on the TPDA.
+		The requested bit(s) remain set until the flush request completes.
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index deb5a646a04c..7055f8f13427 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -473,10 +473,50 @@ static ssize_t syncr_count_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(syncr_count);
 
+static ssize_t port_flush_req_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (!drvdata->csdev->refcnt)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
+
+	return sysfs_emit(buf, "0x%lx\n", val);
+}
+
+static ssize_t port_flush_req_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf,
+				    size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u32 val;
+
+	if (kstrtou32(buf, 0, &val))
+		return -EINVAL;
+
+	if (!drvdata->csdev->refcnt || !val)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	CS_UNLOCK(drvdata->base);
+	writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
+	CS_LOCK(drvdata->base);
+
+	return size;
+}
+static DEVICE_ATTR_RW(port_flush_req);
+
 static struct attribute *tpda_attrs[] = {
 	&dev_attr_global_flush_req.attr,
 	&dev_attr_syncr_mode.attr,
 	&dev_attr_syncr_count.attr,
+	&dev_attr_port_flush_req.attr,
 	tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
 	tpda_trig_sysfs_rw(trig_freq_enable, FRIE),
 	tpda_trig_sysfs_rw(trig_flag_ts_enable, FLRIE),
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 56d35697303a..a090352009bb 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -10,6 +10,7 @@
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
 #define TPDA_SYNCR		(0x08C)
+#define TPDA_FLUSH_CR		(0x090)
 
 /* Cross trigger global (all ports) flush request bit */
 #define TPDA_CR_FLREQ		BIT(0)

-- 
2.34.1


