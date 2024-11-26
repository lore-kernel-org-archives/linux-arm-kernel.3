Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04387D6554C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 18:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5ZdijXHGTf9/VBMxXk0sgaeGJSHANk1xhdrCGF3VVs=; b=LRVKN5tfnEaUQjAiRtvcKEZY66
	h5XxHiWtKYQGk/Pe5rtlP7MmDJorkhInbhsIeJZYbO1GkJg5s0OoywB4L9/ToaKsyRNsgn6vn5iAi
	LpSwtIKOHJbW/H+SoYrynmK3quZY4KS3QPFtXSnOWNj83G6tbgi5+bugHXj/gmfPIVfO4HzYPLqvL
	hyCC4AwUfKF+ps0DVFKt/kbfa3rQtVT6pa993sp0YYXYpMBSCImwD1OOj8NmDmQnWQwHTfnFLvyYw
	CZ53mKMHT7RvP/tUdCb0+5CkXMGKOrNPee14RYpPK/DYwR+uCYlacESB7AWV9Yr+19wnXR9HjlTFd
	C2DUN/XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG0Oy-0000000BRUK-0KWL;
	Tue, 26 Nov 2024 18:35:08 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG0O0-0000000BRNq-3YsZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 18:34:09 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e388e1fd582so5887628276.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 10:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732646047; x=1733250847; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B5ZdijXHGTf9/VBMxXk0sgaeGJSHANk1xhdrCGF3VVs=;
        b=Pv8FLGAHX6JHCOmZaM9VViYKVfel8NOVX7iPOmjFDa4UJO9pd5ZwPC9MXUwDbRod+A
         t5D7t1OkMumFsNC5jC0fEAeFbGRpQqpyB9pJmLOQSpidOiagNKBRNDr+6pzbtHgQ3vwq
         jvR6WPXztlGXqPYKG4piCqOGrrzJQqEKC097aZPw355K6YCezJCOFXNYKgHpkKQFTwMI
         hGsCC9Rss0+phnotTpy4+kx5KZ8i+bnS480/WvnYObGtNnLsgKqX1ZdkmDj/j/M1QTdx
         LGFYomEZKeHiUtMGpyNgPrjQSbzeccfubw4n1ZL/Vx422hbX2rr0lRWGj8zTKsmcb3GN
         0N2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732646047; x=1733250847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5ZdijXHGTf9/VBMxXk0sgaeGJSHANk1xhdrCGF3VVs=;
        b=PXjR57fIG4ugmib4N4OjTmGAvwY4imMfDk+mvgpCYgvBeUunbktDmnuWmVl6Vg5pJ5
         +CJLNZsQ7ziKqZ+l0IOBgf24Fm/xSh2QIaJlf47Don4xsFI4BY9NtCfKdJJES/bFw3DZ
         wTBY/MhsZs69hLi5+/gcWGIYY+oeh+iQ7J+QGnXxIIxJqnvmHKQ1Ez8ncvTFRV+u4G0X
         byr4OSheg2M2STzzxUA8xGHKmp8HevCYdJim9t44tpyS4oypCe/7HX5hcLaCnxXjbrWD
         p4Q/tTnMIRbs6MV3wSN8aZxPkHZ0vadKdHHwNgE/tY/rPs89sM3snVe3xscuZXA2LZ+I
         VxfA==
X-Forwarded-Encrypted: i=1; AJvYcCU3YYlB6/PJf90kFxyQtzY0TZuj5+Sl8Men2LBNXSmK/Q1pLqtSS1R1OXQm7tMip4Cc4TBOxKB39pWmQKSu/6bo@lists.infradead.org
X-Gm-Message-State: AOJu0YzDqkUrCqMg0W5WoR9h87W6Z8F4t+3pJSurbXVes+sS2ff60Rb2
	yWGtdf/v+147ooPjrwRXuGnLTIusSWzpRhFddkBLCf2p7TOGI+/I2Ib+bgaZY1/L15TfpbAyfgU
	TYn+5yG2dvp7o0JHk2qdMrYzbmVM=
X-Gm-Gg: ASbGncsbHJ1o1/hxKAQPCDlCDLbjbWQF/sX3yiM/LSwwYPj3U/JhjxyrW/DugE/8pEU
	D1jK0AtD55B3ZWrbn/pkn9EQzlcQL3+sx
X-Google-Smtp-Source: AGHT+IEAKAQZoBZRcCS59s6ATzOJRqSPoDhyFrhH0wpI4a7G9pyRjoqsbwGfh6mDJveSJ2gv3edzPDtBsyPh4VazY1Y=
X-Received: by 2002:a05:6902:2606:b0:e30:e9b8:abcc with SMTP id
 3f1490d57ef6-e395b973db9mr91652276.48.1732646047430; Tue, 26 Nov 2024
 10:34:07 -0800 (PST)
MIME-Version: 1.0
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com> <20241126-adpdrm-v2-1-c90485336c09@gmail.com>
 <050d1398-cfc2-4921-b82a-95eecbcddba4@kernel.org>
In-Reply-To: <050d1398-cfc2-4921-b82a-95eecbcddba4@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Tue, 26 Nov 2024 19:33:56 +0100
Message-ID: <CAMT+MTRJrN1_LBm+Ba6wh1BcdG0co-AHY8t4rnLuLAV=75wZbA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_103408_884610_5F915218 
X-CRM114-Status: UNSURE (   8.51  )
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

On Tue, 26 Nov 2024 at 17:46, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Please take a look how other bindings define ports. You miss here
> several items and more important - description what are these ports for.

Aside from missing descriptions, this definition is copied almost verbatim from
snps,dw-mipi-dsi.
Ack on the rest of the comments, those and the descriptions will be
fixed for v3.

