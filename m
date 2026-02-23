Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7012CEA4FA9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caiIy7xPxOh29WdiHbB+v3Ei6hX+iVrR6nkOBo0hloI=; b=sJkMabxiM9etjKAEH1auM0mRws
	OhWrfEGr9eizejFQUNbO7mN1RV/PEiaB15JyBHqHEK+C+t3O49gJxDDc/K0CZ2skaghA9fZ54haCS
	tjtu6Yg94Qen8lMze4KBy5+ak1mjkWEHc2RRCNzn2KwoBxIa+s7KlbseqefAWAblgf6BUp9aEt3Dn
	jQggu7Li+0a9dRVm+FxSN+XvMVSgP8BpmZ5rBbCuurvaX4n4QprZCG83rNwju1DwayHJlKvQ9mYMQ
	EdlLJsdGzzTkqAgQqMAobkp4WU3JcFCt9ca7jrUYwC/W9axccP2uoJsJUNlDHkiapiv9s4bTeWCNB
	8PzXMFyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTmG-000000007nr-0G1m;
	Mon, 23 Feb 2026 11:07:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTmD-000000007nN-1crr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:06:58 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9lLZg2554584
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 11:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	caiIy7xPxOh29WdiHbB+v3Ei6hX+iVrR6nkOBo0hloI=; b=gIgZt5kBaHZkbVsB
	1hgfTaZbTUVvKzQSR4ghQQF7ZxdCVImB9i5XGRqajwYtdvmtzfZBCNIfMk18APtz
	8IolDA0WKHPq3tWDl9M1ZUo/KBSYud3OvCi9CGEKCk1g+x6830coiPR2fnSwwpRH
	1I5r7fSmuNdOOGLZoWeBRxcBA/8nDsi6sfO+JrHEX28wnyqbj+F0aQ986W+h7dQQ
	oNNW2mAPBwCaEU9fGajaPvj/GLjP5g7cDlTD0U07tZRmn0V2iNdpxDVt/j153mr7
	SZkoBJ5VdnNok1+ViHEc+SE4mM4STbBXPO4yOJ8zNNf1i95sAPz8b31dZbyUScFh
	4p/t/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wyvfg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 11:06:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so5352776385a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 03:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771844816; x=1772449616; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=caiIy7xPxOh29WdiHbB+v3Ei6hX+iVrR6nkOBo0hloI=;
        b=VYRevd9VDOAngBzZrVbQ93pb6wFqiMMRM7WSziFaIS/d0nM04gcls/THOkzF3tlxa4
         D0lDVvboUDzq4a8B5229Dic3nW9BX60uH+osQTZoXMHD/dhb2tlVGV2nkxeGrj/i1NlH
         gsNdksH+YAOYUi6P0qsh5xmy+DLQxs0El9vXRMMolH2+9mvj9s07hK9KaHbdMCChb5ya
         UuTfAbFNTJpRTIwf4WcoXjZq16RpGgXJHVhAwz/R6hQc2RmCkP8bgXw3xfb50SUfu0Df
         V/3dwes8DBgXsvwfkvQzLYsgmCl7KeW8bfclZ4K1DMKrxA1xp8/WYH3Z3BjwhcEvkuZO
         is3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771844816; x=1772449616;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caiIy7xPxOh29WdiHbB+v3Ei6hX+iVrR6nkOBo0hloI=;
        b=qQBftdcLq/DatA/GAxT5qjzbSaUFBEjxhXyZzWoDg3pCf4XF01vc79kkID6dnYGYL0
         NNwcGu4SVW+LqAurrJIgfQfiJhaT3IFWibFthAlIA1Mrn7TxWtWQgqDcyPC796POobRp
         B3ErXbcb3NGfJ9QhsJq4qx1UOxRkb5B15MOkC++9zQdsQFzc3mvn0xCOf4gTRd7OeroO
         r9RnG1yOPf4N6GmWDOpbvQs16+yUEzgt7zvASKbFov57Px7ep+tradxvmvXJWONwJQ+V
         ICRbsJgBw7hbaFdWGgJk8Tkl56GbGxSUFIkypjv4wasbZ3lPsEcZIkmK0nVTT2CsNWTE
         GJvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqgGnPMSaiyOwpkUmfob7az9Y9MFOhfels4/H0fBEzQ24z6MjJBcR+5GBRcm77PIt7SKI/YPryIAFmcx17CBbU@lists.infradead.org
