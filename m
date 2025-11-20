Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BD2CF8847
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 12:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rocURVTpRm6dtP5iHBbr10ILRzx3pCec9r06uq4Mrmw=; b=wbDHr8wYHVtkZFvtOW5XDmhBi1
	9A+Qm8QjXFg8opxuLSBUqQuLdWl7n+zhdKeUJBG4AtCNKEMnD5QfbO050T0FXjl36sexTOvQdBtgn
	5gM/+xficBh3etfqNq9Op4B91qbfMrvjcPylgWvOTmT2w6SPU8A+qeBV8aDAPAenUEYy3YF6Gb0x5
	4d1MHZT6RGBwm9xnNs7kBzo+SG6TutCAf+pensL3gc99XsVw1Q/hSdcA4fdyEGFSeCHBgsCdO/Vb9
	sTDvEz7Sj0A5D34hs1PeR06gnClmEzCZKAkwMKqGSJID5fbVzfAs3yhM4Bl3HZ8g22iMGwr5hcYXQ
	X8qtr6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3Rv-00000006dVN-1KY9;
	Thu, 20 Nov 2025 12:07:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3Rs-00000006dUu-0Kk8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 12:07:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK9hssL473972
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 12:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rocURVTpRm6dtP5iHBbr10ILRzx3pCec9r06uq4Mrmw=; b=bSNFcJjzfM2eSZVf
	ap7LPSWqzx0iOfNw2FHgJl2e1XDcCHL5jQ095fGr6BUpn4yQtsw74Zz1t/eJrkUg
	rxm35bhzhwyulCh2F3rGzLU5Sp0dV1nNgh3fC2bBs8miPZZtHjAN5BE3i1QmfJhJ
	6TOD02J2KMYAqobOhBxlDtJSUa9xTflsIAUoVqNA2WOOzqWpWGf2EJY9nSCBEuRD
	8c6AD/Mw2K7VSe3zGHvexXf7smHw6Mn7KqfcSJekKr3LHFbMVuD3xi8SMhRG1A3C
	v4YSkkoXSjAXHqc2JAo2Xp3j++EYALsSDHZAWnJkfkbPpKSsYDRfqItZvw3/MhjJ
	5c+f/Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aj0kw0d7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 12:07:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee24e1559aso2402911cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 04:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763640458; x=1764245258; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rocURVTpRm6dtP5iHBbr10ILRzx3pCec9r06uq4Mrmw=;
        b=eNUeph4M9i6ivkHL8GISgClbpNkGjr9I/vqrECJyLSK4bXU6MKu9IR3+nYZJkDZ9av
         Efi1jRaTuxJKKWqNQrFEMfiuvaTQY6ES6t+CYMU0HpxL1ckNf3m7Yw8aOHohKCwXT0AV
         rKGM5qMLTYSNxddgFoK+/YfujBT3LC8kNk8MOqOnb3mRik9Opdk8uXgJOYX9CmxnKNUn
         60Mf3/CXT6Md7zMo/8hUdyHHjl3OZzXkLSaLYs1OiW6hu6ZgatD/C3yUfdkXnpAi9R1F
         ZazTf+I+P71WDc6hxTVLKQT7GRaSzXNOOgJCOOba5yjwJBNNksHnlsCsOvpp2Gk5+7ih
         fkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763640458; x=1764245258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rocURVTpRm6dtP5iHBbr10ILRzx3pCec9r06uq4Mrmw=;
        b=nfAaRjTEFhukf5+NxUZQ2nQcXtWNKiVG5q5va0mBc9Ah65aQ7XhKkNRx/ucn3KSlvJ
         JWSFDGsJ9z+oJNso6cTJpf0C4FAor1Xyd6l/SaxrXfK8mwVgAvxUeosGGJWq25XvHleI
         xYP/JWvFyqzi7uNL+ptAVSw+I4F+MJcGfNBBYqC8Mu1z52tT9PDL/ecBF9bJY3vkx3kD
         3qY0MkmxmjVwrZJPmrIUr17qlKmpIinRJIvbHVgMQ20TMrX2Sr/8Jw49bfC0//mj30eH
         QEpiWzlHFQl9lIpaxC6U/owRabqEvWPQh6O2Rk7XiqJ6x6tLYELSjeiYD3msdjBlH0uO
         hWfw==
