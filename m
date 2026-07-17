Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7999EC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=; b=OoAC1jmb2T/Pl+76Gp4Yus4WdZ
	h0Icbq3tSSrnxCNUo6Bgn6xQXkAdMjvmBfLx8UzznSP3Wcl/kyxu2bIrdgQ1kHk9z2KBQO63UPQIW
	0qPF7Jy47nEXf+hFN2MWjemo88D+xDw7d8HG3po9q9YbSpn1lzopwd7juNJpaY/MsQflQrw7fwnlJ
	648Ox0+LYlTzfPhyFcUZa1d6qtgmcqYnEw70ey1Ba3sGAhL+K6mNMI1eTLG/vC8xEzvlHic6sC5N0
	WNeAOU/qtTQINUbDzCxfptgaG8QDX8Qx13b/i8r5TQvFZCkSMLXXO1Pk3t5oj9rKQSnuVvmWwWKBz
	5F6+o1Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4G-00000001ft1-2INZ;
	Fri, 17 Jul 2026 08:37:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke46-00000001fnF-3JGV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:37:04 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cZFN1019119
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=; b=g4YeLGiH6+ded1ZC
	dZb5TjpvGaZEUjo61tv6Q7n25hKu50vzBpod9Z4iD6CH2Fevc+wsXiXtLLYxOLd+
	7VuCwVMOCbTqqAdgR+X663s+cPQgH4RgtL8nf0rdfKcjGDXU8GMIyistlglMBaLS
	4CkP1Lx2RsmZ77oNXw6tghg534LsogPFFllUhVkBbE4/n+rGyarO8twtoDW5ckba
	gKDxC+iztUXwWgOHRgOe0gJ8JYwj4et4bJaj3BsYwxgi8zKBXxn4cA1QVYuD1B9p
	scMdkTbwzXcciGSABbXEPRYIQRQFliW7P2O9Tv6ihHTQl5OpqdqT3Un94WMuJMiA
	2ftMRA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff810f9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c2af04aeeso36712611cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 01:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277421; x=1784882221; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=HtcT2e6uGeNmwcI49EJMeEHxnnHZQnjBaH2tQQ3EyrN94gS0T3C9PG2NuLhiyyJY+S
         KwWEMZ6dHUpage9D9Et0dbqi5gFbS8HHNMQzW3rnm++kMwRlvK2EKtvGZ/rGFcBr1t+t
         JQ58VlSk7D8t7JfnJkqUwwkEiE1j9JetFN5Di9z45yCeVw0fa2Q/u/yKBv5IHYKR+COJ
         pQfcPOTWdUvphrmMbsxDGFzCqTnKJQiMUXKWSpmMN+zSKz7cwpcluY4PBJxeqF5Lj54I
         cbsJneDHLKevUW78+UywM06XQXKO5KlwEbVipT1kw/QHt/mCQTBwsIKOqJ2YSR/X1/0D
         YClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277421; x=1784882221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=mpsR3QeBJY+gFZiYgzubJIoN+GEvzs9q3WLwWdOqJYL2Almh7mi9lWxcTZKXHc3+b1
         H+LZc9nej4whTvuW9K58ecXKsk/Qry6iroI66vDB7KX00xaK8cNkk5G0aDeB/yrtZlyd
         wKtgsxUGe9WPqxZHedWudKENrvmtO6RnMNcvz/rRFyZdVVu2OxYr8IDwqIMMLzEasu9F
         Bm5R0KDF5ijoGeJYkEbdckpNXYzSPb5HqiOSmlsn2Fcb7vDBQO/M7+cXYSARd18bRsZ+
         dqwwLE/Lu4YYjE1ITBFUpxQ80GbUZJQSik3VimyQTC5d02ts6fh3uwr9U8xHp80nPB3J
         PoVw==
X-Forwarded-Encrypted: i=1; AHgh+Rpu3ncY7zbz1PXxqZH+OUKpeTgBlnnFS+MadAxZKmdDVfZ0F8M8/DjG1JoJ3jpL8lHLYfA6xUbi5VHGiLvoLbY6@lists.infradead.org
X-Gm-Message-State: AOJu0YzneWS+vbK6O3p1WJSOZeYoG1fsu88GKxmRbWDXUqkrwAN89WVi
	2wLzBvXCHeJHt/BXRdsRm/7Wi/PBREg2sQD2JkoOizMklT+c5GKaSczV8z3Sq1vvwLTTy+1OJbq
	4fFP5f+DQNdHo6xR8h/npWk37ZK8ykdDdVxJwWHWFfZ3SOHyC+m8A1GVVn5sWneL+Lop75V/PS5
	nx3Q==
