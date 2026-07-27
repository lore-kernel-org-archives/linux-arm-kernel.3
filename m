Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D9FC53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkdWnQuMpd+iBrUuzN6qCMfq8QBHq95joAhH8/IHLoI=; b=UyTYjQtgjx2wnYRUVAZ8EAuH9Y
	jazFid7a6OyGJov8DbzoAvVeo00UGJB+27uP/bJq+2xlSavtpIwYA0dtOL7U0D4sNO9ythHq6QynF
	3WH7cesP8fQirANtnT+p0Txh8WnsJYWTX5NIrGPa1Dq+PF4ZrT2yPu7t2bdbj/+YgSM1mohhUwO4Y
	RRmrw2pESOwNQhh9kBVYfSnTCqBdZni32DKL1QVxxBNPhwXP0jhL5C2JdbP/l9cLISj53B5jIMbYJ
	5WqqyN4XOxzt8PgEL1k9Zv8uhx9Lk9bM2xbAW6aCayb2AFemcfPjUAsTuPascXzjyYgKIJVplcsGO
	PXHa0VKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLoC-00000002uYQ-0JZ8;
	Mon, 27 Jul 2026 13:55:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLoA-00000002uXv-0h2k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:55:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlfIS033185
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pkdWnQuMpd+iBrUuzN6qCMfq
	8QBHq95joAhH8/IHLoI=; b=lIWEDlJMUMOGG9hTGlYBziKueCiRCG3/k+Fnr2t3
	TH7vCltg7/HmslvNngNA4lSAcdMOKlAO28IjJksPtRhpal3guLTRL/udcaL9UKfP
	psEz7NWY28VEVuhO5lPvl3s9OT+euqIYjSNn17kLdKIGd8ht81mUmoRESC+dUAT/
	MhE5U1MmEYTleS2j+UGUaVP8VKuyd41fKx/Jp0zFma1ta/mFTpyTpOPhmGZJ0+80
	Xf2/ZcIZlagtStdxbQ1vHTlkVZ7Rxp/vtUhd+1AlYqdantfKSWkI06AuMfkvj949
	uO8eBJsOp3qZph/17JEJeBuEV2O73L2cdb5vA1orkGC7Rg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c6133g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:55:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c12e43b98so34654031cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 06:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160552; x=1785765352; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pkdWnQuMpd+iBrUuzN6qCMfq8QBHq95joAhH8/IHLoI=;
        b=ho0jYqThpVN7dozdlsmclPiabWNmpLWatTdZdYUOWzB+DoIx6yfauMSyAiyLOid0mK
         e7NnUj45g1ZtFwmefyWr3+MzlNjVSX+6UNboZEz3/jd7i7oN6r+1tA0x3XViZxUOcANj
         Xze3a7wOIFwjp0CHesvLmZd+bzAJNetKRKKN1xBktbeQ20iA3KBgLmIMxLc/u0nz7caU
         +odj3AvgnX5fOG6c5RjQHfoJsLMLcrz5MIkgAKrkos16WVFO0S2Z+mv4W/rP0xSCYxuP
         3u9KBfNtMJqeZxyTLxk0hH3p3BNkPTZ1hB4ZuqHxolHjBRnlxy0Vfl2UHpmghzZUITEb
         gnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160552; x=1785765352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkdWnQuMpd+iBrUuzN6qCMfq8QBHq95joAhH8/IHLoI=;
        b=Ge3SJkwzQCK2jckACsQb/KHKS116+L+HVZqTloZhwOQ0uZ5C3ChQ5vBV95IRK1GP3e
         YLXLYJLmnAi8b8CkkF+kqFdEWtzWTOEevFAcYJln2JD2ZO23ZJpPUjX6evtVStfYAMGq
         kITVyH0nk5QfVkraB2+wVdiXFEsz7OL62F2dGnjX6SWJjeAM0RVRJrYjVUcx3X4uR09e
         f6FvBocx/mVQmZ8kf+10egAnTzkmjYcuwkcVFm3I/OGFsJfH7MqQ3EKvhNR9xDEhD1j2
         RkiopE4CzTZpULcOrwscvC/R7jBrfUrSOu2OgNOd5yFtNvq63Ksl88TuCfDAM0Io9qaS
         emRg==
