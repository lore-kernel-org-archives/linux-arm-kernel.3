Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3091CC79FA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 07:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yR+2kAsivE/Rvdu/9KWZ7We8zTZVWkvuerZ6CyrQIVY=; b=eV28w4VmN0i6yuLO9mwZz7CT4C
	iGuI8vdwX8Vg1hXW9Jj3MLGwNQq2Z2GCnHmKCNJva2zSNRKnRE441R708R6ptVX9ER9OUL+mgC/R/
	YbMR9DI+BPm7ZTi5s9nSmltKPoEo2FPQaiw0fL8Juab1vJhUVC3dThxdT5jRWzwyODZql/BFP1Ewy
	MAKQsbOyFcIRFWI2FddxfglIHDfNr0EGRRzULMLqEbSmTpPooFz/VJ7BIaXUSiPizdpLhCYV8LUF4
	41RXMf+mY0kXEtAENNONRK6/Y2HG8lUAFBBAiwaSlRHbsVd4DI2I1qaBoNz5MXdmFTx/+1PD7GEOm
	rNUMS9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1DY-0000000CUrH-14rd;
	Tue, 06 Jan 2026 07:11:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1DV-0000000CUqk-0cbV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 07:10:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QJZP3271888
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 07:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yR+2kAsivE/Rvdu/9KWZ7We8zTZVWkvuerZ6CyrQIVY=; b=X2rhLxsgYoyoE5AY
	L4b4cQJTQ3YgIfJCOY2LOJVoBKGe5vLK1LpNNiDsUPfYPZFJrCvR5L6HKf8GR76o
	8Xem8H7csVtFQUIFSXCaZou94+irylPnnV29sMLXiknpFDdgHOFgL+jg3vNiCh+U
	u8uJoDzslcYsqpOZb8u3b16lzO2UczbNws/eJs15FDtstTOCjhv8bpMg7IBiBdsU
	zE7CqkcaOz/1l++v2Uo3JcN+XNUAHfVn3rtogIk4FRDqu1x5eiisquylcuSGquLf
	JjcY9vRoINW1D1IPJp/i+YibBXgIyJDSEo3kApXRCtijUJfeLCFyzeiGe3OegeMW
	i1Zuwg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv02c0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 07:10:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f4a5dba954so18576961cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 23:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767683455; x=1768288255; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yR+2kAsivE/Rvdu/9KWZ7We8zTZVWkvuerZ6CyrQIVY=;
        b=gljPTarcKtnLLFNPe4wqFXs18kKUkiwPhO4Yv9kh3xqQ5uYGsS56swi3zYCsIwgzrE
         MuaanXhxeXAHKr16n91IV4FJjVCeGyBa8DicYRWDY9ReiL21H7YiGfD31qDKeeiJjoTd
         X2epmmN0gNQeWEGbKQd2xfY5PBLpNiltQAqXziKyEZClMVcvP2PMcFEtJbB+vwtsJLnU
         AfR+tuzmUIecqr7SjtGvhXJJw1e6U/8M2dKDaCUves4cLa+wTwRrO8gq1JC0ftBUuFs2
         WmlReAu5r4s74XTKI19PfYl9GBAadrxN0dduBIr1kTThSq8s5ejEJ2G89pnnYf4lHt6m
         KUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767683455; x=1768288255;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yR+2kAsivE/Rvdu/9KWZ7We8zTZVWkvuerZ6CyrQIVY=;
        b=d/Br8wXVy1SzeGnTsXd77g9UX4zZoDd9V59OI6Iuy3TUfp+KP5WeUXwsIQiaxEGRJ1
         +dzQAEsZfuEAEyFY7BGl/2A/LvsgkR1pWcXNwHpc3zvfT3ysCCV2an4KZFr4AuQOEFHb
         ItafIGGfYFnNVCEUY8QBVTIAtJOW04MbCBHYal9buvan5LdhDlMiQwsMLfupN3QeaU9H
         vV37UsidBX1lAPuGvrPmJ5pRcheHdFp1ysEpvS0MddRuPC5TVsHob161d34ZDb6WM1s1
         LyzOGqRDRweaLoYqIHplCt60c+k0AHzzsn4od9LnYcyxPnKMY2CK182kBMRE0uGd6fjx
         GNlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeCBoK2bJexJm4oPNLhqyRf74biq/AAASRPMJO6nj2G2x4VT2hQGjCMBfYhcK7U3sB1Zv0X1p1zuWZuZtS9dLe@lists.infradead.org
