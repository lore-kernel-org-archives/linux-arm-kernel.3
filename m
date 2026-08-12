Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA70C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 07:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NiIIs1N5jSm/s2IraoPfNeMV7WyhxZUx7PoQm7T9cbc=; b=l2GggXZzLAOl5Ljso5ZvMcIDkE
	ojg819bh+3QX4abvbRzwZfAxdVu9Q5X5LW8kQx/C1x9T7hD6jEbmITwvrNKB6StAS+SCSO6+qXImo
	cqOzm0mRiUaFhSqV7mHqhhMNtl1TNiO+Mzdr5fErFwQ/YDGGX+0QkPB2lKcWU+2VI3w9jAZSMWyXP
	pCXxFRsuH6h1yF29P+jYnVDDB8JbIyqBwMBWTJBMc+SnokHv335Z/odxj+k3laxD7qM6rOzLdRhLR
	Ypnq9+Jv1TcpTNVTJRDeq/uj0PV6KJCRqrQ0yeCWknsGZ89xlTsSaIVooFbRedzd6+6MXri74yRRP
	9YHYmy3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3W5-0000000FauR-11qW;
	Wed, 12 Aug 2026 07:36:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3W2-0000000Fatu-3lot
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 07:36:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62TPX2872378
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 07:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NiIIs1N5jSm/s2IraoPfNeMV7WyhxZUx7PoQm7T9cbc=; b=DUT6U5LF+ORWHPgL
	7A5td5L/EjOH8p5NfbokYu8RsMKY33NfTAxUJ2dQtUiQS2PYGYMFtcwLFGQ0RhAW
	2s/AE0vc+NDkEPsKAfG7qWeyazG9/FoFvPWQJVznO85jF2K1nQQ7AS3XMz77sghP
	YKKRZVoh+BdtBdGfTfBp0MDAlueYM59rI2IKupHHwqrZBh5w0y+TillzsXrqa5l1
	9kh8YY5CZ/3sqcHD7KDtcCXuj1zL3AFBVkwpo/HkctruQhvQFfgTKR8TicTp1sWL
	FzZ9vua5JnOpHLzgo/7Dc/ms+JMC3+77Uml+D3cFHfrbfgk6FltE5+RT/HeoWhwQ
	JDJXbg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj1gqam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 07:36:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb7049fa552so502721a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 00:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786520205; x=1787125005; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NiIIs1N5jSm/s2IraoPfNeMV7WyhxZUx7PoQm7T9cbc=;
        b=HCKe77b5sfLof5S0ALAf3bMjWoUltIO5o8HLszwwtuVwq2+nIJ3BkgqwkwsYpDV8h3
         gpG1Upmaw4c1EJ1r8UYX1MT+jmRCmuYQZNcmwOrCqYTztmSwrEZWoXGzaE0Lch27hTRo
         rNdUB5rzLRa1z7SiI80p+SAVye7gxVpKm5siuIU+TeFUUsNkGL7Z1Bub83wH+sSmtqT5
         iPnqEHLWLWsgsKhUlTUn2ihe9ZSy799xFCE0tWjM/AlLUY9PaGwrfLrVEFEUyQPN87D3
         Ri7840N1SWjQVNfYv8bot1th42sPnG2AiXVIBGlWAJwky8id2nlupRORn+pzXhsb0cCI
         twMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786520205; x=1787125005;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiIIs1N5jSm/s2IraoPfNeMV7WyhxZUx7PoQm7T9cbc=;
        b=sUXwdHKmJjQH3Q85oW5iuX+IayE66DKiFao8Kek2Hxgq96zChxzmvV/Ffe58P85WSJ
         GBMqagATQuik5K9eXAdyQLhUGlt9krdOZLaF8bA9JxOECXcZrNvnmWy2MXhGBK/Fvxcp
         ySv3dVxa3Of8sgD2ZC2x3/Si3UDCfQf5m7KWdWnOqbALGNMw/FuH3iGhNHF5HFcTW7c7
         qrOBQL5WEReIC/6kfMuuwWoaFHOnxRrlikBNPg4Yku8bekXGtTvkuw5dR2ixI+b9mMdj
         Xl7ZooriwyIG+fyXOpqVQqSqiYHBwMnjg0pCMfnVazbIPpRmOCTjqdkLDQL09c2Vhihh
         DaUA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/qWlRflS8ACAekHIcktte9gUOctUnNEDZLUcq+xO+UJMrV30WXptrDv2N9Pq4DdUyzQMsuYuqE0yNiKAw3BB6@lists.infradead.org
X-Gm-Message-State: AOJu0YyGK+Ixl/1UPUiJzuZRMMOmUcO5BafRLHPWaf7Sxvsie7zNkQ3S
	30ThifYRFbChVqRXDbcSOYe/k7dgLoZdFnV1yprN9EDH11r5RwUDRZhUbQBbPEjRwhTtUbVQfTJ
	vwwnhyl8EGLf2cPRuNKCkimXjUIqvjhEs5K8ILBFbjSfbhR5UcCwpLUz/AJ40WXgdWbA0P3QyE9
	0Qog==
