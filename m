Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB26EA8109
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 12:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tf5C3tVCVlr5koPgdEsckZhURpQdzZSNvhMopb8sZWU=; b=hfugf5qPuo6zaOSj9BBFFyIzNd
	P9/iCCx+PQh5zoJcTFHxkCv3QAnGJ9mFN1pBN5rBnjJeTrPEHI8vLmTLUYOUNoVoWsyDEJBfWjmWT
	gCqZTCtdyqng3o08eIGbs2LjMQVgGX4ArHymfYU9I9Mbce+8F+mIvgfob/7AeOm72GlmLiWKYj0bO
	DNI+LrXrRd2IGBK9cH2av4USE1w3Fm1YjHNZVa/3tRLXbfHDUFXYYhBuLSiUYnakhPApVAHoW+ArW
	b/mPrgA5sg1t2+KYnBs47X3It6npky7f5Nef5L37Wcw9aAkX4RDLn13QYXLApuLrUd8ramIzZENq3
	7bRESwKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpmtC-0000000GwOU-0SXC;
	Tue, 10 Feb 2026 12:30:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpmt9-0000000GwO6-0Dyl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 12:30:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A965Wx1231738
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 12:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tf5C3tVCVlr5koPgdEsckZhU
	RpQdzZSNvhMopb8sZWU=; b=bo26i/vBsPD6UlbD6WjFK/gHHl7FqpuuDkulWzeH
	2uXDYjbmK7R7LuAwv1VWnq7aMYdhWonMwYtnAwSebVkn4duLhWn4crYVYf5HRQzi
	f12s3mTqX3JHcfNa+nufwBIPBDD8Km3oaWdiL4NU3iH5qpW54ZzskaQgW1I06d7d
	KWgdAOjgSo7QzU8Ng54GBQ6Zi4QjTcTNtxTK7RQl1XpSdxRN8+rKRt5Op+sHLfdb
	85O9bTGYen90WS5B8esbouRxUH5CK0FYUQFI4MIJmx8/lYHOBhk6dzPJgFeqNF6C
	WQCqKWJhjQNVHARwuYbWSTkJo+uTixNlUhg3EsuiyLOBdQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7uv59sjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 12:30:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aad5fc5b2fso9501645ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 04:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770726638; x=1771331438; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tf5C3tVCVlr5koPgdEsckZhURpQdzZSNvhMopb8sZWU=;
        b=dCSJjfwrE1aMcZdQHw6HTQZZ9Jbeq1euV0QPT2+a5M4ZUs2cM33tdUqw3GPVQFqkCt
         lEZwx/NOy80+cpcCBQou3B24+54mD3XLWxDAL7Ok81KLZu924Eo+dDnDwyr6ph2keV7U
         T7ThFMLa75Cc4S0fRJOV3a7mAnX1P3GZQNdOiu7wTQ6kfLRjMa3QdOYxeilumgem4D+7
         4gSOJIgy8+8HqDZlPsa62to/4K0KHxir+VISfG8ZsHJfNBfRO4WL+vTTeUpyAE48Qes/
         tadQOx63FcnJ1SQGcu96++1OohpsJNswVo4koPcna6SEWwNozcVG1WSGlwbY+Rny8fGH
         9FTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770726638; x=1771331438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tf5C3tVCVlr5koPgdEsckZhURpQdzZSNvhMopb8sZWU=;
        b=MBA3EpkT2reCnzEcp1nFbnEEyuwwv45AGAAG870MwzXJ8u5T/lJaed7VybcgE2AbsK
         x1zVoc4JBaQHM7mFuEJQbmkV+wLo8q/89a/CTCmyoreo40L00dB2JO88OpFbFNecS3wL
         R8DKyA7YJ33GZVtjwcsLTnTdORFgdn6K5MsQIj+W9Lt29dUlJAatA2+xOjs2/nUJi54T
         xFyP7H/A+xAGYfGMUyqpNSeS+Ln9RdEoGAGooEgD3L85jRRZc+eDVTYPs6Rt0K1wEMIS
         qmzoqYlINYzN4C8R9WeC5wOCYJNAUgo44U5/HHOe5VAh/slFjYb0z59+ArY6yDVL6alG
         LCRA==
X-Forwarded-Encrypted: i=1; AJvYcCX3BMGSGEoGTk4dFtQ5QRQZwReeKSZV0XeH4YX8lnFt6XnwqKi/xMsyC5JEHUlKNeo2IrUdcBdC5kWSlb7HGxC4@lists.infradead.org
X-Gm-Message-State: AOJu0YybhPZwESW/V2sU2W9HYKpR4wr1GGEunGVscAUzuBRVaWYe/tEN
	Q1oOxtPFLqGjAn7ntBzr62N9jrq8ohEm4UQJFR2EcXNyR+PT38iU2SbPrGhs3EpdW3dUx9+36zo
	yxJnXRDHj2aY5AeYi8SVF8R8QGGojWYuTF5hwtJTPlurG/LhUrZI9iI97cQ2Op0hTeB/R7mL3oN
	X2mw==
