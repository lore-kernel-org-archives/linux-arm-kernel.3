Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE91EB1074
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 15:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=Qpm4VUbFljQqrBy2s1O5v35JcM
	f106PMCEE2K3aRGhgTwTuCVcB2qj1mc8k/VXVL59ZXgeN0US1Jwt7AtXjgutul/U1/c7F2+Isk0kj
	JMhFvVELAtlZ3ziRBLSYzB3EOMZSh3fEH64DaWj5lPu3sKWznkn0WvWR5yTwLx2jRzV+wNi/j6XR9
	PNeiibb2Y2aBPTWO6vJ3lIMO/D0tZ0bgKTZl9I+Vyxh4DWemQ9271tTmCjZkaIKUAYRsxJfdKL7R9
	nz31l2OJDvHD+bWjyW+2FIeflL/2Z/HM3QZGJC+8nWIeifwNLI4dtt6FazV5E7hCovdR/lJeBm9u4
	JSxPHOqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGa-00000009q2j-2zdq;
	Tue, 10 Mar 2026 15:45:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGW-00000009pzD-21ko
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 15:45:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AEF3i71863466
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=P1/GrsyaIA2oSetH
	qyeav9DFW2XVlmvlGqPfQIv+eWCC43lgxBPSd/gqGr69BOQvm0QgM9MipdPFDVq6
	I18t0iy80eSWl7F7kIW8CK9lW0zZRh1+6QbkViBqou7V6BVLBCV8qp3VzBhKB0Ud
	j+Q+qDDbWmNKq8mukpI7x9BCcx8J4gR3n+3O4nAG9ciRywZUW7FkdjzyV3qpLirG
	lyM9VHhcjH86rOV2TgyNVymX95CiMXng6JiMG4EgDTa0d3qp2L9c/4QFndzIyV1Z
	b890QdBIgn8Z0WCvXfCh0lnF3XyQ6T0dGELQFR6N4pkTfikGYDxEaC3RmLOgSAx9
	0lDLNw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctmw80cft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:44:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd84943c76so5777685a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157499; x=1773762299; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=gnzjxaLpYNG+ZRCm7PpCLba/HXrRGMGXqcvY0J/INXtqph2PS9lp5hgtTJQ25hFVSh
         cgdDWjUbe7xAoVD6Qu7tY+oB3jE4cI49zBhiwqpzkqL1u1DSnkZY6CndGAfubepuYtZm
         icCz6omQIDqZgZ43nRF8/mfrLCw8mLeYMNe2Fb5tt4lBfHVAE2TJVSm3TDq7lv2QDBhz
         /BBT3xtnpiDK9Lgc1T4Ij3QzR7U891Uxtzoa1x0tDZAA5/vpZfZJ5lEqfvcuYzZOytln
         oZGV1+WmrBbtqjPbFryL91BZkYWzlk4q6w75upTT0McMapeqqD/4wICaMzFYP2K9c6BR
         WoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157499; x=1773762299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=TvfrAPAIECYs6b80pnMDJl1+QBVktx4Cnkuw5jFvSYi/0X1Ok344qrfMIQPiMblcaU
         TjlhgPKFZGvv94ya6V99+hA/L8q8n12hH8MiVPG2UWHLrXlPLdaQJiUqTzNJTuTntgVW
         L0Q+IaKUvu/cEStMVM4efkcWEHF9TcDS+BtJyCPv1V1RqTXVo1mX6ijOjzimnNOhMd0c
         VCm23wSULh0ChL2RtaY+O932p+dF70Zb+Z5I/tad4+yL18GSlX45UEfBLQHdgqCMKoK1
         jEGq6UDu8+5W3922N4p7JM6VVjO+9OF/Rq7ZKbnUbL6EWy0LgJGSN5P+k1wxnljEZeFZ
         DAKg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ5h2EBQBNMVddqjpZr2VP4te7eiKHx3J/ba5l5LrnBFp/1jTbJLlwVEbKKtHxS4pjodRQaDayK/kjF58ICXwR@lists.infradead.org
X-Gm-Message-State: AOJu0YyNafLXPADfaL77IaJxRTsS9MDUs02BJ/8n4vSxSBirZPcSy+YL
	DKX5piUiCGoHlVTzUOMNAVgUFfDmRzqwhyIGcZWu3AVrrrRBCvunC6+ohNZH/1zrFOJJTh+GTcU
	uzO7nWdDKqk3eAyAiAF6/9mZYyUTcIBwqRrlzg/Xi2QXjJ3ED+H6/lboD8SHlVmwpOKyoVOhrQP
	8u3A==
