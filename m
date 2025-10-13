Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CCCCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 19:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3DR+Y9YeijrAcC09e3k/rjlsd6433fk4E6uM23VjGwI=; b=TAHe3/hjTsvlS/cSBVuIW9nHRw
	O0x9uY6Zrsn2PnHLY8mMcZ9SwhRXfO2EOdgHk+OEjObfUEW89fZoR7dmjkMR8fJcTUd1p5pW/qz9p
	kMxmC324KJefTW43tyDWJxCXtd6DsfYk4h6wiKBB0Q04ZE6WMj9YflU5Jx2AqSCjKJ4/giwcU8QXw
	l/yxSqS2EKwNrDV/odYauiONA0+kFgU3q0K4M4ldSP+e8EP3F7EYU5kkQ6rC5zQudokKuOWZEI9kT
	HePNyAs2cA+gO8dt7bURHtH/F0yXxatmUHMU6VQrBaG3hn8k829lsu11n3fd1PbeFmFhsAUtkVDCu
	6vfgX3zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ONg-0000000EIzy-2rwu;
	Mon, 13 Oct 2025 19:38:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ONd-0000000EIyf-2OLl;
	Mon, 13 Oct 2025 19:38:50 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDo4Q003848;
	Mon, 13 Oct 2025 19:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=3DR+Y9YeijrAcC09e3k/rjlsd6433fk4E6uM23VjGwI=; b=fw
	yEyJG54PuJfi53ZzL9CLPGrjBt0CD76KYBqQW8fLEnzK2WdqfxKrhJKaEL2/0uxh
	CZLIN2nXwsHmIQ93iA+AILHgq52o3gF6Rq5+gMKtTwSy7wxayUkCrS5DXZEtetGC
	Hm+sJerb7YmJhkaKyUSK1wLybJIjnbKrySqA2rpbb9pVsXWVyzAbM8VfYu2bJS6q
	1icRqm7jYQ9Z5oXlCIQBfagCQxssBlIPrkkV9gKKKjQFA9eZwkBcGJ5i8EiTbB+f
	UMGsAaP6HGCpB8VehriDebbtKCy6B2Sz/MYzbAhXokeF2ZOukXZ6zoIOCCZ0a+rE
	+9xc/FrSjEZgRvDHIeqQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbhwwd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 19:38:27 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59DJcQPZ005298
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 19:38:26 GMT
Received: from stor-berry.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 13 Oct 2025 12:38:25 -0700
From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
To: <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <peter.wang@mediatek.com>,
        <adrian.hunter@intel.com>, <martin.petersen@oracle.com>
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
Subject: [PATCH v3 0/2] *** Remove UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk ***
Date: Mon, 13 Oct 2025 12:38:14 -0700
Message-ID: <cover.1760383740.git.quic_nguyenb@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX1ra6uHgtO8ZF
 EUrwbHxIRfytshlSygmzeDQ/EoY1Q9yMmHxyFPhauo0EQ5NV4E/9kupUzBYp6OAcz4R4cFgSusY
 +1OQTK5+SDWHKDYLmdf/yzKKVTflfrEsIsPeUBrVArmiP1VU7RGOmXHbrGg6NM1VdTXcLAsrDQc
 /5Us5ParoPd3FQH/F+5AzXawngJEbVPmLRIYJzIJdJ20R5DJJa1g1KbczZHGim67Qfa8HK2oUF7
 U8uCI6KO62kOqUXzCzr1bC/R1rNe/wG3inQEFJYsa0CEREU6QlRz8E2F/h6dkcnI2KarrAboJWj
 r/0CC4J+rj7cJzFQVWS52+p6wGxtkj9KQHRrPdg25PoMhnm+3fxcUn5a5OOWgKPxfsauEkK+8kM
 b+/F0AleoVis8XW+vkA80/0jMHr9yw==
X-Proofpoint-ORIG-GUID: YDACFd5mVpx-cI07geh5FyAw2yu0OTWR
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ed5533 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=EGZWyozpdK3AfW_iKrYA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: YDACFd5mVpx-cI07geh5FyAw2yu0OTWR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_123849_725195_8A6EFABC 
X-CRM114-Status: GOOD (  13.71  )
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
driver seems too conservative, so replace the hard coded 5ms delay with a
variable default to 2ms setting to improve the system resume latency.
The platform drivers can override this setting as needed.

v2 -> v3:
        - Rename sleep_post_vcc_off to vcc_off_delay_us and change the
          default setting for this variable from 5ms to 2ms (Peter's comment).

v1 -> v2:
        - Added a check for vcc's always_on to skip the delay if the vcc
          is an always-on regulator (Peter's comment)
        - Added a sleep_post_vcc_off variable to allow platform drivers to
          override the default core driver's setting as needed (Bart and Peter's comments)

Bao D. Nguyen (2):
  scsi: ufs: core: Remove UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk
  scsi: ufs: core: Replace hard coded vcc-off delay with a variable

 drivers/ufs/core/ufshcd.c       | 15 +++++++++++----
 drivers/ufs/host/ufs-mediatek.c | 11 ++++-------
 drivers/ufs/host/ufs-qcom.c     |  3 ---
 include/ufs/ufs_quirks.h        |  7 -------
 include/ufs/ufshcd.h            |  2 ++
 5 files changed, 17 insertions(+), 21 deletions(-)

-- 
2.7.4


