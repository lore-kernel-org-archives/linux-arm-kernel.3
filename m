Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB527E677FD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 16:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJ0a5V29viz7LLXs2uuLzoheftdEXYHQbwbfYUs9794=; b=zRMuglfVI6kl6tJzq9hWOstnIc
	HrqsXpJPdRenozUxCNm2nqKnUKqiLnHPRivGK+GhS7w/31eIZPlSzTLWY9FJEeehMJJcamWhpQQz4
	7a350HYU1V2TlxvEuBRnXqQwQ9nvbKlkc9bGTekcWb6KYBOtCN2yjM6uERqoPoC1cBwmGi9W5JYox
	tKytng4lPC/4bljs+3nYuO6GjAFCXAYecBLActI06/7y3UF0VK/sQb7qFPjkkYztXlydh2iNFcf7y
	0krGEPLcl8ciU19K11FBAQ7DpN+uIg5t14duC6gsC2zypBttw2ahOOiEMBwlZ+6C+EtdKg3yrO4cq
	NqR0oJZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXjEG-0000000DznQ-1xlh;
	Mon, 22 Dec 2025 16:57:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXjED-0000000Dzn3-2TAU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 16:57:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMECba11390185
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 16:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UJ0a5V29viz7LLXs2uuLzoheftdEXYHQbwbfYUs9794=; b=RflW7gzBBE8Aopcg
	DvCZI7IbiXVCNW7maGoHbDhOPdXXItEJS9JKBKx7VvZHYApwi8PyGEHIrOfw/U40
	WTFTIgxbc8I5gTkf1znhAyzipdBmzkm7BLCZU7Ia17gpDq1fNX6w4hi1sYq5oZ9v
	KAUY4EIkc50QyzENxOJHqGuS6l2TtX1xyT3cV78jFcQDmfwZp3xLeKdfCahJ66bS
	7H5J1I0SB56FwdK3be11GexQ0N09AhnbXOQzzMKxYEXg/gYIiK1UHUkHJsZJKAfR
	fXSWl11t9AWcz+AFXpXbPwjhmLe9PMk4oZfwdOoUzxyh7R0T32up9wAZl2sKDd39
	2mgbVg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b6vk6jekn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 16:57:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaf9e48ecso111176341cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 08:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766422668; x=1767027468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJ0a5V29viz7LLXs2uuLzoheftdEXYHQbwbfYUs9794=;
        b=hqf5KRn6aXvQtUtmfR/da2vGZAtV+sBWuII6MFjjdIeuV6ir81dXhCeqmToSx9aTc4
         rzquKH4G5ieWyo1NeAXgsBvJUa3of/PN80WOf0nCNKP5+QCGwq5XOGGAlv1Gkuf6VdV6
         FtGpdBp13tXvyzVzCJHljO/oVVlEmm5J4ZPsTpa4IlllmWIKukLyTfcNYY/g0ITdDeYj
         i/1ESjQljtp1M71t0iinfaoozPO9RlUMd4qiJYzLeXDDuQrx0zoUQoqoz/d/doYM4bZL
         GswbVqJqJE1YfUGwu21TGcp/pbogAc9YzFsOtj5cJj2RgKrdFmB2xEpbOw9MAaB79sKi
         e2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766422668; x=1767027468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UJ0a5V29viz7LLXs2uuLzoheftdEXYHQbwbfYUs9794=;
        b=ByrJhlrdXTRXiVyJ1bySduEeE7xZ/EoZk0wks6XA/GBFccYTU9IVrBngR7+AwyYYh7
         Sbt41OZvQ+TIDkm1eAfJLYRp4RseTUTR//qqifCIoJ0zI5BOIINK0YrSs8isSb7HwHF/
         owM6ocbrfUaKkJUpbWmrQqXn8YCiGHpqfMoBifOSQtP4cm8ACz8JmM1MGx6d6wTqOywa
         MPFQkrknta4VpuIauTjZmpQZAvFo46Sgbl7GI/zdN7Rjg9f6pDjINrPIu8fpMc6ZZhmI
         lSUIepfCpD28ARZFqSr3irKYM4DBcfGyolo4lqmvMTttl20B9hKCiXzF3vsRbLET7LVI
         NlIw==
X-Forwarded-Encrypted: i=1; AJvYcCXPZ/F5Ic2NM4i+uBMmOHhi+Bj8uK+gI5cdjZhZemG+Tx3P/0Rou03lel5ShD9QdE+zhPoeVJwmGOnJIbm5FZwA@lists.infradead.org
X-Gm-Message-State: AOJu0YzSAs5ppa3Uciqq1No0SR0oODMactZzpGYjVZ9id0YEor5vLZ+u
	Eec5Azu+laYIfxKIxVOiF0ZXFjqbMLqBmAdqcn2qNzjnbKpcKsddva6m2jUq5C/IQ8xA2Vlsxkk
	9kEWSizDIP5egnup+4VdAkJ0y2VKX7bEwd9bKkltr6fj/FDV+0LH4Z9PiDUv+e8Ep74H6epK8pi
	PTQg==
