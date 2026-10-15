Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A45CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3KAG7YDGqOBR2D8Zn+sxc9jTExC3PMBl+koNYY0A4Q=; b=h89cUTF7eyV/22oq1lSjHklN5H
	5UAhbQ6pdEK4W2Tpk7KrisO4pTLaLbtGu5B8ke69D4SvYtTB+/CTtyqhrHqkQNm06HLUMqlXC/wVu
	eO541sGzD706OCh7rNr9YF9rECCpRNrRF3wOKAhe28tz7hKGb4YAfmTKmeR+rbCEXSavXCDEh1DC2
	X/MgPVNiHQrkjVMXO0I/ipMr27R7ldjrWlM2520KcAG48sEk7BwHt8yTZLZysLQDwRK+5ZxjerVde
	J7uzA2g0Lwnt0noKPoG5iZO8AFYnm9BXA1aD5cPVu8xf6V6zi0seQqMMVAw6VGy8aEGgv6Jsy/ANb
	+Fo43I5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHI4l-0000000HKcR-2J6q;
	Thu, 15 Oct 2026 09:48:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHI4i-0000000HKaf-0zpE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:48:37 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jRH52662617
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m3KAG7YDGqOBR2D8Zn+sxc9jTExC3PMBl+koNYY0A4Q=; b=PYQ2LI9aj27depOZ
	qeweAXNBoA1cgejsFBYuNOalTEdQi3dhHBovBh4X5s67yygNgxEewsmXMGVxJwUJ
	xknMYhgUc0U7Sl1gvwmfoSE5dAGNJJuDkn+GDtdTh7un98iVQ654iXublSoIG3Sg
	f8/PFJQdbcAqm40e55coyKkeZVOK6GRgywvAcUQXGRBcvkXlnuBLxfiHkaHOdsz1
	wmwCWbaM+/YW1xU8d9Nq/H2ax0JHCw5413mffdzYSGHYgbysfsd7RDtp7UYVhM9L
	wNHziNWZ6WJxj9qi4gJBZqjatGt/8HL8VCV/ZVmkfN3Qytu6KTQuq4NVby86xgfi
	1zT+xg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda1ctg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:48:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90c4d46037eso13047846d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 02:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792057715; x=1792662515; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3KAG7YDGqOBR2D8Zn+sxc9jTExC3PMBl+koNYY0A4Q=;
        b=DnN7rC8gaVCrkULBZXWOmFKHO0ep8WqLS09+mJ+Yhx9PuxELbg9Rcg8Rjm6U6sqGBD
         tct/bQoRjSdGXcFNU+KIDwN9FOsJAsGSkTf2ft89fpcWNs3mAaFks6EO9UD0DiJo2T11
         nWzFEUY5nHqEdrzbhDfdlhVQxvf5Bx2dHtFBLd4QxfiKj2LaN/asEqIZJnhoZRB985QX
         wzk6X8p/26Wq6pFoQO8x2mxw8R93F8xibqP8XjBCAU2u4ma1eFvp5pAn6yPe9tLrGNi9
         GxNHVjkA23/FyrKyjFCkq2xX8uW6/q19LaUIBIbOgrxm0P1vpCIAldLxzb3GE0usrQ2l
         dRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057715; x=1792662515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m3KAG7YDGqOBR2D8Zn+sxc9jTExC3PMBl+koNYY0A4Q=;
        b=nbLYGDD9jLeLPAuhTq9+gXpP0RupBHhuMgbNv9LRQt/aNGkq7p3kuqcSzr30yieYM3
         GjdJDorzpCQ/DrUHafdEFSvhwL1nrRFBjLt1jAuBQBwRnOe9hbudk4DYdR4HkEi241U8
         seU4rXnaXxzsDW8f+SDf2P0Dr1wK25S1M6Yof6+WLtyObt6G/u1bA81Dg9BAxDUVZG/W
         wdSg8MAXCG80CCKAPhmvPVPX3oNQfdn4xKhbURIemNSP9XGuEJ+TDSZB4bkSdt39C9Yk
         5vcGIbAkdqPnGGB9BkvRB3vRjX9q61GIc2+aa4XWwpIn7TE4W1MPeIq9mLtbod3F6W6i
         JGIA==
