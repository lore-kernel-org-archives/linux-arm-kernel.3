Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819A8C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 05:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAV+cDxNEbBgATm6StzQPek5m2H7diNkW5DFl0AvbJY=; b=SJt7ogNYeHVHGaGOkIbwY0kYCM
	Fg958e4cH0ZAD7wt1rxcELtwchliEywP+HhpFLovxldZgLP2t40onYDqYT/2L76Z7aK+sWv6YqNKy
	7g4ClZx/d09579AfhYh2UfUG3FwJNzDsP/v7Ai3tWWvTkLM9u+AqGnHYVm5t4R86+dtDWsIk22mcL
	S8kED0Nc57XY1OHLnttMMVChtjY1F1IVHNGKRExBPrmi/BBkhAEbzGGIP3A37BGHDELwGhVQBwxUI
	lfhmuZNldqcy5lXsv+Ox6KVfoPz6nlR3qcoTbflObu3eK5p7ESBTtth+gDQhGapCB0ACn0X/GcTNZ
	EKIiu/ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgbt0-0000000BX2r-3CdD;
	Mon, 06 Jul 2026 05:28:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgbsz-0000000BX2D-0s0e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 05:28:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641SlS3585281
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 05:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pAV+cDxNEbBgATm6StzQPek5m2H7diNkW5DFl0AvbJY=; b=KTCjD9PgjuqwdhZ2
	6dKSeiGSFQc61DcwHTYZuiPE3Nzt6bkRKmB7JAP8kqILuOjsKUx7MF0CpIPeFVYD
	RUCipmYE7vOki3GEj3C7lv3maOv+cKsubyRLeUSpKniySdE1bexIaKJqFrrc8brS
	EYxHmUm96SPfBzgOF7MTx1BMp3B7GbQ31CJYYApMm0dK1ebt+XiZ00Pfe5aplC/Y
	77bW6JHPQDoCwyfLQ5s1pxhDw+Sjixbg7CeRV/WE+Fo4BcRHQ+jOTV4HVkRSi2Yv
	71reF6u7d+jJhq/Cmin2Xq+gh+IiWjTMD8IeOHsjYw4gZBx6jlCPQdKF8wJwZjH/
	khhobw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8umgcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 05:28:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8924f4d0a4so3729803a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 22:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783315731; x=1783920531; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pAV+cDxNEbBgATm6StzQPek5m2H7diNkW5DFl0AvbJY=;
        b=cY7Mo+enl+p0Bl0DStE0bAb4suqzZZqMcQn5W2mgaziFyNeSY9aLCo4Itr34WrCGa0
         BIlYJTciRkaQm3pIuQsW5ZNyHF+1dpT7SEWb1pByBLBSgABSSMgEucPe0z+M9hfPrldA
         t0sjFdJXBW57YVig7TJO62Zn+uMQf2I45U9t7AsuaUnPGTsH+wSjzcCY5sJuUMOalOZ3
         WebJaQV1ZIEutKq+8qW6TOW04gdNwuaWUM6q/5igQxG0M2k88DDLVzZMbHNT0MJrFGkH
         VJK3OKoWNkaIxcy+sdxagkSvzid4ZLl8nt6qsT4TTFkLrV2L4i9iF7ABO7mIDBuWvZv/
         EyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783315731; x=1783920531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAV+cDxNEbBgATm6StzQPek5m2H7diNkW5DFl0AvbJY=;
        b=sWECmouG9K5udXpkND74NZ62I3lgxU/3WMQi9fjYigoQyC+tvgue5IN8WmAWyfeW9r
         35h+hk+zH1m0wzDT4nNQGEJ1Nk8si1TQWHR4pMdA5q4LL8yjIyLY/CXtCmkjGCUA+6hN
         dmwZmYs72weLkU+dkIhwSpgAvRBS1qe+Pe0MCRca19o40yxpb7PZ99bmV6qDUU77BV3k
         Dryn1yc9gwCisKng6noz47IW+QymzIX8WmIIMYLl7gVVZpEJGkLVGhTrXEo83hhtLia0
         ZakIw1c2ir/H69r7oa2rSmhb6PomP92um995coSo+03GuJQ9wGtpshdW4h5AxPPjdaf9
         bldQ==
