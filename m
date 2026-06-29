Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD01C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=; b=QJq8vHAcAWDPyewak/22mx1PvK
	2t8HLfXbkiATY5sgzwUB/Maj5VHW0exvA0JVc/Ls/XYtS26VH9w5vbHmgGsWys2rZs4Ns5M0B6hhE
	SVXr2ejt8vRHq5qFHowjDBCWjs1uEixOaNsUg//sPVZxynaYKV6hQn8SpdJC+Y2jdUGRFIKRuXVVo
	9g/8Y1Zjx8Q9V9/ZBHRolxNNf5SUxpGVtfU1Ly0F/u0GutDHa04vS6YHXz9/r4uHAwviQALQUZlUU
	OtILduf958GDwZgSDmNNNEl/10nJHiaz+XPwPGa5bmOt5LiDJWZCYEQbp7Dwn3PySl0tmzI2eXcfL
	3R96VqqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8oJ-0000000EHSG-2XNt;
	Mon, 29 Jun 2026 10:01:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8oC-0000000EHMV-0awJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:01:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T91Qfw2400938
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=; b=UI0gMh7G9/BxQuDe
	2oTQhN1GZDkR6J5JyO18ZkYYzav5oG8XdQ1ND4iD6FZLwMWX7yZOjvm1YKH3Yp2F
	KDFjFFILjqtmeVTt4IREZyzipndGDH/C8Okw+I/7+x2Ql6SoPVJmDwttWkB2CPKJ
	o61luCPpFMqS7ci2GBmcupRtpLgeq8H+bpqX5TOFIk7mq2EDKrS7oApu0mpz86YZ
	t1wuXOgcNYDT+PB0bA3z9YbgAm1OkDgg2jx9XSHVW0zsk6L4h9dCTNnqEaRVhjvP
	qHKJav34vUz42UIX9BOue67rLI9j56XA9yPMkgazCVXFxoQoN+bqd41BUZY+Hg++
	bOZ80Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq888bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:43 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bbecd250b7so1166201e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 03:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727303; x=1783332103; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=bRr+xBTvvchXoCEQgbgf8JLqdZvOQCZA+BMQiOph2D0HIe5UBGpg1J7yLky0RXniY8
         yO/XGw8T8MWiJWgJrrZYN/Ko2UxYP5OVJbPUxPaV2VYewfXPEOG5HDIhy02idwOaqGh5
         JzkGW7zfnSRkruTYZ3knAAVmK3orSxnfhN2xlA1GaiswMhOLJMha5YX5eKO06MK7G0RG
         adp9jvEpdotpnO7eXTorxkLyS1QSGK4jwc8rJ6WsqLFyslY+XzoW/Nf9TL/weM39znIN
         oU7xx3KYZ6POnOXPfbEEuqZ8qyaN3b6ighHYUBY3yINUS7/k+5weFt25Jl48q9iaeVSI
         IBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727303; x=1783332103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=IGLcJAhQllQ0eDGcKHvQxFd234/RYmaYDnBh/FVzwpy7af9wVqMU7zpNnZlfRLlOfN
         4mth9LGUeymdvQFOEhqKpKvLMlrCWYM7lbSdp7HfFF75R8iWdxufvRygSqA3qFyfffQr
         DQvJRROivbNgS8eQgIJeMCLGLDNkDfvy2LbpRvgcjCI28fCnRP4l5UfmJnXSdCGxTCjf
         RfTgt3k5wv3g/ohGTfT6NqcluQixUW/2FwLWyZ0d8Jh+raHrn4E7oJr8dv/WR2izjcJ6
         Hoix48elJDMfUsQUpE71H7c7s2uZv99fgG8pEJhGGDlExabMJapWRB4A/ZF9wGarcupb
         /7xA==
X-Forwarded-Encrypted: i=1; AHgh+Roduk0oo5jDPcxSGBPeOrMm9HApza7EdzX8uTH48NxD3vimEWVFf+NO8fG/iZFlFNO0ytGPD2Eo2yAxB97SZCVf@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr+IrZqpOI1jSE17nrLbTGNWUnHxFcSiq6dKz6IfFXwQ/ct8RY
	eQ36npnj07eY0BYcy0qEIJXLs7At0TVbuW7HgHqsgsbpEGsrKdaxCwH5f79EQEYKfAN/AqzUErB
	Mw4XClNvg8iJHZ9MN9x3WUF6LfW7Un+tJctNNBKDVn6YHRK1dURAi1ANKLW8CK7nDmsuhuQbCrC
	IMNA==
X-Gm-Gg: AfdE7cm4ATPw4QHk05Ilnv/uMsgjbOoDJGaN/nGyN/FTd6Sw4/tVtZgxjz55/WUYRV5
	pimenPqOMpmgvPTdfiwmLLw1IShgYdNCN8zQOHnfQQgn1byG3+EPWyhkdLmxutXQy+jRtrCrqv4
	Qemm9/16cTqcP7gT6zRBTtSE+61qOgOCJxeN8F+vxbg40418s7w7BU2rTfGTbaDdtMcthlP0Kv0
	BFtSCHAUWq66P2PJA+c0G3Puo+sNj/y/ZyCmuI0aRmryoPGV7y5VUpKZfh+CxwIJmk6MGabwbMW
	dlK6W0xOgGr2EWpup5qfE5dmUq0xzyb9EpGDyPntxb71m9Hqbcb8ARH9mxgPX/Z6SPoG7gykfPV
	NN0wYB85rnIpjvzcVkB7qncM+jqWW9GGDpZ3lwsDx
