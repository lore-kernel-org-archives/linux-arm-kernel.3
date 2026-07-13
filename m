Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50281C44508
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=; b=UfgDpLRI0c1c56qaY9ElRitff2
	yDT4ay3CqpG7t52nWrXu0iuoujK2ZROTZ9qpzWYnu6kRQsfWumDlCuuKy8jh58TEqWj3blYywTb02
	uGgfH6dLrPm2vhUtECQOEJG3y8Bsk6/T7dT2Ie/qDNTa9bd2h6ZU/FMu21YtyivbvlVqLQAgfN/z7
	2j+kRrOJIhKRhTVKsjLKMeL08UH0QUTz354oWqsqHSkrgN57hQGo7da13BMp6dCJ3cm5Z2zyQ2q61
	AuG1NgxQ5sPoXm3rm8dhWriodvNEf09QQ2PFq9bIiAkiaXJUqCkP2jkMxtKpgO2cRom7GkMRALKqk
	L5moVImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGId-00000009ITG-0u88;
	Mon, 13 Jul 2026 13:02:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGIY-00000009IK3-3PBH
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 13:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=; b=eCcVJoy6n+51GEbfQuvVG6Gr0k
	fOybw0nuXHIoKxsd5EO5eGOEfENnAmzDH7zzhcH1s9hcvGPGurdmVoCRayqyVwPlE0KZsq95DAD4J
	BZ3ihyLJb+gKuU9Sz241Fr6NRZfc4NinqjnSeHmh/HaGoO7BrETfaGfMo2liguge1jkjKpKnaN25c
	cpEp4KioHd7RmDkTicgpec/sLzoyWnk8CZjTaj1rKlZ82wmuysrf0cgfEDRETSCF8ubKQNFaxCPwL
	/ohj17mKfaCjJukELMvlQTSz6G2xs5pEoP+ZIg+dgCmY7GjlbkVwJgF7WLA0a16IVNe96P7J3Fz0F
	vwIlndrQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjGIU-0000000BcZM-2ju3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:02:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDvHG1209957
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=; b=Apz6KNtLUUkpqBFy
	wbJooXmdHavqxiRK9SRzxQjoh8jddyAeXVAfsJpAzPeqX3uQsj9GYNrCY0Jgz2XL
	lkeLmgJ5TxKKIRVU+Y9MuMV0wpz5qK7WK52jor38TezZRpjWvWK7Ot3S8JUrGbNg
	bFUzJ4gSEwNEexhEqdPYcTz3Gj13GmvNFLz+It/VmXb1a5E/6u/yldFoH11GIdpl
	PMXmVU6TOcLz85SJrmdIGwxrD8mzI0nEnXU7v4vzRpPjOnbPjXxuXfmQkdFE3Jos
	R3tpBnCXyHgOL8rnbhx1WQ40Gozgg94BPS+fDJygUHKIprItcm4bSqJ7dTY4z3lw
	+MCO6Q==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qrtg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:02:08 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a37aa2b6deso1793794eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 06:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947728; x=1784552528; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=;
        b=LSt2nVxgnCxWaMYg1G6LDcFHwDBgzOm80AK1PdJCKhFlO3NczNF+samo/Lma4jYni2
         fQYVjWi2DThkvPgmgnF0f7FYYo7agqTcyCDNfkVsScjTadABGACvIVDRbs2KmOvrSILP
         JQRlJYT8jFGKmjsgWtzUUybxAVoEUhwi+ZgBf8g8IjX/nIK33ggeV1lEQsTiVLlz8Uvz
         L+Or7kKNuHQahSSw9u1AHixmuRa4Ae22CiDIG6/xaZ4R3jEP4+SEgpT4zVvUvYJhbRFu
         v8Gi+LOFsDubbxlZ1VTR4puNJZbojB2wUfReJalQEt6o4hy9jM1F+tseKHTsCsKC27WC
         FeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947728; x=1784552528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=;
        b=YnTW/NqNflkmEwU0zH83Rs0disa+kUonCN+wT28VJ06FWUVckH/h0wtBJRkkjCmQm1
         opJfnlvD1cVqMr7GIWFX/1TvpI8IexQ2GAhWJUVyycijCYAOwhjB7Uw4kYMAy+4MwMu0
         K8Hz8OvJUjV41yJ8QvT3aav0paOZro9JA0D+QR8xLXNitAu7jnPZnX5324JNNlmM7Iit
         7KX9s60zsKM28HK0xxYYdBKvVtbXwCeCH7OYYptA4yA7VGcG+hF5mUkufb8z2IY/cwxQ
         HrZyKagXxigJlQ+U7RvSW+uGY1N3FTNRtTqJJ8G58KJ7KbsoG2VNGUkFNiOIOFDl4Z6J
         /tqA==
