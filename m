Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4817FCC048
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7FsIvsL0LpSvN0/enWDcs5+VQLiU32R2Q3/L52hdmM=; b=CUFopDeiPpWMA1ehqJZVncMpRz
	N6XZxkhVyvaZ9afijZAkESVRRRGgRIsIWAlva2oE47+tNXFc0S3D5d2SW56NxwtLNO5tTxSwSzcgh
	ylO+Q4gbOmvlDDQMcT5sTmmmUC3VhH67+b3UQhJPEiOIX525U+d7NNX+Gg2xfi8sLQYU+zhzBqdER
	PkB9YyHv4/7QrFW/g3fmJtkaZEGibeq1IWMn1AFrHZin4es7hh+umrx2l4p9i53axd9j9gAhebww7
	GZu7kPRFmEdTCAZ3CmrJgT9122lcnvcR46HPjz5CkwMrmwWIAXBHiM06AuThgldFqNsHxdi6M/3uQ
	KTWmmqAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZIw-00000004IIc-28As;
	Fri, 06 Mar 2026 17:49:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZIt-00000004IIF-3JiK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:49:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1bDl2162881
	for <linux-arm-kernel@lists.infradead.org>; Fri, 6 Mar 2026 17:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M7FsIvsL0LpSvN0/enWDcs5+VQLiU32R2Q3/L52hdmM=; b=eYp/qJk7w729bT++
	uPCybevD3QWI12anZfouOBmgDHoGm/IXoAh+OE4HkFS2eV93mRdZruxQkHlsf1+3
	mxjPZHZ7pa14fW9c5qRQT7cKLmwdQUkvz2DSSx9LtZ8FDP/OSHk/oRgNalz7Kewo
	mJQi4WAGuRvVHt/komoZZ8Ivo29dZkjaN8bJ8M2KdqzXFkvroqzFumIfxhDO3DJr
	jlFX8Y40uLCZdfx/AdBJNTMA61YubfmQoqcsh6w3u5/AK0wW0/MneARu3w5FDh8N
	GOQZjnfyTXlng0qTOT37bHhZf6+pBKAFmBwsKgcsTcZvX6yrcPCgLPsBgrhMLJs7
	2/SBOQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ahn5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 17:49:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb37db8b79so6817193185a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 09:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772819373; x=1773424173; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M7FsIvsL0LpSvN0/enWDcs5+VQLiU32R2Q3/L52hdmM=;
        b=C0mP6mLhjCFrq1CDnoVkNhziJvlQyGxeiXJXeg3SnoyvTh8/GO5UIOX/3NbNfW3O3C
         bhkLQnAilNj/AntwvyrkbRl7LZdVUWbxQUBi0aFoX7+LdM+tp/Nx1ANOx4swY0J/uTkt
         tR5w9PPiLWy5anH7Rf7aVxuEhmBwLr2AohIkFf0L2TgYCNpuCs6D4mkQSOQdtwzg6E4Q
         tEwUtRGBm6WoU/8Pz65VgwcjZDI9u9sh9iV+oU7oEhDVJ0izyhp9/TKADpTOPJiZZZxj
         uLLy6V//+yS0YGmRdlJiuIcnoyaFMOeWdvv7Ei/LQd0OCbXTOK89k9SAz1H/a4w01iBp
         kXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772819373; x=1773424173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7FsIvsL0LpSvN0/enWDcs5+VQLiU32R2Q3/L52hdmM=;
        b=dA5/szp2y/R3Ve5IgSoKT7+jr/geDoSOGinqng7BJ+cty0+YjVLF+XiyL+dPPMHMSi
         fYeOzjURTvpKGHIoNQh2ZlkMoaCw0N3dufElq5lBf+ANbleblpHRJT3NLyrFhazG2bS1
         0L9bHD+JWKjqBdw7sYtAX/edtxw9pgI07X6jkcef6beLTtb07KHJnsOHsMdhOuhN2srN
         wFNjgdkgU3oMXjVmwKCb2fAzY09cgvKXwLrvxOfGopZF9fcLvln9uCsXKJFmnwmAG8Rs
         VXiVpK2C2BeE7/Px9RNXweL5wObKbI3X4fdLBBsP3ejxk5hW8akv9U1Tx88GzFdECblS
         HMXw==
