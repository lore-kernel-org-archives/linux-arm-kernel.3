Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDCDCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=; b=ubqwjSekT3Te4wQRx985Gtpcfp
	LlQbp1SKpMNDlYHSc+5Nxh5BDKkA1wKP/7TdveTcUux5qsOBLmXswc4SKGncgEgFNMf7i27ZL8UEW
	BQby/0dumXuwO4lgdV7qXXwIaMQn3G91DnVYM/VFFhYZyrBVcGuBvzE+dc4M2ah3UBS+JRwp57L+e
	0ScPuylUKc11KYOIsgtWeUKF0rtyaz+DLVpi2ew/ZHjJrS5PtMLX36IRStZ5wPIZNHE+MTQXWgyeN
	NZ4z0K5hIGtiYPrspYb1xX1WUTz1ByNFnqRkcLO8gbVN7YD4LsCbdHQbfyx7O2omUGLGN/bEhv7Iz
	0oq8pxBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZf-000000021Di-3BVC;
	Tue, 26 May 2026 13:11:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZI-000000020tl-1Ua0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:11:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsXx71430496
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=; b=PDOAI/V1AKIUSIf2
	8LvaPFxs17fPgR2zWuSNdcb52ZTD7gi2jw3ii9z1SM41iXVk8OQRCO2FQ8q+SCR5
	/JtflcFoClrGzQmpfoYS0ldnVSFWfiuBacXjOhhagtO3maaNOe1M7d4zUOs8ZS91
	kavXyaLsQB9MFi43fZT5WgWWEtTwgvwSlQoQQ4XI+ACQXYpWsi/f1B9vEVPrVQ2A
	a34h7/8I5jh5U+cF03+RU5qJoMWZ83H76KJNLuPc4Xk+bFRanecdzOazy+2CYEIM
	uvhPz/zOxWKEOIgbwkrD9f56P6L4eCuTSvqn5h3N4stymJ1FC05EUDPwCYYkObuA
	6CRf1w==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv52nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:35 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e606551a79so4287409a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 06:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801095; x=1780405895; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=;
        b=X3C6pu8EklGRNp3FZYacYiHZqFEY0SmtTGSPLtJwfE2HiQA13tyFfQAmqLgygW3dAN
         a53+3++UqOeIC4baSoPk266o3iqog1gwKaliTnKtv0YXWJDhu93f9QTL76ioiFy8dQGy
         LeMoFiNb6xWvso3+pMk2UnMFLy22ddsFYx+Tu4bwQsN87f6eyF86sAI3xGykgkFH09ny
         MuKwz0dkLBn1Nt65MFBUpnqOtVYhtgV9zKzB8HA581aB7w1wPYge9swt/ScwIM/BSIbc
         5ciaGXI3D1DZ8zrUdvasZ+xeeVN5Nrg12Vq2yoqqeU5MiCZqSnGa67fWtKLtl+X3u7ZP
         m6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801095; x=1780405895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=;
        b=HjK6mGRUQUzNWjiSUerXCd+YnfVnJthGNhsHXWx1EStMtrmKUofw1b52FpK8XMZ7ZU
         yNcQhHlvgryjBm8c5ZY3vH5k9GCflXaKocahA3mmQmRcqi5KnWd/5H5E/m2PcmoqzHtc
         rpSDw07g1wfjv7RNe2LZp+mPH8AxkBv3l00etDOiEVIiYO05JXEA+TsNqXwqnh89Pvqp
         Ig0eqdEq9/Qqo3WCSjFGtg0BUTsH2Z1zMkDAqWoWOXxyBpSlfLPs2wSqM6xb6z6IVs2X
         zm8BVe9cxSpzKAvlfYrCjboGUU8Eb6w33f3HGAcUg1x13KuLZdi9HQIdqHEY6npw1feS
         39bw==
X-Forwarded-Encrypted: i=1; AFNElJ9B7xcnNSVI5p4zHdW04TriTayTYWCQlnXehX2IJ8/3wXEhaxtw/de67yIXtitDtoTsiJ3ech0IoMJjAbpwezbL@lists.infradead.org
X-Gm-Message-State: AOJu0YxPwnthIcoECMW7tduKuFwnglRIGa6Ok+6Xncery+5IlodwpyDa
	hdRfyAp31S+QyQ0PjSfx4C4m9ds1Nb+bIcZmUpcs4ELynpYcWf0Lm/bm3Gb/WF8mKwgSI4uTrTh
	ad+rBSSRfkdfEdHiMEgXe+Dun0PYWSejCiCHK/rQb+LPhHZgSw1z16PY/lJaE3UGrJ4Q9PWqnRN
	yIJg==
X-Gm-Gg: Acq92OFUdEFeL//yku8wHlHbOsQe2fI+dBtE8CkeMX7W+9XlHfKXz+wynk+fXG+P/e7
	LIBqbglNfVU/yvkO2S82bic1YZSQXLz5PffGU8qGairFVT8Id3IqUHYdCJ9/tJD57BF+dscKfGz
	0QWQHREm0tSWLTryW3ngW5QkP1etpnEvZa66uDpgRNObvl1Rp+eRH3qlxjYEDYXb70N+WQIxkxB
	6bSXS+QwjvsqhM8f6R4BvNW2ES6K49GARwpZNgH82QcXgRcQckclIwrgNI4M5ZSNz+C1q1WKxXD
	wQxXNY41cbXCFEmECmk4OJNLXJoSorzuMmIXezuC04pJuUk1aVQEgLdht4ec/HWEnor5nwrVsg7
	nxhOhKV0GcjkVjPWawgO/Rn3yrJH4naE4U01ve1M7r98nglYdxuY=
