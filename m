Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB65C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=; b=wVDONONN2QaYDinhTgQpiZLZkk
	n7eWKKUmpxuuYsOzCIbWURqcVViDwB4CUoY9wj63zt+LnKG0oBzbL1WBuxY7pYQ//KFJkjF/1VX8s
	rvKzJYHsEceAeNTOXFXNTGcgR9nUiMVUgzLM7DKVdj3mOPv54D9mpBFq89IQWDMj5Y0/0dRodyyDL
	E5XImJUI0+66W+3+na3QOkFdaYsgXZ94asCL+QbRrNpSbWC4aruf3Vyl02qqYydDZVUjW1h61VFQz
	uneH1WkuXGzeUXPk/YwrBBMekTONCIKAw4VURSORbNI52/2ZD7TjT1Rj16/cpyqYN6tQ2N90ToFxV
	TmI13Bug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8o9-0000000EHKe-1NxD;
	Mon, 29 Jun 2026 10:01:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8o6-0000000EHIy-1lm9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:01:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6r24l2088762
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=; b=YsuC4+AsGHMSzIAn
	rmr/rPiVskzymkh+ff8DKRVStqcn57d70p3RmEs0cS3Soj8BYKxZOU1Y+g/mBQDr
	bIpaCcMTjYfPUnxTYQOyvMoCautmlkbac/MTiWh4lgs6AkBVJJ4j6HIZGz9HKQkc
	hxiQ4EgCRuV9rTR+tk4ul/j0JRkDcdCcvVvyF/Ptc9AWeBdD2wPlxzbFpuCu6Ikg
	99m3qb6WtQU82vbJubQeIgfAgMVHm5+UwhHV5MAQqD0JviBmiww8pDMjU2WNWhXZ
	9y/tJ3rwT6QveCqv+yblwCeKTuJROm8bBCqCC0jwqIjkESM/RhJddr3JbVIPYWoa
	LQt/WA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vh3u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:37 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-495e372e38cso54355b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 03:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727297; x=1783332097; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=iq3RiTXLiLR6mq6R0Xxe3dnnzHK+xqdN9JG2wmuEDS7XY+vfcAGWLfxzoeaV5wFyA+
         eq1fqBjQLqtKvl1Nj98Bxha5lyh3UvZ0OhoNsdIE7maEntlFO+qrCswe9eqF5uiM9xVm
         rrHzlFgwqkfDJI9Mw88et8mWoL1ndsPdf58pW7SRg0CuALXLVFgS+rzGSy5yxj1enBAI
         eie6ywo0UR7SNEn/yLYXIiUwpgXBP0gSY3rCCZ7Gveq8SvJltf+Z516NvOW2bGG8OKGR
         S3HFVxgIbPeZy1lAD2LkxCyEc6StIG/40I+rpvIDCorVXokOVqY3caKrsr4+2UibmEes
         00gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727297; x=1783332097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=m9HS5ewxybuUlZkBKGIuFdWyVwFdCTEMkumn0rN119jIQj7JS7BckvNMr06HaEzz+Y
         VubY+PhnB499kAVSsaMKJ8t8Hdx8Bl4JFgg8hJTRxTuXCsPOy5GTcEHgS92TKIJOD3R4
         qzwCH8pHdJPvQZdk0Z9PizvYv9bLKgdh1NRUT8KoIXWOOse8DN5/KSd0ofFZ9vbRdvI1
         POq6AW8KFqQhR3owN98iObSeeYJROQUggt6uy1mxxL06uNXulHU2s/6ZLnI6BJCdrPy3
         wSMB2N4NqhdlgMph/SS3NinrWD0lUDCwxqVD+p4RxN5r0BVvt78oDEUg1HMLEWIn3sjI
         MmoQ==
X-Forwarded-Encrypted: i=1; AFNElJ+LXHeHgxKaapp7IXSt0Zxas3bWeYp/NkaIJ4yRsprkDqcjrtNfetpntiILlRbz4RlCC5mda5t6eobwWaZqTsjA@lists.infradead.org
X-Gm-Message-State: AOJu0YzGNc/X1ratAO09TeCLFgLDp2F+WmbFD75yjH6uyw1i7Li7x5iE
	mdWHVg3+CQ4HCgWOje3pN5q6eWG3TMDOYgSHxLeovckNC9AdWvhcPwfRwqVPKHn7ycTGAUQ5Q2K
	zzXR8755WpIuzv/a8k1+0mXgclet9GYPsBEo3g7LR22qcpWnahHvtzKZ8j8Dzc7dKyNhRlghN06
	4X3A==
