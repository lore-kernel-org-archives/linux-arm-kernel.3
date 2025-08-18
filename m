Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF538CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oEZcdKV+F3HN549t9QYg1ucePO4lYhkjhvxgJUEhtw=; b=KjyAjMrWkuMXnQ8hWRrFh6Bivi
	T+5IxWNDvFUEtl0u+5gBq4SWVJCNI6nPFtyu1iDuABqQec/JykHkKRrLNgYU27niOcFwuxm9pTWNx
	Pi7F2vgwXoLE9A6ZvAvNcJtmy1toaWrkRgAAsEDTOHH901IalNp/8muu/ezYiUcr1785Fmx8xWqNn
	jYqf7+OA50dcN4CvdsuGlBavP0baM73VOvkMpRa5jV108B95CW6uYyWzVIZ+lKBuF62ZqX25LqVG1
	01+lMRZcn1eqUPhqNecKFMkGpMCREM+Qn4wHg3lWJSknDkzN9lhjoVucMmd5SjnxIgv55WaAXwpWJ
	9X5csOQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3iL-00000008AGP-1D22;
	Mon, 18 Aug 2025 17:32:09 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1kD-00000007uvr-1WO9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 15:25:58 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3352212fefdso6454191fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 08:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755530755; x=1756135555; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1oEZcdKV+F3HN549t9QYg1ucePO4lYhkjhvxgJUEhtw=;
        b=gQ3GSyRmgH9FdsNhos78KIi7TkYXcrtSzh3CAUgOtY0ElZpnm5p9+Ql4keMlof0Mur
         YIVwX6AwdtQk3ZjuDuND6vuPNDjKGwtksb6iYnqGHR9gJR9uit1+scTfvpIKEVN++3X9
         ddGGUrSlRoOOk14Wtp2FhgNKPGbF+WoT3LJO6HBtsryglP8X1BkxItWR33+ggehhdLUD
         gwQgH2UokKrALs4sgeG07UfhiAt+9XuOHpKi7FHEA/ToODjv8yIxZZazb99lbnk/lWxQ
         Az2UXAm9GFLQQGQSch0iARvOSPemUSQGddh7s3eEtu6DXQAZ9CcLdj+sr8ty/sSgzmDN
         Le6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755530755; x=1756135555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1oEZcdKV+F3HN549t9QYg1ucePO4lYhkjhvxgJUEhtw=;
        b=i94i3ilXbb4XoUIJWvwYtNjEPTS8rqF3/FNo0K8kGpY6LtAdlsPlAPd41VFWNpn2Kf
         dgdcYnzD1Hg4XaxQ8cSK5r5XK9VlZJq/+iaRCX62sMuqQVZezdewuS+g9oSel7JuK80N
         /9Lg1uqKYpqLYxrjCCw7+d9mn8wwdfJRD4Q4IazTo2FtVkO7Oa6Rq2t6rNgNF/e1K4bh
         dc3byzKRnXsOFTLXxcmEoZZyQ5oxGp8KQPTsRbbBRDyYx8FnU5k3uu7Rxls/i1UCpCg6
         rK/AtxhJ5Nv3wM3eJHmATvpoiHikVVZy58Alfia5EVrW2dUHbV1dQN57e87Agf2jXDFf
         6dbw==
X-Forwarded-Encrypted: i=1; AJvYcCUunNLNNp/Q6bWHymXgq2G+8Za9Pt+IOoK+7RYtZS+//xBuNv4v6laIL2h83c7NVXo6qv4OKwDQJSsmkFxomZ7t@lists.infradead.org
X-Gm-Message-State: AOJu0YwwduzjiLp/bCsspYeckNwE8Fe+fR0tYDiVtB2wyt0lCXMmD3gC
	g6gGxig8q7EB3Hf9PHl5RGHOwEcr7cotTi0s7tPqvHsXsYFkKwApie3JqXHNqpZrj7/B/67RM5t
	VjUJNlN+ExQinOKm6xqv7CnKfegvXl7hE4DUbWbFSPw==
X-Gm-Gg: ASbGnctW9T62AmWKoMJoEXFYwzIKAsTt2WtPgJyodrUgfSIo9URJTPMza5LdU/0WSme
	Hbr8Z/4fBl31d9ItnWuwMIUQeeT+IE/pEXHsPAneITiTIO2KuExQ/vE3jak/TeUmZ3jbrZGnMCe
	5Ix4fZ/YvWlrqS5J1jyTov1IZ2Uv6FSRSXrkSNvWtcjejzXCXKUkYl+N64DNUAsMCicNknK/WXO
	mP0Jlw=
X-Google-Smtp-Source: AGHT+IF7jJwsrRzO42NL+chsKwMn6Ix57fxBMVKhFr/ndsWqH3grRv8+sgAF4MHjsP4Rfjg6ex5PjKBAquVduE8uIUg=
X-Received: by 2002:a05:651c:1994:b0:333:fa8c:9aae with SMTP id
 38308e7fff4ca-33409895954mr23385851fa.18.1755530755294; Mon, 18 Aug 2025
 08:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250807062038.13610-1-chizhang@asrmicro.com>
In-Reply-To: <20250807062038.13610-1-chizhang@asrmicro.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 17:25:43 +0200
X-Gm-Features: Ac12FXwIsY2qV8P2_za5vF8TVNuh-JEuLnjBka7DbWUeN1Ia7Wo_E3vTo7OQCYs
Message-ID: <CACRpkdaofkDkgfKAY9yB46rXpyfrfSyBORDZ_reAvX1HDv+z2w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: single: fix bias pull up/down handling in pin_config_set
To: Chi Zhang <chizhang@asrmicro.com>
Cc: tony@atomide.com, haojian.zhuang@linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_082557_396736_B7044B77 
X-CRM114-Status: GOOD (  12.30  )
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

On Thu, Aug 7, 2025 at 8:42=E2=80=AFAM Chi Zhang <chizhang@asrmicro.com> wr=
ote:

> In the pin_config_set function, when handling PIN_CONFIG_BIAS_PULL_DOWN o=
r
> PIN_CONFIG_BIAS_PULL_UP, the function calls pcs_pinconf_clear_bias()
> which writes the register. However, the subsequent operations continue
> using the stale 'data' value from before the register write, effectively
> causing the bias clear operation to be overwritten and not take effect.
>
> Fix this by reading the 'data' value from the register after calling
> pcs_pinconf_clear_bias().
>
> This bug seems to have existed when this code was first merged in commit
> 9dddb4df90d1 ("pinctrl: single: support generic pinconf").
>
> Signed-off-by: Chi Zhang <chizhang@asrmicro.com>

No replies from maintainers so patch applied!

Yours,
Linus Walleij

