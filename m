Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D877C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 15:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umz6FsDsVFwJuh2rg9jtJSv3h52jbplrjXp7FNQjbO4=; b=HHO5rOO2delmtc3BJcIkNa0WFH
	hkeNpOdcQK9SGz7PYjJUJmqohz8JaLqmX1PrLj1QuJGZagXV3Fr2Wa85fXVkFiE33G1Ag9pZNHTos
	VbxhTA6Y9RAV6RsWMoI0mS7ClfJlC+ADkdUhaxrzavadw0NjW2hLsIvSSQOA1Z38dwEYhf5UOJ89w
	U8U+6LqibVmdeP2CYCZxVd7ySOMr+70Cs5fQGSVNK7Gu67YXLOrbbyqv4FckOZh4v7jhH1bTD8gbR
	3lk0wzHxxsmiI5JGGntdypPKhpQ0Gk9YT8k9gYP1HwDz5h5f00jD0iMNxuEY0UgNjtRKC7pAzAlhI
	uc3WZVNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tacMH-0000000AWUu-1IVV;
	Wed, 22 Jan 2025 15:09:33 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tacKz-0000000AWIQ-1QzK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 15:08:14 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso7514525e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 07:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737558491; x=1738163291; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=umz6FsDsVFwJuh2rg9jtJSv3h52jbplrjXp7FNQjbO4=;
        b=UsmzrsGKETmR5DxJUavXGjhR9su8jCZcNi3IIPFsABHq7zEMPV2UYZsPPkdupObM8H
         iYmCr+tHaKEYPlaSQlnGMYTYyJVow6zwN8VlEhSPLDFgy3RjA3XeutUVXHITTS7901zu
         ipNuZzzhFyrr9hY/h3HXmQa9Unhl5RZe00YnhVVAgfxd8CqsbVXpIi89tn5DEUXhHgTO
         BRoG5c7W/GK9hj98DA0h7ZJNiIGvF5hZlV2PYiKc1YdZwGJT5UUgt3EXqHorg907/4H/
         IMZN0jLFm7P1/d0ZHubB7c7dj+X3NVmCwlY9viaha/VlpM0wpPpf+YxMshlectDKwPZM
         EViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737558491; x=1738163291;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=umz6FsDsVFwJuh2rg9jtJSv3h52jbplrjXp7FNQjbO4=;
        b=gUPd/CpRVpV6lnUPbrdkYqNpVwuiI8utmgqCy2DPVGC9w3yk9JxgLMIE6IrZ9NwTv0
         RHMdOOaq0ohzRf92mmAV3UheJgX1yio9iopFbTb2BD9bOpoSzM9aMkAaB6Y6JW3N8c2U
         c92BfAVOv27YZ3OziPkT7z4t868ZKxmb+tm0YEgrHhLiAF1omRSWi4w/SfRBH44pLlQf
         KdMAIiTCV1zLSdcHxep2aAz6sGw0jv7Wy7h4hpzg3J5pybj/utJ4rcn52hdnxWegQnX/
         ch5rpOppPgXliHTbOJOoruM1fSj3onPHkPVILboLk/mKHH0D/mrAYUnIUkZFo8cV/2J7
         laBg==
X-Forwarded-Encrypted: i=1; AJvYcCWpKTuRkC919vDcTHucdydIhmmLaGXtNcZtH0aKcwipFPJPOkqEoiifnjWsZ0sggEsWszsudImQaTW/7UyOdZO/@lists.infradead.org
X-Gm-Message-State: AOJu0YyzQ7FuxI6DnkGGpL//aJBmTMtYP1h2G7grtozogwyGOlnyspKx
	2HjNo2h+7kXPhE6+4bSF3h2WFZYZP5UKuhhdl1BxyrrUo6Y3iY5J
X-Gm-Gg: ASbGnct4/P9uyyI46G/kKIZKP/gzw0qlRtRDi61rd6AyonusVd6bPlVE7V7fhqbgqKT
	7UwC2zs6rDUUL1iH+E1yBeTttGGqrcgzSdCM8mcHlYQDG/ml4ZHLijc1CXFWLNwOINpRz5VnwT5
	Jg1fZ1tib1DLR40+DPPm5A7yeeSfSY/hFre5wVTWFxQFYrZ4Si75EACSGXPt2D8P+CCwnJLcoll
	YRtrwJ9QpT4mSoAX38O4EiPc2Z2Ec3v+g/xdSnOlSqc0sFvw15J6OU8elbYqbKETB0LS4bxNtBA
	0FKN89XJ1wwwVTqLaK5CSCeoUAZ+YNV1cx2bEl4JgIgEJ/jeYx9xehlmQ+xbaiexZzmpKzYAZgR
	6BW2j5MKxe4sAIOE=
X-Google-Smtp-Source: AGHT+IE2a0yAIO4BOuV/oNsZg2RXIMgYsnxf4ES5Xw9/S5/1JbkObgMJtKJi8R+5obE5eRRkCTd+ow==
X-Received: by 2002:a05:6512:e83:b0:542:2a81:a759 with SMTP id 2adb3069b0e04-5439c21f23dmr6119766e87.2.1737558490533;
        Wed, 22 Jan 2025 07:08:10 -0800 (PST)
Received: from ?IPV6:2001:999:584:a1be:41d4:8b85:aace:5430? (n5ykva7sx9871hnihio-1.v6.elisa-mobile.fi. [2001:999:584:a1be:41d4:8b85:aace:5430])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af07b5esm2263566e87.45.2025.01.22.07.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 07:08:09 -0800 (PST)
Message-ID: <decd473c-289d-44be-b882-3f2bb15c0d57@gmail.com>
Date: Wed, 22 Jan 2025 17:10:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: ti: k3-udma-glue: Drop skip_fdq argument from
 k3_udma_glue_reset_rx_chn
To: Roger Quadros <rogerq@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 MD Danish Anwar <danishanwar@ti.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: srk@ti.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250116-k3-udma-glue-single-fdq-v1-1-a0de73e36390@kernel.org>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Content-Language: en-US
In-Reply-To: <20250116-k3-udma-glue-single-fdq-v1-1-a0de73e36390@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_070813_382020_15FF6450 
X-CRM114-Status: GOOD (  11.45  )
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



On 16/01/2025 17:00, Roger Quadros wrote:
> The user of k3_udma_glue_reset_rx_chn() e.g. ti_am65_cpsw_nuss can
> run on multiple platforms having different DMA architectures.
> On some platforms there can be one FDQ for all flows in the RX channel
> while for others there is a separate FDQ for each flow in the RX channel.
> 
> So far we have been relying on the skip_fdq argument of
> k3_udma_glue_reset_rx_chn().
> 
> Instead of relying on the user to provide this information, infer it
> based on DMA architecture during k3_udma_glue_request_rx_chn() and save it
> in an internal flag 'single_fdq'. Use that flag at
> k3_udma_glue_reset_rx_chn() to deicide if the FDQ needs
> to be cleared for every flow or just for flow 0.

This should have been the original approach, there are things that
clients must not care.

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>


