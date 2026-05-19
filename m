Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F08ECD5BA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUFRedyxv2ZWJh5/udxxljoSXdv1UlG0qZX9Fs/V80o=; b=Dww/j0Vek/kv+QV9+FSuXBwPkq
	0U67URO7UgRzr4aiQJJLXefJt1vLE2RQ8zmJTod5itcrzxwGBAGYqvSOS0NmfA1advJvnb9oYRDsG
	h/RCSMb1dAf1zYNPTFoAuaLbP1OY0eblQLELlr2VB9SDobg5Hxd8Oku0GRv9N9lHGH1jxCu5vijFl
	CUZjXDfvyLDH1vwVtCaRF3pjCIpGOKr/FNIpID47UzG9x6PkpI3e1Jm/WLc+O1q5f/FWnLtZ6RlOa
	TnRuqOuy4vFVt5CLwVtjnXVvn0l8blzQ5S2Ne0IUMOs11LnYptiD5mGmm8DusGhmwi0EfY3YrqXym
	v8WP9JPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKLX-00000001ciz-3N5e;
	Tue, 19 May 2026 13:18:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKLB-00000001cJC-1EAx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:18:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JCYY481737173
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUFRedyxv2ZWJh5/udxxljoSXdv1UlG0qZX9Fs/V80o=; b=MuNNPpeSGs2mmyOE
	81M7YgB8TXY1c8g2eOoiNqKrUIikddT3MhnsM7bxqdWjcB3mVWgIhaGbnjtvt6kw
	ugWAK9iZlmaV3iWekg8o5s/Ui3K0CnW0ec5zrrHKHZHb53eLBBu0zQoxKjzcM5Sn
	5xvusjrvTqAw/m5T758jrUjgwGQlxelP0UosZHQD2xe5LTLYzPxsESaU2F2836fV
	DStVRcwUgTvjM93YXd7dCeEtMe1tnEs91t9jNAksxoeJEmhgRt4X6wNqryPnFgeJ
	ygDT15NlIvtzobgyfvWaY7+tr7XhbE+qZutF2bsTCU/eu39OepfAlmsyn9FbGRBL
	cf/XuQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ju91jmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:32 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95cfe3d4c16so7212615241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196712; x=1779801512; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUFRedyxv2ZWJh5/udxxljoSXdv1UlG0qZX9Fs/V80o=;
        b=D8nG+bLSN+d7ZR+8eZ7YmIfXcXTMfrm1Fj/fIIpWy+tc6jKCN3lcPSf5yUKUZd425k
         JDDpX9wJg/Vj3Q74bP9LuaYTMiSsETw2cVels0wjrzK2Iuh7JnjMfdWlT2PC0I7EUTTO
         OydA5iQOYaMP3UOkW/R3cF5ko8hS8Rnuj6r54r//7GblxPao34cHtoOduj/Bpf/uzq8C
         HI8veD22dDjUTE/eMFK6T+4OtyGz3nNpiA6oPXkaGG0M5IBroyLh035Btkfw9+m+5N7c
         /ZQIczPXC1XNhRkk5npxByVj8RosTuhBcqnyN8NzVkNrvPsyrM+Sz1H73tJmEQxHxT4X
         taNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196712; x=1779801512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUFRedyxv2ZWJh5/udxxljoSXdv1UlG0qZX9Fs/V80o=;
        b=UAYD+ab/lKkfJB3asDO9yatgwvrtU2dGe5IXF1tf6RRzdneiwSupNolxg809ulCzCN
         meUo6JFn2wfiEV2Nu2TAPetHNL4nl9PXx134F1lvxitwkX46GFBahEPRrngBPbaNCWVi
         +BGS9Gbyj7pq/vPTnkg5HAVn1pB/trRWybWw6BZ6e+gwmgzZUBJE75wuuje48ObbvBhg
         gmAHCp47oiQJiRQLwZinarjB2BxTWum+QJGoS6etgn6pW6MRY62PDYcVDHMBC95jBT82
         DyJA1ezWqbxIE18VaVHphsnQWOzPK4GE2T4HDScKw92b4qvBB80UQzbrXRHh++QpJU6E
         ut0g==
X-Forwarded-Encrypted: i=1; AFNElJ9Ijwc53/iHEoADqb+ZqHuTgguyg+8+XvlXJuoSLOCrvomsG1z/jFQss/m+/TI9VBfzMebYHXtepoowwbqdOLQf@lists.infradead.org
X-Gm-Message-State: AOJu0YxIYQspn6EdUHcSPCJCbR8LuIbxKtF6WSlXBcrf7CShnMZcoL5i
	xn51CmtnvLfItx9W17isfY9DXdqhCIdXtfsY1NxC/60mjF+EeSUSaWfjLOss4k4LfyJn+NE0XJW
	93X+HmhJaLgNkieNY6fc9eQW0SytwnCVBeCKd624YmOBvWb9EgwZs+vTz9E9Qb3pQ702TVt+XHl
	D/ng==
X-Gm-Gg: Acq92OH8jaj0CZ+HGV8jtVF8uyJOhq13suvXEAnDRMSK8RzbOPLIEAt0tjtvkgetpOG
	fX0qUGNiUAIOI8P/VDl0YeS74bdqkj3n/xYnyk2HZaWMJVo9fKvUFoax52Ly0c1T9a/wPESofDK
	w3vioBZqooXYfj30TtHyF6VKlDZvh/OkJanIw/i5GuFnSfwf6/JgbB6hB02tWQkhvTlY1vcidE3
	WufCeI9dwkM619TzXaejimIsJHlj5HDCBOzpv+XEotUo+1fBVIRgFU8jKbXyyowHsZm5nFs8OWq
	FOdwy3RGyugO5yyC/6MKSIgHA3GJjjlv8OlheZ+lJAVeXbsrNb5Y98sc4+cUtNO4+PWwZ4vUvv+
	r+IOU1C55YkpiujhFTrKnS2Dc3+Li0etdthgPVwQ0H5AZVRWZcM0=
