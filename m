Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF152D6ACFB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCudBcw5akO4madupDYz73GUtrdMHgyCBVg+ab8JlvI=; b=tFcaPVt0YEOjebwMpx0icEPFJa
	SlcKR5kQ6EuBUzkEH7Q58YLB0v92LfJ7YUX2I0I7qkde+aZSLn6naiB1osA4ZusGowisVQdgdzTlS
	flNk3nCYfhCxg/45VvVEFbliH31Jt8JOqYUj8GUscRBJoYDbH1b99XPvu6xbQk+EgMRbYS2gpNfiU
	fB2MVLEUs1P/CsmXHPXraPx4NiujFv7/kS+be7tRtjbbYth4gnZkyQ41Cx46cvcSWNmGBNapRNRfB
	x+c1Ky5MMbcNgX7CPtoIj39sr8wsRcMsSYrQd9IJIx/j4ZZWE5a+R1kQcfjCp1/OntrQqUi4nWVf8
	6rvIfUIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDyc-00000008WCz-0bCr;
	Thu, 18 Dec 2025 13:23:30 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDyY-00000008WCC-3UQo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:23:27 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-64b791b5584so542974a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 05:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766064204; x=1766669004; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oCudBcw5akO4madupDYz73GUtrdMHgyCBVg+ab8JlvI=;
        b=WdnejxEoKyskfeH0mrm16inza74sMqi9B6SWxGxT0tWFK9IKDh3ThzUqHYEk4GspZQ
         +rA1hlJea1Dp0aGHBuP6VJXZ5sDdXCN5IbN23FNvfuxY5ZqarI3//EgU8yI6OtOI/smn
         gDQnaLtTajEPKGFDq/CJf+6+3FnIC3OoLoD/FhboCTgZhivvlzyp0YDbpkhYKTildsRc
         /GzaNFqGm7C0iIfrOS24e2gn6wByEo7tpgxHZRSHxfvVJARWUkd3ujIoJJNGPbjLY84L
         IZNsie9p0sJfqZnrFOzKPxKlSuyZB3BtIzcPFTnZEIBilQvbBzDXXFCv5l2Q5b/46guQ
         6/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766064204; x=1766669004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCudBcw5akO4madupDYz73GUtrdMHgyCBVg+ab8JlvI=;
        b=TLU7A6/2hch7mxQB9Y7hi/ZK7OWNLmm1f3CNfH0Rv6z24Tf6XxEUYvylNJYnfdb2yk
         E9DWXI/wZPvErt+sXkSh6ApBzZC4I8yNTWVqGAFgbOkWIhHDKZZA7HAepcwjFqgxRFCF
         i2rb+t3ArVNAue3qTc5qBRpR7lmi6DLA/S+I4tyBW1jJBD2B9CP6fWNTt/8ksPRmF0vL
         0YD/QRyER8rjMj0bStFFeisCywmRHxaks8ztiO9wX28RYvHvImsp5WRpIrSpVumnZsQW
         uhqetkmM7iN7HbTmiXuVf9fCX02V6kp0jnyjLPNl27rJBUl59YKv47JTlMT7JE1jopDj
         n5fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfJ23DOIoJmU2IUiGaw3SPdTQ7PheKbyNaN2ZzMfIYfgvBdqgxtmeGs1Z2Z0U4YxiPHi02q5guPHFODMeMSxXh@lists.infradead.org
X-Gm-Message-State: AOJu0YywNCW0vH021VwJZVZq+eeJCMFfP0uBnF9hOM+PjBVl1hMuAN6j
	pZnnOPAh7FD49EfdHePrFsWQfs4ELzjqJ+XeDbYao/VZ7XugAAp/re0hIg1apZvhmY8=
