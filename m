Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC9EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=; b=g2JDskUSpm/MspTwGSh4BaU7Mm
	/oEJj0dhT5JSsbKiTD5WmVTLI2lToKe0PKsgRzKozRd31ccmuKqMkqcNSe+PQPaCQUc4M+VVAj8Zd
	1ffxf4fTvSPZxxVNGOr/5SdEWvn2evCKoldO2n4oiQkqx857X9xAH8XjfH9Jd0tNhcKlC0yWRoSQN
	HFGmRMUmAEe/lFansMNTw7Q5Q/cWLDge/bCQ3ro4HXhCx7dSRWGlN0AXjE3+bZdh2G66/4D4GUd19
	aAslN7L84E+qptPVA5g4KI/pQS+AAMDsRUdRac3XUsjFOYZtZrVWb2uMD4npJYlwRMblfDozw3gzY
	UMPLlzdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8oJ-0000000EHRx-2501;
	Mon, 29 Jun 2026 10:01:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8o7-0000000EHJh-1QD8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:01:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8xgSY2431944
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=; b=gzTrnZrIWRjyuGAM
	OyqYjnhrfy0iiRcMz6IpRLtA4E4RQT4QnGZxauvQUtztx0+CSnejiKqcH2Cgfpxj
	JpK3wI7V/6Cg3/B6km6VMu5IFeoSEXwXZYriiU1DzNISGTVIOQxH91+xD/rgtsjZ
	b1d/c/c7dGSXSbw6Yue4Hsb4bEhwtSVM+xvy7R4DEJ+3jgoAIU5Zcm9OJUFuujAA
	ICiQ8IGIbqUV+cn3gtjLDY/F0qDwPxWQTDnce5GFdEAaWSO81keaCs+D3+SEaLa1
	ghAL8+sVy6IPRtPDrthhz3TUm+qBVr2ySb83MTr0Ve29ErT2kUqySWo8a2FjZcmO
	WJnhDw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nper8yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:38 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-969289fca9dso682378241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 03:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727298; x=1783332098; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=SYO1krWaWAWjGLvMtSQgLdFOY0gV2J+qWMssB8dXrwZ0+sm+lI5BKcpYAup7zfCTXf
         pjcL/CF26KYXUf1Y20aJ6GTIWbmn1TiCBS5B+wYolT4ihWel+DNeTXAoPCIA5d+OZdlF
         v9eQ8frWM5uAPpuiCVZq0UikiJViw9FQJ6wWZpVYn8O4uXVWPAksBQuJ5OTYtcXsAlI0
         6WTbvO6E1B3p+Asb7x1nHqEuitcKkWbSKReGv9MLloovYuonxtKxmixQjKR2ECBazjb5
         xDNUPlxiLWsM2gtq1UNh39+OxGEsc2NEj4JPtr4ZqoxBIOvoBvSERwUKzlkk4Swye4kb
         WQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727298; x=1783332098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=hx/JDB0xWb5iZJ3KiTVBqRfAZx4a2SvwhhU/0fdC9wgSWG8droCN/hSC2ArzWr12IA
         9i6dldU8c8gnTECz+lJ6skOxXUQi2R4A6hTURAm7rxp6nw7ZxESHtwoMNkZFKBzjsOI/
         kW3ro5OhgXciSmh7Uy2U8ivKMTqt1aKijWI2fd3dXx66cjKecXPThgdQZaPru/brrUyo
         7DSBP9iJRW9sY5yI4iFb890yKRzG7rvB4zTty0sgea7sD1ePqQ2HbhfDViON68D6F7dI
         PJffuLb5xJcWwwXOFHXuB9dqAxg57uJb5fnjzFJzfhcP+3uXBh9xi3BGg/+V++FmB/ws
         JoUw==
