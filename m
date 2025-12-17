Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81DAD6554E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 11:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8s7nifhnhw8fss9dv1I/1lokXsEB5LjDf/QVe/Sm2fw=; b=vzhip/Ab7OM4bhgSGQH1TrE462
	Slq6pi8BVskl8irhwa/s6WibKaad4DWQli8W8mAoh4Jgn9Xt/gS5qxWCCed3/I9GLBrAwfe59c3uE
	MZqZEBBQebSMigjKuuKMGqFarXPGhWwkhMFti/nB4H+MBEheDT8rMjd0EbF7E5sR7liuNxg84mY0J
	cVgI+a4auITVNn0Yvu4Ut3+jPbMb/4bqR4OA169GFX14bmcgKHGoNIf2I4Hs3jtvkWr8zjJ3AzitG
	jwF/hOpDAZH1JXQDo0D7q9DE8+j9q4Jbo4JqWHPjBTtBSoXoGNfgKby/LcCc+Ep51zcbxYNbIFb8+
	6SrXJBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpSs-00000006hJ1-2rxn;
	Wed, 17 Dec 2025 11:13:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpSp-00000006hIa-1ICS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 11:13:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH9fgGD870095
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 11:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8s7nifhnhw8fss9dv1I/1lokXsEB5LjDf/QVe/Sm2fw=; b=HrcMJqsMrwrO9KL1
	YBJgJBQWnXdifnAdSKhpQVp1GKtb1CoyIhK2+gMsDXz7EWV+KtoaRgWjF9ZSvcev
	TVBOHwxn/FV3SqEV2pFNuJE1sZLFSOZs7I6NDZENxL0WE0M9TjUQXXrpDA1hI2ma
	7axN9i2Z1/0KIUj9DHQcoMyGfM66fwA27Cx12ML3zggHCljoDdc/rRJ87QTGPswX
	udDqWuxbIBHfbv8mLsIoa1r5Rt1akb1B+7964LkY9AUnCOA/Ej43X/mF0KYBIJAe
	r1hDK7ka+QyweH3liPTBuyv692pDdDDRZ0Y+WpuUkRUKAopIeMGSHunX9vqLYC7a
	8wsJxQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fj1t6jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 11:13:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed9122dce9so2789241cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 03:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765969982; x=1766574782; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8s7nifhnhw8fss9dv1I/1lokXsEB5LjDf/QVe/Sm2fw=;
        b=j4OYDL90ZBjbYpcoIIuyL9RiB1K/5Pk/80fl4gOvPlN3vRaT0SojJSw0ZZFVXvSIc7
         +Uv84SdeIf1A8BIRrEUjhY7hIMctLhbUHVBB+vbZRB9jXjzKnI0qtKP3NBOjrv9ViQg8
         NDZMRt/X3WC35v6FjcOnnN5vN6Rj3/biXtP235wnjem+9x4QwVoFmXiWREpcyMhJ+gTg
         hCTOIWEyeH/i/msl1TNACd3t1gRLEkYyznYleA8zP7NGwCzghM3Zd29Xv6Pq7FykMMdv
         vyPmEkQjWJWzDuBP7Uq1Wz8M7NwpHYf6DZOQSwhVUL500gEVUcl8eKL2HoDlc0Pg9imw
         qySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765969982; x=1766574782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8s7nifhnhw8fss9dv1I/1lokXsEB5LjDf/QVe/Sm2fw=;
        b=aXzNMbUdPmwS77NGfRA7QKUg//c0Tx15pNt+C1i8ZZ7wqrxmc//Pzr+6Gy/0sjNXcf
         T/vyBq2YFQJMyMts8sNrDHa8fdBdTgBINcHyMl4FCZsBydnsyX5zUvEF/kmzmyWpktdC
         tnKdzDxDOBVCsPYQr3WVZzBRuezYaj1dEgxxtckyvniIqwUyPaNM7+BJUYyzPgHxASi9
         bu5QVsxY2rUqcHJ07spDvO7hIQ5YuK1SUzI873jqTiY2Gf9EPyzd0/0G/OTEHNJWqnTf
         bZYKUs7i50rAotaIhu/UlOR0GveLeufoE5zHvRp9OLWSUumFBmHP9TO65tLPrnFQxQBp
         81rQ==
