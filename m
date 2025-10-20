Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E393CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEZOmmPRU+6Jp7MDbpYX1wr9n73+5CZ3iAvnUvQZOdM=; b=h9PAx55vK+3cfVRueXuz0+0BLf
	hXgYX7uI8UlOoRGAhH9KVBY1tpxXaCPGTsRMt21wrkCRVA5GKkz0aCkcKtraNwNclm5Yn+2OoAYVR
	Tu9KpHQApnRsVxU4hd6a0R2UxAoJD9WmVYSXfrL820HUSxXWuGTseYneDr4C9zjG9RSyCoBcbRiv3
	evLedWyLCHxMiJvEpJbd6m5qjqBnKEDOxdCFpf5JHpEa2RTZ22DoBhzGjM9aH/75+FVCYrQC5L7j1
	SnXVzVztNu5a3r0CH602Ez4T7Xf/TDVs9NFlWXKsNC0HC+1S6nuODbwsS3LEdm8urM4wZtXGXKn3m
	6QUvI9Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmab-0000000CfXa-00iJ;
	Mon, 20 Oct 2025 09:54:05 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmaY-0000000CfWt-19wx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 09:54:03 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4711f156326so27691935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 02:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760954040; x=1761558840; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qEZOmmPRU+6Jp7MDbpYX1wr9n73+5CZ3iAvnUvQZOdM=;
        b=xnYuzYJdzSxPNvswWI39EbcSze9OpNu7qVpR1NItMNmXIuANgEl87hvZZAeMcpeJJ6
         5q7QqOb43AMuJs/CNWpIqgAfnpf2aoFnsSeSoWBcKbPWwr87JAM6A0N5rbeZHgEvjyf1
         CScbt9W7YOjYMv7Xq4bwgl3719PblYSCv8Mc4LH+FMGAbNujXFk9/Aj6g2eHKV0WVJO7
         YXHbVH7CkIJnhbXeQ0sMMqeaKwsRf3k1ozzcWethLbm6K3traD2S0uq00M5D248xK9Tm
         jzyLs91kl6RFCjGfDhiuV8QpK1SIlWKK6f/G1rsw8EOOy/eQhjucghOXwU4okH9AD6z1
         z0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954040; x=1761558840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEZOmmPRU+6Jp7MDbpYX1wr9n73+5CZ3iAvnUvQZOdM=;
        b=R40qNzqe1wbJh5le1oU8/zbhdvTk5ErQyMOBJg6qj/1/Vn8WJzWpdUr/uvrOtR1brW
         sEISJKOre3Pub9m7O7Fit9TTk+nYt7LTd1RbcpyZJlGi8LnauPrzGnXlEsx2hElsMx8v
         YX02C85mYjb/kRy9xMj2oQLeqOieGsB94nWKBFuifwupDtWF/dwJtl2x/mBZjam7Pegx
         kXx1I7z7sFnfkUSDz09FPExxK+ZpMpxx3RJoKcFwiYZsz4oWasMjHqJPuVvTeEe6dB3x
         f/dwMWFW/AUs27vzawlycR5G2zTCcQsbhyjCdECfjRrlG3zdHFaAorMpjIGTRjDSiEho
         Nv0A==
X-Forwarded-Encrypted: i=1; AJvYcCXF9D8ETBW/g0pHoYxc5gNgEcg/EFvChUqj+o0KE18CX3cNit/9s3J9aC83NwpQCNSr52XBSkHIpP8wHUGWOdna@lists.infradead.org
X-Gm-Message-State: AOJu0YyqM8QhcLkMPNuQKe2lqn8NhLG1lB/ZmUQGiTM38pMQMxBWJnYp
	dDOJ6jGxNiMfXLXE2EKPYaGaM67Lg3TTs3sz4awx0zTwldXlUAxDywGN+POhUCN8t0k=
X-Gm-Gg: ASbGncsSDhS8TSgAMbGG5V014BfvFWnBs/QGIbVO0/Y9pAHkqTGX8qscXr2AQSmd5yM
	1GT8PaI/DuRJxkBaEnLVh6EQLdYvnyT/lW2WEez/AjpbGTHKPj9GWaxKlUcCjLhBjJQutQK06zf
	IJ6qOmVCqPFClw/EdPdZj9/xSVSVDlIvNCRx9PA75Se+0WbdVkc1M3eNfHw0yw+hCAm7k+GBYqX
	o4zjoaevtN78sEptH5h2t6qfqTqYco878ufXC8mky+8wSn+LspdpNbRy45kozqGhVTHfIlLAXLy
	G+62FdfkSJii8yo97asIQvXee9wtVacWxC6cv/fqpkYopxfx1aOXMKCmk7NZlN3NhIY/YOtdEr2
	tUGPCbVE9rteH9tkl8+ynvAO2bi5PSRc5aLrItRJe6WGdUOvj1mrBS1eROvZjoH1ouQh11B/sAj
	gXCQ4Tyrzf8bgFncPgMsbREQnS+CPrsA==
X-Google-Smtp-Source: AGHT+IFX1wgTFn1MLKPhwOgGbyn9M3V01/rxbBTWs1eN7xRNGNtr9tOjyrzfftVxp4Ewsx3pfTiwYg==
X-Received: by 2002:a05:600c:3b8d:b0:471:9da:5248 with SMTP id 5b1f17b1804b1-47117917155mr87074895e9.26.1760954040323;
        Mon, 20 Oct 2025 02:54:00 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4714fb1b668sm156200285e9.0.2025.10.20.02.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 02:53:59 -0700 (PDT)
Message-ID: <cad8f866-1655-4f4d-acf0-a974ad40ef39@linaro.org>
Date: Mon, 20 Oct 2025 10:53:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] exynos-acpm: add DVFS protocol and clock driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <4a436c40-0fb4-47b7-bfd4-0bc499e85b5a@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <4a436c40-0fb4-47b7-bfd4-0bc499e85b5a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_025402_336928_F1F528F2 
X-CRM114-Status: GOOD (  12.69  )
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



On 10/20/25 8:03 AM, Krzysztof Kozlowski wrote:
> On 10/10/2025 14:46, Tudor Ambarus wrote:
>> Dependencies description:
>> All patches should go through the Samsung SoC tree.
>> The acpm-clk driver (#4) depends on the ACPM DVFS ops (#2).
>> If the clock subsystem needs to merge the new clock driver, it will
>> need an immutable tag with the 2 patches.
>>
>> The following DT patches depend on the bindings from #1:
>> https://lore.kernel.org/linux-samsung-soc/20250924-acpm-dvfs-dt-v4-0-3106d49e03f5@linaro.org/
> 
> You forgot to mention that this patchset adds new dtbs_check warnings,
> which are fixed ONLY after applying DT patches.
> 

Indeed, sorry. I saw how you handled the dependencies in your tree with
the 2 dedicated branches, I'll keep in mind.

Cheers,
ta