X-Forwarded-Encrypted: i=1; AHgh+RqusjFPW2wiLhjpOeMSjKJovA1jOEUFX89omjqu10gtkZkHxUVu/7+1ULOGdR0MrCqbiEYNIRXfK0ihvwRahr+v@lists.infradead.org
X-Gm-Message-State: AOJu0YwPZ4YduDEnKhHI2sxR7cONON5SzkYucq1RrCyeRsTj5xBrA9ML
	hinF2u2elLjHcx/m7Gfx6MKgwXZ2iiXFz+W4JC7W9H/h3liRTKNZ3a8oF41pYaI0RzHIf+jTFC+
	B8wNBCMst/wL1XwPvJAza7+juJsAkK4eMyOKkBkNdj4tDt+ZCUV8LUM93Wy4gCXvctu4DGpCU6C
	n92Q==
X-Gm-Gg: AfdE7ckeJ9sJUzjI/c0lf7RdpZ4mkl+KYvAr5ltJCn13hiNUXrPEfY+x9e4vGJ+hnYw
	08+PyLQepV9p8CiIa3LbB+/WMEUZ5rbOy9ZmJ6MCcCH/yeVAc/eeDdNvtaewEpAbVMUcisKgATX
	z62kU3LuckY3iqD/k6noWatxsPyYTNVmCF07d1DBXOLKddWuhuZ+WHLbwy5z+XxWRHFybJyicuJ
	1r0iCBVvPeOQKjwx8ZyT6ZFS6r4wu6NSrmQUyX+IHjVmG78VlcRLKlU1tnSj9tJeoB7O+nW7OOb
	ZbQZI+VcYuBIsSk7N+E/w74zhFx2+RNmfCElu7GEBWDnbwD4nACeha6Z9k06m9yXlSqyQunbad1
	VELbpVDLGUaAErEjWDnqkza21VjzbaJ53wbUVEMQ=
X-Received: by 2002:a05:6a21:7a91:b0:3b3:bf95:f7e3 with SMTP id adf61e73a8af0-3c03e5469bbmr8361345637.43.1783315731002;
        Sun, 05 Jul 2026 22:28:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a91:b0:3b3:bf95:f7e3 with SMTP id adf61e73a8af0-3c03e5469bbmr8361303637.43.1783315730566;
        Sun, 05 Jul 2026 22:28:50 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0ef50sm5875489a12.6.2026.07.05.22.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 22:28:50 -0700 (PDT)
Message-ID: <7eaa8b9a-ba8b-4d07-92c4-3a965ad58708@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:58:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
 <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: psr3Uj9ZrM9vpztlfjoyQ9ygh-q-ZjLK
X-Proofpoint-GUID: psr3Uj9ZrM9vpztlfjoyQ9ygh-q-ZjLK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA1MiBTYWx0ZWRfXz7jpV5IFb3g4
 TUkwG+XvcmAKg8RjfOMq2rF3msEkZPiexHHBabbUikdGYkMuM5FY5n6pPH94B8sKkDqXsMWndJm
 6LuymBdIP20XeUb9AKTUY77DLE+MJY4=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4b3d13 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=dZunwGW3stLU1k_RaHIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA1MiBTYWx0ZWRfX6KltEHof5322
 QtFlvDOrB3fRH2DZKzlNau3MW3SUX68dW5TLshS1EUqxSSU4snSJ3nCcohpMFHQftPrlPGKXIGb
 hzHop28hMiOpxNBUdA0CA8HyKHJl22E23yFKBV0C1ARrEVvgA3Ggno3NKm/fYqO9Ar2veFhm/WI
 dPw7JBX+VOOmph8PPfRIORsUJmG39DYIb6DIEE9EPkYYEX6+ocj9ohO8BtbrrfQjJCqUGEUJYCD
 9Kv92LiMF0U3GQJ4SLDGXDS7ZdrC/gpcHSO1hu/63ZKjUA5Yv+NYD4LUMs7w6vbOWTAoUiKa9c0
 u9tgv+1ukqUH6eU9SHPUqGcyatmMGGU4KdVr81A/FqsfNXfxc7zjIcJ9zkEMSTTwV6bjYQT6eol
 g0vY/0V8i1tf3U36K+BpbSXtPu5RSIBv5oSnShm4keSC0dnyUtHE2UT8XLO9BI59oclrCNAdVAs
 BPBnYJyRl/pcBciKNdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_222853_368202_66619E64 
X-CRM114-Status: GOOD (  13.48  )
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



On 6/30/2026 7:39 PM, Konrad Dybcio wrote:
> On 6/9/26 5:02 PM, Taniya Das wrote:
>> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
>> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> Almost all of these nodes lack power-domains, meaning the
> aggregated performance state requests will not be translated
> into RPMH requests
> 

Konrad, all the clock controllers are on CX, similar to Milos and does
not have any special voltage requirement for the clock controller.
It is okay to not map the power domains here.

-- 
Thanks,
Taniya Das


