Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC2AD64084
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 20:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnJi290h8vr4C/mD2ddPtqPV3xjVoWTEKK5WxcOCaRU=; b=miXijZLVwpyVOerM3nuq8tVAyB
	LTBiE8STsADfdRXG/DLSyvcbNNwK8Ecbm2Rc+X1dj4CjdvUfYezfJhuh5WtBEjGYkH9lKNXh8DI0w
	edIHUAtppIoADZ8h3r+Tmk651grstWbB+Mv09ghj7P7FfE7bLVyuXAn0Nu/6jJlgaIlqXwV6od5aj
	pAyBf+a8YTcT9oVgogzai93mbF3ba/tTqLTuBQ+P1gcezJ+5L//5p/E4fiLSlW/HiqO5srflMHDrF
	spwdEgq4Ti99r0efZe1JkINOzelKyCvYY+fXkmsqYVE60DIx2ezDAgxf1zqubaSUFLH2ssgGbiQkh
	y/ZfMwgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9VPS-0000000BrIF-0qM6;
	Fri, 08 Nov 2024 20:16:46 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9VNf-0000000Br7h-35wS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 20:14:57 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso21481045e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 12:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard.com; s=google; t=1731096893; x=1731701693; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SnJi290h8vr4C/mD2ddPtqPV3xjVoWTEKK5WxcOCaRU=;
        b=NhXmoaDhimLN1QiiBxIZN1cf2J44sCpp4LsKsipDZENhlv/2qvil2Fr5XIr96Gp0Ae
         tvYB2ZM9vO2bAzMbQl6I2Jjsw/FUKimDxC+WefsZNLvcbZKlcKCqOWfK4/4XZqL4UzFU
         JiEeEp/BhRhBVY3dvj6beM4xqDbegnkDtk5jcrAZt012bskEPNmjjh8vJVosRq+Z7pIO
         z+XRDyrnXP29U2ImRGv8Jnbwm0DB+/3CHXiK2ou0lgqR9c4UNvQBMfXrtp6zDo48v1Cl
         KXlff4YZnN5cxB3IsoKmTNjJo8mvC08jwV4mByFMhmcX1eluF5PpGtE8bBFlMCIkDeO8
         z6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096893; x=1731701693;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnJi290h8vr4C/mD2ddPtqPV3xjVoWTEKK5WxcOCaRU=;
        b=Hc2MTOCpsedngD72DYqWaOUh2K7Bb5VBSuPsawwZ3Dtn3+XU2W9H9ML+kCIZYsZUq9
         jNpUvLjkZ53dPnzkvJHnA9e89S7VpRyChaxwE8cC78T/97qlzY0PVliHgpu6ClGyejH3
         TqjxSfWtgCWkWOCqZw9O9jQcgwUflAW+aPCha8D4D4HB6oF0IQ7e1pj0hMIzmwFJsUEw
         sfmzElWr2ozAw1UryTBXiMVRgPlcST4LKB26nqHG2zXv8Chm0j87+s+/+aQi0janCUB1
         UNWSQwOlMW0Fge8rYfGV0Xzupru08vcvB6T2Y7IQ1ubhnHVTJbnnlp65OxcPYfxbVsFM
         hdog==
X-Forwarded-Encrypted: i=1; AJvYcCXdRASiDOhBcCIw3xQ2JIgMOSre0ZqGmQ0q1hnHqGZ7zRlicW0MEEPwN6b6OTOv06wk69hj4b5y57kFxRMg5nA5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7CJQS7xKil4tj0uOUy6x0u4I1i1Pc0j3AQb1NfcqjWInhByRF
	VHu7rbHIaqKdzVdAKVCT9GkDgueC+g5c/mstx9T5g7vuQsLs0BQ78KLdGmiWYGA=
X-Google-Smtp-Source: AGHT+IGN5sV2BbFWTnqEaNdU1iKUMM5d5J1yjXajKUVbx428HpwPMeTpAjJj5+kAG/3PF10HUkZuzw==
X-Received: by 2002:a05:600c:870d:b0:431:4fa0:2e0b with SMTP id 5b1f17b1804b1-432b7519708mr32564385e9.28.1731096893182;
        Fri, 08 Nov 2024 12:14:53 -0800 (PST)
Received: from ?IPV6:2001:4c4e:24e5:bb00:6639:286e:9ea6:bb49? (20014C4E24E5BB006639286E9EA6BB49.dsl.pool.telekom.hu. [2001:4c4e:24e5:bb00:6639:286e:9ea6:bb49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-432aa5b5b7fsm116672495e9.4.2024.11.08.12.14.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 12:14:52 -0800 (PST)
Message-ID: <7b63b316-4cd7-48ee-ae32-3750d25e2307@wirenboard.com>
Date: Fri, 8 Nov 2024 23:14:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: andre.przywara@arm.com
Cc: jernej.skrabec@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev,
 mturquette@baylibre.com, samuel@sholland.org, sboyd@kernel.org,
 simons.philippe@gmail.com, wens@csie.org
References: <20241025105620.1891596-1-andre.przywara@arm.com>
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
Content-Language: en-GB
From: Evgeny Boger <boger@wirenboard.com>
Organization: Wiren Board
In-Reply-To: <20241025105620.1891596-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_121455_819679_1CA5B6EC 
X-CRM114-Status: UNSURE (   7.27  )
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

Tested-by: Evgeny Boger <boger@wirenboard.com>

We had stability issues with some of our T507-based boards. T507 is the 
same die as H616, to my knowledge.
They were fixed by essentially the same patch, which we unfortunately 
didn't submitted to mainline: 
https://github.com/wirenboard/linux/commit/dc06e377108c935b2d1f5ce3d54ca1a1756458af

It's worth noticing that not only the reparenting is mandated by T5 User 
Manual (section 3.3.3.1), it's also is implemented in vendor BSP in the 
same way.

We tested the patch extensively on dozens of custom T507 boards (Wiren 
Board 8 PLC). In our test it significantly improved the stability, 
especially at low core voltages.

 From my understanding, all Allwinner SoCs need to follow this kind of 
procedure, however it's only implemented in mainline for a handful of chips.

-- 
Kind regards,
Evgeny Boger
CTO @ Wiren Board
https://wirenboard.com/en


