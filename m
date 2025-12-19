Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922FFD7497A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFjLzdXS7WFARFCvGYmEmxcoIhULzoVNQ1ypX49ZyX0=; b=K/ItCprO971P+09/1jCTD9VKIO
	8ZH23u9FsPZY3/Jlpg8Mo5Ey2PWUNsRa0VUPaFMOtgM/OJnwRB0WXW304HFgUhP6+6S6BH+LWbb5x
	mX8aIrzTn5zz8p1R0zoY3fRTuRMGhtOMs1yvNVQg/ATdIJK/ejmvfo7JMpz0V/w92+Rz3XJ9GZb3W
	+2bd3jqgL2tAdAXWUkZ+EesnUDPnQQSF80tk5mqq/Az717gqRJPBZXGbF4HBGccNS3yqkeBkHNcC7
	bb71rKrMpwe8UR4Txp83ye7oio0yAoJci/JLAwlG0Ybm0WiMk6bJGyrON956A4y1APUK9Q/euAwGz
	xVFTZVxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPW-0000000A1JE-1C8t;
	Fri, 19 Dec 2025 10:08:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPT-0000000A1HP-37nt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:08:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c0Jn4145308
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IFjLzdXS7WFARFCvGYmEmxcoIhULzoVNQ1ypX49ZyX0=; b=hYg3U4+IPM2FZJwq
	zRbjJ1sL9qTa6t7bpNClH1+XaEcV6OauF9SzPKRKusWgLZQ1K9auSfxt5R8GsUzf
	6Sy5bvSLL+hn2x1INGuzMjdAXfDq5PqFEdfbgO0s4I040MSguV0ed6Pv0aohTYrv
	lX+osfdDr5xVTZ0m3T3YCU+quqveYXBnpyPqRbAdjfVc7DDF91gMkVcDOzi+lUqV
	Vl+D7GmaoFeN75FqKjLCR3TycKMxsbk1jQsL4HYA7nyDbNLO0B9qEEtH5BqP55/a
	3GSUdTOhURb/adaNps5ovvVRKuQKL6EG8RQmGd9LkuY8W2NqcncIGHU2Sz/cym0o
	kmSLOw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2dt93p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b8738fb141so622442485a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138910; x=1766743710; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFjLzdXS7WFARFCvGYmEmxcoIhULzoVNQ1ypX49ZyX0=;
        b=SPz4b2lrlBBN+293jwcYtd5do/hKYgvOxc4TrtVsZ+aABejQhG3SL0bFBBId+8fd+Q
         mVm5VF+gkeuPR/IcwpAzGPMKcEF3Buj2pNoP5qWQB8/1FQr0aftQcmc5iQk9Q4SthPCK
         B+I4VJgxcC9XvmoSJOnj0jMb6RBWWaq/MmWRTDVpQTETTcuS1ftfXql/okr5mwlm67Gx
         LJ6cy0mfMLFiSg3dHPB/WbWVZYuaiYgwGl8D3fRLFUri0LsQks82HU9zu7PYMDi3sywA
         WK61AxHxuq97E8hZfDowpEjfLtGa6jjCJYO8n+lIPTXYcRmnq+e/ed8Swi6D7+Pf8QPF
         rKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138910; x=1766743710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IFjLzdXS7WFARFCvGYmEmxcoIhULzoVNQ1ypX49ZyX0=;
        b=jeckTA+1rumZp9b9frU5oj8hIuOP94xkfxYgm6xYCo38eymg9n/F+fi9/8O3ytNO08
         wF10r9mH/xH3NQZ014CEmi0SY7RWY9i/cIhJ47VUroB4BDmJ1nSnM1IA4NgyVVlNdNRd
         S0kt+88mZ4n4k8pKgzoUJ7Rw7wa+PREoPfZtsDRU/PjGJ7OlTL/vrbzmChRMWSyCcK9Q
         OwRHTWNfJnglUxzH8CibgMRgsI1oR0kUspoJwliB4DspueYlIaf/4F3q8YicNW81xTDE
         5FGBZL6r3Jma0+T/8Cg8woeWpfO0vh1lciPwOhlW5dfoUUhZ4B8UnPHlff6ggrasS2rT
         KuIg==
X-Forwarded-Encrypted: i=1; AJvYcCWr80Azfu2NZArVjM8+YySprPdv1bVowVb28NxZ8B6g1Zmk9BM41xYi7QkGQhVUdliDJ9MnYQ7ov4jo9T5pxxaz@lists.infradead.org
X-Gm-Message-State: AOJu0YyA7vpC7fZig447StliI7T85z8GmlW6e8V+dcYEJnFE6wRhB/Fh
	lD8B4ijFhQqBdGxlXmk1cM7CFSTSSYthRg2OW8UWTK6DbiZtKvLr1nMMxnKYQiOAh2Z5FZbsSht
	/7EvI3jDvScZaT2pfoLiy8/lLOgz5UlMKjzxUHD1dkj179qYWJmN9vhcUZ0xyBT8GU5y63qpv79
	8JwQ==
X-Gm-Gg: AY/fxX5vft3SuqI9/+DmmKS8/iIq8yOm17UNN/8baVt6KrN7Ssu/J1wNUlV+pFwxl/S
	jRI1EKQ0pJi2EGt7Doxa1IM/q3zMyoQ3AsptQSuveP421093Ld8jHq04MqYH4Rvi1kQuS47HxyD
	tGXIig3PgzT4OyFs7fCsZFtbp18auGGjBARyitDtUW+OQHolzfsS3rinJC7fP6mAAAIOJspFspJ
	j1ufaJCEc/WOsSLE716fDV1pe9gYi+WWgLP9Qkv4L8Q5ZRlna56nmxEEUR4ChS7yOWTF/ILzrFs
	/hB/LZV0rNz0HmN8tr1feMfSYl2YWYhlloBCxFTFUDxfpZ8i27SSq2h39+3t+5AnWpHPcIA2XMP
	D24GtnUh7BUd7D/9VW4sBjqHVFisIFbtNAWk6rQ==
