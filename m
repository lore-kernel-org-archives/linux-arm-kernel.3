Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7B8CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3SJwH14gWblsk/bE7J06KsarJhv61Jks87wu8Zo5Zo=; b=2tNhAZN373ia/DACA16juv6MtA
	UxqOmY4nl+e3u2LReOBxowflhaez8vFYM9qM2v0cgUPuFZVaS7tlwfR3cjhR0hS94hz9q1I8dEd8Y
	ftMrZU8iWO27fRoqFtL8NYAOJ4EnJ3Zw280FNcZXwPdHm1AfAXRE9EGb+pcPtRJ0FFrqsPsgoM7un
	u2fQpozXK0XO1IS2aZIQ/XUKzKiK5BLBdlwtKBaXP8cwTMwXRHwjf11PElkc3d5Dms2h5aSKpgD6h
	Ugaa0yhIT5RctSZ76KjURUQszrFzTjxG8qh3LNSHy0HM39QPJodVmEHwlagCq5lJrcZKpE3HZgP4t
	gwrz1pLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ00f-00000007Maf-40AA;
	Thu, 21 May 2026 09:48:09 +0000
Received: from smtp1.tecnico.ulisboa.pt ([193.136.128.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ00c-00000007MZg-3h5H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:48:08 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id BA9A06002999;
	Thu, 21 May 2026 10:48:04 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id CsHTc0whN2v9; Thu, 21 May 2026 10:48:02 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 6FEEB600086C;
	Thu, 21 May 2026 10:48:02 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1779356882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C3SJwH14gWblsk/bE7J06KsarJhv61Jks87wu8Zo5Zo=;
	b=RpfAUNgw5fB3ERA1e+htSwHpxxpyk+KpVPABzNulM98px9rfpjxaDVjRWaFhj781X1a2eq
	leVhcgQCYKFFNyGRRLg++Z6bzoXO783UjxGeTlnPG4XoeSvEk7Z7AlXr/3hRAyr33QUel5
	jdV7I3DcT6GfBKR/xZWNmskRl1JPpIXR+uS65jyCwbo+LUvQlq/gAhDphy4oZHCvp5vLiy
	LwxaWgLjpwNv1a9YqpVywElhJrtNCMnBIc3mDB77lf/3nLiOBdYvEGzYvXVAqZ7zyjxz9E
	TRM6hLjh6dBR4JuLyF7gG81m+3660UZFv7MvdpKf6MYqkPai9b8uCa/sn+og9g==
Received: from [192.168.96.1] (unknown [89.214.153.114])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 902643600A2;
	Thu, 21 May 2026 10:47:59 +0100 (WEST)
Message-ID: <31ef61bd-6672-440a-a52e-eedb950d3d03@tecnico.ulisboa.pt>
Date: Thu, 21 May 2026 11:47:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/4] power: sys-off: fix Pixel C shutdown via
 MAX77620
To: Lee Jones <lee@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <177929432727.2891971.15568098895295536822.b4-ty@b4>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <177929432727.2891971.15568098895295536822.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_024807_060699_7A0889FD 
X-CRM114-Status: GOOD (  14.98  )
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

Hi Lee,

On 5/20/26 18:25, Lee Jones wrote:
> On Thu, 14 May 2026 16:47:18 +0200, Diogo Ivo wrote:
>> This series migrates PSCI and MAX77620 poweroff handling to the
>> sys-off framework and fixes shutdown on the Pixel C (Smaug).
>>
>> The first two patches replace legacy pm_power_off usage in the PSCI
>> and MAX77620 drivers with sys-off handlers. Besides aligning both
>> drivers with the modern poweroff infrastructure, this removes the
>> global callback dependency and allows multiple handlers to coexist
>> with explicit priorities.
>>
>> [...]
> 
> Applied, thanks!

Thanks for applying the patches! Just a question and an observation:

  - I'm assuming you were ok with merging [2/4] despite the possible
    deadlock since this risk is already present in mainline in the same
    form so we're not actually making things worse, is that so?

  - The observation is that the comment about overriding PSCI is only
    true after (and if) a reworked [1/4] is actually merged.
    If it isn't then patch [3/4] is actually working around another handler
    in soc/tegra/pmc.c where a handler that only does work for the Nexus
    7 is actually registered at FIRMWARE level for all platforms that
    probe that driver (I will send out a patch shortly to only register
    the handler on the Nexus 7).

Best regards,
Diogo

> [2/4] mfd: max77620: convert poweroff support to sys-off API
>        commit: 1ada6d7f88063dd6fd92d74d0b803875b695fe01
> [3/4] mfd: max77620: override PSCI poweroff handler on Pixel C
>        commit: ea3f90bcc8524c6d514f6b8183cc202b79b082be
> 
> --
> Lee Jones [李琼斯]
> 

