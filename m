Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83369CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 15:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooAgjRpTHNP8kFwOiUKb9Yh/50coU4iyP/eWLaeMM00=; b=mxZIw/ElxZLgjSM3DdtYp4RIj/
	yj+8UNYzRP+3bOwUF05QkOFgfrls/1XwLj60MP8Xhz/3ORxYvydRQB8drzPWfTcg//FXEZ1gsKkeF
	VXtXByu7IsuLyxefUKOXSo0b8pi4HNgWQCAUE7KmDiTsT0biVcB9i/XIReEr0xqDnGR69wb7+GcUj
	FmhAsfxxuGgOME+7DsIAxJY859jKSA3NBNvmJFfV24eIqyObUhV/PtLpsjBDS8E4RAgSu4ibMnSeE
	8IkyYhYPSRV504rd203uM+2MDFdu//3FhrAcRv+Ml8yZgVpgf/2OcO6Txq7Lz8fY7rhrVZ5c3wymq
	tuCmX5nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTBr-00000000klQ-1wza;
	Tue, 02 Sep 2025 15:44:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPnC-0000000H78b-12bN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 12:07:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582B1OD2021747
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Sep 2025 12:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooAgjRpTHNP8kFwOiUKb9Yh/50coU4iyP/eWLaeMM00=; b=C+/dY4wK+FzU9XOb
	4osh6w2fl+WAynCdo5SXzupLhtwkiwRNhcT3l6gtaar/Z3+ZahQMR39JtpSBSuG3
	gxQuAdzeJGV+Ju501Y5mEcDtJPK/cHL3vmZ5W1RBIGUEwEbvgI88sOoXcayivoX7
	wh4Z30+NyS1+BBhYBZj/RSmJA2+02EKmu/rZ0SpnDPeaEAZoqts7cXRdEAuPVuaV
	79xq3DTGKMPsbhnCubvOers1owdLoI9touOy0qusIc1eyPTfhfIc9s1wmc0QnigM
	6G37eyGQyuE9MTejZwjgz/pE/p7uYyCAy6OS3K/x42roEsPi54Y3boGKZb17KOSx
	IROvKA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8rysae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 12:07:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b33d08f681so4040871cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 05:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814836; x=1757419636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ooAgjRpTHNP8kFwOiUKb9Yh/50coU4iyP/eWLaeMM00=;
        b=IvJO8UReBZPKolTKDo/6ynAgJfVSo3EppMEGb2z5l9Y/D1M6444SIml+ql7VodyoEH
         Melc8U9H6vMLpc8Y4Q+aeceHdume7TjruSJlWTfJsMnt2goEfdqxN2+qHC/xBTABaQE1
         pNSVak7HZwuH8dQtD4Wbwr9mQ7xBXFysiEhzP0fSjl6SWodcJZDNSaaEtniOQFe+sFYa
         X3XWO5KhrRSawDaUfJyxKVblizKri4+7PmUHIy1y82GtRgTghMr4sdjTm4zTPdb86Dr1
         KcdcNyNcru8o3idZE2vpT/FNYei76J46K6se0ziWXnIXMbbxJX3OMbs6LWZVhKiTq0Cj
         wh8A==
X-Forwarded-Encrypted: i=1; AJvYcCXjCaAyr70MxcTOeugaGfCFMKxmgorwV0/OXozSjgwjOxdlp7DxZx6mEEwqRoNv7CxcxdzoJongJw9Mgl38b5Pw@lists.infradead.org
X-Gm-Message-State: AOJu0YxTLZmDmU2ymN95EHK++q5unwXAVmf/Lxtn9v/mL9XmYW7PAB44
	ioEkDq0dR22PgIqNzXqrBr3/Tu0powU1BtvbwkZaGqbi3HB1evP6NRiIM22V8N/gblHgZDSSUuy
	K049AG1XPjL8PvpFI8ZGDnHoBRv1YM8hFGDLa5WRwR6hHttsH13GISxKrp8ssJU024uRi8pjOph
	cKsw==
