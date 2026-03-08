Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6229EA8543
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 19:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79xZZRDxRUZmFN/ScsbUTEulHr8w+sHYp39DIi5RtUo=; b=E8X1pIemUjZSPU867VekrAS9dG
	B2rWMj3c71N2Zsq1AB50xZQc3gY8PhxERXbkPI1XPfvYQ0ewprDBPsx8yLeIcMVttARTyJNUCcNL1
	2peWbHjNUlLAi8lqZTihYHZtYMzTBR1gy7bQ+k3X6QcrYc0Bmyw0im9adiVCmzMEoB0ZibWCESw6A
	akHOaOChguP88CDSt+ftcJHuFKUb98n4TjHgZ444zb7pfqN5vbXe+qFx0fi4/6q+rrBnaHvbL/v22
	Zoi0XYL/xwz7rr1aD18wXOJ9sVBiik4vBCkZ3zZHrJzJvak0tbBanl+9vTySbjot9bQpnGDnYpjgp
	OmUKlxNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzK9i-00000006JUv-1XGv;
	Sun, 08 Mar 2026 19:51:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzK9g-00000006JU7-2xK3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 19:51:13 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6285t3pp959165
	for <linux-arm-kernel@lists.infradead.org>; Sun, 8 Mar 2026 19:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79xZZRDxRUZmFN/ScsbUTEulHr8w+sHYp39DIi5RtUo=; b=gGzXN73SQvs9FalS
	5KHr0PqdqzUzJ8UyLuRhVKQ18n0bt6Kqq03IGZqJaTSdIQAMYWXtfYcd1q5l1yLa
	BdQ7GeASgfJkEWOdXh9/tgldplLFayMonH5DaTwIMJEkFbYd7xpLps2eicjjx46g
	UD5PAobnm+Nj/6d9YDeMi19ehQd5ASxuOQmCaz+xEpT6GGMRW5DeYJ0NA+EPJ5Tw
	mQ9QhRYcYIxA9hQrf4M8Fkz7asTANQPfXt0aCqiSE1w8aYnJ21oyTD7cvJIiiU/f
	LpGDQrneMLU/8xmTVQ0VBi+2O7+Q96Zgf0m9JM4FRtFX93haPO/HYOq4Bg1mvbfD
	vQ3qCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qeubqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 19:51:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd849cd562so311925885a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 12:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772999470; x=1773604270; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79xZZRDxRUZmFN/ScsbUTEulHr8w+sHYp39DIi5RtUo=;
        b=hJSpsFjO20tpQ0aUsXlKU/8eXtr4SQVOHSwN+vz5rm3xAWPcArLAT4A66rRb1QXTrC
         iIaXK89p9iUh8LtlEdZbrrWDjypw3gfq08uvPG50UBl/djwoEKA58vRWoAr0VYGl0VXz
         buFq90SazZSb81tHn4md4rle/6zRJlXbkD8LrjIcxJniE93WODMlwaApm9q9wmQp53gc
         DLmRjeIS5812dsK/ocHumBbmOkPp2xMN80EBY27xqHj7V2N1OFW7E54xOe/h7YlJdEU7
         f/now7I6pDWmmbMSAavY1LUKzfa3HXmap+xi8evqA3P+FzysfZsW2/ji6m1UwtmiWxOh
         GQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772999470; x=1773604270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79xZZRDxRUZmFN/ScsbUTEulHr8w+sHYp39DIi5RtUo=;
        b=A70i8DP+Sk3Dvz/42w97ZSb8v5swjmxMzKqwOacCqip+GI0uj5u8xbk+YvMlnZG7gQ
         5Srkn+nKxGfkKoXsxYlpR5YYqdWsRoth69igoSUi7ouiBYgkhiR1ckTMGhK8OFvrW5xw
         D9albyM9xHteZ46qX1eZN4JStqs53JOzi85zWgZ7MfsEkOkITglAf2LF0OL75CmbJHZl
         g6eqcUmh/UT/Ay4JgszDnznIxpiI1qr1eJL3i0vr8RdiyUya2Gcv1N3frUXPbUuRFQS/
         Ss5LsOg6JJ4xXPl9RHf7MSifcc+dZJefv/UcePwUMzwCVlzBU4xl+WXjfgglggrqTegH
         9RLA==
X-Forwarded-Encrypted: i=1; AJvYcCVMLpCaS/H34WU08DFHLupODlmnxTZ8gV/deCKNG3NGmznMXGL9hxqzcCI8X/ofRdq/GbAI65Le3ec1KwfSAMi3@lists.infradead.org
X-Gm-Message-State: AOJu0YxrVcqZm+BUKfegx33rBUMrfrM4UDkZ+X1NH3qjnIRjZ0+VCs6R
	/1vigNxlRR0J/6vWw8P6VozUE0t2VXmM7e47dmmH9ZzLJHhTMU6YGvBJdiSlRe7Hfwvy029ZAsi
	TlpAC6s/ukKSQ3hNOCZXDB5wY/kQv+f1ly1cZgCZvw36RhcKGD+xSy9MAFsuemugqyioXD1MsoK
	Sluw==
