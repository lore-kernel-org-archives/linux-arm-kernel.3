Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C90C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8bQVcZ4XERxz6R2mCbfmBMtRzXuotUJA5hLPxZbwzA=; b=3kdPIzD1SOdhDWz8IsAAFtjP7l
	wc7V1IdFVDVj9HCVxHcqP5dI/FrocUFI0vLMPGxJ9sAVNzcdKqd36q8tux5g7Pff3kK9T8Ayk5VYO
	G7kOS2gbP793Yk6yyO/TJ2LGU1ooEbQdF+Uox9eAGrkSkl4eHfSMeNPpJWXXkI2o/o7fn3iSxkjPy
	KTdi9UaSxj+NDJQrB3B5V4i5yOg5TaKgfUG8dC0z/vhHCObf+8v6nIC7LpqN2eDDXU+ENP/BrSRY/
	BEARYQJvfePdouT9FY8ySCH4VpnY1M8sRJ7FYBO2ICHrG6LWzHzDa1RJDs1/O08CjCcK2F4FEGpey
	zD47H06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oVU-0000000856J-03Yu;
	Tue, 08 Sep 2026 05:36:32 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oV7-0000000854G-07yz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:36:31 +0000
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687NoiiN4052707;
	Mon, 7 Sep 2026 22:35:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=L8bQVcZ4XERxz6R2mCbfmBMtR
	zXuotUJA5hLPxZbwzA=; b=BihBDKLsw4pynSGhwHdPWhTYqd5EIYdgjEDjj2k/H
	nyQc2ByMQXzkPtQLr8bclg7jGV5vC/+CQPDTFGpFJov/o9ZzESX22vKrFELMK0Np
	n90wwp9ROCw6znY9McFq97V703M5iatV+CZjCXd8nniTo29Slpp6hmmjdTHrna8w
	neJEvGlk7RnqwA1HdeZwdNn0IE5EQ4ziBuRVgSqmfpPxzCEDlQ7slnx5aFpJc04b
	VSXVxbN9gfJ1M3u2LkH+Udj+LaS33k1wmJ9h+1mpCq70N8ggJjMVotbLV6bxC5AD
	xna41MnZDtpakF/lL8NhnZOwoIb+b9eLl4LvzV6Q/SbEw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4ghupyaf99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 22:35:36 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Sep 2026 22:35:34 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Mon, 7 Sep 2026 22:35:34 -0700
Received: from rkannoth-OptiPlex-7090 (unknown [10.28.36.165])
	by maili.marvell.com (Postfix) with SMTP id 1D0A83F7078;
	Mon,  7 Sep 2026 22:35:25 -0700 (PDT)
Date: Tue, 8 Sep 2026 11:05:19 +0530
From: Ratheesh Kannoth <rkannoth@marvell.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
CC: "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        Bharat Bhushan <bbhushan2@marvell.com>,
        "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
        "Chris
 Snook" <chris.snook@gmail.com>,
        Eric Dumazet <edumazet@google.com>,
        "Florian
 Fainelli" <florian.fainelli@broadcom.com>,
        <GR-Linux-NIC-Dev@marvell.com>, Geetha sowjanya <gakula@marvell.com>,
        Jakub Kicinski <kuba@kernel.org>, "Jian
 Shen" <shenjian15@huawei.com>,
        Jijie Shao <shaojijie@huawei.com>,
        "Manish
 Chopra" <manishc@marvell.com>,
        Marcin Wojtas <marcin.s.wojtas@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>, Rahul Verma <rahulv@marvell.com>,
        "Russell
 King" <linux@armlinux.org.uk>,
        Shahed Shaikh <shshaikh@marvell.com>, "Shuah
 Khan" <shuah@kernel.org>,
        Simon Horman <horms@kernel.org>,
        Subbaraya Sundeep
	<sbhatta@marvell.com>,
        Sudarsana Kalluru <skalluru@marvell.com>,
        "Sunil
 Goutham" <sgoutham@marvell.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
        <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next v3 07/10] net: marvell: fix typos in comments
Message-ID: <ap-elz1ObdxcutDv@rkannoth-OptiPlex-7090>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
 <20260908052602.27497-8-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260908052602.27497-8-hemanth.selam@gmail.com>
X-Authority-Analysis: v=2.4 cv=AYyB2XXG c=1 sm=1 tr=0 ts=6a9f9ea8 cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=l0iWHRpgs5sLHlkKQ1IR:22 a=QXcCYyLzdtTjyudCfB6f:22 a=pGLkceISAAAA:8
 a=M5GUcnROAAAA:8 a=tqGoz1Is73OFN3djMG0A:9 a=CjuIK1q_8ugA:10
 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA1OSBTYWx0ZWRfXyOtTkmQm1q4x
 SUjKFIJV5r0rqLrG6heVXaKN72MitGgLDmd8Bv4FbcX8Y0xrsYPTwWZFvu9ewyVL6Di9EfFKk1L
 4YLk94IAoz86MBUbPxVe5p/xf2SmW/xfXQHjIVpGQv64xYB13I0s4rE/L9cnkJRQGVQXV7wBEoU
 Ym5QSuAqWh+z3q5YMXYDeXDjxOfsz18zOMMmL830aWLNAZlDpN0vxhLajUAxxL1PmYnjfPr6sWk
 uByWJbUf3S8xiXKq5xbeuA+0s2Cc0KOrNbNDiaKkLJbv3vdgPSYqwYL/6gt9we0ZpnCE1mBnN8I
 +wyaIp7fRIu+VDxVZ1culF1mKzlm8erVlmuLvZE9bhartfQKQdxsqwh9fGlxqfl+gQDVCeN197Q
 7QL9cwVZEkBt1GmVOkXmMWexGe7YQZIdJHsx87R5s/aBI7KL9FQPH2AvnHwDlK93cyljG+zmKeo
 EEUTu45739cwJluPVqg==
X-Proofpoint-ORIG-GUID: vGLgS59Z7ZapmCskxREr1hd--snyiUqy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA1OSBTYWx0ZWRfX+gdxfEt/IaoT
 R1bLw9QTDsE5rTF0QUOGiIWUSyFbSstK6ypH/ds435eD0V4rUUa312PvDlJxP0j1XmA+Lx19DKv
 ByG2LrwN6PJXp52vWuquepGgmVyrW2s=
X-Proofpoint-GUID: vGLgS59Z7ZapmCskxREr1hd--snyiUqy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_223609_194532_7AC5F4C7 
X-CRM114-Status: UNSURE (   9.97  )
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

On 2026-09-08 at 10:55:59, Hemanth Selam (hemanth.selam@gmail.com) wrote:
> Fix misspellings in comments, found with scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Comments only, no code
> changes.
>

For below files

>  drivers/net/ethernet/marvell/octeontx2/af/npc.h         | 4 ++--
>  drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c     | 2 +-
>  drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c      | 2 +-
>  drivers/net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c | 2 +-

Reviewed-by: Ratheesh Kannoth <rkannoth@marvell.com>

