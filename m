Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D9EFF60FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltyTFwopAt48x4pgd03pJK6HEdSrWRvPeSYlpAsSeLU=; b=aoTNHJwGQWLo2PvMr75KvEsS5e
	MY3LaB7bbXCV7fvnanIjuIdgs2uI6Dht6IbUeDeGH3ez3VPYTOG1sbRs1nHb626W6y1FfjyynHjKl
	YtYqeNjeem/ZtnTgYIqez93LbF5mEaemv+Ne5j34oN5OnCOhy6Hvcu9cawVpovYe9BT+TBF2JNHN3
	i68jEQ5cRfi6AuDG5BpdqavGTBOzbDF+EjPmovf6QHn4iVMaE5A5hegR9C/FFgl2hFL82e0dH16+7
	QH0MsAfhUhY2al6ItXrqi0HUXbUE6OS+zSmuPOrVF0gjJM2rC2oh8tkN5qmy30YkYVcFqcUN3YyCY
	+urUC4Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WaV-0000000Cnx9-29Yj;
	Tue, 31 Mar 2026 10:44:47 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WaT-0000000CnwI-00y9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:44:46 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a285840940so729357e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 03:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774953883; x=1775558683; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltyTFwopAt48x4pgd03pJK6HEdSrWRvPeSYlpAsSeLU=;
        b=PYTv4n5b+b3hvU1QcxR/Yvp6Y9S4h3xOWfKDeLCkPjZ8vDGb1UhHqxfR8KyHdO/XzP
         kjjEeen7KbYINJGHjqOhi1IAJY+tTwrWgr5yPVc2UzgOlhejF9I0KJ3LtanS/UC/XwY8
         sK8LHBqF69MGW2IlzzBrjFLommlMfo5myU2gXWcxhvwZZYmMuAUsLy7NM7c0DE9/edgx
         i+My666z4nrsQ9IZ/GS5KKNdORjd50IhCQRzhg4KhidoJmVi8hhv/3z2VNCcQF5JOeP/
         J6L6xJcmbZ5v/vdQdfkQdIZK+/S0yevRyFRd8QXGD4SXmgAczy1hWhyCywPX1la2GmOv
         bEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953883; x=1775558683;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltyTFwopAt48x4pgd03pJK6HEdSrWRvPeSYlpAsSeLU=;
        b=jseHdAfrqBRdplb6mGQYG6PKacd/TPxzbig4vVJa2p8ju6WKb/2dPfXNHMc+4uqqsr
         bB3pT9PVFN1WPi1fBKc1PHYIDjE68fjdjtaH7//iNv4sZQHHQM8nZ9ejXuTl+AdBvI/w
         GqbPHam9BKs0YTH5qJWpDdCiTBpAy92mx/9YDCrvKBJCtsXqEYfQjoXv1G1gYjYLjUER
         OTuV3jrruBQdFiGVbI1UTYc0rZWA7Td1xk4Mn2xOXqHhE6WPx0SUMa9dZ23nwVyQDVRV
         VNiag77vXbBfin8HwSWB/6MXiAAA1zNxzmhb1+ni7s4+PWkcQdCOuWtWG05z4qHVF9qt
         zWSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0nwQ5eD1VsqWsSuKgqz1300JVWuX0ab9w/J5CgRlN8URbAd2edIofx+56sjfFeyxi2Dq14uZ3mNZ5iVpBPIjX@lists.infradead.org
X-Gm-Message-State: AOJu0YwUS1WWEJ4qvytKMgArufThghhqt7wEnq+PuAKl2AyypoMdM56A
	JMvpMCfje8eMwc5i4g1zsBP8oP6RY8s/hbyOvv9aqJVGiqn608T9niqCWP4lm8J7gSg=
X-Gm-Gg: ATEYQzysE04PqgLCA7I6G1/w+DI5wJAlXVjtLM0mp3otdF7/VBWEgUNdcn1m2FM2IDu
	1bsfpfnPuWgq7m3hAW7bbBFBTizRd5JmiC9x54sOK1SM/gCLqLnI91ExHhUaf8LjgC5inoYsMKe
	MQiFftatuo4jEJj/6seGbJfkffCVZszcabYaIzOrjJQLtKcAV6NPL+VR0Djo4ubXyFDowACafzP
	NFdtu7zoZCh9JgV9f9oLkYy0cQjCqtI+rWoteIR/N1a3evGzHUrmzxiboFSQYuxekLSZgMmjIhT
	pNTZwaqLQ5kahryHFRdG+WV9IzyByrQjPY566WQ+ALRYi84JMqUiQPSpCBLQlFJTDW4gypouGNC
	xVILenp/7e4eOdSmsWHnCNmzZy2OsouaCRGeTfTb2rTcMmSv/H9tyXMcNnmkTili2FQFcye8QQb
	wBjoHDO9zPwRuJVLyPMa806huWPU7S1TLg04BpAEcAZjNCYlgoCkNhFbE8dQVWyJwnH/3WAnzF/
	ZvfoA==
X-Received: by 2002:a05:6512:3b89:b0:5a2:b53b:a457 with SMTP id 2adb3069b0e04-5a2b53ba55bmr1795381e87.3.1774953882760;
        Tue, 31 Mar 2026 03:44:42 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1403f69sm2330915e87.29.2026.03.31.03.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:44:42 -0700 (PDT)
Message-ID: <ebc7630e-c87f-4c17-a743-05e0639d5093@linaro.org>
Date: Tue, 31 Mar 2026 13:44:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Constify list of critical CBCR registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260331091721.61613-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260331091721.61613-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_034445_054077_BF65AB99 
X-CRM114-Status: UNSURE (   9.15  )
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

On 3/31/26 12:17, Krzysztof Kozlowski wrote:
> The static array 'xxx_critical_cbcrs' contains probe match-like data and
> is not modified: neither by the driver defining it nor by common.c code
> using it.
> 
> Make it const for code safety and code readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

