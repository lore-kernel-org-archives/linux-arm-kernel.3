Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F705EB104A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 11:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZ81K+s/mqduu4wm6bGMuDFDp5cpVX1TLMHdFJk1Aus=; b=ekd9gk5DQH3k0Ns/V8ChNDvlFD
	vt7jhIDWUY/Lyu3R6gOq2E3HbaWHbZn7kYveRNvw8U6njxmHlH2gCpvkHR4PiH4G29kZigjFj164S
	EQxgoNX3UsA5Oi3p225ZIwMRKEiPUd/1u8Yyhpu0QgOvTTbaBA9Dt7zWtrxNaF2EDGG88JQWwJdH5
	pqhxbzYJQE1hnW5dtnFtTEJ5Rdc5BjknlH3bqgTho2tzVFKY20nc/+3Z5EIQahuCbcMGZaXeths5C
	3zGXbJ8ESaCc2+2VAKutjXIyzKN7yT2NTJuOZ54b/daexrK6let3mZTQhqwDklSGYevhmlFuVTqgd
	aAfngkjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvAy-00000009HLh-2ngQ;
	Tue, 10 Mar 2026 11:23:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvAs-00000009HFD-2DrZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 11:22:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AB34Qi568773
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 11:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZ81K+s/mqduu4wm6bGMuDFDp5cpVX1TLMHdFJk1Aus=; b=CVFTHzAh2YbPm1ss
	y28i08Ray5OG1nsjoX8Gfm9cXS8ChSyEQvkd8+XUFNY2ZbCp1AnM473aFXYOzjwF
	IrfdxD+EIpLamGGgozAJovWLjmOk5xsyBY4/vZJZ55RRgrdlbvPlO2K00SHK3Ykp
	oiBHLkXWL2UZq737Jlc3Xn0mJXTzFooA9OLctJtxASqod3F13/jJ05HElO1QLC5k
	yLIBdv8NSwztQDl+5aZTP9gldewCA9xBIcBU1LYw3roiVj+kcxEvdS0anv/1TXb+
	i9LHNWolLBaY0nLD3hKq71W+z5MMRkkbv+8mLa6ya0OUeq5TsJghA7iM9fH8Z4Qq
	KWorlw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8h7ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 11:22:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd722c1a69so1916357385a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 04:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141773; x=1773746573; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZ81K+s/mqduu4wm6bGMuDFDp5cpVX1TLMHdFJk1Aus=;
        b=gPghqPccvIiu5fIa8Hh5Jv2wMFXqMdEj0FSlig9g9ki4utmU5XYXAJVTaPzkZN1f/F
         Kh4SbjZONhfNnTtsU3POrubAY6XtrS98928VQj2gVNPwBL/VsmuV11CON/ITI9egok4s
         47cmlK/OoXy9Iw8idU5SaMJW+l7tKvhIFH232GOrZRs8OLFdgKVB7bUWSIdogxxCgBRH
         7DGRb6xY3kiXv6rVr/C9c2iYBeRKEkoVpDLnraXNqZhRSiXIPdbHSqXt1aEAY7rvmePL
         OQoJqhI4r7it8LCRNXkzt1PuFOv3dBhPXPJD+lWbcJkHV2H+vAPb8J2ZTI1ufv8FdK++
         forg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141773; x=1773746573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bZ81K+s/mqduu4wm6bGMuDFDp5cpVX1TLMHdFJk1Aus=;
        b=Z24jC6P9HmQQ1n67gAG74h6FLkBS06Bv8hZHeNmCqmkyITA3yVZN88q2GIiYoXb4Q8
         ETvuJbySa9j9uP2oW4ZLsBJpTX/dedbjRHpr649Qp1ApA8yXx/RVJ2z6xjl/LS6VQhPe
         uEzsNwxTLAPwvA6OtbvAQALXEW3S5g6qxNiMCUueZRJPcKUEamoqf1pN4a8QBBr2G9G1
         5r+joGrIjnWDdfCg9OfVwJlYCqefRxSUi882n7T4GtnAxgVzOviI5GdkNfAqqvsIUMoA
         qpseZ6wOQiyo6fRXxtuixqAGLgCvEI0e+bMlqiVZZ/v1NNnW0LpMw0ybx7nDZyhLBo54
         7JNg==
X-Forwarded-Encrypted: i=1; AJvYcCXGPpqtm7P451wrl5qggTax/LQk7emhmj5DRqprexDIa1kkFHG/0jHXH3q2nXbzCl4NM/A8VnhawzwBQR0lNtwG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0b7Ll2uZ/AGr4b4Mld3enH3OvcPSxDBiWIB4iMAjyPZlfeer4
	GwEcW0Q5xrza9oLVA+xJiS8QUgwyW68dQuu6GwWXB7B3/V5kcZTR57zfUpvT/W9//eYnp3FTTU2
	ngDr7o8E1Y3tLLkpYCueWgiz5Gl4SQQkYuhwSQHtwgEjNEceaajpYJxZvbjyW/o0AccyWkVl2SM
	XEYQ==
