Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB9DC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 04:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I83MFnCiFXCiIp5e2+LBV1sV8BJ5k9xK1eQKah6+dzI=; b=Tj4NNrlXoG8PMcs4dabHVnqbVb
	cmjgLzMwrzkHcfl9/Yaqz8yH5y6OgKxlqvO4CvGmTj1iJSe2Y6lLkM1G+76ujm5/gDVoeFDhS7MVs
	DNUIGzZbYlZXLh4FUb3PazSjPvkOdK9L29L6kXEn+CO4H9lLCLcIFZb52n8R5D8DsP0cywBe7UPpP
	DYhtFc0783ETdbuWAFDV/VOGt9tigACb3pKB4IJkq/ifBJbBL+FUdl03xBRyQbzZ1ZK3IvNp+Wmml
	wHjUgaxxpKgC3NQK+jFSZGxdLRcVp5fQ13vLvpkeTc69cP846F7uk3XPebHnnQGABjLgRKhFs4h0a
	ok2pJBtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhLCL-00000002tnJ-0AI5;
	Thu, 31 Jul 2025 04:47:21 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhL9o-00000002tSm-2FWP;
	Thu, 31 Jul 2025 04:44:46 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V2gPvg030695;
	Thu, 31 Jul 2025 04:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=I83MFnCiFXCiIp5e2+LBV1sV8BJ5k9xK1eQKah6+dzI=; b=
	oeB5ywcsynEPWrIZpHiooUp7LDcm26sOUoltFGrXOj7E4oUZfpO/Sv+0sGryCuw4
	xU+L32Al5QdljiknJP7Qe77gn9aDGtnWUZrN3sBq+eTSH37JslKrdQKr7nGhXCRw
	57riVXcF3At2rWvfkJOu423STTbV+QJYF1N9DJaycpBbcYFgpURC+6/nkRJMJfYF
	b8q5N4I76hK1buwLqhY+s1abU/kdexVPVrg0OMXUIQogOTjgWx1FYaH6cYfDyQCr
	FiU60vzLJKcvOA5PVVmbNzebB12VtsvZVbayvtnX4KS2I9Qd2TPOFqzhsy91wlWL
	iJiom95AGKZMk0PjJNp5AA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 487y2p06cv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 31 Jul 2025 04:44:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56V36bKd016669;
	Thu, 31 Jul 2025 04:44:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 484nfjb2ud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 31 Jul 2025 04:44:36 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56V4iX43035411;
	Thu, 31 Jul 2025 04:44:35 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 484nfjb2tg-5;
	Thu, 31 Jul 2025 04:44:35 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Peter Wang <peter.wang@mediatek.com>,
        Stanley Jhu <chu.stanley@gmail.com>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Macpaul Lin <macpaul.lin@mediatek.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
        Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
        MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v2 1/4] scsi: ufs: ufs-mediatek: Add UFS host support for MT8195 SoC
Date: Thu, 31 Jul 2025 00:44:23 -0400
Message-ID: <175375581146.455613.10975874538933316960.b4-ty@oracle.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722085721.2062657-1-macpaul.lin@mediatek.com>
References: <20250722085721.2062657-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507310030
X-Authority-Analysis: v=2.4 cv=COwqXQrD c=1 sm=1 tr=0 ts=688af4b5 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=Sz4xQF61w0hT1LMIHCkA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12070
X-Proofpoint-ORIG-GUID: Y8eRtjW2yVAzR-f2CA9cdFL5iiSi5iTs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDAyOSBTYWx0ZWRfXww8Fhxoti4mV
 1itO/IqhdDBarORqZisMtXyeMabxZnpmHq577rG3cV9RZi2kZMY726J11kD/E+Wa3i2q2zfO9l3
 w1mVPawTAxmhCwSXy4ckAGIasxnL8g4qiFOU8qB4BgHghhsR3e/l0135vvailU8AaOzuU78Gf+w
 OLOcyEI86yWXspiY8Byjm+uBTaVCDSoS+OaaIZieDxnzfQpqwu5ENNioZea5Tius4IC8mCaQxqj
 mTwUlHGXgLSxIyL0j9wENVsMyVEi6sWWl2cKgkZX4gx4lVA7NaPgTxUp0pmBZc3RjcuUR0WYF4E
 G6P2xMDJCyYuc+gZ1u+Hink0xnmW/E2RQHUjMKHQtPf0Uf5g+GzBi/8OSAVsBQYq5FOX9/swyjA
 GksggwWNJb2DIwHzPHWYGiah0DRNVpSm/Qs/aHQdZ7/gfV2LcUYhmdOdA3qmpO53ZlnWaRe+
X-Proofpoint-GUID: Y8eRtjW2yVAzR-f2CA9cdFL5iiSi5iTs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_214444_691366_7DA8499A 
X-CRM114-Status: GOOD (  12.57  )
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

On Tue, 22 Jul 2025 16:57:17 +0800, Macpaul Lin wrote:

> Add "mediatek,mt8195-ufshci" to the of_device_id table to enable
> support for MediaTek MT8195/MT8395 UFS host controller. This matches the
> device node entry in the MT8195/MT8395 device tree and allows proper driver
> binding.
> 
> 

Applied to 6.17/scsi-queue, thanks!

[1/4] scsi: ufs: ufs-mediatek: Add UFS host support for MT8195 SoC
      https://git.kernel.org/mkp/scsi/c/6f1fd3e0279f
[2/4] dt-bindings: ufs: mediatek,ufs: add ufs-disable-mcq flag for UFS host
      https://git.kernel.org/mkp/scsi/c/794ff7a0a6e7
[3/4] dt-bindings: ufs: mediatek,ufs: add MT8195 compatible and update clock nodes
      https://git.kernel.org/mkp/scsi/c/d01cfeac89e9
[4/4] arm64: dts: mediatek: mt8195: add UFSHCI node
      https://git.kernel.org/mkp/scsi/c/a28f98103890

-- 
Martin K. Petersen	Oracle Linux Engineering

