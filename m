Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD250D29DDE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 07:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZhKGgRnlFyhrair0DoeC6I/JMQGFqnL+h2onNiR7DrA=; b=yutLlljDGdz5zLbfNxmkM4qoKi
	Woz8YssBb6GtaJhHoKNwvqhYgxz1OSzaPqPUndbcJQATa4erBNrWwGcG1Cfuhf/h7fWF9MRbW4BJN
	pv63b81BGPtJk+PS9W242f/1w/sHyWhRcrmMvArIreY/RUnS9VwYMdOFcaXo7ZQ1hSC87WMXKDWuo
	IcIWEo8eNLSf3SP9dRjBYB+IeiQfYtTJQB2/UvUtOyyo4YTIhthaf261w0HUw2uWg37EYdgTxVBY6
	gyjz4hNFsPlep4NoW8APeybdPwdxWEBORp6s67MY5UIt7MMrfjHwHXHTorY8b35jGntsDPwALTdkl
	6Eo05Yrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYf4-00000006dH0-1fss;
	Tue, 13 Jan 2026 07:17:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYf2-00000006dG5-0qM3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 07:17:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D6n8Qx2604075
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 07:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZhKGgRnlFyhrair0DoeC6I/JMQGFqnL+h2onNiR7DrA=; b=fKaCEjOpJByST27z
	Oyqqyg4yNL1d8V6I2OBpRG/bVFInlZgNgzLG2CXDPVOQX/yXThOiU5icgzO0AkIy
	4sYQ0BlnHw+mySInTkl57N3cuKGJSnW9EtoGxqKvRgocoJvBtvBok8152xmkujtn
	DGZuePbucI06XN8HVvjt1HzhqjWPcZd4ijnq0I3KEOUCQoz1c5UoQqPejL7i4Gbx
	cUa5fOdAgXdodOjSHHV2b8ld1DrLREwKDjvyx/xlfZuL3m5nbJUNnt+JrblulPC1
	MXCicf82r/Y299WtO73XE1nBdoUVdKdNbsXKGCjo/sH3JiskUuufxVG5oEcxO6JH
	+FQLTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn7uysnp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 07:17:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e2342803so1916790285a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 23:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768288667; x=1768893467; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhKGgRnlFyhrair0DoeC6I/JMQGFqnL+h2onNiR7DrA=;
        b=RTRq8vsjwC+6x5+2BRvq0k6KMvWhq2Nb+3hORSPLhcaOc170HBCzvWPp0MQDLtwd1O
         IuoNqIO27qOmYyysZYSnx7YijKozJ8Ffoq4lXu5ZOTLBVngVzCX8kNfb7SAIcNgJVfrM
         ZmvqTRV10gvEDKtqAf/nHmjNDJrXmH8uN6UdG6QygGrEchZ2WNE/3OarR6kbFfa8/r2y
         Rr126z9GPY8gHy3xP49bwF9Mhj2WjuAMd9AB0ltuyKK3I27oEC3BLYQBTi5hYA4Vm19T
         v1//2GlMzz6ePCqyLZAYZqiQ/yLbj14QvcxBnh3BeYbvsZMijhx+ESZjai4lfJ3xwNHf
         OuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768288667; x=1768893467;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhKGgRnlFyhrair0DoeC6I/JMQGFqnL+h2onNiR7DrA=;
        b=Y38WIG99eITZm1D6zdbBgf4vOL7LB5zKPZHiZoIeHHQI/bqEjLAND8EU2C3Mgkiu+2
         zzjKgKfM41ELYvy9JqjXxkAoxVlH2QV7kWOpJFn0GA8hS1UthcPYy0wvsH+dP+eWtC6a
         XYJz/KszJIoFguf0F5JfIxRnuv6X/Ln8asY34r6yPDl2POduAYAF3KSGfjmLfrDHsS62
         tReYfcoB4T4sOYS48Eia8cQ1Ll5xQxmjV17asKp/TWRXKoEWB9a7oxYSmmFKKEk2zCYX
         aogaZgdkPwE0I33zPYBTVElhLsaRVsBQQ7QLi7VrBVyXh5KG5A51kVqRdMrAgQX6jKbq
         h7QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx67Rm2UxfX7MWt5fR60ITSgITlyH6bCW38Tk6moWkn5YKlcBbX26PUCfxAAOG1QKdZMmA+e19vF0raQFRk3XX@lists.infradead.org
