Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2404CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTLmtc9ksI3Eco4GNG31SXnNUS7oWeItGbDEBkSUCOQ=; b=2k+x2xEBS0vC8u0lQHrkxfgmCb
	PY91aKVdpJhqDT7zTGl64vHsCemHCsaPOKp0a2Z/uS7jmfWMwb0XSujZENlCQJZZBhb7xm3tln7U1
	oq8bTYlRnuf7omYZ95X9a2e3186Mne8UID41hUu+iTE9OqHBAKcaFhB+kbZNRTvCkkQCSeUlEbRAt
	Gk3PIfpht4roe/nXKijNg8cLwxS0k4+vbFD6kt8l275GlgLonQrMinAve3d5+sb8m5vFuNi5q/qvZ
	wB7T7YEWffka0kdSL1J6cH/Pp0yMAJYGA7erwx7jZSK08xSQuy5DMmrVPj0KwsninLoDU5dcSaGkp
	gn3GAupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWif-0000000G6K5-38zV;
	Tue, 16 Jun 2026 16:32:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWic-0000000G6Je-2JuF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 16:32:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GFesJF4131791
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 16:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HTLmtc9ksI3Eco4GNG31SXnN
	US7oWeItGbDEBkSUCOQ=; b=ghlKm+wzr3rwcCYPHJJPPl2IabGV0RObc7v3ufHv
	Af5mdpjw84AwRh4yDrZg3SpfLgkcHAeWBh0FHD0z0HbXdz1N5fNC9k/MBSGSJxYJ
	Z2iJ5D8JR2YlecMzmtQ7caUkP0MhxI56qJVTW5YrCMK59E0NRjz8QaTEKSJuo29z
	Qf5GaL89jZK59uwBwfBZHjYlGG8E/O5iy+LogQu4td2ds3oc7q7m9Pg5nhPEtYd1
	vmdpqekjL90bSW64cEE2Ax7UZGoodtiIkytS55m+XsyGlzKR/ojDXDN6HjvOQLlZ
	WJPlWseHn3+joMGIsr5VZocLhjov4eRdEowpDtqduzflgw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1epaj46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 16:32:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf11699875so355825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 09:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781627572; x=1782232372; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HTLmtc9ksI3Eco4GNG31SXnNUS7oWeItGbDEBkSUCOQ=;
        b=MRXP/BtDFKuL88fC4N7U9aPD1HfkeQ0QdcKf0tM7cLkBFNxWYBmc+CdaKxSUGVAQU4
         su0chvscJMJQ2NR9Gcixh7g8RuoZauVsFrO6jy6XqkvUu3FyOn94Z7Iv+LlUhG/o8jlI
         bCdoYWqVxEeAUFooVbbbFQQoYt81aaMVR80IDsYM38hvozVPus5D+m9KhNnbN4YcedlV
         LpqaY1cWAltbi2A64c4Bhx8snkeGgD2PpsqbsRMeofLu+66BVFmRsdLjtHuy5HmxOe9I
         gECPcY2CD2KwyCUoF9Y/tqtm4WevPd1hdqYoxQSln6gkUnMj7aArS8kxf2/jkASFRTZr
         Cvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781627572; x=1782232372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTLmtc9ksI3Eco4GNG31SXnNUS7oWeItGbDEBkSUCOQ=;
        b=hmdPF0RruU03s29ZwdvBzXj/ZdW+5HFBHbB5A5AONBmKqHp/cnkyJ8bHEuK741wOQ+
         R1RXqXs658HKGvOTTsul/17kvQhgZvioMcfaKnbNUv3E3O8/5gvT7IHFLuoSpn3uDbGl
         78aQqzeOarmI4eAsrhXCa2n03GOFISQTmdrYNXZi/7bCL60WrMFKCIBc9VnP4vI4RJPP
         7CYJogNrDaUkWHAIJ0yYWCAcUZalZuVFv5mEL/QeFWF5SeHPfO194+eVW5g5w8Wd5FLN
         jiM1rEOIanbaMsyYJujasNI5G/rTD13g+qhYI2RcVYccRpXd5vMBVW1XOU0fCe4Hekbd
         99jA==
X-Forwarded-Encrypted: i=1; AFNElJ8WC1lqgv8YxRPXogGVvobY5du43mBDPojPdj2S57ThXOWJFg63BQaNem0LIaVxLmEpWuK+eDjRa9Remrfy8YNL@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzqw7ehFEqpnkj//MUYIvOrJQmQptGXGcOkj/FUqBpsGGjWj+7
	mBBRO1eqCMlUF7qW2QHx9h8OLCwGCLUF4XIUr/sZy5ouac7v/VuIue7MqZoEHxtrsE3qZ8TULHB
	MTGgy9PXGMjrbQKnmbHXsWjPwx9UWNFl87yeVV1MwBJNwbIyZKlTwUpqk+djEbQpbTOjkj8qAVA
	z1GA==
