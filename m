Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73FAF4613E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=; b=OkztyiAYdpUl2OqY4QMP8E+50/
	9rUvnr5JUPz2mW5MWQgBrVhyRu7ADO7tpn839D4Vu17B1x+pVWYoOg7dyyZ4oQmMQ0AQDSFeoM5v2
	HwIMkiOhqdAtzq65G7G6yosMtUVYcEtL0SatmSvOmDy4iPYujJt4m+nT6iJi2tz7ao3UJk5mYReWN
	v9JTBYBTqf61uzV00miQpdQJDDiC+jzXvLlbybmViEMHWZRvBzKO7gBVMyL9G6jCQdeSHqV48yGXL
	Xn3IfZCbyr5FSnsWGS51glqGc/fXrPubie7RaKUOeisa2+ucVXK4veQ6uTW7SvMdod5Of1GTaLN8+
	gdgW7UDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h2j-0000000H0RK-1s30;
	Mon, 23 Mar 2026 15:18:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h2R-0000000H0CF-1qkL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:17:57 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGXLx021500
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=; b=QDyDQzqjr379G7GM
	ymLkzI1H3VBDMUsyC3gQOY3crRVlVznwIcPZ8WnlGbSZa8eUIsGvKb1T8NA0Nh24
	Km6W4r9ewrUWlrHzNPpWmGH+PTkeC/iXdI5Eux+2GDg5nZT8sfWTsoNPYhNeRLY/
	Sj81Rr8XAU1p6S6cgniVQj2Iri5HsyIr5de8cO4RffuinaqL/3tWOZayoZRMQXLI
	9CTwrP4KFJC9Y3tHMMovq28l18/6qhYGGgXds3/7XCmu9FTbqA5rSKMbGJGB3+rk
	CafH9fBHizr/0nE7zGWYg1WciImZ1q/RFbBBhgeI9rldGL/QeqO/0HoHEPcc21qD
	lFh3Dw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k311th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:54 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94ad0ada31bso40572884241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279074; x=1774883874; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=C10fgg4QUm92H1xSi3mE+OmF9rNI0XA0ot+t4Itvt8dT1JFsh/p13qFCqDNm7h8CYi
         kBV7DOz22dgjE33BsnmNO6hO++jLWuXqVWC0+oedsyg0bkqgD5SIaQBFD8UNtSKTzoyA
         oPkNSRp1r7XACKBFge220/GpytsGqVK3c0mXl0puEKhhqvsAoO3AObkW0Wv+MVjege0i
         rhI8GOJBZdF5wF6Kw1JCFayffnzrBYxEc3MjNoK/fP60oAllsU2+l2wUSic6DJi8u3xS
         wrfkyDS9aG2Dlfc584qEvJFoRhLsO8oZ5AFZ2syik1msuQWGUYOmqNsJCbM/sYHzUco+
         K2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279074; x=1774883874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=V3SLszviX8STz/xqq9YprW4LcO2cVmXH09VZI8VpT8uVee7cdzhf/xeJL6QzB06G1h
         LE2EfxcVe/JRfyj7h5cQQPuSHGqW77BlzvEYRk5A+9HkTv2piTcu7IT9PxcLMCM443LM
         qUiWbShsn6JHu2gvLczFlbOFkN56mZcjSBdzv66BT7EKmB8dH0GpRVfIPtzeBDF/Npzp
         XRTfmIPw2IhhlCLGVSXKQF70McIOG7Sp3avoW9T2oBjrF237Z6qeYNOx6I7OAfRUBDWB
         gpliULHb2qV5EaCOa0AQi+o8Iaw04TW/wYDWSstcaDKKCdZKpNsAXyHj2BwOphxb2+hu
         ASTA==
X-Forwarded-Encrypted: i=1; AJvYcCU0CeuXTnOwbx8reYvDIiBW1oJWVh3XEMW7rs+cCESBs7zS/2D+8vu+Xzdu1Me3csyYVIAjM9ODDVAtwxmgGB47@lists.infradead.org
X-Gm-Message-State: AOJu0YyxVaKiIH/+JTgUQULA1ZNBIKPY/XKDW9amDS1C9++Qx7UVx0m4
	OkY1JgVmgoH3VcUQnMlEY7kkrg34uL37ig5KhW0jRAhbhq1NlCwr2SJx1CiKT6zTuVGtmLX4TOB
	3EBal6C9Gx6++IFxsON7D89iQh6oc1uquI0YBBg7vmMzQBCVp7BqcW3D7+NCt1lSPZRI1+lgSh4
	5JuQ==
X-Gm-Gg: ATEYQzwrzrFuBaU9wvTqwk4msIfZvlloroxldx7Mdd5nAf5PY4dDijEJzzQ83DxhBoK
	HBioSFxvHKwUpIBC0a6JubC5+pI0rbIkJm8Rtou+lAmrP8EuamXDFktRCilBtpqJt/RuKMiViH1
	OBffcePK+Jpx2UIFNibQGGnvSfjAvyzXNNmbckYZOVvyhdB/SV0uQpTjEvBgw5WpUOMSo7NfRP/
	BH8JaWMd3ptHF97f82J7rs6m/LVuZMMPpBVYZYZPXVp4DrQRult3brKZjZYgZylfyJuJNj0/v6m
	jwMk5BrA9xVFMDt+4AcvgXOqBfRyETriDcBIe1KzrtluoG0P2K3Bd263L2kFOrp8rQYHWucqSOp
	Q1xF7Tm7oOBj7YJ9nKvq/3NDDQJL/x55+auAs5aY/stZVs0n6Vyhn
X-Received: by 2002:a67:c981:0:b0:602:aeb1:730 with SMTP id ada2fe7eead31-602aeb11b3cmr4498115137.6.1774279073800;
        Mon, 23 Mar 2026 08:17:53 -0700 (PDT)
