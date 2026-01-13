Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77C4D29DE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 07:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mz1uyotn+Lo27VQ/BNtnflO/fKdr21z5CeR8OsS9Fwc=; b=QPXGs0/fuo1xRFvZI+OpDGJ9u6
	rNBIqD9Fmc5ldvlYGGCWEW7JsInuobnJZLRiPHyCwXT4dI8tdTFVtWrrbcwmikW2ALSvQW+Xtd2/Y
	tqpO0gXpkn8v1gvKIMNmPM3wfUP6hI6E4F/pHz0j/qZVppfNYWRLH1k5/mgnjlaVWrUFzKFFAQfwz
	Ubf2wJbFiBh8Gd5VBHjU2cxDjyH03Uc+QgQ9SIHdHHMlVGLvBvIjcrW7PSqCN2sb9mhmKtpMTj3ur
	gJSTtdGer2YRhZ7QmKiWEamKqse9rha5qSUH/ykP5dXegb+n3CTNlWPz50Rk0+8M/mt+5RvyYyu5w
	xiitPSkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYfd-00000006dMU-0zCc;
	Tue, 13 Jan 2026 07:18:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYfW-00000006dLI-481Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 07:18:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D6u94x2513676
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 07:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mz1uyotn+Lo27VQ/BNtnflO/fKdr21z5CeR8OsS9Fwc=; b=IogpQjmHSofRI68V
	SkrJvw4LmqajQU5MNAcxqKi2FT70owGdklMTFsvxJKpOAJSvZYwTdAcqd48+a+jP
	rjI5NDaykzkeDE1nVa3txkJXoKsJKzzXeoRXzKSjLVhuVbmKaB1HS6lics+n5BvP
	1y/gKvV6NpV9qrXnMiaXXE+V1Xy4TFmFpWBfz2IfEzPt3aNJJGGykciR6Kib7ibO
	w1am60ztduMcKHW1tD/X/JJCeL47XhmGdeyw2K5ZD8Pv/WoyOwZ4zrPOnjynGzuA
	AkAbbRRJqZ5SOAHNLfnt2nway45WXm+U3ISHOSdFQWh9wWqSZ4GoJZ0fBPx6mh4B
	ADaAdw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6y8sser-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 07:18:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bb0ae16a63so830259485a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 23:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768288701; x=1768893501; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mz1uyotn+Lo27VQ/BNtnflO/fKdr21z5CeR8OsS9Fwc=;
        b=CeVzvXVE4HDWwEYGViHi/Jet+9GD3coRW7BV15j1W1NouIdJ8uO0/W9kn9beoFzJMt
         BKJpZlh9p0yGc0jOrO5OFIKi5AynsNiPkw587m9Mb21hGdiiAl3C7m5N8HvaseyXb0BA
         ZuMC2oron9W2K7n9G3D3DDxNZGSiyPZ+i89SBLcBvsEHiyLg0iZKf7EGqGDh2qtr/Ban
         lEFj6KRqs5XJHibyclXkrcw8HtrMRPNm0IEu0ayFBJOIg0fobFSMY6gcl2OTrmwdQcla
         MhcX90xM0nVWJwSh9czZc7MBFzyTIXQ/5hRGZj8y85xPyFkAGmID4UlVfDpUDEpW/E6y
         cBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768288701; x=1768893501;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mz1uyotn+Lo27VQ/BNtnflO/fKdr21z5CeR8OsS9Fwc=;
        b=JzMn/jPVZ2WFJYDSNHhctI9GEwxhsTUU+X0wiK+01BmZCxw4+IpOmA9/878ttfcRxT
         XMs+TrwSRfR8t5lwYU/lXDr4IXVyuGK0FUUxDxH+2Y+4OB/8P95zMnBuNmgFFI8gfXYb
         AnS/qIzDOVYgdboVIOFSlKuHvTpI7hIadpHq8j4JsdFTDseUHs9glF64SSoQUQMH7vcO
         6XSyKiMS+qJjW/4VUGXK3ukhGpS2BnxOy0Axuy1wLCcy7cDoNH7cDmA7xny2egE4KsHS
         CjY3acvrLrdUXOv9bLqbc9nJtoZtTqoDuvQ20FDwI8Xeql0Z+wlMrMNhe7d1nJ0zWIu8
         WppQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5/JAk451jI38zRW4NyU8o1VNuPjGnkSpyntJjKTcojFz7vTTSz76b44JfyLm5NI6qhPyZ47qwFYs5Bo+Fa567@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvgl1dwQLrBG4nkRkYbni58uNpAzG7eVNC/r8ur6oTyLO/HjJc
	N7Z4Iy2IAKp1IeUSGHjf/fwqJ8wfQlbcJXdnNykcAXqZv8NlzPgWzZAZzdJJKNDI+6R4961VTRp
	yf+l0QjDlQGXwSlHzsxdm7nME+AU2JNj+eqqzuOHNRCbFeCsvckoykXveRYyi+j42svQl18Xvvu
	G4NQ==
