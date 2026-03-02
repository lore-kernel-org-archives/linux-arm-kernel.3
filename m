Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FE9EA4E29
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FqTHsx1l1/9oEj5e3q2mep/esitBtih9Ht1cGIH4yFE=; b=DKFhH3tvXxCJ3bG/gjpDFW0Vtb
	2sgk0c28cO4AhyqGroCTI7dBCwrv2aznIlSdVCKS9pJDOyaoUbqvfe9qH/OmzET3aFVHLxsqQoU1Y
	wxg26o2Pg/Cqnz8MEwBLQJwmwFmFZcMqEpvmqTrTcNtvkY8b3LfP+ehlz985PrTBT6wr722dY/3DV
	p4KSUOZcWHklPF6xnpy5AltThK+mdemJjEQ5uTyo8aN030uU6gej3HzrQKJYbI5jfXbbNcRE4cOHP
	lHyhiNA9IwRni/m/NGBsqBm0lmRiwBWEfKApLZmZqKcSapHZ8hbWqtj7XAMEqou8MFc9q0srbfC7t
	8AYpQtbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5ek-0000000DQCs-1hsu;
	Mon, 02 Mar 2026 15:58:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5ei-0000000DQ9X-2NWa
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 15:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FqTHsx1l1/9oEj5e3q2mep/esitBtih9Ht1cGIH4yFE=; b=H3n+C6kuWIukTHYSebi21Dq6X7
	m9uN06N3DDaXwBKGZAPgQDw7bc4I9tcwXndJZh0H8kfyhkzL7b2KnW2zw79Mdend6PMyd8gVsRdrN
	raJNwlVn2O66T+QZ7B43+XnrWDOj2AFbY/H1mtZJkMEPqWYQ9BfMU/T2SoFkvc1ZPGJDmPylVhQ8M
	k7aPZ2ei3OlS9IIpv6885QJJL+AKUOY6Ar6BtyddRUXDaJiZGoTDPuoSixrripjpknoBV8I8/65ou
	Sb+xSCyK5ymlzRcfALJZxT3TYMFzfjOzZOBIuN4NiZIsEkVxz8PkVV8LJTnEninF0uNpVDDqm9Y9P
	RmwTKFgg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5ef-00000000VCv-1wAr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:57:59 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622FSs1F3224157
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 15:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FqTHsx1l1/9oEj5e3q2mep/esitBtih9Ht1cGIH4yFE=; b=bj/lDlIfTCoGy+il
	wTHLVJDnEZjglMVroeRiu4IlDmfvZlBnEN6tV/FFHa9mvQfi4tftG2kZdFw4odOB
	QHgC/A2Vc754f5mItYFovLT4Qoy+82ZYq1zKVuoN9dZvVl3LxaBT6Ope4N2uTDWI
	S964HuUTfamMVKabBkPMJmdm8Izb1Vbww7Gbwg3BNVjP6vSGiIXbbb16EDuINInW
	+7DmTHUjq5ghEUTOwi4NiGZyOj7/6iZanBXbOlhPoMxGIFrnZPt5IQ/4tOUxu9i1
	RXsdzkl66aG3uihpAdqqoHzXYB0KCjwCnMWFLWiR7QiDNJxergdycS2xSerGAttz
	YES+/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn0b1jug3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 15:57:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cbb8040f48so3888720585a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 07:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467075; x=1773071875; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqTHsx1l1/9oEj5e3q2mep/esitBtih9Ht1cGIH4yFE=;
        b=jMTEq8f9Audug3ZPC6xW+yFkRO0+OCcMo/Fo4/JXJIpyDLJad+0cSigUFO+rGAukd6
         caeWOE5poIpWjBANPg9U/JquG/Ci57CE4qj47cdVCfPxrefN5bSwXOcN/Jy7HeZqt51e
         qtMoz8sHiu2xdj4x4tPS13TgtCqPnsTTn9ItV+ZU3GB+d5xhaQ4qwto+1Bf1rdm7OFf3
         8qnIUPLxPdyQoZrzVsfyiIwFY/cINdW95YU+pGsGfIQFFsqS4cOgHwUftg8UeVQTVkMa
         psBCs0oDNTm9RE274rr9Y2yPtnRJVoB3y4F1L3muDHTIjSqyPXWsE+8vB9fwZMplGGfF
         Xjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467075; x=1773071875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FqTHsx1l1/9oEj5e3q2mep/esitBtih9Ht1cGIH4yFE=;
        b=Qel74lurywqN21mc9+FfBZauehnMcPUtP4lbL37GUcKmtXmLb7J3yty303eWpxfC4l
         csm2J7eJefp2mXFag2AgnyhXVSlCOhnmWLuRnqzV65qNLiAFMNvWYBWQYvkuuqK6SxAt
         h0KwmTyzhn9LMu6V46acMZ9GDHWN+wQSi4cOwvcL1xRP65jIlB2Z8e4921ZT2sUNDuJj
         8cjW0jyF8WKB+6FijckrrRuNikYtz7FienFsaPT1XEPVxQeXptW6wivj0uM0m8lgXgal
         gfh6yDwlv4t8heZ2IVaeAFtdj+LelQhaXHXO3hPoMXO3z4nHhQyINmMcWl0CCYgkGfDq
         v9sw==
