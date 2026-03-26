Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89463109E556
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 07:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCksTeWIwPKKMeyxPReBh7DpzqsVihFGRAd5ZqkY5Hs=; b=nGIN48tEjFn0/QCw7wZIlon2xv
	6sR+120G0SPDZprBoDv2Q8p0pKcehxuDJTnxrojlrDVybzj5mQPtepA4HgcfhRpPhu3bFxZtB+DF1
	TNnIbTdBcqihG6S4NAy/zDOUOc4yUNI8ddMKW/etH10IbCYTFHe/pqKettbB6vgtfpa/ZqlRhfk9w
	LyYZIaN5IPk0LS47gPlXAZ0vazqvku5sieNZBBPpleLQD81l+AsJzBZlk8objr4BVIA8SvzhtRSI+
	I1Ch/fihV8lVCrBf5MSbOiTpktn/XKWXlUVQbBjk/VkTA2UOppJz8apX2p+Jkoj3T9TKo6t98lJEV
	Ez65FA7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5evD-00000004tq0-07Pr;
	Thu, 26 Mar 2026 07:14:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5evA-00000004tpP-1Q63
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 07:14:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6Oba41175823
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 07:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UCksTeWIwPKKMeyxPReBh7DpzqsVihFGRAd5ZqkY5Hs=; b=ToUZ8H6u2jM8rbuQ
	CINZT4R89CJI4lY3BTJM8h1CA7yuv8YE/jFbbR9nWeNr9qj5cdopx5CpYPR1oLIJ
	m6fdzcBERXsAraWk/8dMHo5XCThtj8TBsRtonrB/lcPSQHAEljzi0o5AO5zsAzOH
	wqtrqt3gj1q9wQu6IlD01lQMLiELzYy+xxqZNp26wYlq8MSkWAbSL360auMjxHfi
	w89NsTGICJs1K8zCEoNoEwv1T0/9UTY1U1j2vmaaLUqsQ2YAwH7ilSon7bsp9QAn
	oQZCMxk1Zam5GhuCukjsLSj6APVl/1JnGvXReTXulSwKXmBvGPaK71KdfTGsKz7n
	KfgvrA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q76snja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 07:14:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50911c94db1so18988591cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 00:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774509262; x=1775114062; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UCksTeWIwPKKMeyxPReBh7DpzqsVihFGRAd5ZqkY5Hs=;
        b=ZblQFhk1DsdelC2tKKs/PANNI7GtH2BOhRC8t5uOQ1cFoX0FR3pKcpz7wlbKG/v7NI
         RkjkNWMAesPI+vDgdYy1obQ1epMfrvWpOb5WI85zCqAS+5h/f9ein99GlQnYb86+FfGD
         Uys304KqBwxrZgcy3arKSOrPEglYp8/qTXyDuq4G6b4lOlV6XO+y+U1lrA8GEWbIlXxg
         IpHCluLTu14ace3CvQhQi5GAzBmlMhRYl5td5gecWSVYFsGIiiCuXImSG3LNcYw2UsjH
         XN071Jxa8/jC0SwZ21jf9+se+yTaYuWeIa+DYBDkoUvy0GPvqwp0nENP7CWsocdgwswf
         rdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774509262; x=1775114062;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCksTeWIwPKKMeyxPReBh7DpzqsVihFGRAd5ZqkY5Hs=;
        b=NINUWaeb1BNQf3M4kg+9m1P30b/WwPSceCMILdtVufVdQ0WWdhl0nS9cPTlU6vKvFv
         sYnVJetByBNqBNP9z28x6aUbCQMmcq16XkmywtO6PSW5ILNXPt45brroVsAKS7qe089s
         F/k79SUeaWz2nnW2MMp8JijO/infBM2iEYLmegeeVhF+mfoanfz2a5gb7qBXGtWKqqPG
         qkSK/VUL1OQ82wNQPWXEwqiVIRdekGjRUScDqdv3QKljBQHYJ4LUstLNzS49UGE7Q8zN
         /AdistoOcV4QAOBsydBe7SV4WZva/Fy/phz7lMAP/kJut2JDpsD+7YKJuk4ST9jaHQCW
         7dWA==
