Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4DAEB1075
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 15:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/urxcQjHbvUQXWmg2wCVncg8OrfyW3z29xPxxSUMIY=; b=Qwy9TrOgnp7/DCiwylVr71xdUZ
	r5T9N40lrxwBvdcJH+0QeitjaT5AyOBqeTKv7cLmlqqKqUF9r7RX2OVfe5g+N02M5RIbYAKSwab5m
	tYRLcFPJOOojo90BPpl3l6SpCAILIZ6dN+YAZr5x+ZtSLkxQ+P3qPJBTdWeqIZDrZ7666i3gRKuj3
	iKkUGnS7FmiJbv8i/djk6UAMrER0ylVQ/5jOGnej7yjPAy0w6KnvXFwgI3g8aDXt4124AdaafSv5+
	v6CrNPQ8TWI9NcQIVE8oz5QtYF+XEokhQ3zA1WTkO+ohO4M5eZsXoqyNaChQqr5uStt9eC+2MNP4G
	jhcMH+VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGl-00000009qGA-1F0r;
	Tue, 10 Mar 2026 15:45:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGg-00000009qA4-2e8p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 15:45:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaRYH3417078
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2/urxcQjHbvUQXWmg2wCVncg8OrfyW3z29xPxxSUMIY=; b=jmfLKsfx5sQaKyfd
	wBVCBRLC1nJIJdNrNmT/QhVWxi7tar4Y7s+fLPJ9+jYPSRDKOL4zUehZ96q11o/3
	jp0EIZ8qp6YfzyvKkYmkDN7xBGicErFJsXQveCVxj94Xf2D6DFa9srBjmpTTKleX
	6uEWCaObpGOf+HOctRTmulnvre+KH0yWl6gmo/SWugO/pIFbsLXoh8nGeLWgIVZN
	x7Q76pF1pT6K8k+cCI7/q+u7oeUU2xOG7x7bmh0ws3cgnaUtAB8MZe3kM1mgyNkT
	4bU3C9JtIgcf/SRrj8OtwXjU7umNMb+YHkPV5amgxBUzojIrjdB3mBV1kE+Qj1kn
	Xb/ujg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja290ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:45:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd77502295so1816897985a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157509; x=1773762309; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/urxcQjHbvUQXWmg2wCVncg8OrfyW3z29xPxxSUMIY=;
        b=DdrK3Gckq31vNJJWxAu5U2BJl0WsfpW4rwoUn8YOeUMX9dAMg6XRqDRRiH+cOSyd9u
         fTQVPaciuoBnoGMOoGx6TJREHNKnNDQiQNYG3sQE2tC5e1ZB5qMRpvboVkJ0fPeM32n0
         Wj5veNODoj4ovc7i/lOUGBdNdK3DAPVSWrtIAAp2AFkRCDjj2vpuovMxMAWPjxjnsb19
         06vKmjtDvEyVQa0FJY+eMt2HHmkWxw/3/wGcVSARgSzkMwnckfD0tI0Wf3lXb7UVekfi
         78K3bXEHjQQKHpMcZDfSidPX7o28YmDj0U4T/O399oXwUO8oAcmBM/sj65IwX8PL+/vu
         MxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157509; x=1773762309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2/urxcQjHbvUQXWmg2wCVncg8OrfyW3z29xPxxSUMIY=;
        b=jj9nU23cUvRvnVX/zdAvKGZsxEWKi5E3edZEf8dgHCBT1dgGA9xtgb73dX1YDa4WHs
         l16iF+sPOaetQI6vZbJuRB5dpLOffmUiFlWJsDqsPDyc9pvCNshZ0gPkDbDhKwsqG/Z6
         l+Ro96s1xdJwKZY0gGKp7rQwhHieNKW31rXbypLEC26YD43J8A0CczHvjXIwCjZuEVKZ
         B+Ma1Azmf+za/DiU8+Ei45epJB+DEOFBamcbniOYppFfLDaVv7oSmCBmPFmptM+yz6Hx
         zFuWIPPV+fddHUaz/jANnNUYsoPM6DamT9vL+S7qudz5pXHo1TDshFteazJM67yoeqo6
         hgXw==
