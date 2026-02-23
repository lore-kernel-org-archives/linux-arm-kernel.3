Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB4FE98E10
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5Q1vewngJBr91qKkgV5B9pJGBBUeF9wD7BUkTBzUfE=; b=iXeQOBPmxyv8wqgHZVVFEz9Ehn
	2EeJgnfzxc7wuHRXKjBoBJeMfpINEoBiwjhuraNHzD3VMCxGqURjOzr16umjxsmmJ/ED6dtPB7BFr
	oXgrs8JTSXSEoNhZpzsR2WHTC9NEKEQupBeYM2t3ofsRFS6mQRMFNgbYM7MxPTaU+K6KJbatE93im
	3a6b1AuynmABT9b68ChjkQQY0X+g9FkDTo50JtOSjrpsg40/uWBwnEwsbIFvAwLLrxkHHaeTI6Zr1
	zIk4J/JrJZaRyGNNUYqtw11c+yR2QIltofhcfXg0kXmvt79oonZXI7Jvt3LCgOIF1Nr5aigoDtp0i
	TzsKacvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSUd-0000000HYzc-1gji;
	Mon, 23 Feb 2026 09:44:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSUa-0000000HYyb-2B0l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:44:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N0PJup3473716
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s5Q1vewngJBr91qKkgV5B9pJ
	GBBUeF9wD7BUkTBzUfE=; b=n2MBqtR7gZ7QAYFzUxcvE7xcMUV1W5cLFgQKuEv5
	1KDQfXbHtb35D9yelPJZHf5693s843xj8H87QMweMacHIo/3UJikgZAf53lPxm0u
	Uoj3QwgVpAzYjQh8q09VaLvcHESPeyzvQgkswD1htJ0XsC1MYTRZtVcMTGtamxK7
	2eXX5BJXYJtZGg0KyXsjcgpsarZm/ww0OsJQ+RUQJtEIp8S8T5Mjq2qoHrg6tKeH
	kyyCNKRuFNaR7LVHRvOvuItfjYsEI7O7JOXvFHjvd7kXn5TC0/2v7phbDFfP8ygD
	PXA5l8ZHheUPn17OeqJkIn8OROqOTenQScspNmE1Yrqx5w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk45ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:44:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a7b7f04a11so314878835ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771839879; x=1772444679; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s5Q1vewngJBr91qKkgV5B9pJGBBUeF9wD7BUkTBzUfE=;
        b=SLXjA8utLDot2Nu8Wo5tNswFiA8M7jzFGZLKYneqZuosrXGWZ4hm5ExCtd2GTUv6rM
         bS6dDtCyy2dgSccxRGVjiDoerVITJseAngGSGZoRBQvZ5BuacZmKQkX3FwdMX9uYVWuZ
         4NBF0pSWHzTeafoGKu4ZHPhJfr/QqmRMM8QSZZLD0WsmPudfIe+DVvh6mGOun2zmNud0
         vY19N/qM5uhis6b9l91R4K+kQRz7XnmWinSRuPTv7WBCoIEm73IWbgdtMZvNMM1LLh1z
         d6Ls2NuvCccIWzBHbtvA7F7S7n5U8suMJyEXtgB+VSUS0901Wf7iMFIuv7fkgy2UynEE
         L0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771839879; x=1772444679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5Q1vewngJBr91qKkgV5B9pJGBBUeF9wD7BUkTBzUfE=;
        b=umqWOFV1RZDU45UZKDV0c22ZKdlVJL+iLDKcyNPIirZNLqdFhimgz72XzyKkPXjVV1
         7YkuMzCHcNkjboAoNex+bhFvhhaz3wbwV0+ihkCv9cqgJPYau6hSFmP9HrLjfYZS8i/r
         XMFcJX4QOWB9+BFzlppSpfDxd4A30h3pWRfeItNl/anNAR7D5hP53+BtUbMrAlpmg2uf
         7nyZ70PgMYw3A4lTPZMoaIgwp1VRoGfbvbAajRx2ScttjVRg/+8yjD4hg9IYz9Ab1jyF
         I/LqtfdpJls0ykonxlkH1mmlKgItsp/FtcGQtQkjwV1IcNgShCdiXPY0SgiLjJgBfZa4
         +MCA==
X-Forwarded-Encrypted: i=1; AJvYcCW7DN1bkbv3qbCW9Q5atL+E1Xnf8Zz6VCXKAZYKq+nJSm2VdIjFclmraut3MG4q5QQkEn9iQjwMcsC7jOD0MTn1@lists.infradead.org
X-Gm-Message-State: AOJu0YwAh5kCdigfuJau11ifyOTpu6eljcJBYe14chufGn2r9XiLCD4u
	z8e3IQA5I/lhul375d3xGB3yy1KIZggxZaCWJS9UDdbczVnZF1ONanpzncwys4gfcPdP6/bHCDQ
	6u0P6VuyCSAsZDp+e7wlnvdzoZDIlkX/ySlKgaaKJAZIh7VDvK3Et9d7INMQVRSSJflzsH3z4Rl
	4HZw==
