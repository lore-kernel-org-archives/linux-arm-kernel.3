Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A972FFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 09:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+gmvqmnx6Mc+rqdGbk0x4TnThgU7BC6K13sY2POFME=; b=3+FM/iD5+L7kfFdkou3h6uEXKw
	JWhaQgW6g7uEc/j363uiiZSMantuJfT8rLxqFkEMnWutYhcwIGJQhcsqvz95DtmBc5lyTzsMk2MKO
	ullB7ieE5YudNBVlp4gMCu+JxSn4Mf9Of90eNetYa569+E//2hY+sPZu0qwMhmZMbMMy5IcbrVGDT
	w8IsyaoqmfxMQJUDkbllNUjt5V2eM59evvu6WN86c6GupVBNAAigf8JF3iq4T+gaDGSbv0hZn6FX8
	KD4n+MZD0lqRWTM5rhzut7Bc+iqosQEpGPPcVwpPNwXJUdlo4Z6s9Mn/rC5Cip1qtSYHpI/rMddH0
	k3A2oWyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4e-0000000GYgU-0nhU;
	Mon, 27 Apr 2026 09:16:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4U-0000000GYa8-2pN6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 09:16:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TL9g3681952
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+gmvqmnx6Mc+rqdGbk0x4TnThgU7BC6K13sY2POFME=; b=ORXSPtIWxJV7IuuJ
	/RRTnqugcNIN6TfABsZ0eTWgz1GdCVAMpekbsDv2QMnobomjUyUhOqTRo38nNjIn
	Pm2AvdMdZOd7meNsxahcKAKq1Xm0OCa4MgrNG72038cAsIYxOyLmz6tPMtf1ahJU
	2+HLizCcSglVxJtqJ2AjmqIhxm+V7h7Rwo/7JhS0SWShf8DE7E1gGdhIv9aj94sw
	qEXzGUo9asd3/GcoANP1u/tar1ntkgdklHXi2AWaBoT5LB/7PUaoWNq6w3E2pbqJ
	elAfu1/hnCl7EQjww8TQCbA2P8bzRR+cBuEbsswN6AqiA/KF0d/c3gf8k2JZTz/S
	Yje/Dg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpsgwad2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:16:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fae95c82cso175526831cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 02:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281365; x=1777886165; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+gmvqmnx6Mc+rqdGbk0x4TnThgU7BC6K13sY2POFME=;
        b=CxfY33WyIZRSIakDHru4Po0mu0cZU75Z+YDsd5hwHhdjTa9/s8pKD7gAJTz6Hz8z3E
         I2XtogvbUlCUHbFJWaqej+2HU/JLj171zR6moYriSi5gukss4wJf7R+fh2vMuS00GwJ/
         3W/evQhWtacqiFfUyY1mmEgAdiRVPc0t1WHYGxNxVOcQdFgpMC/dHlw3LjcEcwYd94eA
         LgwFg3d1hPt+jgyrSzqgkDOvHjcfYSRDcbxza7JVGmE8qjgiB8H8riJ1PhqeWWUTpP2/
         yykY+ruzA/ZCE6k0Y/k331uJHQhOpVLjhDhc/f6rtTuvohUx6N7tjxNTY11cm9+1oroP
         UFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281365; x=1777886165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j+gmvqmnx6Mc+rqdGbk0x4TnThgU7BC6K13sY2POFME=;
        b=HoJK1XtLUIVxG98NtF9nzCGIg43DobYj7xUAFZZQ94VSKhxwXJ00QxWrTxKK+7/vOo
         Lvjd4Ivl/KlGM1g9RE7emaULVscaFXODbOltC2HF5ItFNha/0lI6jh7egDkTHAsfKnkA
         u0oyYMLUBIH9/X07xScAJYOH32BHb71bQN1ZYBP7AwU5R709F2QPhmo6/hcOpa85A93h
         TfFt6Sgr9NHODDMo1r7Rp+aDwvCdRpNGH8pC58NoSeeE9uuQY1v4l5nrVvRDgSobnbaf
         vUg3rYR6712mrhOJILgbCGSdbE2uQkyi6KeOg43GOqvg8nXhvDbqyna2gGVerSdlB8rW
         ymEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9e2Yh4fd49mgD/ZQXli8376Oy10oXTmk5/cUEEUHdpjoA4oK71ypFYGpFQaJqF+WOOUpE0J+MHX15oPt9x7qEE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3z8RH0RT74lJAw2+VLuiZk8bNYriqc98GtweLS4WBCcfKiJoG
	Eauj8sDLPaPT1R37gdtnSFnXzLVULS9/0Nh0sFR8DvI0M+QulpPxF1W9qpLRKpfwWXSMsNpnjuv
	Q66HjAoovmZvNpnLxOht/72neHbwuPU0zoZAoOB638wIzgGdkjdxylbhe+E2vrObMWEJofhSQ/M
	6FtQ5QGZC1lA==
X-Gm-Gg: AeBDieuTMzySLCqrvXovGMdO8cGOypJ1lF3AEOKACLj2BShayznAeqZQM0D8HVNSBfe
	by0zhSCSvb8ax0l7GEOLrbBgLAoncHPso9jYS4g9kzutYUMAU/kJjzGWUsnFZ8dC2ZOWDtE8ESV
	ECjSfDQbyidmQdmrwxMtu43LWofotlJPRftGN7/AqfL3VyK91bDZ66nFtfOFtEaHbvgrmhQI3QQ
	4ZaLQsMg7b80VAQ790CzqzIEUWLQmPITgN20hwC91Gqy5ur6XzmtJGMTz8PrEdHna42w6jr/im6
	BuZWnLammr0Fdjk1c2tvXxJwKtFdXg1SOxWwU9S2onNBnGbYwKA4PZONE335ZZEZEul7ykeKDwr
	HNEP4Dn23yx2u/zsmOquwWBPDBf5vU2P2cOzoYtIlE5dfjfIU8opD1JQuu3nQ6A==
