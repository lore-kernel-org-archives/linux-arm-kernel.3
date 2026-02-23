Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F0EE98DEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 06:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jI9VMtFL2iZSHiAcQIxgD0sR6qS7voT+SLIQjeTVTZ4=; b=EpRSwT6k+2VuGV8dFKwBk3ell/
	YTRtUm+FK9ixZT8MBvT+WPpES3wzZ7fItmjR1mQ+mamosnTLBFEzhrg2RG2QAIW3CZZubJoDFUPOc
	bAVB+A12yA4H0a/H/8+sk1QIGw7vpQXeidFsNcdNMMtbV0IOai0LfEgOzNOkpsr4CZLvNvsvBLZGD
	YDzmp8DNo5otOdqqRnhOsWqqp61wSeGZqi8MazzYgdwKc9gAoqakPQSAzvLXmnU/V2MOibjhcVevB
	E2/X7n/Fv65JwP/2fSmJuU9mdv7XMuxalTjdacmTmxlc367nbASMWHX1pnJui9tTqIDTAtXSnfwaD
	GB3d8jig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPsD-0000000HKk5-05G0;
	Mon, 23 Feb 2026 06:56:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPsA-0000000HKiI-49jh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 06:56:52 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N6UdIp1217262
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jI9VMtFL2iZSHiAcQIxgD0sR6qS7voT+SLIQjeTVTZ4=; b=BDT5EaAbCe7Bvh0I
	WWYnjc1uSoulUZxE+onxGOqA335/aJM5z+FGOTYteviVKlvzDIapY02jZwMKxQCG
	IXpDJeDzJhH215agaF5yeaUqTpESivkfm2bsuexJ7wpEyosi/0G7WhTRf8M1RaSP
	dSlE7nNW448KtkasKNhHTuEsN8fz1noUXRDXlinZ9PfYtTtuv4hQkz49SJ7g++9+
	StBY/R67KZgglU/RxhAaraHDuldYk0gPpcLna8PpZdQ32VOBAeUayZtBwEREUW05
	KZl/zSk/0lmJTeFPKhlpMwcbp6XeRpn7T23VbMiljWXJpRgDpMzyJ6sV31Vv398/
	56becQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vguqcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:56:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a79164b686so55711265ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 22:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829810; x=1772434610; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jI9VMtFL2iZSHiAcQIxgD0sR6qS7voT+SLIQjeTVTZ4=;
        b=WDJBoWE05oQ+dfyVkqrY7bujiwHNZjEsD9Ko8JOOvq2DcgVTERR8CEmNqv9KV9Fmwc
         g3lCD5GZYUbbZkJHczR3lbmY6dMd/ZIoRa8W8aPgZiG+4iIuN2pO/7Eud5d31W66+3sa
         bNZ3vkpXvj9Xk0asgqq+r+O+DNQ9n+nLGKANaTT3nWPs7C94ADlJYhqEcJvMhRY5sRar
         Mbi5U03mCrEXWqJAKWonR7+8gYWxF2m/tPf7ckC0po3c0Yi48AL5ZRDbQprg3gOffetw
         Kj17/WX9JRbwkui783qQm3PgTt1YdNHhV3bCY/qB8Mss1ArKM9rGUCTuLRWHMcI5eCU1
         Z7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829810; x=1772434610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jI9VMtFL2iZSHiAcQIxgD0sR6qS7voT+SLIQjeTVTZ4=;
        b=vdLzcPOUCtqI8rtZZuE91ZdOiYf490aaHfX1DxbL+Y0ykVBjk5lTWL5FkgekdawhRg
         kk4QKiHXO7Q8+g+symnhVCbD9kSa+Cpz5Obug7QfmecrkxUNwhkbjcrgYu28lH1w2Ysz
         1fY+phtsIgSTftipB2S72f7kZVOEp9tBHvm97LJdRgyuqsNGctCEFzwUmAMO+4GwLvLT
         QVp5UiWoXHYcLsTi2W2HI2+X1x7ne3mvorJlQhAVU34X8HrLgcWiw5CrmcK/71tg7NXl
         ZYttU3UsiiPVVFUu7y+8p6Fs7YAwhQ0691+kjPHluMOeE/BhlTV/ijWjajYC+HVNzxYT
         g5rw==
X-Forwarded-Encrypted: i=1; AJvYcCXfCrCS6rXzMfhjzWoWwUykn4Y7nwV49r33Dy3YR8iOBdixXWzRV7EhjEWs5KRapr2reOIQGBXR0KO7kUctGIyP@lists.infradead.org
X-Gm-Message-State: AOJu0Yya6fa7pKEbP37GLxC6eGUGkoPrMIWRMBCr1qtOyzjwdPYH8vfy
	rGn2NL0ISdrL/xcgYoZ26wos6rpjTldu7l8a+36n3xGH46xi27KuiCIguJllDCotdqXecfEjGDU
	JMd0ww7QNQT+CI+079qDv2qZ7bN85UFBJTojUT6E5FejlVYEPFr0FET59IolnwUrzoc/WKQmuXi
	FG3pn7TiZsjg0r