X-Forwarded-Encrypted: i=1; AHgh+Rpc13NH5IaOkWsygHylJ7ULngEIrTQW4ekEoPzG1vEqR7Oj5p/KFWAL6ayLs0BoNW12d91Juik7TsMS+JW6lu/2@lists.infradead.org
X-Gm-Message-State: AOJu0YwcP7MuYYRxK6OP/K8iDczw3vs02x+VPOuPEzJyOTUooHsdKUKs
	f3sulQ0JgJfr/NnRxLVEdb1N9Dpn8CWWlvQCx+wyRcNoVj9+Hw2CkbjKjgHzQnLIgf3qmpEDL+7
	5ORO9x9MFcgbh5VcirzkT/V/J4TZJ5Nel6g/vAx7iC1JhfJkB7VZkdLZHm0ch+7MGUe6t/5RufN
	wu3g==
X-Gm-Gg: AfdE7cmqVa5dopBUbizbN0vvca1u3cHHrU/I2XwHoCl8rBU90U51AkE6cAwR00DNN4N
	kFSO1si4efIzEeA8VunT/8UvR44rsgttd4VuTrRf1ESaQEJ4avdljkUkGdS2N+PBbGU89OAbU5W
	XGmZHi4HlGWqICLPLv3qcdEFzUqGwn+/pp3aOvwKuxE3oujYk7Wp2sIFBCxLMdHgCiMIxUKCd5o
	D752CeTUY8M10FhdCJVdbzpzu72CUNLjdFPzK+muUoFJtaZ/tlE8AVa3nOLllO8DcD6VXsf0YMb
	PhP0VMs7hZOzODyVdJnJ4HirKktIwZ5NsDNJ+tbvDhZQw9XfKTUhStsVrxKyDlNIBJ5q35WI5Vo
	mX0skRxQaU6KVCHK4HqsXXDx5w9YImLYgL7nb456k
X-Received: by 2002:a05:6122:d1e:b0:59f:8ddb:2fc1 with SMTP id 71dfb90a1353d-5bdba9c61c9mr18230e0c.7.1782727292831;
        Mon, 29 Jun 2026 03:01:32 -0700 (PDT)
X-Received: by 2002:a05:6122:d1e:b0:59f:8ddb:2fc1 with SMTP id 71dfb90a1353d-5bdba9c61c9mr18114e0c.7.1782727292310;
        Mon, 29 Jun 2026 03:01:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:04 +0200
Subject: [PATCH v20 02/14] dmaengine: qcom: bam_dma: free interrupt before
 the clock in error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-2-56f67da84c05@oss.qualcomm.com>
References: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4nbFs/xg8cCMPYrFtHWE96AOtkhXxC7yUgPXEapSLFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJprRUolPJe/4YhzQT31Z4wc6r48G51XF/tZ
 KO2XV27o42JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCaQAKCRAFnS7L/zaE
 w7lMEACqSAAoFegCmmR20sFZI3Mespj76ohU3JQKkxAV9V5VZxXj5XItwyNXet4kzFNbH23afZ3
 yr4yHbPwqVpoXvNtfSgygW8aMeDD/vMcaYVNe/3CGcFW1bvIrWcCqpurlHhXnq++HywTbG7vMQp
 bDnYIaJNOP/GS9IeJXaJC8jQFhT7nNU7vGfnzH4BtRztLopZHPVMY8NbvtRkoJY9T2JNJQnMikm
 2OznF7ujrCXqOaCHHY35pVRRn5ggbcYyNaoKXwAP7d+qVXZuJoK8X0UnzXVJjaym+75FzB8qA8E
 VYtoq5wg2cDbPiUeHGmE+AZE5ydHJYba4RlIIP4Effx/DIPOCcymDrN3K4+CoUkm7WsymNej8Ac
 jTpTuxFqirZ873P1LK3kvuAc73WeVm0T2GogHvqS95nWuN3usU6kqZv/iEnJHXqAt41ihzWvalU
 T5Lna6D2rH24MjRzs1iBGrWhvOZq+h9YwmMRdULsPwA18h8f4d5l75QkxOZRYyihnN8Dlbny9oq
 lppF78b+HZbc0xSDSU0yHX4yyqL7kURJrOUDJrlVIZi2GONLlWg+ZAYX4cGy2++i18CQmxjRuI0
 bPwsq+Ou+WNm7IhVZxWwPeMl4vreTn4Xp3M465IqabQkFBA56XkQ6XYbck9gnUyGzGrrcR6Hqpf
 3sLn8EyqyWe0FDA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfXznHKIN+2vzen
 HrvZP7/FaSpPUgUpmgdFzVvpDzurmu2hCSZMIY+FeXGc9Z/R6eTwYnEXur9ss5e9MSTooSFVau7
 6vXElXGzaofKH6Zis8YFtevl3VIdu+2NJHMZls5elQrUACEiS9dGJ3uC9ZJKkXyJl3PJ4G01sMc
 hrWKGafmmZtTGEsYtesPxduvDMzlEh/R9H28GXsb2ap58kxLSQRmaPgwSOOciiwefwHw11csUY/
 8yZGcHNLBWbgdlx/JkvAth9FrsH0wBtTm47SMG8oqlik9EqpVGQ122kWoy8bEbearSWGi8fR2VT
 bPCrzzjXoHyouphn5Fl+cilaMPsPECigzsqaUIp2kB9GCpyOum+VCCxi2LeZO1erMzpuVvZGXtW
 m94sH4JzgBEWBGVx0YgfXXx+1V9RibX1QiV+S8UekrJZX//CXgdlWIKkgENBezg03D0zmMtAKNe
 0COHMqIIsv5ufIixaVA==
