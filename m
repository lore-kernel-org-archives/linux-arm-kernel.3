Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A65C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Te/nt0rgj35Gj3QXpfmw/Xvw29eM07yXT69zTDinPhM=; b=uqTCFynZX/rEGo6pWxKb87GanX
	xmS6PfCh4ki0dmbas27scOaE1guobrzfakfhvjWywvbQB79TnsTepD8wY4Q48MXcaVmrBypE8PGBj
	mEDPFa4Mg9KW4rNeLoSeiUvXETjEfhWb6Bwf03ew4ea+aYJVw9auuc77xAjuWECHFqjdryiVxoIAo
	YP9YWKBgvvK1J4Vm7/Z9dD2veG1i8TbTqkc8jljV8eE6+MbZqH0Jhbg6roF5hD3ltekyfHABTGz0l
	MLpN5+6df0c5K0+9n9Mp9aQ8ctD3YfNCP3w/GZvchHKqiPhUnekveFh/ULPpV5Nk3kvd3nv1rY9wl
	EjE4bRlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUJp-0000000AEPD-2lhz;
	Thu, 13 Feb 2025 08:11:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiU9h-0000000ACDG-1MKv;
	Thu, 13 Feb 2025 08:01:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CJdemR001528;
	Thu, 13 Feb 2025 08:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Te/nt0rgj35
	Gj3QXpfmw/Xvw29eM07yXT69zTDinPhM=; b=ictuFXSFAdfufDXTdt/bvPfU7l9
	IUavGqJQqnPzjKL1ZWLFzYjglM5TshQLiO8v5V+UMYXGsODgbnFXDXbgW29JyjKI
	7Wfz4xy26ccWVcAlOTqPoPSSW3Ct7fayAnEGsfflTeLqgTDt+miMlXYHzrcPoomW
	1PrrzOqLV4RJ5U4L6uqM7ixbyq6jT8H6vGdugvntiUE576rzsEJ0Vh83jG6JfN0s
	DGPOvy4BAG46rh6KWsUmIA0Ktrmujg9ukeufTve02V4s1ZH9x7RhswNVLdYUpb1v
	VvETewzWwsYNRVtq5KIjahmyC0Y35I0Td5bw5E3KzG09Wmq5hSJ1BC588XA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rrnfu48d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:00:54 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51D80psx031749;
	Thu, 13 Feb 2025 08:00:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 44p0bkyajn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:00:51 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51D80mKL031714;
	Thu, 13 Feb 2025 08:00:51 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 51D80pPt031743
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:00:51 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 7067240C04; Thu, 13 Feb 2025 16:00:50 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        peter.wang@mediatek.com, quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH v5 6/8] scsi: ufs: core: Check if scaling up is required when disable clkscale
Date: Thu, 13 Feb 2025 16:00:06 +0800
Message-Id: <20250213080008.2984807-7-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ng-XFjBtEhVtIG9dXqBhJ1xpozRW7NZx
X-Proofpoint-ORIG-GUID: Ng-XFjBtEhVtIG9dXqBhJ1xpozRW7NZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 adultscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_000105_479880_A8D77E66 
X-CRM114-Status: GOOD (  10.54  )
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

When disabling clkscale via the clkscale_enable sysfs entry, UFS driver
shall perform scaling up once regardless. Check if scaling up is required
or not first to avoid repetitive work.

Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 9908c0d6a1e1..727ca930c2ef 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1770,6 +1770,10 @@ static ssize_t ufshcd_clkscale_enable_store(struct device *dev,
 	freq = clki->max_freq;
 
 	ufshcd_suspend_clkscaling(hba);
+
+	if (!ufshcd_is_devfreq_scaling_required(hba, freq, true))
+		goto out_rel;
+
 	err = ufshcd_devfreq_scale(hba, freq, true);
 	if (err)
 		dev_err(hba->dev, "%s: failed to scale clocks up %d\n",
-- 
2.34.1


