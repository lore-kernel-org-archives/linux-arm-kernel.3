Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9249EEF323
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 08:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=; b=kzyaMRYXwWIIymQGrMEW3gAEex
	cqx5spw+O8mQdDcggclILszFY+MmSzc7k23QaDRxFL+aWVaUNUQeJ+bLK+pX22eM+Qnn7TPDE4gaG
	a9CSm4H61T06kBcCK1i/la8KH1ijaWyYlZ0CtuyKM4wwOcdRA+4sZY5WuRoWy48lnnr8yTWL7fpep
	14VOR5uDcn8xtkVo23mKBrT3fpuL32kadrW9gS8ElOjM5mgOVVryEB7a3yB/ZhaoGUH6lHmd2AZPa
	mc5nPjbEizlp9Zut3RYtByM2yCRriUdIRmS9leC4ttfKE/W51E7FhHGTtbYWLwQqELYQV8CiHk2md
	tXnM2w8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4FK-00000001Dct-1l6n;
	Thu, 05 Mar 2026 08:39:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4FJ-00000001Dc5-2B3s
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 08:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=; b=RPnzPvEgdIAKXF8oWLh3762hyG
	pH/JErA6rTJvIbNHbj/FbK5D2cBkjFXqFebO/jVQePFw9UmlqWW7uZ9ad3InnaugW8c49SeUGuP9X
	/UJjoUyOm2Jh4a8gXqQvk9AJKMtd0l9KolkzXnqaBFs4uCc6eRNTd9nCP3uo/ODRo97dUQUp+cg6K
	26HNNzy46BpVTOOJNF3TSmem7rtF4+xM36LCu44NzmCRd656vIkhBa+MRs4OA7iTQ5Jl3zb+FhNP0
	s0m2eN8yGJ9KRAWxy2jtB262hH+Yl7stVhMhYRLwIeJAPqndzlW3/q4k+tU9p/97bkLF/TEuJyfXP
	UFbcawYA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4FF-00000006E1i-0A2u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 08:39:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6254KGLi1852944
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 08:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=; b=Zhs1szgRs6PvG6yC
	/K6l0Og7co3C6ED8icQT7ngtsI9G5Zp17IaIYa/MOFJSyTxAUHo39qtMLOBGQhpj
	JO9fE/F/E4F4LvhAKnAlFKn+fH9sEpkGqfNT9M43WTCJkjqaFeUzfOGpTrDAGNtC
	tA5poP4iW9oFEFa2er9A5XyBDJ8CedmbmCYM1jjJmOXgrD4UqsM96/EbUTiVA/x+
	+Hq4ib0d4uJFejDRNFTAYPM9OxAzG41cfjw0IJBJVDWkmbFbGS1eLwFkvUDxUI+x
	i9yGzbk3U3z2KxBfUGbK5GoyOmpZPSUHhrYGJ9ek999ywA1Q/YTR3XTo5MWWFrPw
	1lqwYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq2q80stj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 08:39:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb5a76f13eso420672185a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 00:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772699980; x=1773304780; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=;
        b=Pug3WPBe+xMjZV2lhuqYSbHXUVCZet86PsQZiTY7sG1NRr1B6N2otEtR5RrPVnxYB0
         r5dTU66aV/1c54vYFHua9XV7RiJiHUBJj3ot4E9rS1GBoiJwCU/lhLFM9e3UPv0hzfCm
         E5Q9f7HIwiwFDFYbQ0oRSaSvqA86AwJ5/yIQpIfo0FxHRqValVdImCI6GaRWz53JMkZ+
         sf24Tn3Lq68hl/PAzBzL4C7d55TcpDC7gQtN7nBzvNL9T9q8GZ6j8xr0Is9GFTh1bmry
         7KDBj4DM+ubZ+pqTuohV5/jRHTQc1sgXa0zlAmG/s09CrSJJnAlGl96ry8HbZekBexJH
         Rp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699980; x=1773304780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=;
        b=WUhM2MQEfk2BRSDkG508xp26KrfhiWJ2flraIo7RswzIMKytt9lS9/ZFDvGLzb9SE+
         CB+zrEiron+9nZjHATts8ePHtTBbgUnIX5n6WRkl6hiejTgV8tuYJmwwy77jUsQL7F4e
         2MSifzVDpxmT+lUzBz93pc9CTqU9tmXX2WO7fTqAYm3W00ic+B1FYCm8IIuKUSH3Go0r
         rukROfkiphzwLMl/Hu7xFUb1y0PgH69mi0Hp+JTUtcryz8p4xrnqR6D4Zo/cxkRl26Od
         Nr3oxMPhvzgLuzlwO8wEfaMgC7MPCjFkOLuPTN5iA4SopWysVC2LsWxj4D56MB9aM/sB
         N2CA==
