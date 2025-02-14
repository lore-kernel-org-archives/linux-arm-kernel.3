Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCFFC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 11:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncfBDs1BfbjE8HEdMRv396XMxgyF7oxwkpOZ9BEV/sg=; b=hb5lPFMKTo+siFY9ZfewLyxB4X
	GdUThbOirez+Y057o3TUtCi0w6jzqmz7b2aYpo4apSX/N5Oe/Y1clkUm/NGcvfsHSgbiFtKF8ZQMR
	iHDXR4kXwxIHWWp+51ZBVUq+WFwPjsJQUKawMwC77ED0LRn3Rf5YxcfPJ12K0dr47AzmjaEs6bSDy
	EczXDq4Rr0zEPJbq6XC7j0V9gsDrOYVvn9/CVTKY+Z0tYvWQ5b7HfB0Kz+/UFCHhhY8tJbXw3WkwM
	yT6q0oFw5s6hMnD4ToU1cfxRP5wz1qYxV+pF2J+srzWjxvAwHvRxw3FziIdJtc4cPpWL4zXB3KcIU
	GxtEH3Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiu6B-0000000Eicz-1JZV;
	Fri, 14 Feb 2025 11:43:11 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1titmn-0000000EetP-28pX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 11:23:10 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5de5a8a96abso2935175a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 03:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739532187; x=1740136987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncfBDs1BfbjE8HEdMRv396XMxgyF7oxwkpOZ9BEV/sg=;
        b=VRGpMUwnumD2SKn6oy06lHS3QlU7Mbw3ARMQcC4ocu5HzhBplP+j4qSZyU4UB/e6BX
         yqyks6Y8jX16R5lZiuZTgMFHx/+MfxPBBrexsCEP3VxhQ6W/gvUd1HSghOi1Wl8nzXsC
         5+tFGoP7uYWKkf0cOjFc/IF3qA7LH5ibKyRhdOaBiniFREGhIjboBJBxOU59J4HDjJEG
         KrhO95W/Y+e/tFsoUlZkuZEagoM0+ivvk5cPmtUV1ukso4GiY4ChDjeajlxttxLKTiQ7
         z1EZ1ydY1gCi0p1NpxZXIyIbfRVXquStUmdLE9dfkRU98J+axfbYUxc3xXybtBNerHrn
         9kIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739532187; x=1740136987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncfBDs1BfbjE8HEdMRv396XMxgyF7oxwkpOZ9BEV/sg=;
        b=nDfXFWU9IcUGUccj8OfjUFo+DCQVWS1KfB4he/yvCTDWrIr9yRnfxsoOgRLh11sq+S
         Th8yQnSFMT9COXHfmgVdFNMaTruQeu3zygLIU8+vWozGZIxdZIFKxnXROoPH2raKUrU9
         JrJUBun3w3xggJVdmRKoZpYhwjLmXpJwDf6NhCIKX4e+1ibXNJRjYBnJG7swMbDhf+UG
         KpdVExH1MOIVAVWBqC8jhR9JUsY56jpddsaTPk43KtwG7wgE1kvh2aNtKkL2qIbhaZIu
         QalCxs0bSw+4NPpbaew7783udh7pZIibqaIngMN8EAI8RwkFQ5u28/oE6i7a7kaFeu24
         HuEg==
X-Forwarded-Encrypted: i=1; AJvYcCW9/gRkhVAgFuLul3rVMS2QUHGEHvduA3KWR/WUtPSWp+Tmb4CoN08ouEnrpuSBNXIk6Woa4AoczTThpBefDefg@lists.infradead.org
X-Gm-Message-State: AOJu0YwCPN3ZuJ1dfhBO/FZKEJprBqoVOyiiU80WfHpEg7KyeE1BvH5S
	hpooThGuuZCqrM3jk76vC2JbaYd91FQEqlLgLjVud+xyal7fpcGX
X-Gm-Gg: ASbGncsqByD/Es1kf8W2+Z+UHrpTftLTfXGfFUSZpDpU6N1l9Z0PSJgywDdO6Rx+yp1
	Giv7a9WkGwKLlxYMoNlSj2pxpD5G78R6bHYoFdqFg3cJUAG2xF19akrhvIOqKO7E982iI08kfOP
	auSTtwPvEBIKgzuunDW0+bcs4nLxMNiAjWQfnvtdhB8cbykAOsQkqTXG9rkudZm8lmgZWPopdOk
	EKDD3YiYFXTrppxVaZSCxoGLwlKAJin1BMc8Ply39rnBSlHHKfuVOEui+DdddbCAOwXJTnrQ8sS
	nEThZARA66CseWy4q6OV4Uca9Qao//+7Q3HyNGDfQpYHHz2lytZE
X-Google-Smtp-Source: AGHT+IEruA9as/oJ+0B7yZpR+Du0MWt57ncaMUqTh8cPjv7Ydql7nmgBG5oMdHqeXfUBIja3MTJxOg==
X-Received: by 2002:a05:6402:458c:b0:5e0:2d53:b2a with SMTP id 4fb4d7f45d1cf-5e02d530e00mr597835a12.3.1739532187306;
        Fri, 14 Feb 2025 03:23:07 -0800 (PST)
Received: from Junction.dargent.eu (242.76.29.93.rev.sfr.net. [93.29.76.242])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532594a0sm329434266b.68.2025.02.14.03.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:23:07 -0800 (PST)
From: Regis Dargent <regis.dargent@gmail.com>
To: 
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2]: watchdog: sunxi: Allow watchdog to remain enabled after probe
Date: Fri, 14 Feb 2025 12:22:53 +0100
Message-Id: <20250214112255.97099-1-regis.dargent@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAGb2v67tmzGfcFPchjzfSima-sT_u7viYd1UDGB9r6ZeJEgdyg@mail.gmail.com>
References: <CAGb2v67tmzGfcFPchjzfSima-sT_u7viYd1UDGB9r6ZeJEgdyg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_032309_544551_F6390391 
X-CRM114-Status: UNSURE (   6.88  )
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


I (tried) to fix commit format (still learning, please comment is something
is missing).

I made the suggested code fixes and added a sunxi_wdt_read_timeout function;
it was a bit more touchy, as the HW timeout could be set to less than a second
(really?), so I had to manage max_hw_heartbeat_ms too.


