Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC8BCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=; b=SU0BVP/NuHoNAdndYlm5L+4tjF
	ZXOus8bDTy/+8sAnLKFYcjc4GIRTGj7UqEMkV88nEWyBAUcpZ5e4bYPPr20CorlHyQmt92TPyRYRg
	WKbcsnogX3QZ/qnI0nj6Ahh+8BaysgFFUintcXiArIXZ3BHwR0HAobmanZmhixR1I+QgzrRap8hLF
	PMaUuXhp/6SuhHob3ewGDE51FpDNyDLdHla0xvmzAIhMThpNq1PT7HvMhoZ0r3+Cm7BZAbcYiDs71
	dy+qqvCWvin8D+3wehhZuPEnD8BCZ8KJyrjtSmGp4HtVrvOgdtRDdvgeVfzWy6Lz09oAP73/AZgFU
	A2m5JGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZf-000000021EB-49eS;
	Tue, 26 May 2026 13:12:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZL-000000020xL-0mr7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:11:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsPEb2697737
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=; b=fYvR5w6sNi7BMsr4
	dpFPfDr5EHSwZvnJfvxEn5F9C+GU349KiW3BLfyFmYF+EgWiyS4k8/fcYX9ZpV6z
	5TdFUz3zXnCYsljKexRxbQP9Z1DBniywQ59E0oIkk8G9DwY4OBv6hr1lNV9L2BeC
	I1OdZOZE7K3+IcZYI/p/vkEZks6uqjdDVwp5O2lVsEkYASAwsIrD4e1Zo7W104G5
	RjCf1fDa/Ff5ygjsMZqs+wxGjfPA8sKHChl65NFHNhETokdczeUxxwbWfr86aqw9
	IRTyoDQlB1fimEPOO4sOOm8Kt8s7zuk1AbAk1wiS1fizWYpqePQ75Hqb7uDXmX/A
	Hu0AiA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecsm03u8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:38 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-63302aca17aso4464599137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 06:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801097; x=1780405897; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=WtcDYlXLDRnn+GvsrOdph2dy0IxVhd6nSl6AIvZML6hvh9BcTE0jG5nh7fe8cNQ1u+
         Z/nk5w1yXb45yh4jU4cZLhyPZiQ8ngRnCYtUjBt5W26np57e6v2CQuxskSe3/vJVLqUD
         y/y+rDlPt+Ns91D1TcuF4QKivBSNpCMcl6aF4DqL/lqL0qiqwgHCDJ+T9Rv22Red3UfQ
         i6m4fx7z+d3o7kzaYmQooT/jsqx23MvgUY8AqUpbtLEBw47eEgIaz0KLawBfoG5hQmRj
         sDAqMYpOrYIb/0B9cmThO8wnQeogzV9+0evYxd3raLOfVeVrqHD41ca8BVJLntejb+7o
         PJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801097; x=1780405897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=TGUfteHDl7m2mazv0QpT1ydHTR23dheRVTVMvAYEW1+W03P80FMk8ngeXHZvOx9Qvj
         p7KVIJgpB3Ec58gmd6Xnfd1jbmNdT+HkthpEv/UeIXNzVdJYVudJzE0F2wdEqw9ZJ02Z
         HvKRCFAx2xWpKIg+meMnTO93PPm4bfKEHimG6QnMWKKUzVvP12Nv5MNqvnf4/0VERy7M
         oJQUUKYJ8QsJTfw5Oh6LtW3+vFFHjfzdGD1dwDjx/ajbJUi3QwEnsfQXuMBscbrJ1fHg
         nYVs+FImPl+jFkEB/Wt/wnvkK1n1CLpKnzeYohQP3oVzSmfA5qolr15cXwuEmJY0Zw2H
         OJJg==
X-Forwarded-Encrypted: i=1; AFNElJ/ehZRxiuRN0sefYP+7Udn3pOK1fAEoC5mHByzUaRMEjhdoHfGo++JKZ5NIiNN29IH64KZHSIcLHlPWsSXkWdj/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2Oqx/ReARNEweN7mRm2G+zaSXiXdX/Ke5CjonPOlwgL0u9bUo
	Yk0/8APyoQ9biIb79ZQa8Eut+OWlf2lshWHdIpbmcNdJAUE5L+adubhlyRm2P+8F/kVf36ETcrc
	86PlXpKmjISj86xXVUr4t6UBTtkTmeoiMYqtCiooj9fU8/xAOPAGDWls/Iizg4w0cS3V1ZkNONp
	laUsVkG1vMDA==
