Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3635ECA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 11:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUKJ0++TPvbkMoFrI+Y8BLlk2t3/W/jKbuvYaAm42bE=; b=DW+ER/BZiDx3engDlhKfqAejh/
	RYUu1xwZuRnuAcdVcWjX/CrqxFXRI+wOyd8qNxhecok/pCiwGtSvBxLc6GwE9OvefsTg8vlTHCtuE
	wDjkqXhhaLOLJIIJXeteP69sgi56zXtXcM5GDMn6GlorATJP3CmL/VOP5o+pLf2Cq/3FTDGzsw5RC
	5Bddm3uHbtxnJshr+UqfCM9m/ItH+uWsFXhkTIkzLFUGS3KVlC30mozd1vZ7AOWDXB1xYXX4qIpNc
	TAAY1RZ+wVcdwFSRl3ikVcKvZ2DrtwRA0PzrKAsspGOOJf3gUcXypAzErbW6JrkQnFFw+8Rdw1nND
	JR714rIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usgDq-0000000A6au-0hRk;
	Sun, 31 Aug 2025 11:27:46 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usfmi-0000000A4vV-2Om5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 10:59:45 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-61c78dc8b12so382936a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 03:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756637983; x=1757242783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUKJ0++TPvbkMoFrI+Y8BLlk2t3/W/jKbuvYaAm42bE=;
        b=YPgUGZWav+ZFp514E4oW0Uw2wTQO3lzlbH5PO+aGqRmHcPQvRZhoghVkAZiCvXEh4V
         JNCVncwmrbTjfFoFUozjq0O2HLfh/G25Ut10YOqIS/rQBww3JBURcUpeLl2f/kx/tLdO
         HqFMcpJ7k7yDbmKk6qQkyHNp6xC9KDa/LbS0SIrUnAHMR61IHEpbqPE2XKUh1YUYQlIC
         AZjAa1NTlYcERqTrH/rHsd2KXn2YkuDj3rkc/ub1Ya5hz99XqmgOWWD1k0EYSDEt0SyO
         G6iz0whjszRXIyZT00e8T9tu6cYwA35GLdV+JsHbod5dL+g6ZqROAopg3rTYADQ/4BHO
         1YAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637983; x=1757242783;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUKJ0++TPvbkMoFrI+Y8BLlk2t3/W/jKbuvYaAm42bE=;
        b=P7lk8uNTZrtqygMtlhmB0YEBN3phHK5hh/RRbcv9mFrOA9XD7a4TfQuQsMFGcPt4ID
         zElezPk3wG7tnAcvb2ljT7xzkEUlOuYnJmkL7qIWAqrRy1eiXOyLnPiXMGuFkAuKBHJE
         BiwQ44xb0TnCzzART3AAexkgHnZnAGjbf4yxIj6StO+kF66PUinFDsH0ExAH86ZRNz8e
         F4YyY39oNwgg8pb8t5JXZHhiGpIsgde+0j1dkYLvSdjs9rONiBkWREkfSU+OGoZTn9Oj
         sEFOgFjHya6R4PfliHet3IMN3J4NyjLO601AC3mXwiEpPGnUGC7oIcPZqtWBo+1gQzSc
         pVtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPdxrFvnMoU5JRzcvFVt/jv1WV9lUQDF0Qj6PyAmvD6BRt1ZXUG7uTAlebEW5fPEVMpeffAXQ7wYcvF2I58K4z@lists.infradead.org
X-Gm-Message-State: AOJu0YwqeWND7dSFvP2VTMKiYI4Q0IbeHwPSiqHhyX+CDTXh61X3Ti+8
	baKYJJHhEpx+I9wxo+ItCvcKzj98GVstuxai3HjmST0SEMTtBCioPOSAMrk28HakLRE=
X-Gm-Gg: ASbGncty3l3wUIxkSCy7Vlh7M3ggOGvG4AZAbi8P164P78w6hnS3cSfs8iiU5xOVNl+
	wUnYQY+8KZSaVpSQMtI1sjx8JrymH8n4I1jnAeyvZaizsmZ7PLaehei2FaceHHdd/GNLeC5fWC5
	+/b9nDOFWZLG2bxk0Na3bGGSRCOgsdXskc8LyGzDlNj6RCCZnFPEQnw6zMFTCaBwe9VhjWGMJf1
	svRMOLk0IRcXArojqOmUvzaQB986tHXaefGtOfUcvgX/bFSCmhZGSQligtrYRQ8zLZFZnnQoutx
	0Xxbu8oaa/jnF6m/7nknHxUyAy7KhjKC6KBG7dGt6aRw6EeNdfHwT50sywEXpi093Za7pNXIp7J
	p6bhP7Lj8hz1KOu4KPPuLm9xqGNgf3zt3ZSsJeY0=
X-Google-Smtp-Source: AGHT+IH/wnggLYJVXW/m3e9qKO69aqMTz3cVxphx9pE2l9/txvZNELvi65ntEkYfK+vEIC3B6xnNDw==
X-Received: by 2002:a17:906:c152:b0:afe:c2e7:3707 with SMTP id a640c23a62f3a-aff0ee1afcemr349705566b.4.1756637983020;
        Sun, 31 Aug 2025 03:59:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041f00d4c2sm105452666b.97.2025.08.31.03.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:59:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250822133318.312232-3-krzysztof.kozlowski@linaro.org>
References: <20250822133318.312232-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: socionext: uniphier-ld20: Add default
 PCI interrup controller address cells
Message-Id: <175663798171.36860.2362489342658881162.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 12:59:41 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_035944_615067_AA96BDF6 
X-CRM114-Status: GOOD (  10.97  )
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


On Fri, 22 Aug 2025 15:33:19 +0200, Krzysztof Kozlowski wrote:
> Add missing address-cells 0 to the PCI interrupt node to silence W=1
> warning:
> 
>   uniphier-ld20.dtsi:941.4-944.29: Warning (interrupt_map): /soc@0/pcie@66000000:interrupt-map:
>     Missing property '#address-cells' in node /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback
> 
> Value '0' is correct because:
> 1. GIC interrupt controller does not have children,
> 2. interrupt-map property (in PCI node) consists of five components and
>    the fourth component "parent unit address", which size is defined by
>    '#address-cells' of the node pointed to by the interrupt-parent
>    component, is not used (=0)
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: socionext: uniphier-ld20: Add default PCI interrup controller address cells
      https://git.kernel.org/krzk/linux-dt/c/613fb0c8bd49df4fb28bca89aa5363856487096f
[2/2] arm64: dts: socionext: uniphier-pxs3: Add default PCI interrup controller address cells
      https://git.kernel.org/krzk/linux-dt/c/a29bf0b10a1a7f51afb91c1ff9edd73b0ca1fd18

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


