Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D77ECD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 11:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rpim49/9WdkusfcuWPLHC9wP0WlUFMokl1OdzIGRcNE=; b=mLNOd6mWiXm2KnPkZXYA0yHwy5
	nb1RTFMsjkNHXa18Xd9l8HfQMqntAcZTee62mLpY8KbprPPgy6KHqXCiURkmlVDOod0gmEk5o43EP
	/hBHy3kTZ+oYHmxSQGpp0frUhl3AsY0rRde6ZCb1SR0D6KzZr94qH4GROqMOqdaqAcRPlzNKGXVp4
	OQ5gkgI0GZl/XofJeOakfLymrQyXPFpsE0MlAqQIYKCuQx1xDnOAw7kKieufrnQlkXzPjZGJ+9+0I
	sVpdnX3zK1nZ94a16qxWncbHijn41hjK0gVdPXuVQsda8IHyD1ZCGctIRORBOjCYXSHX94JC9m7XG
	8alj9NAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTDD-0000000H2jI-3i5w;
	Mon, 25 May 2026 11:11:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTDB-0000000H2iG-2V2n
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 25 May 2026 11:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Rpim49/9WdkusfcuWPLHC9wP0WlUFMokl1OdzIGRcNE=; b=Xec2QEtX8E7gXUEQ/DSHC+8EIX
	4JXgCbi2E61djWLSgLHuQRBE0RBfHrev2WiWTzbD3kZBx3uWvk3DocJlSfTcmmwPDqxfEcue+LJV7
	9E3sgqDe4vsAH8iK+e/zYNc/jOwa6MBV77K3HwjKL8ZaFwjif24owxa3Ty6LvsQTzjxclUUNFoRGu
	82cd4cA1gT/Dc2e/Z8gWHqrsmNkNXmOKC2mJOUdqChiHTalczOZzU5H8RKik8YLitR+a7tWxTAVXN
	ZbfBnYUo7LfwRQAqA9SdZp1GtV+NCasO+IyglXiNLYd2UcPhYWF260qs2Ts7VterwhHcberjNje2b
	vBVik4HA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTD5-00000009517-2m9P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 11:11:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9cjRm1802487
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rpim49/9WdkusfcuWPLHC9wP0WlUFMokl1OdzIGRcNE=; b=F+iK/DyHgs9tF3/R
	xIgvMdE+uOa8maNLI2O5rZqGacAq1SQKCEkuofJGLatYr79Cl42YxJDQT3yFhmaG
	W1hxabQzGBzPNP+HXTz72nn9zmcgHFmv4u09VE6ZxJLeMYljt6yMoMn6wsk6OsH+
	eZDzz8GLZkBE5Xt4JWRzrjfFdkGiQOt7Mq6C3c/UJ6tPEwBDCtysSATEcVJwiwdR
	fPU2wR/nfQSqSL33qi5J6EGVctxmuOIV5YNiblDEhAU74LEhUOUwrPid6qoRQNwf
	GqrTtZ2VhWlnJEQ68OSsYeQAS2Z5t6q3m12B5khvrMoB7hMJltkkFxJLL8BzhAlS
	eSDuHw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqga1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:11:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c850ff84ddfso6216842a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 04:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707459; x=1780312259; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rpim49/9WdkusfcuWPLHC9wP0WlUFMokl1OdzIGRcNE=;
        b=D/EsEOfWIuTsB24QBxoVij2hwTwYpxT1F7lJPsAb1Uxex5vYq1TYZ9o8Kh/SoZEbJP
         CJDwLZ6iKU5yHah7mgolg67p0EWGZS55UUSl7hh+1xBrlzPe1jWSK2MCyzzMeS3zLck7
         rEIXRUZC3noGuNHQJu1l3Y/ioZv/vFtMaNpRD05FYaWaHzy6UavJLuo4wYLyG+FqwUzy
         OIr2361A9xiWgMMYIOhB3CFQ6Ll0FX0KRlgdBQ7yWnIcyZfaIyLrn29BwJODazlZidp1
         kyRJzgy+V/4CyD7VEjse1I3JJAf820GBSA8v3A0nIcxCHwlytCPn5cRd76CaQre9aUX5
         Q29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707459; x=1780312259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rpim49/9WdkusfcuWPLHC9wP0WlUFMokl1OdzIGRcNE=;
        b=HpHlu3smofKptLBUi6taecamxJ+fh6GX45WSyRneMoot4AvOxIUGz90zUUc8HZ13RG
         xHeaUgdxlgyX6HPl023tQmQp/V6tBVzP4Jsqa5Us0SuJem+wkve7SdhaPhdwXsa+qVOV
         Ia43N5lSpUJP8wzdsLIMT8EJT+KFWu5GutjM3uMKIIHrPvNjD7akTGt4SrQCa32mf1J1
         ubDT3GgJgXLzMB49klgtqaA4VzgWnfPsOvbwF+hnjHqxdbRqnNfht/1b7O52SBFo3skD
         AR7MBAfnK3c9LAzvdKl/ixHgKP6kOpO/1UPEBQ+GtVaomL2f36jVH0tP8SA6xRUvzSo8
         G4mQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2LQIvSqobysAw3rzCG3G93IuUN/McIhrVdPjRqAGc2bz6vHFEw8keOvqIK0pBLjgKRvHKsYWpjCFxdnjYs6fb@lists.infradead.org
