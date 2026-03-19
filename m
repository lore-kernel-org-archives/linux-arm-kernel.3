Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A02109022A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 13:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGnqwVoeYcW8W8OE5dLl7cCg9GnEoBMh2C6juWu7YIw=; b=EyxTii3aP36YHlzDoCenpbrG5V
	/KAPex22/mxylvr4lxFqiEgws8QMmkpExJkPni153gObaOlUU3T3p21IJe2NHrCK+9yqlWDs6yVmF
	ECpXq0KplutzoniFh3XELZuyF12HediqzIFoJD5x9bBcWvCFt84dXlF2b54IsH+ywDlR30KqHoy/0
	JL5KYCjx1HE3K2LKdNb0DC/O3vxSPF5JTAlwZhvUWaOWFVqb7g/RjEQvPIg2Tu2sbPDu59dWgyRXq
	jWqOGjz7SpG09QdY3Qu/GCL+EijhZlMoK3F3IlVDMzke3bVJRbjkQPiki6t+e0l8SErxxm++cp6fv
	q/cCSpmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Dln-0000000AiJY-4C4H;
	Thu, 19 Mar 2026 13:50:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Dlk-0000000AiIr-33Z5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 13:50:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J740J21770786
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 13:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yGnqwVoeYcW8W8OE5dLl7cCg9GnEoBMh2C6juWu7YIw=; b=IuI2TldGbTeO1qOd
	T0bsZ0Ejm+yCkLIXovag4tC8Q1EfpPq9+7qsvWduPeuvyV36vJycPA9eFUhm5uac
	eman+oQZZDmIKxadtUgNxvMVDX30gUMjkuFPwbgPbHjUyfUdAiByfKGanto/cz+I
	sKpwiggt90ElyijYFMQAT7JHsitnAEBEJGzXUOFq0vxVK06Z2eAnmMj7YqyiKOhz
	H7S18hC7MEDHuHqer12XHZWkMGLcw80UNrdRn6BgA4GsGq4KyA0dWsLVUlwpyAXQ
	+2gjnWc7r/WUtCxURQ+263VxqdNgPGpa6spJSdtfadrbGSvJk49OWUIWqAW+vR3t
	GFAkPw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyy75umrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 13:50:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b27636835so7505541cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 06:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773928235; x=1774533035; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yGnqwVoeYcW8W8OE5dLl7cCg9GnEoBMh2C6juWu7YIw=;
        b=MdajI0ww2DzRlZB1DNLgDusKWeTCnZ02YWH8DPZ20lNUEgA42UG5R/nI9IHuKrXBc2
         JFWnwephFRbAhu3qDKyYfeM9JdjECjjAuUdpc1+Ooj8/Z1NYw4BaiLNQIY9eHZ2ohx+/
         vc2fxVx18LT/9aWY9oeUAKmNQpY7Vi82O/BOxcBW4Do1Rn2Be9WAu+jsTqRYqg2sIgE/
         C23jEIz48CMuUS6ZcmKsHd/LqxSx3+k2s6i+6ifQEgbyALjAjEOQCNfCJNYpTKt5Ld/4
         PoNHIy4YnKKjDwRW4Po94KMbpd6ekOUlX/Pe7BSmZwzZSJjXwW2U+CSGOlK1ZL7O5M5W
         gPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773928235; x=1774533035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGnqwVoeYcW8W8OE5dLl7cCg9GnEoBMh2C6juWu7YIw=;
        b=Jjio+Y17mcpdJBaewRXNLxG1zv9+p7n+hR60j3tcp5B94QChHrPURogAj6i0gZVGT3
         4iVzCFKMGfevy7oCG5r6lzW0KP0mVeeTUGXKKb5jR1e3RbY9mIox9eGYymH0f5gY74Yp
         gYLx1uFhmTkLORl2HbN4Cm8wAHgK3mlqfxbdHjNMgQQxalz2ni3FoMq/hHjdZ5A7MCMW
         1MiiAch3vaDXYBgFOfII+e6YsXgvqMaOCQt1nlNojpS0FHIzKlqMDc/mPVownxAQ9X/F
         ih6fzhwGArNnlEpI3QmOoemKXvnNW1AutMDMQOGl7osdlFGizFju6iGrq5mja+/YIPu7
         IICQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4lyRHF8dvvgsQSLy+cOHa8FnkYumqRkMWVFQLEiH8lvvX+sJP/YZNm2cXvcNIIRxdnYz9OKZ3M6dTTw7D1nCO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0gf/JtTuyxJRHDuOYOdoHHHFdhTipKhkj/cGiFj99cl9i+VOi
	3NsMM56HQiz/+N9aUQcvvDruRs3Hwr3/rAgQQ0C/GHf98oai0o2h5iDJMyqFdU+PnHy+TPx0fZz
	zzB/yfJvwxrZSMZdbts6E7XMn8lGZw34gS4Cazuu8jcW9eqO9BrkKITppFoA/6ZBbz91SAyjEtz
	Tsag==
