Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2140CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 20:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+45+pLhmRpnqwKQs2OmyisBAtmvmvvrbwhhu0F6U6d0=; b=MUDPOUk8h/lhgeltRv/9bTkkfu
	qGrTh3JF0xSHCTFMZ8jczqB2XB8pubUag5qtPnlN9Ui0OUc5Jzr0a0iE8HiVu2mKaj6li+3NwKO1O
	UcUIa02ngrCe7io4X7fJgLNul4K9JV7vhNVOae7uJ2jqZuxVJDg/3NDUfo49GoZ0L/S4qMEMk98Qj
	9VidJTjG8uUN7ajMrft3Z+r5tFLO5VMhpEXpnAZ7ne5T2hPNap9AUHkiy225rIVLaIu7QHYbvmsnR
	oblxZKre9QYT4VjjzLrAL/vjU+1Rygw60K0KVWTrsQKc106wIIbfrwjM1qE2upVBSdNGsajBl8mPV
	yQ+Z++lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43tI-00000008xNz-41Ne;
	Wed, 01 Oct 2025 20:57:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43tG-00000008xMX-0DdW;
	Wed, 01 Oct 2025 20:57:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ic7qC005598;
	Wed, 1 Oct 2025 20:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=+45+pLhmRpnqwKQs2OmyisBAtmvmvvrbwhhu0F6U6d0=; b=Y2
	/QSmcvxMQgd2cIdrqb6axjOZNWWRRyQn+PTTGYoQ4qk6ZZhsYn0aXCn+fQtNzJyx
	6ep6MFPQuWMG6/rVoN4Yl3kVP+iYbcSGemrLTP2Tdxd5g1TjoHmVMVA8t5L0cfhk
	ZOVsgUz8S496W5ZnyddeR6BYqOsgIs2Fd7HTdEPAofMGqA+t+JE1ld00Gc/tyvTw
	wah0O1k+emxfdE9c9YP963iEaLOvZYrVDEYjSdr1RbXpzGNI5FXvXE6r0YHn/D1f
	Be14GwEuWsxsS+3gWdYUBDt2yFOO8NLUECXZsaiqyDxFSnovurRtFr4tX0aTzRdD
	pUbHIs+8ZaenPCHxNoEw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851nvmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Oct 2025 20:57:24 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 591KvOlC011137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 1 Oct 2025 20:57:24 GMT
Received: from stor-berry.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 1 Oct 2025 13:57:23 -0700
From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
To: <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <peter.wang@mediatek.com>,
        <manivannan.sadhasivam@linaro.org>, <adrian.hunter@intel.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        "open list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-kernel@vger.kernel.org>,
        "moderated
 list:ARM/Mediatek SoC support:Keyword:mediatek"
	<linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 0/2] *** Remove UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk ***
Date: Wed, 1 Oct 2025 13:57:10 -0700
Message-ID: <cover.1759348507.git.quic_nguyenb@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dd95b4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=QiTLis0nzNNC8PZdpUgA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX7uMPnhAKSqt7
 MhTQGmrdaJO/ZNPh7ZmuKJGl2PpMvWQdeod6H3jOwKBPua6WiY+FMzWS9JyOCqInOnx5HyWR9vq
 oaizxr5wz5Dr7hwV09nU1vCKiv+9OUNms5tEBRT4ZR3pz8wGNeTOYO5ThCE+vbY37QoXXRpcpNZ
 62RJPNT/RamQP7SSQQeU4uGSSkok6CIwdtqMFYpD+IYKZ1WLGiPjkoISxnrje1V33RbkxiMOmlh
 XojcgY91D0eOO71V02CGXaJ6hlbMqgc3BOMv+Gto/qE278pgj/gZGjNHvBVz93CiOulUTs+qjyd
 coFqmlYk9gm6QehJN0sg01ZFmEnfupgNJGR8s9uSxb7xG76bO4EEu06ntg7z+g+BkZDW+iG+mVr
 sAqjNe3gNRso+xKHOSySTLJNmpYoCg==
X-Proofpoint-ORIG-GUID: 9Qo_BlZEcpNsFWHqs7gVQBLDAM4axfq8
X-Proofpoint-GUID: 9Qo_BlZEcpNsFWHqs7gVQBLDAM4axfq8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_135734_129824_DD1DD0AA 
X-CRM114-Status: GOOD (  13.64  )
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

Multiple ufs device manufacturers request support for the
UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk in the Qualcomm's platform driver.
After checking further with the major UFS manufacturers engineering teams
such as Samsung, Kioxia, SK Hynix and Micron, all the manufacturers require
this quirk. Since the quirk is needed by all the ufs device manufacturers,
remove the quirk in the ufs core driver and implement a universal delay
for all the ufs devices.

In addition to verifying with the public device's datasheets, the ufs
device manufacturer's engineering teams confirmed the required vcc
power-off time for the devices is a minimum of 1ms before vcc can be
powered on again. The existing 5ms delay implemented in the ufs core
driver seems too conservative, so reduce this time to 2ms to improve
the system resume latency.

Bao D. Nguyen (2):
  scsi: ufs: core: Remove UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk
  scsi: ufs: core: Reduce the sleep before vcc can be powered on

 drivers/ufs/core/ufshcd.c       |  7 +++----
 drivers/ufs/host/ufs-mediatek.c | 11 ++++-------
 drivers/ufs/host/ufs-qcom.c     |  3 ---
 include/ufs/ufs_quirks.h        |  7 -------
 4 files changed, 7 insertions(+), 21 deletions(-)

-- 
2.7.4