X-Gm-Message-State: AOJu0YwF5rzardYv5hLlpWSnREqzmvuybg41qHrDcGHA1dKTsj9xL3gG
	hiRFLNMQ86t8K2l77Mdu+Lbv5TaPDQ6dVSWrDwI/y8FkJlrtI8VTHSOYvHfJYKNU/4DdWRbCqn4
	JRDlf66YJEExJZy71Yg8wwE1fnuwjlAuKz5jNIPsNruunAnJe/1R7WYGtTF/fb0zFYZpilfLiU3
	x/Ow==
X-Gm-Gg: Acq92OFBqHfqF21kFzH2OPWERQnMcwPKphU+AKZpd2S9AVpuVwVQgSXIJPEr9cymEc/
	Nv25nPt4cejEyq4PHkZ6GztcmPsQdd3F5GHVzPjuIfBqEu5aDU+G3vcdfbj/mA83mwEhkmflpAD
	5mpuqCofhcoxXgqELFZqmB4RCF1R9H1Tu+L5rA+1nC9elUIymAWFjYJHdpHO9uk/HMNEguOIlih
	heE7KvgMSGVhh/VxBlF/z3wvQM5C/Hw6wcfCTEH6iGs56wd0NpegmAqYqMoDKFdZWeJ1vuH4evd
	sNdQ2amPcgo1y66bT6rE89ui134SOwjwuq5wzqCZlG2XgU8knSQwn/GbVpR7BtiDJ0yFwGRXG1r
	F4/vd1DUVdFbqqegxJoxJgwiklZs1+Rxa7XbjePu4qubRxMe4Rgc=
X-Received: by 2002:a05:6a00:4c98:b0:83e:2c38:f5d5 with SMTP id d2e1a72fcca58-8415f32e0edmr13028187b3a.28.1779707459075;
        Mon, 25 May 2026 04:10:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c98:b0:83e:2c38:f5d5 with SMTP id d2e1a72fcca58-8415f32e0edmr13028147b3a.28.1779707458574;
        Mon, 25 May 2026 04:10:58 -0700 (PDT)
