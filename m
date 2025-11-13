Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517A8CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 02:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1sHGTjdI5nQJA3D1GLCj0xQo44LivYH21QX3rDb+TUM=; b=tr3VqSN+orOvTDxq6NIeP6pzBD
	N2bHnOTeNglmx6qRv+jFrOB/oQV0mqbjiDbik3e5elb0IOldRHVRyx2ffPRnpH1zRT3bwmbdE9R3Y
	29t4x1YUnzaUx2233nZSjbmgB4zKnGeY63HZPxrHk10avHo8EZOtNdLliYW2ElLpnLJrSRYXOhLDG
	tbj0KuTxPoXUBiJ0zBpiPVFwaZELx8JaVnXvJ8ADSmmqTc5rKVkZv2+3BWZNf6fyRU4EmLek0tbCj
	WM7cKcwqiguM0W/pNqzJYZ/ypx0HCeYeYuW6UQG+431hAiXoCj3g9btOGvqwehq6t5W2TQyXRH/sm
	2u9CWW6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJNMy-00000009oWu-1Ys9;
	Thu, 13 Nov 2025 02:47:32 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJNMt-00000009oW5-2duj;
	Thu, 13 Nov 2025 02:47:30 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AD1hkxu024043;
	Thu, 13 Nov 2025 02:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=1sHGTjdI5nQJA3D1GLCj0xQo44LivYH21QX3rDb+TUM=; b=
	Hzh33el4Y+nT36Z0VrbtaAD5HFlzKjd/SEGtfUnf2Rk15Z7upJSq79FIk+8OQJQr
	g+aaSqeDRGGGyb/1ComZPolN8bbq19AcYehgnomNyH9AeXTnHaZnJX9ZuLUKaYvp
	EGEutrLZoe8a/M9JeJUUpgTCf4XWu2F26gQWzQdoBhxAFARatzy4IhyeiLhVEOmM
	JIGB+227d/ejhnmn3iYwwjwwFnKcE+d8bOXiMCDnfHPduXT4mvgW/T7aUQDgWd3V
	X2GZPanY2J9CaMG/bZCfmsJ2811tiWgWSqz/9bBWCElCPCw4hK5xrs0Xea+acP1U
	o95fdf0QI5vnESzgUSN+8w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4acxpngvwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Nov 2025 02:47:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AD0qNLZ032481;
	Thu, 13 Nov 2025 02:47:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4a9van9qcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Nov 2025 02:47:14 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AD2lB8N038323;
	Thu, 13 Nov 2025 02:47:13 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4a9van9qab-6;
	Thu, 13 Nov 2025 02:47:13 +0000
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
        conor.dooley@microchip.com, chu.stanley@gmail.com,
        chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
        naomi.chu@mediatek.com, ed.tsai@mediatek.com,
        chunfeng.yun@mediatek.com
Subject: Re: [PATCH v1] dt-bindings: phy: mediatek,ufs-phy: Update maintainer information in mediatek,ufs-phy.yaml
Date: Wed, 12 Nov 2025 21:46:55 -0500
Message-ID: <176298170716.2933492.7751949109863545912.b4-ty@oracle.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251103115808.3771214-1-peter.wang@mediatek.com>
References: <20251103115808.3771214-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 mlxlogscore=924 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511130017
X-Authority-Analysis: v=2.4 cv=Criys34D c=1 sm=1 tr=0 ts=691546b3 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=mpaa-ttXAAAA:8 a=8d0GUG1h20LVvl_VnrYA:9 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12100
X-Proofpoint-GUID: IeOeuSWTlTrpHkCLnld7n0QRG4Xbhs5D
X-Proofpoint-ORIG-GUID: IeOeuSWTlTrpHkCLnld7n0QRG4Xbhs5D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE0MSBTYWx0ZWRfX9hbFk6XYutWW
 Yw7di95yWfu4YBraVPukJnMQ3rL3LgBLjU45S3j4/On0OocZqamzibfRHrN25ewELf036lHNgZb
 ocRqjtcAmEFBstn5lkCHBt92p8nYFTiKKCu+UjganwOUDFl2rNPVr+uqMhmHgAi0rKTdS5uuucZ
 Nakmo6jG4CS72zn6vgTFbhWHuXu9rehqhT3IbiX3V09g3QZ5Mhbug5odUW/PCZTuQDk4zCIVybs
 RtL5XI13vbVCNvz+zqxVjU9lnrm7y5yq4R+DmHdrYM19V0iFjHpJ5DsS7Zgvlu282zdwdM7dIow
 vYuwk+pAfUwdZsqF62XLSQm6uKlJW5H7U7k/LDpAvpht/EaATwJQf3acFLFUHb3E0cNhRuxZzwP
 VrS0lDd+Zwu3TNzsGErQDLAcV67CglrMjT1PRHOz5TiCmo0YLFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_184727_787035_FB646465 
X-CRM114-Status: UNSURE (   7.49  )
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

On Mon, 03 Nov 2025 19:57:36 +0800, peter.wang@mediatek.com wrote:

> Replace Stanley Chu with me and Chaotian in the maintainers field,
> since his email address is no longer active.
> 
> 

Applied to 6.19/scsi-queue, thanks!

[1/1] dt-bindings: phy: mediatek,ufs-phy: Update maintainer information in mediatek,ufs-phy.yaml
      https://git.kernel.org/mkp/scsi/c/ad4716ad48d4

-- 
Martin K. Petersen