X-Gm-Gg: AfdE7cnX2KaDGejLIysMIiEGnyOKoN3PwcoCaKYsSFPXkXTqkcrvz6MAkpoDbxJe28M
	+V2SZfqAltp4IOWy94F1IViU0OClBSLqjAwWKMQZiL+ni2xo4WBtMgl0OLvG9yKfQgQ4/0vFpd+
	UgNY4q0uULXRIV5B+4wHNkTX8Fgo6OcLUCrqZU4EJ2AwRKlhjkmuqG53ktR4FV5VShzjIwsZJtf
	SW7FlhsA9iokg3txsQZyKbaYPUEPDRdy2fSNPYczkMh6IwDE44SUoI08ww/2+JsnScNxzmPI7uy
	v+sonpRGO0hr1DhtZ8b143mxnZFkdUyOfvOg3QTq7KoomCk2f7LG4zlxqv1vq9QPnuClbM0kJoK
	n/UJMc4MnKYr4QJh1l09kvvsrMlW4AaTiB+ZNPlta
X-Received: by 2002:a05:6808:1b1f:b0:495:97ef:b41e with SMTP id 5614622812f47-49597ff0929mr4551664b6e.34.1782727296621;
        Mon, 29 Jun 2026 03:01:36 -0700 (PDT)
X-Received: by 2002:a05:6808:1b1f:b0:495:97ef:b41e with SMTP id 5614622812f47-49597ff0929mr4551638b6e.34.1782727296160;
        Mon, 29 Jun 2026 03:01:36 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:35 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:06 +0200
Subject: [PATCH v20 04/14] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-4-56f67da84c05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4322;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HGeQqzQf8+DrUa/4bzOvLohFWS/bDVC1MPHUwVaBFAE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJrR7CPyvsenTdz66zDbeFqHDDGugXN3lznr
 16tzveSf+CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCawAKCRAFnS7L/zaE
 wwEjEAC8BxDeqzVB/FiSqLfBuyiSc+udm/QP7Ano2F2ABRLcPRibEPFFMP143fGC/RYY5oZnqZs
 2zGG48hkxWC8orAZJOotoGULoSVZ19Qe5vl4VAR0VjePneRaJT99/ZULnjxoIa3S+vGybMQ+mlG
 r9xiv7hfIJjGSua7ta5/jpQfMQ5mNPETs7dJlt7qq6nHwXjpBAfUqBgSDOjt1rVwh1mLejS5pT7
 sl1t9rcTsEuToWf3tQNMvKPofcj/P4wYiMbzt8CpM+1p/zmzjBwFGDw7i+EUnCXle5c1ldKMI7n
 pg3ZfKNmJrNfZ7HQYcvTORv7MSg+5GU7+dDIyQFUnk/71l+X1wKX63j4yGN9OPxaWhWZIT90qI2
 rUFGFQVLZeaSeuYHJJgiUxVVX2nwDwPD6FMlMTPQRcxDds15S2stZJujuBmZEPn/q9dzJoEBNDK
 YKkd9eYKai5OtBCZhZmB/Rw2cEk1kaTTXJqyI0zGv4P49wV1Aetqj134wzGm1fWLfGyqqxJLeps
 pAPqGI//pu3o+2ciKnLMJOBkJWMd015L7YaLrUOtK+zUqeIM6vrJfZGzipYm9Budf5x+xe9s4ms
 YRZWUKzVyLxTzMJXRaOoXa3CZcP1DbNFXAaSBUoOTQm5fxh26q7UVxpS6s0fNNv6NrhQ6eHePEZ
 zLyKdIitZ3HAvxg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 9BcYaOT2goLKZvZ1PkTWCale-ECciFcX
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a424281 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ioP1PY9e4_dTeLeN8ycA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX6rcNyrGIq/CW
 P6vCxZ6Qo9D7tR6Yh4Uattsu/QheGABQi3/rq1XTZqvnXH/4kLM8RzJhgF9JzPzTsOY7JP2Rpq1
 /XbrKTiHtGdOHCkOhwqZ1GS6E+Ijn2s=
X-Proofpoint-ORIG-GUID: 9BcYaOT2goLKZvZ1PkTWCale-ECciFcX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX+V7MKgPJ/Eao
 6ZXoeJ+CiMEAkDfiEWsze38Jtjd3YmGZUJ4CRAXwxVrbk5qFUEVpFzS9LxozuZDZHw7mLFy5rmq
 +HDXYEzuV8aui7FlXDBXfxhjPbPqZXn8YhyTJkE+0na/DhfzMDe1dyG8WRK7CetZUAh+PrFSl3/
 pgi2ciR8ka2EyvIkB/UwQJHC8Epoii7IlPb5m23pXOa9T9DdCFg+s9LPBwmXiCPyJTE7H1W2PNb
 bTd494m67IX/eExAT8oaYQNFO95BekCeCxya1i+uk6oCfutKDwKNHtLnM9kgmGEfgMSZuZKmFjq
 3zRW72UFKGe8zt4KVWsh8rwd47Gfh6oTddE4YeN6HGqwKS9rX1p3oZGah6siB7yNNwKF89ERg3T
 2gUDBlzatWoTS2AN7PX7ZnqH8hHCcJ6W25v5QxlDEFOLdYm8CmFAAloPuUq8G5mYg22C0J5qRlc
 T1IO1B37VTFVfQ7zN7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_030138_597037_421CBAFC 
X-CRM114-Status: GOOD (  18.72  )
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


