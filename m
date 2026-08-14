Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4043BC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 13:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vviloqTvq3WKiFKD7ZKd1dUGZvDqcy3SN6oDPTL/GUo=; b=pi6+TvztOSCUu0W4K1FyA+h1kr
	xUJ+ZNglA8h8aCv+jgXkmQZUPIfof3UCxSORVDZf2PHV86DpanMCZ8pBncOFKAw/gD6E//B5zM4Vi
	zX6Qx/e0wBPFqV2xSm4pG0lLuwPqe0DgledIRObQPiG0R7ba/tD8Hz26EP97gGzB/wqp/dBUMMT6E
	nssOC4bdh7N6hbRiLaPkdCMH9waOJfVI/QcQK8PzZ5rHT4FF0iYimPKrKjrHTEbGNjPmJfCbF0i+i
	i2PxEe+5q9NzQA9dmT8o4MFy8ThBO+wT3x4CvHJByCU54VlVGLv51ES78PgS979Qq8QX1eToJuPl3
	RW1sWDSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurjy-00000002hWg-49zH;
	Fri, 14 Aug 2026 13:14:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurjv-00000002hUm-41md
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 13:14:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAb9S31412966
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 13:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vviloqTvq3WKiFKD7ZKd1dUGZvDqcy3SN6oDPTL/GUo=; b=kCE73+N1jcjwYL1v
	1NLH6kaopfSYnyiDAxEyMWBypQ5ncYrAPKVN9AFrxyyAQwikfI/TeXh0x5+c7e7N
	eEmpGdOR8dQ1w95X9jTl6sJikBQPiX8/yKS855k/QnU2Zk2LxuYeBziPeOrXn3cI
	uWMHlALQyGOyv1rBlCj792HvFYj7d03jLiEbZozTxIgYNEfSeUXi1SLWPbz99TkE
	3Ly2uaa8lpCCLrSABZSKx6B5YUtxb6mr7wZYnT8s8iWLjlIBySWB9Aegrrlds5P9
	P9uxd6rJG2g5zo6eRwyxCuJ8rdWhpzARbJaHr0QjafZ71u7UWvolQytNd1qX3Wj1
	DdpnAg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20638ytt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 13:14:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c083f1818so12448781cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 06:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786713265; x=1787318065; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vviloqTvq3WKiFKD7ZKd1dUGZvDqcy3SN6oDPTL/GUo=;
        b=P9TzfYtOmS/+08hFKxTKuxbR+bGcBggehh2d20fpqzEml//oy8VFKc62Pi9t6RnER4
         BztvjrTp4SaxdkXkDMiJz9rBdS2sGj10SvrMUp0UPAs1vEGSmoVjsIoOZs9wmDqq1OLE
         uM5/dIjJX/eslgOCKrXpL1JJ1KD/QLshbnG7VSbr0ze4PXpdmCRyUMnyyegCW/zex8iA
         MOoXMaXijRHlABCV/UAOsaSCLNluP4Y18bgMv0s1ZHHe0AUsediBrIMAMwwntiaMxvrq
         T5dxNOKrOxW+fYvUdR6DNWYTMqTAmI4yA+tsuffOzz4lDrDlgi1/x3M096mCGBC6/XY7
         wVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786713265; x=1787318065;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vviloqTvq3WKiFKD7ZKd1dUGZvDqcy3SN6oDPTL/GUo=;
        b=lEx2NhnNQ2w1g33Kj9PGBvY/du5jACmxSleV3DMilKYF+YXlA97WACbYwKJMJiwNKB
         O+OprBs+dNLeJGXxJXTJ6zuL2H3DwbhdCcicIDcwWpDougj9HgM3ifjFDmwulqVoQQnC
         mjLxP1xdS3lwqg+xw/jTtyRqswuH7A5Ap6Iqz01BirdM7m4DpJdEeAVibRu3+HbWiF42
         DweywVWBB3/H1tvx7u3qFTW78rGGO8fX+OxyWhoSyUlJUxjeBwn9pfOPNPNVtchMrV75
         I102iJhXAD06kaAC3iApBBsFwoLFa4DbwSi+Yf2XQ/o5+Ut32YVJLX8hinQYTe5GCcjR
         gO5g==
X-Forwarded-Encrypted: i=1; AHgh+Rq/4cffFV4CU9XDgcmO76otGV4jfMKvkP3k5iG95xNvLgfamW/kBzNe1Kcs1MWBXnifPXQAAGlEJmlpBWMXOLyn@lists.infradead.org
X-Gm-Message-State: AOJu0YxJon8GzjNgpWd0ujo6A6PSZNjyTFbC8rNlN7rYhq+1/zrEy48j
	T8E6QDxfW1/nTWOnacqY+vhMKZjM7My/FjBFB3cnlPMLkJ8TmzzOY40q7Ohk9718VGekuvhdSVC
	yMyEwLrviIqykDuzCIJ8Z6F9UGxxU3Unj/Bvrbk+XabhtT0Umw5N+qvuZ9Y5b72gaJwB6T8wn31
	KDJg==