X-Gm-Gg: ATEYQzzjJv3g6nWKpL6pqgHcXZ09hijMgwPJ3AnF0SjqUtr4hrpNIsSIYcf2RjV4VmT
	VIlndnpJBFl4ugS6xxO4/oaiSDPZuZ3ZSFnLn6Okeunj50GS9R+WU6MJQ8OI2ewcIPh1rbXG0VC
	JL9VBwxuGLT0VJrwiMeUVfzTv3d0WEucFbXSQjsJNJMUflfAO07Hv1BUIL/bvW0qSGhX3DAPf5u
	I7/I+S4dx+faZQgSFw5FTVAWoZ0vXGPnAAK+IR0GFgWUkg7BL4SfudfMSV7poP6DGAgaEd9VPU3
	tTvpdlajno2aFHP4f0SfGsgNp1gyjXUQUJZW7LYQAifQKhsLFs92Xddri8+7+QU9J66HDjMLLv6
	p6hgsmdvLRnvPOc0I1nYrW8nRl+NJb57Hq6DmbCT2XC8j
X-Received: by 2002:a05:620a:468d:b0:8cd:92e7:7192 with SMTP id af79cd13be357-8cd92e7773dmr446825785a.71.1773141772873;
        Tue, 10 Mar 2026 04:22:52 -0700 (PDT)
X-Received: by 2002:a05:620a:468d:b0:8cd:92e7:7192 with SMTP id af79cd13be357-8cd92e7773dmr446823685a.71.1773141772443;
        Tue, 10 Mar 2026 04:22:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:22:37 +0100
Subject: [PATCH v2 3/5] rpmsg: Constify buffer passed to send API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-rpmsg-send-const-v2-3-0e94c5db9bf4@oss.qualcomm.com>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
In-Reply-To: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Mathieu Poirier <mathieuu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13547;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6B0vVMbf0cTPfHKQcu37PToX+TkTnGz5fLYnXk2cW+U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/8AWwrOLpR1jQOYLLeUnLd7iNkB9dvFL+FHN
 5G56dRpYRiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa//AAAKCRDBN2bmhouD
 14+BD/9147We9xfkXZdj5OtI225DcSkVivpk79k426PSLJHmpuGX7F7LIVgiHilx+t/yDFE0rP/
 fFbBYc6lD1Yxui7NQCJGVpP8u+ff2SSH9B+B/zuLP+nK7T+2IL7/ohhNOsPuOn76z6b95dNu3d1
 JG19Pl1CjYVQEOby8Gj/opncbteACIcES4Ezary9jg1NRXbhfI6Hx+bMSA0oUPJ2EvQ4Yd01r5F
 8mS1acaKPkrSxGkWKn7749XQKG+6fXz4OBU9XN4s2/0IRsB8HqcjyLQlnlYiqBNvpS7HJXaSLJY
 286H7YMPPAux4HFWibiCY7hHs00vmTmRBdf+2Jd0NnC+hKrnFsNrkQJh3r2fnAOnVgRU2UpBEBZ
 qoSa39jZbf9jTN4J4nROm1gvuS20hqLLKUHUUUgCdJX2UgFKLoKF+jngSSpaskSpwYWNP6+8FUq
 gRsa1ZINFDAcJP2PK1UTXAOXvqzF2NAUMhp+mUasXMiPFX9G6CAnNKTXgRSOlYtuycwYBmDafhI
 FvKj5XUDmcray9PCKEj4yWUCGs7m5Sy21UDNkUM2DHPoNtETCMoGXTIMv/y5H2wSsDJWfhUUUQi
 z6dpsJdAJIwkALccAjXvkTECp4D3WDfJh7JDWwRtxSqTXfTBPBT5f2myNqDkclXgMlCxlCAB91a
 q8Jz0ZdV1DK8HQQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfX0MXt91oJZbCi
 Z6SRSjKVytnt+hpqRkk9+Nr1RXPdq9nbelbOAtg0WbKelyeUKWSZbvgvcfIYBqLiugHuGLwj/mX
 jkzKaFuhn1k/ztHQS3RXGTnB+BfhFuBepuxl4jjYMPio0IDmpnW06kA13gS1DTJKNIkYDnu1qX4
 IUo/jHBRveSQQ5lsmLS2ZmRhFYiAg9NSd5wdaBJ+BGWm7EXX+qH18pHYlIDOgVdnPmFVG4gGHhB
 lXqs8+4UY0I0te37C2JalW1susRcrLw8gisD59pAShYp5jwpxZCba3XBticjqhXipmo1P3xVSFB
 U5Z49YvAfyTRA8nOIeUKGIXitLWc0jeSuiq06ANWrWKuHADl8LrOdG/oH0OWOmUJk/dV29iiTCX
 ef+L5BsKp089z/jL6KNl5sZvDGZZKBGzCJVX4JtQqILxYVfqlWK1txWNoHOpO8giXEr2UkfY1m3
 OIR+7XRQ5f5cnEkl8vw==