X-Gm-Message-State: AOJu0YyEmR4avcCUaqqCNvReQJk6r9M45mt3hB1fWJ756dkm6bfK74TF
	ewI3UUQkowf9b8EZ/oQPhOpmQFm5i9v5SShoKBf4idBXIod/fV3ouq/9YmEP+2pqaW38QRjSUsr
	gSd5RCHfiJDWRZFDRCjqq+nnUXEU0BsNpo1sgAJAdPw+0f3U3wEjn2oP8Frl2l9FcL3oJUdArQN
	76NA==
X-Gm-Gg: AZuq6aI9S5T/BN4fKpABNagxizLXjTWJWzvKc8lQDPm3kZyKjBiH1lWtQ2m86aFs3p8
	/clzZ4eq+qtjI8v4nn3fkqhr44lyjJPgHFjELnYb0nyoar814tssc8vNISbxi/bZQujEQWi6xOn
	jCTtXQtdVDJJpgLnFLPCwgTSmm/GxtoQwyIuv6Xjfur4pxeXXW+xvMagdbkYkVF33MEvO8uAEbv
	Gip2pe0Z+FtXswhxqznPTnK1X6ADHoVUInY3TZJAPIrArmS1CO3yhm0gNkIxOGLKnD6s/BvaPr0
	8Rt7A4Tkh58ZTeFTs0/KPtRwMTpIjYnSq1SxljYTUaNJNAdx0fxigvOWUVlWsnQCjjX1iEh784O
	plf5TSsRCDUuRdJha886mwI7lrLBDIHnnnUkM0EhouRHyOJ/mjQ==
X-Received: by 2002:a05:620a:370a:b0:8c8:e139:b08e with SMTP id af79cd13be357-8cb7bfe7d0emr1646362085a.33.1771844815632;
        Mon, 23 Feb 2026 03:06:55 -0800 (PST)
X-Received: by 2002:a05:620a:370a:b0:8c8:e139:b08e with SMTP id af79cd13be357-8cb7bfe7d0emr1646358585a.33.1771844815225;
        Mon, 23 Feb 2026 03:06:55 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31ff4d7sm271439555e9.15.2026.02.23.03.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 03:06:54 -0800 (PST)
Message-ID: <abcaae3e-c0ec-4e83-9ec1-016f36212084@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 12:06:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable the Keystone PCIe host and
 endpoint driver
To: Aksh Garg <a-garg7@ti.com>, geert+renesas@glider.be,
        bjorn.andersson@oss.qualcomm.com, arnd@arndb.de, nm@ti.com,
        ebiggers@kernel.org, michal.simek@amd.com, luca.weiss@fairphone.com,
        sven@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, s-vadapalli@ti.com, danishanwar@ti.com
References: <20260223104650.876632-1-a-garg7@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260223104650.876632-1-a-garg7@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA5NiBTYWx0ZWRfX5oGkXliFyvlq
 zTG3Aflm8bjKZQMfSnBJO+fH+8YMvAwo83zLnzgsd+lPS3RKTGitssFoyWm4qERdkssL0RVSvwB
 KPKTluIl5hlWQ9gJQTyHvcz/oVdIXASYz2DJCBxYVjKgcA9YJm7sxMhKn1zp3gMrmqcsWeUQCJT
 xT1PtRlro/bnVSglffah2fCyQyuqK7H/pvoGu+jzMv7fkwdznDM8UR5rmX+f4d2NkjnchvFKRng
 GYL7GEbABDcrl+bE0bIfeZ3lY9f+Mm2ti93KPzLKBaHBh8XcZsetYNPbZOWjUaGC8nK5xCO5vse
 9F6zoNZm1YHHYEbIspwWDlJIF8KD8SJtk8MyyY9QSxcVqU5XPUiylG6UcuOfHWpIfpM91NlpLAf
 6XLXJ79je3Yf/U7D5Wt+GNXSKwuOeMAf9uFuHyk1UPL6KdtbVQmRRXhCNJGevHR731RePwqjYMM
 HIz7jWrlqod8QyvEGog==
X-Authority-Analysis: v=2.4 cv=UO/Q3Sfy c=1 sm=1 tr=0 ts=699c34d0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=sozttTNsAAAA:8 a=S9mXNDtqRjjrgznzPtsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: p0lnEwFh2zgHl05_tjmzcINF3Avfkpv6
X-Proofpoint-ORIG-GUID: p0lnEwFh2zgHl05_tjmzcINF3Avfkpv6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_030657_436967_431ED27B 
X-CRM114-Status: GOOD (  12.15  )
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

On 23/02/2026 11:46, Aksh Garg wrote:
> Enable the PCIe Glue driver for Host and Endpoint mode of operation of
> the Designware PCIe controller in the Texas Instruments AM65 SoC.
> 
> Signed-off-by: Aksh Garg <a-garg7@ti.com>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Why are you sending two separate patches one after another?

Best regards,
Krzysztof

