Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F72CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 16:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxU/c9QtdpeT6vjzYdNg7d6fasiYd8WLob216PwFuUw=; b=I2IsrKuvf3YnYGm0rEvvUG4DTB
	uCxrphfiXyvJsJDpt6hqKEGerD4ff6FtOxrEjt4+erKP09TTA8J4c4n3TMdd6WyLqTdXchBjeywZ3
	QmK5Jw4kFp58QKS+MJIqRADkojLTmC7xbQtD49T3XWTHLvjGkycB5QKIP4vOJZq5G2EanFQVSfAmX
	TX+yCE16QpIW5/Mn2v6v7YwFux3GdUvbpOI6gUsf6/Ev/on5mleSgfYRGH6XsbIYetLLKyQjUqbHf
	twbK5cgEHCyEh7Acze8xwq0I3q2x+C3idx2hCHyUrvuyCzzKRNfG/JxYk2zv7gm/T7BHQQcmgdgjq
	sNIVvcmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up8XS-0000000Haiy-1xnL;
	Thu, 21 Aug 2025 16:53:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4kk-0000000GxUz-1vmu
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 21 Aug 2025 12:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fxU/c9QtdpeT6vjzYdNg7d6fasiYd8WLob216PwFuUw=; b=c7A93HKRmO2dCJZ91kqun8Kwj7
	9r43oUQaDxFmeAQ2PlmoKKb3dYAd279zEDzngsBiUoaBR8RgHEL6U2sGSuMwDZKIOYC0ov/lN8lhj
	KIUrwgtaV7WVJ+eWNmqaQ0oX30mXm0FDNd5kUYs7tXQ6g3lBPNGIJA3cqR6RvQVq8YEfKoo3syQvg
	hY4GnVpl6Qn62zHtSu8vdXDj9gyfgwEO2LoUXCNz87zXUajc6aQhSvRVtzmbkTicBvC3ib+51ghwB
	954M5nWnspEYFIKsQ5yWPQRmaUuGfGA6T82UARQ8eipUJSuxRIgxh6tbjzTbC++IHpfT4C8BVT4W6
	yONgYWKw==;
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4kh-00000000YPA-0Ja6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 12:50:49 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-70d903d0d0eso2793076d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 05:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755780644; x=1756385444; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fxU/c9QtdpeT6vjzYdNg7d6fasiYd8WLob216PwFuUw=;
        b=LFOyRD/+vAnKtYkINJYi7vDw9h9cTnrmW8A0V+5qxcVKLNxLO8RkAeI3To/xZlx1A8
         npWUv4pAYt8AjMfxqji16qp18GwDtPTXqfuJDnkW2ZNAKI+7fwmiGOSYyaqVK2iAOKC0
         LKzeWvsuI1hWXiFAo7tE9KCfhRr6fG8ilunh7Jxn3QEMZt1DvyNZuYbk88NRymjfw2WQ
         lvZHyZTXH9fYXHeahG7vZKAEoY6R45Uc70Evys9OjKDENag83CW9o5FOXY+AZcnECEHG
         zdwHZXikSVHfNuaogwqgtiq4FFJgdw0xBUmDRpMMPNfIzhihsSNvJ2zlPe9MR5VyTf85
         bzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755780644; x=1756385444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxU/c9QtdpeT6vjzYdNg7d6fasiYd8WLob216PwFuUw=;
        b=TfcEShESSw6QCuuWHnPqBZW0Vm6Xc+GIqeHodIAtyRNV7sZt2p+5anRNSTLSoKWKxh
         aejXpQotG5UxF/tfbsAg0yEiAYi9s4FtPRjgVb5tqw73jxTDcvXXHqnzNfpy+JBDAz87
         dlkhgcjHiT1BPHH70b95xoqbacdfjzy2cIghs0A2fOaXB3LBR2hd+gm/9nmZ3ACOIgkr
         BV/rAzrMRfiZ7/0WDX7reL0rSVkLYAL81GuSAUE8KqnDz4oDsXcZC7c+c2X5Wgdin9Rn
         pYuR/T9fil8zKvuBiJ+z2UMlf2zGv2HKk1A3bKciVUbR73hExMMa3thn6jJUS8wuGLRv
         MPCw==