X-Gm-Gg: AY/fxX7u6rz+mx71TIMXHIRNLSfXZrYHccHMW0W65h2bqXSsREN1s5Pogjol50PSBPW
	jmDy05gnhb2oKfBpyPMrB0xbF0A42f/Sl0MauNr/MATJuZgBJ1G3unYlOCBN+gsaJr0QxOj6y7Z
	NRogOqFV+ekpMtLp5e/XWEDP7zprGGBDXlepB+KMuMEmGTKVYJ60288AdJv9svBfpYeTAKxqal4
	EfAjcyoG5o7Xg13axCrLaD1V2JPucEMiR7zKPt4PX77rnbeVZk515lHfkolgQyHcw0ubQXyrif7
	fKtcsrXQNXowKyc3jltRYl2QWvIiRX/xREWaht76g1IvNQzi2XGIUDtftZYkV24VG+BjtVsbsJJ
	3lfg2expmet9hjiYnVXd9gLvLOAqrdfgq8iQznA==
X-Received: by 2002:a05:620a:40c2:b0:8b2:d56a:f301 with SMTP id af79cd13be357-8c389356249mr2855358085a.14.1768288701072;
        Mon, 12 Jan 2026 23:18:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFv3ItqozzK8RLD/MQVHmBVCdLU5MZEpggQld1MU1FwUv0Pdz1KQmnU+9nc8GL923HLQEJG2w==
X-Received: by 2002:a05:620a:40c2:b0:8b2:d56a:f301 with SMTP id af79cd13be357-8c389356249mr2855355985a.14.1768288700635;
        Mon, 12 Jan 2026 23:18:20 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d5dd40sm5388155e87.60.2026.01.12.23.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 23:18:20 -0800 (PST)
Message-ID: <17f46ae0-f89f-4a33-8a4b-a97dfb32b8a6@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 08:18:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: aspeed: add Meta ventura2 board
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20260113-ventura2_initial_dts-v3-0-2dbfda6a5b47@gmail.com>
 <20260113-ventura2_initial_dts-v3-1-2dbfda6a5b47@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260113-ventura2_initial_dts-v3-1-2dbfda6a5b47@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2_zQRrbRK8nFUxCBfXcpcOCvAXy4ocUC
X-Authority-Analysis: v=2.4 cv=dK6rWeZb c=1 sm=1 tr=0 ts=6965f1be cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=0ndkzm5UIWKU6r-Gs7EA:9
 a=QEXdDO2ut3YA:10 a=xCCTlrCo5GEA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 2_zQRrbRK8nFUxCBfXcpcOCvAXy4ocUC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA1OSBTYWx0ZWRfX+MuD3DCj8KjZ
 XtRVBeUvbPlyX8EV/KElV5NlECvOkGQbg+Z8Law6ezMhtmGdl2PqeHNiQMRVuxrID8Hk3ID+tj6
 bu70127R/uY29GNdh3UKMBE94Mq5fIHNC9FhZKMmcrpl/QnDaxxsuC4gv6zNJqy8uo0bXw9Pmzs
 g8qg0BmNwiMpx2/czwv7QdbtU28I4lo9A6dTKmjGOPhZgjfwxhzDZapisFooKTEsIN/uyJ5HSQS
 gQEQRdwQIBg+FZpXF9oVjKHQRTrxAC9as211v8Sn8arrR9IL0ueOI12cPeS73QDgIzoL83oCGrj
 wd+cyabswTqlTwAqz5lM77yrwSwwmWSQmLZ5SpJpARXsAbHP4/fGN1UgTSMmCEUH/vmQrLowp/r
 +ux0y/V/49zPF69IDrIgmR8NxM7dOPuBhocYqqNkXAgtE3mVyK65d8cL8hN5estjEM0RPe+9n+A
 Jepr3ZNmahetLmT7DOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_231823_476982_2B37FB1B 
X-CRM114-Status: GOOD (  11.24  )
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

On 13/01/2026 03:57, Kyle Hsieh wrote:
> Document the new compatibles used on Facebook ventura2.
> 
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> ---

Read carefully last message from v2. I am not going to respond more to this.

Best regards,
Krzysztof