X-Gm-Gg: ATEYQzyCX64YyplmTm3k/y/9cRb95GKfcX9fmXIiyOSAJfg+ELuLZQMjcVtHW6UWTZk
	yLzvokodaox2EiF29CkWeoot2uvorL3VafBrilBzu/zzLlfpqags8xDKDFymQkLpcCA6dceXmwa
	vWt3CPVd7ablSLsrWu0BFzKsih5o6teXzpKAHd7fSYeAXvxiK8GOmzt1Bwv8G6BJ7PcnnTCLxxC
	/Wt6Cw5BRvuOj8JCGn8L3rP0uBopq+jD5/9nfkjPAyzJoFbPoy9vN8/6w8Bw5jAkXssyPjT7EM8
	EF6JWPnGbyURFbfjbec0fc4xF0/HPk7EJAF/sBeDvM9GEI3CHWSHUJMXr6HV3BJ4so0vSjAIQUi
	knVU+TaXinayum73ZTrDUulEzfN/JcHzUQnUg2JKRa2NBhqIcg7B/
X-Received: by 2002:a05:620a:4142:b0:8cd:87f2:1cf with SMTP id af79cd13be357-8cd93becd02mr444894485a.20.1773157499083;
        Tue, 10 Mar 2026 08:44:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4142:b0:8cd:87f2:1cf with SMTP id af79cd13be357-8cd93becd02mr444889585a.20.1773157498559;
        Tue, 10 Mar 2026 08:44:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:44:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:44:21 +0100
Subject: [PATCH v12 07/12] crypto: qce - Remove unused ignore_buf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-qce-cmd-descr-v12-7-398f37f26ef0@oss.qualcomm.com>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DfH5Bb+Cx5AadRW9+jaH1GcMtyO0VLpMWlVREcJBr7o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxm7NNbkl7dnR5eoGZNBh/IFZgrDD/Cz7G1i
 Nuf0N+OiJ+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8ZgAKCRAFnS7L/zaE
 w8NNEACAbBKH2NWwSM1Mz+lOJfH83qaOWjprWgrcCwR5/JGaCQnrFvy63IiH9Cp9njz9bbvb3sX
 KIqKY13S3Lcnsab4bNU5UL1h3uKpBh/++69VsiUGdjNACk8Jp7wz0FigRoaYBqtMkjxeFlo3bRM
 LT6uFjE4NQhW6mCDI6fC7ZxdwayrLrNEGgpFmccQNIj96aOxtJ1Mql631jGWJhqUoVOUoVy/M/P
 lkmCKZyW6xeFME1xZ05QSe+neR/2FTEwdCa6/lv1IHrC5Ufi+Xq6XBtdeAwBraIXrf9TXNNnPBN
 er8sj/RHTaePjHJAAzKRHBrzWxGemSnr+zVRNE4hMhoNYeTvn9LvfoOBUSuGNVpR3CpDJBdkwZW
 nrSzkkfxc1Xe7+xX6ovsPtT3gHyRdiM64YzOrOIkZiAGkfMoBbmPpdD2Te6mqyLLex+rTI9Ww5B
 0LRhSROfBlHDIJ9D6OpJAjBoPOWdhe31wX86PZ+2zYSr6u9brW0pTR6lLt6OYhoBJr7bzql6t6i
 wSiDT9l3m47j/pfJGSDyCITTycql7iBtXEuaz7z2aql9Be09aoGF8ulhlt9kwNyamfQ2d/+g2ML
 305/3e6tCVFrRUIMZTNP5dOm6jw7DUQyB0fFPy24HtpSzBpKO6DRzHXSUOngL5uP3+GwxkVwYKi
 +axkBwuOz5l3ySA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: LKCvzsVtX_yjmWNYUgXC73hIw_vzRCiu
X-Proofpoint-GUID: LKCvzsVtX_yjmWNYUgXC73hIw_vzRCiu
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=69b03c7b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfX4DfrHuHWvmLy
 7y3tilThUuf98JEO+8tXxakOE/DuiUpAbxtaebPlbk192JQEgjLty8raFZzfieSEQtFKTfu9Va8
 wPT2e7AF9IJQzBnBjg2oc7jFk6EnZmDhAaaErN5WZR7Ult8q9JxVWbf55yCge2HMordyF2k4scM
 CNLEs6z501r9ex1LLH14AjmlV452eD/VB9kJdByTqlrLFSixdp9CamrZT5XpOadnFUMqvN7CJJa
 xH1mk54dW7E3ieHTQVfeFsthHuSph/UV9ol/wQNBAH4ZfHvGE4oYXoANwL6zKGHiKrZZaZ4wqCr
 ipM23fb0b2n7hzHl9y3v9g0IWWscjZx/pRfDV9IR7X4mz/DvrFpI7Iom4c5nQL0cbH9Z19K4Cs3
 QmOnoLcwu5r+23vIWpbkID9xK0FarFhmUYmjA32M6lrfQpsOSCyCCBMsbq0dWCbaugLq16VroKe
 msVOXSfMNRQYI3A8s+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_084500_538817_38F59FC3 
X-CRM114-Status: GOOD (  18.56  )
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

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 68cafd4741ad3d91906d39e817fc7873b028d498..08bf3e8ec12433c1a8ee17003f3487e41b7329e4 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -41,8 +43,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.47.3


