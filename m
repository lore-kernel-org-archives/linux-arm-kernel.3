Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4A9CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 12:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2grjPa8C/DI3fEdbeP8ERixOvnEQG+uGQWOmpFg8YA=; b=MONsGEDiXn7dQzvCB5QDXrv6LZ
	hp6wydxZke1lyJkhuyALacEuZchclhIR9lU9Sqe4ayiNaFpRNIP7RvWadHccIYaND1fS/jqjTLfSK
	ao17LgWhPyoT/Pm8LqrtsnPcUxU3EweZEp0UCB7L7tXK5q58JojsN4A39Lv2s1WUNuF2gr+zpPl+8
	n0EhqytA05H5Jmau6+IcjoIqpgFM7yICMkgDezBMyeElk53lHN6FVFpa6hiCJwkZeiJbmV/Z5nsKy
	mlJS5LzrpNd6XjjCjbsMX/rU/58p7MUOUAmWLt9wnEVhMvZB9NYNIfp/hCyhtu8fbm9/YVqO5GsoP
	VncoFfTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcixs-00000009AUC-2WDU;
	Thu, 25 Jun 2026 12:13:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcixq-00000009ATV-18DY;
	Thu, 25 Jun 2026 12:13:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jtb21454443;
	Thu, 25 Jun 2026 12:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/2grjPa8C/D
	I3fEdbeP8ERixOvnEQG+uGQWOmpFg8YA=; b=PPNhxlrEBBr+X/wjzrYQlQqF++o
	ONCK5rmpgekR1NEDpELxEtdaBodqTeYxOzcqEPsXdsbpOSoC4zxONt4EBDhMCylm
	vAjdsQXmHmYM9qiXuI1aZtK8LjcoG4blYJh1mOittmgiunsu6fdgxZX/6AKtYO9w
	YfnITxdmYVARxgGPWEY1u3YOK7jR213G76eLe/0Ol2xhPAygI2smiKymjBJPAUFC
	ysmMYqleZOeif2os5HKAapJudNBSnNfLRqq9gZXzxhslKT7CuJ4SGYEagIToCo6m
	v1kyesQvqrRyeHi+Mwc9Rl2g2OMAzCw+3lRXqxR1Ma9hhHDt1JAWtKRyWWQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbuj46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:13:33 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCDPGD006774;
	Thu, 25 Jun 2026 12:13:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 4f0q1qxr9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:13:31 +0000 (GMT)
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65PCCe2t006178;
	Thu, 25 Jun 2026 12:13:31 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 65PCDUFp007258
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:13:31 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 8F510620; Thu, 25 Jun 2026 05:13:31 -0700 (PDT)
From: Can Guo <can.guo@oss.qualcomm.com>
To: bvanassche@acm.org, beanhuo@micron.com, peter.wang@mediatek.com,
        martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH v2 3/3] scsi: ufs: core: Always run tx_eqtr POST_CHANGE notify
Date: Thu, 25 Jun 2026 05:13:05 -0700
Message-Id: <20260625121306.1655467-4-can.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625121306.1655467-1-can.guo@oss.qualcomm.com>
References: <20260625121306.1655467-1-can.guo@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNSBTYWx0ZWRfX4S3NFRn6q6ki
 7SYDLjKI89XfV5/y5Qh7Pg082Tl7MiRiwafAOAMPnepF/n3nuuoyi/g0xg8yideqgdwuSfL0DDU
 1eFmQ1M48gJNQ11A9Pg2bO9Hcm/h/Ec=
X-Proofpoint-ORIG-GUID: nUVVHNl8dXIiyXCxfxD-bxCLmAs-kTUD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNSBTYWx0ZWRfX0i2Fu42f+Ymf
 Py+Iqw0jfiWA6gJAwImvtPiqbQPH4A3z1AJZM+ZZFLzsJVsloyaX6RhPKGU/+Lnb/EqenffSBzu
 BGR858pdSTw583emlGF1SSpuHCPLnbWGbKEBsZKfQMEpCupUNoh+qdWJwRrOObeZqCmkkxnu3D7
 N7FINcOpH13dVl80XBQY5lSEQ/MKJtXXuTY20EC20obvqqq0D1egdIo3VOhpSmRquEoxGZjQM57
 B4MWCvGx9dqLW1mUt7IBr6yb/cE0Fx86kUlE0Ip+BCHt9FQnu22cflO5susNP4IkmZ8Dke1a+kG
 c3QpKFIk+1oogbMF4/X10KENTWLp4rAHCWG5NQZANvYomDfUbOSCgnCSTBVDV7p20qn6ErOH+w+
 4JvJht+1pfzyMcoHqQFs6eQrgw4uQ6OLS1zKY7saGUPm25l3mo9DMjbMNqly4t6ibOmDpndziVX
 AD5C96z5KD2P92kBN4Q==
X-Proofpoint-GUID: nUVVHNl8dXIiyXCxfxD-bxCLmAs-kTUD
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3d1b6d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=mpaa-ttXAAAA:8 a=EUspDBNiAAAA:8
 a=k4jP4d6HZhLhPJ4VD8wA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_051350_312638_7F85E672 
X-CRM114-Status: GOOD (  13.14  )
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

ufshcd_tx_eqtr() skips POST_CHANGE notify when __ufshcd_tx_eqtr()
fails. That can leave variant cleanup incomplete when PRE_CHANGE saved
temporary state that POST_CHANGE is expected to restore.

Always call POST_CHANGE once PRE_CHANGE has succeeded. Keep the TX EQTR
result as the primary return value, and only propagate POST_CHANGE
failure when TX EQTR itself succeeded.

Log PRE_CHANGE and POST_CHANGE notify failures to make variant callback
failures visible in TX EQTR error paths.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/core/ufs-txeq.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/core/ufs-txeq.c b/drivers/ufs/core/ufs-txeq.c
index e1302ea9f27e..7f908ea97ec3 100644
--- a/drivers/ufs/core/ufs-txeq.c
+++ b/drivers/ufs/core/ufs-txeq.c
@@ -1223,6 +1223,7 @@ static int ufshcd_tx_eqtr(struct ufs_hba *hba,
 {
 	struct ufs_pa_layer_attr old_pwr_info;
 	unsigned int noio_flag;
+	int notify_ret;
 	int ret;
 
 	/*
@@ -1252,14 +1253,19 @@ static int ufshcd_tx_eqtr(struct ufs_hba *hba,
 	}
 
 	ret = ufshcd_vops_tx_eqtr_notify(hba, PRE_CHANGE, pwr_mode);
-	if (ret)
+	if (ret) {
+		dev_err(hba->dev, "TX EQTR PRE_CHANGE notify failed: %d\n", ret);
 		goto out;
+	}
 
 	ret = __ufshcd_tx_eqtr(hba, params, pwr_mode);
-	if (ret)
-		goto out;
 
-	ret = ufshcd_vops_tx_eqtr_notify(hba, POST_CHANGE, pwr_mode);
+	notify_ret = ufshcd_vops_tx_eqtr_notify(hba, POST_CHANGE, pwr_mode);
+	if (notify_ret)
+		dev_err(hba->dev, "TX EQTR POST_CHANGE notify failed: %d\n", notify_ret);
+
+	if (!ret)
+		ret = notify_ret;
 
 out:
 	if (ret)
-- 
2.34.1


