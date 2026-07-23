Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A4FC531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=; b=gmhtZLVCh3jsdSebnvFVve3KqB
	T1zvSSiT10/QMAztabp/WHuztZQGub0Bw+0PSj/9Nglr8+To7SkIu7JcqRKoZ72jFhgkqQUfnrGov
	Bf7wAeZac6SToAOVYr9RVrkF04YeK54ojpvpCeVp5k/Qf4AKZbxh7QFnOnsmQn+qsM3a3oEjK+Bek
	zzZqljHyhjY9aWTojry/XpWDHZbO5DK2VOPH4sMMVqamjsaE5GENbWeBB8IjQPW9OKA5vALfo1x1L
	KXGAtcpqM/UcvVRtl0LdWDAy8BGPzvkgGihAc57k4YD74DeDAcstH1IZFmOVwI2ByssAZ+1McAM9c
	aqPw1w0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmww1-0000000EmBb-1drQ;
	Thu, 23 Jul 2026 17:10:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwvo-0000000Em38-3jag
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:10:02 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvZSF3954530
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=; b=LGSaZwYTvZGwccVl
	pA0EWYh/eZK/4U2qPMKc6ObiY15z7/WdN9Qa0Zt2fIihfTQGV+Sk+vXGXodVtOaW
	dH/4TX+mbplfE6yEwzc73/mGn9ljwcVfH9ri7IoFRETbBhEMQ5r/rwGv9GuftWMx
	PV/QXPbTfVgucEfJoXbLRWD2ptWm4MzL6MjJJ53msaQMhcW7F56RTFx9Z61hvGCY
	Pu5t3iZBUb+fAf2JC61QWLBtVs85ahXiA9BdpbId0zadKuIHJ67l6XZyouEe1V00
	fmKGyJ6MtE4kuOPqBe+rh47j9/uvFw2t+Uhur68zwKFa+FPl1d9XeDsM4RlWL8zy
	U2OsoA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke0ktntc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:09:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1c7f135bso15158201cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 10:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826599; x=1785431399; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=j8oIGppBGVOH6h6rzlWjE0E0TWzR/HCMf0suuE+O23jqNVo8SHr/oR8YEpU9G1sh5f
         oH4KltfFcIRJvQiIbwjYZGFTAr8fyv895Af7wlgGNC3puPSjqOQfYmxzyDlCLtd0pJ+s
         Qw20lP/o2M9PUC0o4eabQ3ds9ebqAkVqSbjP49JhlTjB8B5NeUjHkQ97z2brAT9YiPpm
         +PqsmuPnOs9/woqRCxobmmVB69JsIaS58RAvlLD94K12vmOHEDpdp9ygawZjUuqiukrO
         nNwnITzSsHb2pskq5H/bnQApwRDukBsLh9qhnk+Le38wvdi6dC1GTkucH7KOFg8XjcpA
         rmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826599; x=1785431399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=JfiDQqTFzqCRnweWiGnmGvvcR1SsBlnWFxQU91N2csZEETGd0yLOU1YQkVwPCK2i2o
         leOWRC6jhaE+G2V/qz1JICO/vzzMFfW7te7WWb69kK4+3908z2PjJvqozoo88mPtoeGp
         JuXC1JfNfsV7DEzWKXv6DYRfl5zJG0NXKfcsd8Eo7HezdRtloMGNhDDt290xloALA9DE
         P8zhRNn3LJJ+WtgX0lRIYO6RPY8faAQhjOt7u5kiHFM72YgKouSHzWtrsqEbUikldwXY
         gEoxxDfD1AVucHyo56wI/3jmgQLxAO+IvgHeTZ1PgqPv+3vwTXHyoaeFd6ANsk5nqMDz
         p9eQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0oz462PibqGg7hEnccvgrbv1PnaKjUKlsDSDPebAhUVX19CMQCSAcYrWco6foc+vte9ziRzT9rFpmzZWyTVWv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8VRNWY6aXcaTzTv/gqRUq8VT6Yb5P0CiTo7wQyjG6BqeQHH4Z
	L86/r/AmxpTrQy/PM2OggrEPCWryXLjNYfmfR03bKcmfhl5xkbl4w7cjyoi/Mt4lCs5p2ZqzhbV
	LK4OtfzZp1FjXdkTDXup9XkeGzzDtOiwW1lk9zvNUmNsi7a6FGs4jFpRyHAXp6zB6WlYL9scoy5
	S17w==
X-Gm-Gg: AR+sD11KUj1iWuIGuDIuy1pDX6ygtNOO/Eqqsgn+gG2CxRuqb3t9e+J5jo52sUuIQqM
	GGskuOWEzo/nnQ4Pk+RkMci9g3YL8yiDX9b+ZD61MUJo5qOwnD3ZIODbO2JSig6k2C8CqeZ6iAB
	hDhOaqWrR6jgD4no/N93SS0lIOvnP3fl4j15YMYHk2xd0FSb8rxNjQcTpStnfbf+Uy11n2fCvTR
	yuZNmuKHMSyz42Jw782pkN1s0kdUw6cF/WdJskNHIrAj6FZq/klsYpKiwKRHocYejyEG/o4Q2JY
	tOlQiNpn9PvxTMowSBZCAhHj17TDqUoXOeOQoOHGs1+IlPhPR9ArzQqzHPynNz1CqoSFfc2t7hg
	1rNZLO0szcOwTfsPGH2FGGoXBkfu4
