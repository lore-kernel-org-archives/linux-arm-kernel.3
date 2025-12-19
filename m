Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11612D767FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 12:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUolEG07YuA8naiVLt7C1pto13E5WsEaNtMVembr75w=; b=XMfsO6EbBiUvWDe/TQxTBXumsB
	cYTA+bK7QexThPPRUHR7jt8FJAyzv0+ZA6uNMie4YGiNn/aLb9RXSQbLF4wLQs9HO5zRpv11i6/3u
	KxYfU7EORbq0BSiGGWDE8ib1xNBV1NuV4tSGnXLxRPTM0+MdvI6X221sCuFnIkIYgMXINAHNrFoaN
	bqcTMh47SUuqhn6FtcjBzI2kos0VIBWl8JeRyTuPdKVAUAlnv0clOGLNoGDs0dJvXtQ/9wqCpEbxO
	eJS7BkOFc9tYCLl9Pb9rH/Glk1xidIec8PBfXPL8NGGj7iX1XeIZOf4f9pfGa2ybOOkRClj2KbFkY
	954qTsxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZJB-0000000AG7y-18HO;
	Fri, 19 Dec 2025 12:10:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZJ7-0000000AG7a-3Ckn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 12:10:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBYODj1772078
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 12:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tUolEG07YuA8naiVLt7C1pto13E5WsEaNtMVembr75w=; b=ez6nQNFHtFElylYI
	CejLvYIDmesxKQNdLPRZrlOlIcLXgBTgBzymhItffriRO1rum38dJuyNDnlMVr5y
	dtwOYQ+5owUkXGrpp5lFoGvtcpJ8/qMaw+dcFPi41+DjMJtkFx/Kaj3wBY/o95xe
	7+/GsOv82CxskzwruoTS89fZ0tF0LkJrKgFik3gl3j9k7tFGUa53V1ZjiYYaQNLi
	JoaqVNPjVvwpBikY5MqQm9c9IMvtzq1BY5TCFtqbpM3bwMQ4lUm8+D45nC86KFk3
	euGqKCyNB2aCoEXTeXgKCEt/cUXsuJQiTwiVR3WnlTLlogkdw5LoVjjlX7yEJAn1
	VSKLOw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2bjk1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 12:10:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edb6a94873so31747801cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 04:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766146204; x=1766751004; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tUolEG07YuA8naiVLt7C1pto13E5WsEaNtMVembr75w=;
        b=j5PEEyNuqxFyzT2LTP//MO9UWInINp4qlUoNEXM6pi9Egbmr9XDf2SxFLGcKkUtkWu
         4Jtbd/zdrOxNEZmW9AeL06XJ2SnL/IUiko/eylFNsA24QhGya7/EyrVY1W/+uwbnZUzo
         H9+Rx0FVglus8mIbEhvd7tf5KGjxrIyq6OysdKGalt2ZqqTwltZvkKNXAKtLepI6FXh8
         OO63MUq3jH0Y3zn7fq7y0/G1/tGG4JzMBwQ738l8YrrxeCsYCqVG9ijvLHHO2KMFQerD
         qPejYWk/PXumD3owUJdvCqIOf3uHO81JCi1PZ854TRh8COwKIWAAtRQFspCh/8QrNDYW
         zJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766146204; x=1766751004;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUolEG07YuA8naiVLt7C1pto13E5WsEaNtMVembr75w=;
        b=btDZC8yCJ2kS/aNq0IMbNz+owbtHzGFKcmREH1DIk/jwPJFgMjpOHfCTB0dczDLTjP
         iuOroQSpBqkpUUHUmYBhjavIY9mxNO7kVikxKsw0J6Nr6DgHXkgmTYDO8kNdUr6Gf++q
         EfOmDqfPbIV3pHmWvKuobvJd6GzANojGY/a9nnG01b7awwJRzDwtq6wZQVSY9tIRgV7Z
         aKcUCC8/8XOplA6xG4KnXGv7BgXKvHitKXpQ8PC2R4Y+OI0NpDlpKyDaPMsT9u1W2yPA
         MFPHkMkF0Ru4vbpCa+vQD3IF4fqeZt9KjrBnwGYncaFdW5JdXG9qQOe1JNFDvasFibW7
         Tdqw==
X-Forwarded-Encrypted: i=1; AJvYcCVVt9KSuJ8ZsmVxkvhOmhFiRwd/AUC3u+vITuPpcwXgljXZyhvqXyrH9XZM+vAH+Q+zGK9O2ai7zlCMWPT+TSGD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9wCJHryX5e+8SR2NL53MMKZmPxOraKFScql03iEFfDsmBGrWq
	I6t9NLxm5RAexNn0FjRYIr7jyGvWeJlhCS3vKOmy7LyumrnthGI31oxMo8/gsfdmyVFG5OA/FhX
	wyXEr7C/o0nnHgSrPEJE1zp43+rzAgrOfRO9gGoewEEOSel2n2V4G6q8UuodfUlbP4PgmKq08no
	yEtw==