X-Forwarded-Encrypted: i=1; AJvYcCU5cQza8aSmPR4xqASjNnSBHFs5suNrdpS2Iv8Y+hBRyAblPi9xyAl3cU/+394uttKPWFK0e8OSmc8CpK90t9KO@lists.infradead.org
X-Gm-Message-State: AOJu0YzVvC/3vprxQYQURoJ/IHXGV7mGe/NHJ67Yj251SQL9w29f5avX
	5i0DW5bB28wOfX1Kc+056cSW+5zaIP1KUQC84jIe8dAuBURe2c2jNoE/UMNS8+wxZSajNhZ4GD3
	dIm+6F7J0gthVxTjj2eoFYBAGRiFigZ/dqpNqooO++qwf8MWejQFuBlJBK8EDfiMgAwIswHUeXO
	3I0A==
X-Gm-Gg: ASbGncsT7mJIPV5mX6TtZuJhP+mxTdT6w1KQDWVN4vUXjthdvw8HofR6YIZsY4+ub01
	YUg2ZmMpT31HhpuF+8tEk2OAdwt8jxyw0YABXXq5yoHaJ/feQNfpX5JUF3406UxQGqloPtEfSz6
	HNDF7ZRJPITn4MhoQ7nSC8JqOWn+Adew98efkzaH1vPNJQlAXN3/0z31PfE4jVoZPRqaKQrrcSd
	OXpk6Zz41n+PG/7O38r2/P1/AIgJUH9Dzg2Wwtt7boy/jQX7A4yJHWGcWJwFFMiRjiRy8Kt/85t
	262jMmTLO//9RdEB7PZF8oUHkaGDbL7OGnKzhRio6bmYXkbPkCXGC30QwSqNAPma2vPbB5HNbde
	uCTCK83gCx0hOuBXyyQdOhRZXWNnVj0zuRARtzYz8U5WYbQ21DZH60FFGH/KPPgoCOpE=
X-Received: by 2002:ac8:7f49:0:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ee4979d58amr22346711cf.11.1763640457845;
        Thu, 20 Nov 2025 04:07:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7C0G7oIjRGR0HYITo/8aJIWfL6aczcG7wVEVYDZP+JyR4xosC6Jsi56JuaGBd1eQMFrosxw==
X-Received: by 2002:ac8:7f49:0:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ee4979d58amr22346301cf.11.1763640457383;
        Thu, 20 Nov 2025 04:07:37 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cdac18sm189684666b.11.2025.11.20.04.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 04:07:36 -0800 (PST)
Message-ID: <02b73243-f7a0-404d-913a-f95c0ce80632@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 13:07:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/3] net: stmmac: qcom-ethqos: add rgmii
 set/clear functions
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <aR76i0HjXitfl7xk@shell.armlinux.org.uk>
 <E1vM2mw-0000000FRTo-0End@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <E1vM2mw-0000000FRTo-0End@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WeUBqkhX c=1 sm=1 tr=0 ts=691f048a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8
 a=-t6nT1al7WGe8XWH3MkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: 71JkJzFAd6Ux2p9V-c883MNXzo32XLLu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA3NiBTYWx0ZWRfX64e4Pqxu9kYe
 VjXNgtxduOUlxg7wIDHVlLztCC+k1TPG/dYog0lT+1TDley4nO0bsgvoEm1SH4zAbU2w+vtv02Y
 yFdNsZ9LLx32cq10nzyrt5FToxanIbrs5DJMFbrZis1yJmVq3k5LmYMKaijMgGge3NJFqmqTJzw
 LlZnBxmD83zcQFnVdIx6eRHctAgej+6l9mcUbLUlqwXDU6aLcaF4oPaQGSlNsdRuqtM/LkC88WZ
 T74VxN4joVE+o2ipqmgMfWqVBIhpNgnsoscD5AKRmq839qi7Kx9iaQ2qjy4DteyOnBArzodDhH7
 XEgC+sLpaNrsRySZLd48yZeVp0QK4X3nNyEjFVRH3lKLaX1MfnoTAZ97+Cj0cXCvu6yPXuUYKhf
 IjIFHKniGZiWNrN5JsbUpenbPo0ivA==
X-Proofpoint-ORIG-GUID: 71JkJzFAd6Ux2p9V-c883MNXzo32XLLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_04,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_040740_291797_40A04C3D 
X-CRM114-Status: GOOD (  13.13  )
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

On 11/20/25 12:25 PM, Russell King (Oracle) wrote:
> The driver has a lot of bit manipulation of the RGMII registers. Add
> a pair of helpers to set bits and clear bits, converting the various
> calls to rgmii_updatel() as appropriate.
> 
> Most of the change was done via this sed script:
> 
> /rgmii_updatel/ {
> 	N
> 	/,$/N
> 	/mask, / ! {
> 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)\2,\s+|rgmii_setmask(\1|
> 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)0,\s+|rgmii_clrmask(\1|
> 		s|^\s+$||
> 	}
> }
> 
> and then formatting tweaked where necessary.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