X-Gm-Gg: ASbGnctLbyZeFCHud0u39wo7dgHapGCitc76OAADuLZvQQJtDx86xDRu05AwMXISeoa
	u8DwlvXWjfdxCGOE2sMDt8bh57rXTa1iRVozX065e4Q1X24MXmDvooYXit7TPeIzGntk+1XgXCf
	YuN+GVtCETuFfKjJLpGuuJsXtIbiwaiLX5pyn2vQSbVmfBat95P3P4Gs37bIYZX493g/6LbDHgi
	OA7TwbsYcJOtaWkG/t0QDzF/K1s0qcmCYsKLgE6qXwWUGh5XFWb+gItmhHnGE3Lho6yyEuJLp9/
	BlpNH8Bx+/WXt+/eg7aKa860cbSF1g7x40i24S6dmb8XqEzuFGbaNhxoCvQChBkjfDRxTg3hsTn
	rF6nlQSvG4yZ0wXmH3ydE2Q==
X-Received: by 2002:a05:622a:164d:b0:4b3:d90:7b6f with SMTP id d75a77b69052e-4b313e6f3aamr104880861cf.6.1756814836108;
        Tue, 02 Sep 2025 05:07:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi7UgyhFAah0VP0bJeUSU1wMpek7APbVlPpwHN7xSB0N6vFLNU7Pjd9+3uvDbCoDIOTsYYeg==
X-Received: by 2002:a05:622a:164d:b0:4b3:d90:7b6f with SMTP id d75a77b69052e-4b313e6f3aamr104880181cf.6.1756814835494;
        Tue, 02 Sep 2025 05:07:15 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc52ae40sm9249215a12.44.2025.09.02.05.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:07:15 -0700 (PDT)
Message-ID: <e9c70483-8538-4f9c-9dd0-b4136b34a667@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:07:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] clk: qcom: gcc-ipq5424: Correct the
 icc_first_node_id
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20250828-qcom_ipq5424_nsscc-v4-0-cb913b205bcb@quicinc.com>
 <20250828-qcom_ipq5424_nsscc-v4-1-cb913b205bcb@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250828-qcom_ipq5424_nsscc-v4-1-cb913b205bcb@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX6xhKqpvCft5M
 UWE5xtUh4cZ2ahsqM5iFFOz/ucHlP7k8SYq/nJtq+TzPNuVsRI97aNZoFbtlhd65+JXjpzk01aX
 B2dg/Dkf10SU2wmItRkUOQoicECA5vBZ28TOTFX5KD4e2H9V6DivZjuXk6uZZgSnJA4T9TTmvQP
 bo6mSCMc36d1K9zG4KZHuZN8SxKe9UHFX/8JDqVt3fO54hWwHLkkcCF571dnLZv56vth0KKWWgI
 wFyVIAaDrdzN2kMlfjibjf2jiCSN+/YZ1WzZzwbNoeXlrXl1eOgzQvDxpUjPUuHBhcRvf//El4N
 NAv/lGCgbD+JQnznX/HkK9MMi6hM5c5aARuAbcpJCwN3WtcfRH89BxuSi5uK1gEcMuwltfTcDqV
 +aEtl8O9
X-Proofpoint-GUID: 0wdLY35QaCoZU40HDp6TGJ-DvcPywXqP
X-Proofpoint-ORIG-GUID: 0wdLY35QaCoZU40HDp6TGJ-DvcPywXqP
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6ddf5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=5e-Oaz1CA7JNmZ_uPyAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_050718_300417_A8AFB749 
X-CRM114-Status: GOOD (  11.86  )
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

On 8/28/25 12:32 PM, Luo Jie wrote:
> Update to use the expected icc_first_node_id for registering the icc
> clocks, ensuring correct association of clocks with interconnect nodes.
> 
> Fixes: 170f3d2c065e ("clk: qcom: ipq5424: Use icc-clk for enabling NoC related clocks")
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

