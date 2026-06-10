Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41406CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 09:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Le2eGaKqs1wrESVgHiR9tSpTeg0Jhf156a3O5bEximI=; b=BREaP/n9eCqUljj7BZe12nc4Uc
	KLMKeZRJbn6g1HFdoWGFGF7jmNMCqVhLBTZvAatrSfv4eFYPKmvXx9uAYSkC/4L5m8lsoMIhcVEQD
	1dZmMZtgVmomPuqadlnVzR/KfaU3UJ7+pLBqv5WIt+4KWYtI/apEHNZz1TBoxvk4gzbcz28XdUGZj
	BGbEs8Qd0Gi11aMNiMvegGJAbyta5A6EQUnyUjC5X4iHx+AUvm4j+MKZuhYjuKRjxCaWQfgiiwDGF
	ECfDbqMLlnpe138TXeloQv2EpCVC7NhimXr+cJMZGsqWoAowz+uf6rInsU0aXtwfs6FH+9GMbqSPU
	JBg9298g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEnS-00000007ALa-2BZl;
	Wed, 10 Jun 2026 09:00:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEnO-00000007AKU-18F1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 09:00:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A8wo2V735554
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 09:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Le2eGaKqs1wrESVgHiR9tSpTeg0Jhf156a3O5bEximI=; b=BF1hBfslueaXt0VY
	P4FQx4bIcXcd4lhaSHSSNccxcX3o+h/Q30BWmOslrYYPt+4jLDpt8OfDJZEi8qK1
	Ou8uAobmtK/HlPDfcgqmZr6rL5fDwO9V9E+jPOheC742mVY957qhhUZxBFNr0/MN
	WfLcjLb8nykIg41joc1zFaFfl87dkF15WhrywqPQgBs44Yyp6c5/PYTpd+dLFKhD
	UduxC4onLnnsLDnFEOzpCBBtO50xZ+T0U0iNgw8SpQ7M8u70fjOHY62mWA4DBW9T
	fl6U+tjbn3JN1rtZueQjOaFufSWhGfRG1q/2LZnoQEjKgnCgMWQAqdpCvxc823CC
	EVwzOQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1r06s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 09:00:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915732517cdso88524885a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 02:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082020; x=1781686820; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Le2eGaKqs1wrESVgHiR9tSpTeg0Jhf156a3O5bEximI=;
        b=CC8ATP3V8gYcT6PY4/GejulFoQOhcAcJh8fn83amU9v0FoFJomK7OtIY3w2gvpYR74
         pxFgKJ02/sJfeSgpyXT+UhZ4qKG9z/m1Nldj2MAvML11AuYoXAtvtN1tRNSQXu1ppCp1
         6zsTGRUuvQIoJ8wA/iSPD/LmB+uYVnmQHzxddYzusSa53NBvtDIUUHeDcHlrhtXu4zXo
         lVOQnsilCXwfqEyi+nd58r4guX5LodwjUt2R9EGffIZEMNHLKvqfa5oQFNieYS8NmBxP
         fdDjNd3xN1fNM/5Lq8u8TgW1w7h3Dbn/Aj7bvD3XO+HJvKYMimipdpQpOPZEoL9wVgA9
         VquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082020; x=1781686820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Le2eGaKqs1wrESVgHiR9tSpTeg0Jhf156a3O5bEximI=;
        b=LCRxxOpdJ/+UeONxKeh4couVU6kbhnL6JeGqoiooPnuMCl9xHQbOcvh60FugiPlDxr
         AF0AWOH1qWEOv9xr8WECMPzdmV6hn8Zua9+JkRp2nhawdzQXGhSZsQ4cixUgNw3Dhy1/
         z+jhZeVKLZ3wf/mBunfq+ZxEpztPhI8SK5VHSYD28BzEy759lndt4Vn2j8cxE3AMl63f
         s/VsPOenIFn45oR89HkzoPgaRMO5fhbRVCBIPPcMey2xLWK3dXecgvFEgLJpaMrU6HV/
         P64tBjgEeE3VrJw/NR/tI+PeXUIR2tKxHm0kGhYy5G0cHXz2OOr+fOYQDE3AGBpj1jtd
         Jq3w==