X-Forwarded-Encrypted: i=1; AJvYcCVFNIIdhqqR+TaqyqRDCc01UVraGNX3MTbriIyPGKe0EWxWKiE8pW8py72hEzysS0RhFXbp78Vx1IyP9LMAGkbt@lists.infradead.org
X-Gm-Message-State: AOJu0YzdmpOAYyaJceNNrX3c0Va9hmJmtyuXIFtqUbuOMBmnX1xSoM5o
	esUmfZaDWN7n7SLcv7DjN6sVtGgww7I1+HNzD4mUk5dpehdUI/Kv/cT/pC0DnUqtzZDeU+YgUOO
	UnaY/1fohJPsMI0z9N6udJEudBBpC1raXky5qa3E30AgzK34PiBgkcVIIufE4uausK2Dr/uZRTE
	GLbA==
X-Gm-Gg: ATEYQzynQjoz9v5+m5cfDB6CRT0XV9Tacae+D8r4/AtVChlVxie915J3MfUjY7PhXJJ
	XxpgzDQiy8MemV5aIopA28pP8P1xOfltaAVVxWY+czjMM2iUOUc+smHzTdsJsgLcYcDdl7/rgwP
	3kwInxEFtSxANm7NLJIbUdRDvJ8z9jARCupWnhFFCaQn2yBG4bcnjAjRifo7RwW+UlY4TEohfjO
	vLfL+0QH/ocf+IfvTS685M8Zu/epdh9+X/E4UN4J265MtjsY5OieH1hWgtk2ndTqm2X2T/iXWjc
	BcD0UEuSj/NyWRZ6cIJXOMS+En7Juutb0YQa2QHj596+1BfYrxXvesjoQgl0HLdrg6yxX3ZCJFq
	1ndCKhrp8/f8tzOdxgfaO9U2o1B549i5iDhOIzUF+w4VgkVjwT+Ch
X-Received: by 2002:a05:620a:4543:b0:8ca:3d7c:e74a with SMTP id af79cd13be357-8cbc8e6996amr1438253185a.56.1772467074777;
        Mon, 02 Mar 2026 07:57:54 -0800 (PST)
X-Received: by 2002:a05:620a:4543:b0:8ca:3d7c:e74a with SMTP id af79cd13be357-8cbc8e6996amr1438246985a.56.1772467074240;
        Mon, 02 Mar 2026 07:57:54 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:87af:7e67:1864:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm11282438f8f.12.2026.03.02.07.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:57:53 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:57:22 +0100
