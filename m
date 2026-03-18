Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFF6103E166
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 11:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2JeKfOPCA58cjIMuqyJWK+2kMn226saxkASuxuFM7I=; b=p+gnN7qlkfXUHVHiJVfm4KT+iv
	W7mkl3wgOC8qal+zbL6SrrQicoffgKaR+bMHd7US4yeXdz3NEI0gYGoN5dm5kPrWJ9treDtwdHxGb
	zKfFOwR8SWwwcwlehyUrT3hmf3iTfGe/xF9O9OHc+reamMRbtAqn0/V6UzYAE5UosRMxBt/gjzBLo
	hnxdsfZ44pRfBgKzRPRQ5DzgtazsLH6QCSmyMyWO9MhsvyYvGm5K7azLmmn/qVS4D0kbKPUTD/Rsn
	W2+CKYlbjlN084AavzJqWA1loqnTY56lqYOoC2RfctvZcWF5lB+OFph0VBf+OLD/YFsxswvtKzBZV
	QrHEr5bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2p9b-00000008JZ0-0sGT;
	Wed, 18 Mar 2026 11:33:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2p9Z-00000008JYT-1JwR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 11:33:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I98aUH403286
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 11:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H2JeKfOPCA58cjIMuqyJWK+2kMn226saxkASuxuFM7I=; b=KulQFRo2ppyGCv30
	HzRdW1h/z7ipvBc7tT6iFwc/9hZATfqauRJtbGsEsjCf/mfPOAsx5wOp41Z1uToe
	W4WwTPPPvsqDTb4rymJu/5hEbBbhMI/Sy2Jp8CDuMIbaaMeIs4YrBZmR0uBfdA0q
	PXEHVPWweRzY4QPPK6VdK71aP7yhD12vgGUvfYa6oSsn43gTA04xSqWGkwdFEzui
	LMllPFwnIVapKEQCHX6cbEfvLApkkbJEUduXcN6XJ/OO09Xk1QsQiwF5k/dChpGC
	/AmICiYdSyaPP0+DOSyhSXPCjakoVVHRfRRfK9GmcdJHWEKZYStnJSK3OL1YZEt3
	ByOFPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4duhfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 11:33:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5073ed1ec6fso51021831cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 04:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773833611; x=1774438411; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H2JeKfOPCA58cjIMuqyJWK+2kMn226saxkASuxuFM7I=;
        b=e8YoIcgUtnn9t1N2TZ6OQj+BIXMeyhKymGeZlEG6duKj7BYja7t1Z5LhAH9YWR/2eI
         +Rdl0Oingg2WcFZdstPVn/ZWOYKQiUEZaek+AT1xWelRrtHMW5rdZWEG9tb6tOvPEq0n
         4kmNxreXas6HAtkTcFNVWMdLw0yOKdC0NSoJRcwSwhbcvAeF3G6+GejlKmcLx95Xq9yk
         VM2oLgMOOJ5FTnL/5S7yeby/hVGy9BrFCDh2Ekk0UED3gPh2JRYhSHH3Lx25owdYEEcq
         T5RIm8Wu2aWv+aHrFCn6+i/7eXyHIH+bnB7AXVs2OCAyPu5uCYnKakAC0Hh7jMXUCpaK
         B50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773833611; x=1774438411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2JeKfOPCA58cjIMuqyJWK+2kMn226saxkASuxuFM7I=;
        b=nlQg5C407Hb3tYpACg13unBIIluhZqEGuLO85tt0f2J+j2HtczObkIwhKYyfxOjK7U
         WLTjdw1+BLABSxKA89z1tiZRtha4p0ayMqU6Rw7ZDOYQtg5zPCrcuCJsHDp3K+ujqLy/
         1sP8l6oQjgD6xaR0nwWGrBnDn86VGpP7oHX8x+jpt9livaW0W9KWCXm4ogheyKQQFn3x
         FsNtwUZhIsATGJxOjobbYn/FVGVXFJD/Tvsdfa02bVwHI1TSRjCxLXruC7/hOAFvz4fE
         aTChZllISLaOd4enIzeNw8VZafrYES5Vsm5UE8Asb0vK7sfQFHyKk880468knaJJoFOH
         HkMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlgehv4O+FhTFFx4QfKsI8Z46KaKxAHZvlpMkuDX/8vGGy1LfN0a5SGfiC6gxisqgMKxkWngvu9OhasvURGeZf@lists.infradead.org