X-Forwarded-Encrypted: i=1; AFNElJ+phjiD6PPrums3EWGjRurk7KmooooN1XxL3JZq1Dp4HuVDG5c73pBbHNxpcwo/hZStwFJ2IsbNAXV9eTCqJlaE@lists.infradead.org
X-Gm-Message-State: AOJu0YzqTDAskOQF02G0oUkEeUnpi4MPzmqRbbJ2Hv4sgMDMwdDiK4l8
	3es7DmSP1HwmD+A+9ZRtg+jllAP+C2hjcK0qfQeq3Wlpb/ICp6meabpbnp8EXn7EC70R0j9WfCe
	3FMdWm7sdF9j2TSNG5Z0xjYdYQlUQb1WjG5bQySmDtRuLbiBbSR5/ROPv5SvHVwqrJHXRzrH91a
	Q1xg==
X-Gm-Gg: AfdE7cl1c23jEd0JZyNSy/f+SQ46W3zqrbHH0i4rYwrAKmUIB11dBAbzIwwGAh/lLu/
	OyjAsTchP1y7Ow339Vv/3QMUXI+GazBwgKKA500wRoB7LECVjQZPLJc5IlrbKXZvStH4d1SQMbX
	GtnwgodUEYjAvn+DlGL05R4QMLUamugS+4/HI8sRDT0LPgxgMFV3SCokUYXHSUiLxThERcU0gkt
	ijnLJTGiz6jktfxfsE8maJAEagSNDo+ScLdudZMfiE9xVhC7wioLbRgfXIQPlj5iWNJfbeSxrIW
	6vRZK5m31Rqt9xfyVjOX5S14QdKjXRHqTsi8R9ceZfupQDQF/8nE8bszCjWWJcFeJDd5N9leTEv
	1NCP5PUDCwu1G7b+uGxO8HxxEPPrzOhh/HiwQEiCo
X-Received: by 2002:a4a:e90a:0:b0:69e:3c9e:5e82 with SMTP id 006d021491bc7-6a39a6e0605mr5301031eaf.42.1783947727356;
        Mon, 13 Jul 2026 06:02:07 -0700 (PDT)
X-Received: by 2002:a4a:e90a:0:b0:69e:3c9e:5e82 with SMTP id 006d021491bc7-6a39a6e0605mr5300958eaf.42.1783947726554;
        Mon, 13 Jul 2026 06:02:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:02:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:13 +0200
