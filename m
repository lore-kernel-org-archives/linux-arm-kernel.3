Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFE8C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=; b=R3zBZaT2l6ZIHYSOgx92mdMK6G
	Rwwx/05ckrQAVAbY6haKwI8J0dbZzbWDoVAbjbhvRUL1fVKz0gHYul0lLnb9S4xKH2YPKg2vewQ/5
	NqQiQP6So5wGOiegIisJijO+9tHo5e+Z5lRfTZfEUiSq0/Emv0bsM00XRMOd904keU52slCV+1nn2
	8ng65NDzEW/Q44FJOXK1dUAd3/S9/kDNpE1WLk4QUYwPgJ32IOxp1iPSsYvp0GjUdMpcwiXhkWXcN
	dYyBJXf/aD6Kk4kf4LIEWB/5UQxmwhBuB+EgLHlE6dXVkLoHCIkUAFwwtuwcAyWpSa/1eWQv2KxiB
	JqPnezjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmww1-0000000EmBy-2msV;
	Thu, 23 Jul 2026 17:10:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwvr-0000000Em4c-18bk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:10:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvTjE154414
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=; b=W1SU1wG1cOiAxKSD
	Gdcxxsx6tVxyntq52L3+AiSd4xlX1k+IUpucp/6Dc3aJJE/W5aTNvUDNKAZKaBdz
	jhpTvpRKi+x3Fn1VocP6NssLgV20ZuxZZL3xqh6scI6+btGUFddBHRJXsgbtJHWg
	VSkTRq4u5O/b8htAlXaboBjROtfoSuh6IOC91lqO5nkGDfC0xvOYQxVLic0eap+r
	dIJMJMI8gT4UvZ+DWRIokzQCA0pRjCbuHPbGOZkuXLO2lmutLdnA5ygkclMYret+
	gV2gIPnThW4qeCzwUHSOaM1xqGeBkoRmFcipTF5epI1Y0Qb/BQ0q+c/DH4trikRK
	ZnmS9w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b5463u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:10:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1c7f135bso15159001cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 10:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826602; x=1785431402; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=;
        b=BWRSvUdYuH8OkkrPjjKrVY9g/5PTNa1oooI6H9l5AFuwv46SOjMy2SynjDD+8t+8j9
         cKqCjZ6vTfzQTAY6nz8U0E96LR/jAuFraYnUe9vmOPhozH15yrByfiMBnbDu5LqqC4pT
         110rQtYmixpNJOIXqJRRNMm66cy61w4YvcHGSL3swXscDdnjqhPtoZn+cQXtO0S0HyrP
         JOfTrNCDdQpT2P2LSF6NYkCTM8ZP0+cN9zlB27CD00fsJv+ekjuL3ExA0737bzgrQ6eK
         OphO/uOmqZ5LH85ZttsRghjIZc4fEwXHjTCvD2zuzcMOREi98QqmaUl+OaSIiaBFRHRD
         BWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826602; x=1785431402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=;
        b=Zk37y92wjA4LjQzaKqTVVTGXELLKIhOALz+je3OmTsggSuDLL3QjEURF1/hs7cOpTv
         5EfNIyMbMwNQcZGMHrltOwNY7LyY/qGgbsvalKSl7E3lrm0R7rAoC1G+Xmf959QBxwKz
         EJLidQCmfbDSFqrs0nIy+lpeEsnsvFHbnI630qxAX+dm7lOq7gIMRkpIohTALwLkNqIB
         bpOP2OrcwgSHjZyC7JKzJCOhwbOEAsYkFgEPweG9I67Q7nJjAIF6+mjH0p7sV4srs3H1
         3JrpafZfUoYve3T/v3Z0EiAXq+h/PoCL3LwK7DhfVgpK8bKhn8ljqhQncouNFkYMFxZ5
         0jlg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5lL91I/8Z2XbYauMIZdL4/WgU6pvY5yaddpPxXPVSZB4oaTOU8HXwdC1alacio+OJpN6JCA218Ou1zq3r+urb@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo94gnHY4r9yhW8s4lGpj7WDw+evrBKPI8QCv5DrtwyZtS0cZ5
	R3mzmMBmFCOjVZ64TPx3PU7fm7feLQ7Fe6Qpm0uwbe0fsMQ/eLTWFpt1IZ4y55BpCbEIJItlU0V
	EEiwVWCk8pRSx4TZjaWG0ZGdYODAEthdkH2gCa2Zh1lfz3YPAEb23h1DqXU1AE0jUkM+mis+YmF
	48WA==
X-Gm-Gg: AR+sD12H7eU12LDfSr+ulZVlxesXaXJcRJqpI7adrpd/sYPNd5AibnZdw35b/SN0viz
	9k6n1vjRh5T0zU2V+1mfqlKiFl7n50xK3hBXOA8BiULbhe7O5BvA/rGW9FwCLTH1dNXnk3mm/vf
	UyrvydPvE5NpufJIMcHsUQWlBEC0QR/SHUZfNWoGdYE257GXYFXGmUTeNXSGAELjafbBwiImB18
	osrOnmHcL9HtKYdzPUgX9+E6XvOrsDqrK0jFz44m8buv/FydUbZokmJToVrx1vZ7Ona4Ug8qQnm
	VCSUGxoQM7Lqszw/cBzTpVxgw/mS5br/PidpeS6ySROFNsZnEzh5vtekwPYNZyfUOShlKxI3nAp
	E2JFvO/FqKtj3fsMd4AmS3HfUY4XY
