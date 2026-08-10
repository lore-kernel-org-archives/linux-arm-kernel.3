Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083F0C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 21:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9CDIauTN7m7q0Q33ff28ouhlrdSOd1kpngNZO2bxk8=; b=C22B4CE9xrXhW9jXBgJOQYD/lG
	0+Iyx9eyd10Yb/zOiFoYugmQ28XonBIgF7n0yDh8N//GMFKNjfdWsARkfcVKB2TVMwf37HCeDR31I
	UI1UJpgS0YgteXAgBH5Cv2xN8uaRKfD9lHfTNBSQVrNdG5sfYFypx7FXHRJWbbK4GhNIMr/ZtvmVG
	eflkWLY4UdINHvYipfXXf7KA4564lOPID3j1wl9UXlwJwXa/WW/1wM3C/IAJgDi4zbUhY2+mz6rjQ
	hkkULg3tpj0u21wvMrrB91IgKuxegD9EmPqjO40FbfwRVkgNw/9xK0YpF16iHRvhaNrsLYmPASqz4
	eYOiHNyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtY1V-0000000CwJu-3a07;
	Mon, 10 Aug 2026 21:59:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtY1T-0000000CwJ0-2iXV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 21:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786399146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c9CDIauTN7m7q0Q33ff28ouhlrdSOd1kpngNZO2bxk8=;
	b=i9ZtFrot7tEAlJk5CC/ALHFhvjxsRb29kRTTxNwljh4qB1OBP8KuAYXqVMsIXrwPDZUt+J
	7q3YSgrOyzXzb8GWMm+2GHFTLIWpHY7m7P7Zl3HqR3tHg1B2hxfk1jf/+OcTvwq1RThhUX
	9hn/U1ClvB9S3EQWgP0Q6+rzCMk6tkg=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-wgOkRr0CMrqSrmshFL2_og-1; Mon, 10 Aug 2026 17:59:05 -0400
X-MC-Unique: wgOkRr0CMrqSrmshFL2_og-1
X-Mimecast-MFC-AGG-ID: wgOkRr0CMrqSrmshFL2_og_1786399145
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81ebb5e11caso70066887b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786399145; x=1787003945;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c9CDIauTN7m7q0Q33ff28ouhlrdSOd1kpngNZO2bxk8=;
        b=UmzJ3Uy4XQussMatXKWBMhTEOC/soOG14ZWYPj9Jl8wCMXqdaQtwz4VfZeV+A8OFAZ
         0NAcWR6Ht+S+eG7sephaon8/1UaPJu57jsoOPK1AppyZ0E4CQvaYweEn7XgsTBWv9bEY
         afGIGecHPFLVUpvJGUqXCGIuZXnwr74Lds/xO3kEC2+hDKwC+keonyF3L3da39TKb4m4
         DBvru/mDeAwAsRD187RkllBen3QU2/w1GEoSFrxbB3yKWIgqTw1nP8rkqeXBEPw9Ma+2
         q9nSxg0r7tHSN8Iu/P8ubHcbQhfnnVx6KlnWhER5F2TiYr1orhuT8IhdLZHKVBzNrVAT
         +m1Q==
X-Forwarded-Encrypted: i=1; AHgh+RogUHIf+k1LE+6RacdVWlACezZBFhOU9yMKxnI0LGtekmou+7Vq7kv06KnfOWP6cdWg5fzWtOfcEdd0NeR+UZnU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4pTrX/rLmIvOylGoCm0fBoXZ59R/gNvy+DsZkoEbvMnA6Yvvb
	aIzIer9d8gVoJmiXQYs5qkex94G4pTnVIEFr4vfy/mOhSEoKyoQe1h+pbDD5ITqNDnlrR5D51Jr
	klEJV7XKRCtRSLlbio7sho3SSR0wF1T+Hh4NWbxgGCjWowr1MiwXspHzfEQuJFUq2OYouM8IOnW
	PQ
X-Gm-Gg: AR+sD12aHheEicyq6MbuYBf4xT434WpugzIXLCaJEcbrP0gJ25NaWZQF6qRyvLX4vGQ
	neC6uquBNpeAwwkohyVg3kHbFo2nzH0wd7US0Jhw5lmHzLg8B9AMWGKWO07HAc8Pi1nRCCZDhxH
	ahGNVulcjLmXm4XPMwLWaYLstIaQHyh04RUjGxai7gNdk35JbA0N8/QrziKOQM1z7lnvPwd41yk
	oDy/QNfRlxdH/eW47ISsAGeyhJhpYptzPZCMz6b/z9/A1H8wClqnqIs1aTkHqcnvGKtCBIV9HXK
	dZZvNiuqeIeO5axMGb+eEjgqmgZmKaqK37VG+zAB4KeW4pZebl8t7JHcuCsUIFAcEy6ZFwKAV1a
	+lzOK+J3w3C6gSSO2a31IRP5scBDfBWUKAyc=
X-Received: by 2002:a05:690e:128d:b0:667:b825:8543 with SMTP id 956f58d0204a3-66b12527c19mr2793255d50.49.1786399145050;
        Mon, 10 Aug 2026 14:59:05 -0700 (PDT)
X-Received: by 2002:a05:690e:128d:b0:667:b825:8543 with SMTP id 956f58d0204a3-66b12527c19mr2793223d50.49.1786399144641;
        Mon, 10 Aug 2026 14:59:04 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acae8584bsm7563368d50.10.2026.08.10.14.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:59:04 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:59:01 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v10 09/12] clk: zte: Introduce a driver for zx297520v3
 matrix clocks
Message-ID: <anpJpQgo--a43EdA@redhat.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-9-63846490712c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260810-zx29clk-v10-9-63846490712c@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ghz8OB34Dhru4GtGjoEnhQon3oZCx5j3Zzfn_NuEWUs_1786399145
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_145907_866681_E4464C94 
X-CRM114-Status: GOOD (  10.28  )
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

On Mon, Aug 10, 2026 at 12:28:28AM +0300, Stefan Dösinger wrote:
> This clock controller controls high speed devices: CPU, DMA, RAM, SDIO,
> Ethernet. The only non-clock, non-reset registers I have spotted here
> are hardware spinlocks.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