X-Gm-Gg: AY/fxX55HcqW4BQ2pzajUeKbbm7CqK/ZolgwrCwgDMh6FU7lRUzTUzVflUe0ssbzbjg
	SRo9GOqzX2nZ8jvmUofwlYtrwjlmVAEbMGugwWpv9L+69nY8Bcwv24Q/minNft6aD1R4RGw+erJ
	rfZIuzCd5Smd7jOSzcZB0h72W6IXQZiXxHpd+AaBbRAX7SKj4zF8TpbLlVJ1YWaiEwuZvK2MY2s
	7Wfwj2gdqbbrUujqjcggS+dV0WWJ81NjpTchlicO3coIJhgHdU4LdkSMcDxgAhd89wGK9Qz24j8
	cYtJFGkyfFhNgQ8Ccl61O3/g85fNSZfekKD5wVByYFXpqN/MZtiKCGvbbjCa/ib7YX0qjO6mggg
	aR7ti/aKJIGhiNkTj/c+rXZrkfZznIrL8mqD4OSA=
X-Received: by 2002:ac8:5812:0:b0:4ee:19d6:fadd with SMTP id d75a77b69052e-4f4abcb5a4dmr178429341cf.4.1766422667658;
        Mon, 22 Dec 2025 08:57:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWZF599NsIynd91SWFwhgXiDj4KAvOYt3rbwctNuUe4W1B3LixKxYkgSgS3/cdAjsy77Bt2g==
X-Received: by 2002:ac8:5812:0:b0:4ee:19d6:fadd with SMTP id d75a77b69052e-4f4abcb5a4dmr178429141cf.4.1766422667183;
        Mon, 22 Dec 2025 08:57:47 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:3452:ec03:2e24:c9a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193621c8sm197464795e9.7.2025.12.22.08.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:57:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v3 0/3] gpio: Simplify with device_get_match_data()
Date: Mon, 22 Dec 2025 17:57:44 +0100
Message-ID: <176642266266.42223.9755579914845515277.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219-gpio-of-match-v3-0-6b84194a02a8@oss.qualcomm.com>
References: <20251219-gpio-of-match-v3-0-6b84194a02a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jThymCp0GcYVVIi0-ocIQ6CvPHUutU3x
X-Authority-Analysis: v=2.4 cv=cuuWUl4i c=1 sm=1 tr=0 ts=6949788c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=BSbm5AsyGp5ZQscXBokA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE1NSBTYWx0ZWRfXxYaMYcqjUAIs
 PQPrOHBwCkfsoaEC0mQsW7vsrfkyxHG/oweMigm8zZudSw+55Le9L/ZYA6eM9hbqVB4K3erAhpO
 Gtuxb95NASonwq74ACff3oMzwReYmHzO4/FRYdordDgxSA4SakmMfCNioTUaqIIgM9zIKfqtpEL
 mrjfV8IizHoPDu//EeSyxWdapFqYAtXL8FyYD/4TSYPqWpIba/2XqfPodzu3PN1CpQzje+3MPJ7
 fGsjwEL8/k2dz87tAICfZoGswCEUialbmQX6BOJ2Hln5tsgd2PBP7lDa6ZXbBjAtvNNknFHzGHZ
 fYvNRI9nNIY3Lqe8HEWYWqKa05YnUnPs6/xmNe34V4Cx4VRzxgVzuSFZTx9lOnia48bBQtyLnee
 k+co6KS22/bWNsDsgE/9P3wHgZv7oztsy1kwbr9ewKCHw9/M5fX6Rf786G2P1N1KFbZ8P7G+V8m
 d7yaamYirCz5MC46j6w==
X-Proofpoint-GUID: jThymCp0GcYVVIi0-ocIQ6CvPHUutU3x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_085749_636637_E4376F34 
X-CRM114-Status: GOOD (  11.47  )
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


On Fri, 19 Dec 2025 13:13:11 +0100, Krzysztof Kozlowski wrote:
> Changes in v3:
> - Fix subjects and commit msg -> device_get_match_data
> - Patch #3: Use dev_err_probe
> - Link to v2: https://patch.msgid.link/20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com
> 
> Changes in v2:
> - Drop applied patch
> - Use device_get_match_data() as suggested by Bartosz
> - Link to v1: https://patch.msgid.link/20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org
> 
> [...]

Applied, thanks!

[1/3] gpio: aspeed: Simplify with device_get_match_data()
      commit: cecf10b700e06a2f2e2b638b1f680e1ae7f343ac
[2/3] gpio: creg-snps: Simplify with device_get_match_data()
      commit: da7c18a457c7a32c4ed1e1e326837d9d7cb4483c
[3/3] gpio: zynq: Simplify with device_get_match_data()
      commit: 48befae0d6eee275c3e30d1cd45f39d6ba011e19

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