X-Gm-Gg: AR+sD12Qv4q5Yyx2Fc17oixLkKrkDmaUHZXyXM7l7upadj+P9wDxp/zBdsHiAES5l+x
	3FWGMWVIPbVxDMiyt8mZ5O857+GDwNwpc/ih/NY90f/oTeQ8VYNNJYjzo4wxELWe6KLhSlHbHq5
	obH7oZ7psErHpkL2r3vvRzpsX5uXm6T+wNCe3w+vBEKq2OLDaJM68OuQiIM8csuoSeM2UiS6Egf
	XA8Aq/q1LiLHYXq2IhpfeTT8nEiksAQR/Txpf4OMFg7i7jq8ELVxyRD2IPG5EYWjQdCaek4w3eX
	96bPGpF1Cng07t4x7yKbvtZ8ttmJ++JfEIvfLsxEiL0gi8rwoOVIY/IM6JSkMn7jUhUfxGIvHWd
	Pkg5hsEOfqLHT6aI6YksCdHKMz2qJJwiW6A==
X-Received: by 2002:a17:90b:3948:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-393014fa36emr3195043a91.10.1786520204577;
        Wed, 12 Aug 2026 00:36:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3948:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-393014fa36emr3194989a91.10.1786520204012;
        Wed, 12 Aug 2026 00:36:44 -0700 (PDT)
Received: from [10.217.219.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f9675e32sm829428a91.0.2026.08.12.00.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 00:36:43 -0700 (PDT)
Message-ID: <2c036793-23b3-48d4-834f-9daf8000b2d5@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 13:06:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] soc: qcom: geni-se: Populate clk_perf_tbl with SE
 source clock frequencies from perf OPP table
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-2-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-2-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sYXCZ0jyT7spRhyPRhOYyvNWD2QF2pzR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2MCBTYWx0ZWRfX7uhYAHjVXl8/
 tXmeiq/5RyXQg7PD67/GQmj5y05uU44bHQ3UqLN4NZZAr9xgLPdYV2OIz0csZLxonGioLw8wee7
 t/1h1XXp2SsH+Q+sbMZOlX9NtUX2w2BxaQPjpHXXIpC226KVqFibHSXsY2SsqDdXm9EPWS+ubiP
 QvAkM7m2MM6V8QazsDbHuZ0chPUpg6UuVE7OP8lbQQBYfcF0fXs9UQF/l/iXIWSHjwLawFfPYT6
 hesaqnH0NwA8Aam7d/wPb4BPYYVMR4VewR55ivETqSqe73zAIaqrMx481aP35qgSbEZ/IX2AMX7
 EjUA4oYmDJRPwdrpqedN7Qc9Y1lCPrT/0b0hSip/pgz1DgkWpgSUfUVGkaee0mloJD8cX9FFx/w
 PJCHfqq+gne1ugALxCJ8xuU/Fv2uMH/E8RDKT2VMhnD3/qTUJoeDieD+JnQPv/xwjOxngc9OeOd
 MJTVreQWTsb5MVQkx+Q==
X-Authority-Analysis: v=2.4 cv=K6ES2SWI c=1 sm=1 tr=0 ts=6a7c228d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ddSnBWzqd8mu_d83chYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: sYXCZ0jyT7spRhyPRhOYyvNWD2QF2pzR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2MCBTYWx0ZWRfX3RzlWlqVilB2
 fE1rCmDSzCcOFc3PaaPipWlQzr4RV94VSyCPaHCfvFm89KKrbWXbmt3IPf3Wv5tgiKdXyM2aHMm
 frBC4u0Hs3A9fjhJ9LiFe4oEisfC91Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_003647_092380_00774F8F 
X-CRM114-Status: GOOD (  17.74  )
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



On 8/5/2026 1:27 AM, Praveen Talari wrote:
> Currently, on the SA8255P platform, protocol drivers attached via
> geni_se_domain_attach() treat each OPP on the perf domain as directly
> corresponding to a protocol value such as a baudrate or requested
> frequency, and simply request that OPP via
> geni_se_set_perf_level()/geni_se_set_perf_opp(). This does not allow
> computing a source clock and divider combination for a protocol
> requested frequency, unlike the Linux clock managed path which derives
> this from se->clk_perf_tbl via geni_se_clk_freq_match(), and then
> applies the matched source clock frequency with dev_pm_opp_set_rate().
> 
> Change this by treating the OPP table exposed on the perf domain
> device as representing the actual SE HW supported source clock
> frequencies, the same role clk_perf_tbl plays for the Linux clock
> managed path. Populate se->clk_perf_tbl and se->num_clk_levels by
> iterating over this OPP table in geni_se_domain_attach(), so that
> protocol drivers on the firmware managed (SA8255P) path can also use
> geni_se_clk_freq_match() to pick the closest supported source clock
> frequency and calculate the required divider, and apply it with
> dev_pm_opp_set_rate() the same way as it is done for the Linux clock
> managed path, instead of relying on a direct frequency/baudrate-to-
> perf-level mapping.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>