X-Gm-Gg: Acq92OEjOyiU8I0qGxW1j35HRkPh3MiMWI0USc08wTI6FhZoDn2kuooN23yChQ98Cti
	iepZM9K2Q26Bvokp8Myz/aZXwgTyDeAmgCNt97ujaquYa7Drooi2LFe4I8u2xFIAdwlETAQAoif
	JFwOEWFMvN+orllWG8Q97M0QP4S8gCiyfOvhjXm/gdCmSgUQ/giKA/N8cAkaPdrsck2ZctOvehl
	htO56+ipFWtYzqp01LlrSfkU9iC7gQ9Vt7Ko6+r9bPEAcl3QLQi1aVsys5+jNWnJDQOkBHq1tOD
	MZ096saz5iDKQUJQ8pqiBx44t6t0b+8wwZ+BsZJvIim1upi1lBfOaQzFsm7tZ4/u0y2rVqTkTAB
	XJQ+yy9udzMyExTpEOgJo9eqnoo64BSMxwf0=
X-Received: by 2002:a17:902:8a93:b0:2c6:6425:b343 with SMTP id d9443c01a7336-2c6b877e63amr1906475ad.6.1781627572069;
        Tue, 16 Jun 2026 09:32:52 -0700 (PDT)
X-Received: by 2002:a17:902:8a93:b0:2c6:6425:b343 with SMTP id d9443c01a7336-2c6b877e63amr1906225ad.6.1781627571526;
        Tue, 16 Jun 2026 09:32:51 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac72asm145948035ad.38.2026.06.16.09.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:32:51 -0700 (PDT)
Date: Tue, 16 Jun 2026 22:02:43 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode to
 use DLL bypass
Message-ID: <ajF6q5eKz92ddqVl@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
 <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
 <ai93X/cNWHtEQsDt@oss.qualcomm.com>
 <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a317ab5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=1fSEK5Xs-BiMaI_fvDcA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE2OSBTYWx0ZWRfX4ezrex52aYZg
 uIuA9ikV9sChD5fJTrR4KNCdDegUnbEAjD+TZBczoLmCNuZ4sxn5XnKyWZxO+d8AoqZ21RDLUuQ
 eE71hVjrUaQmcfLBppb0lAHVb2hcuqA=
X-Proofpoint-ORIG-GUID: u6MA7R_1eCdbhGZerk2m8TeqrsTGx8_P
X-Proofpoint-GUID: u6MA7R_1eCdbhGZerk2m8TeqrsTGx8_P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE2OSBTYWx0ZWRfXyFT3iZM4txUa
 zelbBkAqEqvVAaFzfXvpJEICpIKqBTzpG0Bws6UiXZM5f0gk0Sc991LwVh8BY0fhSn5gSYLRNGp
 XsVtN99/gmICIpAqSXoPu2bl+OO3YPCV39lPxeCbfBQmUt8eFcQwYfKcKHa4m6kD1kDpqATSYtI
 N2hmBnE4HspEsOa4Aud97olU9O8O3IlMj+a276crThTzvEbL7GuWoIFmgRHrlgZVadh0r0xwdF2
 2K8xOXYxZy56xkHnaeD4SCRnpzP6OcXwtWM8PsoRMV9kNwRPtIYIUgevdGmcJMp+wLaksjvPfHo
 bMeYil+pIs50aPgzOoRd42APUTIsgCKNhadryhSTMkm8vU9xPjbEc3HsZ98lxGpPfmtwg79re7Y
 VKKqkZclM3S+kOiWSHKdQnSNhNbPqzFMCwE9kAD7YAmUf8VypTnQ9ufSr9kNeh0cC9hWRaicA0/
 6nNEpkOCWZdVQDDD7kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_093254_710537_C861DD40 
X-CRM114-Status: GOOD (  25.32  )
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

On Mon, Jun 15, 2026 at 06:48:55PM +0200, Andrew Lunn wrote:
> > > I'm curious how this works at the moment? Do no boards make use of
> > > RGMII ID? Are all current boards broken?
> > 
> > Searching through the DTS, I found that we have two boards using "rgmii"
> > (qcs404-evb-4000.dts and sa8155-adp.dts) and another board using
> > "rgmii-txid" (sa8540p-ride.dts). No board which uses RGMII ID.
> 
> So this causes problems. We cannot break existing boards, yet it would
> be good to fix the current broken behaviour.

I am trying to track down the sa8155-adp and sa8540p-ride boards. The
EMAC on QCS404 is extremely similar to QCS615 Ride [0], and I got that
board to work with this series (with RGMII ID mode). So I am fairly
confident that QCS404 would not break (if its even booting up with the
upstream kernel currently). Also, I think we could change the phy-mode
for QCS404 to "rgmii-id" from "rgmii" if these fixes go in.

> It could be the best way forward is that you issue a warning when
> "rgmii" is found and pass rgmii-id to the PHY. And you also change the
> two boards to use rgmii-id. Lets think about the rgmii-txid case once
> we better understand it.
> 

As Konrad mentioned, it would be great to know if we can test out these
boards. Looking at the different versions of the ETHQOS programming
guide, stopping MAC side delay should be as simple as what we are doing
in this commit. But whether the two boards work directly with the
default PHY delays is unknown.

	Ayaan

[0] The proposed RGMII fixes would help enable ethernet on QCS615 Ride
as well. I see that the original series had a lot of issues:
https://lore.kernel.org/all/20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com/