X-Forwarded-Encrypted: i=1; AHgh+RpmMAWs9Oqe/kYdcTZnI3zRGOeVDjjF+AlNm/8L6L0/jU+eD+mqZ3TcyCFZenXlIy4mHV/6FsxGNCPBjFbNfzhd@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgi7fkz+AVe7amvuF+sjUL/5mBkXb+0W4Ne8RFyW2VO2+h3MVH
	FyI+SnHCmVfYOOcVD5s7ahz3NnUPzBwPH82ZeuYnDR1sJZd3WtLQxvd2cGadEYaTzuWBHIIgrSE
	zFluQYlbiGhHylEyk6TBuhS0wdatUIEgilD2e6zeg9voxxOuaHDQu0eDaWasbTX4bQogKMsqdo9
	7ibA==
X-Gm-Gg: AR+sD1318B3MMKezft3KJL1mzvve158zF9fU0RboBPFfbOH06IaFjFUGJWs1W4OxwiW
	W6FpWmZfcSCF7wEfSoK9T6sBK53YJQ71e7YwC8F0nJ19YF+sZTSQAbaMIcr1up/zdKmtRtblR97
	ao9VzQm7VpuJR4U9pNh/URaZOzk1Y3JwWQ+LLiYovya+Txil10NeHWJK3LZ8kYAnkIA4ExSuoPr
	mwNbn+4gWRUB9DpO4QHSkA/50B+DCALkEhgQuHw3BdsAuLjbYWZeBspPxDB4EIhjKh7TN/MlS6M
	V+4OzGt8cviBWOYUbCWjkRCgQYr7KXJLIzSP9FF3zmGX2LOcY/lROy1NPkQ8NnKlbcLyQQTXN/a
	+EdMbLzyrF7DLDxM=
X-Received: by 2002:a05:622a:5889:b0:517:78c7:d93a with SMTP id d75a77b69052e-529ccb0d75dmr10017961cf.16.1785160551696;
        Mon, 27 Jul 2026 06:55:51 -0700 (PDT)
X-Received: by 2002:a05:622a:5889:b0:517:78c7:d93a with SMTP id d75a77b69052e-529ccb0d75dmr10017541cf.16.1785160551242;
        Mon, 27 Jul 2026 06:55:51 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm51706327f8f.31.2026.07.27.06.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:55:50 -0700 (PDT)
Date: Mon, 27 Jul 2026 16:55:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 10/10] arm64: dts: qcom: eliza: Add support for MM
 clock controllers
Message-ID: <raojtphmpetjitaiaf7e77qvs5zhv24ga4wix5klndbkcy5t2i@tcyrm2xzoape>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
 <20260717-b4-eliza_mm_cc_v6-v8-10-5cca1bef2e48@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-10-5cca1bef2e48@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a676368 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XF3s6JUOJAP1l5vmAHgA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMSBTYWx0ZWRfX4XWF4xeg9n2k
 e6E3kYC/WWRxN6EjYPhE45BI59vID0ZXAwm9OYp5DaR7POxgDY2yI0apezrVSzW3xRlg4j5Aij2
 k3Q9lGzTVAiwYDyLN/x7BhTZOUWMz9Y=
X-Proofpoint-ORIG-GUID: ZIhK1tOGS4oNuJj5Er9xmshiFUrK9Nya
X-Proofpoint-GUID: ZIhK1tOGS4oNuJj5Er9xmshiFUrK9Nya
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMSBTYWx0ZWRfX/Q4jxFqkd1wo
 RKEPeP0Q52Xml1TKFdCtXfNp52cbI6pRO+3CboETuRefmOAksIFOgXG7cvO6rRGD19Ljs2tl9+t
 3JCnKPAMS424vxgu9YirR2BNJTcvfDIMwLL+gsHJ7EqaO6RXdH2PVag2W34O597Glt4L1gpJbKu
 qRHaWJu8zkqx2RZ9KuomPC7cZ5LcL0z1xxkjR+SVsv4aBOOzE1uy18znzzrz5yEciiW9ol2mLhl
 ChJYp/ue1Cp8EVP1e6/9os0F7num9uSH4lBb+dWshQ/0tkRRDc9cwfAxYnwJwiR/ziOkJij6RPi
 84LxGY3NleWFwzKfPYfesimvYv6vO8b2bkPptx3VPQG9Ahv28DQYca6TKyDKoyIW52RNb5vFv0M
 XU9qYGOV+c+Q+U4+h2OTtLKSEPAhZyRUL+1gIVYNtk/mF+GlMqgw1lhxZxXKgAqJBvyV8Ycvn4X
 i7qVNXJS7K4sONZMIsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_065554_239557_26027A1F 
X-CRM114-Status: GOOD (  11.21  )
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

On 26-07-17 13:01:54, Taniya Das wrote:
> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