Subject: [PATCH v21 12/14] crypto: qce - Map crypto memory for DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-12-bc2583e18475@oss.qualcomm.com>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zV1OR5DiqlcnDzl6TeLEQ0wLAWkLclKWK2ow4Gd4Hb0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGg2k4Aqdj6ExXfrGYi33qNB2cF3TtdSmBxG
 ZEWkJ3G2I6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThoAAKCRAFnS7L/zaE
 w83CD/9adnWfXDogBIuVxqsFAK0DlbB+A8nFLQfV7/YceIQyAioQNgoRNTzD9KdUS6Belq9lDMB
 JiHASqWZlwv1Vq8vH1IIPhN4y9XkIHPJlQ2bm3wpIQYURD8QnlWRS4DWPWy8+J/nMJzHrd8xjW3
 rdoT9t8ATGSYLtYUCS2rJb9S5NTihi/e3AFGH2uCWgI/2VvHspDZEP6MwNeqrAt1It1AvNP4hyR
 e1lhSUNlAviaKAzRFOgtXZfd/TTsuDkAS5CZIuSTF1RKMP80YA6Z6Z9TMVJ+eti37tJg9p1YGyt
 4cXWOfxgVQz3wVaTaQQAd2mbR35B5jlt9wYR+g8hdH7CkOCj9+dSFYYftu6bmoH+kAhoGx3d9fV
 1BjqKYPJyp+ysTK3HlmGWhLddnAw1rpipDBfD6+rcs1tjSTKU7U43Hn9Gw3uBpISSd9lvwbIAp8
 bHrmffTHYd51PVA+50Amcmd4VbFhfSsf0jKvACSdewmtmg1r/Aub3HZ7fWkDniExLIh1u4I2uqO
 8iT4g0LSaZMgPBw87KUt/kymxHHjembekUq8KVN/FJgniWx+qUvEyQNLlm4XW97RSlRkxC+jhBK
 4SE7efnWclviV9PmijiUX3dkn/mXjyX0MJfAhr5V+oGpJ3FcjXlv0AJFWBvshQzPxIlZIcYiWsm
 /Y6B4Il3X+fkQ3Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX+WSYaxPOzYzm
 QfZRJ38HLCadwfMXGxMMm+BUxoyGZHHvzYIvZm7PQxmhuwY2776004nMggyJX6syihQPRlaOEEE
 0Z7zewod/y+J6gkNgqt1gE+kHce6Yyfzh1AqvRt4MuUz/wucSLgitbfAtXohnkpq40kTef5MB/6
 C2SE2sIbgy/zYfi3ebW98PptnVlG3GIWbAVrmu5tZRxSB0P7HWV4Pf+8VmQ9O8UcXIXzHXZi7Cu
 qVdrMO92fpEXp9HpeZuozV1cGAMK4I6E4MdLBC+JafRTy/UBDRzgJcqqQIILQ2RWKC1WqK/dAvS
 5tuu0XlPBLoQOIAjNhx9a+xWXmC5YPH4kgBj5gA/PAHxXubAtNNkbgrTUPN1nCcO/GTL5hmM2H/
 zKDqUJEkR1H7IKssfp3rKvM6Xw5uIgXHmD8uCQVgoxI3E2fMSH8yKl9zEHBgNRSfYu8/rwB3qKu
 y6rtmxTUAJumQmsB2bw==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54e1d0 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tNk7rGwWxUH_P3zroIA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: hfTiS-Ih8wt0yDjd57D_xg5x5e7BYuGO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfXwx4wiqrFK5rM
 668WcPHquzQLh9tGa1MYmaqwgunvIEZe3QA5qDUi6flu1T2b2jZY5FIhpB81CEyzAucm5ugH3/R
 /ejEzg7FFqmYlzSWoUPG2ZmLml4I0xg=
X-Proofpoint-ORIG-GUID: hfTiS-Ih8wt0yDjd57D_xg5x5e7BYuGO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_140211_368119_992007C0 
X-CRM114-Status: GOOD (  20.10  )
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

As the first step in converting the driver to using DMA for register
I/O, let's map the crypto memory range.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 23 ++++++++++++++++++++++-
 drivers/crypto/qce/core.h |  6 ++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index aa4a0b17749081f1ad653424bc265ee81e348e15..4031b4516d6519fc5024bbbcc439500a7b3314b2 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -191,10 +191,19 @@ static void qce_cancel_work(void *data)
 	cancel_work_sync(work);
 }
 
+static void qce_crypto_unmap_dma(void *data)
+{
+	struct qce_device *qce = data;
+
+	dma_unmap_resource(qce->dev, qce->base_dma, qce->dma_size,
+			   DMA_BIDIRECTIONAL, 0);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qce_device *qce;
+	struct resource *res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -204,7 +213,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -254,6 +263,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	qce->base_phys = res->start;
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
+	if (ret)
+		return ret;
+
 	return devm_qce_register_algs(qce);
 }
 
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index f092ce2d3b04a936a37805c20ac5ba78d8fdd2df..a80e12eac6c87e5321cce16c56a4bf5003474ef0 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -27,6 +27,9 @@
  * @dma: pointer to dma data
  * @burst_size: the crypto burst size
  * @pipe_pair_id: which pipe pair id the device using
+ * @base_dma: base DMA address
+ * @base_phys: base physical address
+ * @dma_size: size of memory mapped for DMA
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -43,6 +46,9 @@ struct qce_device {
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
+	dma_addr_t base_dma;
+	phys_addr_t base_phys;
+	size_t dma_size;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);

-- 
2.47.3