X-Gm-Message-State: AOJu0YxCVPf1mOBMvmgNz1ZzMZxXHtMpP2H73Ov/7enDo+gqKLM3nCDC
	FtBMLgx8dG0vpPebORa+E1hzNNOUWBZ765L3FHIat7oqVLH1V1fGzyyXZ4coH0tesuvGYYrRKQ/
	JhJf3fUxi9Z2KmKvCOmf6VKPQaqgJ3xtAP2hARrjAvqXB4r5RsRaw4uhC55GB51npP4tUFxhrLO
	UepDVCryeIfQ==
X-Gm-Gg: AY/fxX6bLVaKWb2AoTs0sM0T6ROyJq7rOJ4oxkO+qV6DWrVqrd4M+ZCQyBTCZYKmCPC
	Sn37qXzqfDFZSkyXDNvqC2Q3gCYQbNPWRKPXTHIytXtVvGwtyMlBfPHcl8XHSmSwJos8CJtm34M
	FEVVm3SFAK5R+9mwo6cV04YWxAxd/IfuRb6l2gELDqHNyuqFSgGY8j3zYkthEBt8dXCcwZp5k94
	AIxUcOroqkgIQOwGyVwQwm1XcQqhTydL/kvTLZ1ROx0vJxfpnev1HC7QVUO3kghp3iV69xWV9Sg
	tOVboE/HUkJmuvb3ZZJKSJsl6lh0WG24/vYOXIq82uy40+URy7ztMwk/qwZgi1FRZRksxPbTcob
	agkQpSP2XXylvJ9EgBpEdcsTpkLlIFcDpIXpFmA==
X-Received: by 2002:a05:620a:1726:b0:8b1:8858:6ead with SMTP id af79cd13be357-8c389368b3cmr2631978385a.11.1768288667202;
        Mon, 12 Jan 2026 23:17:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExgQtRozhsAH49RpGxq/iZyoiE1zmUOcY5DHMgmcJAweCKrw5cPJcS2egnmIv7HerF/kkXCQ==
X-Received: by 2002:a05:620a:1726:b0:8b1:8858:6ead with SMTP id af79cd13be357-8c389368b3cmr2631976885a.11.1768288666786;
        Mon, 12 Jan 2026 23:17:46 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86ebfd007fsm956560966b.31.2026.01.12.23.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 23:17:46 -0800 (PST)
Message-ID: <c391ded8-6569-48a2-9c49-6b68838f91b0@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 08:17:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20260113-ventura2_initial_dts-v3-0-2dbfda6a5b47@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260113-ventura2_initial_dts-v3-0-2dbfda6a5b47@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pJJRjMY451VPZK-coRxxo61AHq8HWphZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA1OSBTYWx0ZWRfXzXowzNsKQbBi
 DFVz8n/OnHC+fozU9ii1PeltdFkeUUbbTVFodumuuO5l45fpWT52no4lxR/k4cVTocRdzmWOa75
 rRQJ79cgxQUxXEDgTZlTnmh8Y2UQX6hZy06EOzvd8L5IcxTtTvvQZEeXNG2nP0EbyH4dWsSTYZQ
 WX7Wil1r5Ad37rJA1l+GC+Ja21Pt+Zlox846B2FRwqCMQvw9dY8IYbI9CYwqzZcqzJJaTqnxnRQ
 Z872+hxZUlTI5CcYkFA1otqZzvRdoQ9z/6n+MhJqclrmuw27A9LvROQPhBY/TOoTnZEN2rYsaIn
 saQ4KySznhqSHeRLn6d3UIKg6TapWjNe5QpWZPX3mQo69F3UMWu3itbPPyP5F3C2hd9PUO+Q4RD
 lmDW3KioaacmilJiDeLLQkgcfZx49O+OqVVWk2YaPbWNi+eBZjF6SJ53A1p6Kn38Q+6GCI6DbMU
 b6Mcqapeh7l87Rv/HNA==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=6965f19c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=dExqUudI3SiL9kWB0b4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: pJJRjMY451VPZK-coRxxo61AHq8HWphZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_231752_249547_FDB4429E 
X-CRM114-Status: GOOD (  10.86  )
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
> Summary:
> Add linux device tree entry related to Meta(Facebook) ventura2.
> specific devices connected to BMC(AST2600) SoC.
> 
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Where? How is this possible?

Best regards,
Krzysztof