X-Gm-Gg: ATEYQzxjjFHvEEHxi5bPdSoM7ghAIsJLHOfbBR1AOtdHxQK4qVdPgsZFCtwVN2v32XR
	VOUjXu9MpwtO6XFOLMr24TJr8w5nSnRHMBnZVty2AvT6rkT/cwWSNTU3uRJZnDM5DhBVVlmHTI6
	RAm1fZZp+kAfqUcPzxbAu6OvegBRJ+PexitlrlO/a4C1IbRbIL7Koc8vtSPC2MyWLGvNcmB4R0X
	Z6NvA2767eA0gbG7mY+n8rqMlzqQhgDKpaFcanqbx8LEqS94NxlFH/44krBZENVY4+TUnsG8JKu
	LZFnashTLvs9ZUhVaJygUkIfHiMcyWi8o/aC5O/XzdYNMFeZiqDTu4vPF5fdxgw1Lx03RBTCXAO
	fdDGIKDcZnnn2m4vlHFNWyOe4/pJV1tvIrPRQKBymc5s50MZ+vHUdTPiWRxbmXTzwCOKaOnsq8O
	dMlDE=
X-Received: by 2002:ac8:5f4e:0:b0:501:4767:a6f with SMTP id d75a77b69052e-50b1478e819mr78291891cf.3.1773928235046;
        Thu, 19 Mar 2026 06:50:35 -0700 (PDT)
X-Received: by 2002:ac8:5f4e:0:b0:501:4767:a6f with SMTP id d75a77b69052e-50b1478e819mr78290561cf.3.1773928232827;
        Thu, 19 Mar 2026 06:50:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f144e53bsm462429666b.25.2026.03.19.06.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 06:50:32 -0700 (PDT)
Message-ID: <bcab38a5-e7f7-47c9-ab9c-99294e095c22@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 14:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/8] net: stmmac: improve PCS support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <abdEscs44fU4kRag@oss.qualcomm.com> <abdYu864OmNWiWIW@shell.armlinux.org.uk>
 <ablpxwGks9m38fhM@shell.armlinux.org.uk> <absjNQ2s3Z5N2Zwo@oss.qualcomm.com>
 <abtE7sDT75I7uPnk@shell.armlinux.org.uk>
 <abvAuHFZzCFobO-V@shell.armlinux.org.uk>
 <7566c66b-2dda-4b29-b59e-4e4a7e159e21@oss.qualcomm.com>
 <abvy6nZyjyxUXMuf@shell.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <abvy6nZyjyxUXMuf@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEwOSBTYWx0ZWRfX0HXocv00EkFO
 exVcmHQa3QVygZO9FSUmTyRof2868j9XkkRI4+FoOE5tV4YlWmOomulc2yxm78VdPikH4nQciti
 m27AiNCimEIQ9EkKYbPNBtniwJRoLdjCZ51tNTS1n5yFj8JegcGQkGcjfxXngyTlN9nSPenot/j
 34+UMzCjwjkLZNWYKCF9xrfBx+nLNnFJSZcHuQeeDmqJboG2rigcjvLdejWQdrxRkFYqlqWKf/T
 CiYVzkntkc9yp+mcNtkN8CGarNj2JF2tKAdj+dHVGYV2MSUsmXk9dfX2aBWVIN9lz/JlONtCLKC
 C8rs4r+D/jGRkOHpyP35MHBEGrog+KBtK8Inpp5gRfMjddApAkRXpGCVBjf6/wnmJ5tSM7Rz3Z4
 Ra+Z6ewfl7pcMTvC5o4rdtCTsrlzJSFNEtK7k1Q+zQ4g3P8xjpgKj7WJc1K2MFsFQNC7z9Z8ilZ
 9Gr7jC2nQHvMbl+2LIA==