X-Gm-Gg: AR+sD12RdzPj4EuVTVQgQ0z9SX5b7A8L+TYb6t3+FLKa+BX+qZ58CqsbrthOj+GepHD
	dyOxSP+7S/qxpz1vCG45JivZsipk4Y7ouKmPaIH9Dm1uPUijDjD2SU1p+fTLJqY+sjfqD5xnI5t
	49HzpS/mEAAw40yGY2w79Jb3ZyfCzys0I7ezuy03P9kur42Z6MMzY9wo3OOKcK/+/JjGW+ptcmo
	KKaguHt8MEDJN9VvIlB/a5n1cHv66PymxOYYb5GyJdMC/byitp7o82XdiJUsFTWgSntznvjEw5u
	FGRAEZ1mdbgVD0N9gMnPl3M6tdMu7NOnu63yOlUXkTYXj+9G4tP9Kvs0jAE+jV6rDfs3JzyZAWa
	B5+9f0tUALKmc7lb76WoGMb1EJlyzCvcX/D0utRjJ59v1Se1dpJuzovpz1fCs
X-Received: by 2002:a05:622a:c6:b0:51c:15bb:b4f2 with SMTP id d75a77b69052e-52d85501022mr56159611cf.27.1786713265332;
        Fri, 14 Aug 2026 06:14:25 -0700 (PDT)
X-Received: by 2002:a05:622a:c6:b0:51c:15bb:b4f2 with SMTP id d75a77b69052e-52d85501022mr56158721cf.27.1786713264841;
        Fri, 14 Aug 2026 06:14:24 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:e4c:e833:9d1f:4e19? ([2a05:6e02:1041:c10:e4c:e833:9d1f:4e19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899753ccsm32150965e9.0.2026.08.14.06.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 06:14:24 -0700 (PDT)
Message-ID: <8e82f564-be0a-4bcc-a9e1-72e0d26ca0f1@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 15:14:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101 TMU
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <DKNSMR9KRFQH.3SQDYW46B42FV@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <DKNSMR9KRFQH.3SQDYW46B42FV@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDEwMCBTYWx0ZWRfX1rxEH+VkoKKC
 xTQLbmjeIoyJDg/KP2c1nnpZXfFLkigzrIkvNibiaqf29M8K8MWNpXwOaVpKyEc+eYZzNasOvLx
 LS/R+5WuUH1xfMEcqSCu3fqaCqp2LGY=
X-Authority-Analysis: v=2.4 cv=Z/Hc2nRA c=1 sm=1 tr=0 ts=6a7f14b2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=z2-NpXgQeZIsa6yCj1MA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: czECz3DAFXWFm-ZPNus5adLMRv_rASpb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDEwMCBTYWx0ZWRfX4WOfMI2J3ShW
 I1Lx4jwy9yT6G8VcZbLf4V7qr6hZ+5FjyWCCxVN9Bwzn/T9TzSQNNribXcYRoeI0RO6WxiJufgN
 byqTkftRjXtUMZKCMKdT4SZ79PJlI7UYpYEu1KfQMyJ6q+9E7PuMjtZ/QCehhLEcgnIk01DDicE
 fQbnD7Fpi3mwTO3bYFKVqytHfzb1D79D3Ld1XZshKuIWaf0qu7n6R7o2vbkR4BriqJB79mYbt6H
 WXqwAuPB8T3UNMivFtSGIAj0YxD2SMUaewEX6h5jNws5iGOh4lNNX1Gy40TTJ5Q/N39siSKLXIi
 USEAFGH3QXIKDgiEsJQtvR1Tr6grLssP8tmZnncFlGrnnK6lWOdOQxLdxrwz+x+ibAN0yO4klKp
 TIj54UIx7Z8CV6fzZe+0qfJcXp7UHI1+5OuyN0pGHMXEFBVvC4355Yqu2h+tn0Tg4X3T1sny7Ta
 Wy5qcZaMrl9jMX+AIkA==
X-Proofpoint-GUID: czECz3DAFXWFm-ZPNus5adLMRv_rASpb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_061428_130966_4CF89D7F 
X-CRM114-Status: GOOD (  15.15  )
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

On 8/13/26 13:52, Alexey Klimov wrote:
> Hi all,
> 
> On Wed Jun 3, 2026 at 2:00 PM BST, Tudor Ambarus wrote:
>> Add support for the Thermal Management Unit (TMU) on the Google GS101
>> SoC.
> 
> AFAICS there are no new comments and no updates and Tudor said he is
> waiting on feedback from thermal maintainers (for 2 months now),
> what's the status of this?
> Apart from some required updates [1], [2], is there anything else should
> be updated here?
I did have enough bandwidth to review the series. I'll have a look 
whenever I can in the next weeks