X-Received: by 2002:ac8:7dc6:0:b0:4f1:8412:46e2 with SMTP id d75a77b69052e-4f35f45578bmr97165381cf.29.1766138910017;
        Fri, 19 Dec 2025 02:08:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHc8+g1QsJHtXxcUo099R0j4nSIa2xzIfiFZTkXGHWGmooPljDcI3xhv7ZIU8YcjS+Wh1RWlw==
X-Received: by 2002:ac8:7dc6:0:b0:4f1:8412:46e2 with SMTP id d75a77b69052e-4f35f45578bmr97165091cf.29.1766138909640;
        Fri, 19 Dec 2025 02:08:29 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:42 +0100
Subject: [PATCH v10 03/12] dmaengine: qcom: bam_dma: Add bam_pipe_lock flag
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-3-ff7e4bf7dad4@oss.qualcomm.com>
References: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yhm3Q7whQ9gDjS2DZY31DGTD5RR1FJpqK58rV1DDyQw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQPpJf506/e9fSbiImN4c89jPXJ48F6G2GRI
 dB/Id6WGWSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkDwAKCRAFnS7L/zaE
 w7MvEACyVqsMPwz28FGKEH9CvUi6ZkY9Yu8a0NxKlhP5b0YL6qU1x9graqHiWz2fZW48IMAXk42
 JVPjkCZ6PHSDsiLSouOWe2aBcAsuj+s0eR+gfH0q7yMskiDbViPS+QN0CyO4B2oGf593SQB4UMw
 C6W58b/LyPtmPWPsBxOAHiKb+ZLc1vruZruGXeI84LMM0nuUStxsq+OmlYP0cOb3dFSmUOHK1Ey
 LOjPYUihDfhm8Xn9SL0rPBAQV5wa7RYPjsJxm5DZzkOdlVMpCj2dnyqZ7z2ZNBXjzoHe7o34vZv
 r8o4Exd+5NePMqYwPH03k9sbI4fm/f/n+BQhndYnnHqMZdRHtdMIx8DR/ijE3HSSQ4wTXOWMwc5
 yzfkHqNQvxdGIDf6H6/0b/G9EI/iuTDqR92JCvCsDiMA6Pwjuc5q58itf4Br/BEVIj0N/65N3js
 2dT8olKkLHBgYT4Dhw416DvF/Eopo0OIvF5vHARrLIGP5yoHdZcXpAsTfiSpNtGDpL20bKDiQZN
 tG4GC8WlpWjMzyQlY7wxNp6NfdnbNq4pU3I8Ow3cM8ktZZnNd14bPn0MV+0Hz38h5eTOIQiE8S1
 uLM/vfjvJEmUGNYcR7MM6jHs7DG/UmUlp7Rizrjr0IuGZ499a0qlsV9PNmUBozE8gf9SUBdyWSx
 P26gJNzJ3j0gnRQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: kJwbaYO26fc4AbiV2BDc4ory6MmpA7dK
X-Authority-Analysis: v=2.4 cv=A7ph/qWG c=1 sm=1 tr=0 ts=6945241e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: kJwbaYO26fc4AbiV2BDc4ory6MmpA7dK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfXzRLp4CQHmb/F
 Q5K3rGgOA8cWYkuVrTj4Q8jqw6uQ1dUm/wFzkBN01HAdHgM3zFGwuzecnYR7Cu4bsGHq1CzX/Lz
 Vs2k5PMkNpshB0Szi5MDjk2W1EazAwgVCfg13de7ZS1KsB+A68asGzG0iIjAwX9sEGsDEat6Tw3
 JbCGVBpHWJ1m4jJcF1BrDdgoPnQyhpYR9OVGLAWlqWD73zwZVf6MElZpYQk8AaGbv8cu0agfgky
 HQyaymKMbA6eINFO7UfeACaxVswcMDkvuF8tJ8kTju/RYAxB6DEgYr21xgdRsRlSBJ0/wJRGNZH
 +aYxlG7RUcslGrPIsPrmJWoU//h94Nvr1qdC6JXYLFVb4Zp2dm4EFdB+c/+UbxyuyZqL93eSwoV
 BIESBi2g11xQL5WeX7dBnc83HwhxUqQvfe1Zg9aRhuTaIxubCyFzK+iiDmxMF1DZvWadB8va8eR
 WS3ZYS8dfn82En/u3gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_020831_910800_A0655909 
X-CRM114-Status: GOOD (  15.50  )
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

Extend the device match data with a flag indicating whether the IP
supports the BAM lock/unlock feature. Set it to true on BAM IP versions
1.4.0 and above.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 6f78e6b1674a0ff3deef4c3d1892a978555b3807..0ce9153da67032dc8ce910f68d1f80019d8b29f4 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -114,6 +114,7 @@ struct reg_offset_data {
 
 struct bam_device_data {
 	const struct reg_offset_data *reg_info;
+	bool bam_pipe_lock;
 };
 
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
@@ -180,6 +181,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 
 static const struct bam_device_data bam_v1_4_data = {
 	.reg_info = bam_v1_4_reg_info,
+	.bam_pipe_lock = true,
 };
 
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
@@ -213,6 +215,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 
 static const struct bam_device_data bam_v1_7_data = {
 	.reg_info = bam_v1_7_reg_info,
+	.bam_pipe_lock = true,
 };
 
 /* BAM CTRL */

-- 
2.47.3


