Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E177CCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 04:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsH5r/6vzUJZtwJSh4laP2CRaInCJhfRCw+nEMpXmAE=; b=PkjNZ90gYKml5KAIB2epR3IAvs
	H1Jr5MKSqSRMNFyCyXp3bcLmew6mfpdiO5RNC89xI0YoENs/NMZaxL9KsOJ87/jDQq4C5TLwj5+bC
	XMxorPnI+vIZlrUD8g7oHBfKLT4FpA1g2yQuH9fnZq2kPEbNMZKtS8oT1aQ7pkEx/x+MEbmdecWl5
	iHJKfKjRNV33SRNOfwgDKDUH/HXlzLpiMPKNupn3sxZMoZW+rG044xbwn2Ih1C9qQKZ944PFr/In6
	79oCd/f7KUPT0wWCtydqw6A+vvKg2OjbNdCUlHCeKBTYHDB96Ax9D9nQuU9yRomMprIw8G8QZRuO8
	PM/guBsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGUjI-0000000CzES-1CuG;
	Wed, 05 Nov 2025 04:02:40 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGUjF-0000000CzE3-1E70;
	Wed, 05 Nov 2025 04:02:38 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A53GHPb022581;
	Wed, 5 Nov 2025 04:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=YsH5r/6vzUJZtwJSh4laP2CRaInCJhfRCw+nEMpXmAE=; b=
	eRNmz8V+0wX2p5FgaNbOxo00KhVqq1gHlRmxlqb3zqjm9QNZ4FD/U6Qesc2EaGBX
	XtLNinPDiyA4p4a+7oSTIjhespG4pAoA6DwDlAl5frJNSxLQjnkVj3pPLq+Fs9tR
	tuZWGKWt0rLNN2xoLrLgNj1XkXR0DpkFMYvJlO19oBKltbAQa8mWgqRkE6AC0mlT
	ZQehWWNOMN5aVmOyiemakDaWMSljpmbYr147zPAr7jNddUm7/QS2CENI7lcXosXv
	3T7M0lm6sdRU88oWuTvC8BJ7Y7MeuL5B3cDJ78a7KMGwyijUphEWNgrw2DLu0ilt
	T0fsKwkMheSX0utflxaxug==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a7xhdg201-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Nov 2025 04:02:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5A524FLm024893;
	Wed, 5 Nov 2025 04:02:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4a58ne15j1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Nov 2025 04:02:28 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A542Pro005395;
	Wed, 5 Nov 2025 04:02:27 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4a58ne15gy-6;
	Wed, 05 Nov 2025 04:02:27 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, peter.wang@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, jejb@linux.ibm.com, lgirdwood@gmail.com,
        broonie@kernel.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, wenst@chromium.org,
        michael@walle.cc, conor.dooley@microchip.com, chu.stanley@gmail.com,
        chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
        naomi.chu@mediatek.com, ed.tsai@mediatek.com
Subject: Re: [PATCH v1] dt-bindings: ufs: mediatek,ufs: Update maintainer information in mediatek,ufs.yaml
Date: Tue,  4 Nov 2025 23:02:20 -0500
Message-ID: <176231440764.2306382.16356889887368434971.b4-ty@oracle.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251031122008.1517549-1-peter.wang@mediatek.com>
References: <20251031122008.1517549-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=921 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511050024
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAxOSBTYWx0ZWRfX+uE1GIt984Gq
 4/GHMEsw9maJTT375X+rmpBf5mLpXxua/eTTSKpNLnEGcmns2VLHp2v9fHVEKAuCzVnrZEIhCAm
 9erOZPx6vRi8KgbnS5iMXT7ojITDj7WqJIhCMqjRDbhxvkl48Ketl+YjXTZBbJXi1NvKBWfROxS
 R9+x+365zLpzU0Kc9H3sN5IOs7RnKfkXkSPm8gphNh+OWhLvU8Xzi3R4WlKDRSTnpm6rXQzx/UN
 WBNqsTx46cDHbk9eLm/CevyLK+0U696VVxkQgeaFv0RP/zgIWVtLUV5dGpyNwtBNrkAA6tYoyIK
 5sl+8AiW5T7FuuQEdusv+qDnDi3IxTt7kEF+yilQJt4fhSJus6YP+qnGHDLYG8UxJTHd/qVC/kL
 6MqSTyfIHUsbn3KOwsKN3RhLYgVVuP4P3bp8Df7TMnj4uqM9uXs=
X-Authority-Analysis: v=2.4 cv=ZpDg6t7G c=1 sm=1 tr=0 ts=690acc54 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=mpaa-ttXAAAA:8 a=8d0GUG1h20LVvl_VnrYA:9 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:13657
X-Proofpoint-ORIG-GUID: HuzLGcL3yYhgijfTvd2LcY2rHs5jwfRD
X-Proofpoint-GUID: HuzLGcL3yYhgijfTvd2LcY2rHs5jwfRD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_200237_471936_4FCE2C56 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
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

On Fri, 31 Oct 2025 20:19:12 +0800, peter.wang@mediatek.com wrote:

> Replace Stanley Chu with me and Chaotian in the maintainers field,
> since his email address is no longer active.
> 
> 

Applied to 6.19/scsi-queue, thanks!

[1/1] dt-bindings: ufs: mediatek,ufs: Update maintainer information in mediatek,ufs.yaml
      https://git.kernel.org/mkp/scsi/c/480ca7954664

-- 
Martin K. Petersen