X-Forwarded-Encrypted: i=1; AJvYcCX8PgHVNQkUR8NJE3gtNmase2ajfQ/NwFgGJs2X6W6ALjLlL0QNMuGbtlWwj0wN7cV1DHEar6Q/ssmTqD/rZKXd@lists.infradead.org
X-Gm-Message-State: AOJu0YwrGfXr3yhnhQpZ1los33F6cjPKVJY0YRTPpdHlqZKKoOUqjypp
	CArG0s44u+ILMwEtUm/PHG5gEMVNzJpaLjeQYlqQW3doTlIcZf22+gOEHR6u4FyPeOPR9ht8QQJ
	nFbMU4gk6scfuYm3Xltw7VevNUW2muH1rPQmV7UzsFqCGPfLkd+lmahodOwt1LsZViROZ+18Ku7
	ws0w==
X-Gm-Gg: ATEYQzzqOvbNwu294DtR8oZhRd0j4MwX4FanBipa9ByNx2TIKPz7aM5yaPFaxDpT81u
	a5UKijxacdTMFIaRchQL3sGQMhrFiBe4F8go0hNed3jMHgyDMSxHEvtu2VsBKxqpY1NcpgoNXks
	FLE6ZJHWRDAOas8/h4M6jW9dLWeUrk0LchiUuBi62iKNAl9dYEZgoul06Ap6AwtH9jUmh+CQfOb
	f00slkXxaoXupsO/dFZg3Ma4Cjmqi6lQ5eY8KZMA2kz9fATtGSeawy3F80+2MukUkbDyPibN7wB
	0Nyc3Hjh1INfDExvNJkv/fjWElej2oA+FYIHfQd0OZ8oSA2giNh1VUEdi+ZAtVUSCUvlgkisUnQ
	BYgjcJuJo8L4XuYWozuDKBZRYomKQoOvmZOdJ2kYZejohV2k0WXQO
X-Received: by 2002:a05:620a:1a1d:b0:8cd:8e07:4693 with SMTP id af79cd13be357-8cd8e074c51mr735598185a.17.1773157507520;
        Tue, 10 Mar 2026 08:45:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1d:b0:8cd:8e07:4693 with SMTP id af79cd13be357-8cd8e074c51mr735589185a.17.1773157506912;
        Tue, 10 Mar 2026 08:45:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:45:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:44:25 +0100
Subject: [PATCH v12 11/12] crypto: qce - Add BAM DMA support for crypto
 register I/O
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-qce-cmd-descr-v12-11-398f37f26ef0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10084;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xVyXRxFp3hoaIPdmV5W3HruIHEbBK3c+oEfKaj3P3iI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxp55b1rTnydR9NrVKbsWs64O9QIfEqQ6YYg
 K2ZSxeZOYOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8aQAKCRAFnS7L/zaE
 w/LqD/42AUGaP3V2zYf7ZZo68Z4+1yAkTqhErdCYCTVQ+6swYY6+2KSLHQtnqXYm/hrcIoQI4m0
 JDYKCTRfx3XDo62v5D9RQg9APwQRCsulA/XwI9MHejOzgjfs9+mN5aJIs+RqS1pOS4duNmPI4cW
 09aljLIQzF0aLwLdYKd02CP/A26QkF4KbCbhSIEdhPAjhLJRhbJ9NIz+eKjcKcFTdxuo0OE+M5F
 M2zZ6dnRKmTmwIlGL+TezFz4mllzVM7j7V1EhZCezzeuro1hgt/0UnR9N+DLNu5N/3+uKMiOCo2
 +cXLcP0fgj1RsSQTNHoGIbB8IHYvh5NLU/eP89F8HgqX9pIf8i1jbAsMXzyhiXjO49UY79U5ETq
 qYV82/q0rAtFZLc8HGX/LZGxdXjb7bDH0Li0ojp+hrHRLlyCrs66uSC9k/QGdLVeKqYjNnm6Iox
 Qyhemrg0a4DIm221ztLd1MH+BdmkCv2yukFC26i0oR7xlg0XgjM7TqnJMpZoKEN8shjfAfwDPVv
 jxiIUdaukIC9QmZwM3xR0CdIbY2xz1/ktJbcogb1EiiUgWyg5xAryr+3K54HFPGvWqoLrM7UaSn
 dHld2oIsLE58Ln5WKgBgwXJIFl8sSw7s0FeG0SAq9D/cNYb0C3ZNVGv607QaruNfxRsxfjHv+8c
 RPMtkcYggfarjMw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b03c85 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=koLDk85rXkRIAoTU0vQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: CSsWH8GAWxgtDD5zUNBDOZVb7fT2UUDB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfX+jfKKv6Xuwhz
 34diwerDgh4XM1+7l0iVekAhD63DdWLyhraXeFa2fyP8pJglXXGgq/3ZVPJZzsGkS3e6aurjEa0
 bntz8rJKwoXJzHePD9VJu9Cac3CvEo035V0Y9+XrUTEe8SuXDkfFp36pq2crfEQj5dHjYPPRcjo
 HoUlg01NGCvkE55vTWtx6mlm1kmL7WBVp7xYv7aGlsxrnJ6dihXbWnUEym4s8I/zEuSkkss2txE
 jT1k/cCUQgp0wxmKnbFpKNs5o9SwrHOeCgW5YigPzqQHDUlweIRgR9IPW77pwSKvJFufrjM0x/8
 r7OKjlk0R7B51KOBgfZIGfzK/Dh410OjeTKnPXpuH8fFtdcmXhiX50dp5l5PFzaQJcht0r2vx/I
 dX1Fnwe7p9G8dAtlj6MUM4oW/vSetwv08O5oNKfHAIIk3Xay5SIfgQZBLy2kuZed5mpK4J+rBf4
 O23B8DY6BxOQSUSVl7Q==
