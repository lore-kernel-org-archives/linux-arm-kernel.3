Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C672C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 07:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWemyG4N4ylx8AJN2NYbSRutWHMPkhp+MiTGTIekUm4=; b=vCJcrR9PkCtCzNpe8nXgGeOV/l
	yiDf6Y/1Flhi8gpGf86WpBiu5fCphey/Q5jhzRRbkW9kxdMBVDaVLhr9oNp6mkMstJf1odIZ7W9gE
	N3noISqMGj5JOuxWVbnBzPh41j5FuUyqZARQ6TX5KnXJeImdKQ1VRiAq4aSt28lzTPIDpWNp5jVLw
	LTQsJ/ZTqg6GGlSx9D4okuMUOMDHfTxb0pKKvdWQKAVjqgfSLLCY6fsNE9eksvumTC7iihoQqGi3b
	Ph6F7wS0yAMA9CryQ550e7F6u4DHMGhJoD998Eb0+eBDY5faw4PPDhTpDiEEv58CA2ATWUPvHcOGw
	KUqdcD+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxUV-0000000B5ja-0cmz;
	Thu, 20 Aug 2026 07:47:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxUS-0000000B5iG-41Yt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 07:47:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6PYEu1987347
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 07:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FWemyG4N4ylx8AJN2NYbSRutWHMPkhp+MiTGTIekUm4=; b=agAReysmKjIortik
	PpCcf6FrLsBAFvE0L36aRTnWYqI+2R+0kYuY77jU6VmYzah32kclW2u3mzNnW8OX
	M4+9abOckXZ1aVh+cheNvogAjrVtl5op3ScbA0oxs18pLFQwmFZE6u51IDK3nA0V
	AG+BpfPw/uMiNl8Yigark5SmCr0wq6OIJNBtOFYchSOdgDrWOYtfRm0wgHhG8P0F
	Nd7f2l8UBeQtWDILlHMdk5SsvsbCe5cdm/C7McjEZwwhXr74nCvTNoZUMehQUS8C
	CGb+yjf1tzdvKdaGaJCxvSQ0UEV5ECe7kaMsaZgJrhH0B1p1NOSSnOcAR84qe4Wt
	87Yieg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esj3r86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 07:47:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d9cef8d15so31665881cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 00:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787212026; x=1787816826; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FWemyG4N4ylx8AJN2NYbSRutWHMPkhp+MiTGTIekUm4=;
        b=Fd57lA7QYSWmc4i11jWOCxs/wQiG/n1J8hqOaY/l/0dV62t2FwO1nMZhabIIamKepG
         JWnYuGtttOYLB56IqlxBY6Vt4p3fqnx/3ZeGvINmLAi3uhO8/sGIYdmQHhCq2ppYMcL0
         caJn0t57FSEw7RJKG8+11iuXG7PIW7LPnhlUFUzufhw0hFkanccOOOCf4x6z/rdEFrDY
         ZGdZyR6dnWtAw8SIn+f4Xw29JDM+gbD6jBxlLZ87Kw1kuTicLNrGlGaHi6ZDy1rdgH+9
         vL3UQK+ixqRzv13Y/AYoqD1GL901/0clDcqyCQ2aCvEoKAIsQope/ug1YiovvMFdZZAf
         3img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787212026; x=1787816826;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FWemyG4N4ylx8AJN2NYbSRutWHMPkhp+MiTGTIekUm4=;
        b=ZsQIqPdYbUK3jNcwC8MnMOtTz4THzZQK65Sjp20NaTHqPCI2ze+xuGM8dfinhGV8gr
         QwKts9PLu+kx0N1ntTrNco8rQ78mYpaC2NAvIwOz6EuVe3YsPOuMF++K4t4I0ZzZnVxY
         SmVs1IwTImjyZoWTu46P1nxuTx7zP04j/VtL1iyEq+NkXGyIREPiH5iIgwhWmajXcpOJ
         DkLnB4JIvHx8PbnoUY8LK1WkXCvTmmFNE8W58/6noI0tWMEPrK6gLwohUPrV9vBYir6f
         AwXAn1K6kTtQpa5WiqO6MpWB0BmxC6HRNFMAx/Ijz+CCXaZ+RzFSuX5aJ7xXC7iKjQzv
         Tdag==
X-Forwarded-Encrypted: i=1; AHgh+RrluOgga0xYnv0u+5DnBveU7rntxv1yBG3hn+L4S8bK8ZHygV5xbvOVk3A6kr/HIIjKJN0Ve/gGGTTYa70FxUQK@lists.infradead.org
X-Gm-Message-State: AOJu0YzCH8O2NnEJWCN/jVGKfd4iqcWpB9mSDvJXb+wOo3CpG65CLB2A
	IodQXpi1fr8a5a5omZiA/up4nS0sVjoe16pnqJyu0LN1arUZnMsYdBPk8PrVkCeb5TAS2D0EwPO
	0r2Ma6i/lauqfJY1DHZ75J8du9zPcYJN81HBOjriIRr9tf8lAEvUvf3c7tqJUOE0Wkp76FMLlG+
	1PkA==
X-Gm-Gg: AR+sD13O85eDJeVj4iAUGdnZSk9h002ahFYWqlmdBUuv/xv/yvtKyauhl56HgWQVFpj
	t55Qf+z0OkIoO7KlAy9YsFu5gcwMcqH/kF+BuWAemZOY4qnBBBwrUsTV/ayU/RT8E4Y+o00ph9d
	rONejE89YlS/pC9m8LuvjFELK+h9hwBxws9imByLqjZzKlJlOZWSqruoVLW6C1STerbcJbUcygJ
	C5MNEJC5M481uhpYTybCfj+FAtwyXMkEeaSXSdqzN/9d6pNgSDPp63mJyXESgQNeqQG3IikFpJ+
	kdg+1P39nsEeD5WnPnAtC3BBPAk7374EjyuOQlyGChZpCEPP0Z7+sgpd1L/x5rOxSslyPmmFxyj
	tyxI39kg4LfpLO0G+Xoilbfk8GIOP
