Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70171088E45
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 22:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBQfztnTegzW29zYjO4bRrqAt8SvJ6u0ZfA1KTQ6Eng=; b=ewhGeo2Ye6I3RaCACJK4ces9FK
	rbvWcgRGQV8sVVIQh223nCIJOrhOXP+DY//yB4G6q/sCRMnQyHguGZTB5HX57cru9yAxRMGqVSWXb
	6HXTGHYl7v2427cLVCf/itG1WtJjIif/fn36hvjUFtYG2fbaCMSTLFsWAjytspCkl4RQSBk/gRGLJ
	v0iibdS7xPxwZ33ooXeO530NEHkhY6wgv82QucSmNYh1UOeFYIaBpsieEU5vlbQHw4ZHQTXElb5pI
	QNGtM9OQILt93nc5wEtyPImA2cxXcyt8inanjMTAICLh3MoSUG4fYadAmBjtHnzewtlptp87IhMW0
	O2LuldPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2yvj-00000009OwR-02gn;
	Wed, 18 Mar 2026 21:59:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2yvf-00000009Ow5-3zNP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 21:59:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFgrq31929029
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 21:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LBQfztnTegzW29zYjO4bRrqA
	t8SvJ6u0ZfA1KTQ6Eng=; b=ImuPffFzh+izuKvoUtZOB0iA8+kgAAkRr078s41T
	ZD/M5cof8k4lJNIXOExcLiZM5Xbb4eXkDorZ0rlqdBZb28FfgPX0+dA11ZhrLzcy
	z7X82mLhzRXB0vyhPBE8YsUNkA4gINaFYLVyP372flfafTqDlESBCERgzP4xl1Sw
	DAexbPokk+/dHj1rzkcKx5/LsQ07J6aQ7L/GLIxaX2Yaq2pk4nMSX239Qyi31xb8
	LF3Vt1G23Usi0uUJF2wzdcFQnMYLsNeUM7Vu9sUAJS/aNJszlqk/9bU00B7v6MX/
	nD9fVQgIkr65NBxzhCd+ciOnqKHcgMdZnd+v72rxst42DA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyut1a2y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 21:59:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358f058973fso666627a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 14:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773871189; x=1774475989; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LBQfztnTegzW29zYjO4bRrqAt8SvJ6u0ZfA1KTQ6Eng=;
        b=ATMlb0B/cTfKUrb974vEPU4+5nN3QIOJXRgxLHVGPrDJEf+67/HEQMevbDfiSMVSQR
         rG2G2oSphnSvi09UtynpLD5hAsp1+QunU/3Pj6r6ts4ZLUL4ZltutRisE89R8aweX//e
         GdmFtTXdMH/RF+30bCtIyCJ/9gTTZ/DJV0yIp49UQBaeyxBExIXv6pOQ97Il3TNd6Xkm
         w4h9nmRMzh5Gxu7TG0le/kc/MMpz8JgElDFQfnKsO/5BQFIKVsDt540ONBkJJtC4/w95
         YxmcCxfs6TadECJAAdgzWUxf/PXXBYW9ZZVtyFh66ayQkj404PQo83HyiD0ECzPt00Zq
         xM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773871189; x=1774475989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBQfztnTegzW29zYjO4bRrqAt8SvJ6u0ZfA1KTQ6Eng=;
        b=R/ZD3cO6YSyZt383mq+eRKG875NRTileok11WodK3fr/5KzdGFT7BhDT1I098OqgTJ
         fiLNJe7s0CtX/isU3MQy6lRS/2IfPhWCBr+Kh+9pUpYRxQ39lmA93Yo1Cu93oN1pnvfA
         kP6WFxt9rj6d0OAy5z0NiTWjG7PJXYL71mQezZ8DIdtiFfjlMOpZksylBFsF5eGYt941
         31PtBqZV13Lu9oswHu5uZGsyELNcipXevGV1se+uYfO3n3zIOcN6qBgWgSUMji68zVUX
         OPEZCcKY1SXeqH1wZdItyiUghE+8yVYe6MakHnDJOGJNi9s/pha/0MjKMPLgfCn0E1PJ
         5UQg==
X-Forwarded-Encrypted: i=1; AJvYcCWNEBvK0RBjRAN3n2zTEwnHU2oQLM5DMepsXnZkDk19ypZzGklVR3oCk5cRWalCAJSCt6QMM7sFlHzE45jZhIfl@lists.infradead.org
X-Gm-Message-State: AOJu0YwMnYlgwqJTs3CnwGAC/LrLpFe7X/X9qOtigtmR9rEsdjdAP7Fu
	DgZZn6AhrR7EIOQ+q/e8co8eDcLtOS/9vWpdd8K5vqAIfatLZW8jcu7ddnMHRZsHhcE96k8UqNv
	l9l4046n//25vyFb9GJSzwpWGdqKFqSsjFdic/wJEs3n+KltX5d1c9i3ooOO4uLi1VbQUFDX0uU
	dNCw==
