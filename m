Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13412E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 07:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SUPyYL9CLudvKpRplV8NotoHf7mZ8aBVuxAUdV5tFI=; b=LQaJj6X/tF+fiYkHo8DRl+uP0X
	6hv8VTJaneIgW/bjetrguZxFsCobSs1SvBcWN9cVrCn8XOUJGJbr0pmIXHzpYFfEFrIOnVh2QBna6
	p1VuK4MvnDmwI+p1tCPHUEtiecry+eyovhWDACpYqlfCM6wpeb3zAzLRAmsF8VVjTCCZrJfApc80V
	imxXy7acS3jV3gzNTNq/jyOtcxGOFGP/uuzpEd4wG8WZM0XeVkWNNejdpeZ+moqJjQDVf7o0fBqRt
	s3ZXgaVC4Z6kDTCwIG5KXiDQ9w3KWW0ZFYSH1F4D9WZiP5hQtrw6/R95DBLZ5+HOzgT+6izzfLIUk
	qZzarTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYRF-00000006lUz-3Hwe;
	Mon, 09 Dec 2024 07:44:17 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYQD-00000006lL7-0Fl3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 07:43:15 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so123233866b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 23:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733730191; x=1734334991; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5SUPyYL9CLudvKpRplV8NotoHf7mZ8aBVuxAUdV5tFI=;
        b=kq79JqyRpmuf11IZ4nxdCukYcgGLVqFlHPVlf6ECAehQ/fsbLCDXEqXnFbAYhnWvI0
         /BnIk3eZM2SHvIOJ6NP6hNWIUstJeej0mGeyu4fqSGhNKmRefCjhygf81jGpw0IcIgw4
         Qbc4bMxpaPh8uezMUDsilYrTFl9lolFufk7KKugfQOQWc0Hog33aHgcKX7Pivjvc83Ms
         VcmZbXWR1mBl6LbMbjtwVHu4jlkN4fgnXSwa/djjJR2HhXkycUesX0oG59udbq7G8EIO
         69SczH6E4MTXMyOgcnqm+LePwd4RCwQB2gfEylm4QJHt9fg+DLtR7u9enfWpmt7XMDpa
         0GTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733730191; x=1734334991;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5SUPyYL9CLudvKpRplV8NotoHf7mZ8aBVuxAUdV5tFI=;
        b=ejtq+XTdkEDyZyJjJBZuaH2zosQL0cq7sTpcsyM5F4IqHOMkwuW9Fw/iqKMu0ChuDp
         OHsWcoA4XXqWFVxtZFdD+9LfvSwUYQ9t0YlnOjxPUwRcpShXz/3w6ZvoAU5Wyu5n6Hl9
         zVaW0uy4VZ5pYZWgR7XvS3QYI0soWYx6e8Y1Xo070/AIOOHXlFEolR2B2Qzj4xLdYFa2
         dJjYIfb82yhO26hfDQXTlTVX0OHGHkHCsBwgcC8hT9L1uzODw8yE8qZG+ASBE8ar9k7v
         nmRFXv/SSKDeUnrifDVTbfh3xCZx5GflhFCkFQS00y9ZVsqvdXiHtdTg3eNFnoR1nsLP
         351w==
X-Gm-Message-State: AOJu0YyFst2eCVN/leTluY6jef/xtILkzYL24Hpfne6qFXn+I3u0Fu0q
	PyVDZdZcs7lhiWFYw3ZHOWCf00szQ5wx6777CdsHKQC/5aSeOPxBZsdvD1NCVhY=
X-Gm-Gg: ASbGncuG3Tc22PaQjZUGHCITG27TUxUhiWjGzQxunz8KSkShdCMcT0KEn83PtbCL3P4
	ocI/62VfXcgbZtcQnhpdA4vhACMPNwnawCXtYYzFTQFPoOUw3zSX35Z925/oJNWxrSPwRap4x9t
	J3L5jYgWmryvJVAh7Q0LREHKRbKWIiGYwE7Ek6QWsl5+DXhGvq1JN8tG15MUm1urB9pM/+jlxYC
	KgeKAxSt2LdUmAsTcWKpn+WoagQ9TvBOAYtpvFkZhQa786fs/k7z9Yi0A==
X-Google-Smtp-Source: AGHT+IE4Pfx3VtI619bsbgSpgxWDTPFXq9jVrwkrA/qIDqOtyMaYbAKpFXJ+v5CONhA6hibvHdCtAw==
X-Received: by 2002:a17:906:32d0:b0:aa6:75bd:eb5 with SMTP id a640c23a62f3a-aa675bd0fc3mr426902866b.57.1733730190277;
        Sun, 08 Dec 2024 23:43:10 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6845ab4absm133840466b.73.2024.12.08.23.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 23:43:09 -0800 (PST)
Message-ID: <07a4942c-023f-495e-a4b0-e451c949ad80@linaro.org>
Date: Mon, 9 Dec 2024 07:43:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynosautov920: add DMA nodes
To: Faraz Ata <faraz.ata@samsung.com>, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, alim.akhtar@samsung.com,
 rosa.pila@samsung.com, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 William McVicker <willmcvicker@google.com>, kernel-team@android.com
References: <CGME20241204122402epcas5p2412733eb46d495fadfa30e5af3c5ce83@epcas5p2.samsung.com>
 <20241204122335.1578-1-faraz.ata@samsung.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241204122335.1578-1-faraz.ata@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_234313_963630_EFCD1AC2 
X-CRM114-Status: UNSURE (   8.42  )
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



On 12/4/24 12:23 PM, Faraz Ata wrote:
> ExynosAutov920 SoC has 7 DMA controllers. Two secure DMAC
> (SPDMA0 & SPDMA1) and five non-secure DMAC (PDMA0 to PDMA4).
> Adds the required dt node for the same.

typos: s/adds/add, s/node/nodes

Hi, Faraz!

Have you tested DMA on ExynosAutov920, did it work with the upstream
driver code?

I tried enabling it for GS101 and I had some questions that I couldn't
answer, and I moved forward in the meantime. Would you mind taking a
look at:

https://lore.kernel.org/linux-arm-kernel/e4089855-aca9-4993-bac6-e59370cf7954@linaro.org/

Thanks a ton!
ta