X-Gm-Gg: ATEYQzw/zIVmFCGAyU2Fp+ksjRtUnDdl5qd4dArQoAkhjJA+Q0ZoZsJmyU4fkeY8Fzh
	xKyBffhNlIcv+yAN6DOyWnLWz2CZxivQti5+TH0BCO1TNCc3dS2pTgzChnXD9XG6cUxNeQWxipW
	8vUZQP/6aB1fffmXVPjcQrqUL9dPpEZWQE6b6hjRYyhDHOaJLLJWMswRa2uVDEPITX2HFeXe2AQ
	DxBsNLGV+mBJXhTuqHMEa7wRk9w9CMut0aKtYf8IvH0zo+ktNK6CxnIiPxni+8bIa1yB7QUrJz6
	MvbRHdd0AmjN3E753nPbZI72e3V4V7Nno1ZHAUPKzkeG/3Jg81M0vvIv37xOegXn6LkMjUZFYZB
	P++NHLTEijJt8i9LBat+8IaZD1/sYp3kXFire2Ysb6ObCZASqFg5jWWXc4EY35Eh4tFCWD1Fzbl
	b9Avp7zgfcGVbH
X-Received: by 2002:a17:902:f689:b0:2aa:dbf7:7441 with SMTP id d9443c01a7336-2ad743ff248mr73352955ad.6.1771829809570;
        Sun, 22 Feb 2026 22:56:49 -0800 (PST)
X-Received: by 2002:a17:902:f689:b0:2aa:dbf7:7441 with SMTP id d9443c01a7336-2ad743ff248mr73352695ad.6.1771829809098;
        Sun, 22 Feb 2026 22:56:49 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f619f8sm62249225ad.36.2026.02.22.22.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:56:48 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:55:47 +0800
Subject: [PATCH v13 7/8] coresight: tmc: integrate byte-cntr's sysfs_ops
 with tmc sysfs file_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v13-7-9cb44178b250@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829766; l=3465;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=+caVanCR1MkRvTlDCUseywuTVg2NMA0xm0dQkI5ZlEc=;
 b=8vsvryV3p2tlaIsnZJ203CuZuyviTZHwaN5/VtguGF/hW91zHbcV3jaD9RDG2KEfmTEvONd3V
 5XpDOIs4WHvDzDUtP80ER6gRoG/p72gCkbi45WTlPUhyAkx3etFoqta
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OSBTYWx0ZWRfXyOVrtTsq0d6+
 /lX/g9kTV5p/rQXoB33FLJzADV5FJTw/OCfqRqsM0Gil2j8hE0y+fClDg23h53WlfgXtaEOW+Zz
 3F4nd63eBuivTmb0A/u6gSn/E0eHLCIqb+0cnnQaIavfuHUvJMir3NApYr1vsr3OKfGOJm442tX
 HY/bIEoXT0n96Vb08lNsj3AuYujrc4HPDqFasn4P807wHPvcWzU0AWuyBmZRH4AYp4YCZvrJSBI
 eaUvvaVUvhe5KfuZnBXXunoIrgHsTit87MCeSvkhOdXHv5j4qGBst5MfMZyGG0MEtf7brPwXW8L
 UB4ZvxhIpRRZhnNWHE2YJcFEvFJNn06PXMYwx5+YHwaMErtKyTgpa4aXBWiVBkLWR9BCHgEon6z
 axlZsQbLSupSMSl7Worf1bK09NEfF0BRxGElJEpfF9cEo22iADmOEH6QCF0Pwj5FwarxDBN9Nbc
 81+FDJbDgV9LkcoYywA==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699bfa32 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=i2GxayCjj04of9N-vEoA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 2TZ5TL0zz_awt27Oe3Wtkl78N28-yKIx
X-Proofpoint-ORIG-GUID: 2TZ5TL0zz_awt27Oe3Wtkl78N28-yKIx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_225651_037030_B6CA5610 
X-CRM114-Status: GOOD (  17.86  )
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

Add code logic to invoke byte-cntr's tmc_sysfs_ops if the byte-cntr
is enabled.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 53 +++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 32ca2ec994de..6486bdafdddc 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -31,6 +31,7 @@
 
 #include "coresight-priv.h"
 #include "coresight-tmc.h"
+#include "coresight-ctcu.h"
 
 DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
 DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
@@ -228,15 +229,47 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 	return 0;
 }
 
+/* Return the byte-cntr's tmc_sysfs_ops if in using */
+static const struct tmc_sysfs_ops *tmc_get_byte_cntr_sysfs_ops(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct ctcu_drvdata *ctcu_drvdata;
+	struct coresight_device *ctcu;
+	int port;
+
+	ctcu = tmc_etr_get_ctcu_device(drvdata);
+	if (!ctcu)
+		return NULL;
+
+	port = coresight_get_in_port(drvdata->csdev, ctcu);
+	if (port < 0)
+		return NULL;
+
+	ctcu_drvdata = dev_get_drvdata(ctcu->dev.parent);
+	byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+	if (byte_cntr_data && byte_cntr_data->thresh_val)
+		return ctcu_drvdata->byte_cntr_sysfs_ops;
+
+	return NULL;
+}
+
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
+	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_ops) {
+		ret = byte_cntr_sysfs_ops->read_prepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_prepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
 
@@ -245,13 +278,21 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
+	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_ops) {
+		ret = byte_cntr_sysfs_ops->read_unprepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
 
@@ -277,6 +318,12 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
+	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
+
+	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_ops)
+		return byte_cntr_sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
+
 	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
@@ -297,7 +344,11 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (drvdata->reading_node)
+		drvdata->reading_node->pos += actual;
+	else
+		*ppos += actual;
+
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;

-- 
2.34.1


