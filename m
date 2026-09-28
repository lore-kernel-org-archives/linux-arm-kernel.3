Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A96CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 21:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7aUgUJEFAJxW4Agj9ChYhUj4PsOMZgwR99tcMvPKR8w=; b=eXaCBqgJ/rAs3uhk4SH5I11t1i
	c/B8GjbvLSrZhYwfOYeSQOS7eRuI8XZNkRvwKVE2/EMTSXLpZ48drXnpd6EI1pOxEalwZ9A3PHXJB
	7x1k1cyKH6jbEQltAeD6ssS7iVW0hym1lV8UGN16vaSJU1NoiKBmq0NngmvdpSc9gN1x/c/LG5Eu8
	JpL7gxEUBgWk2OFHGCWdExeIP+emXARTnAs3++3j2mEuL4f3+zaYQNw5bHnl00VualjeCdFzhmGEN
	Dkc1vxD9D8SNA+2t29iiBUBf41d95WQ+59EIi5lATidnRqihPCCZ3hNBGFcY/4JwHiGeauV0/fDJ6
	ixDeK6WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJ8L-00000001hAE-1n76;
	Mon, 28 Sep 2026 21:43:37 +0000
Received: from mail-oi1-x248.google.com ([2607:f8b0:4864:20::248])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJ8J-00000001h9n-0Psk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 21:43:36 +0000
Received: by mail-oi1-x248.google.com with SMTP id 5614622812f47-4b2f2b8d88fso5801798b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 14:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790631813; x=1791236613; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7aUgUJEFAJxW4Agj9ChYhUj4PsOMZgwR99tcMvPKR8w=;
        b=BvX4YpxBuYVyFaDLcPgFVNXev+B3byYyrovvtdsEhkOSK31kgIw+v5TcY6N39j712R
         F87DR8Vn7iArm4KVIAnQ+3Bttrjb2Nrsd75v/ltrVC/HWsfsS0yPGJx5lJjnaOFA8vtZ
         C8Obdoq7YhZ+qyJ8L/qg4g4We4ej3X70ZcBo+D2NI/0cqyAJfeapc/nmbTI9y0vJ9IFK
         tMUnKW49gzEybbocUUXxVyoJqHtssedjlGHIUpxYL7y6Qmr89e7CXIWxHM0fv004lUww
         Ouq+eHRerYz0YhzgWeurMJQGK4qqdZZWR8rA8vNRjkT1jC9/xLekpZ0cazwxYN2UHNF1
         LHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790631813; x=1791236613;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7aUgUJEFAJxW4Agj9ChYhUj4PsOMZgwR99tcMvPKR8w=;
        b=m6rFSc4ANILXHwS3DTXiyuN/k6JIj7L0X4qHO+vRLAO/f4daWZEbcOWEKko9vrbGqd
         ZHO4UWL5TuYs1dBsdUSMOiHD/ViJRMiUyvDspEFm6+leF49eLge0+AT9lZ2Zd90JjmRw
         g09XgMe88M2LJhDkcrV7d7uC/AkL2PZe8p4QJbGIYQYhyY9/hpEfWHFhYdXQWm9XOORb
         Yi8bNZ0Mb6U7PUX3k7/HaR5mhjLVxk/yWdy7JF/Kuvsenk6z43TuL3VW9bGUUQt8OCK8
         KM6MgCZ3u6XVaucX4wb+IDfHJW7bPrWaQMChXk5EDgsp9XBDFk0QxFL6PAY/+TGyaS3U
         urBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxog/UOUsrpiRCS8pBkkUL83LltNpN1rcUpHHuERMoUPOyaQnDkyjpvQYEuB3wCMguIihSWK89I9LxpzG65eLB8@lists.infradead.org
X-Gm-Message-State: AFuF++kE6wpk0ldyW/F1UUAod1G/5OG75EPOxh6F4nY0eXuGMJDsDNQx
	ZnTUqzG1JWiGm4xrxgppCwx4ezW2JtTfTR7Ovjq4NWugP5BqOu/hOLFYiDD3RiGIg3qrwMUbYC6
	azO+9NcWUvUGNBejZj4r9IN5BXQ==
X-Received: from jaes22.prod.google.com ([2002:a05:6638:aed6:b0:5ec:8614:b65a])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1a03:b0:4cb:f21c:a795 with SMTP id 5614622812f47-4d72982efa6mr13977211b6e.29.1790631812905;
 Mon, 28 Sep 2026 14:43:32 -0700 (PDT)
Date: Mon, 28 Sep 2026 14:43:32 -0700
In-Reply-To: <20260927190758.609156-1-nikitash.mariiaw@gmail.com>
Mime-Version: 1.0
References: <20260927190758.609156-1-nikitash.mariiaw@gmail.com>
Message-ID: <arrfZ5CYyLt0vwu5@google.com>
Subject: Re: [PATCH] pinctrl: samsung: Use snprintf() to construct pin bank names
From: Justin Stitt <justinstitt@google.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, peter.griffin@linaro.org, 
	linusw@kernel.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, morbo@google.com, kees@kernel.org, 
	aleksandr.loktionov@intel.com, codemender-patching+linux@google.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_144335_154943_05EC24A2 
X-CRM114-Status: GOOD (  20.86  )
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

Hi,

On Sun, Sep 27, 2026 at 12:07:58PM -0700, Mariia Nikitash wrote:
> From: Bill Wendling <morbo@google.com>
> 
> samsung_banks_node_get() constructs each pin bank node name by copying
> bank->name with strscpy() and appending the suffix with strlcat().
> 
> In preparation for removing the deprecated strlcat() API[1], format the
> node name in a single snprintf() call, which preserves the existing
> truncation check against sizeof(node_name).
> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Cc: codemender-patching+linux@google.com
> Assisted-by: LLM
> Signed-off-by: Bill Wendling <morbo@google.com>
> Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
> Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>

Are you forwarding this patch on behalf of Bill? I see Bill as the
author of the commit and I recall seeing this in some series he sent
earlier [1] and this patch you've sent doesn't seem to be a v2.

Let me know what your role is on this patch and why it has been
separated out from Bill's series.

It is entirely possible that I am lacking context. Please fill me in :)

> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index 5ecc9ed4c44d..0d639eec689c 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1155,8 +1155,7 @@ static void samsung_banks_node_get(struct device *dev, struct samsung_pinctrl_dr
>  
>  	bank = d->pin_banks;
>  	for (i = 0; i < d->nr_banks; ++i, ++bank) {
> -		strscpy(node_name, bank->name, sizeof(node_name));
> -		len = strlcat(node_name, suffix, sizeof(node_name));
> +		len = snprintf(node_name, sizeof(node_name), "%s%s", bank->name, suffix);
>  		if (len >= sizeof(node_name)) {
>  			dev_err(dev, "Too long pin bank name '%s', ignoring\n",
>  				bank->name);
> -- 
> 2.43.0
> 
>

[1]: https://lore.kernel.org/all/20260915081910.4142719-17-morbo@google.com/

Thanks
Justin