X-Forwarded-Encrypted: i=1; AKwUvBwldeSyVCisbMafHTpNvr552V0tcGEq7FDN7odFgZ8I2UO6bOaX9eFJjFGr7lOOw1OHuNu0Ih3oOsE+UCV8edkg@lists.infradead.org
X-Gm-Message-State: AFq9FYKXaV0bl5emJKU4rgtYgys7znDvtxrrKpdblLveWfQ3MeFmMYZ9
	TCAgx5G/Igi+8/XVi7Om3IW7WyW0FfF7Q4vcL53pH4G+zvwoKSAQhqnnPcH02+P07ak2y9Ekde8
	iavWKQcFmL79+ybwtjs9I237/ucYDlYAoKOZWc1BJQ625tJEq2OSz++5bGNxZ8hw3/Q+Dt1R9Wh
	NAvQ==
X-Gm-Gg: AYBFou03xqRRM/KycQpqSx4/KeC7wJRl/+/og4x8MCHc+v25pCvxOO55ixxSImohbfA
	No+/L5NUSYMgrqc0k+fm/8TNdu2OrQJbkHifQkKDtlG9cyukC+Ye90PAfy63syJbtlI9IfYw6NF
	12/6+mVtbstdBIxz1T56UkkohHrPRfZaajchSjzR4Snx577XM9LUzEqdCNyHg7JVs0S71a9NUnl
	Ya3MphJndgLhvCv/ruRg5Jjqfe9G9h+FTjdKBt9hqFCO8ZozaYV8kLuzHE8CJF3Ogv4m841HZRE
	to08z1mPASHzGynI4oiWgPPERJ2w5b5OZsHgLHN7ydXWjnjk5x0O3bYuxulIYYheDpIJvBb0Q4y
	AKbv6ZqY90Ws+qRWOV7zwWQ==
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr356798161cf.0.1792057714755;
        Thu, 15 Oct 2026 02:48:34 -0700 (PDT)
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr356797601cf.0.1792057713501;
        Thu, 15 Oct 2026 02:48:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda622246sm102601366b.70.2026.10.15.02.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:48:32 -0700 (PDT)
Message-ID: <812d0272-db2a-4dd4-8e6c-e66145af2db5@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Use DP AltMode defines
To: Sebastian Reichel <sre@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-4-b657c9b6e4c3@collabora.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-4-b657c9b6e4c3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX2inmtwTF+PU3
 Bk85mk53ncWkdQRW4mV53i1DDNEN0i8TzAtU4R8Kh3SpYwTZVXOR7GwOJUHRT6sIatia72lbvL1
 H5IJz1E8M06Wh91djBhczHv6HPtrues=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0a173 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=C_hJBzH1aKR8969NbtkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: lhAEjePbcSKbf0k8kMYmwQZFqQXCF_UX
X-Proofpoint-ORIG-GUID: lhAEjePbcSKbf0k8kMYmwQZFqQXCF_UX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX873azS1bspGS
 2pLnbkukwKNM2bgkieV+smzpCISvp7o+ZJHMCna1jM3cNkkJM3Awrmx2URIQPkQDnpkD2hxYEoj
 rxNcLp1RKfIW7jMk7s6FHorfn98I1s+/TZ1VEJ2ChreUBydvGgnN9Ie6tCeIXA1JaQ2bLI9iplI
 nVjZpPptwks3vXfNV3/B6XJhpvxcvvuObvhJe9Vi87E9I9APPxJHjD9Zv1XX3keKYid8SuiJRJP
 +EQVLw7v5ujAwoGMOu+NzlN3sZcx80tx9eIVIwus/J87KDflsw8NNC4hZYCjqqwht2HrP6A8Rp5
 h8zdW+Ia3iaRdlbhXwxpPbaB64L2Vcla9thw1eEBfdeyrNkfmnK+EBJ08lmbWobVrM/uMJAayDs
 dR5D3dBoa9qe6E2454JWTFgUt/CCDUeP1VbhEs4kD49MID1A/j843AiTGHII442XGzKQmzsDz8X
 4APgNIiRYDZooD5gYyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_024836_385996_5EB46840 
X-CRM114-Status: GOOD (  12.13  )
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

On 10/14/26 11:31 PM, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

