Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4490C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 06:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71aN4LEqM1HR5LADsp5LGzC49FSOyczsf79U48EinQQ=; b=L2ld4xsjDFQhhYE/XuH+zMahF1
	hD8Feu7voTQDX3jqO9khjuvllKRUR3qI8f5qhv/Auid7958oJRU1Ap7WmekF81IPrVUzzM/1pI1O8
	qRmnzk3kXAGbIHA3howxOXBZTYZ1akJDqSyPUpGFi2umzNZ2dTkI+YiDOwGVDhoMgFB8TrA0Npp20
	bbGucldM4K8vdF9ilP5Xg+f8J5JYhJmbnHJk/WwAbLHs7e+33Uvk3HOG3nWELQUQZZwgMlDkqXudp
	SB+Lvervbt2joL+sqesMmmiOA0pLIvQIItcMVZo8EkRwrkD7RA+kuM+/XPn2ZSj1ZdB2BCPcKJqkk
	pZaWdCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgVe-0000000BsFQ-0hYa;
	Fri, 31 Jul 2026 06:14:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgVa-0000000BsEt-1Zj6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 06:14:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5HBuS3235147
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 06:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71aN4LEqM1HR5LADsp5LGzC49FSOyczsf79U48EinQQ=; b=fuhCPkWiq6znrEi8
	gO4rczS0y/g9bmb7dgh3NDLfYz/8F2YgT3hv97u/2QtrTYrwBpuCU6+6F/L9tF2V
	Loc9Pj/a/R0fJfoDlLqs/S2JooRp47OuaBs7faAixf46LlIJNIQdubNGUVbldMm5
	HawfSG2nGA9HXGP8eMJOERXttxEbyBgT23eq7VNx8mEU2Q12/AN1HeLbkpUtXMTx
	kCjpCN6vJq80MWMUXjghoXQLwp55AvhqG4VS2YLtz3d5zmlXyLoBjCNTQjs6VKYC
	e7qoMKoADmFTeWXO6kwQGrkEnz00emHOVUTk38kXP+fSLrlB0MU3cetuyWYkHuLr
	X4WKQQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frne506ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 06:14:13 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-80ee3cb097eso20606127b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 23:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785478453; x=1786083253; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=71aN4LEqM1HR5LADsp5LGzC49FSOyczsf79U48EinQQ=;
        b=Pl5N26u8Jd/ByKLaLsHP+bI2MTTzxwn1EFc9gXeTOYoM2Hk6lUtodxgSmOdeKY/Kw5
         TzcGE4gYeGRbCOYZRSiiXsI+354NM/oHHMq5HQAWJSErcJiNAqDhwSmRj9lZ3BGYgLK5
         /NR6gEl+poTLW5faQ88fHHb1OEWoizHvrAWFyu4hBACgV0xqY8POoVyD4on6hPl/gxeX
         ST8wRfBRLNieob14cKlI7xnx/ZvMEC+2oiWTxPqQysIHtkyCmjjTUs4dDMH3o4enuaIX
         efscMAZKXbRId2Xbym4ZgCP7NYsmnHm6PJKhLq4Be2P9MZtQhUXlh2Moe/rDtME+LumA
         rdrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785478453; x=1786083253;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71aN4LEqM1HR5LADsp5LGzC49FSOyczsf79U48EinQQ=;
        b=b2wHAcUlKhvy88PmMbRku6AoY75km0iYx8iCJbKIqBKbSFt9qsoY/zUk3yxu5EC5DU
         m8p3wVFTsbixIZ3GjtnBvkTwxBtHlML6m2hILYV9B+byEVqfuCE/GL4VHmmyztFaPnIv
         DL/vGZ3P97JX+CLr9koFUVfXvaJMBEq9wthW5CH7jjmR19gcRtp2kd4jgdEyk91fPyZF
         L6H8xDgMh/tZyiDWZclTGiSBAG12RUFgdm6XQHg3fu+Ohv61Qlet6ESIN+kVtKVSvHCd
         LLe6ZTACmzGNWJsCG/1IekJjzcXvYJtXpMvEh7yrBtbhgve6ZvJZbg1svOMQfTanHB4P
         r0Ww==
X-Forwarded-Encrypted: i=1; AHgh+RpVIkIyAlepplw6Wfvdiq6vysQWKDpXssK0qvhK0i4wgzMURBAlNeZOmPiavHZ1M4pePty2fxZW2VtcGRn8pBap@lists.infradead.org
X-Gm-Message-State: AOJu0YyB4IjHBYToP3dXjpxK/yhTq1ja/wzqNzmzew03HlEfLkUlOAZ+
	aoXhSgF/DC9M8jdvxtZX3pMMfGDSlaUYEfOuiDfthOMiJplUmqmDfQFOHCnaaH4JAkAjkzEEMXL
	c73mTf3FEH0FTn2Zzd0sFrXivWKOeLOQ/UGbN6RlLyiaYy80Bz/HgXb2ID4UaAwaGW/ltjAnvIS
	FQ4g==
