Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343DCCEB2D2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 19:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WuleB7Uof+tsaQSPA6fNwqHx1Lp/3ZhdyDUy1IclBq8=; b=UZy8mLjSzzvoiB93Ia97KLpl2T
	A9TabYKAqM6FWXeG5avPDd6DCbD3Q7X1T3aiBrVBhTK4Ef6EtWos+EE0jbaxmtYDgR8ObZD9PSxRb
	2+1cTWCmk7JtgKBi2Oq7WmI9PcKf0g/ABXtusume6ZzlrsnamMZ1LiCrnaJbtsqLc5/2nlTUvNZZ/
	iz2spApH4Tqee6aWcNMYyRbs/VRgs1JsaBSQl08XpfIxWxb9YPo9TG0xICPhXStlZoTxHxJ+umqJF
	kaRvfNs7sTMMA/7M2rziiQR8MIr3S8+RiyJg3bsI2lMbhlTRsWsWKETMb11DsEH+yXjmywmB62o1z
	S8RPwl4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKMN7-0000000E2PN-05qr;
	Sat, 15 Nov 2025 19:55:45 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKMN2-0000000E2NR-1BAi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 19:55:42 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42b566859ecso2191721f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 11:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763236538; x=1763841338; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WuleB7Uof+tsaQSPA6fNwqHx1Lp/3ZhdyDUy1IclBq8=;
        b=BUkVxYsuDdBrUm70yYt5z2NduPhOlv8ZUO+nUWmq7Q5ZaVPIBnZWHtF1PD49985AfF
         aOrXf7KWLiVVRH46icYk89UZRgd8LAWevyktRFgYBIFl14rhCPJUKYJqkrEFV++oXhXO
         rH6H4inuz6gSTEL7J2mJ1yKfCkpAe2E5sKCMa/BKeLJBanTK+GZobLdJsrbcXs75pgSE
         dbVwaTcFc9zyhA0WCgdG7XgU/aH5INC98jsSWjnMi4dbVAw2yyIBkYruiNvWL+RHtRqg
         LF3f++GdaBTOo+AIduCdbJXVx4GnhSsiPYEQuEW1dpuqh9Ye/9l4m3SHotn/73P5vTsw
         5SwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763236538; x=1763841338;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WuleB7Uof+tsaQSPA6fNwqHx1Lp/3ZhdyDUy1IclBq8=;
        b=TkQS3eJVbLpy3NccRqXlSeK6cZ1bUQKBgAKz6Xa0mxGI7lGQVPq1T7l998sjM4MGJo
         C9LXeDbIP/yDoxHo1PGVzVIck0B5fBIH6iv24U6sRG4YvURfa/i/QtoMiOY43nkR7wvO
         z2xhMK5Y6J2ABtu0nv7jGCZ94a0h0rBKg40tZUgGDG1QKKSdBrdz7jxTiMvbvzt6lXnf
         DHn3PJJV+Cpk+2IBWW81QUqVoYqb7Tlkbo7dge2oRPImOKlXMbliOtgm5Mzk8BJ79nkA
         o7svPOPoVo9GIpfe71yq55XxwC9RsTj660P+gcLTG7dDKu7AQD0pw1nViZiJ2+x90D72
         GONQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN0jnKxxpUv4P5ROoXxCwg6zwfgMmq3xae4wp6m9iiCzdNmdEp7k98olq8fa5wbOMjAfP0jt3bkyg7jCRAY4F/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgys4jPeMNlFkqwjMOFOYYl26qUgeXH+N6wX1gbK8WnY6svTZ6
	kV3TLPcOeEzKVqvI28D74Dd9OvbKbLWHtMXJjiyxvCPVxW0PN0cpmPXg
