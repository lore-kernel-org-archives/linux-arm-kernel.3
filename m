Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373FFC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gcu32VMFkj0C6+38vlpgNbg4lAYIVsUEn7JA5S7TG1s=; b=OaWF0+7VAI24dPqyw2Oap5lllg
	MKPjufC/L6GVTRkAwN4DTKSuam4KpN2ZpOzUc5/DRTjXuU0n26P+oEYXtY5iEeGnCERmpTW8LLLzu
	LtLMG7W4vgS4BQccQdCENfEoUvKOHqHVDic7Ic0/LAP0bnRKVrRK7Eucx8R5zfNBocX3yNEzYW7AM
	xI0SzBITzJE0ai3ucze7rjyYBip3NcQpRBFQelxFamhsWX2ghbwcteyL74w9InwTH0C2d1MBmhIxE
	sBrUONx2LGgi7MVwb6nLSxDqJv0Qr9SUHbDMgRES9+DEAot01/gR12pjOJ7c/YlCRGJ01RS21DeIX
	8ZeDkV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubLGM-00000002i2x-25mX;
	Mon, 14 Jul 2025 15:38:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKNy-00000002VfK-3KC7;
	Mon, 14 Jul 2025 14:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752504149;
	bh=0VtL9HUqlMsmAiP98DqIfNZWGaoaVpSGJEtLSMSugIU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fjzlb4elvs2yCknABpwicAp1UwFsAHWBn4kyGKDkYGP0aHfqQaTVHEKxfPSoU+C8y
	 zx2vwvZdO/9XqCQzslZNRPRh8oVVsqAUxMQqBUnFNTJWMxqjwvATzL4qYDaJfttJs+
	 W14E22TEDoUvuwPR6RDXeXJQJFo+WxpLaykCiOuQUMqnErgKE5XaszRAJlGalO2Wsf
	 +iJ5kNYFZMcs6jX+NRhB9GOm7hULVk+oc1uptlnNK7tRqSfSyoo/azsgKLMeehuitC
	 TjpyKq305/Bug52wMKhQeM+nTOMO2EqBm6D1GTlNpzKHhZBShLirMUcayx4gdbQGaO
	 WH7pc7Ba2DPnA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 98F1C17E01CC;
	Mon, 14 Jul 2025 16:42:28 +0200 (CEST)
Message-ID: <47a6b9ac-a23b-4861-a3ba-f292acf1e79f@collabora.com>
Date: Mon, 14 Jul 2025 16:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] cpufreq: mediatek-hw: Separate per-domain and
 per-instance data
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250714-mt8196-cpufreq-v2-0-cc85e78855c7@collabora.com>
 <20250714-mt8196-cpufreq-v2-3-cc85e78855c7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250714-mt8196-cpufreq-v2-3-cc85e78855c7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_074231_002864_B8A872D1 
X-CRM114-Status: UNSURE (   9.11  )
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

Il 14/07/25 16:08, Nicolas Frattaroli ha scritto:
> As it stood, the mediatek cpufreq driver could get away with never
> really having a private driver instance struct. This is because all data
> was stored in the per-domain structs.
> 
> However, this complicates matters when actual per-instance data like the
> variant struct is introduced. Instead of having a pointer to it for
> every domain, have a pointer to a global "priv" struct that can be
> extended over time, and rename the "data" struct to "domain" to
> distinguish its purpose better.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



