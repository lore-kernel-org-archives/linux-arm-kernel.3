Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4255FE77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 15:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vPurqFXPorkFQAbwracDx5f4Bl+jhL448j8yHITY+Q=; b=19DHy5G/Voa3LLGicf4QNuHwBH
	yU5VGijBupszNlevgTysXB+pNJbWxZVBt6JFAOEdJ0+mECWV2rAxR/QfUj0MUir27LMUJGAXTUSuQ
	g+ScHl4mmiAYg9w+n8StoW+oEs/nsH1ftjf39bYbJLi53a1oYIR3R+eaLHm5pK1M3gWowyfJEwAPO
	ewmaJ90VY4g0ly/cQTtCEMFSCnm4y6ICwHPIamsvoR6l8beonz4JirxeIg5sdHVzVeuOmheQcQiUe
	7gXtx1Lw7xVASO7BtNdXguRPZSPjwxW88uoaOU73AI5d7sXHS4LMA0Oj2yJUGiHTglwNVfr4fzN88
	a5rKG6QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKJX6-00000005Up5-0gkP;
	Sun, 08 Dec 2024 15:49:20 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKJW3-00000005Uii-2CkK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 15:48:16 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3862a921123so1704862f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 07:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733672893; x=1734277693; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1vPurqFXPorkFQAbwracDx5f4Bl+jhL448j8yHITY+Q=;
        b=CeoIE1qDGWjlXpe6fAXfkxplyAm7kRcUkypwjIwe53YsTNAB49/r8VGmMln0kcYbtn
         PVFSNHqoF5/7I+13xWlUhzK6baIqCHFiLupJlkr/q9uDgpm2l31VDb1UWcFVP2KZBwk7
         n6nq5BD6IdHh4/fcqYAwn2ueDFmDG/NUDvv/xeExDbMf5skUGLCQqJ1Zl+0Qhzvgjhi+
         qzJ4yfA/1LXeShUvQz7c3LyQi4ba3yPaIVD1Xz3YfFdzi2Qik/bxzUDaUWINbULdEAhn
         8vcFeRS6r7z/dio7vcsrG9Gw9dvQOhpKnp6dU0apPZs/YtLzcOGVQkT3APUmdUjVnx5t
         x6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733672893; x=1734277693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1vPurqFXPorkFQAbwracDx5f4Bl+jhL448j8yHITY+Q=;
        b=Zp3l6z/CGN7attnWhcxDtMANT4inBnD99f2rvosj3bJ54a6+zZYwJoJFFoLkxrvw1V
         3cjX9sbhHaVzHjnfTXKRIzRdkb08tbX9CYth6hCuO+SUxla7/sDFvt9Ud2YVI5kXTrVk
         OTmtCJ0HAN51rCO4QSt/ow4ZPbtoJx9Q76shv2GY4e7ebFf7UvW+wMLPtr29VILgUr8G
         Rr6sQeKRCx9Bx6Gl7A7AIgRLQX+WLt7IGILZIGZJQW80DeNIqtlhkL/7GjLACp/l3C3R
         6a4CUYnW5oln+PjNpn2GCzwYszBPVDw7cHtCb8BbZskkuSlahIyC5iaCyQmTCYN/2KOg
         VQug==
X-Gm-Message-State: AOJu0YzWwmr/bSNp9tczk4zz2hc2NrIWiThR9JexeY4kfJFwY9u1d7vQ
	WWOu6Qqoki4xC69ZcwGGOOhYvcC6cEbdKBCPT/q44gq3jdCUFSUbPdnNM8rw0jQ=
X-Gm-Gg: ASbGncvbd5E2R6JcRe4Mq5cjO2dAche7dldbljLIha/tiP7xpU1bFqxq0CE5i1dtdvn
	J1pw8urfpGfUhIQrkCV++ImO8xZnheOBlqLJlOaF+sq+98B1dR5KbeyHGgPf6ggNLOFKkGjadNO
	nPKWHeuykXr/A6vYupWeK0efNS4FV6fokJYAf55t0zjwhswvWO0aavbgR2IVAb/db9Mvi1nP8o0
	lI/Zgorvy8bUfvhUjcH79XY/ym7BEhJNjA9GYCY8ct9fzKbXRfKfKHbfpQ=
X-Google-Smtp-Source: AGHT+IE0HMOWF9ivtat2QG1UsdI7qp7SziCSh4sGJgdvzSPoZrMHHwm8fC7vPzNR841LP8WaedB2jg==
X-Received: by 2002:a5d:5f8f:0:b0:386:1cd3:8a00 with SMTP id ffacd0b85a97d-3862b3d0963mr6129425f8f.40.1733672893174;
        Sun, 08 Dec 2024 07:48:13 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434eba653a0sm50093225e9.22.2024.12.08.07.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 07:48:12 -0800 (PST)
Message-ID: <32b1ae9d-f55b-43d0-bb24-1fd486440ab6@tuxon.dev>
Date: Sun, 8 Dec 2024 17:48:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: at91: pm: change BU Power Switch to automatic mode
Content-Language: en-US
To: nicolas.ferre@microchip.com,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Cristian Birsan <cristian.birsan@microchip.com>
References: <20241125165648.509162-1-nicolas.ferre@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20241125165648.509162-1-nicolas.ferre@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_074815_690102_76560B50 
X-CRM114-Status: UNSURE (   9.83  )
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



On 25.11.2024 18:56, nicolas.ferre@microchip.com wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Change how the Backup Unit Power is configured and force the
> automatic/hardware mode.
> This change eliminates the need for software management of the power
> switch, ensuring it transitions to the backup power source before
> entering low power modes.
> 
> This is done in the only locaton where this swich was configured. It's
> usually done in the bootloader.
> 
> Previously, the loss of the VDDANA (or VDDIN33) power source was not
> automatically compensated by an alternative power source. This resulted
> in the loss of Backup Unit content, including Backup Self-refresh low
> power mode information, OTP emulation configuration, and boot
> configuration, for instance.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>

I've added the fixes tag, s/locaton/location, s/swich/switch.

Applied to at91-soc, thanks!

