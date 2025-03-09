Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F87C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 09:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjoirmZ/5qUE6QTY9P4KcVvh5GMm6iUYiIH5ki0k/yU=; b=IZcgArBTccY7YgfiwE+oL63ZD7
	Ea3fKuBxY1z2wzvJskNWogG3fXMvwUyraEsu/omDIThlZDbD/Tba8odKhO6Z1VI0Wcva5OchaFZMH
	kI0CDGuSeFOx06fFqxwy5HR1kit9aVyXGysGL38As6sl9sSKXZK2CSUlKlam7OX4ysAdbGjd8LjEx
	b077aQVfB+/hQV6xi4eRWGepXof/NCQ0ncD3yNk9OLBlujN0nsXLxgGt2iO1pxrv2BSmEmUwegiAQ
	zbyeBJJRnzpEcpISrJC38ehVY74GBzFxiGCH3PhMj/aWjYYfCc0gc9qEMPGE8VY0e2+tJFHjPQtD1
	wx6VE8Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCsM-00000000H3G-3Z2X;
	Sun, 09 Mar 2025 09:23:14 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCo3-00000000GVF-19YT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 09:18:48 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e549be93d5eso2852914276.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 01:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741511926; x=1742116726; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NjoirmZ/5qUE6QTY9P4KcVvh5GMm6iUYiIH5ki0k/yU=;
        b=VlI1+4iDWcNVmArg4ZzNUfpAfnSsS8JYXRj9rR6wYdQVFLFzILJxAJDsqouzNZxW7/
         KiEkX00RcgUeN2rHuJmr5dpaX9Wg38PZCfZYgAfvTmYJ8nocFHjkH9LF4RBkQ7sEndTt
         hAP5UqgyrPQWzZnJRawub9WLr6DkolEsflJorDUrTvvrd4LFmrwLJNadivNTpDqN4A8V
         rGo7bFbi3q+M7rH5P8zBPQvl7r/7RXKKVM8MMlQbFwwRWo+cqQ8Iq3n6XFAyyFyOjAgp
         4NVOO1XPpPErGjVDaP130ta2nvOEqVQmIZgBwg6xUw3jJP2UeJE6UeVK+TpA3H9jDqPc
         J7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741511926; x=1742116726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjoirmZ/5qUE6QTY9P4KcVvh5GMm6iUYiIH5ki0k/yU=;
        b=CJt8fZrsZa6s4y5TjSluTwtlglhvX04+Qk67xIg4WKlUlru/y/ne62hmyfuBBAz4eA
         8OD8na/9R7+RRsMO+2mF68pv18QJx7St/fOJLZIt3U0975H5tLp6FImNif3tKcwVPx+3
         9LPjX3tlh9CK3Rr2wFmdUr0fDKPEJwwDvDpAsvZfg46wI+FE9zFdDXtGs0UsGJViFEui
         ChsxF+/qlfe0LfUM44AxUsuXbY2eiMWVHOKcikoJqIosFb/odv3VeCOh9AIaATQoDTB8
         N1cQPK2qDyCJwPayaU8ZidV5ufP83t3y/cnYlKnylbgEDNE106EnpJn2WEMa+cWoXw8+
         vBFA==
X-Forwarded-Encrypted: i=1; AJvYcCW+5US8SjVjc+haZg217VODOwTpCMwNmC8TKjfkwuYvlva/8cQlf3hA/0PgWe/70aG/7aOJjwon6IfMeXMz1PjZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwcXxD1t4PvyJsNghJ/93JFskaZTT7eERFZK2JU59tjTOfTlXdm
	r+Vm62KE4p0ofmdOSL79uvgoyqn3DxHGK/Zw3Jxpy1PJ4kQyLuFGwlcIxlZbXvF4ppvJ7zwEc/B
	aCqATHQcyR/o9UlmRtv9I0QlMv9PTmJDXWYlWFw==
X-Gm-Gg: ASbGncu71LvMdlrztF2YHRjfBDXHSffteQEIGMELFVpySKqmYPihxKM+IhyEcDQTM8D
	k/R5SxXw7fk/vlGPlnAiNCOnw0FnWUYFbCP7rY2ncokglS7WGoTC6reVxMaNuGwm4dNjwUG9dSV
	YXTigWxfwgYRg2fGc97VUzV5FFfuYhB5jsMZzDUFAj
X-Google-Smtp-Source: AGHT+IH4XPDX1sv9v/O4fHv7FdLtDOK1nSH/pYUTyPU6X3cGpWa7GU9Du4h4efF7cwLgeAUNmZ/eF/AUnWn6NuP38pQ=
X-Received: by 2002:a05:6902:1ac4:b0:e60:99e3:f8c with SMTP id
 3f1490d57ef6-e635c2fea74mr12941522276.46.1741511926194; Sun, 09 Mar 2025
 01:18:46 -0800 (PST)
MIME-Version: 1.0
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com> <20250308-phy-sam-hdptx-bpc-v5-5-35087287f9d1@collabora.com>
In-Reply-To: <20250308-phy-sam-hdptx-bpc-v5-5-35087287f9d1@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 9 Mar 2025 11:18:34 +0200
X-Gm-Features: AQ5f1JoYXHeMEkeI_3Qn-eZRDS7BsRAZP2eXaZlYLUfhSvlvlxiajsqE4pYYYnE
Message-ID: <CAA8EJpoqRbTgkvQz8E2PpgC9QAsQBHvedY8=xH4haMVMjNbSuA@mail.gmail.com>
Subject: Re: [PATCH v5 05/12] phy: rockchip: samsung-hdptx: Drop unused
 phy_cfg driver data
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Sandor Yu <Sandor.yu@nxp.com>, Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_011847_313906_2256D6B6 
X-CRM114-Status: GOOD (  11.46  )
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

On Sat, 8 Mar 2025 at 14:21, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> There is no usage of phy_cfg in the upstream driver data, nor in the
> downstream one, hence remove it.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 1 -
>  1 file changed, 1 deletion(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