X-Proofpoint-ORIG-GUID: mT0_ACqMNOZRabGwcv1ixVwlgqcL_lVm
X-Proofpoint-GUID: mT0_ACqMNOZRabGwcv1ixVwlgqcL_lVm
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69afff0d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7kuhv_acGB6hOQYBqC0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_042254_723773_12855295 
X-CRM114-Status: GOOD (  19.02  )
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

The rpmsg_send(), rpmsg_sendto() and other variants of sending
interfaces should only send the passed data, without modifying its
contents, so mark pointer 'data' as pointer to const.  All users of this
interface already follow this approach, so only the function
declarations have to be updated.

Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/rpmsg/mtk_rpmsg.c         |  4 ++--
 drivers/rpmsg/qcom_glink_native.c | 13 ++++++++-----
 drivers/rpmsg/qcom_smd.c          | 10 ++++++----
 drivers/rpmsg/rpmsg_core.c        |  8 ++++----
 drivers/rpmsg/rpmsg_internal.h    |  8 ++++----
 drivers/rpmsg/virtio_rpmsg_bus.c  | 24 +++++++++++++-----------
 include/linux/rpmsg.h             | 17 +++++++++--------
 7 files changed, 46 insertions(+), 38 deletions(-)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 0e03c5336609..1b670ed54cfa 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -135,7 +135,7 @@ static void mtk_rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
 	kref_put(&ept->refcount, __mtk_ept_release);
 }
 
-static int mtk_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
+static int mtk_rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct mtk_rpmsg_rproc_subdev *mtk_subdev =
 		to_mtk_rpmsg_endpoint(ept)->mtk_subdev;
@@ -144,7 +144,7 @@ static int mtk_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
 					  len, 0);
 }
 
-static int mtk_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static int mtk_rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct mtk_rpmsg_rproc_subdev *mtk_subdev =
 		to_mtk_rpmsg_endpoint(ept)->mtk_subdev;
diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 9ef17c2e45b0..401a4ece0c97 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1474,7 +1474,7 @@ static int qcom_glink_request_intent(struct qcom_glink *glink,
 }
 
 static int __qcom_glink_send(struct glink_channel *channel,
-			     void *data, int len, bool wait)
+			     const void *data, int len, bool wait)
 {
 	struct qcom_glink *glink = channel->glink;
 	struct glink_core_rx_intent *intent = NULL;
@@ -1553,28 +1553,31 @@ static int __qcom_glink_send(struct glink_channel *channel,
 	return 0;
 }
 
-static int qcom_glink_send(struct rpmsg_endpoint *ept, void *data, int len)
+static int qcom_glink_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 
 	return __qcom_glink_send(channel, data, len, true);
 }
 
-static int qcom_glink_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static int qcom_glink_trysend(struct rpmsg_endpoint *ept, const void *data,
+			      int len)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 
 	return __qcom_glink_send(channel, data, len, false);
 }
 
-static int qcom_glink_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+static int qcom_glink_sendto(struct rpmsg_endpoint *ept, const void *data,
+			     int len, u32 dst)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 
 	return __qcom_glink_send(channel, data, len, true);
 }
 
-static int qcom_glink_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+static int qcom_glink_trysendto(struct rpmsg_endpoint *ept, const void *data,
+				int len, u32 dst)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index e1eb450f4fea..3ac863f400ec 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -960,28 +960,30 @@ static void qcom_smd_destroy_ept(struct rpmsg_endpoint *ept)
 	kref_put(&ept->refcount, __ept_release);
 }
 
-static int qcom_smd_send(struct rpmsg_endpoint *ept, void *data, int len)
+static int qcom_smd_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
 
 	return __qcom_smd_send(qsept->qsch, data, len, true);
 }
 
-static int qcom_smd_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static int qcom_smd_trysend(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
 
 	return __qcom_smd_send(qsept->qsch, data, len, false);
 }
 
-static int qcom_smd_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+static int qcom_smd_sendto(struct rpmsg_endpoint *ept, const void *data, int len,
+			   u32 dst)
 {
 	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
 
 	return __qcom_smd_send(qsept->qsch, data, len, true);
 }
 