X-Gm-Gg: AZuq6aIod0V0blsOEREDUFmFND8dyvYaj0SpGWgaYd5Hx2/pegOJi2pYYwSZD6qwB53
	h73rqSZ5KffnMmUkghNxZ51/QW0RZLv3OguBy0E1p0kFOJMrsbZzEarO3hI7RMWl0aAltrUURgY
	BKE67+Yr7r9I3j3y6xSIo4x2yw2rZ3H6t3piNC4o9sbgzBCMAynaHIjNvPpU9b7FuTs72E82AnG
	O3sW8csW9EHhbNEBfnYMFe/MTNKD0XD2zk8zzrS7XQKWQkzd+m+bjVOmJGWh2m53DOcO7bziiZS
	wkKIYfLPkAlzX+xLQrHbdWjRbZvtaB2TvIaXsGmld1HxdzedrHizYXEI6wNDDEpZqqT/p6lUSL1
	4nWN6/TbHaWNjuoejcgBa2sREx4iFHvWnh+8=
X-Received: by 2002:a17:902:c952:b0:2aa:d333:ce84 with SMTP id d9443c01a7336-2aad333d30dmr80243145ad.11.1770726638012;
        Tue, 10 Feb 2026 04:30:38 -0800 (PST)
X-Received: by 2002:a17:902:c952:b0:2aa:d333:ce84 with SMTP id d9443c01a7336-2aad333d30dmr80242795ad.11.1770726637482;
        Tue, 10 Feb 2026 04:30:37 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c9189bsm147523205ad.36.2026.02.10.04.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:30:36 -0800 (PST)
Date: Tue, 10 Feb 2026 18:00:30 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Sneh Shah <quic_snehshah@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: fix
 qcom_ethqos_serdes_powerup()
Message-ID: <aYsk5mFH2YlAO1zd@oss.qualcomm.com>
References: <E1voPUH-000000083ji-25FH@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1voPUH-000000083ji-25FH@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEwNCBTYWx0ZWRfX7WBexMbn6SKA
 hi/l1ZSDtyXny51s0AoK4z/r8CxLrO0z19QyHGaPR+p6v4kocMgaPDyTT65vBq2zoEu233A+zSu
 jGLAnpkzI9IBxAs8ARM2c4JaIRvZjxrB/9V1fTAaQYIDJ7oxKDm0vGVl44THQ/Ln87oP5Gk5nN8
 kyvIvKpQ/lzqxVPyqpN+mnZCMEIxwEdRYYgMNcaktC57r81uYO2ONp6Hg5rfsrEU9uJYs1fMSaN
 KWn0kote3z07lY5e55RUAePfYXy0NtOQQenowJueXxAfCZckeDYBjyyHa9j/nexarvvuM/fIBqZ
 DmVDraxhyK9vMP/s8XP2HLlkCf9bJc0STByj3moeVU3YCWlVVvGkrM9YQAX5N1TsnLWw1cSrcT7
 7AQfv0WW+6b0gBLWAnQhwoXOfdNNh+mSjBzCuiuBAy0Yy/jUoZoFv6lQ/ED/nGSboMxoytfpaPb
 VTNufLIBW5SqvqvZsKg==
X-Authority-Analysis: v=2.4 cv=P+Q3RyAu c=1 sm=1 tr=0 ts=698b24ef cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=C4_wdI1o37mb7NTJsvEA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: gQPRKqtY25K2W_V61l6Y_yUnL7JGc4vU
X-Proofpoint-GUID: gQPRKqtY25K2W_V61l6Y_yUnL7JGc4vU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_043043_218103_64DBA989 
X-CRM114-Status: GOOD (  19.94  )
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

On Fri, Feb 06, 2026 at 05:19:21PM +0000, Russell King (Oracle) wrote:
> Add cleanup for failure paths in qcom_ethqos_serdes_powerup(). This
> was missing calling phy_exit() and phy_power_off() at appropriate
> failure points.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 869f924f3cde..af8204c0e188 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -659,10 +659,18 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
>  		return ret;
>  
>  	ret = phy_power_on(ethqos->serdes_phy);
> -	if (ret)
> +	if (ret) {
> +		phy_exit(ethqos->serdes_phy);
>  		return ret;
> +	}
>  
> -	return phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
> +	ret = phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
> +	if (ret) {
> +		phy_power_off(ethqos->serdes_phy);
> +		phy_exit(ethqos->serdes_phy);
> +	}
> +
> +	return ret;
>  }
>  
>  static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
> -- 
> 2.47.3
> 

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