X-Proofpoint-GUID: CSsWH8GAWxgtDD5zUNBDOZVb7fT2UUDB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_084510_818067_BC37815B 
X-CRM114-Status: GOOD (  22.56  )
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

Implement the infrastructure for performing register I/O over BAM DMA,
not CPU.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c     |   2 -
 drivers/crypto/qce/common.c   |  20 ++++----
 drivers/crypto/qce/core.h     |   4 ++
 drivers/crypto/qce/dma.c      | 109 ++++++++++++++++++++++++++++++++++++++++++
 drivers/crypto/qce/dma.h      |   5 ++
 drivers/crypto/qce/sha.c      |   2 -
 drivers/crypto/qce/skcipher.c |   2 -
 7 files changed, 127 insertions(+), 17 deletions(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index abb438d2f8888d313d134161fda97dcc9d82d6d9..a4e8158803eb59cd0d40076674d0059bb94759ce 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -473,8 +473,6 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 	if (ret)
 		goto error_unmap_src;
 
-	qce_dma_issue_pending(&qce->dma);
-
 	ret = qce_start(async_req, tmpl->crypto_alg_type);
 	if (ret)
 		goto error_terminate;
diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
index 04253a8d33409a2a51db527435d09ae85a7880af..b2b0e751a06517ac06e7a468599bd18666210e0c 100644
--- a/drivers/crypto/qce/common.c
+++ b/drivers/crypto/qce/common.c
@@ -25,7 +25,7 @@ static inline u32 qce_read(struct qce_device *qce, u32 offset)
 
 static inline void qce_write(struct qce_device *qce, u32 offset, u32 val)
 {
-	writel(val, qce->base + offset);
+	qce_write_dma(qce, offset, val);
 }
 
 static inline void qce_write_array(struct qce_device *qce, u32 offset,
@@ -82,6 +82,8 @@ static void qce_setup_config(struct qce_device *qce)
 {
 	u32 config;
 
+	qce_clear_bam_transaction(qce);
+
 	/* get big endianness */
 	config = qce_config_reg(qce, 0);
 
@@ -90,12 +92,14 @@ static void qce_setup_config(struct qce_device *qce)
 	qce_write(qce, REG_CONFIG, config);
 }
 
-static inline void qce_crypto_go(struct qce_device *qce, bool result_dump)
+static inline int qce_crypto_go(struct qce_device *qce, bool result_dump)
 {
 	if (result_dump)
 		qce_write(qce, REG_GOPROC, BIT(GO_SHIFT) | BIT(RESULTS_DUMP_SHIFT));
 	else
 		qce_write(qce, REG_GOPROC, BIT(GO_SHIFT));
+
+	return qce_submit_cmd_desc(qce);
 }
 
 #if defined(CONFIG_CRYPTO_DEV_QCE_SHA) || defined(CONFIG_CRYPTO_DEV_QCE_AEAD)
@@ -223,9 +227,7 @@ static int qce_setup_regs_ahash(struct crypto_async_request *async_req)
 	config = qce_config_reg(qce, 1);
 	qce_write(qce, REG_CONFIG, config);
 
-	qce_crypto_go(qce, true);
-
-	return 0;
+	return qce_crypto_go(qce, true);
 }
 #endif
 
@@ -386,9 +388,7 @@ static int qce_setup_regs_skcipher(struct crypto_async_request *async_req)
 	config = qce_config_reg(qce, 1);
 	qce_write(qce, REG_CONFIG, config);
 
-	qce_crypto_go(qce, true);
-
-	return 0;
+	return qce_crypto_go(qce, true);
 }
 #endif
 
