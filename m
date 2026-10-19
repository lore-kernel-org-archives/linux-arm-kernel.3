Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA18CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 11:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJwQ3LmwPXa1BUiwGt4fvNRB7J3oUm4v+8tRT0WON2s=; b=ETSMQRe0TH79RkdASe11eHHGvA
	i/xnYVTn/Uusxf01mZXF2fxrh8fIstJBJmBFEYxJXPw/aNRwhdx607lUU4GUX0JvQy/0g4Um1VyqD
	y9IElXLMBjCS8R1a7kB0+TuzgawgnZwLidjJcJPaLwgCzlqbeHG1eEdGh+x61oL9zPGWdyKwlkbWl
	ApYUuNE7sLHB9f46+8Id21zc6Ark5bk13RimAiNVLRxXScNpXJDW2cnGPdGcvGEQBON+YMsg1kevG
	qnCAIPQza26UsaHvtRpRt8gKJMo1MEPsyIoLDhHWfyzz/9+7Z6mCs+okvry/3tNe2+CW2RkClfYso
	RHr1CD9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlOg-00000007HKh-26CK;
	Mon, 19 Oct 2026 11:19:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlOe-00000007HJ6-0XFn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 11:19:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OoYN3256577
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 11:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VJwQ3LmwPXa1BUiwGt4fvNRB7J3oUm4v+8tRT0WON2s=; b=aqaz8iOU66AOsySE
	3bxvHMMq1Y3zs/8NhvncfI8jRm9FB+fixr1QBQo/JwC0L13/5QYH96xi0ABqUb1K
	gFzNpXV6yuL4gb4ThW0ufT5xXu4bCGkc9dXypvzolNN+15RAK0zJcyoaH01jGSIq
	PLwa5s3zWSmDFEZ4Ktn0L4imOQHMsDqqcKglaT+vuAp6iA/LuJeMRSUH7Hj7NkZ0
	FHmySMftoSkEDSaOowMpBb+OWesW50ipy98tsT3E8k/c3hzSwgUfxvv3h6lTGjf3
	8oFpZhFItHAVpKWAD98bzYTTQKaLMU+8uLGdc+c1AJr3G91lUTZ7uKo/oGalGBKG
	AzHPew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f8sxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 11:19:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e58614290so28199885a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 04:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792408754; x=1793013554; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VJwQ3LmwPXa1BUiwGt4fvNRB7J3oUm4v+8tRT0WON2s=;
        b=c+qsEueBWdjUr4O1Zzcmk5m+PcHf3LmtCrJO6LgYARJ0y4sMC/AG1xh25vksWK5PG6
         Mt2xpdJ474hNIQx052L7YeaGHiUu41vDqdhLkK2XQCQdctx+g3A4hp2ZJf/BBAkAjBL8
         C0gnkGAsRd2XahF88WV4TM/XgybaA0fNBTztkV+fDpDFp2tr9MybCwD8NTpklVc4lgcV
         Q9IX5ZtECVtS7OwIEKlBeYJuyKBeHdrp51A5NW5fIvylSm1+uwycv+LRts2G2N8q/Fq3
         4yuYRDwCwjP8UbTBesmqa+bqYGnm0DIETYlxclDjSohGN1HnclJryxLoCMrAG0rZoTVr
         YTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408754; x=1793013554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJwQ3LmwPXa1BUiwGt4fvNRB7J3oUm4v+8tRT0WON2s=;
        b=zaoRCJ7tty9b+TFfRsriAv8x96xJhTMuFvd9LLqaHpJUbCVed/+mtXAVJBcCtF3FKH
         ceK5sscv63LqrbVMS0M68GFgAEk540fpInT9VckssBVAeXDDT2NF0rzFroGn1o/lspc9
         4PTNVuvksK0kyVFMmWryyivu0U/JatTv/ogA3HSMYNCjwnEMuESZU7L2Q8bCJwH6MwtA
         m2EQSSYSTL+Yao3x52vlSi8EGZyEpG8LlUkTj/iU6TRR1tkZTTn98fptqh2+TLjJR/Ix
         N5emplb+hnjdHTYCCTAQ8PIjyvHdS6DrW0IQAZmZ9X3nVrK8rL0llCGJJQbZSD53MrpT
         v4Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwd3wOCcokgs+jh4PNihha5TY6wg2vIDxNHaJWCErmIywjRdWeWsiw/zaBsyVPm/yvy97GcjT1wdjdA0801kr/b@lists.infradead.org