Subject: [PATCH RFC v11 09/12] dmaengine: qcom: bam_dma: convert tasklet to
 a BH workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-qcom-qce-cmd-descr-v11-9-4bf1f5db4802@oss.qualcomm.com>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
In-Reply-To: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4367;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZjTo93puqxgLaTUXkUuT1EliesGs2ukWThDJ46ZWj64=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBppbNsLhK1j9d23E6BouMmy1Syjsq/SkCH3Y7D9
 L29Yuvs3B6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaWzbAAKCRAFnS7L/zaE
 wxc6D/9IklHZUQkEAv7VtBKbEDjVJALH+W3s5NCnKWr7mjlYx01tUTylRIQydShsUtgX8iDbSnw
 KBKkdLu53Ey9b/5TcmdohP/R/QA94LyqnxChaXGpK2iIhKsNSfBBVxZnYCTR6/eYxSYkOpe7W+W
 4/g2fYUqgt5LHy95b92BzCuQLOPmvJtkscBVBnm8xDVo6mIR8dbnVib9rWjUXJdPO58iU76aFiW
 VQG228PnWm/7IKpeEwOWBo7mqjNBloGnQbslE8guY0vZgQZOI1GxRu7i+B/4fJ5ujSBqBZzy4OH
 oYeSzBxqP4GtJBCUUwHN5/TTdVwl+tJdskbauS604LrGvUKTR7Iv6VeAh3TPHL10eZ0zDXcVeII
 v0l6ypHc7kE6N6jXoDHPGmdGKF5uEDf+40WB8pxg++ZizdL1c5Ui8+M6im0m1+wRnbahiGl+MbS
 h/eXoYqfNa7pGBUUpP5I7zYEMJaP2h8u9Qtleyyx3m1ihJHGqQNH7Qii7TTFT41EkPpKp2orrqy
 xPivIDR5fwN9Wr7ZRe25PLYwUfrViCqZJWA0eFhTKxU+gV260LvZ9wHadoNk58Oi/atD2AGTE4/
 g6Ke66o6ICLtq4ubEVDC1iHX8mgXIImhcxP7/3QEyQix0T5U4xVdIuNeNu7WWJY09fFMQje+b++
 CvOtNPLiNbuqAZQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Vq_DQKxI4ojj1AID1dkro6KxKdSv_-9B
X-Authority-Analysis: v=2.4 cv=Hol72kTS c=1 sm=1 tr=0 ts=69a5b383 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Vq_DQKxI4ojj1AID1dkro6KxKdSv_-9B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfX0ajs7nbeU+iM
 ElZSjZylkvAEGv1n1zsqQVy3hUE5xd4h/x0hl4ZK+624iiEreTIHwlS0MSEhbm5nYOwopnYu8iP
 gzEyVue0VgwKtB6xc/a60somgOJcjBV1gIvmuiV+BiGgks3tWndHcScjg32V2xmMefji7VOjW91
 OMyglIq0YQz/7EaCjfIEJ0hCLFddH08QBYojue0kjTLmq1FOH7qiPHS0sCjpdjGQGaGMptUYPC2
 mBU2yaP1Qv/0rUWFGRFFH86DSmmyCWBlt+8tInnXmRJro0OV/I2+fxdpIMPld7lVIddx/2Ieuqo
 A8o3KAXwgU0B8VQfaiUhHwWZMdanLlk0IfSdX1/LoI72b9l+xhxavj2uNZHIFvOFFyADXfVTtZC
 J8e7cLIz1vpNl2elVLKWl3abZA3Jpo6CWCo+QY84mX2cC+chVwOjw5H03YeG+Ao0xWXfA/IqIke
 aE0hkV+bzjOjEQDUosA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_155757_951664_BAD0D772 
X-CRM114-Status: GOOD (  22.31  )
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

BH workqueues are a modern mechanism, aiming to replace legacy tasklets.
Let's convert the BAM DMA driver to using the high-priority variant of
the BH workqueue.

