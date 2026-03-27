Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46DA10F2865
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 18:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQ//zaekyYctHeGFk8K9m+oJRUsOh3LS5cgW2knJ0BI=; b=L6axOM9qYHvxpGYA9rygyQYxGm
	+h+5y+vXMrdgO987ecapJIWrbNTs9I9aUsgNXEmFZijz6wxI9xwL2nY679nsBD1v3ko2L5dp0xj/5
	COeIptC+9anMsS768pSTVqyJUsnJiSZDQfkFCMfIOcaJQQzU9gq2HF1N6YM08YbtvRsX+FAXUlyJx
	3b12BKROcfENBiAhL8lMJ7JOci6csyaJaSeUX8k/SSDWRasnEnaVjGv1NcmK3IP2cf1IRZ0eZb5pT
	O7UV06UQqowemtrSYzbpscYd2/F+umK38+AXa8Tbhkw3S+S48I6V6zIgU3Up4dmD/QcqLyQ/RoN8k
	T9QUdSWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BWO-00000007uMi-0Iu0;
	Fri, 27 Mar 2026 18:03:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BWL-00000007uM5-3BVx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 18:02:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2Nbl890129
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 18:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QQ//zaekyYctHeGFk8K9m+oJRUsOh3LS5cgW2knJ0BI=; b=T1ZB8iAIYjnckWb8
	cLN+J02anKDSjFfYVxXaa6CxxObEBooyQgCPvLfxsoIcbG9V/gBew04T3N+aYj1b
	zHnbcfTEx+0OJPTsQ3hUK4IxfUnAt7XZKkw8ReN3s7CooHU4J2/vkwVgJeE2Mgwa
	m6Itsck0pDguaQH5BUC0hdfLGoElENC0kjt+FHVJ+sB6ULiJpIl5fJsJzsKfDZQL
	VYEJ9MHYQkY02ayf1e2yglbTfQd5xf7k2ji70nszmogwH3FL86oglFz7T1veev1N
	7tqGyKDEaxKpA77W/Zm5lPonEINRfPnkaU1mcvbyf4323+xVQdJp5IlqXKWcc36X
	ehycVA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vf6rh7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 18:02:55 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56ce4fcf89eso5661942e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 11:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774634575; x=1775239375; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QQ//zaekyYctHeGFk8K9m+oJRUsOh3LS5cgW2knJ0BI=;
        b=RxQx1HWvgOR6Oc01EUzmmp6cyPxtltBThmLZXCWDJvhE3Vnq1Es6qfLbKrZzIWq0WB
         YqApWCKP0RRNdVSDQLcGokfe42fUK9EHmj/38b0sLHugIXPqYGJQ0BkuK0qeB+/s7CFG
         scAfAP0VK5N2gVw2jlGV/7+izUBFWNlS48g7j3PJhc+jFiOWJTuIQEcmC6MBI2YBEn+J
         S0XxVQacBB+72TsUoWQFdcAvPkhXhITWHQLPKCT9LWGMaBgZu81wq9fzBbMe6ngrdT6k
         Ayy34/rESm7RuR+6K9Ou2UoIUoeG/pAAOD3UNP1Q536UGCkbRscgOfml5riGDYUOYahk
         QE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774634575; x=1775239375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQ//zaekyYctHeGFk8K9m+oJRUsOh3LS5cgW2knJ0BI=;
        b=JV5WuLn8kaohlUsNq+e533AJT1VlFpDAUa8mpVpY0RqV/IQusuwpLxfwLmxm3MSXdX
         74PwTt04ZuEnQaxu177gEiE4sqLaMeFOXwD3o6TMWvj1ybhT0d3CGh/Hf77KMIoZdnzh
         Zucnh4g+LB5aIueq98SmIkzQT/4rXWn6gV5hG1X+AV2yzhlbWHkvz0q7kcVBPlZcgqhu
         bU+pnfpCidTqHkLIE2yHK4JqAwRMjbAyBiIhM86efB0Tppc4dvlBQpvpsTuRAtNIefK0
         4Q98ICbJE6SW18p96TL8wqjxwoGo/05+xArQi0deL6sPvMx4lXsDp0gJFUxnAOzVgcJU
         KPDw==
X-Forwarded-Encrypted: i=1; AJvYcCW01U2EWqdoeIZ2KKqnu9cXf6kshd6apnKnwip4OCqS2kbohiAt1fzfMebzbDZYrAIL4YvZ6R8KJRgV6VAilXFR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/YClgN83B9bAcp9nyheIBcOWrelgcioq9OoHsFm+b0F6XrSsg
	aovv4fV8vzj+eFOWg9gWrn7OhXGz2LNz6h4aBOwy3g9O3/N6Mp5yxFjcal0ryrDSjNfMOxDpVJH
	TQphKWPyEzISfjnutRY1gu7Bi2Mxdp3/OHKmADqNHwe0T9Bk9Iw1V5SuW90nh2QEvivD9DLdc8h
	+FUw==
