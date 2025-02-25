Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAB1C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 06:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/ATSqnAwKiVvZcf6pu7CEp14XGA+aCxxd64pSRjACU=; b=m38rj326QEgOTEzRm3nWcJm0dE
	sErOxnhn0uw1PSJm1/TLv87sLE4C852luCx/Md1rignwrCZCdbUL2+1+qQayyeN9swyn219o8rSwM
	Wd72epn44nJV0p1Vu9OU8U4NLzNx2dj7Twsp5tJ3LAX0uJh8jB49JbLVTABgyGyKPq+A53L4c0KE7
	t23j5+fNClnwe/O4iIHWrBM2Zpu243cRImV6Yzu9sHm6B8C4Bh5nig4fB8xGf2wyxoKNbEEpV8NQz
	lkfhR7ZCMQhwuOAY0jOmpBjAMN+L0W1bndP6m9uM38kBWOnxRHSH1bUCkMUHAgrXS0qHavt2rGKPf
	FHmMOaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmoKx-0000000G5Eh-0pvq;
	Tue, 25 Feb 2025 06:22:35 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmoFu-0000000G4Yq-0ghW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 06:17:23 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22128b7d587so100434645ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 22:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740464241; x=1741069041; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w/ATSqnAwKiVvZcf6pu7CEp14XGA+aCxxd64pSRjACU=;
        b=SXa1G9uPZ+5gfT17xqvNAHylths3Ylnpr02EWj5/EAofH3VTxwRfJF1QmudTM1uGOl
         HyPft8hSU4BWiyNYHXTRIM9c/SFkLNfzxpadcKU3PYPAQSLiwQI+pMCQnsw4RAYVNshb
         JzPiJYzpbNvc+J8t4IoilJQInlYhFPkbHDWRiKcwSyHhxu6nAAilboTX3RMxd/CySNGh
         RK7ltoo7YHZa+tpTZguILMpYkxbb5zgbdlkLCUcEtggYu6uyEhJ005WYc2WKhnmYoo9k
         LDaaWbLo/xGWvG+m1UaQvqYbwRa1EVbC3K8VVSPs+F6rA8McFkXecdWJlFMImwMIyTF/
         BIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740464241; x=1741069041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/ATSqnAwKiVvZcf6pu7CEp14XGA+aCxxd64pSRjACU=;
        b=Wqf6ryVbunKpHeKdQxBSXzr2ZNsryj4Qh3QMZJ6qXzrhGmzXalsnQXfWKRwLbb6xza
         icHzjzGoGc78MQjDA945uVsygNW6y8vHwlWOStIZSyjDRpoFXxUoJBUa95kaPTp1fBub
         K9Rzd+/8c3Vy4eOOGCPfi1KW2FNc17FxnTbZl3HiWTqXY69OflbqH49DzPJQFFTNr1l4
         OLSUp7s59IjWHxR31vrG7iVI2NSyOXWb+wuZuu5cUn4asFTmEHQ5lDVh0w7Ps54MlwIK
         btlz+XbZIUwDY84a2kvVq/+oQNH3fLL3fLzUPJB51cIue8dpuSWA4l1Pmjzwaph2/ww3
         qShg==
X-Forwarded-Encrypted: i=1; AJvYcCUOQExa1a0lr9PufK1tsLkibYOVoJCUS7Sfc9+WnHfTnoHWZCBWYVLDYz3CBRTIlU0rf3vl5tijnkl/MTi9Lvrz@lists.infradead.org
X-Gm-Message-State: AOJu0YwqxHc3PEcCbsvb4lVNcmARDkT4RftDgJ9HwpPIMoPL5Gz1HprS
	iAwu0z3KnrCPWn2yyVJXZLOc884eNZKwbdVf2BEkjsGt1Fic1EiZ
X-Gm-Gg: ASbGncuNazFYLvJPZ89G/UKFMQ8WqhaWZS1wtE5oD2UwWtPWXmWdws57q2/nPmVU2b4
	JabKXRdtjNF+6c+Xq+AIoeQgVWgeCVG1KmecTRwr3aukL31k/5qFL4lcpQXBgUGjWYFRDxuRhTj
	/Tb8N3HGSS1sOvmHcxsyMYv50D/3akHUouEBpOdQ+/Y9f5uctU7bCNwJBweSToZ5pzs5RGv8Vaq
	FcOqhQMZ5qjM3cYyr0ZvOmw3s8BMaKry7zCKq4g+UQD2GnTGmxS+S+lnvVsT1JgNq/W9HD9AJKV
	Nces0Yp9Za7JN9Di0wKdBPu2r4s=
X-Google-Smtp-Source: AGHT+IFdfc+NREhBU5f8tx8tcf6BbapEfu39IDYdFhX5e4nIcAOaurJrGx0qrdviMD4V0yM96cEyOQ==
X-Received: by 2002:a05:6a20:6a10:b0:1ee:73ee:bcf4 with SMTP id adf61e73a8af0-1eef3c49054mr30784128637.2.1740464241392;
        Mon, 24 Feb 2025 22:17:21 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9b5csm686996b3a.90.2025.02.24.22.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:17:21 -0800 (PST)
Date: Mon, 24 Feb 2025 22:17:18 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH RESEND v6 1/4] dt-bindings: input: touchscreen: Add Z2
 controller
Message-ID: <Z71gbmXAHjX-BTrD@google.com>
References: <20250217-z2-v6-0-c2115d6e5a8f@gmail.com>
 <20250217-z2-v6-1-c2115d6e5a8f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-z2-v6-1-c2115d6e5a8f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_221722_199509_9657E963 
X-CRM114-Status: UNSURE (   9.43  )
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

On Mon, Feb 17, 2025 at 12:38:01PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add bindings for touchscreen controllers attached using the Z2 protocol.
> Those are present in most Apple devices.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>

Applied, thank you.

-- 
Dmitry

