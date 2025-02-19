Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7207C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 18:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EX7iW7aQk19gr4mr35uOFeWPZKaps87azPiJHXGQMpU=; b=Fj0bpgZeeLH3USCTWB3B8VI3cd
	mZbeq4ao2I8Il6sVMHvcLUgBS/syd9Sl4hrivOMHTSvz0TL0ImCMrro3pX7iu4D4ZDXWpPc6L2we1
	+hWhH2HAG8hB7Ot/T6GeJfK1vJ1JryeG34s9OGestaX9aMQv0a6b5Vsp9JZyNPL2vjA7lDBrayNG8
	Gz40T0BVjYPc8TRmDvmevdGGoPIbMCueY22VgagGPCUz+EkLgtwAmV2X5QuS0GmNjuo2CjZDMCXhy
	LOVBtabEIgGieJk7X0p9GS7fH33CRLLAWLeefqHVzzI6gOVcytN8C0f6izJ7PsHwmchaO3KPiUWQP
	KZtS8mnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoZP-0000000EHri-3uCy;
	Wed, 19 Feb 2025 18:13:15 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoXv-0000000EHV5-0h36
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 18:11:44 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-abbb12bea54so26580766b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 10:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739988701; x=1740593501; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EX7iW7aQk19gr4mr35uOFeWPZKaps87azPiJHXGQMpU=;
        b=A7Mn6eYt2VVez4cm1ffenLUlONFZArvZ2icIZYRRLF9wocpi8KM0U4M3fcu5YkPGuG
         pMD0sy3XF0tZFbDp4tR1gheGPmxWIJGvcCxQP8OBJdwoXg86X5oRaMuoPjfEkzS3o8eH
         Nm8tgj4hYJAVqFEXjCBHbKRyuom2L2oHCFyieCsx39ZSR8i/Q2iU6vBqU5Jnx9Sx/Z/r
         OV1VsYkA+KmQcp4xpHpO421V1Y+s/c5I8JrtjMQJHTmKFQNW89j64L1RTvDiJEp81Fc+
         xhspp1O4PQhqLgNk+IiLCGUNj/qVppAFlK66qpIO0x8B992WmfL/QJ/q9VhdaPD58RhQ
         aa/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739988701; x=1740593501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EX7iW7aQk19gr4mr35uOFeWPZKaps87azPiJHXGQMpU=;
        b=pa4v/xWoWTC5nlBdnuktBE0Z117UmEZK7iwYiSR+MupT2V+U01194YbnZRmeawNXs6
         dUIAqAY9ZTGm1x3ZlYzOLAaIM3grF8zthrC/uvxW1HN5iv0SOipewo3BB8CRPvdi8C7a
         +GmbwSrc1igwWJSD0qefSuPIAXA8TWnElWcJH9/Lf95xzUAnJlJY86UMFnHSuh22mNgP
         SPKM4z7d8tHkgyi22hheWsdRKscWtX594KZoOFxG0yixHUTnMRCOJ3vrAOc8DEiqEAzA
         7/7HOIY8n9VaA+RiDz/xqrmnsfyXcpnL53JDtOYzZRYjonVVPDZqHs0qZ71mz014sPn8
         McJw==
X-Forwarded-Encrypted: i=1; AJvYcCWjq2MX/Brt1REbKDlm1keSpwycRUuRTKBWEh6sjwruOReHcECvCs9gs1PeeY76IkM4BObRskkw9AgUWuygvxXX@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf3EIBzm4eo5IknRQZ4A5JSb4JeqQA5Z81KUr2vp0cPzT/5qed
	1wBFxsW+bRHTN3695PjteOI5ZWZdT0D19eYfNtNlSKNdR0Qspiz+
X-Gm-Gg: ASbGncsYdHiLv7rngJS1BmWbLgjY+bqj9R7XcFXyZVC8fa7HbYWCZ1q8/ATQvwghe3n
	WODrbT1E+sOSo+Jdo4zZY1f/1nVfQHUKDSO7FwK3JT75Q8BVzEGPY5F1zA377XLzMIDU9JOGpsY
	2pasJ8mPqUp2MzsuGNgH4zsPl3hSe6FBFDfkbPoxuAUFbQ9Zvw+w22ur/rn2dJC6uqDBVDCY/+Y
	nEr923XIyFoPkSB9d2MjwnIJIzaWjxuGdL889Au8s9DJaDCzL+G5vp7LSBAJPRjYVOk1ehmCYfn
	JpGJmRxgoZBKiZ4hrh9KGF379eau7uW5Ah39rqZRLKkNXyo=
X-Google-Smtp-Source: AGHT+IEJpTPW7wSmUpDukWtijT9eGXBjCmFlUxZGRjvR2GsGxyDjjg4XrIW4SthKGdN7ujvQTG+O+w==
X-Received: by 2002:a17:907:934a:b0:aa6:9461:a186 with SMTP id a640c23a62f3a-abb70dd663amr1847442766b.46.1739988701033;
        Wed, 19 Feb 2025 10:11:41 -0800 (PST)
Received: from [192.168.125.132] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba7c63162sm524674566b.182.2025.02.19.10.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 10:11:40 -0800 (PST)
Message-ID: <ceca2d24-78a4-48bf-872d-71866ad97b92@gmail.com>
Date: Wed, 19 Feb 2025 13:10:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] clk: imx8mp: fix parents of AUDIOMIX DSP/OCRAM_A
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>,
 Stephen Boyd <sboyd@kernel.org>, "S.J. Wang" <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
 <DB9PR04MB8461866A0B6A068E49D53FBE88FA2@DB9PR04MB8461.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <DB9PR04MB8461866A0B6A068E49D53FBE88FA2@DB9PR04MB8461.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_101143_206433_B1C395D6 
X-CRM114-Status: UNSURE (   9.99  )
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


On 2/18/25 08:43, Peng Fan (OSS) wrote:
> Hi Laurentiu,
>
>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>> Subject: [PATCH 0/4] clk: imx8mp: fix parents of AUDIOMIX
>> DSP/OCRAM_A
>>
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Correct the parent of the AUDIOMIX DSP and OCRAM_A clock gates by
>> setting it to AUDIO_AXI_CLK_ROOT, instead of AUDIO_AHB_CLK_ROOT.
>> Additionally, set the frequency of AUDIO_AXI_CLK_ROOT to 800MHz
>> instead of the current 400MHz.
> The patchset looks good to me, just one nit, 
> Should fixes tag be added for the patchset?


sure, will send a V2 with that