Received: from [10.218.19.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164e9e7a5sm11795662b3a.33.2026.05.25.04.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 04:10:57 -0700 (PDT)
Message-ID: <ba038bf4-d1bc-4e20-b4a7-ad24de760962@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:40:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] crypto: Delete Qualcomm crypto engine driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King
 <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
 <20260523-delete-qce-v1-1-86105cd7f406@gmail.com>
 <7rgfuvv3hai7g4wt4accbkejtzdt5dnb6mkj6x7ox5sz35q4n2@h7j6rr7extuj>
 <66317f6a-645e-432b-ae11-8f40569d4117@gmail.com>
 <d97382a6-6c5d-4a3f-89cc-3ae9b432de3f@kernel.org>
 <20260524204537.GB110177@quark>
 <e36172c6-4424-4b77-9b3c-47dcdbdff05b@oss.qualcomm.com>
 <rb35vwvusd733s2zbgsitof3cpoyyfope4cpeh47xldw27ufix@7fm6bgr4wtkz>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <rb35vwvusd733s2zbgsitof3cpoyyfope4cpeh47xldw27ufix@7fm6bgr4wtkz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a142e44 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qIDEVUpatm5GnGNPECcA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: OElgD-eW4Yk2779nJwBUQTQ34x7YYyto
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExMyBTYWx0ZWRfX9MCNgdJE3Iq5
 SgTGl7FIgjcPyvzDH3DtkhCLRG3lRzwMJZT2mmZ+b0YhLLsGGeb7agCN/mk8oseZG50bAC/nCns
 e10zta7TA4vYYFuD6WZZqwTVxaDBmiky6mGL+cXhODHkPQD2PcbBeOaIZQCSELrWkrJ+Cg7RSv8
 lf7GpImI1aSk5yAGVCZSOo8zy0Z9wDJG/ewEbPpkhyDMyhkLrzu4koVNQmzYpJcQ/mq9/Sgp7JJ
 n53GcXfOrsBQWgTCk1YGVcfbGCa4wonMtInvbmp/HgYUT/lpqkqq7okYr1Mh7pE60KHoxaSVS8f
 2nlQqTgefrFr5wIkd2vAwFOO+fm00Vu0KH+ABFw+ZP1iB0L4M72xM2w/ogEfG7O37LraXZWIEdi
 ZdJyTDA3noX2G1gpFmlDSmJMLUZJA2Ws/eKGhrDwiUg2l/+PZmNftIo5fZfHo8mao4rhWZY2wtf
 S0RJUH9t0z65PzZnw7g==
X-Proofpoint-GUID: OElgD-eW4Yk2779nJwBUQTQ34x7YYyto
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_121104_234484_610D0DCC 
X-CRM114-Status: GOOD (  22.34  )
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

On 25-05-2026 13:41, Dmitry Baryshkov wrote:
> On Mon, May 25, 2026 at 11:59:33AM +0530, Kuldeep Singh wrote:
>>> This driver is more than an order of magnitude slower than the CPU for
>>> both encryption and hashing.  See:
>>>
>>>     https://lore.kernel.org/r/20250704070322.20692-1-ebiggers@kernel.org/
>>>     https://lore.kernel.org/r/20250615031807.GA81869@sol/
>>>
>>> There are many examples of it having bugs as well, for example see the
>>> second link above.
>>>
>>> That's why it had to be disabled via the cra_priority system.  This
>>> driver was actively making Linux worse.
>>>
>>> This isn't particularly unique to drivers/crypto/, of course.  This one
>>> we just have data on, so it's a bit clearer.
>>>
>>> I've yet to see any real reason to keep this driver.
>>
>> https://lore.kernel.org/all/c1697372-54ec-4f57-85d9-ad375ff1a44d@oss.qualcomm.com/
>> Kindly check my latest reply to the thread. There are numerous usecases
>> like DRM(Digital rights management) coming up and qce driver is required
>> for secure content.
>>
>>> Crypto drivers need to be held to a higher standard than other device
>>> drivers, as well.  The onus is on those who want to keep a particular
>>> crypto driver to prove that it's worth keeping. 
>> Sure, I'll be working on stabilizing self_tests infra for qce.
>> Kindly allow sometime to go over failures in crypto selftest and will
>> submit fix if applicable.
> 
> Why are not selftests a part of your default config? How are you testing
> the driver?

We are validating the driver probe and kcapi userspace tests while
validating qce algos. Locally we update all 3 algo priority and then run
kcapi_convinience.sh test suite to ensure it picks qce algos.

Please note, previously were not aware need to run selftests suite too.
Got to know about this once issue was reported.
> 
>> So far, i am observing 2 ciphers failing(xts-aes-qce and ctr-aes-qce )
>> with CONFIG_CRYPTO_SELFTESTS enabled.
> 
> Please make sure to run the tests on older platforms too, not just the
> latest & greatest.

Yes, will check on all the platforms.

-- 
Regards
Kuldeep


