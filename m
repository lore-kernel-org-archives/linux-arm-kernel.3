Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42002CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 18:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0zP/IswWls5tUEjRW4gHHMAJEe54gk5KhQpTRSbZKo=; b=iV4N5t3fmOo6BfeExUiVwOR34n
	5lXJs9+MH5rTzqnmB7ktfOxoaQUKcJRuF9DA9uczXG9Q1agH9BSP6nW4hY3bYcaUZXpZiM15cCipH
	WoJ8nphozIjnopVdjaNhPMIIIzFRERvRZ7xkUdEHnW0V818YR9/D1lcZEKMw6gWn5oNBY4Qi2ZbFU
	7hTsu4INZ61Nl8ffXKLXKwpEwqDtsBG15SrrO0FUIIpRHo0GfCQ0OQFv/jnry3k4GZvuexZlotIkq
	IbwHFkTbXbe142hCcP7bGOKDdf/b9s1aIwcPf7pCkCfshuv2nVkp4kJkqdrDE86ivhOmprIn8Llr0
	U6HjSPwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuB5-0000000EZTe-3yYl;
	Mon, 20 Oct 2025 18:00:15 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuB2-0000000EZSE-32Y2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 18:00:14 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4711825a02bso29611975e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 11:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983211; x=1761588011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0zP/IswWls5tUEjRW4gHHMAJEe54gk5KhQpTRSbZKo=;
        b=dwHDNuBXvucqUN65M6H8fG+jJuW7O9G6EY/JZufMq6WHj60peWAlUyI8E7UOw5aMkJ
         Asf02Wt5cNvEEjPaPuxW0cshe8teRNSdXD1W8n9MEv9ewXIZJnStKRPgKVQ01VjnhjI3
         ZH3VgUmieDWD6FRnJWu7ikvchjsvfKvZ7pbZPUQSsoIsSZq6TRA69uqB8xCo8fo/6AaD
         jYK3uAyyE+ERC1VwMhi7z57Cg0lN9fdgg6gCu1XCc9preBSNMSopqQlzJCHMzHCv53Kb
         pLBhWJ9xR7VnJYnn+eIw9O1HBa2CTGqam0OnT6XXEetjJThYHGAKAecOti1LnFIePvqf
         fImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983211; x=1761588011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0zP/IswWls5tUEjRW4gHHMAJEe54gk5KhQpTRSbZKo=;
        b=RsK3sESagmpWXxJCSJaLwVq/LvqW8ZV0bXWmjv/QY+XxKWVKR3SmWQ2/VFjh/KqgZl
         qGdwNfNxc1V29+/SLRfo6pPMYNuxFbfa506F06XNASf7syDle7J48QJKDLZ5vt2YMVRQ
         WFANy471TuW1iARAvT2VZ7NfviDI/pwSye5CVsGxuLqv82WtFeFRJbpFWyen6cthQhJ4
         z4EzsTsScfove7Y/mlGlVzR4ikXZ+ZRhgg2TVZNKDhITyXJUC3JLfxH3SA3C7+u3opPY
         lcUUxOLSu4nFoan3YSwRBoVTXhABIYViWVa7NPWzQkCxBWpnftc6lPJUxvfdGKhr2+H0
         rOIA==
X-Forwarded-Encrypted: i=1; AJvYcCUQFSkZxYDgEcgBkGXxZ0wAXrF3xxpH25nOFWNq8lju4Lr/YUjgxYqoMxjvq27i69ot/C/m0z6ZRfMxsStXxkLP@lists.infradead.org
X-Gm-Message-State: AOJu0YwtlpA3Qmq5S9AGBycH7Kod2UwGL/pCQa1SZ2su/YRz/trbJpaN
	ffLtbe9o47G3ZFlB+1RpdrDaTcjNbla7Iavo4Qz0FtGGwXphPOqnaveu
X-Gm-Gg: ASbGnctL11HyTmYD1PlF3Ybm04B1uMfo8quDvUz2QMfKgCM+gO3XFsOeTAD02i56Sz3
	oAccHkWFOhEQoL7D2ehLiYQPOtGSgEZF3i9SaVNax22RHIOkr5E9b5mN/FcyN4vBVWZxH3dlFqf
	8HR2CN+zLNBlrX2RjjRkpEVFiPjMsQDKg3WTrg2c+uuDxTQJg+c3Zaouw+gEgcb+A1Akpjrarej
	XGOebaY+yPwk4RgfT5DiuZ+W1D7RGg3xh9oEEWsc/gEDaLG0WSjSdt4bYPOW5C5WuJyddAzMzXJ
	7fIzg4daFJkIHX9nq7Wv0OSDy4qVLVBYasz42l8VNrqzNZBGGgmiNknM91vywr5gN+4tZrE+qvI
	RAvu/j5KXFasfCvH/OjhqP72wlD1Arop+gW2bbyeyteeInWxrf9b81SiYSwa1hyQPztHXtJPn63
	UgJDqlD47wsYAeJGSYvxQLZ6wriLF7ko5q3GLa+oMQ1v8S6LQuhtunrwsdMcpA4l54SGg=
X-Google-Smtp-Source: AGHT+IGVeYcgA+CwUr1r7hUy/8iCaT15cDHaEmoGMtDm9YvbEjOd+dz5rkW55YdwDONL4X5PTcG3yg==
X-Received: by 2002:a05:600c:3b8d:b0:46d:27b7:e7e5 with SMTP id 5b1f17b1804b1-47117917572mr126637915e9.32.1760983210516;
        Mon, 20 Oct 2025 11:00:10 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144238easm248496085e9.4.2025.10.20.11.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 11:00:10 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/11] arm64: dts: allwinner: a523: Add I2S2 pins on PI pin group
Date: Mon, 20 Oct 2025 20:00:08 +0200
Message-ID: <9520278.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <20251020171059.2786070-11-wens@kernel.org>
References: <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-11-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_110012_764221_82ED50AA 
X-CRM114-Status: UNSURE (   8.40  )
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

Dne ponedeljek, 20. oktober 2025 ob 19:10:56 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The Radxa Cubie A5E exposes I2S2 through the PI pin group on the 40-pin
> GPIO header.
>=20
> Add a pinmux setting for it so potential users can directly reference
> it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



