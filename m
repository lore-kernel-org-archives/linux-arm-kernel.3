Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0661BCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 11:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5NQfF+ZUa2lq7+ZRulYI6A2NsYPt5ClBqhGGJ3BoYU=; b=SKz56totbKqQyQ7hEmKWCW+GVA
	A+HopfPBd+WI+wQgezvZhhp4a5LhFgmM6ueA8jmIiA+f5/+yjeINMYSzbHkJpNh6SwaWh9Mhy/cl0
	+pVxbBN7Mz5gFleswVSVRPBnZMdWhOKVbBC3y3pvNr9Qh9ojyrTxR7xf+wdBoNIbDVPOdH/K0tqvW
	xlalKY923jkf702D31HLMh4uZX8TOz9m8FF5/h+FSOaMgMNaOfrU38WJ/Q0V+PQ2aVX/G7M/YFFiu
	CLGQtjGsmoOq5/G8D0KwCfAD34jvl23g3+FW3liOf9rf9Wrri0jRia48Q69dvxf9jnuSMZdsmos/T
	VBHjwJJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRT9j-0000000H1XD-1T2K;
	Mon, 25 May 2026 11:07:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRT9g-0000000H1WZ-0v72
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 11:07:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7oFkM2801844
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/5NQfF+ZUa2lq7+ZRulYI6A2
	NsYPt5ClBqhGGJ3BoYU=; b=kGi2RGmBw1JUMOoGdEou6hvnPDbPITcGo5Mt/uJu
	CRBahgR1LKFIrw/sgAokxejEB+4OK7Wsu4gDmyxuLP3N++LW/9Wm2s0DAAX+xQGH
	qGXzjDboMFXCPairiM9W8UsJbigEQORV2O1mAD/s4lKSe8UXgXvmbxa07kE0xOXV
	Q68r6KwQkuZo17+sV8NdI+9ZQn7QcO226pjtD5ENpz6qKCahEgUQLTYzVienfz0H
	8nfGnQ8pAcoTEWijFzl9EYYXwwkPURTZ9R8nBnnWithSIdpZrHt0Am3BVeS12VSo
	w7ZZKSCNEF/cb0ZVSmLJrH5vyCOnq3KO8MclI+P/e7zHtw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb1kmps5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:07:30 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95ccfd9b58dso13516178241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 04:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707250; x=1780312050; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/5NQfF+ZUa2lq7+ZRulYI6A2NsYPt5ClBqhGGJ3BoYU=;
        b=EqTxDueAiawPCMUSZ1GxKBamQEKPRli9V73+fwsEyDbvrZDqkhjyzeVPGf9cBCM97I
         EDu+g0wZI58YjC3BOOl1u66Oama+3cht90KyFqe8s+LSR8ssxKq1bo2wZP7q/plefwoI
         ZuSGAhj1jaSNgIhPFJygeKJ8OEG8KcNWXcv0rswLzTLSpwwaYYWzoqhATKwghrn/6MDJ
         r77ohmfxITvxFgSjsqG4K4e4WDAE3Ek/ixn6MXPnUK62Sr6RL3jltcXIQyj/myjkyiRu
         6DRMqIQW0KlUd53LMJtLBIhT8SHkFqdjABLo8CRxYWAGveRJjWylQRibaKOqGeeVNd7F
         ZTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707250; x=1780312050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5NQfF+ZUa2lq7+ZRulYI6A2NsYPt5ClBqhGGJ3BoYU=;
        b=nOnlmUgTkERzVssLTCmZp0HGPaVowV1iq0Tz/0JfFIN399rdNdkyu3woN9SCRKSzv5
         G/Q45KdpapOTdINT0JV9rVZW+aKS9rGe/gZvgIbQjFq06AtZrJX7fu9rnn6uOTfZ4+X+
         FIu/uXzzruw+8bzq5W2kGrkOTC+HDE4ER1jSuJZsVLcJjLjn5kbP4OBUrAvsLEcmyQR9
         VfKblMV1EwstUpYjS1Hu+zk6fWYs8dSUzHibekWxxlxlz6cEbqyPg8TBwffRu72PUSzX
         JhyD6+v79owwx+PtT8TEi/5ZLGsGiAkrAWaqJzKXHYIaSvuQsNlobW0C6mSGSM0G+B8c
         YLUg==