X-Received: by 2002:a05:622a:4887:b0:527:6d0b:b00c with SMTP id d75a77b69052e-5283dfd07a9mr37944241cf.68.1784826599223;
        Thu, 23 Jul 2026 10:09:59 -0700 (PDT)
X-Received: by 2002:a05:622a:4887:b0:527:6d0b:b00c with SMTP id d75a77b69052e-5283dfd07a9mr37943611cf.68.1784826598688;
        Thu, 23 Jul 2026 10:09:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:15 +0200
Subject: [PATCH v24 09/14] crypto: qce - Remove unused ignore_buf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-9-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
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
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=j6XY4tGbVrzzivRLNBnBuYRESnCKLFI7yXVP5haQkuk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrHRC31uqWfuPCshkpr4F9yhF00Q8kTZX6rw
 dse+wx0PiSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKxwAKCRAFnS7L/zaE
 w/U3D/4l/JZB1CI1zLQeeEPcdQ6oFcKCNVWSMVFUFdkhJ9BkrcxnGZuhnMpJwO4vO+Oj6Yhmb/h
 ZoKCPuJ1X0o3xdGe6tpfEIzROywogHcp2+tQcqYhyCwTg7WZAcGzxoR0LftUJ9KvGYq9QdqctNc
 lSFZbf65kdE2Tc02wAU/H+pC7yUQU76utOnkqbgTIHQtBA26Tpy8SDY2jAHTcqM6RUDQS/QZOE2
 uYL6JpIio9+5No8/xj/sIFfBWrZTD9y1gSq027YSHsL78J4qPTu9UpiVhcgX5p4R0cIB7cukMoO
 6HTz2lNB8WtWCCmp8ZGwCW/17HnhWGzniHiXH6GyrVOQSsLNFV+Ska6P7uo4vilXjNcYfM70IyW
 0IcDc45D5hsjGPbcRaRykn6DYvvomb7lzqPYxxwwj/5LqQIkcVI9c8Tm/idGAf029Cwq2zKMd6X
 yGyPL++zMP7shdIb6qer47c817fmdblEWodhtGQl1taZMKPTYA0N9McR0wbJHiNif8QSwy/eauR
 GhIMYkKSCIAzCinSVVcK+VR/pQ/2hHQQADI5icvIrRVwJX/zBRs5UUwqphuPB26sxEpab+svSq6
 1tRdkQ+B0BpxsfWz1r7YLY5YrwBYQXmF47ceIy29rd+FOOQwPz8X+u+hiypJ2UTXH73pm19LuYl
 DDKG/6N7DZoUbYw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: gz4yoGSGFPMOVv8uzXCrJCowosubBh5L
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX9frjXYJiGVuG
 Qn3sbOzHs7ROSFVOYyEGJU1VBiZejebehFGOsfYPxxRFAU0BLXuEg4EUms83OVWR2ewiXX+F4s9
 NNWn6L9OM75DdBMHfyhbqVL2p1L6Wr0=
X-Authority-Analysis: v=2.4 cv=S7DpBosP c=1 sm=1 tr=0 ts=6a624ae7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: gz4yoGSGFPMOVv8uzXCrJCowosubBh5L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX/xSqLzATdMkn
 IL5z2Exxa3g9G9hFa+EDF6TSQ0KnZ/X3XgfpCedlh8qXBvKrxHVrtJOz9SNxlNUgTA6Zk1S6Fk+
 sUbKguKsOHU4FF1/bf7TV5qu2+bsVxQcxKLzkylFH0tLo60zSp9yE8vuRyz5UH22N/Nmi36PFDG
 L7BaJ8d37NrYlnskdCbavTgpdmYSSSvz+VPeSgfdgz71d3FRhWwjmRqklqNYG8R024MppIaFreS
 SFVWD6ZUuS05uTnVnYvPvgQiWfy6q3fN6/q3a3q5gwoU4V3JJNcbIfuekotzzIDxb+idk6k/6TC
 qOfAX2e9uPkMtY8vDOjAf5Lm5E6Egd6zGYADb+UT9v4PWgTLsNKorhJu+uM7LJy3yVJp5hleaRt
 1weuPOdyOrrttnIFFGBCG9z2Obl2qP3qYuaYR67Pxx/SVxn7yEuiBAymlsziTSS2wsVJk7L6ETq
 4cfNwfjrDQIkjN1F0Rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_101001_078281_F474FED2 
X-CRM114-Status: GOOD (  17.63  )
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