X-Gm-Gg: ATEYQzxgS5bQEfggdFOsq/mcQofbnYWK65cM6CFA4y6sMHCuvYd+gAd76qpbiN4Ltg2
	BZo5hZIWqiq7e0TNy7HFD43wq6vnTYj3p3JnnMJ4pCqwy+Lcw+PlALBRmuyqZJAP/Pd1bsOQWOh
	JtqyKwPDdZPc9Kkm7jTtuOgnA2fxzM5bwe035v5vrd9q18cRMj89a4yysH/e5fDmvtcppIzK+j5
	jWVNfPYIMdNkZu9XM+aelFhf/tpaH1G2BwPP8MLydvcYVWEKMcnfXmCHBHfqxcakuuu8VuuKVUk
	2KB4pv5KZ1wVTg0S8XD6oatnGRcLt+hynoahl9i2rfUdmLnDVfX0C4D9+ZF2DTiIwJF0Yjj4Vk5
	KHH+d+H7x4XLckV+02sE83r/EjB9V0iszm6s=
X-Received: by 2002:a17:903:1aa8:b0:2aa:d1e1:29d5 with SMTP id d9443c01a7336-2ad74556f97mr80694085ad.50.1771839879049;
        Mon, 23 Feb 2026 01:44:39 -0800 (PST)
X-Received: by 2002:a17:903:1aa8:b0:2aa:d1e1:29d5 with SMTP id d9443c01a7336-2ad74556f97mr80693685ad.50.1771839878545;
        Mon, 23 Feb 2026 01:44:38 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34247sm63334265ad.6.2026.02.23.01.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:44:38 -0800 (PST)
Date: Mon, 23 Feb 2026 15:14:31 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next+ 4/9] net: stmmac: qcom-ethqos: convert to
 use phy_set_mode_ext()
Message-ID: <aZwhfzkk740kUegR@oss.qualcomm.com>
References: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
 <E1vt3US-0000000A5eE-1RHM@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vt3US-0000000A5eE-1RHM@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699c2187 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=McwRrj-fpISi4v25ROEA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfX5NKwCFpGLPOZ
 FkJkVxQAnsGtZREL4G6jv27CmakqjO5C2DOESCveWsujOumK3KXJi06wD3n1R2nlOTii2IYE7BJ
 1dWFxF8FV6o/Y6xbzsPvxtiPtInd8YetWl00Yp90Ivg5/JUjIDMfoUooqlBn70MAVHW8h/KkYTV
 ctcqkGSSVtvZ4JekjcH1FbZZo5lc8Gdzo8GLUuqDvUuKSdzHIceiaSCC/NfwGkBLo5KREyLtyIt
 pzs/opjyqMpi29keXaJ4r/0gkAfuQf2EjXy4YudlSB36panrNKVr93Ob4CTMfeF876/gYEukf8l
 nUoG32rAoDCjrIbl7h32Q7+Zu7S3twnNXg4dOH9WVeiGnaaod7aVW8roduh7qtUuCAQzN0dbHFi
 sJxvMlKYBdXCv0/58HomywoYph2DjreRMxwLDJncg5mHPnh7QFoHO/ZaI1ZMxu6MDTnVs53VgLm
 9HL5xhJlv07D9vdarGA==
X-Proofpoint-ORIG-GUID: 1GPdZZO98t-U8QUiQKnhkEIzEUuuCEA-
X-Proofpoint-GUID: 1GPdZZO98t-U8QUiQKnhkEIzEUuuCEA-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_014440_635247_84E6220C 
X-CRM114-Status: GOOD (  14.90  )
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

Hi Russell,
On Thu, Feb 19, 2026 at 12:50:44PM +0000, Russell King (Oracle) wrote:
> @@ -675,20 +676,16 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
>  				    phy_interface_t interface)
>  {
>  	struct qcom_ethqos *ethqos = priv;
> -	int speed, ret = 0;
> +	int ret = 0;
>  
>  	qcom_ethqos_set_sgmii_loopback(ethqos, false);
>  
> -	speed = SPEED_UNKNOWN;
> -	if (interface == PHY_INTERFACE_MODE_SGMII)
> -		speed = SPEED_1000;
> -	else if (interface == PHY_INTERFACE_MODE_2500BASEX)
> -		speed = SPEED_2500;
> -
> -	if (speed != SPEED_UNKNOWN && speed != ethqos->serdes_speed) {
> -		ret = phy_set_speed(ethqos->serdes_phy, speed);
> +	if (interface == PHY_INTERFACE_MODE_SGMII ||
> +	    interface == PHY_INTERFACE_MODE_2500BASEX) {
> +		ret = phy_set_mode(ethqos->serdes_phy, PHY_MODE_ETHERNET,
> +				   interface);

Shouldn't this be phy_set_mode_ext()?

	Ayaan

