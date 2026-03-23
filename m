Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA53F4613E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=Zel6mf8/mxCo7gvbPLug2u+98P
	OusN+Oo1zlqq9TJ8C6+5IKTZIQOx1dlbY+ISjiRBeI1QeUFsY671y3fvmVK2P7coGCT1YpV6m9PB0
	JiWBwk3drG/f5PFyFgwrTNIp+KYFUR/ISddcg7DkdRXHatMfSjFs7RfNcoS5PuyTPKBObPKQwjD9I
	Gp6jMASmQJQMEeekmEsDAoa3Q8T6pC3buXu/bQlTcns9DzEICkyyJQQpi8vMaHrfhl5uKMpihCtnc
	pdczIap0qpe71vCsoFRiQ2us4MH/oM+2pGL16tDVuj6gP74yexaf8uULIRkVcZGPJ9MmgrzGsAJxn
	7scKRiEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h2R-0000000H0Cl-0kuM;
	Mon, 23 Mar 2026 15:17:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h2H-0000000H061-0NQV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:17:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGWNl600271
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=QFw4uWevKpfY2N6K
	Do92gBz0/Fcztm4sKFqSsB3N/ScI/GDUXnXWkgxtmitcs4oxD61xcq2i/vNb6wpl
	7hhNDKcZyzRGJxZNV/ePerOLoE7v55NNad0eaqZjSEBhcPsT69QzSc/lt5gLALDr
	9/dw7vfkdbHRiJIzokGrljw31lhU6QpaccQ64i24VOU1YK4qtaV5boEJt7uZ7uPo
	kfwRpViFGmC6GzI5/tEiMk/LGpOrf6QViNZ5w9KFc2Pefgisy7xpYnZAyPZXsH3+
	z5o2cvLpZMUpX3jTNaGt99BFwo7AjawvxH/8HMSmPn77/OR3p9dZWA8FqsDeEDwk
	Z9m6gg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkrs7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:44 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95168889471so201140241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 08:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279063; x=1774883863; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=LSz75iD9DLVbL/fOPXqy/ZK32JlG/RXS4kohoduUkFWln0SBWlfoRnBTHG+xQilTrJ
         0gEkgc6hyVYdHriL4cxgXHGbXHE9LXVe44s7pIddOyg9rk8XN8UEAeij4JNabxmn7Ff+
         dWjTiPXYJtmwCZeCtxOgcWDseyy7VV5ncKpevQwgGMRe5v2pxOvnoq1S0Uw4HFXd60+p
         548+tiqsVIRW3crEMfkmzZT2RKMccbA8vMoeCWBTHfokEmq453lKxlOTu0X19Zy6VRlf
         9jiIba4Y4nqYUwKHVc8Hjdz0a53dRntd3tHsmeRorcIVde7r1BG/T5Xyjn7fGFsXZc/2
         wORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279063; x=1774883863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=sQ3DsCZzxwGrSxcXPyKrjyfMKcLetbt4f1bxtSw9FNxYJ7NQjZLA5Ur/xfCVAeaaLa
         PVJHWkmW9eey3V/uY7w9Sy7JZ7YGbtIxmm1jI7EiHhvxQvl4xsgp0HGlaCMo/zzyo3EI
         CLr2VltwyChKoNUljqW3DZEWjT+tVMEsIJ6IYbChP0LCpHsXuzsYge5BAP/QFBgpVPci
         6TJhz1Le2xU5DxpgZKMHsbTVnBg7pFFRqNJHJYmID1CLM56CBJvcQ2FvZHVnZikmPExE
         Rx8lY1qe1IYhGqnt2AAmcQY7cZQuU8jA/FLnQ5AuFoV5o9KtiuV583Iu+PwjFmNG7Be/
         SAPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDELEml0VqxGcWuxVaFmcTM90rzO9QLuotNizDfmN+9hF9XHKul9hUt3WJJj3plS4Ty9za8IKgzMQVQF3TkrmP@lists.infradead.org
X-Gm-Message-State: AOJu0YyCSNCLchCyj365CE9lcGJbfKoHjLONHY6A/Q2/bxVIiVD3a75D
	MWaI8SgDUeL0r1qIUN/AoSbk/qRRCgMd5DE1cIHGzz2EjRQn7qQLfBu7CKmcztG+Hxzumg7dhZ3
	e5Z7njN0QvWxCDfYRAuJqIaKDNXyPNvHmT9c379CAI2YiL9AyiAoVOdWWhy7OeBTG0asKxUwcy5
	x6xA==