X-Gm-Gg: ATEYQzyUZ5ER583bWU/v9MIYYvC9muvxWMoq2Qu4GR9Hcf8d3kbn4+Fw0rs7+4NpAQE
	jbMSrbD7zJKWrVt+ZqblqpLRDDc9kwG8RibhkjIpjwIK+b4zZBfnMcPv7UfhJzl2Lq+NQscXGBv
	McIb+ptffZMnOREkrNTePIytCP041aldtL2I4wLNeVXgFBCEBWroS6sGT4IFI5a86BSbEQDCm0z
	4CpT0g1q7KtrZixfPZBYYcY9kbkMh+xLqdNbeGvQT7W1EDOtljDMRsyTptFTGTD07Lpi3Vndyb4
	xnvWUET3J8f1usNofKdSUFITkfB/a0AXsRyPDZa2bD5BaiPYN/p8r0mjZVqdAc7oe3AOKN8Jh1N
	LRzNv4NsNWcaGrKLjEYusT2U0l3wWTNR1pOk=
X-Received: by 2002:a05:6a21:1343:b0:398:9ae9:7110 with SMTP id adf61e73a8af0-39b99cb7f07mr4358094637.11.1773871188673;
        Wed, 18 Mar 2026 14:59:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:1343:b0:398:9ae9:7110 with SMTP id adf61e73a8af0-39b99cb7f07mr4358071637.11.1773871188066;
        Wed, 18 Mar 2026 14:59:48 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e0dfdddsm3291363a12.14.2026.03.18.14.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 14:59:47 -0700 (PDT)
Date: Thu, 19 Mar 2026 03:29:41 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 0/8] net: stmmac: improve PCS support
Message-ID: <absgTcRS+JAdBs3H@oss.qualcomm.com>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <abdEscs44fU4kRag@oss.qualcomm.com>
 <abdYu864OmNWiWIW@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abdYu864OmNWiWIW@shell.armlinux.org.uk>
X-Proofpoint-GUID: PuWLvMoEn2bz5X0kGZsudcVsj9wNPpis
X-Authority-Analysis: v=2.4 cv=ModfKmae c=1 sm=1 tr=0 ts=69bb2055 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OIreufjBPOA6zABoq-kA:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: PuWLvMoEn2bz5X0kGZsudcVsj9wNPpis
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE4OSBTYWx0ZWRfX8F0Rfd7/BPSX
 WLY77mum8nY2N3AQKtPNiylT6F4gHehXZKiyymLRp93fu4Woxk1Q+HhLF1CSQOccwxpwKb2mTNC
 jEYM+pS1gSSVZEGyM66f8fkIfFqq5AR9EUgf2WbU1qcEOeVt+vCvxrYfMI0TKafQ7vIVvjAx0Ka
 YGebzi/z/JD0tEOjgIb26NnO/+vt2B9rXxqEdRFw2KEoJauUt0tepXi7nBSsJkJCbPnIqwt8DhX
 DxcdEyWhYzU+vYnrMtS9WGk9hknB6jwEEvEt6CNlubyMOYnsuVTARDUGIqeRLTwGNOZgw25pU97
 cZHTvddst5cGQMQNFNpIHTjYuUXmL5+aWgJhP8rS7C+A9JnNFW6HLxxP93tLz2CFP6e1yAPlvgX
 TxA5nBza/9pcRgWzjt+OHZzdYeqQgbpgtZ3CPE3dMg3OsGKD+vL2EgZBvQuAckfjd3RH73uKEcx
 qPd4PwIdyqTWFZ7/nAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_145952_151412_9BF50790 
X-CRM114-Status: GOOD (  22.71  )
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

On Mon, Mar 16, 2026 at 01:11:23AM +0000, Russell King (Oracle) wrote:
> On Mon, Mar 16, 2026 at 05:15:53AM +0530, Mohd Ayaan Anwar wrote:
> > 3. With the recent VLAN filter changes in net-next, ndo_open takes a long
> >    time to complete as vlan_restore_hw_rx_fltr() tries to write filters
> >    for all 32 indices. This board previously timed out once, but now
> >    times out for each index. This is a separate issue unrelated to this
> >    series but I added the following workaround to rule out any timing
> >    issues.
> > 	--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> > 	+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> > 	@@ -158,7 +158,8 @@ static void vlan_restore_hw_rx_fltr(struct net_device *dev,
> > 
> > 			/* Extended Rx VLAN Filter Enable */
> > 			for (i = 0; i < hw->num_vlan; i++)
> > 	-               vlan_write_filter(dev, hw, i, hw->vlan_filter[i]);
> > 	+               if (hw->vlan_filter[i])
> > 	+                       vlan_write_filter(dev, hw, i, hw->vlan_filter[i]);
> > 	 }
> > 
> > 	 static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
> 
> This problem needs solving, and I suspect we need more than the
> loopback here. It needs detailed information about your hardware
> design, and comes down to the missing receive clock. stmmac is
> unusual that missing clocks affect the accessibility of the host.

I tried finding more details about the hardware implementation and
it appears that the receive clock is sourced from the SerDes PHY.

As an experiment, the following in __stmmac_open() avoids the issue
on this board:

	qcom_ethqos_set_sgmii_loopback(ethqos, true);
	stmmac_vlan_restore(priv);
	qcom_ethqos_set_sgmii_loopback(ethqos, false);

What would be the correct way to handle this? Right now, SGMII
loopback remains enabled from qcom_ethqos_probe() up to
stmmac_mac_finish().

	Ayaan


