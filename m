Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1F7D26D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1yJjgm4Rvq3zP6XQkQoHWK4jVZjfp2PJ8VoVGPwhkY=; b=Q2Z+bUeHfXykGv2jOKUk23nGCc
	tIZJJvOkqR5tpOhAjtMJv6oYvKZAReC1bUO25COUDCHYDJwKFch468E1j8/sRC5146qUO8/qbZDUh
	GPmn7UNARhKcDW+1qR3fITamXaVPiXEeTarcObjIyCTkjckf9JhoLPKElIJWOZJRZIF/frr9TTn2C
	zrn6QA7VKm473TYaAUWkE6S3NZ9adVVVPmPIEwr3CGPAURhHWFunAFB9DDaschdCqQ2oStddJ8wDV
	rDtA6DhA0VJGXMWioTO/hM6zXwjcYIkswWU6Rrwk+i0fN91CoXPbBTS7/+wxryd89flEMrQG671ji
	PVhJrEsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEu5-00000002Xo8-1Jia;
	Fri, 09 Jan 2026 15:59:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEu2-00000002XnN-3qjV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 15:59:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098aFs43629109
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 15:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R1yJjgm4Rvq3zP6XQkQoHWK4jVZjfp2PJ8VoVGPwhkY=; b=SY4eHgWRegCoCESk
	Yapaho1FIoynUqzahlV8htdbNyfrSp0Z+6UqbTUkS3bPnnRIpEfOIgQFRaYUWMxx
	VQBUSTXrIGj1Z8J5MswbebEHp9sw4Lmybge3HqD0AooIXWnalvyNgK6R0uuw/LbM
	VmVvvDFDvS6HRN24vFvUaHYAQMUKM2hnmh6+z7iQVDdi4oiwgIbnPkW5TFf44ERF
	uMhw/KL9ZxeXcaAk+ImbJCo+MO5qd/XPMkWlILOd7TK3h4NVZv1XqIOTtuYfr5eb
	/JPlg/8gzHuxNgd2L2QdSWBw8OF7H/XRMw5uHtkhO/E+FOtFqOV52j7oKzdqZ++c
	imFCQA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j37dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 15:59:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b1d8f56e24so1092772085a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 07:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767974393; x=1768579193; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R1yJjgm4Rvq3zP6XQkQoHWK4jVZjfp2PJ8VoVGPwhkY=;
        b=csFxmUqmgGjkI7tFwafJbPbmQn34kzO0Zgzy4XFPEruWn5f9fLU+oE3b9eTA2Y1qUJ
         uw9aZSzEraOAA15nJkhykj4pqKJKetTpj+XDqv5RIw7brLjTkYubpC3tLSNk3gpuNg0n
         NrkUciuFy8/7Oj1WkmbdNUxbm1HKYr6RVE7ffEemJQZqVHs9wsjnjtkob727a41Ahqxg
         Ul6d78CW6ATQ/ZQCqA4UispR5GNAT6OVKfFnib/8HDUiq+i52IwRKzCs7WGdjRsQmB+q
         lsaxfPDkkSkOFUm9ipx5FQmzRQ5GKLvEXWjhE+hbQ3bzBoh5XSUCvZIr9f6mBhJ3cea/
         F2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767974393; x=1768579193;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1yJjgm4Rvq3zP6XQkQoHWK4jVZjfp2PJ8VoVGPwhkY=;
        b=QexGQOOWsqhS3R7h10XDzqFoIWbyFZQjvxWHjA/9kASjwAKBmetNxzn88Q7/UAO0+l
         m7C3R92+kgk1Ax8RGf7N7HLCWYpz3kq4KoEHRnbav45s92ZmqmyEoqYS90+DuZnKy9S9
         dmVaE7XGb9R/OCmRF9JIL6iZHFwliGJI+Ry2cwrKfmKlhuMdEdCdoAV8Zhdbzd7QtDLU
         ZesZHkc6ode6pC9z1IekQjBL+voyWZQ20/MCLOoguPE/xh62ZJ56CNaD9DjQSifIdS4A
         qr+/40zKh5lyIY+2xo5Y1CShTdox1DXDA0nroGYE5TEWt4H0PzQ5D7nQ6QwhYO4DR3Ar
         ijHw==
X-Forwarded-Encrypted: i=1; AJvYcCXUoK89dH67pRdmYWx92neKaro8wU7Oa2kJMSf2zEVhg2STIP3aEmIrEkRkkswZ3984gfVKr/rOQpgaubnDO8Qx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4hwRxxXEVfMJ71d1XlXGh1IufLTiSgwfFrqPDQjeGV0Lv5xds
	YyTQ2OEnSMlR2YnzhTcwfrZmELCDXrvZdv2nIbao+wAo4BZ90kK7brBq4PkqcY3TVrIZa85TP2o
	rj6lwPXUN2jgQhjRtjviiRHuoq8pNTiwX7KAVGvsFz5ZHhWTHlnWjELovtd5Tq7wy4JjxQRKvLC
	9yTw==