X-Gm-Gg: ATEYQzyC7uEG7/963/yETvcju2qBJYpBQYaZUYCnkTPIyFwb22/ORs9KszQn3v+rAn7
	LON2KHwIJsmRIAOjTpyqqe+ZjVysssxKXIL/aoRUCJ1wlG+BFGubZmnbhsPgBUPkZKb+Dufrwke
	vrzzOGAmrRmfy68vDiLDoLtmWtH8FILAfF9TY5dz89XBlFsTW6jkeAj2J/KpiFgAqSypmz5RtHU
	NQH2qy4+FTpkWFEIzgQrZrXHROxSoDfcWHl6vE6S0EpYbbYy2+ghI4QWcMMTmoDNg0CkQQyGmtl
	O6iObX0pMz6fHJ+2b/C8ISMUd5m+tYS04+9AOD/C5odzq/hEoKhDJkLlZUGO3dz+Wp/D+6/iOJ0
	pR0E5/N29NadYLL3XKXIylCCeN3ITs8GqblZlS9B+PzeNcHiEHEyO
X-Received: by 2002:a67:e703:0:b0:602:91f2:6b07 with SMTP id ada2fe7eead31-602aeca3620mr5338074137.23.1774279063482;
        Mon, 23 Mar 2026 08:17:43 -0700 (PDT)
X-Received: by 2002:a67:e703:0:b0:602:91f2:6b07 with SMTP id ada2fe7eead31-602aeca3620mr5338036137.23.1774279062924;
        Mon, 23 Mar 2026 08:17:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm35936993f8f.12.2026.03.23.08.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:17:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:17:13 +0100
Subject: [PATCH v14 07/12] crypto: qce - Remove unused ignore_buf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-qce-cmd-descr-v14-7-f323af411274@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DfH5Bb+Cx5AadRW9+jaH1GcMtyO0VLpMWlVREcJBr7o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwVmBkjvocaAYojniYTiJ30zO4t/7HQOAjM8kz
 ejQG7UWQBeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacFZgQAKCRAFnS7L/zaE
 w6KRD/oDxII3O6t0HSzep3ZIbunXeSnNyR6xEPumRDe1re5wvXXDvm3sgBvqo+lRd/iPpLL8j7A
 yd1syT0VkOHhVVi79OKCH4x7AxMoFtZRZJWWjfeIcyUVotNDkUG2mRzEDEjMDV6cED0+34ylxdA
 w1f76QTCVNeNKot8ygSLr6yNmq2htWNBIjyoBBbl2W5LbdqI06vRgxIBX2dLZfkdjm33EyNI/kK
 y7IWybYrWzFWG4Haa8tJwPE3R2FmdP9JhtlTmDwYWZKtc1xeKxmOEAvsLLyOQVcyFgQVf+/X8no
 I3UcyyrKNrYiUg1p2vgG/GRoSw916z/RN0gjK7FAy7Dhh4R6IErRcXKYh5QsgznPLH9TLSvnXvi
 i/upzqXHdMrmDsA6Q7UFdTtUxiN8J0BubouaykvM/AIm/XTGVtI12Ah98rrZLqUu5F+04NLIb6r
 k5rsWZUZbQilp/OuBAvTfjyHO3XmcPQlidhwXjlbAlz6ZqAYUQcTg6bMwwEaaZpkTEHiNITKYgS
 4EKzXH033fgUcahGPJqXsr7KN8YSIYejatPS7sKNX5YEOtHsTn0cvtQ+g8S9BAA5MtCb9rHqik1
 7RRdMJeV2XdMRwdwCTF+exBKVAnYGbwATKPnJ3KDbL0g7zbwRnEjtHYO5LuGzS5b1lRPvQ+Mlbi
 Nk32h4d79H8L3lw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfXx9sxiwb+fycd
 wiC16MBVnax2eipGe9hZzCZwhMtk/fLSYAuRHBEBhbNTdcLrFLJIKffMGbhDsj0uX8iR7brh8Yg
 X0n8mOBntU0bVBA0U2c+kBKVkB2GkTUEyDkmgl8ykQeU3BaKwbl0tBUsHR/2qmWRruoiOPuVwWF
 KNmK4F0QIZrR/K7lShHJgX6+XwgOPEwetjbmFlku18cY6BMxSRKJ66XCfkoGAOs88BKLBbbifgt
 3zXE1zfUif9FB35c4LTz9CFftjcK6vT2fGpL6/FgmeKrZFnbWYu9uwy+5cqXfdnOceV1gaR6M6W
 bpsfjbv4DsSe61TN8jBcEF58IABT4Ub29JC4uCJcflKhdJGLR26wdlh4911iRg8uc3tESyMTuAU
 e+0s48CJBRoU0mmSzwSrMD82kIsrNU+B6GvL/z+p+v01dLhDUdrhJGY+oCCq9ZEHaC4A7uoaHwT
 yawpgZUBLa1STLezhSA==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c15998 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cV8g6mytPirByI7FS-ZuxnFkglbsurvi
X-Proofpoint-ORIG-GUID: cV8g6mytPirByI7FS-ZuxnFkglbsurvi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_081745_254379_85BD5BF7 
X-CRM114-Status: GOOD (  18.09  )
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