X-Gm-Message-State: AOJu0YyO4rt5WD6y6Ock4esRz03p4sU1Y0589gx3tzWiC4CEsz4T4+Ac
	KimLP8zPqbwc8QHmUHaTN9aeXjfwQts/RMY36n7qVX/wYaUI0adihimW5SdHu4j7GKAw9Not7tp
	Na6QOy9oQm/swuM1Yj8N/hKfPyhotQBq9J/smPkUsyCqNcWc0YdNhN7tO6g6saGMsOqwAJQ3oiy
	gTdA==
X-Gm-Gg: AY/fxX5/Bedr4v8bKl719XYf6FKCtUbXLAjgPmNkfD7Qe2Z7HImhgEvxNj5oH3wNM7V
	czjgNpx6pKA+f6K10PLr9GEdZm1Tpjj9hM7tPbdPssTE16CLj3vR2fhYlFs0YQqx3WRl5aI/Aqp
	ne14YDGrUldA3UyLYyLzyR0+3cWw06PtJNJy5euGnFg1rktLNV9iEAboJtfS9FrlpATiJyHwqCn
	eutYTZFByApkL5eFvKXLDItu8exOg4gRWlwZ0eLtNs8SSbtp90SdAzdGIKiL75fPJg3s5zIXqdG
	WcWSa2tRmExItSz54ARkbAzEsJOmfivjHcw9ay/ZNrz/eLTBH9TgGMGgxLPz5QGEaLjxLxH2hPy
	Az5p2sWOO3tCBaO8rWeQq3FjN7oh94zcU0uAvXA==
X-Received: by 2002:a05:622a:2449:b0:4ee:ce3:6c9d with SMTP id d75a77b69052e-4ffa76ccec7mr26847771cf.19.1767683455272;
        Mon, 05 Jan 2026 23:10:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8XFjy35zyxBfC3DOLW8LBR5cVdZzZlCAUK/f6DleVwXoBDQ8jjn4JwiDCBEIoRdJUfETm7w==
X-Received: by 2002:a05:622a:2449:b0:4ee:ce3:6c9d with SMTP id d75a77b69052e-4ffa76ccec7mr26847261cf.19.1767683454846;
        Mon, 05 Jan 2026 23:10:54 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee870sm2690447f8f.36.2026.01.05.23.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 23:10:54 -0800 (PST)
Message-ID: <f8e6666c-86cc-4123-b1f5-681b656ccf9d@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 08:10:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] of: Add for_each_compatible_node_scoped() helper
To: Rob Herring <robh@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
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
        linux-pm@vger.kernel.org,
        Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-1-24e99c177164@oss.qualcomm.com>
 <20260105223644.GA3633916-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260105223644.GA3633916-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695cb580 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=o3VLu0Hs6I0nX9ffGz0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: EYWkTfiwBbURhdRsDIh-qVtj9CCVlbyb
X-Proofpoint-ORIG-GUID: EYWkTfiwBbURhdRsDIh-qVtj9CCVlbyb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA1OSBTYWx0ZWRfXxprP64/qoIiZ
 8LiNDIRkCro8O5LyQocrb1te4eUs1duleT3EtgssC7WeilmP6vLSQ4VnTpj+FtBGFhuPE7A7Lm0
 f8TrASJYxCjIKZ4s5nA8cKKsV9lkncA8wu7tbbmp2gUoiWyJhAEbe7vpSZN8YJMmNK/V1tgeZDu
 OG6GeNzbdm2XXio8DzrX7uXsDZAOHgIFmXAy88wqhlFT4vAXCcKaa7zAnU1GL4ZlglzXFtoU6KO
 bcDcl+109AEqf1fNYzUBA+XLSZiPAodF3lse20vtO94iDVKTQdnU8Dr6bgFE+Ou4HO2lOwO/EXF
 TwmO/PeVGocX+XejsgUDDfG+x6MfrjvRCOmLhhYPhSh7U3zIYtA2j1aoVLlhZsd0h6XZLiRDO+U
 H7VYLW7ZLIt2R49r/QvgdcL4Q43kupKl8D2USci6Yr4qzVmfDJwj46gLEMmLRin4ADXkVEreFgc
 5lrHXoxHYf5fBFxlQBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_231057_746439_D75B7529 
X-CRM114-Status: GOOD (  16.51  )
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

On 05/01/2026 23:36, Rob Herring wrote:
> On Mon, Jan 05, 2026 at 02:33:39PM +0100, Krzysztof Kozlowski wrote:
>> Just like looping through children and available children, add a scoped
>> helper for for_each_compatible_node() so error paths can drop
>> of_node_put() leading to simpler code.
>>
>> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Prerequisite for all further patches.
>> ---
>>  .clang-format      | 1 +
>>  include/linux/of.h | 7 +++++++
>>  2 files changed, 8 insertions(+)
> 
> You need to update scripts/dtc/dt-extract-compatibles

Right, ack.

Best regards,
Krzysztof