X-Received: by 2002:a05:6122:338f:b0:56d:31e1:2c9c with SMTP id 71dfb90a1353d-5760be39b65mr11841956e0c.3.1779196711777;
        Tue, 19 May 2026 06:18:31 -0700 (PDT)
X-Received: by 2002:a05:6122:338f:b0:56d:31e1:2c9c with SMTP id 71dfb90a1353d-5760be39b65mr11841884e0c.3.1779196711297;
        Tue, 19 May 2026 06:18:31 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:53 +0200
Subject: [PATCH v17 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-11-53a595414b79@oss.qualcomm.com>
References: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
In-Reply-To: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2326;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kub9ORcm7+PjuGNnZqvGfNQgLhDmAjRY+udGQlXYRFY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMLWsN4P+y0sI6nEo3BmIFA8t/ghg/wXe5qA
 Ql+ONm/pqyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjCwAKCRAFnS7L/zaE
 w+krD/9XHniBTHaTTIndeLMo76y+ouTTwRewnyUZAauiPo9reRkjMHBltEt6SiBr3iFPGpXAd/6
 L5gstUto+856tZiKAd1qNe5g9kXSm3lHbgb6xadcJWt8F8zuUgjnW/4VbXV7Ix+2zOHWIyvWYaM
 TkGjKDGFRV2Sf2t9XJ0PbYI9yHZH5RAwmHSP2iuza3+1OddN5CbKu6+DPNJs2ZOmXFFvexdbUZm
 p0Q6CxK/HpRDO+NbqOiM0zbEsrySJ6l0QpNUN53D/0jPiCAsZFNJ8SJTmhUhWhKsEsPFdwG2OCo
 wHaKp6PACef7O6n0awDeHXX4JGrv6wL+1SyAMIN0JNPbim1hmscQFqjQncKd3mP89sb61pMLRAj
 NsUbg1jOdeilx3GPB+WM9z+Jp2gGEQBsDqQg2uHL+OjnvqecGyNTgx4iICm8XGSEcJ42Xbbotvh
 oqanh3S9oO/3tFeNad0mNGjeW9yXc9+ZykbexBzgVU5vCrqRbiJ7hd8Sghs80HnopNR0d8/ANsP
 MQZ9lXcFLzDE2Ykwb+8Wm5gx+ordD7EQxkmcS45P0E6uk7GZnhuaeh069x6H0KoEHSIKA58nfVs
 5r0XXSexj+81IATdH+zKC6mtGZL7Lme0jvulvWJjxAVM2WWtbMT2X1jatuW10rVrm93LBCKp2D0
 RbzhD8Svhh5rK6Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: u77m7V1eGJJuwnPImwaKj87inzmgsfIP
X-Authority-Analysis: v=2.4 cv=eeUNubEH c=1 sm=1 tr=0 ts=6a0c6328 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=r78XHnC5kAO70zNBxnsA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX0ZHikp+92wHJ
 tUbRA+VwAgI7kuVJhxqaUNBxWR12Cg6C9A2LVbdEzmo7aVyiC2Eu3mY1XXDjEF4z7O+RpyXPkVD
 Gv0oycbqsuzXoDpLJxbL464CC/bZ0vyRaBdxR/4o+Ru+OAmg45ZMRn3AYSWPVCLQd029/Y4eacN
 GI8oMvZ1YMAZq0JS8v3gKiGiEZORSvwgugj3DkX4MLWAxWRrlhbeYyrPGdGz3u0cqAX7JRyF0jl
 WS/d86bhMpSpvY1WGCfk+AUClTcvwtOSM/y9gkhK97BsYq/Z54dXeJ3zEXO0xnsAg29BQLMk8Pf
 1g8kgzwlKmSnTBd2JnZh6ZUy3Z+skTtIPVTqzIaiZiP63keIwZnzGD8tNad0uR9S+l/HeJV6gne
 Z0JEFql3aO0flTWjgjurqS+M0WB66h3qz57/8YR/TqX6l/88yNs38ye/n+GSmB+ZQar26Fw9iQ1
 ZD8fbOnpNoy/g+rLq/g==
X-Proofpoint-ORIG-GUID: u77m7V1eGJJuwnPImwaKj87inzmgsfIP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_061833_347089_9E8A1579 
X-CRM114-Status: GOOD (  15.61  )
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

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 41 ++++++++++-------------------------------
 1 file changed, 10 insertions(+), 31 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index c29b0abe9445381a019e0447d30acfd7319d5c1f..3db46fc0c419a0a387abce93649084fbf4b1f128 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,47 +12,26 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
-{
-	struct qce_dma_data *dma = data;
-
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
-}
-
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
+
+	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
 		return dev_err_probe(dev, PTR_ERR(dma->txchan),
 				     "Failed to get TX DMA channel\n");
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->rxchan),
-				    "Failed to get RX DMA channel\n");
-		goto error_rx;
-	}
-
-	dma->result_buf = kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
-				  GFP_KERNEL);
-	if (!dma->result_buf) {
-		ret = -ENOMEM;
-		goto error_nomem;
-	}
-
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return 0;
 }
 
 struct scatterlist *

-- 
2.47.3