X-Received: by 2002:a05:6102:2b84:b0:720:7e04:b306 with SMTP id ada2fe7eead31-73434037ba5mr5559563137.5.1782727298356;
        Mon, 29 Jun 2026 03:01:38 -0700 (PDT)
X-Received: by 2002:a05:6102:2b84:b0:720:7e04:b306 with SMTP id ada2fe7eead31-73434037ba5mr5559506137.5.1782727297785;
        Mon, 29 Jun 2026 03:01:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:07 +0200
Subject: [PATCH v20 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-5-56f67da84c05@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8sCOVL39BX2AFiqeGpscXeG1puX7rtAOjEFEhJGJOUQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJsmv/o1deas2zWEHYrq8lFB74FXE5e17jFN
 KDp7w5BZ2eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCbAAKCRAFnS7L/zaE
 w5mDD/0dvYsn8wcOxoenL45TBXSA8eIJDIl3WnXKcembWmr26XchibGSAHvzgZJctIVAo5xCnMx
 7+Edz2oy35G5iWFqChbqYmOWOPtmX9/67YoQ4FoEfxLgbcfupubEkvaWaVMECA3Pwp1Gb+x+zlC
 +1zjrfZdDGt7rQXLiDf/Wn/drI4XdP83uvvKckIMshgyANpYJg30TNf4BqDWW5RYbfJgkODHDH/
 /Tn4M76WYCpM4yAvguy9VyuN0mwwf0h3snS/klxm7ak95iUvTwT5ajSzSA1OZq1inYpL2zlOfgu
 1ZSPMczAbt/yJHNeW0+qk3SAbOEL41DKRu07/fjNy/6ppBp8hLc3tG+SRBGSMKyjAUEvHyJntCP
 u0EwNeEhCdATHfccGu6mHCdzz6XPiwEAOwMyo7H3x+oExfaJCA7A+TSid8quk13UvJ/WfWcvDfb
 1HISaclIm7oHGQlkGofN2HBon2I7yRTDV2PH6Oymxq3K+Z4Hb4cnq86zLu8ObzLpi0/hCxxHDYJ
 L+P5FXXnPZ+xnHgDczHNHX6J4w84Ql3lDpLPtlLQgRaiRO6kTD50G1a8V6AuBB7Toq4tW0gNKlA
 7/jLfL748dBJy/CncsCWcE/ZsVAmFY6e3Bn5Bb8ttFurbl4Hq+78K5JWaDhH0ecbY/N4oCWll4M
 ijiy6x8iosCX4sg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: GlgCWIyT1ZKlOZKEPOxkLxX7NZeLpHOz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX8ShE526IjZbJ
 /3z0h0zBCWvz8CfVhT9uJWKo8A+0IDscybxVcsrTlUuKbZw6mlcZm7N3aBviWncFlFX5NmzLwKl
 eS3sZQhGYr6q00u826QKlRfYRyY2mjE=
X-Proofpoint-ORIG-GUID: GlgCWIyT1ZKlOZKEPOxkLxX7NZeLpHOz
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a424287 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX0IRObeQy1put
 fLfe95F7dTey6kq3/PdgTgEbaLJxsdbvJ3mFkj2ibMddA2L2upjrfQo3EgqeZUHmi0Gf5jQtHhk
 Szq2WRL/YT0M1lXbxylApTI81qqPwayknlzMebI1+Z6R4YwyuOVqZPakOMnhVc6w3tCE9fUys5D
 VrmaQPkKPWYEyw3EOQYPB4virXsExVriT5jcGXnoFdXSfkg8U+ZVA60junZGexj6XrZ078wQ8lv
 mQsJRPwQdPdQQPE1w+Ynyr3KUZ57U3qH7cbWWDbZxq2Niwi3Dr0MP43tHwvOKF+7YxY7hJIVcdi
 +Dc8iuSN2orzaEmFyl43vpPSi6Mhi6EM/QdbnK4Jf6rxHGxdzzFmXPNiTIO+ljjcDkd6B8xpYPa
 s4hjg+BmND4ASpJJrgt432axvr+40ddrycoF7GYJvkUG9wGACEgvPhXADTqxOeZD/HVhmuPFx4f
 HnRpx5DmXwOANMtgakA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_030144_207533_6A6241CE 
X-CRM114-Status: GOOD (  15.54  )
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
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8ce0fe085c5fea6cc614edd692b5cfd264b94d5a..f3e713a5259c2c7c24cfdcec094814eb1202971a 100644
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
 
 static const struct reg_offset_data bam_v2_0_reg_info[] = {
@@ -247,6 +250,7 @@ static const struct reg_offset_data bam_v2_0_reg_info[] = {
 
 static const struct bam_device_data bam_v2_0_data = {
 	.reg_info = bam_v2_0_reg_info,
+	.pipe_lock_supported = true,
 };
 
 /* BAM CTRL */

-- 
2.47.3


