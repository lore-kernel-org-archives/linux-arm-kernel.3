Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966BAF3092E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAYCmhfr1gUqaQ2UXxvnnkvAc0K0BTSbPSlx6GozNA0=; b=GANjaQ9aCakbLW0pjaYz+zjBs0
	g+/C20mN79MJBsZlOgNYro1ImGMFr4CPqpvHxHmAmAHa9R6uu94iN8evAgHn6e++HRDVEEoxcLymX
	3xJwXCeAFeLhRHulkzQ4FSN5FFrHIRQ3ZhWYZXanppHL0ituqUPFh3O0vNFmChBCZWU67q3aD+W50
	R7gsKak3RlW96nXBIn6Onfsz7KjRSWUY2SXLiQhyzp0Y3lTZOwYhVeJqzp7vfGWCy/WywaK1Xo8ym
	9Vn9rXzLB25XOv0waN0m6hcmW4UHtdpgNyu44xWLzRdwAH9h/0a/CMy7pZxsvtE1GgER7C/BmDEXN
	ZZCbxjVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5X4-00000001UNy-0E9b;
	Thu, 05 Mar 2026 10:02:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5X2-00000001UL8-0Qt7
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 10:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LAYCmhfr1gUqaQ2UXxvnnkvAc0K0BTSbPSlx6GozNA0=; b=a2RERoSPCMaKrrQdO5he7NdnRZ
	ZSj5oMQrYWeG5/kkh16RkKldCG6vJ9zRK8dr4ipR3vqD56xuUV8X+pOjNVEphMcPXmhj4auWj1X9j
	D3LVfX/vEtWNzheOnksCP0OgVH2RW5mRraWuPpiHYog/4zpMFSO1Lmb2MOoS7ZY4mOuVBFsMD5d0j
	i7CjRozPm3NnugP66q0LDv+XlWUAHy8r+J0RLCB2odQB5vulwfF2DzpEcKfLrwLpVM7xfJqGfuXi6
	MqGH8jcDIbYK8lNTvjEDVbELPUTlYMOyTPvyllKEiJ690YRnzWBPR5qpWLIa+fDrpQ6uuoe9qdQ3r
	WOHq5ddA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Wy-00000006QGH-1OyW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:02:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6254tXYt218418
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 10:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LAYCmhfr1gUqaQ2UXxvnnkvAc0K0BTSbPSlx6GozNA0=; b=brmu9/RF7IkNb7vS
	GOOWrA/02uQjWusa50Vdsz0LLRigCGcb9iWdQqm4qkaE4wjH9aWdTeJQoGX8pXIF
	gWx6LSiox0Y/qsAci+Mdf0pfEhSE1ZGVd7tCWX/F04t7lWB5/o/mfuXEsavW1pqe
	wNr2rwDs3YQTcGEEYCbb+7lrMNk+7H5gzOPLRuBcjjto7wbzv9M8XZdcnZPekpfQ
	gFGwSz4oz0kGy8ZsK/RQJqRL85/JjoB8LL+6ufiEUZcEJSlMakUzDnXg8dVbq+lX
	6az8JKYOBUz+FKRyzEavLT5vMNSFnMJi6xILAaiuN1nYMi2n6aLamDcyl83ioOL3
	JHChSg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq380s0p3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 10:02:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899fbe67875so21982866d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 02:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704925; x=1773309725; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LAYCmhfr1gUqaQ2UXxvnnkvAc0K0BTSbPSlx6GozNA0=;
        b=jjoGPB24ua4qavdr1b/C9J0th0ej1tyLDoCTy0lqk/Ilsdt2otFd/hEhmFAMCwA3AS
         Yv0ysOLXPpWDotpoHdSAST2KBBdjtojN05KagNJGIxX5a2zwyCbivnhnPYNyYP8CbX9L
         lPXSMgoHu+azZ/t+vTHR1bFnUXJLM+pvUzquxcpbf8G0GXhgtyg6KROntalJA+pp3VQU
         6ZhTPO+zphguTQ19oQtxGDmF1xrtOgvuKvOmMfydLZvmL46zio9MiFtzNuyjERPK6BsI
         QM/xs/l70LyWa7/+CsnpAb0Go6Up8a1LXUp2E025s9lpyhmD3oJpWVAAqQE3DTp2HHJ5
         zEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704925; x=1773309725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAYCmhfr1gUqaQ2UXxvnnkvAc0K0BTSbPSlx6GozNA0=;
        b=W+xRD1ETqsKXzZ0IyXv/JYN6a0vlKBbHSGD1Q7D0SPnXiZBqiKj4/Yn/yY5fSLkTGi
         wzpydBXDitP9aM8VQQKngJ9M06ttF/BxgfogVt9imhsAHXG3Sa4Onp2HS8kLxMhfDjYi
         bG4CwPgQw2ALN6Mr0J6NehlKJXbKMF5WfVRxpXnzyHozPohBR3BD2YsMIKUrB6pi2Pj3
         y5XvXDUnI9lu8Rew+qBJvraGrW0wEa/k232csMFCqhK6v3mBVXtIyxnEQVOkeHgTh1av
         b3m1Eu3OwFsg7+xX5BRP2649hfgd23cYP1XLBwRS/uWWCRXkTL3Kt5yGOAt0GbiWjm/E
         8zBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5kt7XhZrRiVKDWDe8lJ6iviVvOM0pksXEigJtiQ7wWkQhxgJXDW8p5XSQBjYyIPWhbORVxO+nLHeWxw6Xwx+D@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/Z2WHrU1lq1AjntKHvlFzfrgimPD+Sc6tfqgIPXziPzRhw4lk
	+V/op6nhwdz4moNehSMR8bDo44dBlsdNZ5P/veTfahQ3dtSo3KFvDBSnqlv4cyU/2Ln5P06rawF
	Vh4PNrgfbSzT8v/KNaSq77cZ/6M3913mirq9ILgS+u9iWm7+eDTNFy1DH7g9hN+QrTcotAI0QVx
	e7Hw==