[Vinod: suggested using the BG workqueue instead of the regular one
running in process context]

Suggested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 19116295f8325767a0d97a7848077885b118241c..c8601bac555edf1bb4384fd39cb3449ec6e86334 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -42,6 +42,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 
 #include "../dmaengine.h"
 #include "../virt-dma.h"
@@ -397,8 +398,8 @@ struct bam_device {
 	struct clk *bamclk;
 	int irq;
 
-	/* dma start transaction tasklet */
-	struct tasklet_struct task;
+	/* dma start transaction workqueue */
+	struct work_struct work;
 };
 
 /**
@@ -863,7 +864,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			/*
 			 * if complete, process cookie. Otherwise
 			 * push back to front of desc_issued so that
-			 * it gets restarted by the tasklet
+			 * it gets restarted by the work queue.
 			 */
 			if (!async_desc->num_desc) {
 				vchan_cookie_complete(&async_desc->vd);
@@ -893,9 +894,9 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
 
 	srcs |= process_channel_irqs(bdev);
 
-	/* kick off tasklet to start next dma transfer */
+	/* kick off the work queue to start next dma transfer */
 	if (srcs & P_IRQ)
-		tasklet_schedule(&bdev->task);
+		queue_work(system_bh_highpri_wq, &bdev->work);
 
 	ret = pm_runtime_get_sync(bdev->dev);
 	if (ret < 0)
@@ -1091,14 +1092,14 @@ static void bam_start_dma(struct bam_chan *bchan)
 }
 
 /**
- * dma_tasklet - DMA IRQ tasklet
- * @t: tasklet argument (bam controller structure)
+ * bam_dma_work() - DMA interrupt work queue callback
+ * @work: work queue struct embedded in the BAM controller device struct
  *
  * Sets up next DMA operation and then processes all completed transactions
  */
-static void dma_tasklet(struct tasklet_struct *t)
+static void bam_dma_work(struct work_struct *work)
 {
-	struct bam_device *bdev = from_tasklet(bdev, t, task);
+	struct bam_device *bdev = from_work(bdev, work, work);
 	struct bam_chan *bchan;
 	unsigned int i;
 
@@ -1111,14 +1112,13 @@ static void dma_tasklet(struct tasklet_struct *t)
 		if (!list_empty(&bchan->vc.desc_issued) && !IS_BUSY(bchan))
 			bam_start_dma(bchan);
 	}
-
 }
 
 /**
  * bam_issue_pending - starts pending transactions
  * @chan: dma channel
  *
- * Calls tasklet directly which in turn starts any pending transactions
+ * Calls work queue directly which in turn starts any pending transactions
  */
 static void bam_issue_pending(struct dma_chan *chan)
 {
@@ -1286,14 +1286,14 @@ static int bam_dma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_clk;
 
-	tasklet_setup(&bdev->task, dma_tasklet);
+	INIT_WORK(&bdev->work, bam_dma_work);
 
 	bdev->channels = devm_kcalloc(bdev->dev, bdev->num_channels,
 				sizeof(*bdev->channels), GFP_KERNEL);
 
 	if (!bdev->channels) {
 		ret = -ENOMEM;
-		goto err_tasklet_kill;
+		goto err_workqueue_cancel;
 	}
 
 	/* allocate and initialize channels */
@@ -1358,8 +1358,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
-err_tasklet_kill:
-	tasklet_kill(&bdev->task);
+err_workqueue_cancel:
+	cancel_work_sync(&bdev->work);
 err_disable_clk:
 	clk_disable_unprepare(bdev->bamclk);
 
@@ -1393,7 +1393,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 			    bdev->channels[i].fifo_phys);
 	}
 
-	tasklet_kill(&bdev->task);
+	cancel_work_sync(&bdev->work);
 
 	clk_disable_unprepare(bdev->bamclk);
 }

-- 
2.47.3