@@ -535,9 +535,7 @@ static int qce_setup_regs_aead(struct crypto_async_request *async_req)
 	qce_write(qce, REG_CONFIG, config);
 
 	/* Start the process */
-	qce_crypto_go(qce, !IS_CCM(flags));
-
-	return 0;
+	return qce_crypto_go(qce, !IS_CCM(flags));
 }
 #endif
 
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index a80e12eac6c87e5321cce16c56a4bf5003474ef0..d238097f834e4605f3825f23d0316d4196439116 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -30,6 +30,8 @@
  * @base_dma: base DMA address
  * @base_phys: base physical address
  * @dma_size: size of memory mapped for DMA
+ * @read_buf: Buffer for DMA to write back to
+ * @read_buf_dma: Mapped address of the read buffer
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -49,6 +51,8 @@ struct qce_device {
 	dma_addr_t base_dma;
 	phys_addr_t base_phys;
 	size_t dma_size;
+	__le32 *read_buf;
+	dma_addr_t read_buf_dma;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index a46264735bb895b6199969e83391383ccbbacc5f..ba7a52fd4c6349d59c075c346f75741defeb6034 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -4,6 +4,8 @@
  */
 
 #include <linux/device.h>
+#include <linux/dma/qcom_bam_dma.h>
+#include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
@@ -11,6 +13,98 @@
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+#define QCE_BAM_CMD_SGL_SIZE		128
+#define QCE_BAM_CMD_ELEMENT_SIZE	128
+#define QCE_MAX_REG_READ		8
+
+struct qce_desc_info {
+	struct dma_async_tx_descriptor *dma_desc;
+	enum dma_data_direction dir;
+};
+
+struct qce_bam_transaction {
+	struct bam_cmd_element bam_ce[QCE_BAM_CMD_ELEMENT_SIZE];
+	struct scatterlist wr_sgl[QCE_BAM_CMD_SGL_SIZE];
+	struct qce_desc_info *desc;
+	u32 bam_ce_idx;
+	u32 pre_bam_ce_idx;
+	u32 wr_sgl_cnt;
+};
+
+void qce_clear_bam_transaction(struct qce_device *qce)
+{
+	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
+
+	bam_txn->bam_ce_idx = 0;
+	bam_txn->wr_sgl_cnt = 0;
+	bam_txn->bam_ce_idx = 0;
+	bam_txn->pre_bam_ce_idx = 0;
+}
+
+int qce_submit_cmd_desc(struct qce_device *qce)
+{
+	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
+	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
+	struct dma_async_tx_descriptor *dma_desc;
+	struct dma_chan *chan = qce->dma.rxchan;
+	unsigned long attrs = DMA_PREP_CMD;
+	dma_cookie_t cookie;
+	unsigned int mapped;
+	int ret;
+
+	mapped = dma_map_sg_attrs(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
+				  DMA_TO_DEVICE, attrs);
+	if (!mapped)
+		return -ENOMEM;
+
+	dma_desc = dmaengine_prep_slave_sg(chan, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
+					   DMA_MEM_TO_DEV, attrs);
+	if (!dma_desc) {
+		dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+		return -ENOMEM;
+	}
+
+	qce_desc->dma_desc = dma_desc;
+	cookie = dmaengine_submit(qce_desc->dma_desc);
+
+	ret = dma_submit_error(cookie);
+	if (ret)
+		return ret;
+
+	qce_dma_issue_pending(&qce->dma);
+
+	return 0;
+}
+
+static void qce_prep_dma_cmd_desc(struct qce_device *qce, struct qce_dma_data *dma,
+				  unsigned int addr, void *buf)
+{
+	struct qce_bam_transaction *bam_txn = dma->bam_txn;
+	struct bam_cmd_element *bam_ce_buf;
+	int bam_ce_size, cnt, idx;
+
+	idx = bam_txn->bam_ce_idx;
+	bam_ce_buf = &bam_txn->bam_ce[idx];
+	bam_prep_ce_le32(bam_ce_buf, addr, BAM_WRITE_COMMAND, *((__le32 *)buf));
+
+	bam_ce_buf = &bam_txn->bam_ce[bam_txn->pre_bam_ce_idx];
+	bam_txn->bam_ce_idx++;
+	bam_ce_size = (bam_txn->bam_ce_idx - bam_txn->pre_bam_ce_idx) * sizeof(*bam_ce_buf);
+
+	cnt = bam_txn->wr_sgl_cnt;
+
+	sg_set_buf(&bam_txn->wr_sgl[cnt], bam_ce_buf, bam_ce_size);
+
+	++bam_txn->wr_sgl_cnt;
+	bam_txn->pre_bam_ce_idx = bam_txn->bam_ce_idx;
+}
+
+void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val)
+{
+	unsigned int reg_addr = ((unsigned int)(qce->base_phys) + offset);
+
+	qce_prep_dma_cmd_desc(qce, &qce->dma, reg_addr, &val);
+}
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
@@ -31,6 +125,21 @@ int devm_qce_dma_request(struct qce_device *qce)
 	if (!dma->result_buf)
 		return -ENOMEM;
 