X-Forwarded-Encrypted: i=1; AJvYcCWWq0Bv/hfWjyg0cmdGOMOpbzpyRVmNuyGYnUaKVsZs74u7vifDTNav5iZT0ksYl7kUe6nc6QnLhZrZFwgq7jzc@lists.infradead.org
X-Gm-Message-State: AOJu0YxbaApguSIz0kZ/UVdgcxxu359PgC4IfUHkM2guyesBYF5XKs5a
	pUfHdsb8tkVUUa73/Ez1TshrWZcQ8t/TiHgnGkOW440bSMb7U3it+4zsH2VVea9QRdpWtR10LLu
	4lWcSizFCK51KEBWBmcQVb3SUcrW/PIvqUtuiEIUqdkOn2tmh407Yyos3PvqfMXtYTmzSKqnBHf
	gB5Q==
X-Gm-Gg: ATEYQzz/idFJcKY1IZ0ef4j3V+OsgCHafbVVTWeMURsJzq1h0KdBi07OO7PufpjjfK3
	wCh/gEN78WzjH4aBlqQ3YJJcVBTqbgOW0VXCSsXebhsi/fwO1JnrtfjyOGZB2GOQniflxHBRuK6
	JAAeEbg8HnoXIn+Mez1++4AbooTP8xULkpjuRUNu6fyBwEUh2QqtGceV5vxtnDw1CdoQQ7K8kE4
	hcHhweaom676X5dqtTR9UWuyz/uFvJW0oycbL1R2A4Xd0GJgDl1W5VuLW9Z0TBHLxZ6g7A1+z6W
	F2l/hCdc5dNIvZgVj+MuCbkaXouwLGMcAOEz68R/SbpL3hRK3wKwGEbM5pNQu8Nun/S/kqD1V5+
	9zY62u7u3AmcT29yUJqAX+GgcFyrPjEhTBAfV/W/q5ywf+Z3Q/70GvSRRSTnSUc5uQXhkcQ==
X-Received: by 2002:a05:620a:7017:b0:8c6:af59:5e28 with SMTP id af79cd13be357-8cd6d411a4fmr397982885a.22.1772819373292;
        Fri, 06 Mar 2026 09:49:33 -0800 (PST)
X-Received: by 2002:a05:620a:7017:b0:8c6:af59:5e28 with SMTP id af79cd13be357-8cd6d411a4fmr397979185a.22.1772819372861;
        Fri, 06 Mar 2026 09:49:32 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:1265:158c:17d1:c76e? ([2a05:6e02:1041:c10:1265:158c:17d1:c76e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b0c38sm55370445e9.9.2026.03.06.09.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 09:49:31 -0800 (PST)
Message-ID: <a32c708f-b1f8-4928-9612-9b0d0e6c8d99@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 18:49:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] thermal/drivers/imx91: Add hwmon support
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260306133017.3189979-1-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260306133017.3189979-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0z-EM1bU9XVqf7GWw9amqcgnpCTl5Byv
X-Proofpoint-ORIG-GUID: 0z-EM1bU9XVqf7GWw9amqcgnpCTl5Byv
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69ab13ad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=8f9FM25-AAAA:8
 a=65OyoGoUx_vi4H7YfAoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE2OCBTYWx0ZWRfX/bprjyemDURI
 im+r3XkRBk3iG/m7yFB4Hnt/mJmOMCe6vcH3K8I6KL/Z3y1/0/BXcv1iKP/19tPg0Tcia7Jvg/C
 pmoKuImI2f/PPYU0FC0zxAQQdXbe2Jye3ybMHe7hplA7mqCiH4/Pjh7ffLqA/XsUfCF7EfcfODd
 YTEPQAFq1dFkNtd9ypr871npESzf/noZkccU9lzPHzfPx7cc5vEfHbe+FAj1YtDPH+sVSypbU5a
 7+5lVjFNwupqgdksU4tTCyOV92W3di+CKf8gPpFXx5gJ+bj6JlqebXnn7C7hDQuZFJ7Qa3VeiKJ
 g3C3hEZ4sm4f6PjGWUjDGCl8Rhhg9dn2z9CKzSevfK4bfbzAAocT7rGSlxZOBkCwQ+6HejZlYVR
 7fcxTkH/zwfnZKTqbYfvR9Ke17jTDZNuCQC5mPGEA3E0jifTPkWsl6XJTPxruizJRfmcN4dO+vy
 4P0s+tV3jTaBCXIY/gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_094935_972297_7503D5F0 
X-CRM114-Status: GOOD (  10.16  )
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

On 3/6/26 14:30, Alexander Stein wrote:
> Expose thermal readings as a HWMON device, so that it could be
> accessed using lm-sensors.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Applied, thanks

