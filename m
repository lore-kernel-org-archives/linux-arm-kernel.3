Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6835CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 17:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+aB+iZJnL8ozb2pDFXduEFu8qABJrtYdff1K70ebeAQ=; b=yk5d6cbk+ew0cqELOXTL54GLx0
	8OYvPyPOenGsmXE7gFJkkuwWhUFIoO0LW2vatyP9SiHDo1P18VvnZmlKS1L6s3o5Ft7d4bLlTU4nt
	+oaQTNyytxLU+kIQSd/thujCQ9B33fdRsxI6Is1OdeQN2r2+PHaDFrjPIPnxZc7MMRGHWNHtus26M
	peqk6p+//jEylxXlrYm7hzsWjl3DcCEl9zeAVesntZbtqODizRnGQFQIHE0Q+swnCNLTJyavDVqpZ
	KkYh3sBAheWEP50YGwH5OUoe5xsVR9HI884xr9Q1XvFHwrFfaf0z8s99YGXACjG+1phfJMfcf7XKG
	aJNl0xgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuaNu-00000003WhR-0CbY;
	Fri, 05 Sep 2025 17:38:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWXE-00000001zdZ-23xv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 13:31:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857JQJ3013602;
	Fri, 5 Sep 2025 13:31:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+aB+iZJnL8ozb2pDFXduEFu8
	qABJrtYdff1K70ebeAQ=; b=I2iDrcK2MtkwVOPA+dlHtSA5J7zfQxu0rYmziqH+
	cbcPv2FznN/UqiPECDfEjy2+99U/vtjuRm/mOLxKIjwofbuMn+2P5ISX3p8sjdL5
	7qSnITFbD7hRQ5ShNQKxqOjFRMkrL5nu9JgSWvOjNH6hqNovIE3xLIpOe5PZ612N
	/olG8fUXjIudIjG8fveehNl4AjElKTEQNBJwyg+bWm2UIG1xzdWtUgESRocyamEW
	ov4MKhunL6PY+xQXMy8BZYFJgWij9N9kdVHfDOjLbgdHBQp1+QZcJCZuDRYJLZ5C
	nDgX/1qn1WUhXq1NdMHvlBTUqB9CNSxtjm+iL6PWiwqF8A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyf709-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 13:31:08 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 585DV7hH029888
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Sep 2025 13:31:07 GMT
Received: from quicinc.com (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Fri, 5 Sep
 2025 06:31:03 -0700
Date: Fri, 5 Sep 2025 19:00:59 +0530
From: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 00/11] net: stmmac: mdio cleanups
Message-ID: <aLrmEzyxzo1DRBNG@quicinc.com>
References: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68bae61c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=PHq6YzTAAAAA:8
 a=COk6AnOGAAAA:8 a=UbDMmHRTMWTSUy5J07AA:9 a=CjuIK1q_8ugA:10
 a=ZKzU8r6zoKMcqsNulkmm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YCkfEWMsAiv0yIOvixc3HIKlFi2tOG5r
X-Proofpoint-ORIG-GUID: YCkfEWMsAiv0yIOvixc3HIKlFi2tOG5r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX7Sk9AX65HGTR
 +yaae3yNsjsCY8k3TeqkbgczQendvtlfhcSXhcwyCwSe1GYsvrkmA4xgyRtzMFFmCdtFstBtwnJ
 CEqL2jpzTOtyexlVDjO/w8wBR0pds4NfMBr5ZQtqrfE5RuzClfvkHhVPOVrQuQAaX0U2GKH4pYa
 lnoU3A1yJTGde98s12J038RTVu1oHLIKHVtsThYO8Al5BR6UuytlJN4bzWhgxK5n/NClbKOm5LE
 Ar76YeNMBLBC5jr0qrb89AQITGVR97610xG3uxbI7sCDbB8UcWzqJHNhNbcmcM7Bw5Qxhr0w5dm
 smqkb3iQo6N4fkfWGYNnYdl38Nu+QdNmxkO/7w4/42S3jOWGMr3DDL+mNgPHGvVh3Ekl7Qx3K+C
 fQ0hZScY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_063124_669282_F066F3F6 
X-CRM114-Status: GOOD (  19.72  )
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

On Thu, Sep 04, 2025 at 01:10:42PM +0100, Russell King (Oracle) wrote:
> On Wed, Sep 03, 2025 at 01:38:57PM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> Clean up the stmmac MDIO code:
> - provide an address register formatter to avoid repeated code
> - provide a common function to wait for the busy bit to clear
> - pre-compute the CR field (mdio clock divider)
> - move address formatter into read/write functions
> - combine the read/write functions into a common accessor function
> - move runtime PM handling into common accessor function
> - rename register constants to better reflect manufacturer names
> - move stmmac_clk_csr_set() into stmmac_mdio
> - make stmmac_clk_csr_set() return the CR field value and remove
>   priv->clk_csr
> - clean up if() range tests in stmmac_clk_csr_set()
> - use STMMAC_CSR_xxx definitions in initialisers
> 
> Untested on hardware; would be grateful for any testing people can do.
> 

Picked this series on top of net-next and was able to test on the
Qualcomm QCS9100 Ride R3 board with the AQR115C Phy. No issues seen with
C45 MDIO operations, so:

Tested-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>

	Ayaan

> v2: add "Return:" to patch 1 and 9
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  |   5 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |   3 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  82 -----
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c  | 345 ++++++++++++---------
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c   |   5 +-
>  6 files changed, 207 insertions(+), 235 deletions(-)
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 