X-Forwarded-Encrypted: i=1; AFNElJ9dYBDP8E0QQT505dsVamgbjfOeWcHhGkAFjte5y5H5Mm194w6pnkkUOu3skI+UfARq7y68uRCxYb8qICphWc9r@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr/1YC6pwnaAjz2cWlpn8VTkE0DN+3SNHGN/h2yeXzeap9uEdo
	extEmQXVXl2aKx1elN+wUWrJpe6Bimch2w+j2Pj+MJmGe/zNYhf3zP/Q9VkWIdiYr9mZ02dyW1x
	9qakgzicDEQov0tIwVMAM5x3JRaQBNHdArwQhnnYD3nCG3xeHlDOA8QmOT5osDgztQKp3BG2gfD
	7Nzg==
X-Gm-Gg: Acq92OERv02W3jBdsWyff+fZlm4ctHMHMHVxyGLtWBemwIGHxiABvptVTxGemXBOXxa
	6L76VA9QiV9ubQgCg9QvVV4uZRQr2KCGTqfe5yccAXmf3/3hfGMvWDYbwP9aLKvs7+X6qoOlcUV
	07P3j/IOqZ5srFFo/iWNQma7BdEkApnOvFvSM9ixRK9BjJssyv9B+ivSaQV50rsWCISqwR58Scp
	IQqT/S89UNuNI0vK8a5TDH9EDHcA09bHKuoXmILU3VYTCjtvg9YIytIJFgkYIG413P+Sii55iRf
	RJ6FDidFcmJu7gK4FbvFZkhbebYV3tbibli24GH67J+FrIVLHJ36WWrF++1m11stfbkpRoHdWkd
	4CADGWLjlFUcuHkhL2jxVkrHKlagM4psdwpSlXD57I/uvRQTTrb5BMt64Zgr4qC6MZ8LjvidC4Q
	w6mS18jAsXyAJLA6dB7/AiLC9kAOefI2RhefM=
X-Received: by 2002:a05:6102:688f:b0:631:81d6:e158 with SMTP id ada2fe7eead31-67c8fcbdbdfmr6780126137.27.1779707250293;
        Mon, 25 May 2026 04:07:30 -0700 (PDT)
X-Received: by 2002:a05:6102:688f:b0:631:81d6:e158 with SMTP id ada2fe7eead31-67c8fcbdbdfmr6780116137.27.1779707249899;
        Mon, 25 May 2026 04:07:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf96b3sm2600950e87.80.2026.05.25.04.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:07:28 -0700 (PDT)
Date: Mon, 25 May 2026 14:07:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
Subject: Re: [PATCH v5 4/7] clk: qcom: videocc: Add video clock controller
 driver for Eliza
Message-ID: <bnwy2srhmflo7drgavqonka7wrzbiwas5xjbabei2b6wfzci2b@62pkd4dr23j5>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-4-a1d125619a5a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-4-a1d125619a5a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExMyBTYWx0ZWRfX+ioR7iUy8nBu
 VsKBRDZkbEGDwcnGJL08IyzbN4A5Fa5V5xItXszhYqYRKxF/jUlLpwCDdpW45uLZPKBFZrX5tFy
 vAI1TuDCsFS/LXrAmyK89vl7XBvRnLGWf2eRXUhTuk+1KqHl4ntLAUo6t5rVbjq3oSp8u1qXr1g
 ceUC7tocWa4aeuoj6HEZrlGrJEnvxRbK1N7otK+0WiFWZ7+eVlGF8G2ysFY7CPcBFKp9fMh1uF1
 7knJWfFZxdq3R+LOtd0YjEbM8rbrmjo5B17rZo0LB6adNEaSOyYmh7auYd+nDu/2HWRC7X8wb2A
 xKfLnkmnZpzktfXYm2H8Qm0k11OvetMZEJFNKOQpgXrdEqcW4QahB2Sm60k/GYYhs3DK4r8v8In
 ULD0FZm+IJQyzHpWhFPkMYgfgFoEKeMoDPOmyelELU2bS6GH7NJhhnaFvQR73eAgNLOp9fjzSFM
 GZ1rnjPrYRflaCx9cAg==
X-Proofpoint-ORIG-GUID: 7Ak_j7pjoPiaWyvMONGm55ae21hZVjAM
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a142d72 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=d7ClhsmVZ3m4v3ji_18A:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: 7Ak_j7pjoPiaWyvMONGm55ae21hZVjAM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_040732_377710_37CD978F 
X-CRM114-Status: GOOD (  15.49  )
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

On Mon, May 25, 2026 at 04:16:06PM +0530, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Eliza platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |  10 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/videocc-eliza.c | 404 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 415 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

