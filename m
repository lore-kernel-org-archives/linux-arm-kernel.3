Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24D5D3F083
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 16:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxpP64Jo3ISqOedMpw7nBc++9OWyKJZEeSyktb7Rxas=; b=STVNDVocEbZNpxXNKH1NDB9Lzz
	lQfFT6LICSw0Pem5CgOtLQevlrmXxRsTgL6dx/eQGXtwkxsSZZiGC6Re56G5bk7hzm9kSfHmMYKyB
	lo2C715Voi6g+AyQEY+cSBf7wdrnBfOUURKeRdzbbzsQW5Hw5kVMGJyYxlyI+YVBguItSBMuE4fPu
	48Ojf5HhmwFUi9tYmMT42hhWX6bhNsrQE1OCaNjHehjYb9QXF5UgenPbwYfUpWCAEyyHkIAqbfE4T
	hcdCyqPutt3TnedCD7VyFRottF3M/VA6UoUOrORUR8mZDOSJ7a28ei/Ahg5q/+TXDHyUORLpjH23Y
	TbHIlLOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8iK-0000000GQBQ-2aOK;
	Wed, 28 Jan 2026 16:48:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8iH-0000000GQAq-35Lu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 16:48:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFeHGf3246846
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 16:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NxpP64Jo3ISqOedMpw7nBc++9OWyKJZEeSyktb7Rxas=; b=VfBQTrRR71tT+QHJ
	ADITeT4Na/MRQ8jGTYFyk4wBz4qhQ1uPjOWFNfuIJc+1zybZ+LyxuA48b+LrayNg
	yfQFONJ/jTZYe86TeY938lhvW2Y9U2nZpGjDfQR9o0H6RH7kAG2neQUvm2GNDAot
	SRNYFTQXyn0iIoEFb1YcoGGqaDd+TEYtB1SDUU3O1JJAdMuw4EBfCatAoJJJNAiu
	k11tpG7lxBefCu0O6LqVvX9OTGh5a/zTr0pr22XajasEo3zJ5kBcjFKFIFxnRIdL
	3lljt1fadot5asEnnhqIODc8Z3n8oLDaRXNjozgNsCG5aNLs/y4hji4SxiSs9oDi
	j0OWxg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bydfk26xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 16:48:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35301003062so16319680a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 08:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769618895; x=1770223695; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NxpP64Jo3ISqOedMpw7nBc++9OWyKJZEeSyktb7Rxas=;
        b=cD+7fZt6H7BEpf4KVdiVdYQkci+ueC/V8o06GfWPAX6skj35fYH9tJr3TtekVRNBOX
         0o9L71cJ+AGjYSN2ig5O4/1+jaaTtHB/qkrt7dBK0FLsxQWrBN5YDb74jRGv1GogsC1Y
         nG2yzc4cJfLkGT1jJ9v/MiFJukGcnDu3kxNJQ2/OHNdJ8qMAouCQin/FCYAONmRDFcTr
         y901qrcDOvps2X2QwRWs/TTzdPJp1wK3JiB8YW9zWbj8A1QpunriwmBSI7bmWdIHTrTB
         yK7RCcrbuuvyelwDsEt2JGANHBgjW6VWdJhg1ucKc8819LCVzH2MTzYNmcPoC9FZVT3Q
         nwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769618895; x=1770223695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxpP64Jo3ISqOedMpw7nBc++9OWyKJZEeSyktb7Rxas=;
        b=M7pl7oGFKJtg3O1RdVJZFgDH4n/HzZQ2QyzATwjEeEn/BJ5yeeoVrxXDwjNp6AGF2S
         Oh9s3NLxsZ4VyhCKpxofj/wFJsgxkrbjGxcZFqae2tnvgq8ATVX7hfVsuv2fkGf2Aqvj
         rZ2Ed6vI9lfNOOsLS3YyIXkP+XqKjeD4/gNJDErt/9vyWSXVlN8x14uxkjNfhE7ktT9b
         8Vgp/o65Dz8EtCgS1zT0M6yovImp+x+SdI75huvyT48dMSqYEvfLSRod28d4HifLaKkl
         MDlJcvgOVZ55PG8cdEr978WthHQ9+ibVQgkUW4AI23haRl1jig6kfGgbaJdaciWX0DVQ
         e7pg==