X-Received: by 2002:ac8:5711:0:b0:51c:1291:911c with SMTP id d75a77b69052e-5283ddfb0edmr35646711cf.14.1784826601629;
        Thu, 23 Jul 2026 10:10:01 -0700 (PDT)
X-Received: by 2002:ac8:5711:0:b0:51c:1291:911c with SMTP id d75a77b69052e-5283ddfb0edmr35646141cf.14.1784826601146;
        Thu, 23 Jul 2026 10:10:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:10:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:16 +0200
Subject: [PATCH v24 10/14] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-10-4f87bb4d9938@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2674;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=34ButmP/zHfg7ujor83QeeFN6rzFB4sOTC9ae7ymGro=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrITet9bWWLlF1QKOA3a8SVNipTK2mq9EKg6
 mnbit3+FIiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKyAAKCRAFnS7L/zaE
 wwGoEACZ+RmlquNZErTNw//QiZlhjQQf6QcXzkBFThMY6q8Zr2WHRA+PKl0pKeNy5bfcaUPaYLI
 aa3kTfzcoTGyW5IJZEJ/C/Xdv6Ao75I75LEIjIAKnNuAJxNp23Cuj8E/Xa3EOOk9HAmILlJPBKB
 n+ZD6GIVXWBve9KwXr6MqAouS27taz8n4kw+ptOmdngOaI7jxOJgHkB1v3FcuCk9PZpS+7y560v
 5CGYgGge7GF8zt4rJk6Nw9fc4wvBG5qz9DdbN4MdLVqNGISuP/CodKg32hvb+YsHQJdJpkEIchD
 imPpbHCPfeoXFdvhDjmRNVsqCq5KQnilNnHiWgdW6Eo+RJieeEN8wD+TuMhMo2sarSAGj9PluGe
 XQItDy4ymVBmCdVt7Vfwm6x6LhCW35mnnqZamOT+CNlZ9rXCIQBD9udrswfIhPN1CFABWmrpCfZ
 O8oh23hz1Z0XY9pCVgfi3Xw+JMQrCi1SVbD4CYEh95T91n3qdW6Lg/xv1I25j9nWY6TFX7WTJhk
 3gHZnD0M+gUD5JTFLYZbU6oBYmjBSJjP7Mvydb6xYEZyijORxd4MMKfGgeFCmdJZwfiivPxFiaU
 VV3maAF3APxQ6CQeMDLBVopbArKNWfACsvuLr9jaTwTdi/QZjRTWm9P56+mKm8jTfNTE8rj5cvK
 pWy+eAQez6U8Y7w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfXyQsYPUljyLux
 oeYTjHXyJCt6wRfKLiLehlh5ZglMPvK0LpcJ8W0b91ul880a9n2JulMts/oObrrP/S3ptYgA922
 mjC2dqUe9hTGIFUoKXdVZcrRxzF/0Vlx7MMdVFTf1JFahjd9xdwURY+dusa5fEa9Ku1TX7TvH79
 km1lc336AMsr2jKK4zQeqMOM0ysp/FhNiKL/Z6CMYNrFo+DC+qxyG5fiM29lqKrBIfv0XmdHFtP
 WQwsihxKt6J1x4EAtCKoY3kRdsuE6umcA4861ttNOLaSCI+NEHuRuLarEpPb58uGUUXKMNSrnwE
 XnuUxbi94VP3QkW7UpWPF5TPhKQa378QptHvk2rQ55fxg687dE9eDrPoftOYrNnW3oEgsSoDkdj
 8ihet00c/MI0//1sV65Ea2z5kauyemMWpi2+VdtJLJChZU2UUh5kOGwyH6xsn1O39S3hxsz432z
 yDNGgssOyVbjHbOZdKQ==
X-Proofpoint-GUID: iXR1IuVSy6DzFrTSwbhCRBanYy1ddzwn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfXwiNz3MqC5fXL
 fCzstmxhVhPWwhzgkwt2gaMnzZFYtNrXGLgDmGBQQWU+43norEGSax9MnxSuIPMayDmEWBt2qPH
 QKVkSeumFQpnJcyKfBHRcVXOWOKkf1U=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a624aea cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lH6k5GM5CfRwGFUYfCYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: iXR1IuVSy6DzFrTSwbhCRBanYy1ddzwn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_101003_337709_92F25BF8 
X-CRM114-Status: GOOD (  19.83  )
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
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 2 +-
 drivers/crypto/qce/dma.c  | 5 ++++-
 drivers/crypto/qce/dma.h  | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index dd860435d2c47a608c82cc2686583a44ff96c889..aa4a0b17749081f1ad653424bc265ee81e348e15 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -237,7 +237,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index d1daa229361aa74da5d3d7bfe1bc8ab189761e38..d60efb5c26d88f8b0259b1dccc8724d0f75571c6 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -22,8 +23,10 @@ static void qce_dma_release(void *data)
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