X-Forwarded-Encrypted: i=1; AJvYcCXZRJXOfyo7xfMU81TRV7vI0HTm8tFMJ/1KbgcYNmjPhtxCdsa+SUO2+93MCnjfj+64di+HWXvDjFHYBpm7CX+g@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf2ii9PCII5Bsk2WIWzHtqnclV+76YLEqNI729Zg7SDmEXKfPE
	PtspmWWiM76NMVilINAAkodqIn8hlg1Y22uxhVLSoRhGD4A2CIkB+Ha8
X-Gm-Gg: ASbGnctFSNOTzrlk5ZMuKANOnlSAUFPHGM9Cfsb43NPzv5IyQbqdiNYOuFIT+NGZqFM
	/uV5nZorb4ExykFS191PCg9H3BHEYw5L7XqezxN0uS/x8vmsQYHfLaWMtJytqJW628Nb1gd6VV6
	xqbEyyw99w+d+2+/NgGRbKf5Rpym5TEIL7M82ooJUNaNIC0YfS6d6iR9DbbQdxsfUhr5/BsXIY2
	8LpTmW2ig4gzerw4/EH3UEmYi7e/7g+hFjzDdjD+BJAkYdKDYy1c3ZyEkgQM6ildRRBpSw9MIR/
	J5COr7ymNPei+ugNIITq2uGoKRSqYSnhSgHwgmb+lql7T2ye72mq+twgI/0YfJ5yaD9oq4JFA+v
	VmrpX1sxokUUAsK95b+vJbVIIc3FY320VdPmG86fDZnItyHuzSpHfwsSAEg==
X-Google-Smtp-Source: AGHT+IGbZanLkhWctvc/z0MtnIxZdEvoJJZIiEwfGt+Ut7mMdNAmEieP2/DGUu6J7Q5lwzwUveSegg==
X-Received: by 2002:a05:6214:478e:b0:70d:9527:e45a with SMTP id 6a1803df08f44-70d9527e62emr1519806d6.16.1755780644519;
        Thu, 21 Aug 2025 05:50:44 -0700 (PDT)
Received: from glsmbp.wifi.local.cmu.edu (cmu-device2.nat.cmu.net. [128.2.149.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70d905e19a9sm5318436d6.19.2025.08.21.05.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 05:50:43 -0700 (PDT)
Date: Thu, 21 Aug 2025 08:50:41 -0400
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Joel Stanley <joel@jms.id.au>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Lars Povlsen <lars.povlsen@microchip.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: net: Drop vim style annotation
Message-ID: <aKcWIZ2zMKuOeW6M@glsmbp.wifi.local.cmu.edu>
References: <20250821083038.46274-3-krzysztof.kozlowski@linaro.org>
 <20250821083038.46274-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821083038.46274-4-krzysztof.kozlowski@linaro.org>
X-Clacks-Overhead: GNU Terry Pratchett
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_135047_253774_06B3D06B 
X-CRM114-Status: GOOD (  15.55  )
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

On Thu, Aug 21, 2025 at 10:30:40AM +0200, Krzysztof Kozlowski wrote:
> Bindings files should not carry markings of editor setup, so drop vim
> style annotation.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Gabriel Somlo <gsomlo@gmail.com>

Thanks,
--Gabriel

> ---
>  Documentation/devicetree/bindings/net/litex,liteeth.yaml        | 2 --
>  .../devicetree/bindings/net/microchip,sparx5-switch.yaml        | 1 -
>  2 files changed, 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/litex,liteeth.yaml b/Documentation/devicetree/bindings/net/litex,liteeth.yaml
> index bbb71556ec9e..200b198b0d9b 100644
> --- a/Documentation/devicetree/bindings/net/litex,liteeth.yaml
> +++ b/Documentation/devicetree/bindings/net/litex,liteeth.yaml
> @@ -95,5 +95,3 @@ examples:
>          };
>      };
>  ...
> -
> -#  vim: set ts=2 sw=2 sts=2 tw=80 et cc=80 ft=yaml :
> diff --git a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
> index a73fc5036905..082982c59a55 100644
> --- a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
> +++ b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
> @@ -245,4 +245,3 @@ examples:
>      };
>  
>  ...
> -#  vim: set ts=2 sw=2 sts=2 tw=80 et cc=80 ft=yaml :
> -- 
> 2.48.1
> 

