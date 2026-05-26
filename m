Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC43CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 11:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tG1ClUqOtr5zzIhXyFmFyKGVf7CnvLornGkRIGN6mg=; b=VTweujipR0YyYE/nVAIhfnCIPl
	vkow4pS4iYB7muzG04jECCc5dIZ7/IUA+Ps0WSecI0W+hbmRrNGdb03vt7jjM+nvvfIHx4iLXxWWf
	HIv0GbvQtwrXAk6owJ7d0TQZ42Pn+ecXQSoVqH0uqnitPsEZLd7QmqqjzsVCVNCeo/kzjLqjaZaqY
	k+ggAYvor17Vss3rAWs6HmT+4IMMxW73Figd0zje+QPkYvvh9CSJKsHJ9ayzpnJ42g0h7p9buZIhp
	O3qpfSMwJr/kglpjQc9zcsVVGu800fkGMAj2lGYibsHbE9f7mZiksLq6oQxM9/PuH7ZI5mVpd2/P0
	irRcIhzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRq9D-00000001pIq-0SEL;
	Tue, 26 May 2026 11:40:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRq9A-00000001pI4-1V8J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 11:40:33 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QBaoFm1763300
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 11:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+tG1ClUqOtr5zzIhXyFmFyKGVf7CnvLornGkRIGN6mg=; b=lus2Hg6hWVD/Lvw0
	a/WSuZPrzBJ1wdgjRoztvLzLVSbxIO0b5jdcKAQ3qMz0pKfwnKazFXX+NAv5Uh1J
	GO9Kb+AS1ZSwJglJxzx8xs7SGKmuU2Er9bBh2OrrOTkOT5vZoKzPTGooa87Z7F/E
	Drg2lW5jZdbOkPoeeXTChzTpQrYlsyAwQ+DbBNBLlfNM8f/rFiPJ39n38PJpHh8v
	Ot2p5LuZlmdMov5yDtAu+nI0zGC4xAxL4SpJGRQTxEIXxSlYMArsWioiUFAOLS5O
	J03td3n++mRkTQaYB9Jd5+rpaa1fJtL38M7g4epaQZT51I9uUWe1HPJ5CLSGqzXh
	JilIwg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vghbqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 11:40:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso6662577b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 04:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779795630; x=1780400430; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+tG1ClUqOtr5zzIhXyFmFyKGVf7CnvLornGkRIGN6mg=;
        b=e5Nc1qjTcqS8oew7fbY4yaLbL3RewdnLwkncJQZ42HEP/pi9tjwwyJeEF0T41e+6S7
         ocwW5OML2t+XoGyq7QPUuL/7Jw9gcjqbkhNigwhtFniJzml85iYxRCVJCXWVrNG8+uF9
         FdkLBKXHrdFMuMOP63rtg9GJ9HuSjr8n6YF1K86O5QSUcod/6y3UnVpynOFHZX3LdG8A
         M7Frzsgv1ka2Q1QyHGZiwglDrKTY5BI3l4PJ85oNgfLho58uXB1K2g/pntojfv2ELNd+
         E+CR6FG7pQSohlAsgO7uTcW5mW2wg3gEaU23BdhyqbVsuvw52R3bMxaQXl+J9om1wGsa
         Dh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795630; x=1780400430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tG1ClUqOtr5zzIhXyFmFyKGVf7CnvLornGkRIGN6mg=;
        b=Wo9/lf5umUwEhxgHFjCyuoMBohTqT265EqVCqsjd/ccnzNKi3BDntnCsk+V5n/3eAX
         +Z73Z9Brt5yZxMadywPY8HlEE0gEuNX52d0k1Cidnour18+C9GkstYWkLRePTnxZ5dOu
         bILjMG4UulUEPlPzlYdXL8/3+9EmJqzsxry54pR5WcXfwVGAU1ZlLRdXXEL4nFQBTq6k
         17EqSvZ3xgClwZ4n1qLtBP4r1U48YO5fVf1+Ghh1ZfLuLhjEHVX0j2qXKmTqXkCYav2o
         /JuASH4F60a/G6xwZzvGKDoBD8EMB/FavGut8IaMfoG+8Psgx+pmflID2l5FAtbuD8aH
         9n8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/GNbrYVNYK7sqb5K+GLp00Kb+3gwayisR3mIl58Cn7ckDqddhC83/oJ4PVCn31BfBuPiKSCabHTuOwziBJvtno@lists.infradead.org
