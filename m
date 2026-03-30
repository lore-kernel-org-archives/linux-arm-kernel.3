Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38A610D14A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 11:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyQfzMVY5tU8yDNVE7v1bNOl2YyateXWELi7HVSLmwo=; b=U3gLL3aB/JuqrHY/hczeMgkagc
	c9iuVdZqfL70gTUnMvBlGd1tPgiAnkggA62p2/HmpOyaYVBHvxNVuprTS1sKWJP/BXwdfXi+lSKUt
	vsGjdAvrCQRIB9jAt2w54rYtRkETsmBx3nc2656SpqxrU2AaBMqV3763xeKVGDGhZYzIP9ZT0BK8C
	r9V8nLi8RWbcvl/qWfi2pReAuO/xzcgHu6oxrMo69cJ5JwvADWY88KrFjVj7DflO7b5cGZC1Euj/2
	eQoWBZPFzkt7aV/gSHEfIR5A1rWXpgZ6Teen9RxfGx8CfPveQSCax3f897AULOInYYAHqV2Uji0NQ
	VijHx0Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AeA-0000000B9VX-1CxQ;
	Mon, 30 Mar 2026 11:19:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Ae7-0000000B9V2-2zLV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 11:19:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7oI6h3424452
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 11:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nyQfzMVY5tU8yDNVE7v1bNOl2YyateXWELi7HVSLmwo=; b=M5vrsa+3fUMTvHpN
	R4r8YAG5do0rd6uVgMpdxA3GUV/CpHibqfk3AxRUTQ6xYqdRzuWmxWDRBRn5s6Kq
	qPE9z/wO3StzK3mq5IR+h8ybPjOA9T7b5Tn7XUeyd1IguIr9bj+IdSqegEvacKB3
	TkLB0kTRZmFQszEF3+GtbufyGIzDvvAVePhkPJTYpwhuYzCsHfhi4K7iUmHGGpF2
	VUknKt9x/iIe/SEI4VLcpwPJfnt5vLKEIQ5nEpFaeVGbp73MMAmTrzNyRYFB+i0o
	4qd9slaq0ECgvfg4772fmPAhIDbq+bIzV4T3nSs/POsB6C3ANB502S4go+ByEQL+
	cE1/qQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmkymx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 11:19:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d1a5661ff1so11532185a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 04:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774869542; x=1775474342; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nyQfzMVY5tU8yDNVE7v1bNOl2YyateXWELi7HVSLmwo=;
        b=P72Lq7IbMeZVBKWxRsn7H951kPNkMs3cTgLloeg2XmgZf9FA6440kgDwxAC6tbbDc8
         MOU1H10lHTaqEL22fBz3Sov0mtFMa83ktWLof1BDJjOA9fnOesYO2xH/kCtJFT3pkkcK
         c0oIEEvA9MQ5XbELodoOftcB9KvwrA+Jzk/QRWeZc95Dw6cArpdR/TWYAAylUjmed2N/
         Ja3kN/gNoL+67rLH234VcTstd4pg/FwEyGiZztibl+2hKHWPRZYMpf+a+yvT314vcBkk
         V2XIQUtfJzPAYcHxXUfuo5y0uxAEi95BSkr+xxLB3Ea3JLEhkJp8HIqfbg7jrG1mrIlK
         COUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869542; x=1775474342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nyQfzMVY5tU8yDNVE7v1bNOl2YyateXWELi7HVSLmwo=;
        b=NlSArz+bRge+W9Rxe/0rMkISQZ1UCiZzRfEdpH1KLFZ04reKhysFGSwlbeBp3OgsCO
         xiWriXZ/7KWASjLb2hUi+BU8ZhnaeiwgpC/RnqXLJGQxDqo+CFNNrg/OlY1rHvF0E/GB
         GVrgcF8EMq9UuE4ncdQEpD+x7Vj8AArOAb/FJAxBkChtrorjEQXExC20mD9wgSsjEoSO
         xs1AofrGX/oWy3gzMAQQRHJPQqeUPrd07odNOti4Sg4FxlaVqJkgROj8dijVznOlsxcJ
         I2jzVUcnYntKrr6WFh4yULejYcfgOucQ+W1dlPNJAwwWn4Z4U8QQrSQqa23j8o69nFP1
         xDUA==
