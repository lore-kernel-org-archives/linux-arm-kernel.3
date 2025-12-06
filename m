Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5394D3ABF5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 04:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3P8RhC3cRbNOP0rl/IbzhEB9y9tPULpHaaL6+mDsxHs=; b=LHz6Ws5aaOr7P2advknZ8wnhLm
	VZ18SaEMIPILu0fgsBgfDOQ+RKqmtud1/lH1QNNBSbbFLnQG9+ey/DvRsl1GWoOkSFZQDHoU7etMG
	TDvPaGiIqKbD7B48LqbbAYCYWyvbRUL/uvMTw/th3hGVvUeJSZjC2SpQrpzzhxYy7jS2tqhW6PBov
	wq65lRaFDV0nnuhCzYkwvlGQz6/1Dn5uWopyQ+hjPwzGSLQqxb8O1hbDJkYgBB1rANIkviZeYTPo8
	coSFH7qXY2MFKxUQfp3Xm0kuGIVQmU+ppKZDpU82rbdG+jezab5gt7T72sa+Cjmo/wNIb4p/RlOZ1
	jzaLUwIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRjVP-0000000Aa1N-41iT;
	Sat, 06 Dec 2025 04:02:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRjVN-0000000Aa0u-1ztS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 04:02:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBKoT4177194
	for <linux-arm-kernel@lists.infradead.org>; Sat, 6 Dec 2025 04:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3P8RhC3cRbNOP0rl/IbzhEB9
	y9tPULpHaaL6+mDsxHs=; b=QvNBqC0KzNzVPRU95PJPr/+qVS+YGanOuwTiCMlh
	oNdhNbqndg49Ir+MILtlOUzbpIhlCMEcU2YYd7MUtwRzPz0N3yYfFeefna6JWCHn
	kRbr0KCY13Ry0ypW1ZfqBIwq/DQQt4DmbbRUBCd89MrlxnS2LoLRGQwE9rCI7+l1
	MohM4M3qnwoV+m+Tu6eZl8nKCDjmQ09XDy6kFelvGxdcWWtLhLP66zbkVKu7L8FR
	AoNIbJfm84kO8y9a63fiZi/pqFVs1aw973SwL+cmPgXnrL8swf1HLDkYo8lN7mul
	3/nKlOUpjyyA8lBo9gimL9fhB+0MUymrSqQYYCtwQD5jYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auwm5af07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Dec 2025 04:02:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b30b6abb7bso569746985a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 20:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764993764; x=1765598564; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3P8RhC3cRbNOP0rl/IbzhEB9y9tPULpHaaL6+mDsxHs=;
        b=G1NAJ3TKq2ZvVMZse/v7vjw409r4cO1vte0lKTPrmNbCtigDS8S8WIqdWTYAD4oUXy
         DLQ/JXCIAXwjzAY6HxdslsLOagxgUTXZTf9k92auAFXnyM1oBcrFIK5XqRkPPQPOjp7U
         FZXIXyZw8l1IeOsiQBMX9hsitHreAqUPOgg2V/mnXoNp4Va4Dmg9uRGEUO+76bBJRfR4
         N6UFNaCW7P2UMcKLfHm3stYxqae3X89J6iFgLAehaZqH70BOJ/0YGNKMK2bIrwLPMWsI
         +IjZ2Wm4QDJTHVhlIOIIujcnBpjFTjgnVbJXNpLUL+EymTmucJK7bF+KvAfSUuIsdF/y
         KF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764993764; x=1765598564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3P8RhC3cRbNOP0rl/IbzhEB9y9tPULpHaaL6+mDsxHs=;
        b=dgS8oYutKB4+D37s4B9cpWUs8eI5SAYia7r0Yq5hy9IaZq7ShPxRpPXNNXQ9HLHJRi
         KI2bBoxwdHRm1zXFNAKRTpVqcP8U9crhUqCfvGSHyZ7M+SOEmLkNIVMjzBld6G8xydCd
         QVrNssPTXY9BfTzLiJNKVdBk2/fDVgDsJwyNjV8/Jhzrw7RwMkvO/zKW3IsIQHMYA+Uu
         oMogC6cv+ffphC39HhBTEud1GhG8IBbOCbSBqGMQOT0h4awvqgseaVu9PUQjp5o/cMYP
         JIxOpIg37l++PjgObVuydtCb/NgMPiR7bogRR1p063llpG58lx7TbLYmCBbB3oOLECd8
         w6rg==
X-Forwarded-Encrypted: i=1; AJvYcCVEgZRcC5mkDK3ad/g1FxAHuNkAiQKBRc/K/qaSQk0q3Gdy2NgUwES0YePf/brzometk0rGdvm7mhRYZoGcbndg@lists.infradead.org
X-Gm-Message-State: AOJu0YwYJxAuy+Zx1Fmutspi1iQzsbokHi6h16OVSF/70Nqe0ykO+EUT
	JAKqG4k4acGFreA+hMCzr5XUEzDWPVugX+VulMBFaLgx9aF2zndJqTyMq66NjqdD5n5bi9FNKs6
	lLzg1F6vMbeyZ5ChZiRIV+uABf27Wk5JiRjbXrugaek8D4tCcDJ29QUMrp4mvSfN6zoMmGODeaS
	yLkg==