X-Forwarded-Encrypted: i=1; AJvYcCVX0H76SUCe91KGK0YUtou8957fPf+DsPrkhWKnFWeTQe3CikGoQpPLabQwduOL4fln5m5c9UxZMw3rKHtQq19m@lists.infradead.org
X-Gm-Message-State: AOJu0YzzV1G05ByGyfrx0Be3fSR+88GOo+jC82NsLaf9eGCqgvxa8zJh
	rfknN9zU4H3Pj9Khfu4RgHBqUjuiHJ04+7l+Wt4xZRU8V/x1nPswGJ5ds5BJ9kfr3ieTK0rP8LQ
	q25z164tjPu8nXwYxt8nIdRvmdy2ZZjdXnfzmm8t43Piq7vVFphjVhsAB7Dd0YcbmH/WIeDZinh
	znRXXsEuqn6w==
X-Gm-Gg: ATEYQzxG1Q+KbrDJLYdNSLCaCPCeSDTZuGA7k+babZi+lpO9sUKO+NCY0/UUWAi0f0d
	4DpO3O6tU60zVyUfZTgR5AAolk2twS0GHkkU+B/yd1cgdtu7bA0i8LiiClxTqyKBt0f7N9ZVxzt
	9aObeq/Nd2jy+7JOjr/uSqO5hKHmOVkEMVZtg8sbEjBlHK5+ZL3QjXgQ0fHbGel7ApU2xTklf10
	oEZ9VyOmFaLQ25PV/xnZKc0Y8nB2nMYqZa4iCwp2u7Vdro8i546REhSPuJqarKaKHcnPLw63BRi
	XL/jyD/Pk/26d5qOwAbvDU1dNSPLz5jFdb5W0I2x6oOcW0LBVHTPatsWY8jniobhSB/elzam8S5
	xMbbEZ+6y8iKjqzmYGOGhYzknLmQwTqDfJchAuJrGz5jvA0bH
X-Received: by 2002:ac8:5f48:0:b0:50b:3b54:d78c with SMTP id d75a77b69052e-50b835ea823mr81999381cf.52.1774509262216;
        Thu, 26 Mar 2026 00:14:22 -0700 (PDT)
X-Received: by 2002:ac8:5f48:0:b0:50b:3b54:d78c with SMTP id d75a77b69052e-50b835ea823mr81999211cf.52.1774509261888;
        Thu, 26 Mar 2026 00:14:21 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c8cfdcsm18397775e9.8.2026.03.26.00.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 00:14:21 -0700 (PDT)
Message-ID: <c2127a57-3ced-4c0c-a7df-c052cd5dac7e@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 08:14:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: defconfig: Enable options for CIX Sky1 SoC
To: Peter Chen <peter.chen@cixtech.com>, arnd@arndb.de
Cc: geert+renesas@glider.be, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Yunseong Kim <ysk@kzalloc.com>
References: <20260326033939.3789800-1-peter.chen@cixtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260326033939.3789800-1-peter.chen@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NOPYOk6g c=1 sm=1 tr=0 ts=69c4dccf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Hsymi_T7xZulvlxaAb0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: l1XT42_oT4GciODLIJn8snvjeRw3hqDq
X-Proofpoint-GUID: l1XT42_oT4GciODLIJn8snvjeRw3hqDq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA1MiBTYWx0ZWRfXzqWPdFupKWwh
 1RAIXiZCMO0LKRsa71qzzTtDzzHQ1Uu3gw8htzUqWvYXQIlzEsj/izEF5So6Fp4xwEZksf9qzJs
 /OVra7HubrnpqVcWKJ51FWiKnAteGIejtM8TZnG9NU4uzd8JVYSv1kcjJpK9lhTPmzyhQ3/eEkI
 VDQVXO3tNbXGDP6dJPqDmec9dXlUiWbdT2f2H+v8Zg8RxEBcPUmkTj+Qje2Kq8DDFBgrxNSYrkC
 pM69eGPPvG60bqzaTKaEnnLpV2lX9gq4U04DBqDuhfu0uKSBltBuZ1AJ1/DMiD3ea4HoFoZasAc
 mLxDPHXu+yWg9w7KvwW4Mt0cJYPGa5GbADLG20rJVOiOESZZbT3sMRve7UkZvHywr16IEGHrQ1N
 OJ+YDIJS/v74jeR4Fhuz8hafpDpXJQ6ihJYe4cx8L/UYiRD3aUP+U5BhL8IclBevwf9rl70Aa/E
 dfopY5D5h3BHvon7a4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_001424_395486_33815B12 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

On 26/03/2026 04:39, Peter Chen wrote:
> Enable pinctrl, gpio, pcie and hda audio support.

Why?

Please search within similar patches for explanation how why this is not
enough and what should be here.

Best regards,
Krzysztof