X-Received: by 2002:a67:c981:0:b0:602:aeb1:730 with SMTP id ada2fe7eead31-602aeb11b3cmr4497922137.6.1774279065481;
        Mon, 23 Mar 2026 08:17:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm35936993f8f.12.2026.03.23.08.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:17:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:17:14 +0100
Subject: [PATCH v14 08/12] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-qce-cmd-descr-v14-8-f323af411274@oss.qualcomm.com>
References: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TfRVgyaOMZw2GJQ0rx6WhRl0huHGm4mvuAmz76BcVUM=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGnBWYKg/NabL7C8BSDtlapAWCowk5pqimHBbX5Atozm6VRYT
 IkCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJpwVmCAAoJEAWdLsv/NoTD9+0P/28q
 Urkx53lfgUCSaHR9lI4cWTVOyrHAGAJifojqI7AKWrxlLQslGC4kaOPwyr4orqL8cg4bLzasB0h
 SJ/DN4kPSZEFp1cAcW/WtIvmxfN/Vub+6S8sW3SvWEYEyuqIUTzFVFeYfGCaRkTx6kqOVKuJ6O6
 +dksUyx6PIC/dC2N0fzoY+7Cy+nJIFZ1FOSvhHxf5B25b5jSfrpIx2pfRLjnsWsdg2QRYVmvvyT
 M7EmD1xo5zPcZ0Fjq6F5nwallCll/6T4p1jfaambYt8tKe5yEir15GKGHBT/qB7DtivD8LVzr/v
 vvRTZBKlzSSAQM6zr2ZNyYmzLIKnzSxXHFY/wdumK8gTt/7XSeC6IkWYHiqL/pBW2nA/KsuTygQ
 8rnCaCcAeu4rUnpDOwDobLrLOHIT2yjAtmzoGlscJ9YNLpX6Q6d6lxDJ9sBWIkqygsRkAbhWYQj
 PJSqOPOGWzNnXlRdh/zf5Nn2zcKJ6nzEwqvAyiyCuQsJm9PzWyWsPyVxyD1gux+r13PAdlgg87z
 Ec/y9Po3Tt0zYKizZSmTvusdza5+uszdwT+eqIxQgRb2zmIVkoHebLg+raAHjKeneq3oeyHuFql
 2819zdzaDC/o2FLKDO8fEB7QMvYl2nicHv+hsjV5gBwpOeToinbDEYxLs40l5XN98b22TINMKdu
 lGZes
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c159a2 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KrkfD191a8oFwBap4LAA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfX8aZJq5+/iacr
 1Da+9LqDIKzSMBQTdvmRH4X6Ovl+WL4DBLM/hmA9QYFyO4vQBngWPV9GAeHtq7eXw5AKF/UTq1t
 Ln9WqEPYgp/DSNA1rSVw/NqCTbh1w3djwMekAdFf3qmUYnwnjqYF3CAFE1rFMQ0OQEyxr3s+RQb
 a63nYQOVbSg7/eZVu6gnvRY98QmDcu9YsT3eREPRZUBan+8jX1XEqFAknJ7FJ4a7n1W2IWb9HbI
 AF686cPbnqsJeiRmv4Mems/F0O549bP+xqhw8b1jEfKPs/c82O/duB+aEkbsJiKUgbUpzkbOXjf
 XGf5XbndOXuqkKqSJHcwtCwPsm1q1Dh9mZGh54qZ39R6OcEo4ZQXf03JCZFhC/QeqQ7hnH79kZn
 dt3F0+q9oDTupxs3eaHE0D0yJP6uKC//8rgeH3/oqsvF8l5CzRdQTdfeqfVzM2Cl72eBfqnlXDO
 8JdpajOru6RFfPWCKfA==
X-Proofpoint-GUID: Dv1_L3YyflbkMcKk_blMmB9szwcANl4n
X-Proofpoint-ORIG-GUID: Dv1_L3YyflbkMcKk_blMmB9szwcANl4n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_081755_688521_BF7ACD4E 
X-CRM114-Status: GOOD (  20.30  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function can extract all the information it needs from struct
qce_device alone so simplify its arguments. This is done in preparation
for adding support for register I/O over DMA which will require
accessing even more fields from struct qce_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 2 +-
 drivers/crypto/qce/dma.c  | 5 ++++-
 drivers/crypto/qce/dma.h  | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 65205100c3df961ffaa4b7bc9e217e8d3e08ed57..8b7bcd0c420c45caf8b29e5455e0f384fd5c5616 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -226,7 +226,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 08bf3e8ec12433c1a8ee17003f3487e41b7329e4..c29b0abe9445381a019e0447d30acfd7319d5c1f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -20,8 +21,10 @@ static void qce_dma_release(void *data)
 	kfree(dma->result_buf);
 }
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
+int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct qce_dma_data *dma = &qce->dma;
+	struct device *dev = qce->dev;
 	int ret;
 
 	dma->txchan = dma_request_chan(dev, "tx");
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index fc337c435cd14917bdfb99febcf9119275afdeba..483789d9fa98e79d1283de8297bf2fc2a773f3a7 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,8 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_device;
+
 /* maximum data transfer block size between BAM and CE */
 #define QCE_BAM_BURST_SIZE		64
 
@@ -32,7 +34,7 @@ struct qce_dma_data {
 	struct qce_result_dump *result_buf;
 };
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);
+int devm_qce_dma_request(struct qce_device *qce);
 int qce_dma_prep_sgs(struct qce_dma_data *dma, struct scatterlist *sg_in,
 		     int in_ents, struct scatterlist *sg_out, int out_ents,
 		     dma_async_tx_callback cb, void *cb_param);

-- 
2.47.3


