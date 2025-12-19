Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D20D74970
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBVYq6yiFYv4b2SACgENr1E4aNi8XV0ZxgX0rcrPAGk=; b=n6L+yDBXMt8w2YLUUxmfSgYlY+
	k2L7uIiMAHb5P7XogwwIbZe184kYt1cAytQNjuAQJGn/W+rGLMJHWyNrAR++f1eTvJVhSD89S6AGn
	wa8JKRTRvdO4lPYm3ax2JzDVNb9BikuS9glLSgcBylA551XqA+rdtBL7Z9mZYZPk7q31OMDRVq8u8
	9V21M5ITXBfjLCKWtl/5OGumAWGjdEbgveq5OybE6O8FFL0aTjIKFGYffUPxR4a3BHu1vhOseHoyv
	yjU36hldJEIfv++blQN3FbxxjSHAESFNw4qJIMcP1tRdtdytoRLuz7g8NfuXM9xlVIyfSC4Ypu8zz
	rk3Tkn3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXM9-0000000A0ZW-0v1E;
	Fri, 19 Dec 2025 10:05:05 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174] helo=mx0b-0016f401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXM5-0000000A0X6-1gBD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:05:02 +0000
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIJjX7F680014;
	Fri, 19 Dec 2025 02:04:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=PBVYq6yiFYv4b2SACgENr1E4a
	Ni8XV0ZxgX0rcrPAGk=; b=GZkYxcI32MsTUBg2UvzK5NVBdaP9s6EUH2N7B5ULg
	ftMRdepOnYCwhmb1D1RXEG/z94J2UNi17ZBGYk28TpW0oORIqIg3saITvRnKp8RK
	7EZoFdFD5egHgU+aZ/WxjeCr8Ux+kb2SP3cs1irViVgC9xb0gAl+EbG2zojCS6Fs
	0WrOzctKwU4hcHMpCr5MbjrBUExFskEMMJX/ztKVZ148IWHraZV4SfKD6xtWKl+R
	MRBW2xfokm20sRFIwXgdAS+u9U0SKtwI096vrEOD53NC6Rqhbw+5vb38U7OubhBC
	eEBr/DcwMrgFSxHQuD4/2tCqmxNwa7DMlLtHWqOdcZvNg==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4b4r241eu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 02:04:27 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 19 Dec 2025 02:04:40 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Fri, 19 Dec 2025 02:04:40 -0800
Received: from test-OptiPlex-Tower-Plus-7010 (unknown [10.29.37.157])
	by maili.marvell.com (Postfix) with SMTP id 56EA15B695F;
	Fri, 19 Dec 2025 02:04:21 -0800 (PST)
Date: Fri, 19 Dec 2025 15:34:20 +0530
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
Message-ID: <aUUjJH1tQkN1UcYL@test-OptiPlex-Tower-Plus-7010>
References: <20251204071332.1907111-1-wei.fang@nxp.com>
 <aUKPHdtAPDnMqB7X@test-OptiPlex-Tower-Plus-7010>
 <AS8PR04MB849779A6392D543049A3F5BE88ABA@AS8PR04MB8497.eurprd04.prod.outlook.com>
 <aUOddielBMkrmwhd@test-OptiPlex-Tower-Plus-7010>
 <PAXPR04MB8510499B65301187736D511088A8A@PAXPR04MB8510.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8510499B65301187736D511088A8A@PAXPR04MB8510.eurprd04.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MiBTYWx0ZWRfX9GQmj9XB3SQL
 oH49VqzVFggN9rADC22341hevpvUlzCz5zG1MrgQuOsIMCNzc3+yjg5UdZhOVtkK4q6l8G3zdXY
 0YrrsVUl2BmGnuRzGZujnJcMgtei4YwiBarLbJV7IJV9b3uwcAAOyOVhouAm9Inr25xZLPjTA+a
 JaPOlv+y1Gydv5xSuOc6A4/xsj4bYcDmU9v7F0q9bL8PwuMdzTX2C3QcpqTaNESo6ESjdLGnSQC
 UDOuFH5DTivmNSZA2j3S1tkFyrkRoKC4HpGf2brlqlFV0CzjrhplEEo1houxaNc50opKnfnSY0P
 UOGOX5Hnn5YvpB6OVT8DIQY93acypB0IZys4mklgv0j2nCVseYUkFi2ga82EOKJE72itirstiHr
 rEg3oD15Mm+229wHkEpCPXIGfjXRkwFgOKUVvMEJpIfH3pl71JKD/3c/WDzv6H5popQK4puDPER
 +Dd2qK9AGNJtDewE/Tg==
