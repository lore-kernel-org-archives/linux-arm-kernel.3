Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144A1EA8534
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 16:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCvFjV8EVaef8yL+ehrSZi3neS4JtlD4VmzZ+01tNOs=; b=HXONr9OMW8eUUIbt0owrXIO/pu
	1VKNVi+YCLsRxnFX65OLgQJ7Ufy5ZKOeDUrYEs9wVvaxaNm9ukDzuNcwuGphD6CUDwTh2j6ADBBH+
	MhNbF9HXkyMRIbGsPSzajePAh+El5rqZwXKekgKForh81+j6MckQqE3tQvCWECSoL5xFC74VH7hh8
	iURWBPtiExS/KCKlpNB/D7+f8SvFOYuVjbbxGwLNclpSXuMaXBxCSjmYdwdnm1O7q3kdrylXzNqZo
	Y02jXFefvwZ3gs3TXSKXg2SPiZhT5Bn3u8IrYFUQFveFkTloNLC0lq0KTA2mz4GW8Ygitb6sf8iWY
	QYf1cO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzGjp-000000069u6-1QQ5;
	Sun, 08 Mar 2026 16:12:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzGjk-000000069tG-3zOF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 16:12:14 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4807068eacbso90639415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 09:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772986331; x=1773591131; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MCvFjV8EVaef8yL+ehrSZi3neS4JtlD4VmzZ+01tNOs=;
        b=Gu2CdanxwR+86ARqWLXZPreWuBYIHbxO5CRnqhmvLwsF2BOONRbW9ncjN8Hg+2Go0M
         4ah4qg8mUqp/g6LgXST1d7U/B50iOAYwWRNBoTp9/1WjBRtpyjCIzSOPYkUmot6fwnRu
         5f0Hiq/FNiW8iXkr54bE3HYFZB5NR2l7HWod6IbKhHZnT/RrAhOYTM8EWrIMiJjGXy5Z
         w/CJajNAFmbitkcYcHs356e0vlIpeTbnMHBZzu17sN3w2Ks8o9nIE1cd5YUrC6Rn518+
         gKFdZnlQVYTaRrbEl7iDo0HSajCg3m7ORtvEBi6209tJ2bA0S011iTb/PKnLoV5JO27S
         CBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772986331; x=1773591131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCvFjV8EVaef8yL+ehrSZi3neS4JtlD4VmzZ+01tNOs=;
        b=KJ619O966MTU6a9azOJsSi4dJxRltOoaw9EY5CT4Buh8GwEdyz/NothbY3JdtEyspP
         bUVj+Vb8BilOTYk1r9FT521H2YJdEU4sEg7ElNMNtR+5IrcbQqx0JCx/dPh2kalp9PFa
         i0wg8tfpjvm8UzEq48fi/IYufLkOVA1ZiwMUqX6nMAySwURJt17GmSF+3dkG0Ino0G/u
         1ZXrRyO/pCy8+lr02b6xcL+fpeLND/MJ+4IOaI4duID/iQThNq4kKJcmHKs5VhTuMBgo
         0e9GsTY3pVfFwJ//JjSkgJIYO48UsZTfp5qo5LTgp0GvfWVM44qBU9r/dGvW1F8Gr1oB
         bC0g==
X-Forwarded-Encrypted: i=1; AJvYcCWL88c8NxXINXhTY0Aok5wxc8wwgITUHN1X59kXoqKxtVlEb3+26Uw+grrhvpeJDaXLsnthJU56x59E9yvsqnzY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4HQamFPiyzzyn7opM76VzfAJVTMeVYBflKljPVIqaKjD4Cf+P
	iaj2IWLt1cx7TJCpJ8zn0M8sjQ07L9gYi4RC73BwFBbhPwyfVzg7Ux+29p3vVBYlSc+zr4d0lgc
	6iKKm
X-Gm-Gg: ATEYQzwFqwkelFnQWIbZTPWxc2r0wXHtNI7DEIQRzZ8EpCgjDYIvxQp7bdJi007iQnc
	LktxOyKnx7bS8sADSxORDH/XZDBhGaUqQCslOiC+DzI8lhZnSG67xFPQe6EAeAQ++J2JzpOfTvM
	dW0SmV5gYozGRv4QlxtkZ5hmhK4f7PGJFlbFKPWSRTwqaysbHI0/3biI/JKQkn/6ng0VLf4HANk
	KJ5ioRAetEK3JZQ/DSzKxfQVHYcisRf0Nn5q6/btp+76akfU5BdT2Rxv0kc5+19rOXvzygf1IRE
	PffHw+AqUT+zsuY1ELUUJQqzHs6jq+OWnd10K7aJc2chIP5NYygmh9ezUfqL3IsmECTQfOpe4b/
	dbuUd4p5r3amcHHt5Duc9V/f3bPd2INSbElgHKtTMkMRGqgXAe8ncZ4KfBd6VSm+bn9n+T/jWzp
	24mixMfaiQkdcdPCM+nu442pifWBND4lXY4WiV1JAj
X-Received: by 2002:a05:600c:8b5b:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-48526927a4dmr139650865e9.15.1772986330688;
        Sun, 08 Mar 2026 09:12:10 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853149caffsm37960475e9.1.2026.03.08.09.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 09:12:09 -0700 (PDT)
Message-ID: <7de6368c-0b9b-46dd-a752-e063f88ae164@tuxon.dev>
Date: Sun, 8 Mar 2026 18:12:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: at91: sam9x7: Fix gmac_gclk clock definition
To: Mihai Sain <mihai.sain@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, varshini.rajendran@microchip.com,
 cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ryan.wanner@microchip.com
References: <20260302142008.3253-1-mihai.sain@microchip.com>
 <20260302142008.3253-4-mihai.sain@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260302142008.3253-4-mihai.sain@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_091213_003346_54556DBF 
X-CRM114-Status: GOOD (  10.49  )
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

Hi, Mihai,

On 3/2/26 16:20, Mihai Sain wrote:
> According with datasheet [1] table 12.1 the instance ID 24 is used
> for gmac generic clock.
> This patch adds the correct gmac_gclk entry at ID 24, aligned with the
> SoC clock layout, and removes the old misplaced 67 entry.
>

Something is wrong with this patch and the next one. I suppose it's the missing 
version number in title as I cannot grab it with b4. Can you please re-send?

Thank you,
Claudiu