X-Forwarded-Encrypted: i=1; AJvYcCUGWajtAbDrKXy0vB3zJQDpZ9W4tS4pRn9HOlqaDSCZWCULSi/ME9dP6LY5IefnOVHz7tWqtnEdPP2gBJK2fAsX@lists.infradead.org
X-Gm-Message-State: AOJu0YzeKmKifhx1PvjsSvJFL9KpzrHHv63tMxAnAA4lVWeKX/so+ToR
	PcJiVN5jwyUKuijjucLJhiLPI3DiAc9P2hNJnRwjENOlbwKuTUN5GVmsCD1uW1RJe2djRQYG6Zu
	foTw6cHdHdu4OUE+W/AUsIUxb4S/dw1T9Ueu9GOlFmOSuOfLFByPFVmaDR113CMGrn20THcfYEc
	jjJw==
X-Gm-Gg: ATEYQzyTmRLFRHSSapXRZSzI99OC7wj8TJsWngImKQufPPHwVMfRUJ+GxRaE6IjdcO4
	AoYJNgFMUGUhTUzfdq8euc/QwMl3kvhnJfBGuUTEs0DJEmHuthxsJa8qy5TcKk2j+fDL0qsYhzi
	pUtiTndomsIMz10WtSUFmFKPBvGZfneV+rEft0sLJi4B1Zfa9oMevlBT8B99Cr5dl2tK474yNxp
	capK2zhdUrs5y/NRuyNSn1QuhtDxzSWXHSjPOe0htnnDkdne2Rby42LWP8WvNCjosCkJDx/HPjC
	kc0Mbce/+0E+Fw3Yut+/H37tRy0EHJbutNJsu2cvZan3TArf6bYLlzU/5jXwZANFqeKTTFCU2WZ
	zRPfECDUj78NyvctZUFwt9lTNuYZGZGUiNRNXQT2SKal41htOpPI8/HmUvtt5iIl/44ER0LLyyP
	M5A+8=
X-Received: by 2002:a05:620a:2a12:b0:8cd:8bfb:a4a with SMTP id af79cd13be357-8d01c322c10mr1083813285a.0.1774869541647;
        Mon, 30 Mar 2026 04:19:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2a12:b0:8cd:8bfb:a4a with SMTP id af79cd13be357-8d01c322c10mr1083808485a.0.1774869540995;
        Mon, 30 Mar 2026 04:19:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b72a6ec5csm2366019a12.9.2026.03.30.04.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:18:59 -0700 (PDT)
Message-ID: <9d0a529a-d065-4f46-a93b-23195a4f9727@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:18:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next] net: stmmac: qcom-ethqos: set clk_csr
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>
References: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4OCBTYWx0ZWRfX2dFQIoEs0QjJ
 JxlxmW4qwIb3gM2skxXkMMPANQ7PaAHWH1qnCQJbdRX/91n18y47vzrSh+a3l660ynk1Pxuwmq9
 55uZjqJ1PuyDcFjIfvI3HilLRQ+RtsaNnBOxOetTzDPeXz2PEYCLcuA0I7bdsyO8I1XxETOM0YM
 7eSQILD+vPd4wDPFgAb+qT2+BH5yt3ggVHYudCrDdBC20S5QLRDICVytbw40Q/g/6vKT+OdSlM1
 v7+848F1kiMisRryiLYHSQ52E1BjgqAVKnqx22DAfIuoV5HlDn6JarvN3Avkoulqsd0zMcF+NZk
 WuQW2Tdi0V3TB7BmKw+62zwrJeu84uP0SqNnRoV9SQzjgYrsw3QTM2bDldtORIwt66LbD95SWpb
 QExziZg9aM8pe8U0ncNwg4ANTua79EflctKS4Jx8NtAhNBT0mio64qYS+p34K9vpBM3EoOkPp+i
 BHXQpGQV+2jGIuLOnLw==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca5c26 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=JwhTZQfU3B_gdtkNLGYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ZPwMeTiDwGpfciwK3wFHbH4yrLoIa7sN
X-Proofpoint-GUID: ZPwMeTiDwGpfciwK3wFHbH4yrLoIa7sN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_041903_763307_AA00554F 
X-CRM114-Status: GOOD (  11.52  )
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

On 3/27/26 6:02 PM, Russell King (Oracle) wrote:
> The clocks for qcom-ethqos return a rate of zero as firmware manages
> their rate. According to hardware documentation, the clock which is
> fed to the slave AHB interface can crange between 50 and 100MHz.

FWIW this __may__ possibly differ between platforms, but I'm not sure
to what degree. Will there be visible impact if we e.g. have a 200 or
300 MHz clock somewhere?

Konrad