X-Gm-Gg: Acq92OE5d/KWZjiUeoNRtFiptWXlxDt7Uuwji1NxhwEhnHqtBci9EABqY3bG+a7nKhz
	bjyNdAoYKG5HwtvFqAslOpzBumhKkSTonPHc0adWKSG/zmm+XelLmDBeCLDve9tDgMYHI+fsffJ
	+lXRs9W+ox7IH4XCQcO+u2hCTHWXHDv+E1rH6wDIXdyk+RNALFNaTT2+gzCVJCWpTCtYKhe60gm
	gjCJxIZIk1bO0bbqDOpHcTuK6zovh0kohOeKwxVN+co4zgHUHVMbKr3usfhKDmk0j/lwjUH1Yd8
	uwzG7igwMI1K2qU+0Shs9LG3DB4zamjAR7WnEUCwbjJPkYpd4y+9LHqfOGOovWTtutw3q2ugY+3
	Pp13gtARZW5aZjDshfEeokW7uXqpuSLi/JkFnTtQmEN2y1YXMwSyP+JJZZNDStQ==
X-Received: by 2002:a05:6102:689c:b0:604:f849:462e with SMTP id ada2fe7eead31-67c8e97905emr7864585137.25.1779801097266;
        Tue, 26 May 2026 06:11:37 -0700 (PDT)
X-Received: by 2002:a05:6102:689c:b0:604:f849:462e with SMTP id ada2fe7eead31-67c8e97905emr7864502137.25.1779801096708;
        Tue, 26 May 2026 06:11:36 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:10:57 +0200
Subject: [PATCH v19 09/14] crypto: qce - Remove unused ignore_buf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-9-08472fdcbf4a@oss.qualcomm.com>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=j6XY4tGbVrzzivRLNBnBuYRESnCKLFI7yXVP5haQkuk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvwqOknm+Sglsg/uIVkQOWaSxMSKumM4PoIj
 kftpwf8nOCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb8AAKCRAFnS7L/zaE
 w+rsD/wJMly2un6WFFVD7UJ03Bc4ShEGXIFwEcQVsq8e+Xa7FxB/JpHyDdV57iGPjfpiet5Biww
 PoyWytdBUim6dh3Q7BTADj+AeO7mxw2u3xdpwPi3/x/gcNGRH26OV5Av3goFZyhkLpUDT62QNt9
 pyYMcgAIFaBgEmQKfcq+dP3pnRTvvMyjf1UMUmjKEGIJJvDeBIeMrYm/1xXH5us6dvRHLngjA0n
 PLCt4dkaneQmWnuGokrHx4VKB0z1LnGGA+gaPOsUBvwAfJ6ZndBGqRlLKxvX5okM3K7arY9JMR6
 EMMOa8UZuWPxL9+M+WCiIDTCR1nlLPqS7Pjvz9Oh2VtyYSwhkYR3Ob0iWMZ1KraJEyIfHuo7N8b
 jnj87TtWJnR8zMaIsbvd2J19LFpYxsfnZPUD8h3+HR5rVlUvJrrDm903yjww4sQ9DvunUC4y5Hs
 Bbg5poL45iBcgYL20dfor6M4vYLhijGJxZ/Cfa4YcEMzSYKF5eZCbnsqtY0yS7imTVafpaDf4lm
 KAw+aHaCr4YHgEJ/mX5CfhQSfq5QghGd4c2Ls7VMKtVxftyzf/0swzaxQrJ1tlcwLnIK5K2Qm3k
 HhH0Ra9K9QHzFSEF/ZdR+3UyRQrIUvabSJVYRRdx1g4+EojjgN8k7SCunAqJBqcbEi06btoKGy2
 2ojBZqk7hAD1/eQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=CLEamxrD c=1 sm=1 tr=0 ts=6a159c0a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: nx9tNs2jy1dRMs94nQrXpB6DFN4u4C3c
X-Proofpoint-ORIG-GUID: nx9tNs2jy1dRMs94nQrXpB6DFN4u4C3c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExNCBTYWx0ZWRfX2TL+FVhw5MaS
 PRVC4Fn6nbeTcgmpDkCQsAQKDm2uzR9AWhoH8BC8WvsY1VMZ9jlpF/6LeCfUWwF+gWYI5gYYIYj
 YagsaroblPyjXVl5cKtc+Ovu/Gwz2bP9c7JXeJ8ogB7V02lo0F2PtLZOg8+CygRMGsLReh9vpC0
 ziMMB2mOiT+7N8H93K9FerEOZ49vcboiPQKHuxQBzhiXiOvuPuJYCVtpBBDlSapit1kuPMXP+F6
 c41UlT4zrQz/BclTTcua7P2zpBMoxLJ20XYU0yu9K33u+CG20tSsHfnU4OvNvLPvgburtZ/JXqV
 PRTS7U8Cq3Fujkk5fxMBkzx8fdKbQI5KzsctqOA/YuaWGTp6KGeT7J/VanKrKjVdUvV3hCmD0C6
 utTD4+IlMWHBUudUB/jOi7m/5Ga1KpRR8luYqBpMUi+0R4AmDWFoMftzBXJmeBd6aIhT4ZKqAGS
 f7i4mJF5R/jp6GMTa3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_061139_257843_951ECA8F 
X-CRM114-Status: GOOD (  18.40  )
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
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 7ec9d72fd690fb17e03ade7efe3cc522fb47e1ac..d1daa229361aa74da5d3d7bfe1bc8ab189761e38 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -43,8 +45,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
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


