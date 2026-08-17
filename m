Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F01C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZkwYYTlqj9ZHjP4hcwD6T8+fMjAx3qby4LJRy4G7ag=; b=Ial/0ul94mAZ/lqzN2bJCBnZX0
	UsM++Pf4zTPiXvipWrVgnJBw+rDe/rQuVVrJ1dvYkmKa5PIIvgilXp/qSD4e/UVNYvPqkF9/lzS8K
	7dlme4m0MLHpTvximAToF+2hW23wHgFRTx5Z/rxeB66I97pGqqKnH27UZcFWi+rl6DRdPDqgeV23f
	2f8U6sZVe0eWb6eAN7qzXYuFhInEKp2mCjOlz8KnmP/11JimL9ryxVtPFZ7g4oHLeNi+/vk5i1NWV
	Qgpe3Ktst/F2JVmh9Kl4ewuhYVPd+MkRM+UB/5wAesTns8pYvoJj70zFFZWiSNlgJ/oGTZlmaqiNs
	vLmqq0RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxGn-00000006CXH-2O7c;
	Mon, 17 Aug 2026 13:20:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxGl-00000006CWY-1EIf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:20:52 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6Cl61193626
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 13:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nZkwYYTlqj9ZHjP4hcwD6T8+fMjAx3qby4LJRy4G7ag=; b=iAgyUF+3adJhRbYC
	QGE5a7WprO0TC42n8ntx8pOcHns3jtk1c/RdvleDXLbxWyeuHEAWKExP26f3WpMJ
	8WuOH1KfektebBJ0kTeGsQJ5ahf08nQBKQzCk4z3gqQSwk9cRXKjC7oB91OGLH8M
	YM/UgjtyiBWXxv/Cu5nUZysGxtMMICPBVUFddbegHqK5WQ9KdrHVFh0VVx/0xTZA
	DjIKyaG5poFrRzlkliOuPRsGw774QCZE7UYLui+fuPYutBSkG+F9WwJO4RjJln8h
	ghPjnO0h5P5jBGbWi4d+4dfFNeMs6yg3HsvqVkKFqsy79AUYn1Bxh/nHI8SNgU4v
	nW9NqA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke1eeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 13:20:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51cab6f7517so2011651cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 06:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786972850; x=1787577650; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZkwYYTlqj9ZHjP4hcwD6T8+fMjAx3qby4LJRy4G7ag=;
        b=fX4KzQz9+1sENHip/OVHC1JsCrVT4UQAHbnjcJ7wDqOMIdMDDeVpLVJ8Bt3xPWQTru
         YRvY7t21BQiMJ3JlPNVYapdy4qfTHGUSJPGyC8QwaJl2ODQp+pZe6HzfGnNRjiMCT2pk
         hiMM/jtxaI4mQVaRF7odUSirSJBYAgGa6eo6bENGQCaZ4BSu8f+eq9CmxBF+XepCTRZz
         xT//qpy4dqB9UmbwCQiDKh3DQ7QX3V2+wpioG09GAGnw8vIpoCPK8CBSye7HNtV16pdy
         kXs1NvqbhAKZFrJSLHeCzIobj5r9uhtukUKh8AXrPkT4gacCSOuyziljS1nwi6zlbDaV
         jKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972850; x=1787577650;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nZkwYYTlqj9ZHjP4hcwD6T8+fMjAx3qby4LJRy4G7ag=;
        b=T9rPLgs/gpx5oCgvDyuSLe9BuSoj6Bi+5IJSqle7nUpZWBPFy4Gs1odfpOBIP/e7Oh
         U6KCiUWsGWdoEXDbQjTbLOCkRfTIgmQHQs7FQBzBiQBBXZOP+92iuasXG5hdFUkTh2Ad
         GarI/6vFzx/RYn+J6pXnOPDlQvd/8GZQA9mEedel1i76p1Gv2LWVBcvEm+/QJ4MPtHGA
         zUgQyTXZU9C6JS5cj2vuTBY1SKu07eUyPDWB6vltaL5IDX3NfAWtsQ3TsiXQqZvUCF9G
         dYjjfvFkr5SnvbY4wCecOhxPmaMM9z1itjuJQuHBP3QCVcSev467eg5rnSoOHney+xlT
         i+IQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr678EV6V5PSYr6vSzE5v+m7kSOawho8Tv2bwD52bpRVGA3IuXmEvKTu9CZKkmNfMKkzWhBb4xoO7S+2e/FEoC5@lists.infradead.org