X-Proofpoint-ORIG-GUID: zBxCWCMOhMvuvPK7dCfFd9rEGeKgDOKi
X-Authority-Analysis: v=2.4 cv=A7hh/qWG c=1 sm=1 tr=0 ts=69bbff2c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=WgXOwRHnL7ZWy7TE_9QA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: zBxCWCMOhMvuvPK7dCfFd9rEGeKgDOKi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_065036_817743_6CC4D901 
X-CRM114-Status: GOOD (  25.48  )
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

On 3/19/26 1:58 PM, Russell King (Oracle) wrote:
> On Thu, Mar 19, 2026 at 11:09:33AM +0100, Konrad Dybcio wrote:
>> On 3/19/26 10:24 AM, Russell King (Oracle) wrote:
>>> On Thu, Mar 19, 2026 at 12:35:58AM +0000, Russell King (Oracle) wrote:
>>>> On Thu, Mar 19, 2026 at 03:42:05AM +0530, Mohd Ayaan Anwar wrote:
>>>>> [    8.650486] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating
>>>>
>>>> Please look into this first - with the MDIO bus operating at
>>>> who-knows-what frequency, this could make reading from the PHY
>>>> unreliable.
>>>
>>> My guess is clk_get_rate(priv->plat->stmmac_clk) is returning zero,
>>> which means we don't know the rate of the CSR clock.
>>>
>>> From what I can see in drivers/clk/qcom/gcc-qcs404.c and
>>> drivers/clk/qcom/gcc-sdx55.c, this looks like this case - the
>>> struct clk_branch makes no mention of any clock rate, nor does it
>>> have any parent. From what I can see, neither of these drivers
>>> specify any rates for any of their clocks, which likely means that
>>> clk_get_rate() will be zero for all of them.
>>>
>>> Sadly, when I designed the clk API, I didn't think that people would
>>> be stupid enough not to implement the API properly, more fool me.
>>>
>>> Under the old code, we would've used STMMAC_CSR_20_35M, which means
>>> we're assuming that the CSR clock is between 20 and 35MHz, even
>>> though the value is zero. Is that the case? If it's higher than
>>> 35MHz, then you've been operating the MDIO bus out of IEEE 802.3
>>> specification, which can make PHY access unrealible.
>>>
>>> In any case, please fix your clock drivers.
>>
>> I'm not 100% sure the currently-passed AXI clock is what we want
>> there and the docs aren't super helpful.. is there a synopsys-name
>> for it? What rates would you expect it to run at?
> 
> There is no easy answer to that - it depends on the bus interfaces
> and whether the CSR (register) clock is separate.
> 
> The likely possible names are hclk_i (for AHB master), aclk_i (for
> AXI master), or clk_csr_i.
> 
> It does state that the CSR clock should have a minimum frequency of
> 25MHz to allow all statistics to be properly collected.
> 
> The rate of the CSR clock needs to be known, as selecting the divider
> for generating MDC within IEEE 802.3 specifications is rather
> fundamental. You may find something there which hints at what rate
> the dwmac's CSR clock runs at.

If it's either AXI or AHB, in both cases their direct parent is controlled
by an entity external to Linux and their rates may change at runtime,
based on aggregated needs of the bus. They're defined as levels/corners
(abstract term for a hidden volt+freq combo).

It may be that the operating range for the EMAC removes that variability,
but with no concrete evidence and just anecdotal experience, that's only
the case for the AHB clock

Hopefully Mohd knows more 

Konrad

