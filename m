Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C88CC3ABD7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 14:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgyk97IfeYVOskXq3/ZxZBDTiB8IvjRjENNa45XTzuY=; b=o/NN59qylI/3RNbvzRVFpo6M6T
	m/5FYj6Bd2rL1JlpvIapzkMy47t89r+rAVbLaqsncaiX8KfCUKd9KD7kFUjRd+/m/sBnrp5jQW+ar
	lyFBiPVBpwpAi8nh6EE4hs5Zo3ogMkDMDDT/+/9VbpSll95G0VRxKVlz/IzI5nE7zR2+/kYySgVy6
	bRcynVhLu35gYxqupb+NxtPcnlYWbb92bxIo/fOdrhrsLIySLaw1AN5nALrM19Ibncettc0ZzFhYO
	N9S5Oq3Zy/kIr4llbkA5zAsZNuwTPoIih6s/yyapexr14Ip1aNRZJ7UjbcbC7Q8f8BPN8CX3k4xmP
	XPbi2QSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqmG-0000000CdMM-2Q8S;
	Tue, 13 May 2025 14:38:40 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqjW-0000000CcuZ-12My
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 14:35:51 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a1fb18420aso3779564f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 07:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146949; x=1747751749; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zgyk97IfeYVOskXq3/ZxZBDTiB8IvjRjENNa45XTzuY=;
        b=K6o8THLUAqgBdvfwHfG1YyBGAw+c8YEb0jFylccpVw1aHy9uvctwyLAtf+l9qGraDG
         aj4kcVI7haAEIT8STyNUOriVWzNel9MA/OmInRP0DU1M1gpEECexqJoMBi+YExDXfavM
         ErlNgw4gnUdt2uNXgf5vmgfiQVVQidKJSv8rePJxmhelIdhGEVKkPorM5u4vTctDbM0I
         oZkYtWUVw7mFTjRs2P8IQ0NeX09uLpdk3tDEAKrlBeFaN52qbItNvE6ROYO97VYJr7+S
         lUbwyf2i2x+cTnIlkkJ1K0QFnujJZQJTZNjDNzP42VlLgt0GeUPiCZouCeUcrTQdRO+r
         AcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146949; x=1747751749;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgyk97IfeYVOskXq3/ZxZBDTiB8IvjRjENNa45XTzuY=;
        b=GhcbiHoGwnaxZmhShwviNAUhX4dFqRDGsklGUjZl5qnHap9wZa7NIghyxO50R4o2AZ
         Z3jLpuLF8a1GdDIGlGead5RCqjQa1ypqA5UKK9kewughZxN9JZAb8+SZfw1vkm3mdxwc
         LluZHEXATA4Hx3BZdKoPx+bfh/EsFjz/Kh554kpRJBYzYCtV1RcE+hhNmBsz3MV+YjWk
         q+Peeo/wwIDHOx1aN0anq0/MXcI8N01rR2LyrpYnvi804+aNUKWmtvl3lQHQGqWb9oIZ
         0XJjDymjWRsafXuCOmppW33MoeTwI1AWjed1Qz59/kcI1ciWCDl3O8VpdOcBGKokFxXV
         OY5g==
X-Forwarded-Encrypted: i=1; AJvYcCWT9zdhMl7rbiZDEYOhS/dnPXQq5QRMEgpbQG+5nFJ1b6p3gJZI45EX4WVRFq8IFyqffbuFdMKld+vj/B2UGvp9@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqp58tNYjo7Ie9HOQdGKCEZbF/HLjNRa/p3hjtm9TkOdyoH/Cg
	IKqxcr6lzo8XpS3c/HClnLqc5rXAsgdjSQQInP2twj7+Vga4JhSmPSbcbKksEak=
X-Gm-Gg: ASbGncv3nvsMR0m+0zBVTnp9nBz+/zEm9CJZjMCAuDactyIRshCeg6z3CaIpxIS1gYR
	i9+KiohJxHnDcstTkRn24BRIva0r5H3vhniJI9efHHFaFoHgxA8mXG5VPm53LnIf9QJT9XUCq5o
	aZt7Eg7usAbQyDKKmmK+u2L2YKyMdNBbhiGchkgn6DcKHBavZZ7EPJGWnylWyCcvRkXgWT8wUuW
	B7UtJfOUkG6bAeFLl3QFDMdwcgBaXqIpq/edLQIZ85gIVCAwp381rEXgx/tNt3E/035OkvOaEf9
	QepW1gwlBF6pkfzu5rInmqY8RNY1TjTuB1tCwLwygklWWb2JVnXqsCjt1dlxvaZr4w5cX6waZ8F
	aRKdJSPtvpt49YA==
X-Google-Smtp-Source: AGHT+IECI9WPDGbN1PKQdBTuC0zojDWLobQgT9+jZfgetVRbIflVKBhtcHxhKo9cRWHWaWFom3XPPw==
X-Received: by 2002:a05:6000:40c9:b0:39c:1f02:5409 with SMTP id ffacd0b85a97d-3a1f6424053mr13007915f8f.9.1747146948656;
        Tue, 13 May 2025 07:35:48 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2ca31sm16559682f8f.65.2025.05.13.07.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:35:47 -0700 (PDT)
Date: Tue, 13 May 2025 16:35:46 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: timer: Convert arm,mps2-timer to DT schema
Message-ID: <aCNYws2IeRm-D8Fg@mai.linaro.org>
References: <20250506022210.2586404-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022210.2586404-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_073550_300016_6197242C 
X-CRM114-Status: UNSURE (   9.92  )
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

On Mon, May 05, 2025 at 09:22:09PM -0500, Rob Herring wrote:
> Convert the Arm MPS2 Timer binding to DT schema format. It's a
> straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