X-Gm-Gg: AfdE7clSLT9puIS82PcOPLrpgY8tlqHsBWJ8hVFDTd0q6+/G+Ia7JVc5HLEnroF5J1C
	7gJIVwbjBnBrx17sU1hOEphHla4ms87EVQgTiUOq2TSOYkOTJd2W6kw5OoBoQGo/PkJJexaoO3W
	0xG4eMG534Y5jaY6jnYEd4qdIm1PnvR7Jsnn1BUqnSXd8yhgOoZXNe48xeq6FRXgDTY08Mn0si6
	2Cvs6vkTrA4mj0ON0UfsCEgUc0/gIc4eTdo64yI1DzJR2OuK+PJHUy8ubkESscweX6s/HVRHupL
	A8+nYGuoTRcZ6j9krysSmc6SCrOyi7slg5xWLN/paoadFJ8Lt0hizlUaylOydQJk4xkJ40PcXCM
	aGLD9uoz7SnDOOTFbMZUCLR2UY02KVQ==
X-Received: by 2002:ac8:5fd1:0:b0:517:146d:2cb5 with SMTP id d75a77b69052e-51fc1292ee5mr62938701cf.20.1784277420668;
        Fri, 17 Jul 2026 01:37:00 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:517:146d:2cb5 with SMTP id d75a77b69052e-51fc1292ee5mr62938581cf.20.1784277420226;
        Fri, 17 Jul 2026 01:37:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:36:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:30 +0200
Subject: [PATCH v22 04/14] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-4-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4322;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HGeQqzQf8+DrUa/4bzOvLohFWS/bDVC1MPHUwVaBFAE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemY2d5rTg5sbM73ADQjznvK2IlAE9MYo1Zkp
 HOdG6P65i6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnpmAAKCRAFnS7L/zaE
 wz6CEACJVl1lDxT4uVVOANBn/C9UPgXVvI/XRb0g+zvA9zUYyaARpIGrYalGFVY2e24CyaoQSJj
 HqaZzMS6iorvUpcfzrt/jHIImjGzemgoXFDLPeJsAOhjhT3U6HK3UJHb3oOZTabuT5l0LlCCrKi
 k/ZaXOovtp4VrUWw8wyeJeQypA2FWkqtG8HwWAI7hD7Nb+qvz4gb4OfJwfhVFBYOezrUTgbh5ap
 rLKys6MIfLWtTnbO8MO8osefGarY3gZp+4gL61nNqnMHwsYeqwUgsETv5wwrl/amod/qMTYYT5V
 o9VgZwpKO5Je8IUr/GHPsyK/t1yNjmKAlSGLym8QVvnNVw/godQqb/Gt28bBSoAiJHAdXfBU9QJ
 JnHwuV4OwWuva577d1IeSjuuJS0jaeVzrHjcfdX7rp+Rd1dtj6zrYPZnUWypjQEgKiI0xLTg7Ld
 GnjW1XMQmvAPl0Uchk3dsXISZdLZAO5l5dQs/qDZWpDWpK7mbMoCMO6+6PpY3XoqnjO4uVpg3Nx
 db0FRNSrNfMP7U9Uq+1QFbpv5+XfDezjJDqRxWrcQUnn6oR8LQsDadaTM4e1fMtBENrT9c+i6eF
 Zwj+OJdSVME/p6pOrWYKpTCwd4HNvp1Wv35VKzslRWQKZnwjCGT1bP6FqCyIQqdP9dkI/38vAJk
 Ys7ANP4lED5ku3A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=RbqgzVtv c=1 sm=1 tr=0 ts=6a59e9ad cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ioP1PY9e4_dTeLeN8ycA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TI3YNfurOUej6vwO7PNTalMRQa8d6Yt1