X-Gm-Message-State: AOJu0YwaJyfZ0L1wgOa/3izAovJuGCNk4onXhgBF3b6T0dccFFUWnBMH
	7c7/JDrUuAWkKl91tEJ+uqQcvU12halrPscS5mc4/3nc80uLgLhDYHoQqdL2rYbgaYuarVq1x5n
	yPMmiDeKB3FXUMfCQ+SG3Oomvm829QUZFU8VgDORtYC+GBTZ5KjByawU6FXfrgVh0cWfriatccN
	1inw==
X-Gm-Gg: AY/fxX5pP6biBnzaPUAuDZl4hBBNew+1h5cz7xIdhppwWA4PJB/jS1DLlvrS5mU3FQC
	jxvyEuhhKGuHXcseXDCLagO6xFCltRaJzHdfyl9SnzTUyuOIS67/p0MGTDzlufygXCmSlphPV6Q
	9TY1trVlIZopgE3QC42O/hadsUpth863d2PbyYBX9YCJ7XazU3vzRBBh5mT7SvC0CadBGKNd+7s
	FifaZBYi3g848dacVv4qM9oBheqKonlYut7GtBN+0i0ja1iVGw4dv+uE+zeVotgO6oU5BNo8LzJ
	mQ2wkg1DCVhcPFWAwtrBsGzzi0uROe351E5lo27pThejrvItmF66spZxHfPGJX19XcIW0Mcjbk2
	tepbxWvNDarsVCAkyxdl6YnOvRPTJ45jhmMjppW+neCoeHn683ez6cICld1Cd3HhA+Q==
X-Received: by 2002:a05:622a:44f:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-4f1d0586436mr189091001cf.4.1765969981881;
        Wed, 17 Dec 2025 03:13:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHde3INckVEyAtJpPA4moTPTi1MTG9MaZWu64iJa9nrCbGOgdnmQ7Q8sGmBSfSB/n8j8rYYUg==
X-Received: by 2002:a05:622a:44f:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-4f1d0586436mr189090811cf.4.1765969981412;
        Wed, 17 Dec 2025 03:13:01 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b44620bb8sm1151802a12.14.2025.12.17.03.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 03:13:00 -0800 (PST)
Message-ID: <417d7e80-e098-4993-85ae-59ebfe50934e@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 12:12:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] arm64: dts: qcom: monaco: Add camera MCLK pinctrl
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
 <20251216062223.2474216-4-quic_nihalkum@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251216062223.2474216-4-quic_nihalkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4OSBTYWx0ZWRfX1aCscu7PzOxo
 bkfnWlI6bjL+3GPSNLRxpaDGEPNniIfTd7Dd5iHIeGZ/zr5GrHTBZJSKb3uNmyAteyjg9sRVJaX
 ztQ6tKfFey35tSrzplyf0rkiiVz6W7hMwhrJcG66CCR18zLmo8znL6QEhoC7wROWAELBezUo21X
 uaNJ7YdAGyjIrHiOgSMijgXHGmQUz/pSf5u9Bxl9UUIZzRDXyM17yz9yQ6v3JrsQsPChQwKVHFD
 oF9AUxoeGQLshFiW4mglrIP1GAnHgvP7aMZvZrKuHNYS86qbM80tGmr9SvleRznwxOzKMejxS5d
 bGNk3XneE6xiKddFRATI9YZuo75uknqgJkcmQ8K7h2qBvwBIW2bA/bqcoiuuZLCia13Q0mR+W0n
 IddP1wCucGq7xE7/byrtmAuGPMVoyg==
X-Proofpoint-ORIG-GUID: wCsJL1GgpDqR9yKzrad7dNcASfBkkA6r
X-Proofpoint-GUID: wCsJL1GgpDqR9yKzrad7dNcASfBkkA6r
X-Authority-Analysis: v=2.4 cv=edgwvrEH c=1 sm=1 tr=0 ts=6942903e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=VLFlip5mi2fxP60pxFoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_031303_358733_ACD62973 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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

On 12/16/25 7:22 AM, Nihal Kumar Gupta wrote:
> Define pinctrl definitions to enable camera master clocks on Monaco.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