X-Gm-Gg: ASbGncvSJmG1l6ElSon2WszI1XVFox4axnWqgyAXBjv2P54gKwejV35IsvfK9f2i7P/
	QWHkcGzwqmM0Zoc6rzq3fQgFU2rIp4rrtzEglkV1MuwsqWfpXm19CYqLUF672xSdgBzaUBaMlm0
	PBpp3+ssogOcj/M7CVntzQ7+/9bZL//mmgUz7aF0yUawUuPjcjSCIxWRuMbBif/ixF5yI9s8DvO
	CZlnfU3Cpl/beLrxfxZ4o+rmmZn0YLDXJ4U1bkFoojuJm+SfjuKpeGZz3yubDVnrOhK/zkV+vdz
	Oy8uU8HyoaYy3q1WfmkGR7w2vuzrsFALCvBXZil6v2b5nHhulMi4L+v9DI4Ry5nmBDVx43dpOnu
	Xi4ffqmgaS3L0JeCAmaeNFYJmRiW/d6pVMwfMuaH8hC79NiZzoRfPxnLPoPdBBLb0A3/I6umVZ6
	wVzDe+nM8+uhnRtbbPSHtwDWu7yg8Di4MbJoQMYeR+uKQ5QMyTTsFDV7RoyWmSd9k=
X-Google-Smtp-Source: AGHT+IEf62GmYjxzwvkFlgA1Y2k3Lbqy6ScY6eZSdDpeSqLPl8AdyiMH5V2WcDmQSZsaAfQG8l5H1g==
X-Received: by 2002:a05:6000:1447:b0:42b:3a84:1ee6 with SMTP id ffacd0b85a97d-42b5934e2d7mr6759730f8f.24.1763236538325;
        Sat, 15 Nov 2025 11:55:38 -0800 (PST)
Received: from Ansuel-XPS. (host-87-10-15-59.retail.telecomitalia.it. [87.10.15.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e84a4fsm17126800f8f.11.2025.11.15.11.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 11:55:37 -0800 (PST)
Message-ID: <6918dab9.5d0a0220.170613.3fe2@mx.google.com>
X-Google-Original-Message-ID: <aRjatPM0eXV0N5XZ@Ansuel-XPS.>
Date: Sat, 15 Nov 2025 20:55:32 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH] pinctrl: airoha: Fix AIROHA_PINCTRL_CONFS_DRIVE_E2 in
 an7583_pinctrl_match_data
References: <20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-v1-1-d2550d55e988@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-v1-1-d2550d55e988@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_115540_337435_BFDC4F0D 
X-CRM114-Status: GOOD (  21.42  )
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

On Wed, Nov 12, 2025 at 11:44:30AM -0700, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y / W=e):
> 
>   pinctrl/mediatek/pinctrl-airoha.c:2064:41: error: variable 'an7583_pinctrl_drive_e2_conf' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
>    2064 | static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
>         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Due to a typo, an7583_pinctrl_drive_e2_conf is only used within
> ARRAY_SIZE() (hence no instance of -Wunused-variable), which is
> evaluated at compile time, so it will not be needed in the final object
> file.
> 
> Fix the .confs assignment for AIROHA_PINCTRL_CONFS_DRIVE_E2 in
> an7583_pinctrl_match_data to clear up the warning.
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2142
> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Christian Marangi <ansuelsmth@gmail.com>

> ---
>  drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> index bfcedc7f920b..706532a820b0 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -2993,7 +2993,7 @@ static const struct airoha_pinctrl_match_data an7583_pinctrl_match_data = {
>  			.num_confs = ARRAY_SIZE(an7583_pinctrl_pulldown_conf),
>  		},
>  		[AIROHA_PINCTRL_CONFS_DRIVE_E2] = {
> -			.confs = en7581_pinctrl_drive_e2_conf,
> +			.confs = an7583_pinctrl_drive_e2_conf,
>  			.num_confs = ARRAY_SIZE(an7583_pinctrl_drive_e2_conf),
>  		},
>  		[AIROHA_PINCTRL_CONFS_DRIVE_E4] = {
> 
> ---
> base-commit: 57916750bc0886917ea2c6209ca6a56acb7b8182
> change-id: 20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-bbf4cff20b50
> 
> Best regards,
> --  
> Nathan Chancellor <nathan@kernel.org>
> 

-- 
	Ansuel