X-Proofpoint-ORIG-GUID: TI3YNfurOUej6vwO7PNTalMRQa8d6Yt1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX2/++ov7mqsr9
 DvRrFoM/xNeQ1ej6vlKQe+jLq0QDqpFMUsZ3u2UY6TDK+1jJ0oJf12PbcEQmjo9cRaGYU9/n+3o
 W6PUIAB5eJKkwaEw93t1hCvmNUIZAAqiTYcmzAZJ9S41eOdD+iryb31vWeA2fXMMA5zsb29wxYv
 G4BqfgCmgzOKjfGEdjmk+0dKyfNyQkFgF7JL/SkbvknbughipUGLdPYINIW4ujx8Xa8IF9V1TDB
 Hm4NUEBQkOh/dS1NH7asheKWZlljmOkh6SoJvwNx81kcD6ew7U0MG9f4/I311s18A5+CjRxi4EH
 N2+jeojH39K6STl/3d1+94u/Ue2xoj/XWDOoYuhMyQ7PAogpkUfTwO4F4PBv7vK4+r8PjClNHB6
 PewezL/er3RXO9GCfSVC2SRTJQgroq7qAMFls4Rd/PfNpeD5Rq9vlcW7ZXc0s0N4vfXSb35+EIU
 JemeEGmY67YUd6MMbaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX8xQCGZ8PEsnf
 bsqggx0L3ySg8wMkbPBn3uoRlGBGi6FOJVVolUNkXpgTYwS5tPlY/OjqbIysbiwHuoUWnpBoRDo
 IZGWcwmCiMgldC9lvKBKNi5HoY8roFc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_013702_963784_FB7DF8B1 
X-CRM114-Status: GOOD (  18.42  )
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

In preparation for supporting the pipe locking feature flag, extend the
amount of information we can carry in device match data: create a
separate structure and make the register information one of its fields.
This way, in subsequent patches, it will be just a matter of adding a
new field to the device data.

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index ea3df28e777f99c0532761b6aee6807ab23ab4ca..8ce0fe085c5fea6cc614edd692b5cfd264b94d5a 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -113,6 +113,10 @@ struct reg_offset_data {
 	unsigned int pipe_mult, evnt_mult, ee_mult;
 };
 
+struct bam_device_data {
+	const struct reg_offset_data *reg_info;
+};
+
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_CTRL]		= { 0x0F80, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0F84, 0x00, 0x00, 0x00 },
@@ -142,6 +146,10 @@ static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1020, 0x00, 0x40, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_3_data = {
+	.reg_info = bam_v1_3_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0004, 0x00, 0x00, 0x00 },
@@ -171,6 +179,10 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_4_data = {
+	.reg_info = bam_v1_4_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_CTRL]		= { 0x00000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x01000, 0x00, 0x00, 0x00 },
@@ -200,6 +212,10 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_7_data = {
+	.reg_info = bam_v1_7_reg_info,
+};
+
 static const struct reg_offset_data bam_v2_0_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x1000, 0x00, 0x00, 0x00 },
@@ -229,6 +245,10 @@ static const struct reg_offset_data bam_v2_0_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0xC820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v2_0_data = {
+	.reg_info = bam_v2_0_reg_info,
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -422,7 +442,7 @@ struct bam_device {
 	bool powered_remotely;
 	u32 active_channels;
 
-	const struct reg_offset_data *layout;
+	const struct bam_device_data *dev_data;
 
 	struct clk *bamclk;
 	int irq;
@@ -440,7 +460,7 @@ struct bam_device {
 static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
 		enum bam_reg reg)
 {
-	const struct reg_offset_data r = bdev->layout[reg];
+	const struct reg_offset_data r = bdev->dev_data->reg_info[reg];
 
 	return bdev->regs + r.base_offset +
 		r.pipe_mult * pipe +
@@ -1234,10 +1254,10 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
 }
 
 static const struct of_device_id bam_of_match[] = {
-	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
-	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
-	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
-	{ .compatible = "qcom,bam-v2.0.0", .data = &bam_v2_0_reg_info },
+	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_data },
+	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_data },
+	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_data },
+	{ .compatible = "qcom,bam-v2.0.0", .data = &bam_v2_0_data },
 	{}
 };
 
@@ -1261,7 +1281,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	bdev->layout = match->data;
+	bdev->dev_data = match->data;
 
 	bdev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdev->regs))

-- 
2.47.3


