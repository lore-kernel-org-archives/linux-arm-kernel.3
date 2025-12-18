Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74ADCD68BDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 06:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QnU9W7deeMrcvpR9ljaEaTJJvJbQij1DQub+QTx1CYs=; b=W5/4J2GHBfnPVUVv3LMsEuWEk5
	i1zzwUZWDGlCoOFsdGgswk1/5jrXVrA/ASvJogx7+4gQ+Duy1gBl2YnS6ONKE1KhLaUqAVTBcgbAi
	2iGYU7dHP1gMJAOoRamu4vME2bW0FgeRdFzQFeZOa03Y+Ba3qZpoxPxfsfUWC0HNMsFMTEZsvMWwX
	flE01W3UATw7GKAuO1dMj+aeYJdGWKCLWpQo/huoCRlwpmGHCvpsh9SMyO4+gSOty3BjBaBXwIgGO
	1w8SFBmzCabg2s6hNGkYqTeu8yZ18RGQJkthvl7LfhuSOMpvM20EqIecZfaNdly2NykcvJstJeDdv
	IJkPvVvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW7PB-00000007tEc-3zfx;
	Thu, 18 Dec 2025 06:22:29 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW7P9-00000007tED-0gZX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 06:22:28 +0000
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHNW1xA238011;
	Wed, 17 Dec 2025 22:21:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=QnU9W7deeMrcvpR9ljaEaTJJv
	JbQij1DQub+QTx1CYs=; b=f2CfZn3oBtXySP0x5i/PJl4htTdJqX8wloWnZvOqU
	L4apeJ7lWzwsdpyIi9aPBkG7S00oJUpxS7uO2JFDGCPRsMTiMMuFg6bV1iMkngbt
	T7Zmq7cwZLrStHo5pIl1rh/tYxt/cLwQ7EwR7J7v6aUrvGs2/unRFZUE8yPPqCnM
	9bGoEKfvHGQjrTtH3sSPcQewDQlrZ9rsYvTf1/ksDwzftxWJVilnU4j70n9sp5Mf
	AAbHkptOnY5PcORBdLd6jGMuS3VcWmPf3geMfteJZIdkdYn60d3W8qrmojtZGLiO
	JXySOmppc+Anm4cc+AW7FbquKyGVfkdOADtXOD04eFFgg==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4b3w5s1yju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 22:21:51 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 17 Dec 2025 22:22:03 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Wed, 17 Dec 2025 22:22:03 -0800
Received: from test-OptiPlex-Tower-Plus-7010 (unknown [10.29.37.157])
	by maili.marvell.com (Postfix) with SMTP id D412B3F70C1;
	Wed, 17 Dec 2025 22:21:43 -0800 (PST)
Date: Thu, 18 Dec 2025 11:51:42 +0530
From: Hariprasad Kelam <hkelam@marvell.com>
To: Wei Fang <wei.fang@nxp.com>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
        "davem@davemloft.net"
	<davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
        "ast@kernel.org" <ast@kernel.org>,
        "daniel@iogearbox.net"
	<daniel@iogearbox.net>,
        "hawk@kernel.org" <hawk@kernel.org>,
        "john.fastabend@gmail.com" <john.fastabend@gmail.com>,
        "sdf@fomichev.me"
	<sdf@fomichev.me>,
        "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
        "0x1207@gmail.com" <0x1207@gmail.com>,
        "hayashi.kunihiko@socionext.com"
	<hayashi.kunihiko@socionext.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        "boon.leong.ong@intel.com" <boon.leong.ong@intel.com>,
        "imx@lists.linux.dev"
	<imx@lists.linux.dev>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "bpf@vger.kernel.org"
	<bpf@vger.kernel.org>
Subject: Re: [PATCH net] net: stmmac: fix the crash issue for zero copy
 XDP_TX action
Message-ID: <aUOddielBMkrmwhd@test-OptiPlex-Tower-Plus-7010>
References: <20251204071332.1907111-1-wei.fang@nxp.com>
 <aUKPHdtAPDnMqB7X@test-OptiPlex-Tower-Plus-7010>
 <AS8PR04MB849779A6392D543049A3F5BE88ABA@AS8PR04MB8497.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <AS8PR04MB849779A6392D543049A3F5BE88ABA@AS8PR04MB8497.eurprd04.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA1MCBTYWx0ZWRfX58H1lLqEekM7
 GAUAaaNMq92E4QYI6TfFDXq0fJJqIS59lalZ5uiZH9wNP/NncPI2UmdOu9Z2tvqtv4ZGNQRmuTR
 iwd0TGRySBMwD/0/cpLUUdS0ZF866dcE2BOqhDtc5VwFsEIPgH9fXxYJsHx/sqN7fFVgZFamETQ
 x+ZgiZjftcnNNiGd08amDKjaTLQfjZg621kK6aplA2/vPHM6NkSCLp+ZXD7zNbFW+zQGaxOiDED
 y0YYNXwcYzsoYNLswpV95c8TfWARaqi+gnu7cnVdKYCVXvO9NUGML5W9uiHdD1V7fk4sRzzXuLr
 uVRRjABUGpUGo8nx4kyWOHKq3iq6D/DrC0tPdwhHC5y/CHcD1C0geHW3pBcVCoajui7ccUx90fK
 L6hn/qoQ9qj0Rf2Gzn4cYrmKc2iR3A==
X-Proofpoint-GUID: jUik8wHEQLBJBYXI0BOoajfYtHppzs5j
X-Proofpoint-ORIG-GUID: jUik8wHEQLBJBYXI0BOoajfYtHppzs5j
X-Authority-Analysis: v=2.4 cv=Zpvg6t7G c=1 sm=1 tr=0 ts=69439d7f cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=w373o-ZMvzc93a0z:21 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=XlXf_pu8Z8fFeJWwk6sA:9
 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22 a=gFKHwRTsc5ICqspHuaiD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_222227_334123_28BC4594 
X-CRM114-Status: GOOD (  15.89  )
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

On 2025-12-17 at 18:19:19, Wei Fang (wei.fang@nxp.com) wrote:
> > > -	res = stmmac_xdp_xmit_xdpf(priv, queue, xdpf, false);
> > > -	if (res == STMMAC_XDP_TX)
> > > +	/* For zero copy XDP_TX action, dma_map is true */
> > > +	res = stmmac_xdp_xmit_xdpf(priv, queue, xdpf, zc);
> > 	Seems stmmac_xdp_xmit_xdpf is using dma_map_single if we pass zc is
> > true.
> >         Ideally in case of zc, driver can use page_pool_get_dma_addr, may be
> > you
> >         need pass zc param as false. Please check
> > 
> 
> No, the memory type of xdpf->data is MEM_TYPE_PAGE_ORDER0 rather
> than MEM_TYPE_PAGE_POOL, so we should use dma_map_single().
> Otherwise, it will lead to invalid mappings and cause the crash.
> 
>
 ACK, found below code bit confusing
		case STMMAC_XDP_CONSUMED:
 			xsk_buff_free(buf->xdp);
+			fallthrough;
+		case STMMAC_XSK_CONSUMED:
 			rx_dropped++; 
              
     Ideally in case of STMMAC_XSK_CONSUMED, driver needs to call xsk_buff_free.
     And in case of STMMAC_XDP_CONSUMED, driver needs to call xdp_return_frame.
     May be you can move all buffer free logic to stmmac_rx_zc with above suggested
     changes.