X-Gm-Gg: AY/fxX7V8+xi+eEgWgSb4ACbPvieJEehF8CVU9A5SRka/phAkcTm3KmDYRi+jH7tq4I
	lbn3N1GdLg2SQfE+n9MBWzFOKjKhBvUX+nEja9vXy3J2JHtXxxdlSi5TQ5WCh0euDglM+k+xRAa
	nku80i1QITjDfNM/0Ibbig1aTyujpIhrS9LDnuLHYS0tYfnoRMomQlJDlvwOpfF90UOUnaWWY8d
	TeCSMBFI1xdoTXo3b86lyCH1mR36Uz4vDZ9HKAbOd+JcuDFbaPtwqaxI9ZNRUm0rquF9l4RHr0y
	tIzlYqq6n1CSkha4P/eTbuf7J4EMUZ+RMF5O0sm6uY+5Lxp3BCFh9tzAfr9aW3kofw/y4h08VQx
	3Ipt5efjFBa2Jh15Jzx+xviy2C4W+MCTB3YprPw==
X-Received: by 2002:a05:620a:4012:b0:8b2:d56a:f2f3 with SMTP id af79cd13be357-8c38941be00mr1353947885a.87.1767974392651;
        Fri, 09 Jan 2026 07:59:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESJfXgvNwYoKbr+VV5K75y0TEuDRNpdFfr3P8pbO1Z0XQiQDyYbEMWdURI1MI8Vrv8awf0vw==
X-Received: by 2002:a05:620a:4012:b0:8b2:d56a:f2f3 with SMTP id af79cd13be357-8c38941be00mr1353943085a.87.1767974392196;
        Fri, 09 Jan 2026 07:59:52 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm214846375e9.1.2026.01.09.07.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 07:59:51 -0800 (PST)
Message-ID: <f49d18b4-f7b1-4a48-8132-6c081cfb78d8@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 16:59:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] ARM: exynos: Simplify with scoped for each OF child
 loop
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, llvm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-3-24e99c177164@oss.qualcomm.com>
 <20260106101107.0000398f@huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260106101107.0000398f@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExOSBTYWx0ZWRfX2Adc4U1VO1Iw
 t53G7s09bVgkf800o9Y7zyL9MwWVAOl+aWw2TUg2UYj04o/spSGvUimCjx08S3r1IUFPcMSMlfW
 BE26Piiaq5kEUNnFY8kW0PbP4G+z8pkwx7i15OYtXoJ/lJ+hw1UHQbnwOyJb5G7FbdOLWoqtnwW
 r99s82mkhrCsX8N+dpHbMsCP3riau5DsvP8XXaHKAtToRAeFCVsg1SDkMW3VQU2+6TUaN5Jg9Tw
 BTJVbSSof6OGLwCiNb5aN/meSpnRqhQXKDPl4f2d20Al8atIxqKGbONwJ7szjHuviqbNOCqXsKn
 IacM0VSINNreQ4i87lGxUaEX4F2fQ8L1MRrg1VYXVphSB3lN6P7TCVqE7CN5ZoP0gilUbV2rJrZ
 qZx8kFZTrISeXjNFrB8ABpnWKFRO0YllrpPvb2JWoakTId4QlMJEEYwwW41JBx+6yxfDUQr5zKe
 3r6xphqdpvml8OnPzDg==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=696125f9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PdBTwWr2l7WQ-UydZiQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: akv-DP_qQiCAMs6VPuosVnzaURIFeNM7
X-Proofpoint-ORIG-GUID: akv-DP_qQiCAMs6VPuosVnzaURIFeNM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_075955_079885_5CC5542D 
X-CRM114-Status: GOOD (  13.46  )
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

On 06/01/2026 11:11, Jonathan Cameron wrote:
>> -	for_each_compatible_node(node, NULL, "samsung,exynos4210-sysram") {
>> +	for_each_compatible_node_scoped(node, NULL, "samsung,exynos4210-sysram") {
>>  		struct resource res;
>>  		if (!of_device_is_available(node))
>>  			continue;
> No idea how common this pattern is, but maybe worth
> 	for_each_compatible_available_node_scoped() ?
> Bit of a pain as you'd need a of_find_compatible_available_node() helper.
> So I'll let you assess if there are enough instances of this to make it worthwhile.


I think there are only like two or three instances, so not really worth
the effort.

Best regards,
Krzysztof