X-Forwarded-Encrypted: i=1; AFNElJ+CbUkgP1NRzqjyZwLIrdP/OSYV6KI5xgwSHYdNlTyk+es/Jedh3pghgZ06eDe246VZPyjCuOBvlVgZyy3G2547@lists.infradead.org
X-Gm-Message-State: AOJu0YwokJLt4l90A1pjO5d3s/zK83EGACCzMFOAZD/ur+XeuGm7jcwI
	ZLhz64jF2h4SYawk1PiIzX+6fobKsewjJ2IZtgKFR0vsr4PMf1K3VXhBnrX1Kc3IIvc1fvWkQsK
	Zhdz4VW4PiYCSdf21+nj+m7EN3bRnEbpVdE2Zmce5ahomsFCFo5brXr9YxvfOKoqhtCNabzfEjC
	SUZg==
X-Gm-Gg: Acq92OHY4A1QGSObUzId2Wotx/mZHrPMtQdjMeLLWclAOB7I7n1mwfMLU9inaHYytBN
	EuQHmxY4oJf5pQzZ0T6oktcQ6cB9pdO1YM+jXYTRCoC55TetdYPo8/WsqQAmaELf2jxY5iiE3oL
	FbdYy7lhmWKTfcKeGEvCCeK+bjsev1rA9SF2sTHLlTl/BbLG+8s649WwLGjDq40DgiuTYzVpBz5
	bRH5CUQZgqU1Ik3BmtQh7Z3MNPfICOF0HqLKQHIkt2njtI/ns2Lm5VWXT7WWRKbLlqeeTW9jqdf
	hdTAaqCg3s2VtOLGqUbKRzFXfzA5pu8jzzVQ3e8OnAQtJQi64J/j5x2cgjkEU+Rt05/NB118VMN
	50iFSMIxifQJ/cBXLYg6OROFyVmEzIgBCwYo6s4BNJNh83zf7qWqw/9Mw
X-Received: by 2002:a05:620a:1727:b0:915:54b2:582d with SMTP id af79cd13be357-915e6dfa301mr618045885a.8.1781082020176;
        Wed, 10 Jun 2026 02:00:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1727:b0:915:54b2:582d with SMTP id af79cd13be357-915e6dfa301mr618036285a.8.1781082019481;
        Wed, 10 Jun 2026 02:00:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf41f05041esm750681666b.62.2026.06.10.02.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:00:18 -0700 (PDT)
Message-ID: <0717e0b5-b252-4d55-a426-2cdb81b1ddb0@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:00:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
 <20260609-clk-qcom-defaults-v2-2-0c67c06dca11@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-2-0c67c06dca11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UGG2Pjtb9khLRf6RnR2hZLmnGGGyc8W3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NCBTYWx0ZWRfX7KBAPi9/bgXt
 JsyMQ58W+mk1R8e5+FOYgI1bJ3vmki+62rcADgpbKlsvw6clUsR+baSFNXySVpKw3swyyesYvK9
 5YASDyhZpWzDa4HJdanIEoQcXrwPnQDTfGFK/olO12XABgtyRCyh1QPhpmHEJKDjbfIs21GqLYV
 uYiaQKlSkvwLm7X8o3ND5uypuZBJiRSAYFwS/AaMPj9Mgx39yqD2z9OCdSdg/bz75uR/5v2BO1X
 NFw8C45IofQAh1Hot2llCLAjRJ6frKW4+C9mzcsvFIFD3rBz7DLZW/Rn+wa1ApHAPTH+tMGfEAw
 xbiwfN3RI8oUoWuFltll/0rduPDPrxJgzkpElI/eABaN+4S6M6pFYDKSuidMPYqR4+9Dtyl3CNn
 IBgf3Wxkcwi0+acNGvLZAptYQtiEUZWfbYMHFPR9uIjmzcP4f5/nLhjLDI8URmpx4ifnXGtY826
 BldXpfCyaEpEmFi3MZw==
X-Proofpoint-GUID: UGG2Pjtb9khLRf6RnR2hZLmnGGGyc8W3
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a2927a5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_Y7Jz4vysGH1ZB7Bx6UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_020022_326644_7B5CEA87 
X-CRM114-Status: GOOD (  11.04  )
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

On 6/9/26 5:32 PM, Krzysztof Kozlowski wrote:
> IPQ4019 is ARM 32-bit only SoC and QCOM_A7PLL is used only on SDX55 and
> SDX65, which are 32-bit as well.
> 
> Do not allow building them for ARM64 to make built kernels smaller and
> user choices easier.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

