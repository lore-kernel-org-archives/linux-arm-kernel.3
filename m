Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC89F30299
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 01:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oarZb00n8Rv6tqeaEbGkD+mE58hMyqk79HsWBx2gyFg=; b=NuzQZqsB5OwO9BNw7WioCBQGho
	4oXMPbBBHSrOMUYTiOS2O3jmnx5tev6nXidfKAMVdixrQ0OugyRVSaWLgxjNBGHTNULQdcpVWnwGV
	WakPw5/nntKV6dfYKxkDJ+QOyLDtDYf/T0I0lcTKvUVHJdyTZ/NfT/ERjcyhFyTyc0Gnsr2p8wZUA
	p1m95/+yo2XUGS2x74+ztHdG4i7GLI5/eWPgBNYv8aRRYegH+EnWX4+X12pjn+45zbwypF6ShuE86
	j9V39UXgrvthItw8qsoNLaSjldBz4XznQPM1Ja7WrohZewgWr2GEh0pfpAjWFl1AAgdsMXoOp6oRd
	hm7p0CFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wxm-0000000388P-2STX;
	Mon, 16 Mar 2026 01:41:46 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wxi-00000003875-3Y8z;
	Mon, 16 Mar 2026 01:41:44 +0000
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FNxHDj898997;
	Mon, 16 Mar 2026 01:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=oarZb00n8Rv6tqeaEbGkD+mE58hMyqk79HsWBx2gyFg=; b=
	Cg2PsnbJuC+E1VjKP1TvXyowT8il5YCdkar/tznft5pLCQbBv6c9cm1Kl6R4/okw
	n/tVxwm4edM9uZf4JmPJH1bfFEgILHncDthETnejmhcZe0GpO92cCfvE4r7pZ5O5
	lhvyS3wPJ5IHbMwf/wJEYwHy/HqipTPT7rnsLv2EePxfUWzSAbMVz6JJXsG4aNEd
	ubZm4/oC6IXpMFDheGEK78YGUUHYsJnv9f2YVJFoJRXKtwB+bfT8xZtRNLpWf8lV
	6m6S7WTHIJIFqMz9qPZaQRvz/GztFY0dYcNoC3LupNO/EBnio1F1SEWM12RobJ6K
	hEo3poHZxUFlfMEXQtFs9w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cvxk89c9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Mar 2026 01:41:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62FKU9de002695;
	Mon, 16 Mar 2026 01:41:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4cvx4j86n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Mar 2026 01:41:34 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62G1fXhP032070;
	Mon, 16 Mar 2026 01:41:34 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4cvx4j86mp-3;
	Mon, 16 Mar 2026 01:41:33 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: bvanassche@acm.org, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        ed.tsai@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
        peter.wang@mediatek.com, alice.chao@mediatek.com,
        naomi.chu@mediatek.com, chun-hung.wu@mediatek.com
Subject: Re: [PATCH v2 0/2] ufs: add delay for VCC ramp-up stability
Date: Sun, 15 Mar 2026 21:41:22 -0400
Message-ID: <177362524498.2599440.10872001090323640042.b4-ty@oracle.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310005230.4001904-2-ed.tsai@mediatek.com>
References: <20260310005230.4001904-2-ed.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603160011
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAxMSBTYWx0ZWRfXxHh6KOXCy7Hx
 cyGueEH54jCVypm15Dv1agWgyW14fN3om2zWvsWnFSuhUUfFsWgfEul8Hr36V8pHgk5EMN9WUaF
 Av5ed6tgb6E3Hv4sGhCNiug6EWxNSwjLGkNFHkOHTR0/JhmX9uGwsf76KjXLqGqf6mesbdpaSg9
 1ET88QwPtfmZhmrFRzVIbkpguJLRQOX0uvr5HAs7PWvK3fuSJRvoAWYZpPjDOLoeT3dd8MadZSM
 O7JwxiY8sG0UGVm4zaF5YA6Ig8xVv6dDObBrVgyiyw3Tnrd44Mq+cFxaOK5HTK1oesMRZuLtJFL
 W8nFD0FmTgrTucrePrQG9WwbjQT30vGmXZIuMUjmJZqmShG8//IL4DV+BQy4OBUZbUfvXIHFdiM
 KB5ebbIo0xdtFfHYdNuC0V+zlSSLtvlmbPIdEZKYgN8FG7GJowq48foBInibyA6A3XIXYMg+KLW
 NHfFOLtWrc53VhfjxG44lE4UNQXsURSZq6QhVIsQ=
X-Authority-Analysis: v=2.4 cv=AI0/m/Lt c=1 sm=1 tr=0 ts=69b75fcf b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=VwQbUJbxAAAA:8
 a=mpaa-ttXAAAA:8 a=-pD3U8TwCSn0KAY3LIgA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12271
X-Proofpoint-GUID: oA-Vk6MhdX35m3IO0eKzr5xQxB74aqQn
X-Proofpoint-ORIG-GUID: oA-Vk6MhdX35m3IO0eKzr5xQxB74aqQn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_184142_886513_0184513B 
X-CRM114-Status: GOOD (  14.21  )
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

On Tue, 10 Mar 2026 08:52:26 +0800, ed.tsai@mediatek.com wrote:

> This patch series resolves a link stability issue found on our certain
> platforms where the VCC regulator has a slow ramp-up time.
> 
> To fix this, a delay is needed after VCC is turned on. The solution is
> implemented in two parts:
> 
> 1. Introduce the new host quirks, UFSHCD_QUIRK_VCC_ON_DELAY.
> 2. Apply in our new platform with UFS5 device to ensure the VCC is
>    ready before we enable the clocks.
> 
> [...]

Applied to 7.1/scsi-queue, thanks!

[1/2] ufs: core: Add quirks for VCC ramp-up delay
      https://git.kernel.org/mkp/scsi/c/6ab94d0194dd
[2/2] ufs: host: mediatek: Add VCC on delay for stability
      https://git.kernel.org/mkp/scsi/c/20ca5460e5f9

-- 
Martin K. Petersen