X-Received: by 2002:a05:622a:5a0d:b0:50d:6baa:9e8c with SMTP id d75a77b69052e-50e36827a5emr609405631cf.12.1777281365184;
        Mon, 27 Apr 2026 02:16:05 -0700 (PDT)
X-Received: by 2002:a05:622a:5a0d:b0:50d:6baa:9e8c with SMTP id d75a77b69052e-50e36827a5emr609405011cf.12.1777281364712;
        Mon, 27 Apr 2026 02:16:04 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:16:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:37 +0200
Subject: [PATCH v16 04/12] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-4-945fd1cafbbc@oss.qualcomm.com>
References: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
In-Reply-To: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EVDb1irXK/80h7Y6DY4Kfs/+E6/12M9d/9hBrF4TLTs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7ylANBJgsPFoqyh8BK2lOX3d/GhX6IZh5Fnni
 RkwFP5Yyc+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pQAAKCRAFnS7L/zaE
 w0qLD/9vNJV15ERL/9ppPG0E99fiIcwIaLtLXqsMIq4NvWtdsmtkMHAwukRVXIx38tz1piI1hzk
 7Wm4eTe6kHd+9of+2g655fstzBkPxb6w8ra10bE54ed03ePaaaIJL1GjSkwZ0Gq36ETnXQbSAp1
 xD1O4zbz25K45kiu3pSH31JhLAncNo+kY5xPK5k1BPFoHSvJSol4+eb9NH/bWf0wdRxjQXlX/4q
 DJcRTib3kaVCabGNdM7nwzLm8MFqGn3cECYDh4JIovIbEPjyezqeXNYLa81zAsD08E90wCSQe2N
 mZFA1+Ad660XMnd1RTSxBqJ8P8fG9MxSWuNIRlCO4V5VK7YN1zeUFVBvc37LYVlgCp1AooMqyRn
 V91Bwx9eytmDvVeLTMj+T97f1uyfhnBTfhdUhehFoMrHF1AlVU0PRqfGlJPDa0crQHD/q1DEXWb
 Uj86aAQaNZJqxLKJ5Fnm8sG13xa2LePKEO8LF/9V4rxItDbXhCTa0Yjwa9FLfY/RSS3idqULspX
 4P2zkwtPOGkmBzw1XY0uA8wLa3LJgPCo+tarAA9O4FqhXgNd1Duh3iRPELSXuLNl5dxqwa6Tc9Y
 U8TL6Wn7Q2/BQi/ISa7NDRIcktBGqEMLVoBmVpmLea8W/AM41PC1IXAwNm1UD9+D0qEjZxoCDJJ
 5u1Ei6vYPi1Qj4g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 9rbR6VPSsfJtsHJFhEWKpUVSYNvEin7p
X-Proofpoint-ORIG-GUID: 9rbR6VPSsfJtsHJFhEWKpUVSYNvEin7p
X-Authority-Analysis: v=2.4 cv=Y+fIdBeN c=1 sm=1 tr=0 ts=69ef2956 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfX/digtANiCMwx
 Z6V2FZf3vuXJUXXZtAyA52xE13kXtWrQYsVWQveZZCl710tY2E7yOlF8W24+Rmp6cFCyMqNHTmh
 Q/LS0f0p+IIWV/4ic2jdse2QuoLv6HBahBkX3EoqkR1DN2+3d3jvFcobDuXVVgwusTbDv2wE3zE
 Q4YGbT9By/tG7r7KceKyoLPVPlkkkHMidyP0r0eEVY3j3Bl6PbASM8fjQ2Cg23A9ZzviDNiUpt/
 2sEyeWGzTu6l8VGGFxPh2OdEw66a9XdLAQ6I+py1Q0+WURYXb9dnbGQtk3ybDZ/gOBsZkzkAv7P
 PEx1ccpfvOPL1bStkTTV4mcA+oUC5CQ1vgf7lCCtycRuw7UrOW0zey46QxMwIkVT7J35gOaeLkH
 kbb3/CsrfGWZSntjehXrt7qAuwJikwVWd+nYV21HZ5xgHe8ywxlLgy5l7C0LpC8aOmzUFV/J/BF
 Oi1uvQVmZBZ8tFiO8LA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_021606_722688_1AB66950 
X-CRM114-Status: GOOD (  15.40  )
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
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8f6d03f6c673b57ed13aeca6c8331c71596d077b..83491e7c2f17d8c9d12a1a055baea7e3a0a75a53 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -115,6 +115,7 @@ struct reg_offset_data {
 
 struct bam_device_data {
 	const struct reg_offset_data *reg_info;
+	bool pipe_lock_supported;
 };
 
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
@@ -181,6 +182,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 
 static const struct bam_device_data bam_v1_4_data = {
 	.reg_info = bam_v1_4_reg_info,
+	.pipe_lock_supported = true,
 };
 
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
@@ -214,6 +216,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 
 static const struct bam_device_data bam_v1_7_data = {
 	.reg_info = bam_v1_7_reg_info,
+	.pipe_lock_supported = true,
 };
 
 /* BAM CTRL */

-- 
2.47.3