X-Received: by 2002:a05:622a:2b4b:b0:51c:a70:5ed with SMTP id d75a77b69052e-52dd5c9313dmr98105121cf.30.1787212026504;
        Thu, 20 Aug 2026 00:47:06 -0700 (PDT)
X-Received: by 2002:a05:622a:2b4b:b0:51c:a70:5ed with SMTP id d75a77b69052e-52dd5c9313dmr98104821cf.30.1787212026125;
        Thu, 20 Aug 2026 00:47:06 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0dd5fcsm133844445e9.14.2026.08.20.00.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 00:47:05 -0700 (PDT)
Message-ID: <0f8f3d24-41ec-4878-8182-c805c7db7c23@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 09:47:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/12] dt-bindings: npu: rockchip: add
 rockchip,rk3576-rknn-core
To: "Rob Herring (Arm)" <robh@kernel.org>, Jiaxing Hu <gahing@gahingwoo.com>
Cc: linux-kernel@vger.kernel.org, tomeu@tomeuvizoso.net,
        p.zabel@pengutronix.de, ulfh@kernel.org, will@kernel.org,
        conor+dt@kernel.org, chaoyi.chen@rock-chips.com,
        dri-devel@lists.freedesktop.org, zhangqing@rock-chips.com,
        linux-arm-kernel@lists.infradead.org, joro@8bytes.org,
        devicetree@vger.kernel.org, iommu@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        krzk+dt@kernel.org, alchark@flipper.net, ogabbay@kernel.org,
        royalnet026@gmail.com, diederik@cknow-tech.com, robin.murphy@arm.com,
        heiko@sntech.de
References: <20260817113603.1436067-1-gahing@gahingwoo.com>
 <20260817113603.1436067-5-gahing@gahingwoo.com>
 <178709455518.1014304.1443906758035976924.robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <178709455518.1014304.1443906758035976924.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8a-sR2CqjcRyqicwWIXGHLc6hqzzaiaN
X-Authority-Analysis: v=2.4 cv=EaL4hvmC c=1 sm=1 tr=0 ts=6a86b0fb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=9GNsruGHAAAA:8 a=EUspDBNiAAAA:8 a=SdGosrV6Qt3YffhYJa8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=gf-oSkQAjqHFJRp-GQfY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA1NSBTYWx0ZWRfX59eqxtuClIup
 gXzz80KxJSsy+TU/3CCeFiONsUZSSO0EkpZmF084JHNkCa9iy0utvJTmr0X9D3/lToLLsI8387t
 gJJp0qK4rg+dn0288FNdkXTa85SpeA73X7jcJX+wY2D0CJYKcf0auefqY0QNRPNWYi6hKod5cw9
 mgmcK2JmxONtDpS0QpzlHaasmUhi65RpOVjaRdtZSFiX87K4K6mxB73cFAH/7uu50Rgllz9hHAi
 j5inI7AI5KTbCCRk5LPza28weRC6b+ypRINiLOUm5SpL8RwHhp741s6toZd8Kn9SxTMWoR5LcQd
 IhptghNytb1qki+u4KdShkkR+Y6I2KLuUpiAwpSJL7D8pdsqDR7atFffCvmeH5O7o8oJvy1BIZz
 aUEBepLSBWOqK2jMj+SmuuiGMgvQ6+v75Bx8lXbLqeDPvWVGOogUncQE9vIm+HPpBXG7EbZv9gJ
 0Mr+24/8jFq2etPwBVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA1NSBTYWx0ZWRfX1viq7osfgPil
 dks/BdNdRUmkRrXwCurqxznm2QyZbbggvDVRq+BDiqORNg3A0kdj058UUtSmSuGiHkOohJpe0Et
 V/IvFSs4ZVARufQle/54qpW4gPTlKNM=
X-Proofpoint-ORIG-GUID: 8a-sR2CqjcRyqicwWIXGHLc6hqzzaiaN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_004709_014710_8BEFFFE9 
X-CRM114-Status: GOOD (  15.18  )
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

On 19/08/2026 01:09, Rob Herring (Arm) wrote:
> 
> On Mon, 17 Aug 2026 23:35:55 +1200, Jiaxing Hu wrote:
>> The RK3576 NPU has two cores of the same RKNN block the RK3588 binding
>> already describes, but it wires them up differently: two extra CBUF
>> clocks, two power domains per core, and a single reset instead of two.
>> It also has no NPU SRAM supply.
>>
>> Widen the property ranges to cover both, then pin each SoC back to its
>> own shape in allOf so nothing loosens for RK3588, and keep sram-supply
>> required for rockchip,rk3588-rknn-core only.
>>
>> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  .../npu/rockchip,rk3588-rknn-core.yaml        | 47 +++++++++++++++++--
>>  1 file changed, 44 insertions(+), 3 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml: Unresolvable reference: /schemas/input/qcom,spmi-haptics.yaml#
> 
> doc reference errors (make refcheckdocs):
> Documentation/translations/pt_BR/process/security-bugs.rst: :doc:`regular path submission </../../../process/submitting-patches>`
> Documentation/translations/zh_CN/how-to.rst: Documentation/translations/zh_CN/xxx.rst
> arch/arm/xen/enlighten.c: Documentation/devicetree/bindings/arm/xen.txt

Most likely false positive due to other things in the kernel broken.

But just in case - be sure you tested the bindings.

Best regards,
Krzysztof