X-Proofpoint-ORIG-GUID: lly9dLQ9twDymCjIyijl416JTD7HhVSR
X-Authority-Analysis: v=2.4 cv=T4uBjvKQ c=1 sm=1 tr=0 ts=6945232b cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=w373o-ZMvzc93a0z:21 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=M5GUcnROAAAA:8
 a=DZSnwkNSkk__NUsnbCUA:9 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22
 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: lly9dLQ9twDymCjIyijl416JTD7HhVSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_020501_443111_65841861 
X-CRM114-Status: GOOD (  26.52  )
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

On 2025-12-18 at 12:06:47, Wei Fang (wei.fang@nxp.com) wrote:
> > On 2025-12-17 at 18:19:19, Wei Fang (wei.fang@nxp.com) wrote:
> > > > > -	res = stmmac_xdp_xmit_xdpf(priv, queue, xdpf, false);
> > > > > -	if (res == STMMAC_XDP_TX)
> > > > > +	/* For zero copy XDP_TX action, dma_map is true */
> > > > > +	res = stmmac_xdp_xmit_xdpf(priv, queue, xdpf, zc);
> > > > 	Seems stmmac_xdp_xmit_xdpf is using dma_map_single if we pass zc is
> > > > true.
> > > >         Ideally in case of zc, driver can use
> > > > page_pool_get_dma_addr, may be you
> > > >         need pass zc param as false. Please check
> > > >
> > >
> > > No, the memory type of xdpf->data is MEM_TYPE_PAGE_ORDER0 rather than
> > > MEM_TYPE_PAGE_POOL, so we should use dma_map_single().
> > > Otherwise, it will lead to invalid mappings and cause the crash.
> > >
> > >
> >  ACK, found below code bit confusing
> > 		case STMMAC_XDP_CONSUMED:
> >  			xsk_buff_free(buf->xdp);
> > +			fallthrough;
> > +		case STMMAC_XSK_CONSUMED:
> >  			rx_dropped++;
> > 
> >      Ideally in case of STMMAC_XSK_CONSUMED, driver needs to call
> > xsk_buff_free.
> >      And in case of STMMAC_XDP_CONSUMED, driver needs to call
> > xdp_return_frame.
> >      May be you can move all buffer free logic to stmmac_rx_zc with above
> > suggested
> >      changes.
> 
> For zero copy, the xdp_buff is freed by xdp_convert_buff_to_frame()
> when converting the xdp_xdp to xdp_frame. So STMMAC_XSK_CONSUMED
> means the xdp_buff has been freed, it tells stmmac_rx_zc() no to free a
> xdp_buff that has been freed.
> 
> I have added a comment for STMMAC_XSK_CONSUMED, see
> 
> +       } else if (res == STMMAC_XDP_CONSUMED && zc) {
> +               /* xdp has been freed by xdp_convert_buff_to_frame(),
> +                * no need to call xsk_buff_free() again, so return
> +                * STMMAC_XSK_CONSUMED.
> +                */
> +               res = STMMAC_XSK_CONSUMED;
> +               xdp_return_frame(xdpf);
> +       }
> 
>
 ACK. 
Reviewed-by: Hariprasad Kelam <hkelam@marvell.com> 