X-Gm-Gg: AY/fxX7QnvRvF82TSFJEYdjRJ9mZZcTzV2t551du6qrleCVqlpId+8FnovndeUO9MFo
	KmrYekEGjJPltvf0+NdRiQ72hljvgKbDVBvoY3rRjpmEimutjS8Wk7DlMTv4e9YBn4cjvPRIBwQ
	TWSQJ3wyPQpxplLcOlo1F44bZtIZHWZX7hiajYUSXb5askyg+XFI9TT7J3jxBjQboGRs+tt3Mw2
	ZWWB38199nhWl60qj3rPpZpyNtFyYHi6YN89PzNWA9qKSIdxQ0JVv77LKYIYCKh6EJkJjvAFIxy
	dqFPHlHDb+vr9b5liCh46uYRU3E1e4IaQN2JPR2gCaNVt0owBejVACd2Jh+KR+RhP1ErECiVw7j
	trYBdZwCwUWkOUJjIRYC/0zjSMny9FkefFaVmcxBfztKCipgYZMn3d7DtagFVrGfHBCR5BYSdw8
	RmmK0UnJzxRR6/B1HX4a/3sgnQMmrXr8p8nEx3Q5cEXLYHTJoKDLdIcA==
X-Google-Smtp-Source: AGHT+IGEffrc7V99LBQekNjWi+jayFMaj4hzdwzei25erTP3Kr8QQXDpgbnbFwV3ifqZ4Xi+QZCiww==
X-Received: by 2002:a17:907:d15:b0:b75:8b9f:de3a with SMTP id a640c23a62f3a-b7d23b4d6cdmr2285321666b.59.1766064204083;
        Thu, 18 Dec 2025 05:23:24 -0800 (PST)
Received: from localhost (host-79-37-15-246.retail.telecomitalia.it. [79.37.15.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80234a2786sm232719666b.49.2025.12.18.05.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 05:23:23 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 18 Dec 2025 14:25:56 +0100
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, andrea.porta@suse.com
Subject: Re: [PATCH v2] arm64: broadcom: bcm2712: Drop rp1 overlay
Message-ID: <aUQA5IKqqsrElzKP@apocalypse>
References: <20251211193854.1778221-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211193854.1778221-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_052326_882965_6AF83520 
X-CRM114-Status: GOOD (  21.22  )
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

Hi Rob,

On 13:38 Thu 11 Dec     , Rob Herring (Arm) wrote:
> It's a requirement that DT overlays be applied at build time in order to
> validate them as overlays are not validated on their own, but the
> rp1.dtbo is not applied to anything. The rp1.dtso overlay doesn't work
> on its own as there are additional settings needed as seen in
> bcm2712-rpi-5-b.dts. In addition, the 'rp1_nexus' node is applied to the
> wrong place in the DT as it should be under a PCIe root port rather than
> the host bridge. There's also a duplicate overlay in drivers/misc/rp1/.
> 
> For these reasons, just drop the overlay to fix the warning until all
> these issues can be fixed.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> The missing applying of rp1.dtbo is now a warning in v6.19-rc1. This
> should be sent to Linus ASAP.
> 
> v2:
>  - Drop the overlay instead of trying to rework. The addition of
>    ethernet0 alias complicates that.
> ---
>  arch/arm64/boot/dts/broadcom/Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
> index 83d45afc6588..031875a277d7 100644
> --- a/arch/arm64/boot/dts/broadcom/Makefile
> +++ b/arch/arm64/boot/dts/broadcom/Makefile
> @@ -14,8 +14,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
>  			      bcm2837-rpi-3-b.dtb \
>  			      bcm2837-rpi-3-b-plus.dtb \
>  			      bcm2837-rpi-cm3-io3.dtb \
> -			      bcm2837-rpi-zero-2-w.dtb \
> -			      rp1.dtbo
> +			      bcm2837-rpi-zero-2-w.dtb

I'm preparing a rework patch that drops the overlay too, it will fix this warning
and the other concerns about RP1 DT hierarchy. Anyway, since this warning seems
to annoy a lot of people, feel free to apply it in the meantime and I'll adapt
accordingly, hence:

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Thanks,
Andrea

>  
>  subdir-y	+= bcmbca
>  subdir-y	+= northstar2
> -- 
> 2.51.0
> 

