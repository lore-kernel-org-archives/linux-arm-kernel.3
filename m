Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED53BEDEBFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 01:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvvy8mrMhzjULjG/waJaGKSbWOymXRI0aiNwOWuVKAk=; b=nZYLUARbsdqGU8ImL5KuSfeAH/
	tqvGQsloRfU5A15An2RIwEACrcwrFIOeB7pcstykXj74epaRVNOy4hLo7Gm7AuzEd6QsiRcUBFnQP
	jm9DFTayGkctHL9HF9sysmfzA0kUECv/TxZuElF6MbytKkfIiQYBDEM9JO1efEnEqduZHIABhRhpg
	J440kAJHdUA7D7ocShCrb9QumxrN0hF4igLtpFgia/2n2Ghux6gj5zY42O/Ao2iSEYj3omvpRLAAw
	GSAH/OKB/SjhqckrjjBk5lVzDjXfHHRm1VJbQbeWM6fb6bRRbImkUM16TEk2bgBEW0D4kEaMgF/aQ
	vwjy/+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxatV-0000000GEBG-1Uqf;
	Wed, 04 Mar 2026 01:19:21 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxatS-0000000GEAQ-1wf9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 01:19:20 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2be26842fd5so496633eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 17:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772587157; x=1773191957; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvvy8mrMhzjULjG/waJaGKSbWOymXRI0aiNwOWuVKAk=;
        b=dRY9IU2N6YPyA1q5Q2m7eDSFAdKKsczNoJ4/urOrzOO479JBlYinzQbqzI9R/TMCxA
         J5viv+NgJa8wix+IjqEixi1aLhymAbbKqYmpuOpzAGg5zZojWWxjMqZiecRHiibKDv+C
         m3oMv2OhFp7mxsJzBC5pigvMHkcHh+7P5Wd9W87cVQfzmguBk2+L3/MmN18wfZ2XXV/u
         7jDSfYv5YBkA1U6fh0BgNHb7Elip91d3dPkCoGWKzpyo/2UiDeoJ4QzGqkf63qwynauD
         sVIKAMSUgTFVqi5OiPchLy9QekrKOqP+RIqz7EveseY5pFPWooGOtxo1DZVXcotb1SqA
         4Vug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772587157; x=1773191957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvvy8mrMhzjULjG/waJaGKSbWOymXRI0aiNwOWuVKAk=;
        b=vsK4MmX+jnKW2Uk/mgalfL86cUHJIPwdoSSoAL4q9hgbSnupsBCwDYvUeOjsQd14Qm
         c6o1tsdSaThlPtXB3VvEexsWiBYpL4q502a4J21xgLM089fKNXcqDK3igNAwz5XwwcsS
         5tT82Y9lLnn96qX2StaGikTmt4rWHOqqCGNYz4fOEGECQTiHKkTx20kfyr8OznDR5wYL
         c8HrGsZuIPTGVZiWjfjR8Wlc3+d/iewLafo2HLqdKxLAqPabBVBZEyZPpnKMEhd7GuQQ
         msOyTttD09aVCMxFNglbfN/RoM/nQvO2H7lkITYxdd5/l1SrnzHh8YH0YA90PNFBUhmZ
         3RFw==
X-Forwarded-Encrypted: i=1; AJvYcCXQdqUsUGKHw5pHwRSUaGbyQE3LYvK17r8g2FjpolVXhA3+2yKpa7skkTN6LJVskDo4PARFzHFxIoYAKyOSCGwX@lists.infradead.org
X-Gm-Message-State: AOJu0YyxbwOyjPntWItFlnhCl0y+piZXBVpf4sSGu0kyS/23n2IgtnmZ
	+T9u7v7yhShHuoBlUtqcB4VO+2xplnY80HmMTecAXvweaiQtXEuXD3CG
X-Gm-Gg: ATEYQzz+f0ni6HIFNuRmr5aWUMPtzTayeFtrRzcFKpi9m7ATsCRfiB6AECsVKoiPWQ3
	OtzM+EoWG7Tb3p3Ti5yKZlWQmjwqeIg2kSNqPVXQJ41A1jhBUVfeEWHPAsiubVSHGy2c1ZULPqG
	HntyzDR87y+6snzXJBd22hAiV2zgTaIvi0Oia3ByIRVWrwk7VqbTjdkGyRfg7JmCNu6mOVCBqLr
	VLAi+TCMeQ1X2cX05RWYXtlGZr9Rz8y+3lGJH1ExAx7G0AmS5C9z8qF1sARLGDcLOCxWI5lJryK
	CQyAEYhmkYuFaYEaM56lwYS5mOLsQyYN6XxLIuRIAvlvi4N96QGpjf3U4VzTT6iH+Dbjv7KdHI1
	72AyvPSkCaQLXpRTWFxKMUokHFXiagitV6DIbtcU6D94WwJXiROZkzsmdLMDDVa5KpvdhWwZxjG
	usZiuUlneOpDX9FqvF3oO8HlU2a8QtqkUjs0BUSzxvq6Xi340=
X-Received: by 2002:a05:7300:ac81:b0:2be:969:75f6 with SMTP id 5a478bee46e88-2be2344da48mr1494176eec.9.1772587157326;
        Tue, 03 Mar 2026 17:19:17 -0800 (PST)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be0d7e0d40sm6999679eec.12.2026.03.03.17.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 17:19:16 -0800 (PST)
Message-ID: <05a15890-392c-41c3-9566-8eb506ddfe5f@gmail.com>
Date: Tue, 3 Mar 2026 17:23:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: ethernet: eswin: add clock
 sampling control
To: Conor Dooley <conor@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Cc: lizhi2@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk, wens@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
 weishangjuan@eswincomputing.com
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
 <20260303061637.872-1-lizhi2@eswincomputing.com>
 <20260303163846.156d18f7@kernel.org>
 <20260304-regulate-verdict-c3a361d2dc83@spud>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260304-regulate-verdict-c3a361d2dc83@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_171918_513703_D6FC0197 
X-CRM114-Status: GOOD (  15.61  )
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

Hi All,

On 3/3/26 16:47, Conor Dooley wrote:
> On Tue, Mar 03, 2026 at 04:38:46PM -0800, Jakub Kicinski wrote:
>> On Tue,  3 Mar 2026 14:16:37 +0800 lizhi2@eswincomputing.com wrote:
>>> There are currently no in-tree users of the EIC7700 Ethernet driver, so
>>> these changes are safe.
>>
>> What do you mean by this sentence? The commit under Fixes was part of
>> Linux v6.19 already.
> 
> The "funny" thing is that caring about users doesn't even really matter
> on the devicetree patch, except for this hunk:
> |@@ -81,7 +99,9 @@ properties:
> |                          or external clock selection
> |           - description: Offset of AXI clock controller Low-Power request
> |                          register
> |+          - description: Offset of register controlling TXD delay
> |           - description: Offset of register controlling TX/RX clock delay
> |+          - description: Offset of register controlling RXD delay
> |
> | required:
> |   - compatible
> And it only matters here because an item is injected mid-list. If this
> was moved to the end with the RXD delay, the **dt-binding** changes
> don't have issues with safety. I've not looked at whether there are
> knock-on concerns about users in the driver or whatever yet, but from a
> binding POV only that hunk can break something that currently works.

This was already discussed here in v1:
https://lore.kernel.org/lkml/e7183ae1-8b8b-4e77-9f4e-3bc1b4b63556@lunn.ch/

The device-tree is not checked in yet by ESWIN folks, so there's currently
no user of the dt-binding. No need to worry about backward compat.

> 
>>> Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC7700 SoC")

Bo


