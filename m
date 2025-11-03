Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BC4CCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UU3IMwLVIuqUs9WFksfEbffdOpEdabEos7vPHn21iN0=; b=VvYLdi0XpVPT1iKeI+hjWQz/xZ
	QNBc/xIDZfgciH/iMmp3temioj03/GDi2fmFmnmD7wlALDuyl8sFTOfJ0XUHDDHXtaMqtBxn6Pg7q
	Q+QECOsDrHtLHhUMXscFJR/Ba7S/9Ct8yXk7EQ4xayXZ0lHufS3eXSDll1QfCIbJ33ir5QLs+Ti3J
	QnvJt81PWB7pd14mksJrpatNZOWwl43HQlGeKy0MGou36D5C4dQdCkl4TiE2tNxHyJ8eROaZzHZNK
	unodPDcmHHnRPNoXmr+e0UNkWQ2AChZMNCj2p9fbx1mP5lUkswhzC5ElBQKqx2uJCQX18S5CVRQj7
	tt+/JMvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwMa-0000000A885-1F68;
	Mon, 03 Nov 2025 15:20:56 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwMW-0000000A87L-2Z49
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 15:20:54 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7c53400935fso2851917a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 07:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762183251; x=1762788051; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UU3IMwLVIuqUs9WFksfEbffdOpEdabEos7vPHn21iN0=;
        b=XIPHwCnVDYCmdRXsEvUFfedIEdh0PiMN4oNBCBubg73CNQ9QMHUQQgWIxyFKib/yxB
         IDUVamD0Gihwj/Er1pECMIWkYmh0BdJR+lXrqYG0FOT3AM/t/V/oThdwmKCgmFpSCy68
         9OabhQ8YMCFvEyAFf1JmNpcQilDOEbgOZH/sSrsL3dQtWvUNpr6dgPFI+1gqY/NPb7F3
         jL/QLVZNEz93MwGYhDr3ihLycNmqZQV3UwSE7rL1ZaXpytsJI/UPWkjf9nN03HFXuno9
         O6buUnKnPGVKv9hnf1uRidbjnXZGuBIM5VDX5pEDIC/jbxF8RA4YoKcLS3IPOrTvGUTz
         cunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762183251; x=1762788051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UU3IMwLVIuqUs9WFksfEbffdOpEdabEos7vPHn21iN0=;
        b=OxeSj+EALVcErCmdXaYTPq7d+WBp+TvjhmKyTd4gYQxadMlDmafEtPETjRt55tLZQu
         GA0almYiu41CjeyNatI0gXTGRMZmzzUzAuGX7FYWa5wl37h5U+xDPxydz9eQ1fbzBg6S
         k5FxH1dLf+zIP7nZ/LYbj8vk6i1EFdWXDkeaB7lDwSOmwEyJjpm4VOnPnN9iRgh7gLbt
         yxj43xZYeYvWeGpMGZuygcz/FSgyf3jL4Ym4TM7+10RpkzcudGeQrtwCPzJ/F/K5ta2W
         hiSrWBw3KYE83V4sGi+ZjmS8jTRaRimrEvnkVgzbUWWoOSZnbaMyTQxnwJkjJI/LhMCR
         aERg==
X-Forwarded-Encrypted: i=1; AJvYcCU9VjtfbJhG38nv1Ef2C7dPQaYK7Vhp91wAI9MxEhxf/vzINgx0Hr5e3v0sy2snoRoIZ/KM/xWGxCcuIbJdZ2pL@lists.infradead.org
X-Gm-Message-State: AOJu0YwTzCSdK1qNNZ6UvzdgPn6g3LVGg+ScFamuWUupH0BISYQv5B/7
	7e64tyJcTBwyEhjoWRFO2nM01orxG2cQ7oB8qQwKgmcSM+NdHuT69nM+2pKb5R0rsws=
X-Gm-Gg: ASbGnctIFQuPmF4P6X3V7OYSEQkxqCyexKxXu6RkhLUv7c4frAuCQ73m+pPFDFm1skT
	TbHioR/6iCFCpSqO9rBh0e3PUZlzgtLID3F2foVRYZ9JS6Attq4HL6QrBayeLjVAUZUZS+hAQcS
	UshqRYDG7UO89hNsIROl+CPQFpCC3hmSBH29w8wJ1Dap2XPYmnvNZu8Wdh2vrr96cgSCLYizWmV
	gfcVd8FmGGTXR1pSgd9apUu3XuUA103RY4wUTHBUTZZNBSFaswlJhXKpG3FhhRUZ1r+WIppNaVy
	JHzqIc/a5UU4P/uK8s5HTgxBTVVm+lUcWOX7+P0vBdgoUDHauptDMwDPZGUKk0TIf7wejk3KDe5
	UUarq3fT98Cez3POpKxZ5x2bMZivPenbVj49raSo/9nNkKCZyhBhRQu6nn8SJ+EnYTSG0mG8udt
	GcH9lKI3+WU1QEDp4oqIu2bgGLhdRXCuF3Ca+K9XlU8ebEdCifYoGgXQk9Ix4w
X-Google-Smtp-Source: AGHT+IEI7oaPwbMLZyrFhJm3x/2HChGggXyz1ZeRNUlqpKNsCrcEcUIruRtbDhBeLo27AIpbulOZpA==
X-Received: by 2002:a05:6830:67e3:b0:7c5:3bbb:9ba6 with SMTP id 46e09a7af769-7c68c82fecamr8720707a34.4.1762183250808;
        Mon, 03 Nov 2025 07:20:50 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:37c9:fd3e:34ae:9253? ([2600:8803:e7e4:500:37c9:fd3e:34ae:9253])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c6c2448c9bsm208886a34.3.2025.11.03.07.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 07:20:49 -0800 (PST)
Message-ID: <3d2fde56-d82e-40c2-9d0b-2888160a642b@baylibre.com>
Date: Mon, 3 Nov 2025 09:20:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] iio: adc: aspeed: Add AST2700 ADC support
To: Billy Tsai <billy_tsai@aspeedtech.com>, jic23@kernel.org,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20251103105217.1764355-1-billy_tsai@aspeedtech.com>
 <20251103105217.1764355-2-billy_tsai@aspeedtech.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251103105217.1764355-2-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_072052_661155_D19FD72C 
X-CRM114-Status: UNSURE (   9.93  )
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

On 11/3/25 4:52 AM, Billy Tsai wrote:
> This patch adds support for the ADCs found on the Aspeed AST2700 SoC,
> which includes two instances: "ast2700-adc0" and "ast2700-adc1". While
> they are functionally similar to those on AST2600, the OTP trimming data
> is located at the same offset (0x820), but uses different bitfields.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>


