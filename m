Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991E0E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuFnMO3ijaaacswBw6QbcsmE5nKXXLvyIsQw+1GMwgY=; b=ElhUeCGtDu4WazR4HsfRsuZuQg
	uhc8BbwEcrP3dQePqE6ZkLBZnbweZtLpnazRWbv4a5dEZ6FX8pAYyfXnITjWdzlqNvQJoJQyvesuO
	GN7lFXzRje4MqvxLyk726yBVK38GMZzXsmVkq6MVAddR2swtq4l7wHSCjYj5+MWzgFhWcZT/qUXyz
	4vEx2nvRfH39HGz8l4ZqnbuCMNuBPXlsClF+WPx3kVJFTDVN10+/qOw4Qc+jmAbscL2ahA6/PN7Bv
	Nx6I/ua/EugPFjlx3y7WdSKcbzlOEdEXJ69ZDgHZzlH5v27o8FS8JlpL/lhB+8P66Btty5qiDpICw
	ThpGu+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGTs-00000004YNS-0ujx;
	Mon, 13 Jan 2025 09:11:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGJI-00000004VkC-3Qry
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jan 2025 09:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fuFnMO3ijaaacswBw6QbcsmE5nKXXLvyIsQw+1GMwgY=; b=b7SZJIdwKxiSWHGap9nDtNRj8d
	tu2Szcm4TJBM4t/B3YmUCN/ATlz94oxP7fnhGdK5QT7m95JvMtSY7/EAtDxdQhug9eHXlIVJpXbbN
	MGtXfPf/BrJ/Xdz9i+yVCSfPfjOjUK1/ERnDzLKVG96oHX5fCqrSCskVOBIumNRiX5uW2RWNI8jkw
	tBe04Dd5IHO8YMY2C3lRqMB+4M/430arlm63UCZ8yfVMrhgUV2MvcDIggEhMo7fXD216+kPdeZc8v
	tMg2iP+Zgn9Xv5svlGEhpRqaIjxe0qc2HxAf2MSx89hH7iZNUD37NBZV2DfAljUwTXpF2r9MmBBYU
	ucnNaX/w==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGJE-0000000AGpR-0I73
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 09:00:35 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D7BRLA001654;
	Mon, 13 Jan 2025 10:00:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	fuFnMO3ijaaacswBw6QbcsmE5nKXXLvyIsQw+1GMwgY=; b=Y/aX81U5DO5HpUBI
	8suxhaWBt3NvqIdy0mmViky8OmvTmu6+j2YBRZD7J0/pjnfaZGfJLOtuE7dpnioC
	waarFgK0mNyvLW9PjIeIJJVdLFEiKvzAKXXd9tZepVq3MCs0e7g1uNejplMCo1W1
	vCIaoerLgB5VUjUP+JJct9OqFuyADQtkVP/+fgsvkp6UYyKA2FJMT04Kl8na+/AS
	hMpIusAPb/V4RCpiwREap7E3Oz6obqOJhH3eMC7bA6F/LY81LA0L6ttcByniel03
	SGtmkohfAYjyIhmT90XATMv721fhFRJClZojnErcKtuBM0TQQ8vm9N9krPPbfxR/
	I+rftw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4444fmub66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 10:00:23 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7696A40056;
	Mon, 13 Jan 2025 09:59:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E811234C26;
	Mon, 13 Jan 2025 09:58:16 +0100 (CET)
Received: from localhost (10.129.178.39) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 13 Jan
 2025 09:58:15 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 13 Jan 2025 09:57:56 +0100
Subject: [PATCH v3 6/9] media: stm32: csi: simplify enable_streams error
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-csi_dcmipp_mp25_enhancements-v3-6-33b96744df46@foss.st.com>
References: <20250113-csi_dcmipp_mp25_enhancements-v3-0-33b96744df46@foss.st.com>
In-Reply-To: <20250113-csi_dcmipp_mp25_enhancements-v3-0-33b96744df46@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.1
X-Originating-IP: [10.129.178.39]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_090032_340002_A0DD50B9 
X-CRM114-Status: GOOD (  10.08  )
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

Put all error handling for VC stop and CSI stop together
to avoid duplication of code.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index 3654f9895dbc..4affbc00b042 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -694,19 +694,21 @@ static int stm32_csi_enable_streams(struct v4l2_subdev *sd,
 	ret = stm32_csi_start_vc(csidev, state, 0);
 	if (ret) {
 		dev_err(csidev->dev, "Failed to start VC0\n");
-		stm32_csi_stop(csidev);
-		return ret;
+		goto failed_start_vc;
 	}
 
 	ret = v4l2_subdev_enable_streams(csidev->s_subdev,
 					 csidev->s_subdev_pad_nb, BIT_ULL(0));
-	if (ret) {
-		stm32_csi_stop_vc(csidev, 0);
-		stm32_csi_stop(csidev);
-		return ret;
-	}
+	if (ret)
+		goto failed_enable_streams;
 
 	return 0;
+
+failed_enable_streams:
+	stm32_csi_stop_vc(csidev, 0);
+failed_start_vc:
+	stm32_csi_stop(csidev);
+	return ret;
 }
 
 static int stm32_csi_init_state(struct v4l2_subdev *sd,

-- 
2.34.1


