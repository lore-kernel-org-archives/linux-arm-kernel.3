Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0FFE9A036
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QQfKD8GVBA2aksYDATKy5SStCQ8N0yPkSM4M0vZP0w=; b=24GzXm6XBmoGGryMQuz3PbsLp0
	2K6qplubMCRBoGweR7bGBG8pfc4Chr6hJwL6rtDCg4WNowMZnp2sZYWG2Q2riS2dS1zTDfRZSrNxw
	4VsyAoUIUhJkq8PsyFEyFOjAvnEWi3vtDXLYnWEPiqtXjobR5Ooy7OE9LnTwBWs9bEgMdulE/rBWR
	t+vAI53L+zFCntsk+cU6J2eTqLWGFINKkLyBynWpf7ljIjq20CGeykgTsMLg+N8OJZizdGNafqWnM
	N8oLN4QHeymjZ6ZQHYfqB53pHUcBkrlqq2QIHAt5PthTjLs14eMCqlNjbYfCtrIPA9tuEv9rDeeP2
	7bMk5JJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ09-00000008jyl-28eM;
	Tue, 17 Feb 2026 18:40:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ07-00000008jy3-2EWI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:40:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBvGB71067216
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4QQfKD8GVBA2aksYDATKy5SS
	tCQ8N0yPkSM4M0vZP0w=; b=Icz67uQZ1w168zYFAvuoeuarGF2Bn3D6hMvtUWNg
	zmTKVF3NpQStoRjg8WUb7wjYfAQI5z2BZMpvLmLpEHs1E/Q20DbCNoBEhR0sPTax
	ze9EMQknHWmfvSyf1zda+OpzVx3KY6WCHtjl3l49nAeUzR3SgiMQoLZ576nPQ7EM
	t8kwiF7RCCl7lVzF4qpCXw+Amz+clkZmYoyLKpnbDKt1g37NcoQZX3LHu1jSk2Wz
	vk6jCWqZOgYLKWYjC6TS6Pyd8lITbPGK+9Sx6zJ21h+l0ZHxpWH2CZI9CwcXIDez
	ETlIK2eD9FTSwSqfXkJxZtqsXnZHIrX1cxmgGtH9aarCjg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d83jcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:40:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8249a739d4eso11489335b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353646; x=1771958446; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4QQfKD8GVBA2aksYDATKy5SStCQ8N0yPkSM4M0vZP0w=;
        b=NKKSvkvoscYsDRP3OV3RP3YIYpasGpDo1iiChNsKKRD7++ESVjhz8GuAubOClMnaLS
         9aIddGM5bMij5+iWqxd8ZUJ//DjCuLA6OyLorOOA/GBLHgfXCkSNr6UZ+P1vDNlSVGZq
         /OdeT0IxsywgDGV3uKhyn+SL3SBY0AiPbDzHAgXKAFyIy/YO5BIt2YtSIIxYUkWJEZts
         jiJgCfR9EQbUDT9Mh/xZqeP+21pnl2d5f8WBfPlxSSzyChfkyr+NtA1Mv/feMXBLifMy
         M9QmE1ZITIcEzH0TFCejPu9n8aPTQy1uN+dw/lecS90zzY+jWZzvBrOEwKZzEuXNO+As
         4A3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353646; x=1771958446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QQfKD8GVBA2aksYDATKy5SStCQ8N0yPkSM4M0vZP0w=;
        b=jFCCzmBlTdKMIkJuiKwl4MpP2kWmZs5AAcQxd0YVm3CnulD5W8S8OKDwV9LaZb9OlZ
         6QN6DWvwNJVSO1EjLxTeKwe6hWas+1935wi+bJKec7G4KXuNEjLe+FTjCRh56xXpwZfL
         3codLro82J53Orna8hTKCbYTrMhELuFwnXoHypvZ1jOqgxqH2lWWWnxQ2IwPHc0C+Sqk
         NbmFM6d0c2ROjbap4zWWUtxICJMbubFbAyHt8dVydN/QM5GQpFJpLNs/VoxrRt3kHQDV
         xrQczSIdEKJveBZD6VByJ/XLu0ow2SgGju3VodnwXV6y2YnpksK5Lkj+2Pud/LnA3Tr1
         Y3vg==