X-Gm-Gg: ATEYQzzjsMg4yng5o1UqX0p7R7VCVeIJwBQCckoCPi/5qxibGPq39pw8FaqIqGdPb9f
	QLoZcEsCFo4neHHyfRlfvJJxmhUooNBzb9UVgKI3lEOGhQG0BZ8Ea64/+zSdKUAjJzVWq7PDbMY
	sY+iorlJYd7k+2WmreOBA2QUYgUW8M5ezEL4UpeTvLm8KK5h5ySQQuPBo3F+aaEaUBdFMHxJqlY
	6PfchMw2TCk/mAHMi1FHLEzjinXMukzniRrLM1Qg7mCyLu2K8QNF/UspMVmwzVB82jAPtb4jRPj
	28FOChDDy4YvNnDwNHVplv8uTyDFyMD8NkLW57RME9scWSScOwZlT4uIDWk3CB7CVeKmb3/obd7
	fVUig+wFS62yeiYi3sqFcCGqs7T7wwDoJ3l9Tdk7785yf0kTz9uah+IiyEzgdwMbQtHqwAMp0GK
	rJTS2fUVIC
X-Received: by 2002:a05:620a:4723:b0:8ca:1240:4992 with SMTP id af79cd13be357-8cd6d4f9cbbmr1241001285a.47.1772999470059;
        Sun, 08 Mar 2026 12:51:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4723:b0:8ca:1240:4992 with SMTP id af79cd13be357-8cd6d4f9cbbmr1240998585a.47.1772999469498;
        Sun, 08 Mar 2026 12:51:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48536b5b3absm21039905e9.32.2026.03.08.12.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 12:51:08 -0700 (PDT)
Message-ID: <6255aa0f-529c-41cb-be32-e5d54a839125@oss.qualcomm.com>
Date: Sun, 8 Mar 2026 20:51:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek:
 Convert timer-mediatek to a loadable module
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "tglx@kernel.org" <tglx@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
        "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
        "walter.chang@mediatek.com" <walter.chang@mediatek.com>,
        "jstultz@google.com" <jstultz@google.com>,
        "amergnat@baylibre.com" <amergnat@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>, Jindong Yue <jindong.yue@nxp.com>,
        Xuegang Liu <xuegang.liu@nxp.com>,
        Greg Kroah-Hartman <gregkh@google.com>
References: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
 <20260304081207.4030882-4-zhipeng.wang_1@nxp.com>
 <aaiByowtXrTxPsd7@mai.linaro.org>
 <AS8PR04MB84206CF559371D3966653F8EEB7AA@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <AS8PR04MB84206CF559371D3966653F8EEB7AA@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Gn_Zuf8hkLznvgkB1he6xQ0KtIMINNRP
X-Proofpoint-GUID: Gn_Zuf8hkLznvgkB1he6xQ0KtIMINNRP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE4MiBTYWx0ZWRfX/5/NIcZSuqJb
 hI6S60XnONHlSbH/6qDRNI1/8OTUTGjnroRCnumPGS581pdcFs8OpUWgYhoeUTxKuk6MdGZ8jtW
 kJ6/3V8xA2t//jUV6Wb1qtDdxeOT3RpuyViFxJRoMFqUjj7zzO0SRltrUiFiFE0rNea0CNQPx9m
 rO42MWKf10IqIeASRkONzMGb9ukmVAGU6rzoqMr0MsaE9K6e3irwDs4+SaIHu0OgCM7eCjnkc/0
 GPewhjotxaia5SQjcykqGOi7q8qsbeerRYwA2yYMbcLu3fZ+zxTjK6cQTVCbWXS9q69a1yTPoor
 0ZMEYCMHMGDHsH6zysCNuLOZ1vA2ZRgrCtpXrl+CtoLNqNWc3BYAua1qMvyKxoSrg7qpVWJFj5Q
 fBcrMmPLHpQUznHvt1X8mpEbK7rUP1hjBQmpPbtNyatbD0WjZHwyJUnu/gVXOT+epA+UaJr1BS0
 PQiVeGou884HVDggiEA==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69add32f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=upsBVkoUhz0hqrFZ6ZoA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_125112_778902_8B9F195E 
X-CRM114-Status: GOOD (  20.27  )
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

On 3/6/26 06:46, Zhipeng Wang wrote:
> Hi Daniel,
> 
> Thank you for sharing your RFC patch. I think the approach is very
> interesting and addresses a real problem in the timer subsystem.
> 
> For the MediaTek and IMX timer driver, I see a few considerations:
> 
> 1. Current approach: My current patch uses the existing pattern
>     (similar to renesas-ostm.c) with #ifdef MODULE. It's simple and
>     works, but I agree it's not ideal.
> 2. Your approach: Your TIMER_OF_DECLARE_PDEV approach would be
>     cleaner and allow us to use devm_ functions, which would be a
>     nice improvement.
> 3. MediaTek and IMX timer specifics: The IMX timer doesn't require
>     early initialization on modern platforms (we have arch timers on
>     ARM64), so it would fit well with your TIMER_OF_DECLARE_PLATFORM_DRIVER
>     macro (if you go with the two-macro approach).
> 
> I'm very interested in your approach. May I ask what timeline you're
> considering for your patch series?
> The reason I ask is that we're working towards GKI support and I want
> to make sure I choose the right approach.

Well, if you are willing to collaborate, we can start right now to think 
about it and propose an unified solution