X-Gm-Gg: AY/fxX7io2WVWTgwSDX/0Uek95WvjEm723ua5ggmF1mHdDvX74+po+1lBaKvE9x60wY
	phJOEIphbz7ggFiywK4dATcfsa1B2y4r+QmrIhsZ8Q7Hiq6BLfj5UydTsD6NI2J1IfXBO/Ez8sy
	fI1EuhcK87Fhyi4c/V2sm1mUG93sIpBpMBvNswqx/xtvE7YTiDn/58b3FAJwec+MZCtJaQ4Tu0B
	FZFT37qjzI8gtwGJeFN4xIH6OC+b1YYCfpq5ukdnKeuRYJAiazL2YC7akC4rtARv5HXw5nmKfiL
	AfrD9q/uLzcY8t56mtEYuHgwsf7iQ33epiUajh7EMQIdAYFJKzh+JqzkV8lbrpGUkgTH4FTqMT1
	8Fm3lM9vs5F7pr50nzrw2NDz93S4utuFEA+iwEpkge5plSh8+cQkGRm93+nBqQkdDGg+6eYzS
X-Received: by 2002:ac8:5745:0:b0:4ed:b363:2c2 with SMTP id d75a77b69052e-4f4abdba542mr36235211cf.62.1766146204024;
        Fri, 19 Dec 2025 04:10:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNHE8mUt1RqbOG36asJqPTyKdt2EDtPV/2sqLUBv01aNJ8HLkYsLaCnyAzQhCj8S9G+cl7ag==
X-Received: by 2002:ac8:5745:0:b0:4ed:b363:2c2 with SMTP id d75a77b69052e-4f4abdba542mr36234831cf.62.1766146203623;
        Fri, 19 Dec 2025 04:10:03 -0800 (PST)
Received: from [192.168.1.27] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53c16sm2024766a12.1.2025.12.19.04.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 04:10:03 -0800 (PST)
Message-ID: <c60ec8e3-0ceb-478f-9c21-14f9faa0b7e5@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:10:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] gpio: zynq: Simplify with
 of_device_get_match_data()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek
 <michal.simek@amd.com>,
        Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org
References: <20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com>
 <20251219-gpio-of-match-v2-3-5c65cbb513ac@oss.qualcomm.com>
 <CAMRc=Md=KvKaXZvdwRd_rTp-Oq1qrAo12ENcUqTTWSYnCYSZuA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAMRc=Md=KvKaXZvdwRd_rTp-Oq1qrAo12ENcUqTTWSYnCYSZuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9YfQs63asq62wmcSwyEV5wrLHC5T3_1A
X-Proofpoint-ORIG-GUID: 9YfQs63asq62wmcSwyEV5wrLHC5T3_1A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMCBTYWx0ZWRfXxGJwkPfZxTx2
 yszSAdARhUACu2mwxW5ZRqb/i956TbwkMnVPiFOezwiexqFZ4ubse2Fgn4xx6300tDUC6jRJWfO
 sCBSzT+kZLLV0xOf3TOvbt1xREk0irdv0YyBL59YRvvbt4I4H6QFC/jkBYu0wwwViCsnBEIESbq
 TRZt8AeS97boPzfNKiPDPAvBmQf5RnzHqUIGwdbkIxKSZec6YirWhtHf5dpaI+aUtYnBBaEe4qp
 /bXrJVi9xFYEosmNAXoZLp0B5rV7lC/vmwfmk3kQWGwGxf505mIqaAWBK3DQFAZDsfqj3QsVdwS
 m4/ckQ7oOXSdfVulILofL6rjrygdj7ZPNqSzUoaH6wCsUtsmspb63/D9qpIp9M8DHr/arNch+kM
 sA0+GpEGcX0PDPSNLvSg4W6TEoFNyYKdlZG5pSTeWs4iC3ZRhf4iI6SVS/Dg1IIpakTFcxv3WXF
 a1NdfA5U2xAC1LMWH+Q==
X-Authority-Analysis: v=2.4 cv=WYwBqkhX c=1 sm=1 tr=0 ts=6945409d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kcWgoHX1vMHs3kmCK-YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_041006_660740_EFF558C0 
X-CRM114-Status: GOOD (  15.21  )
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

On 19/12/2025 11:15, Bartosz Golaszewski wrote:
> On Fri, Dec 19, 2025 at 11:12 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>
>> Driver's probe function matches against driver's of_device_id table,
>> where each entry has non-NULL match data, so of_match_node() can be
>> simplified with of_device_get_match_data().
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> I think there are some copy-paste leftovers in your commit messages.

I just did not update the commit msg.

> You're saying you're using of_ functions but you're really going for
> the device_ ones. Also update error messages. And possibly use
> dev_err_probe() too while at it?

Sure

> 
> Same elsewhere.
> 
> Bart


Best regards,
Krzysztof

