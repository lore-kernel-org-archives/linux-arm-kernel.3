Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DBED6E2B9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 05:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRwcqVhrMWWtuyE+OLPL5NHoUdOo/BxzRoMgxzXnrkA=; b=Gtsvf6NJ3M5oO6bMSDVNPKDHQE
	BpXWG7ZnjFasjzwjHTDK/oqKxykrzzo3mxA+eE7ecqTni5GhYTTCOihzEGV8UkPW8uc5NS6kklrf9
	LCLDzzKEayKbe19rOe+Uekhgd7ozGek6SFrbS6UHf5R4+zYJA9IqRvqNbJgBqQB84QA/QYtJRfbTI
	8pllapFyMaujcCzUqj+OVsmrYu5nm0Ekxv+2tArUWMPTotAqFZkmKOs+REJhyntwMQVXctwVhayyF
	AgPrqviLD/Cczkgvhx8JEZFqM6pBYHpMSrQ7IF12S0GuWY+ybIzLdFlNE7taGGLaEqetdWrIrlAEX
	dApqkDFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDdOt-0000000ERKK-0Ey5;
	Wed, 20 Nov 2024 05:37:15 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDdNw-0000000ERE1-0Ndi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 05:36:17 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-71822fabf4fso946042a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 21:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732080974; x=1732685774; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xRwcqVhrMWWtuyE+OLPL5NHoUdOo/BxzRoMgxzXnrkA=;
        b=W6I/9oqialu0tSLY4M3ffSwbmVS1S6V43jk7aZzAPRdg8uD7MeqP1GBjfw89CsLq/9
         YNdFV2oWCpH+DNmZzwwioDbroMuW+0xfghWuyohFy8Uj4CNXkuG2d8MFZmr6b8BphF3Z
         xwc9CPVSYUsweaC6r2N/fAQn/g53apd5AZ32SV9+Zz4ESHaMXxMNdKFZAW0rmjs5z4pZ
         XysWo+bK6aX6c7sZ2uRwIbTrKx553Tlqiiwj6zZraYdRfXN/AdOq4JZw7GsI7D1bQr2m
         f+LC+wLXdvxYH5Kmt4aa44UqgAuSxCN1oAW/SASH+S+aHRTSa4Ccp/e7wic4XHgGWDVF
         /6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732080974; x=1732685774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRwcqVhrMWWtuyE+OLPL5NHoUdOo/BxzRoMgxzXnrkA=;
        b=ndq9cJwPzpgZajZvFCXPRHXOhtV8NDRLA2XC7tN9gcngK03tmbquM6MDtqJR7ZsiG+
         0FVTl9R+sW2IGImckn19+IQQN904lBvfT0tGZb6O65n2CdMnjOePHD0m3QRTIbwIKeA9
         fX/KkWGqxtXxWpRp081H1uT8YCC0Yw2E/Q67ni/m36cZD1rRPZcmli4aLvcw5dByLCZ7
         5eMi4GQavjEb3VYbhEDKKaka5LFxfn5Bzt/ljfZ3AHY4G68sY/n9eKk4csVyAtBo7+1Y
         hKNjtfO5IIuNHyo4BELxoFxaEFw1edwHxpSjhUiICPZufo7bmfxaVeDzUgtTrETtDicS
         8GjA==
X-Forwarded-Encrypted: i=1; AJvYcCVZfVNKpfiLQmJaXG6Njohdx+edbe/TLQEgXKkhRrk0IoSvoCy0pOV9CvaGIY9QfnB/RQWNJ/9lKTbgR4xsrzpZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyybxXgpnN+yQzEX4bBfhxE8ErD9Kwd0jthVqH2s+hqNqbrJC4M
	DLPBRyDqSBobCUREbkz4ew3gapZT3Lf1SsCgB/W97UWb/rT+RLRH
X-Google-Smtp-Source: AGHT+IEINX116vl4gIhEO+YETzlb+ZEQU0ZOmoguc1OJHWnXur7CYB6qLK517Onlg3HZrRiY5MLnfw==
X-Received: by 2002:a9d:7b54:0:b0:70f:7123:1f34 with SMTP id 46e09a7af769-71ab3216af2mr1408427a34.30.1732080974485;
        Tue, 19 Nov 2024 21:36:14 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:4fd4:a79d:4d7b:917f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1c3224asm8639311a12.29.2024.11.19.21.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 21:36:14 -0800 (PST)
Date: Tue, 19 Nov 2024 21:36:11 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 06/15] Input: sun4i-lradc-keys - don't include
 'pm_wakeup.h' directly
Message-ID: <Zz11SwzIYTgkgbty@google.com>
References: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
 <20241118072917.3853-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118072917.3853-7-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_213616_124546_917E838C 
X-CRM114-Status: UNSURE (   9.86  )
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

On Mon, Nov 18, 2024 at 08:29:05AM +0100, Wolfram Sang wrote:
> The header clearly states that it does not want to be included directly,
> only via 'device.h'. 'platform_device.h' works equally well. Remove the
> direct inclusion.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied, thank you.

-- 
Dmitry