X-Forwarded-Encrypted: i=1; AJvYcCUvfosdlgyR2VgPBIDydCRTizZA0nxKyhkN/cSppOz3k+1aFYjZg4GGnTDNnOIEukhOqXK0MlUS37EiX4Q+uQH/@lists.infradead.org
X-Gm-Message-State: AOJu0YyOvCQNbAUxhA5W4/nWASIl+pEoG47+yD2KQa4asrsjiOSsNjP8
	SMSrkWFdJPHyfUd3XvfqNaAa9E72zvUunhgFzAc7SS7gPzvJQEeQSK9Jce3wqwiExapvCYYLlwn
	1qlFvdafCO3tVEEdicdunLblcvIJXV3TPbXD5WmpA5LalHasxMLvyk5VLV40mbmyFZIMNn18p+w
	jynA==
X-Gm-Gg: ATEYQzwu4FECWFN4Aq9H3/yqZGVYIIh7NBzv4ffLjyhvBNrQV6Ai0M++nT5e4kRLo5o
	l0F0UUiqRawjwtIW840xYCbEZG+Cc6ou54fh1rSHJ1H+FIzbMlT6S4xBK5ErK7r+vf1jTnsju0o
	2rSStzTq2Iol8/EXspWVwvJUF6knavdzGPUxYI+mx2qrVw2xrSz9JdQuXQb9TQkIUnbVgBN0hPS
	CYP61ONxya/N3h6jO5ph223ALY+v2auGI/phBJ6z8Uv9FT3sb4m8VvdLeHakyf17FpZJDOVmFcy
	Af2bGvHpyALl/dWJsBp/l96L4yOM9CErrWBaOwJctvAVLQSPsNPf5VhBFVFpBDOBCEgXQEqG5w/
	LfGXpxTIGnBejmhYSrnnPLebRNKAcPjMGAQ9ojbltL+8+zilN6BwnixjqCyxA5iw3zk3eIurSUN
	fuw6w=
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cd5afcdcfbmr452358585a.9.1772699980143;
        Thu, 05 Mar 2026 00:39:40 -0800 (PST)
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cd5afcdcfbmr452356985a.9.1772699979710;
        Thu, 05 Mar 2026 00:39:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac06e3fasm6657504a12.25.2026.03.05.00.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:39:38 -0800 (PST)
Message-ID: <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 09:39:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
To: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304175735.2660419-23-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PgKybV3UmQKvhBjCWl5gXBds3sdsYqgX
X-Proofpoint-ORIG-GUID: PgKybV3UmQKvhBjCWl5gXBds3sdsYqgX
X-Authority-Analysis: v=2.4 cv=GecaXAXL c=1 sm=1 tr=0 ts=69a9414d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=8AirrxEcAAAA:8 a=GJStlgXwfe-SXQdWLvAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA2OCBTYWx0ZWRfX1SsbjD2JjYTx
 UHhc7SvXKQ7aL5SeHDOsgn3Q7dWGHQoHSXUPc/LYZjXUfM3P2SGyDluknewWBUXgjApOMVmPy1A
 twbZB4Eiy0VxRjJDE9kpJ5hjaysmY7q4cYn15urH1C/MA51W6g5reNFdGQt6T8PCsNeTQP+RT5W
 kaKaP2H8qzxGef394HGjQ58WBbwYGI1WNLCQvKs8O9gBN15jZxSWdH78a7Q3ruF4Bt4PruXsvA3
 y/C4IA0JPGyf2mlnTwcM5BZcZ4mKTsV902tIGpDn8seAn8mY+tOtjCaAKIkhIU4AxP2AXsP20x1
 qtz1hW+5iv56TgRWcUvDrsGM3yhV4tR9OcyMj1NmY9TB+0uRKHadcLpY/eEXTiPaSQEtJDmW4fC
 MpULK+yrxYLtxts/txu6Zs9GMKKbMx8M9kmdfC9FK8ltalTmu5ZffeEtmG8MywHyVA2WHXOL7zG
 rCzUHbxb09NyNy7/lAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_083945_469840_36831BA4 
X-CRM114-Status: GOOD (  21.05  )
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

On 3/4/26 6:57 PM, Vladimir Oltean wrote:
> Some pragmatic shortcuts are being taken by PHY consumer driver authors,
> which put a burden on the framework. A lot of these can be caught during
> review.
> 
> Make sure the linux-phy list is copied on as many keywords that a regex
> can reasonably catch.
> 
> For simplicity sake this is not perfect (devm_ and of_ are not valid
> prefixes for all function names), but I tried to pay attention on
> avoiding false matches on things like:
> - drivers/net/vendor/device/phy.h
> - include/linux/phy.h - network PHY, not generic PHY
> 
> So I used \b to try to match on actual word boundaries and be explicit
> about what is matched on.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a5..bdfa47d9c774 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10713,6 +10713,7 @@ F:	Documentation/devicetree/bindings/phy/
>  F:	drivers/phy/
>  F:	include/dt-bindings/phy/
>  F:	include/linux/phy/
> +K:	\b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|off)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvdata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|state)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\.h|phy-props\.h|phy-provider\.h

Would looking for the devm/of_phy_ prefix followed by an open parentheses
not suffice for the 'has function call' case, instead of listing all
currently present exported functions?

My worry is that this approach is overbuilt and absolutely no one will
remember to update it

Konrad