X-Gm-Gg: AR+sD10JtMxTR5JCIwadw28JORibZM2K1OA+W/qI0LEy1G2Me/klUZUbS4PvYnHaX1q
	6gA/ZXHQ1RrJDf+MbzYw659NBXn5FXNs8yfKUF/Az0P/KrrBiHV6sjbi6o/DW9Dn2kUHoK3LJbg
	SwBX0SJGH4sJTguwcW3/p7LSevv1vo7miGTqq4Y2yEDagWN5KB5zn761bi+2gTqQSeJdF5MH1vB
	XrdR8E/zUtru+yThW3XmH3OL//4Eoe8b/aD+uYSrTHZhZ1Rr9ICjNkv20ySZBbOCck69fi41ZA4
	2/LXueZ9UQnhhciyZ+srBdWHIm9PcbFTQR4MRq7LHaggIFVns5LDUmri0xXcO/6IJ5AqqGtvsvJ
	05aHM40H2BbPXzXIcrtIqdyI1i2BuKA==
X-Received: by 2002:a05:622a:2282:b0:51c:1a17:eba0 with SMTP id d75a77b69052e-52b4afdfb40mr8161341cf.2.1785478111036;
        Thu, 30 Jul 2026 23:08:31 -0700 (PDT)
X-Received: by 2002:a05:622a:2282:b0:51c:1a17:eba0 with SMTP id d75a77b69052e-52b4afdfb40mr8160821cf.2.1785478110472;
        Thu, 30 Jul 2026 23:08:30 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd45202c4sm24033166b.48.2026.07.30.23.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:08:29 -0700 (PDT)
Message-ID: <d986debd-fc19-4e42-9470-79b0da2fcd2d@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 08:08:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
To: Brian Masney <bmasney@redhat.com>, Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
        cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
        cy.huang@realtek.com, stanley_chang@realtek.com
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-2-eleanor.lin@realtek.com>
 <amt7w327inR5rZrU@redhat.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <amt7w327inR5rZrU@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ftzsol4f c=1 sm=1 tr=0 ts=6a6c3d35 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=n9Sqmae0AAAA:8 a=VwQbUJbxAAAA:8 a=svCZIhgI9wkr-lvpYL8A:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MSBTYWx0ZWRfX0/BOieF3cnu/
 Bk1uSPqNAvQiomzUCBC4JlgQO2zSKP6TPPW5lqnj1KRqJjp5TadbCmQneAsNQ5V17w4oWZ5eH5/
 ikgkficZyEWVF0Qwxt5ITCZq2BCfJXg=
X-Proofpoint-ORIG-GUID: 8mn0CtSk21lL1yLy3w5NV4Uty_BAXYB5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MSBTYWx0ZWRfX+1dFEf4l7+Bl
 PIyr3Ejz4rHRoXLVcyNtgJmj4p6zNxWAdqKYW1sSifbagGdoPvf/Qz69lUhj4G5wS6ohD9bH9+7
 eX17yT94Ybo/HNgppELjqZlTWozTumiLIqns4JWQdNKlFkTtMm2yw+rxqPqUUXNt2P2npO54TgO
 uHBN5Bj9T7Q/UrNAFoxtGZ7ZL/3BgIF0IHbYjGtJSQe54quxb2LbLpVNckqEkLdpVlMXpPbt2q+
 Ueg7oZKR54+/Mb60HMP5AXRhqqcIzdUFSMGT71IgAJver1IW3+zJq82EYn8UEV5DxWd1iY/FjGw
 gIXhj2lgX9d/xd2BHPs7NfjaxfbQaiXysRng1AK8HCFg2bYxt/d9pOMD3HCFpVbC8f9WRr+zaFw
 FHuPSyQvHz+fTXaJ00dU0jaCF3M5L1HdMLw69kZv7kkH0yXg9+UFYmfmkfcgd09kSLhWWvBWVxC
 fVjIsR952V4v5LAhTpg==
X-Proofpoint-GUID: 8mn0CtSk21lL1yLy3w5NV4Uty_BAXYB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_231414_409360_FCB716EC 
X-CRM114-Status: GOOD (  14.56  )
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

On 30/07/2026 18:28, Brian Masney wrote:
> Hi Yu-Chun,
> 
> On Tue, Jul 28, 2026 at 10:27:56PM +0800, Yu-Chun Lin wrote:
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 2f9472c1a090..65dd2be63903 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22741,6 +22741,16 @@ S:	Maintained
>>  F:	Documentation/devicetree/bindings/net/dsa/realtek.yaml
>>  F:	drivers/net/dsa/realtek/*
>>  
>> +REALTEK SOC CLOCK AND RESET DRIVERS
>> +M:	Cheng-Yu Lee <cylee12@realtek.com>
>> +M:	Yu-Chun Lin <eleanor.lin@realtek.com>
>> +L:	devicetree@vger.kernel.org
> 
> You add drivers to this list later in the series.
> devicetree@vger.kernel.org shouldn't be listed here so that the list is
> not CCed for just driver changes. It'll get picked up if someone is
> making changes to the dt-bindings via the "OPEN FIRMWARE AND FLATTENED
> DEVICE TREE BINDINGS" entry.

Both lists should not be listed. Both are pointless, but of course DT
list is plain wrong.

Best regards,
Krzysztof