X-Gm-Gg: ASbGncvABHjMxV8VbjZ/3hnDKsevyKaj6QlaWDi216e5ruaG7n6HufUhBOI75b/Y6UY
	0foJm/42cuRKYt00PA+8yY/sZRDDAXiJ20XvSan39TLQwykAgaEKItyvNnBg3UsgcArAAnZx7ns
	OCcje4IRjxqTEJn3d4ao60Z56pWkP8eCXtgof2/b+x5+xuYJjLN2Y5uX6RrS9G9S6xrpIA9Te9m
	WFPlgQCmxusN1dgTyNN0ih2VBCctyGqwVu5JE6nGhqYLbEmEm7a7iNwCdBpwFlc8vbeYQiI/RDQ
	seqVcmqHVdYzLoQkHlItpRoa2EzZMtjn45CyDxwEZX3dtCZzl0Lyg/xcASd+rm+gSrvKj7CJObm
	jq8parY+IkAz/taUGcZDDZYVJXgonWQK02kvZJSVbmfdzCQ8mdMLWz/9TaqeYpypCeah1yD+bxY
	1ZXnrAaNSxLjvYS6qtyapUclA=
X-Received: by 2002:a05:620a:4726:b0:8b2:7777:f662 with SMTP id af79cd13be357-8b6a2589ac8mr201823685a.64.1764993763769;
        Fri, 05 Dec 2025 20:02:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtdPTmuravVRhlZz8xV1WEVwbBUkAkyhjwHvpt7kRJcvSdxAlEvy5G47mBX7coj0tQB1w6+A==
X-Received: by 2002:a05:620a:4726:b0:8b2:7777:f662 with SMTP id af79cd13be357-8b6a2589ac8mr201821985a.64.1764993763272;
        Fri, 05 Dec 2025 20:02:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e6fe6bb67sm19293071fa.6.2025.12.05.20.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 20:02:41 -0800 (PST)
Date: Sat, 6 Dec 2025 06:02:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] clk: qcom: camcc: Add camera clock controller driver
 for SM8750 SoC
Message-ID: <mcvwms5logao4sz2o4h5yfyi7kloj7pkx5qzq7byvtcmhbymnk@ynegs32kkxyw>
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
 <20251202-sm8750_camcc-v1-3-b3f7ef6723f1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202-sm8750_camcc-v1-3-b3f7ef6723f1@oss.qualcomm.com>
X-Proofpoint-GUID: I44buUc2U2HVcUnUJY7w2FlYXxVr9LQx
X-Proofpoint-ORIG-GUID: I44buUc2U2HVcUnUJY7w2FlYXxVr9LQx
X-Authority-Analysis: v=2.4 cv=XeOEDY55 c=1 sm=1 tr=0 ts=6933aae4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_j3VNrtD_Kzz85i8SO4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyOSBTYWx0ZWRfX7CHvWCaKwrQI
 fInG+WzYF7QfQ0shsgPtBlsALMjQa5WbnDnmz01bGFzxPA2XzVgbExuxMETA6WI+70H8HhWlAWt
 jY5Cg7pYodMQYMtfKEsoIV1rhKrYJPMBjPR/wx/GxvPbGcKV5XfrJEXkwqLeDmO6JL5fuKNTule
 MohsnzWYBwcBiYn867hhdctEGHnkQKA6kIptbsUYICZ3J4qzvL6jmFtw1+ET28nOB+z2bI8kA1u
 ThcgxMcpRNTHn6Tj/SqZ8BD0Jk1m/5HsMgGZZpSkIu4lQhuXpnfzHv3xhVLJqWlvDYMH10E4yfX
 hoIw+4sPaNW+TBm3o9ecOzKBpiqOFt6XnTOHLlvL3ZL2QT0qGmqvRnnVabGaqOQ3tb+IN1hXRP/
 +mPdjVOKFNR+W7S+f8rheDdF3aH36A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_200245_542706_CE5AAD1E 
X-CRM114-Status: GOOD (  16.03  )
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

On Tue, Dec 02, 2025 at 03:56:27PM +0530, Taniya Das wrote:
> Add support for the Camera Clock Controller (CAMCC) on the SM8750
> platform.
> 
> The CAMCC block on SM8750 includes both the primary camera clock
> controller and the Camera BIST clock controller, which provides the
> functional MCLK required for camera operations.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig                |   10 +
>  drivers/clk/qcom/Makefile               |    1 +
>  drivers/clk/qcom/cambistmclkcc-sm8750.c |  454 ++++++
>  drivers/clk/qcom/camcc-sm8750.c         | 2710 +++++++++++++++++++++++++++++++
>  4 files changed, 3175 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