X-Received: by 2002:a05:6820:4c0b:b0:696:1262:2ac5 with SMTP id 006d021491bc7-69d7eb32a22mr9146026eaf.2.1779801095107;
        Tue, 26 May 2026 06:11:35 -0700 (PDT)
X-Received: by 2002:a05:6820:4c0b:b0:696:1262:2ac5 with SMTP id 006d021491bc7-69d7eb32a22mr9145993eaf.2.1779801094678;
        Tue, 26 May 2026 06:11:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:10:56 +0200
Subject: [PATCH v19 08/14] crypto: qce - Include algapi.h in the core.h
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-8-08472fdcbf4a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qxst61jdIT+8Ht+en2AytpIG+5WhKs6TgGXh9cEYbqk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvwlwWuPPOocJK5HTgo9RXGebXz1TH1fLJDZ
 zRrnPDCeUeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb8AAKCRAFnS7L/zaE
 w4J4D/9TZ8zl+AagDemgV18CxEwlfF5SmO5X5h9N+TTNFeKXSps3Y65GYLhqqOcDTwQ9yafpTQo
 KslC9G7SJjpvzgeNNc2wTbbg6CSoLLgcU/+BZ9aBBUqclXF5KYZkku7BhnlA08xrcEP997eICkl
 fs/sGTC+6k/jVAe7ECWAF2F5HFM7yLvmqrRG99CEqe/ALf2yPaUvxFUUm9YAb56si7pAwpRnVNi
 Jh0g+2REUzCY5DaxJ+ZIBbX3PdDnnrnB6guGPnXEGiDZo1Y0vU3zjZkE6rSBez6L9wksn0tT7lr
 M8uM3wUPXFpgXqJM6sycWYIora5fV37jTMvt3Wcehn3ZR5CBwXxv9gj/KHnD1WR7oiciKughspM
 u9OzucZa544EBjJDx4vfMpaEvl8CTJhnAX+r6i4mLpJMyuU6fMrlK0vxuCovpLxezrvCMywAM/f
 pftFIIt6/7wETddPCn9EJoqeXw+AH+T3K2U9QSZyioq2WWQHRET99cOe8gGv4tjcQx4pPMFS/aQ
 1KtXTttCSCGY9C69bDcp0AV1JBJKBZoAqNhobsXE1vEccka1CoK4tvm/AZDfpCsIc+RWRk1s1MU
 AWpLZ6pbXtgTIN7LxL7wtShVZLIN/uMKbkwIR4+hsQJV+nDyNxSxmtzGmyDq+wtPiUWEM8U3+xf
 F5T6OyqVNo46OTA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMyBTYWx0ZWRfX8PFde1RduxVS
 mHSd2uayySrGKd3atldHmsET+1MyfsDP/HdKGiMdWH/8ekiJtzLwFJUyR3e+PgQmsTmseAbgeXY
 5CGEYYGISeIplFibevOqbbOspnbAGmtGQcDGKovD8B950Owdq9oVUqWuNDBGVHYHhxqY4TBnOTR
 3YOLzZs+iTnJikBrs2H1FjsHLUTKTZI/vU1XrsJAeYgbedn8WAHQcQ7auFn9EFLBy0wIfN4CyS9
 ngtVXSPUHCRnioVenMHcoaMcpLLuLTxxKXiSKn7stKIJBsyYpY0ifDuluY4QLMnAeImwrPCsXAV
 8riivyOKHtt9UqZzvUJYpKpv/MxKYTGSogqHwZ6YfLbIyjADkePWLWxCFUK4a60gE4LgThRBFxa
 ExHlIIOC/yYVgasaRn9cule2/FQJh0vRPvZmRsBcMle4QNX4b514wXm0+VQdkI6V5xRY29vJLOD
 fH4ZPykgLb3J4jllyIQ==
X-Proofpoint-GUID: yYkGq2ds3lO4ce-SMH3D_WaufcwBpYvQ
X-Proofpoint-ORIG-GUID: yYkGq2ds3lO4ce-SMH3D_WaufcwBpYvQ
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a159c08 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_061136_399341_A652A14E 
X-CRM114-Status: GOOD (  14.20  )
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

The header defines a struct embedding struct crypto_queue whose size
needs to be known and which is defined in crypto/algapi.h. Move the
inclusion from core.c to core.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 1 -
 drivers/crypto/qce/core.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index f671946cf7351cd5f0c319909bafd87e3af701c7..ad37c2b8ae53a373bb248aff06c3b7946e8439a8 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -13,7 +13,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
-#include <crypto/algapi.h>
 #include <crypto/internal/hash.h>
 
 #include "core.h"
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a81daf9ad5304a3ae4e5e597a70b8..f092ce2d3b04a936a37805c20ac5ba78d8fdd2df 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
+#include <crypto/algapi.h>
 
 #include "dma.h"
 

-- 
2.47.3


