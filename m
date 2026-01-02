Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B90FA374B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 14:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=; b=mkzjoJH63yjlSNP1wOVUbezmIg
	Uz6CqK5LC0NN7ULK0cxEpRJOPH1F9koIZsTCO6evN9Wj2Ggnr5hWUBns9n3pPby9WVevafGWypJYG
	hygSgkykLhH4sqXd93vwu2k7nkZg82ibTG0gMipHjJstIJ8K3LzSAhPa26CveuyL8fdikHvt/lYRW
	nIREF2CYxmaNs8TUu9i+GtTaD37PaWj4mZXleUSPaAQSN+7EBOF8RrNoHT4G9DTCi33yveEn3bs0j
	SOwj0h7+h64sY5onBPy1LXvDHKnfQha7XNwXR4qpoku/GlBm6P6XCuoFPQQ7COhIMwbLwEVRLtRqM
	WGBSZIHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbflO-00000008KYV-0QG1;
	Fri, 02 Jan 2026 14:04:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbflK-00000008KY4-3msl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 14:04:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WDQ8207424
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 14:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=; b=gmWAS9B5k/YF2KxC
	pUQLKgVfTCvW7eB18XPzrAXbjsLtFEqwFoekY1DlvPcq9nJEAAAwqOZL06d4JS9x
	3EPB+GriLWm4xz1H5rpr9clywND3baDb25GB4WG0XQv10GHvGyCXYqf6MXMYOCk0
	vwB8iPQtMBG1r4lwSy4I+rDPmPa7rSiBGXqz9ychUf/KSy1mIyoPIrFDCQpZ2h4E
	45VjA+uQ2jn6MmIWm0jFjZmhUl33AKRPDh5UFAtCdd8uAssXeii2caNh3Y6ZM/WX
	N8JHWp9gqKjscxBk22kkLvCSxWxlMcmQ9ntjHBQz+kdWUOukRXl6jgKRvP3azU1J
	9+nqrw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcx74cmr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 14:04:17 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-646518169caso2754287d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 06:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767362657; x=1767967457; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=;
        b=Y9ITnyqvMiywXqrXKB8bthxfOiZ7mc3Mwrfm1VOwMGECEo8B/pFvvJ8Hk+Q/OuNa5H
         bTM/GkuXCmES+4lxgcCGxSNe11Pe5/cucjVqVVibcOD3IoqB2QPdsHbpwNWMcA7+law8
         8hIfP9g5epU3elf8kfSYzhY8MnjWUohfIfUA4km/LIeCK+N+s/HDBIbUwSx5U0qDxdg8
         Z2ihkn22mcq5OB/oAx1NBP5+SB5kgA5TOmmQylzgiZSu/+hXwopjjMEMQtJdHb2ALte+
         CkCuMWYxF46pGz4rKJPZpRA8cF9OC0NG8LaE7gfJeKG80y28+FdR0QHZz6K+o1GSmfmj
         usxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767362657; x=1767967457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=;
        b=v28CRa5MDzxteRGtohDck0+l+h82hdjYNSUh9cwjj+qCVQsOYRbDulANUhUQdiVY29
         5vUUEFtZkKnfEFM2AAGSE5zvpVF+HjNAyL0d5LVREb0nW1xW1MlmyfIqI33IgMXzqm3b
         wcOUubx5lgHesoba3Bad7i8QgWNwBveM+za7qNPDJVAqL2mNHCyuG2hF9dL8sdWO/vF5
         hPGuaZIiALZrLmh9IAO5oU/Hly/Rs/NHqqGxnuW1OumFtg5degs8ihTZgZt+qjbfWaYu
         c7bG4FW8z+5NOUY6GaYUWGRUC+tuVIStCuezxt91TrXTMNHjSRbMq29NF7GvwzgQ4W4w
         aS4g==