+	dma->bam_txn = devm_kzalloc(dev, sizeof(*dma->bam_txn), GFP_KERNEL);
+	if (!dma->bam_txn)
+		return -ENOMEM;
+
+	dma->bam_txn->desc = devm_kzalloc(dev, sizeof(*dma->bam_txn->desc), GFP_KERNEL);
+	if (!dma->bam_txn->desc)
+		return -ENOMEM;
+
+	sg_init_table(dma->bam_txn->wr_sgl, QCE_BAM_CMD_SGL_SIZE);
+
+	qce->read_buf = dmam_alloc_coherent(qce->dev, QCE_MAX_REG_READ * sizeof(*qce->read_buf),
+					    &qce->read_buf_dma, GFP_KERNEL);
+	if (!qce->read_buf)
+		return -ENOMEM;
+
 	return 0;
 }
 
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 483789d9fa98e79d1283de8297bf2fc2a773f3a7..f05dfa9e6b25bd60e32f45079a8bc7e6a4cf81f9 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,7 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_bam_transaction;
 struct qce_device;
 
 /* maximum data transfer block size between BAM and CE */
@@ -32,6 +33,7 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
+	struct qce_bam_transaction *bam_txn;
 };
 
 int devm_qce_dma_request(struct qce_device *qce);
@@ -43,5 +45,8 @@ int qce_dma_terminate_all(struct qce_dma_data *dma);
 struct scatterlist *
 qce_sgtable_add(struct sg_table *sgt, struct scatterlist *sg_add,
 		unsigned int max_len);
+void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val);
+int qce_submit_cmd_desc(struct qce_device *qce);
+void qce_clear_bam_transaction(struct qce_device *qce);
 
 #endif /* _DMA_H_ */
diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index d7b6d042fb44f4856a6b4f9c901376dd7531454d..9552a74bf191def412fc32f3859356e569e5d400 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -113,8 +113,6 @@ static int qce_ahash_async_req_handle(struct crypto_async_request *async_req)
 	if (ret)
 		goto error_unmap_dst;
 
-	qce_dma_issue_pending(&qce->dma);
-
 	ret = qce_start(async_req, tmpl->crypto_alg_type);
 	if (ret)
 		goto error_terminate;
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 872b65318233ed21e3559853f6bbdad030a1b81f..e80452c19b03496faaee38d4ac792289f560d082 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -147,8 +147,6 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
 	if (ret)
 		goto error_unmap_src;
 
-	qce_dma_issue_pending(&qce->dma);
-
 	ret = qce_start(async_req, tmpl->crypto_alg_type);
 	if (ret)
 		goto error_terminate;

-- 
2.47.3