X-Gm-Message-State: AOJu0YyIiYBOTGmJISePkDccyHxvrCf1EMcnq1IYCWyiPvQOaen+f6CS
	5lCRYz2b0KyUEthPp2RMyjkSVTIJphLSNbvIyTGpgxjP/3JsaUn2M1VZBR9PNJZVIYIe24z6byy
	2fkt1SWUwpuMs2FSn3Z7bzBmK2AsMPIamGelWa38qn/DW/Cezd4jrfInx0ezJu7anbBd6oSabqf
	65aw==
X-Gm-Gg: Acq92OHGWthvb3/JjyFTVRDyIWZqsVmRG1haxzNVj2zWQjJIk41hwHpnwfqoQXTwWvy
	Qs5FsRsXVFh4BskOXrbWksDZGw7S+8oLaev5K16MitWGZ1dXJ4MGFogP/811rB0Rg2wrknvM73G
	8srSkplmwq6ntu/C6tTTkPdxa1IE/egfeGlcU/hJI87ihRU9x1hnhjesIQHkK7EVgZXTulAkbJK
	TGcoKBCUuDWa2LTqKOClMya7Mec8JjXraIhZvidEwbG9DFluLNny9ITYeUX2uFDv0mk9SEmlvX6
	ICGiNxnIK9u58/m5Szcon/TilVXsegYWW2Vt/zI4GBHCyNJEKv/d/RtKAVF0doSqczOkgFtvVao
	wRTUVkxXOlYe+zX/GTmtPUIgYSqPVtecqTn85Ib4TvbkRE1pX
X-Received: by 2002:a05:6a00:2384:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8415f0f02cbmr16834767b3a.10.1779795630311;
        Tue, 26 May 2026 04:40:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:2384:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8415f0f02cbmr16834735b3a.10.1779795629827;
        Tue, 26 May 2026 04:40:29 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164b1b3d2sm13869414b3a.26.2026.05.26.04.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:40:29 -0700 (PDT)
Message-ID: <59167c7f-c758-4939-b760-b6de78c22359@oss.qualcomm.com>
Date: Tue, 26 May 2026 17:10:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <27l6r6gp6zpddgkxne7jasjxamy4dmdkwg3xyp6hrmdbtk7mxj@jxsgeq4yvfhh>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <27l6r6gp6zpddgkxne7jasjxamy4dmdkwg3xyp6hrmdbtk7mxj@jxsgeq4yvfhh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a1586af cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=SSzA4h9mN1o_gDQ-MaQA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: bzz7-sm1y0Uy10T5eHj6Io03XSpNbLqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEwMSBTYWx0ZWRfX33S4FHUzKw7Z
 H9MPVdk27ElqHkL1WElPsLCwjdoaomidDfyy6rxkFVxBs/hcQiwe4tQfgJx70N4Noa3V080EPJl
 IJ5mZ3HLBAHqy1zq6JeIm5KJITsKRTTnOUbY/cBnsfzgrmwwV8gYnhJx2rK1L14X3bud7/CS0AG
 p5MFJYIUhK8GdKpMXI4lPdxs9iNBiFuZA77Rl8ENnPFAT+FQHA+TCS3QLTnOFqiRU9m6vm+y3En
 fcHfSIY1EQeQJItY99HAsIQrA2iptN3nb25MzaudQDtznPkQ4OYN5UxK6TMrT29MPu8tiwL9Aes
 l8pOLMfY6Syq6VS+w/is/O3HXMXFoMnTOIthBKACbELVDe2vKWymUDMhTz2KAG+K07xK8UC/654
 9xSC+qbf6HJ11UfiKU41AJbtbWDr8eUVrQOXH8c0i7Zti2PHIv7DaQw7EpucV90UlCr1IAK92j5
 91XaQVttCDLXAyIFG5g==
X-Proofpoint-GUID: bzz7-sm1y0Uy10T5eHj6Io03XSpNbLqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_044032_516529_0E116950 
X-CRM114-Status: GOOD (  11.91  )
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



On 5/25/2026 4:43 PM, Dmitry Baryshkov wrote:
>> The patches have been tested on Qualcomm Eliza MTP board.
>>
>> Changes in v5:
>> - Taken care of comments from v3, v4.
> Which comments? Please be more specific in changelogics.

Sorry, my bad, it was the 'sashiko-bot' comments.

-- 
Thanks,
Taniya Das