X-Forwarded-Encrypted: i=1; AJvYcCXNk7Z1ObmBWHmUzTvwgTmEwq+Wa4uP+D74IcTAYizxCK0GC8vScRyNNLl7Qj9SZHHgvumTz9hQLJ/8ZPHS/OJb@lists.infradead.org
X-Gm-Message-State: AOJu0YxFxaD/t9nyD87BM1NqDoKxjrwnFM6VYL1ewCHjpOI6lZMttz9m
	G/NJwEz6lR3l3AcXi0ni24UIkItzJRGgmEAGf9ula0kROKXuNcj5LXP+8d3FUNhIbECj8wW+0As
	MON44QWmIfp/lScBdzk0rpHKfJGeUWE8U93Vme8wJ6sqgBFuWfbtgMgwB8L+AoF6PkQenxQrdhe
	TuaUoDyGRiqA==
X-Gm-Gg: AY/fxX7SDw+m8gdjfwMeF+Pj9PvHKSkx0PwKKMYzHZckzABTsqWvo1F/K3FVRIUfVvc
	j6kggX8NrlDIHlQn8lGqpobGDxHhcV/ce26V57PPDRHm30FWzSmlDY39yC1Su9Ed08mvkWT/wR6
	nznj4mtNyMq9icQLGF3+EYrnEpIvOEQEhXxune1alQpMMgBEXjDksBO0lPuyLzqZsnbcVV68MpE
	yzkfhxPLaQSQHKwq1Z2EHfwv3EZ4Vqp62jf+s1DJbvwJmJ38821nE3Vro0/kZzYiFfyw2rdGdbQ
	A4spmze/iuXmEFZpLI5g++wZlnpjoa7DgKlYznFxPYOhkOEzNOVrEiXZv5tnW2UVvHPcRFIoPIO
	PBDUNX43I7eovCuFRErnH1B04PgntktqeqPoez9q2Isz1cjhYOCL0qN5cpCURqL7NEw==
X-Received: by 2002:a05:690c:fc1:b0:78c:2d45:519f with SMTP id 00721157ae682-78fb3e6e5a4mr318529107b3.0.1767362657099;
        Fri, 02 Jan 2026 06:04:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDY9o/Da3MH+qVOhc/qqaBC7t55MFtKFA+nrAgBn0dEzUb9bRjnu5r7OGAxL5CcAAw/v349w==
X-Received: by 2002:a05:690c:fc1:b0:78c:2d45:519f with SMTP id 00721157ae682-78fb3e6e5a4mr318528797b3.0.1767362656686;
        Fri, 02 Jan 2026 06:04:16 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f089fesm4586018066b.46.2026.01.02.06.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 06:04:16 -0800 (PST)
Message-ID: <01a884cc-f5c3-4b1b-9fd9-7459227cf455@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 15:04:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] bus: qcom-ebi2: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fzHnCZH-ZhcjkuxrRAnpAiSTxzaflzdH
X-Proofpoint-GUID: fzHnCZH-ZhcjkuxrRAnpAiSTxzaflzdH
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=6957d061 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9ra_KJl88v3tURVkoeQA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEyMiBTYWx0ZWRfX3L1VJ+/JEk4K
 GTP6ABZbzKwveTO8PPJUDpb5dhSUCZ1MJ/HioJbVrz8et8I2coP97PHs7SHyY6FXfCPev5H9yF3
 tkq96qfRoIFg8F3n+cG9C6HalP8Wv0WS0X+e42M5ufQ2TAQltcheHlijoWHm01pqztoo1cRAIR+
 encTmBmu6fiygMRQVRlkTfKQRQkfxo0j+o9u4MXMJrpMUKm+pvvRZoYLfDrN64XQxyd2zaRPKaE
 rKO5769M0iTmmMKQxSMd5FvzViB/np/PpAVWBhqEhH6dmZnPGe9esqhLYecTsrm24+yQmd+OaOm
 I5UZtyLD7MyCh0QAkummsuDWUetm4yp/Vi9BuQu/fam6ej46LOMRsdVvs/nVf2sLqr/BZdc55o6
 0hO2azk0bgBV9fGlH/EBICOJUamNlnAZxXCXx0wkHioOgGQ9ejA9zcNjXV/03+j5to+4w9zyPTU
 ASoNGsCpck1FSadz0Ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_060419_088431_C2158215 
X-CRM114-Status: GOOD (  10.20  )
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

On 1/2/26 1:50 PM, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