X-Proofpoint-ORIG-GUID: JP46tbqhOO3782s5t3Y4JRALay-y8Cf7
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a424282 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=n8zAjjMAgf0wD31B80cA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX3PWBa9T5EmYx
 yBPfaTnC+4xi8wJIwqUDceKJ+Xk5wIZcB0CJkfJ00FFGOg7kayQt7nTfTenFSiGRgw7UV30DbD9
 GVB00VGizSbToOhKC8JJhJG50QEy5r0=
X-Proofpoint-GUID: JP46tbqhOO3782s5t3Y4JRALay-y8Cf7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_030139_386318_C32E1814 
X-CRM114-Status: GOOD (  17.48  )
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

The BAM interrupt is requested with a devres helper and so on error it's
freed after probe() returns. We disable the clock before freeing or
masking it so it may still fire and we may end up reading BAM registers
with clock disabled.

Stop using devres for interrupts as we free it in remove() manually
anyway. Add an appropriate label and free the interrupt before disabling
the clock in error path and in remove().

Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=2
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 1bb26af0405f3a16f97e0d4b86c945c252d97f57..fc155e0d1870cbb7e099a2c4280f9f8fbdf6cf15 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1332,8 +1332,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	for (i = 0; i < bdev->num_channels; i++)
 		bam_channel_init(bdev, &bdev->channels[i], i);
 
-	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
-			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
+	ret = request_irq(bdev->irq, bam_dma_irq, IRQF_TRIGGER_HIGH, "bam_dma", bdev);
 	if (ret)
 		goto err_bam_channel_exit;
 
@@ -1366,7 +1365,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(&bdev->common);
 	if (ret) {
 		dev_err(bdev->dev, "failed to register dma async device\n");
-		goto err_bam_channel_exit;
+		goto err_free_irq;
 	}
 
 	ret = of_dma_controller_register(pdev->dev.of_node, bam_dma_xlate,
@@ -1385,6 +1384,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 
 err_unregister_dma:
 	dma_async_device_unregister(&bdev->common);
+err_free_irq:
+	free_irq(bdev->irq, bdev);
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
@@ -1401,6 +1402,8 @@ static void bam_dma_remove(struct platform_device *pdev)
 	struct bam_device *bdev = platform_get_drvdata(pdev);
 	u32 i;
 
+	free_irq(bdev->irq, bdev);
+
 	pm_runtime_force_suspend(&pdev->dev);
 
 	of_dma_controller_free(pdev->dev.of_node);
@@ -1409,8 +1412,6 @@ static void bam_dma_remove(struct platform_device *pdev)
 	/* mask all interrupts for this execution environment */
 	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
-	devm_free_irq(bdev->dev, bdev->irq, bdev);
-
 	for (i = 0; i < bdev->num_channels; i++) {
 		bam_dma_terminate_all(&bdev->channels[i].vc.chan);
 		tasklet_kill(&bdev->channels[i].vc.task);

-- 
2.47.3


