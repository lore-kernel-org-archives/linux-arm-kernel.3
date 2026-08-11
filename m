Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FA9C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5NxFq7IcCs1xSnAO+oR3n9k6fwPCVP/WmcDz5wXiMU=; b=ov5UwTIRKPaUl7A9+Zx+n7mtw7
	Qs5jDliFxn64dPjjRtLk75SobCCC/TRjQ6j5r2OouoA0AVRi8V7MuKmIXC0d5zI6TsFeSTQX3S89d
	z2P0rIGmqSe4a7ou7vuEHfmHTdsac7FMqnHINuNTR90sYVjklCkHkZiq72ruCYTpDZBd/gqmb4F2+
	mD5B3lJuiUVXfv3msokbj6SZLVNxGPCFbYsYk9iFlneB1bdz+3+Ok/+XuarG9PFWhia3xhUvGCwtR
	PnDLvmY14gvDFcuz6AdI1C+Z4/N/DLQ014xaoqMBJ9n++vnXY36lRGKtWcYqDuChH66PIGCmZJEov
	V5FB4XBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpEs-0000000ETs9-2pI9;
	Tue, 11 Aug 2026 16:22:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpEp-0000000ETrW-3soA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:22:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49800c6a846so31536745e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 09:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786465322; x=1787070122; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w5NxFq7IcCs1xSnAO+oR3n9k6fwPCVP/WmcDz5wXiMU=;
        b=rKj0oXLly3BVphvhJyEK8q2qOl0N4zwd58yTCCzQvwovwdilaLENCCjIf8VaCJ7rHK
         eG43v039SJRTeB9P/ZMhCb5fDqE9Mde1c4H8E90+mvEZgtNd/SHoNx0Wef6GTE4T2VKO
         dv+SaVKPo181cgoLrm2jYLJ+cT72MUd2oqX9x22ul/D2LLooutSRhU99uK5vGIQw2Lnu
         kPY+7hLGiW0ob5YNxD1rZF3/+sokKKJBPSb+PjarhevHtMenWRrBjUdjy1nfnoXfNoFU
         oO1KSP5mpUZyTgGzQArSlWwokaR0KG7UcbmJUo/MVCy811b+GoN4aUb+LiL5pRlxIc7p
         wDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786465322; x=1787070122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w5NxFq7IcCs1xSnAO+oR3n9k6fwPCVP/WmcDz5wXiMU=;
        b=dweNzyDAvmygG64sjT1wY9JA0wyomAmFBs3LXgjftax/6PTuR9cZjWx3vpwzYZ3OMX
         Z0UOde5DjWTO8eY2sJ2DjqLw9dNpV1xbA6d882WtpFDX4YK3esAKy6a3iu/BWA46ySfd
         mEp1CKQ4GQ68lIhxYC4F+LSLvAZPteyjHK6mnnYmM7acGJOk6pIdqvBXPsr/i8860gH9
         RggUMQVJyU4f0Q+1PZRDXHKDh/m3cNX/NYWGgJMTODLEHE6xTsOsFbzOZfHTx+Wn0iM5
         sZWU3ZX+MXitfsj2KPhCB5LK+hJPhFtTfAYwbNSAiu2H790fWQlrWrOpWm+tk7V/vnxW
         IzJg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/H0hY6VeGA63Z35B1wRmG96Jhy+qRLXEBEFdAbRCcxLZExlDs9jBJ3Box3ygSheDEiJvRoq+HmM0JqP4TicTs@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1huLyl4XQWLDX+pS21LVSuqaktI4qYQHzyKGpJKwsWj5f+pYi
	f1zDRgx/uBJepczcKv+ZUAyTMU4mUk08YobJpNdf4ZgKqWexTNr+2COcxX73x/nX
X-Gm-Gg: AR+sD12wyEO3E7fD9n8rISJ3qx5E4HJbkdKSToKBPmsSMIMHnNW7aJ0wUCFxng/WvSK
	IGFGHOzhg5Uk9NBIa0+VuudY7tX1WXl4AvX8KQ9F6GUsd3sH7aZfcGWNacrWYGx2hfzVopwkClT
	pWagEyiNtwKtK2uiR2py6BmO0zN+K5kvbuNab9Qr2syiDiZoSpTktWK8D9eg235hIp0WHVkvIAr
	E21tlLEYsmSS+lQZAxeKyKxr25J3UZ1k09UrgYwL0dAKTf8F7AhCMqbU4H4Mrb6PzSvMOO6fFnl
	cob2QzwQLoNKxitcF0Y8XhaJF0Z3FdZ+vMFzysQuqwk2YOCCnxRXIrImkf3sLH5IaFwSeVrSFbY
	iT7NE+Qss7W4wUoYWxszrZ+I+sR0Ykz9oT7HlqF5IqpYDEtLgWsjiIE4S5z3l9+Y2fctTgcx31p
	MQrMLjq0o77QtexDzgCHtVgK0dk8HZvsNZayEb1FeiqfC9h9lVQLnp5zL7dAZJQ+DExikYIJ8Wg
	sgne7/VszI9jzfx/e5UifrG4vPO4u84EcGBaYabWsIdLlgr/m3IfCua/M4QEH9/zPyHwreKS52O
	J31T2ZMt0BzRLKYkoj2PVSYb4yOqbwNyPl4LwJWRELcOQUq4WkLQWkjbgum5Tq7WZTfbvs3VHHg
	DTsw=
X-Received: by 2002:a05:600c:6088:b0:496:ca1f:a428 with SMTP id 5b1f17b1804b1-49978475c11mr79962715e9.19.1786465321722;
        Tue, 11 Aug 2026 09:22:01 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-a133-e401-bc8e-d36c-2d08-c5e0.310.pool.telefonica.de. [2a02:3100:a133:e401:bc8e:d36c:2d08:c5e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977de1fcesm31270905e9.1.2026.08.11.09.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 09:22:01 -0700 (PDT)
Date: Tue, 11 Aug 2026 18:21:58 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>, Brian Masney <bmasney@redhat.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: aspeed: ast2700: select AUXILIARY_BUS
Message-ID: <antLQUuTFC_NXWu3@gmail.com>
References: <20260712160301.98941-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260712160301.98941-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_092203_971820_EEF55A80 
X-CRM114-Status: GOOD (  11.35  )
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

On Sun, Jul 12, 2026 at 06:03:01PM +0100, Karl Mehltretter wrote:
>   clk-ast2700.c:(.text+0x147c): undefined reference to `__devm_auxiliary_device_create'
> 
> Select AUXILIARY_BUS directly, as other clock drivers that create
> auxiliary devices do, so it builds regardless of the reset driver.
> 
> Fixes: fdc1eb624ddc ("clk: aspeed: add AST2700 clock driver")
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---

Friendly ping on this patch. It has Reviewed-by tags
from Brian Masney and Andrew Jeffery.

I don’t see it in the clk tree or linux-next.

Is anything else needed before it can be picked up?

Thanks,
Karl

