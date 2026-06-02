Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C4ACD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 12:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ANrwuqdjefDIFHmc5n5pfhXi8/X9vYH5MINxqlroZ0=; b=a1z9ZkUF6Y5eeyt1mgECCJJS9j
	6sZqIwwtXSjEin4xMtCS5F50N8qxZm7F09W/ZvxVCZmXbMIBLAWT+QrSX5nQbjjYo0PrgfSUaRHfi
	deNoMJqez82NqJUayS3tucmER+O84fCvDeZdwbEHJ2vjbseoFqwJ4KDXl8TW+jtHtdbRKisB4dEov
	/ZGml3cRc1OJsd6Oka3sMAvvq4SJnC9EFrpyVr81XgQxMuqw4eiGnFuYBcA5rkuXCbS2O5tkeLCJJ
	Ck7JmK2wfAMOyQOX6QC6ZTIn2e4PCXunYbzTVCNr78mCXZjbmgTbtuQEf4EwyXQ5Sgb6UCJlPOnhP
	TEOsWrww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUO2R-0000000CxPo-3dwI;
	Tue, 02 Jun 2026 12:16:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUO2O-0000000CxOT-3ZrN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 12:16:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tltv1855076
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Jun 2026 12:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ANrwuqdjefDIFHmc5n5pfhXi8/X9vYH5MINxqlroZ0=; b=CDaRNRGTczDxuYRs
	Lf+2do2rIC9cKHydSllTzTE3IPYjVIxzMlQ91EFvnC7TErQnECoxsyUjfSH0qrfa
	hHTB/HEjawVUSg5xIsdKEQX8BqQCGV915orbtiZU3lga6J8QvWdWXGmmJSxYzsAq
	3EJ+HxZ2dhx+1tJ+Zpvc35eSIyhKsEsRAUmkCAQvz2pXzQewyKkRUzrmm8jKZRxi
	m4cTGKXCt+r5DW1VIvuRcti2qMl/ixyJS5Kq5fZYQCKkWcJYVSrhAc0eexdf51jR
	cBLTluwozFBmQdwhi5Fmtn7NW1cgnQWoKbmIBcIgyQzeqPbpVGIrFMZbPgTqAEd8
	v45CzQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf79dym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 12:16:04 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5a10923f7d7so2651377e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 05:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780402563; x=1781007363; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ANrwuqdjefDIFHmc5n5pfhXi8/X9vYH5MINxqlroZ0=;
        b=CX0TiurLXQZUjTl2DK5tCXipvyu34zXgKWI8V/7byTfBvb9ioK3d1ziHO/fgWBUjmH
         6Ua8hOTC6tsg9N2ZVCkj3HhtRoodkG0WLCt+diNPCVGNVs7syFmu9mTYEX1jyadBKD7l
         E4T5BG8BgDf4sxa4lSu4kewPtKkNmgCfh8oUxBetRJ5pUfSRwvV/THuqQBujdMdJpIrq
         s3PNh+c96nsH4EIEejSrACf1YhP7tUH9MkVjIpgeK5hTQunumoeEMl2jRdrw5TBan85T
         6ZRCvU1OjXYJ0lpcE4RkzbNmvs3ZNJVlOc28zFf2Eyb8z9UrkThDmqLW1aLZ9xGWcXh+
         3FKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780402563; x=1781007363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ANrwuqdjefDIFHmc5n5pfhXi8/X9vYH5MINxqlroZ0=;
        b=WlIwr9duvR7Nv+QOGBM4LUaXyTE/nE3BdvCUiPYGsIhURhXO2J3RNWkirTQXW1HM1j
         RG+OQjm9N3cPM8Wz7eUby+XDxhbqi/l4BbH7oAm3JlLJwQ4YHFDb8TtnaPhsypTPqgcK
         H4x5+Zp2Lyt/4A2+PcWnTqQguc6PsYLM/GkfYX1y4fh48hUCoc8Mu34tKdkGQFqc5rYC
         tkYNS+NaYcRzHMdUd+hCDYSmu0VZW2eZz2NCt56C5oMuWzp6lO64f/grff8/rh84WneC
         oFY9XkE2mpxPq9r1l0yAexj7Y1W5+GIrvTT3CYT1GdaRBf6qS2go3JV/L86o3APn66qY
         sApw==
X-Forwarded-Encrypted: i=1; AFNElJ9jJ9j+b7QP84YBqGOxdb2CXcyoKALaxnU4AQVW3uE43SngCcRTv50GfeUWKlnWNMJlGbUrYDflNUfT6eIpuk4q@lists.infradead.org
X-Gm-Message-State: AOJu0YxTjR566sja8M5Wafrk9qIyMg+D3+Qkh0dTQuSxntL0osBNq6ip
	Tf0J5DHfiLkkSruv9Owb81S2UKnF6LS2If+2hAacR7NxDcrthp2YCB8MDxvNoYdI3BxxJDUOQsO
	wj/PP2gZ0M3xmk2aqfiQqSwIl10PBktwiLaEEpnhYAdSyGpAO9YjVOVKuW2PPuz1u0j7R8giFU6
	hw9g==