X-Gm-Message-State: AOJu0YySjhKeFQjCEJsx1gJIOpKZs7qsQUSLOiFpazKrc5WL1mlJyS+e
	AVokUwJvW1chWzs/oO8J/UuSgmHG88iH1c2hqzhSYeTLSqx/WcIc42hKDALqTGRD9BWcoNj1c5P
	3vM+kNps6n/3xhdsxFaDKtiWoKCd73DIFMsdE46XTD4TyR0atijt2uzWPvU8YDNRNq/lSGFh4+n
	EHjw==
X-Gm-Gg: AR+sD116dASs+annby4S+HhRMtjRY9nlFBPFDa31rl8Zc9Vlf8kwkJM/yHqfti2f7Ck
	Z92ymPqzJZD0lAKr10GEBmZnPjEM1VES5qDeMHXExaadJC015nt1LMQM/qQ/RaScxyIXZSJmKxV
	kThQRXxOeLr2fuMpkAABBAGB+VjNi0FcaMua4U5fa9oKZYM7s4A8RutOTANgd2SCFIeSStKt0F8
	PRNSTn0ZCRaJ9uLfoZ3zUkHu62XuETnqd2rEsZO/NpdmAOeAOBJ3MU+odFPYCuq29R/qfvH/4JH
	w39EUAXQlWf/9YO/LEOwkpz+jwl/1vxhjAzjL1KH4Zi249FrtE/naP4AqZnFjW3btWPCPQKpd4c
	BN4Rxb81mXDmDK3bMK4WaLlUY
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr188197821cf.1.1786972847665;
        Mon, 17 Aug 2026 06:20:47 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr188197221cf.1.1786972847102;
        Mon, 17 Aug 2026 06:20:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea1e64sm60193666b.21.2026.08.17.06.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:20:46 -0700 (PDT)
Message-ID: <a7a7257b-b1df-41d6-bfb9-9496f00bb25b@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:20:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-5-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-5-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfXxjK9eVAUMcHl
 0it4A1oXJMI+cc8+uCmk28TTbbABQDjCp+3VoxlrnCm8PdYt6k9/16zsB5bNuCZZZFqjHmXUNNT
 59s7ZGEq8eRpVQG08kdBJmvqUhNaJJMQL8OraQ56DosJ63dSYIrMvrfaxRx29uOzjUsy0zqp50B
 kBKZ9pjbjKbzLMjPGNdA0xhq4Idzryd1pC2W17Mg3Pj7XvzGbxeQocB1AHYsSVaDAl+dbQSmDsD
 oP5AQY0L4IOxmrjzpaC6OWsgZt23d6/meWslUUPItpWj8qMzZjMxl4eyAeXMUV58yvmyTUUL/vr
 jyJh7YxOahLzdqQPkPNR/Ajz2ch91QX2UjIIBYqj4K+QFYwNjpqcBEkdpnxHTmD0oqIYV4Bjbm/
 Aup+IgRc6TFiHkNjaxcwqXSIbZ7/nSTDe69B/q+85lLeQ4H1DXOA3r9cb0WEo90PJINg0a6LlEQ
 hJQ5WzcmS1VcBo55/yg==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a830ab2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-YGGs88sVoTMC7_f4VAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: uT2f1EtXKpY7Nzp853XHnaJb1Y5iCLbg
X-Proofpoint-GUID: uT2f1EtXKpY7Nzp853XHnaJb1Y5iCLbg
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfX9XWxIutDrGfk
 ezQ2A7yyrIrfoIULuZG6gcwYQyQRqZhGkQ+/6Y8g4kqA1Iw0T7Vbqfff16bPYNiu65ZNPt2/pby
 noJs3d+CeZRHN0asc+cIVV22Zcch/Kg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_062051_456831_9520499C 
X-CRM114-Status: GOOD (  11.74  )
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

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the RPMh clock description for the Qualcomm Kuno SoC so the
> qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
> consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
> always-on variant), the QPIC BCM clock and the IPA clock.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