X-Gm-Message-State: AFq9FYIjW+A7Cj+amlU1/GOniknssuB54OdcRc2NeOvTXFVSKUqWaCgt
	H4+d3yDLWhZZme05b+JKd2C76wiOwYs7vJbw680H+0XC1B8IYkN2ayl2R+6KTv7GIZ/nLgesxMN
	UFVDpJljdARWjFFwd6eCwuqN+UO4+u/6UyYAIJdDssFT+0xvaLWz1xqETJ2U1623xsT+rojOzXI
	cKx33SkAlXGg==
X-Gm-Gg: AYBFou3ANatyIejZQyr8ppDZSXD6Lrh4Wu3JTpwsls69gJwkH/vgaGgm7YsTuE398jx
	WZ7LuZ6X9UrK9ArSdrBglALt/jX4xQ2Arj/Bwaec5qCpgsSe4qzDrbqtI6uJkLhIUc5byPe9nPp
	g4+8o4VNUHHZyQRBCACeO57yKBfRnsOSyAj6zwkyduGztVxrN4Y/c4Uf/NBRNGL75JGH4q+T/+n
	MK9+XcxgS0QBizqqNGG+HIMWjbRieiFBQuiX5UhhdwJYFHlkvQVGEPIrAA/s7Yc1CKZfS3dSQVv
	AGqn6iAMBEa9F7qIcw/JyBhyG42BLGWp5SsyxhRzndBb6kh5NKB/GXvAODoVJG4AMMfNA9IQ+Ex
	BVgWqulYghiJWU+dwJojGhw==
X-Received: by 2002:a05:620a:2948:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f29dcd9cdmr1236981085a.5.1792408754567;
        Mon, 19 Oct 2026 04:19:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f29dcd9cdmr1236977885a.5.1792408754046;
        Mon, 19 Oct 2026 04:19:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1eb8dbsm3646220a12.37.2026.10.19.04.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:19:12 -0700 (PDT)
Message-ID: <d4e2fcfb-856c-4fe9-b0e7-fb8df4dbbc15@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:19:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] irqchip/irq-qcom-mpm: Prepare common access path
 for timer and pin regs
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-4-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-4-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3bDjKmZaJZEIbAzqLNLvJoRkChXmMi3l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfXxibr2iF/SsFF
 rtmhEloJ9sVNW5crUVOsfir9iPJXu+vETiVsWCnUoRhr3S0UBw1j6GASHMAum2VM8eHxxDA6W4B
 mgdXDzZgUhXj2OYciahcPIZXo3Sc5/GHhcTwn87rADTBVXk+BqlRo8hrLDShyrASGppBdWHVOTo
 +5Hyf1ixVpNI3uwzm+31Qb1hL3sfR2FbweSDT9AoYNYR0V7c29pExkgogqSbjiB95yVt5OSj0Fb
 WyHjtvvRcVa/qe7x8vMR4Y8MIlqkArjfk0GOGHHkFnFPmk3mcmGvzlRlaYKOjji3US6yc6tr7Gu
 1eOw+tKGpwIWyrArgHE4WdvpZkTV9OeuinjCPxJ6mQ4W+eHp0vYUgI08hLQ2vo6Qr6av1ZtOWIG
 t5M3OHlHkyyZ7iKZsGZrRBxU4jJtsaVPHfzAhOiGBArBAlBBrsEDqvuGTxU6IBElL4v/BVijeSp
 u0QC0z21mBLmG7XYwiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfX57wSk9popB3c
 iHssClsOY69xmx4ToIwef4ooGG9DtzH0z/oeYWOf0SW0NH0c2hrWd5Gow+xDEYtA0o4QnFnLy8P
 rQOWrSqMaoh04IentTYjMs6ib+T1KPA=
X-Proofpoint-GUID: 3bDjKmZaJZEIbAzqLNLvJoRkChXmMi3l
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad5fcb3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_QkEx9C7_NLcMqeofcYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_041916_180847_84554AC7 
X-CRM114-Status: GOOD (  12.96  )
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

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> The vMPM layout starts with two timer registers followed by pin register
> banks (ENABLE/FALLING/RISING/POLARITY/STATUS), each with reg_stride
> number of entries.
> 
> Use qcom_mpm_offset() as the common addressing helper for both timer and
> pin register accesses based on that layout.
> 
> vMPM has MPM_REG_* values represented as contiguous register IDs,
> hence replace the macros with enum qcom_mpm_reg and modify the accessor
> helpers accordingly.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