X-Gm-Gg: ATEYQzyUXZfnf1Zk4SV0i/5DSCQqtrzBGckp2sZKceiZCCkfwT2Q4YT6euesfgSJLUT
	7J3w9r8HaizckypKB/dEF8n/J/b3HQ9cNVycywWrXx9D9oR75hyebpC7ktz2HR4P6zu3MA9H7F0
	EvPBnU+bF7KR2ZY2JwjQxwk0d26TqpzbqU2X1eg1BpXmoF/wYX2Vbn5yY0TPJQpyYLuLLS9CcCV
	xcLKxZsQ2BTNAW+ylMPl0An41R/1Mg+rK9Jqzo6lYCjDyr+Zqv5FGb+yZpi6buuNGJixRatImF7
	E7mGs/ZGI3iYHXRas8xdtY29mvkWcyuVPiGr4VtlLCylR3tnpHh1q0WGhL14+7Xu6P97VFUWGcR
	KmpbwWDxNJHUIi0eaUf6zApbbA0Y53BLq8Gv9Kec3wzrx0qoVyZNy8qRO1G+z2QDxk15l3pWEaz
	skSXSJJv82
X-Received: by 2002:a05:6122:4d07:b0:56b:982f:1267 with SMTP id 71dfb90a1353d-56d4a6680bcmr1811798e0c.13.1774634575178;
        Fri, 27 Mar 2026 11:02:55 -0700 (PDT)
X-Received: by 2002:a05:6122:4d07:b0:56b:982f:1267 with SMTP id 71dfb90a1353d-56d4a6680bcmr1811766e0c.13.1774634574675;
        Fri, 27 Mar 2026 11:02:54 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b656:6dd8:ce4d:18d5? ([2a05:6e02:1041:c10:b656:6dd8:ce4d:18d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9194311asm17630167f8f.10.2026.03.27.11.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 11:02:54 -0700 (PDT)
Message-ID: <3fafb235-7bac-42e4-a28f-c044f32967f7@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 19:02:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/7] Timer driver module support
To: Daniel Lezcano <daniel.lezcano@kernel.org>, tglx@kernel.org,
        zhipeng.wang_1@nxp.com
Cc: shawnguo@kernel.org, jstultz@google.com, linux-kernel@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20260327175533.3044-1-daniel.lezcano@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260327175533.3044-1-daniel.lezcano@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X/Zf6WTe c=1 sm=1 tr=0 ts=69c6c64f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=rp_PM-kNyIFFrorm6sQA:9
 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: gILa4KlNgqjBCh5Z8TOkW3haTPiKBWX9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEyNSBTYWx0ZWRfX+nknQvCoorMd
 dFAQoFeGTW8CWHEdpWyqV91t9BQeRTbOxh1AKHk3jZPc5kXTbz5wJN8g0MGXbQhN2KJ1SF0oK0A
 Kk+QMGJm6XAy+QQ97lUaU6zcS2lZz/s4lSoAZnTD8psdLlbgzSO3qSQWYDS6XSeD/geRYqskIit
 Zsel4wyJpMy5Pf5xrNxoGAQgJWEjo4P69dWwch1MUrf4SEg3Fprd/5kW+65h9FnVPKooKfeIOHJ
 3lXrcgYwhE27rh6CdgtL+W970+OSyrTOmIYZCm03QzACTdu9xjjRpvGG5TsHPDZq902V9HQfC4V
 64m5Fmo5onVBehWxhJEc3N8PZRpz8d5lbdLUi3sh+HSerL8WWM39p7utmdo+W5/vPaAC95KpNsR
 2pvzG5gDakVWctdKwYZmbh5kfD9Av3fRWb7aGhp2bqVl5g3J/VB/2oryMnmxdx28ul1p/xleY+p
 Im+W9DPZWET2wtkKXCQ==
X-Proofpoint-GUID: gILa4KlNgqjBCh5Z8TOkW3haTPiKBWX9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_110257_924608_E95D2732 
X-CRM114-Status: UNSURE (   9.84  )
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

On 3/27/26 18:55, Daniel Lezcano wrote:
> Converting the timer driver modules requires a particular care
> because, depending on the platform, that may be not supported.

Sorry this series has been corrupted with a previous draft series.

I'll resend.