-static int qcom_smd_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+static int qcom_smd_trysendto(struct rpmsg_endpoint *ept, const void *data,
+			      int len, u32 dst)
 {
 	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
 
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 96964745065b..2f9444d1f194 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -153,7 +153,7 @@ EXPORT_SYMBOL(rpmsg_destroy_ept);
  *
  * Return: 0 on success and an appropriate error value on failure.
  */
-int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
+int rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	if (WARN_ON(!ept))
 		return -EINVAL;
@@ -182,7 +182,7 @@ EXPORT_SYMBOL(rpmsg_send);
  *
  * Return: 0 on success and an appropriate error value on failure.
  */
-int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+int rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst)
 {
 	if (WARN_ON(!ept))
 		return -EINVAL;
@@ -210,7 +210,7 @@ EXPORT_SYMBOL(rpmsg_sendto);
  *
  * Return: 0 on success and an appropriate error value on failure.
  */
-int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+int rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	if (WARN_ON(!ept))
 		return -EINVAL;
@@ -238,7 +238,7 @@ EXPORT_SYMBOL(rpmsg_trysend);
  *
  * Return: 0 on success and an appropriate error value on failure.
  */
-int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+int rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst)
 {
 	if (WARN_ON(!ept))
 		return -EINVAL;
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 397e4926bd02..a8b7065fd165 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -63,11 +63,11 @@ struct rpmsg_device_ops {
 struct rpmsg_endpoint_ops {
 	void (*destroy_ept)(struct rpmsg_endpoint *ept);
 
-	int (*send)(struct rpmsg_endpoint *ept, void *data, int len);
-	int (*sendto)(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
+	int (*send)(struct rpmsg_endpoint *ept, const void *data, int len);
+	int (*sendto)(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst);
 
-	int (*trysend)(struct rpmsg_endpoint *ept, void *data, int len);
-	int (*trysendto)(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
+	int (*trysend)(struct rpmsg_endpoint *ept, const void *data, int len);
+	int (*trysendto)(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst);
 	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
 			     poll_table *wait);
 	int (*set_flow_control)(struct rpmsg_endpoint *ept, bool pause, u32 dst);
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 8d9e2b4dc7c1..5ae15111fb4f 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -136,11 +136,12 @@ struct virtio_rpmsg_channel {
 #define RPMSG_RESERVED_ADDRESSES	(1024)
 
 static void virtio_rpmsg_destroy_ept(struct rpmsg_endpoint *ept);
-static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
-static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
-			       u32 dst);
-static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
-static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
+static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len);
+static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data,
+			       int len, u32 dst);
+static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data,
+				int len);
+static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data,
 				  int len, u32 dst);
 static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 				  poll_table *wait);
@@ -490,7 +491,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
  */
 static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 				     u32 src, u32 dst,
-				     void *data, int len, bool wait)
+				     const void *data, int len, bool wait)
 {
 	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
 	struct virtproc_info *vrp = vch->vrp;
@@ -580,7 +581,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 	return err;
 }
 
-static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
+static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct rpmsg_device *rpdev = ept->rpdev;
 	u32 src = ept->addr, dst = rpdev->dst;
@@ -588,8 +589,8 @@ static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
 	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, true);
 }
 
-static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
-			       u32 dst)
+static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data,
+			       int len, u32 dst)
 {
 	struct rpmsg_device *rpdev = ept->rpdev;
 	u32 src = ept->addr;
@@ -597,7 +598,8 @@ static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
 	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, true);
 }
 
-static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data,
+				int len)
 {
 	struct rpmsg_device *rpdev = ept->rpdev;
 	u32 src = ept->addr, dst = rpdev->dst;
@@ -605,7 +607,7 @@ static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
 }
 
-static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
+static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data,
 				  int len, u32 dst)
 {
 	struct rpmsg_device *rpdev = ept->rpdev;
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index fb7ab9165645..83266ce14642 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -182,11 +182,11 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *,
 					rpmsg_rx_cb_t cb, void *priv,
 					struct rpmsg_channel_info chinfo);
 
-int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
-int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
+int rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len);
+int rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst);
 
-int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
-int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
+int rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data, int len);
+int rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst);
 
 __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 			poll_table *wait);
@@ -249,7 +249,7 @@ static inline struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev
 	return NULL;
 }
 
-static inline int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
+static inline int rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	/* This shouldn't be possible */
 	WARN_ON(1);
@@ -257,7 +257,7 @@ static inline int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
 	return -ENXIO;
 }
 
-static inline int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
+static inline int rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data, int len,
 			       u32 dst)
 {
 	/* This shouldn't be possible */
@@ -267,7 +267,8 @@ static inline int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
 
 }
 
-static inline int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static inline int rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data,
+				int len)
 {
 	/* This shouldn't be possible */
 	WARN_ON(1);
@@ -275,7 +276,7 @@ static inline int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 	return -ENXIO;
 }
 
-static inline int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
+static inline int rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data,
 				  int len, u32 dst)
 {
 	/* This shouldn't be possible */

-- 
2.51.0