X-Forwarded-Encrypted: i=1; AJvYcCWxEwMzMxfbKEvWf9rdzeURHhKCIW4GDixBO51piJ5iLy8VQ96pAidHEF30+6x6Ow+kebmIZIiq46upvAmVjTi7@lists.infradead.org
X-Gm-Message-State: AOJu0YzTK0Kmx7aM3DJ7ajIwg1WS20k1BgES3A1QshfeaXfOgE1Oct7d
	LOd7fdhNO5OaCbbPUv///kuLFL8YRBEGiPqdtGqME2Bz0iWmfTyCNqVumMh++2XzRUjpFVx7zwV
	f96Sjg3PrEeI7lymvyqDYgKdx5nRquJWjCNmCo7MZznqGPqc90JcLCbjJNacefqpxtqTaWvcDhY
	yBlA==
X-Gm-Gg: AZuq6aJEFezPML3wrH0pC4NTNvAyoB/fsGxgAVR/k5Japu8WGWJdLaBg3hWMYwe4Lm0
	r09qyDqVrvNRTHhbpbN5065KAcUR67CGyJ64GPSc5sD0+61UmM+mJOF14oOmylz4A0nkIBRBanJ
	wniG5SuzJyHS/09ERLmQNcd+b037DU12qIlxN9q+jFfgvcmmTe2DLOeI31sJNxT1ZXnid8EWDXv
	pRa9wDEV8/jYD1Htz2ZNt2BDVmUiie2p46eBVc91WE1Hh/fbpAouO4B25uOsRwo+lGx+JrXpIq+
	9RBuwMMwg69isdkmVic0calzXzJLxTaIZon2m8TjlMilH1MHx9JX5VijFrvXhf+vPt/yu5Z0kbx
	dus8kyFTOs9wrgZ4AM8utl2qX806KUAbeKcM=
X-Received: by 2002:a05:6a00:2395:b0:823:998:95b0 with SMTP id d2e1a72fcca58-824c6102044mr12985344b3a.35.1771353646320;
        Tue, 17 Feb 2026 10:40:46 -0800 (PST)
X-Received: by 2002:a05:6a00:2395:b0:823:998:95b0 with SMTP id d2e1a72fcca58-824c6102044mr12985319b3a.35.1771353645747;
        Tue, 17 Feb 2026 10:40:45 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b9a0c3sm14187532b3a.51.2026.02.17.10.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:40:45 -0800 (PST)
Date: Wed, 18 Feb 2026 00:10:38 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next 9/9] net: stmmac: qcom-ethqos: move SerDes
 speed configuration
Message-ID: <aZS2JpQAO8z2xej1@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPb-000000093mx-00Jj@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKPb-000000093mx-00Jj@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=6994b62f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=K0zUmU2yKo6XzqUEZrMA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfX2k8VdGkd9D4G
 N3/tQyIwCCeDcb2MdQhwHgPJXmcEFZ1gALLmQD7z4fjx/+voPTkpK3+tvHxovr2oz0G1/vEKRsx
 9uextbvuRI3LVtyg/VsUGKcsixDEoER029dB7LQVB+pfRGZ9neZSMWW4AnnBeKNZ+6ByWpcxu/1
 hBukAHDRHfTi4mUgss77ApkELIj7FSF/d/0JI3r5A7Qy9tmSp9z3aPqoFSXYzOlVDllUK7VHYEh
 pVDLRlkF04RXfe7RF1qdjYmRT826QTC15z9HgN2+U641CSqCilRguaDsjjRRudXyv0mqgP2DElT
 fT6hYe32Lt5eodqqbzcuBZjDiHLOf13julIJ7GLBXmIQ+hAnret36v4A8l7zaw60s9kDbi709Ze
 yk7mGOBRPOg9TKTOcraquxwbhxEWyOOjzkaDitS4tShooRsdGrYakGR+Tm8zeGOIpxZBMY4bfbV
 CIMryIQtRAm2CVg+DKg==
X-Proofpoint-GUID: EvOxsd8oG8C_DvpHFt7cvWvmRRv7-JgA
X-Proofpoint-ORIG-GUID: EvOxsd8oG8C_DvpHFt7cvWvmRRv7-JgA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_104047_572128_26663345 
X-CRM114-Status: GOOD (  12.01  )
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

On Thu, Feb 12, 2026 at 12:18:27AM +0000, Russell King (Oracle) wrote:
> Move the SerDes speed configuration to phylink's .mac_finish() stage
> so that the SerDes is appropriately configured for the interface mode
> prior to the link coming up.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