X-Forwarded-Encrypted: i=1; AJvYcCV+e4o1uM8yRXMpo9xD1mkaUEBXIpOeavLUXqp7VRiix2LlFBvGmiTMlUUa8+6RCzhqn7IWZFShu30G7kWJfq0V@lists.infradead.org
X-Gm-Message-State: AOJu0YxgTwVTEk1fZqqOZ3pTUG9fUHkWYxJofp6S3i4NbKOWXiXZCEjL
	SbaFRM1JXakimIirZl7ttGx0C9bXLbwSpqNh4AF4vU6avXGh3pf+kmG7WfdQOgMAotCcRDx+TNY
	9vvQlHVH3HRenebV0etQjVjShGu7y+lpDETBief2LemhiVLClfVKmyQZ7Z63nulJbi+QKWzuHFe
	KNLQ==
X-Gm-Gg: AZuq6aI+JH68sJwa+wQOusuCb+u1kEIgOIfHJCAPECmWfcph/gLJac7hN6KiczraFs4
	/05e0gZkgoK2xqM/XdKN+LWlST6aMsEqx5zyCKboXXOyIiAMcMCIkjzOzXSR3ILutLNrRQd3iKj
	k6H4N1Qw1GP0fSzAKMaCN52Mnx91Muq0Fa5a+tyKfLjx1ocDXYMQlmve9bMbbotm95oRWCYst7b
	a9nWYGDUw8cJxxQUf0l0u1OuoIEts/6rRwqwfcuG0Wl4adkd8sqG5K8fNfkk3tJLphGJieQV5lX
	NC2cth4QYaTFNIhvdicoPAXD+CPi3TSok6Z0urTJGVLgA5ZI14XJsD7ZUQYkFYOZ+pQyKhYQTs4
	ekNT8bj9y+AMc1giEI5hET7/1dOB7ecD0DS0c6g==
X-Received: by 2002:a17:90b:50c8:b0:340:b908:9665 with SMTP id 98e67ed59e1d1-353fed94929mr5548599a91.37.1769618895109;
        Wed, 28 Jan 2026 08:48:15 -0800 (PST)
X-Received: by 2002:a17:90b:50c8:b0:340:b908:9665 with SMTP id 98e67ed59e1d1-353fed94929mr5548575a91.37.1769618894628;
        Wed, 28 Jan 2026 08:48:14 -0800 (PST)
Received: from [192.168.0.195] ([49.204.27.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f3cc7c6sm2995577a91.10.2026.01.28.08.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 08:48:14 -0800 (PST)
Message-ID: <7d1fe730-1858-4250-93b3-81108fc4a0ff@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 22:18:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: sm8750: Constify 'qcom_cc_desc' in SM8750
 camcc
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzOCBTYWx0ZWRfXzqIy+fcyUjZ3
 VwaB7Q/jf9LlnKG1pr2oBDeQEiQtLsUhzz6n/XgfMQOknn8W22cFxtAWiMDILhNFGOS1OCvsHXk
 BcH/9fzGmDJat0Rr+Jcc3Y/JnaDmoOdORL6VjSON8TyRJrkcp3J+eg9d716h5oqD1lmma10nICS
 kmwXg98ieCUwp+3GDus3p2i2vZVkm03Wt4uGKk+JuIUhSunRPhQqJ/IzZAJrtP5nwGO4atq0njX
 mRz//GShMGq5UKfCtSItvCjyi6LmHQSLvlg3gRcQeg5X25UpQqYkIalHw/pfhxG7A+z8zaV+E4q
 P5Pcy8ABMEXbt7ZdwyO3pfubhTr40+pleecl5u3RNuDFYAGvT/BISZlrQUfrVE1EAd8iOzRQFsG
 LEOEdZ8TtLAnwGZK1ljNtxkI1lva0OajiOYc/inJyoSPY0ZSUvy3fv1LunR+Q+Y/pnX6y08mmTy
 ZWzc42tnKoowvxWB8Zg==
X-Authority-Analysis: v=2.4 cv=XfWEDY55 c=1 sm=1 tr=0 ts=697a3dd0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=HFDkwTpxXVET2aFY52jhbw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LBVU2G7aICa-vlctToYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: rIkqinA7tWx9WzqUZEFgU62uk46bZIrv
X-Proofpoint-ORIG-GUID: rIkqinA7tWx9WzqUZEFgU62uk46bZIrv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_084817_899202_685E0716 
X-CRM114-Status: GOOD (  12.61  )
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


On 1/28/2026 9:13 PM, Krzysztof Kozlowski wrote:
> 'struct qcom_cc_desc' is passed to qcom_cc_map() and
> qcom_cc_really_probe() only as pointer to const, so make the memory
> const for safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/cambistmclkcc-sm8750.c | 2 +-
>  drivers/clk/qcom/camcc-sm8750.c         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