X-Gm-Message-State: AOJu0YzKSde+1fPks7OZ68SjDiZlqp/292z5PDZKJR0RO6AgKCppEM7O
	oPlkYsqn9BSN58y7y4qVm3R8yr4Gg+Z3PKA3TiDXnUPjIehBXlLSWV2eQjEfV6szlu3I2siinB8
	ya3Z3z2znpEvsliBRCr7/Oe14htloYtI+rZxY2b5W69FLBJX9mzOVEyLKtvQ1dukLmnfiWs3QZa
	TIYw==
X-Gm-Gg: ATEYQzwRpJAyK9EQsyBVTb6LU/p7MU+Gi9QXb0RT4fESn41/qWdqKStZatcBwb9/MO1
	N8a1bHQ6CqeYA0cpGn3bMCWSmP0bfLzrbw15DxIh08WVo6nsUslOLhHR6EiWBofD7izEop0T/00
	IAHbCYD4749+afOOvxgUf7Et4FxYmy0m5Vu/RtqFKp2t/lRSojiypq1yJ/ZrNvfzUvJiRm1rvmu
	vct7eBKjA5TJQ9YMue+OHtkECvC5+oHPSqKsRAxe9JH66xjryJKOcUwjOb09VNzUPsgrkOcqmOh
	vzexlJC5IPhN5BHrludH7u0a5LD2KMRHHMrwQmIi4JVIjhgdEBvuz2K32dAHk9ctxXEGtwKl5tQ
	SDDhK+fJfTwY7Ai8fRpLwW8+azxHeKg347M9pgY8YM1qAapoaaLXaxu010P/abywqm0XJrzncKf
	9Wpzo=
X-Received: by 2002:a05:622a:610:b0:509:47e2:9dfd with SMTP id d75a77b69052e-50b14949a02mr26511801cf.9.1773833611324;
        Wed, 18 Mar 2026 04:33:31 -0700 (PDT)
X-Received: by 2002:a05:622a:610:b0:509:47e2:9dfd with SMTP id d75a77b69052e-50b14949a02mr26511551cf.9.1773833610947;
        Wed, 18 Mar 2026 04:33:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9849sm1476868a12.16.2026.03.18.04.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:33:29 -0700 (PDT)
Message-ID: <5340bc99-df1d-4736-8e10-09d541f0d2b5@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:33:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] clk: qcom: Cleanup redundant header includes
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NyBTYWx0ZWRfX3ISNrCKavEHZ
 JSgJSP2RsE7l39o6wyZQCmmNIr/v4scpUKfRk9pDlxLzwQUdwDU6rBRzYCzfFIS/Fa5ppXImZ11
 tJh08EJHK1+tM2uzsBvg12IHzty6UvDFrs+2unZEtlwli34o9iKmZ/ebl+wcb/YrOCNYBpZhKEw
 pxdKzrsAJ3eBWoYuqVKbYT9TyWOrgQ+xpdXrvqT2q4aEUPO5hfDQ9pCf+eK0lHfX/JYOOw1+Z/S
 z6WfMCVeTAweoGB82U08fHq+dB+2+wKu0SAy6DnS4ytF26XwPq1Y/mawfA13D5ZgYoiYetdugXv
 J9wNN5kOXgo4ZyKoW4DxxiTnIVUsviOnEi5gOvhOqjlXUxihtBbEkSm1thaBSPW8Qd4ab+QnEum
 rPY4yBJ7EvsIun7nrWOd0F82hqfoTDt5L8ZGYjPUwQLeezizEGlbIK+VN6iNHwcrpKWgSmNbhAv
 A8koo1cHFAuI0p2GNEA==
X-Proofpoint-GUID: 6ccBno3gA8g2XIv7nOVYKQrxszmRJ4rq
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba8d8c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=aywfhrhUYFgYpfM73PUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 6ccBno3gA8g2XIv7nOVYKQrxszmRJ4rq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_043333_479627_C0B08335 
X-CRM114-Status: GOOD (  10.39  )
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

On 3/18/26 12:08 PM, Krzysztof Kozlowski wrote:
> Newly introduced drivers keep repeating same patterns from clock
> generation scripts...
> 
> Best regards,
> Krzysztof
> 
> ---

for the whole series:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