X-Gm-Gg: Acq92OEPWENVhxXF/BrXOjthTWIZteyRDE8E7IFcF03/DmYw4p/GsJ9R4lIk0Gs/l0h
	MxpjW0aE6zsAH8IwXYKHvVKzHj3mua0oQfZ3wxImWNzdr/8zK1BF+UVODRjeJE1ZGM9IVx0MrOG
	qc/6l0ymkpsFILgzuwU30YopnmYx/74PJg+fTOCQNl8faDbeSG2Sspc+SUzQAqN7sF/S28CV108
	6cxsw8xPkHznk1AUHeii1IpuyX7ylpK6Ad4Pdm8dt+da5aAspL3Ns8/lF/Wll/2ayB8Hs6anyT3
	EzXnY85fDBFyL8AYSwrOg/qxJvkPX7FRVsNT/IIDRAdtADenralH9Zx2jVtWgCIFSESGhtQWTc1
	uRHlJKkoONasmV8Diw6ggyOzfeBzSk6a+PvG1dIi9XzuHrNqYzfs2mD2zuw+29LJn7wi2XJ/YUK
	in
X-Received: by 2002:ac5:cd98:0:b0:5a2:497:328e with SMTP id 71dfb90a1353d-5a3ff16a77bmr1158728e0c.6.1780402563059;
        Tue, 02 Jun 2026 05:16:03 -0700 (PDT)
X-Received: by 2002:ac5:cd98:0:b0:5a2:497:328e with SMTP id 71dfb90a1353d-5a3ff16a77bmr1158685e0c.6.1780402562608;
        Tue, 02 Jun 2026 05:16:02 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e7639csm65066665e9.10.2026.06.02.05.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 05:16:01 -0700 (PDT)
Message-ID: <49dcaade-4927-40e6-9864-9d4f3a8412d8@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 14:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: meson: sm: add stub functions when
 CONFIG_MESON_SM is disabled
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>
References: <20260531-fix-missing-meson_sm-symbol-v2-1-1def8c3c169f@aliel.fr>
 <8c11a91b-cfbf-4b9c-a46f-907989bf8305@oss.qualcomm.com>
 <12d74340-0213-4f7e-a494-10ce147844ad@aliel.fr>
 <0c5033f7-1535-49e8-a502-426e54333496@oss.qualcomm.com>
 <59afecd4-7749-4be5-a261-a850634178b1@oss.qualcomm.com>
 <376eec65-20ea-434b-a6ee-edbc12e6d7d9@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <376eec65-20ea-434b-a6ee-edbc12e6d7d9@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WKRPmHsR c=1 sm=1 tr=0 ts=6a1ec984 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=LwlhRjmIQBesJAWEzoAA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: rXL4kPrY96UHvEV_mtYqjXUhisxjqAa8
X-Proofpoint-ORIG-GUID: rXL4kPrY96UHvEV_mtYqjXUhisxjqAa8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDExNyBTYWx0ZWRfXx7Zmn9i5Zsy5
 Dm6lmLb0zIYxWZiRNipXf3Sy5Mk92ZGytwB3JOfmL26tZ9AqHog2ib8GRnD7z/CDEBqcbIhS3pr
 EQ/KmN5C4VpzcOk13as7Lsdt82v1oYDV9rFkn5fhmT10+tzn8R6m6SJ8U6nKAG9COkceOVyx3u+
 M6ELXr1YBZCEAC9tKmRAJWMA+RudogXydYe8rdLbOTep4aepIMKBPjdwqTh9RlfbR8poIjxLbzm
 V7cqwXHhEaqxPCPehVa4jwRdOydhaGk/n4xbOuZY9qeeOi0Zm8HJvyEqBqxvf8kKUt8zLTtcMP1
 HMR4KBYY6Mqn+dAoI/XmMpqne5y6+9fsVbp2G+o0Cf+wKqqVLeg34CyE49/smlkbqZvvzog9ZDW
 wRjHd6aZuRdLW5WZb4+XTGdCpvOLeVEJmw7zO8obBH+9+BglhxXfJwIge2ZpopChgY/6hkiWmpn
 JgwEV+ubfvSx5TMu7iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_051604_935252_50279D46 
X-CRM114-Status: GOOD (  14.19  )
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

On 6/2/26 13:58, Ronald Claveau wrote:
> On 6/2/26 11:57 AM, Daniel Lezcano wrote:
>> On 5/31/26 21:58, Daniel Lezcano wrote:
>>> On 5/31/26 19:49, Ronald Claveau wrote:
>>>> On 5/31/26 10:41 AM, Daniel Lezcano wrote:
>>>>> On 5/31/26 09:51, Ronald Claveau via B4 Relay wrote:
>>>>>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>>
>>> [ ... ]

[ ... ]

> Sorry for the delay.
> The module issue was raised by the test robot here
> https://lore.kernel.org/oe-kbuild-all/202605310154.bmdMBZHJ-lkp@intel.com/
> 
> If I understand correctly we can drop this stub change and only use a
> "depends on MESON_SM" for the "AMLOGIC_THERMAL" config, is it correct ?

Yes, that is the simplest solution for now

Indirectly related, where is the mod dependency telling meson_sm must be 
loaded before the amlogic thermal driver ?