X-Gm-Gg: ATEYQzyj5ORstUqJYNdyL33mZLTyBhHm1vR5BmMWL23KECUgOFdUPmDNojPhUu0eDM+
	+ReNv3e0Lv3CiJbinmtdBXid04YaUJ5I8ivsMGRNLzMsnFqlhRNc62VKa6oryWm7NmruFAwabEe
	sIyuUFJTeIm6OrtcPldkO0m5PLgNGougGVtrcLlAsQeBbIFC1pVXNn8Ce8R9bTOJJUCLFKP1z5L
	c8/MJDz0jpNGcrE6dGgDLImggKIz+WxfaN4W2mrSJYmVxbKNZDGH7PTO6NOvA4u2zWriFzx3t1n
	P3aBXoMRIjieOznT49YQNiD/cuUecghprl/KZ9SnjI32ui5JhCyb3PGXnSmBdhG7wXdFfRY/uVg
	vj7NARp+1H6zAeQ6/YMiY6CGfuZIBWupxU1ZrvMXCaBnSJ3i3Y3/xhpZR4VX7J6B5WNfZyKE9UF
	n4tbI=
X-Received: by 2002:a05:6214:5e08:b0:89a:ebe:1cd5 with SMTP id 6a1803df08f44-89a19d09309mr47022386d6.6.1772704925330;
        Thu, 05 Mar 2026 02:02:05 -0800 (PST)
X-Received: by 2002:a05:6214:5e08:b0:89a:ebe:1cd5 with SMTP id 6a1803df08f44-89a19d09309mr47021826d6.6.1772704924860;
        Thu, 05 Mar 2026 02:02:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aee3ab4sm870864166b.61.2026.03.05.02.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:02:04 -0800 (PST)
Message-ID: <24685144-c1bb-4084-80de-40989efbf4a1@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:02:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marc Zyngier <maz@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
 <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
 <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69a9549d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RQncaQt55EiIgf5kr6IA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: X06EJeEMpqsRUBrlIQ6pCIs8pEp5oBUj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MCBTYWx0ZWRfX2ubOIPS+hk8j
 gdIqnGe/NbrRODos/QV44z3g0slQPtyFCcJkk/u8JgKKkhHC3sD1Ro1d/kKQ4q+hivHMT8FnT0i
 ZKKTajEtXwzSURGqum97t8tPRFQ0a1p6UsdUYQVBa/hHIraitTQIViw6amJ74aKCkRjY86/50Ro
 ilsIswh2WfuxQAYAB3v6jviHOHCqM2+N4QdT1hCUICn44gH7zZzlybjyHValcalSXHYn6FbbX8L
 Ip7h9nn9eABvE7mcnLRaxKSpWO7jaD+QdUQfPJ0KdGyS2ezjkv9RbrJ6me42uaBYtjW4+gX4khn
 JnLt5YyE5gMHk4+2wje8JQh0wMIV5p+cZUyjQj+cvnUJHhV9Ki3tytI7Pb7haocAH3XPRymSHo2
 MxzBV51e/AeDrG0hmfe7SwTdCoGDG76V6bXgH7Fp0cpKQExmNg6GhscmvepWwRu4uLQHcfE48aY
 cElydmagCdVhnEK/8Ww==
X-Proofpoint-GUID: X06EJeEMpqsRUBrlIQ6pCIs8pEp5oBUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_100208_715654_DD74A743 
X-CRM114-Status: GOOD (  15.23  )
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

On 3/5/26 10:55 AM, Geert Uytterhoeven wrote:
> Hi Konrad,
> 
> On Thu, 5 Mar 2026 at 10:33, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 3/4/26 6:10 PM, Geert Uytterhoeven wrote:
>>> Unlike older GIC variants, the GICv3 DT bindings do not support
>>> specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
>>> series drop all such masks where they are still present.
>>
>> I'm having trouble finding where that's used on pre-v3 even.. does
>> that actually get processed on the older iterations?
> 
> I had noticed the same, and had asked maz on IRC.
> His answer:
> 
>    "so far, we have never seen a GICv{1,2} system that didn't have all
> of its PPIs
>     connected to the same set of devices."

lol, that's fun!

Konrad

