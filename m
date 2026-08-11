Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A038C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 21:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgndDYlcvXxrotByazHMiHza1kewS9hYlmxpzQFlVp0=; b=Jz3m7Tf2uB/rjc5mv4/FMzrUH/
	Vruoiwsc/Yh8Gl3b/9jR0SuOoZ/+sTDn/GdSRCgcZdL0RG25HEl+tIhKcdkAKGDJpYdOTSF6CYN/7
	Y6/8Y/muQS5PmPId1v6ZcuZEs/Y3Lap0lZsQ1cataWzVpdzoJAHoA4ywwgr9VaQaKbWEUgfh9aYPg
	GZsQy71hdhl2RQLiwcXsWcJFrC5ua8Mbcj/v7JVinNfoMt2REsBR8RWK2uGhU+EIZ88PR4jvtzMcM
	uuAiAQ7f/VmKLwRAy0E/R3Zu05YY40JeefrAlv1cU+MJSC1K5s9iNlhUyJTxSVDJDH7k/T/SaUL1l
	1BnJJ5pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtuJL-0000000F0Lj-2k1v;
	Tue, 11 Aug 2026 21:47:03 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtuJJ-0000000F0LM-0t1S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 21:47:02 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-495773ee3edso317345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786484819; x=1787089619; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TgndDYlcvXxrotByazHMiHza1kewS9hYlmxpzQFlVp0=;
        b=lCCoXItAM6CL3afCG7GE31mg4WyynXzr1CRysRdJByI0XYjeTAD+JI3V+AXeJg60Uf
         4weLzpd+SBUi+Mn0qpWXvZ/bO4bTi1+Mlm3fyR7i7DmKxIgAQjuLMGHeO2l1wHBQNfST
         L0iDkq+/om4c6J9vgqyEu9N6izhQWQ4PGLihipQ1ZpmB5lVKP+vbD5oBbPGz4gZ2vGyJ
         Ffms7oebs4JlE0LMkw2+gyFVzv9ByuvM2VuyaQXTPWdRYrlc3M10tSSAJE4aNf7TFsQs
         4ldNjYtcVlOlFjuFqxzf/yvLMwG6KQ56xc0BrovP0IMO6i9NIv6jcdT6pM5drFQaT7ko
         R1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484819; x=1787089619;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TgndDYlcvXxrotByazHMiHza1kewS9hYlmxpzQFlVp0=;
        b=k7/FBHZRClKh8rghnyylcefivNG2c3rUxSzEW9DUvHmphukIbpzVFwcpMVknmVrxAw
         PqhcVDbIyvsP+6ZrM9aD1I/jYOIsvj+PxOeBF1URQFy6y9uHVDClXecl4NHvjGCr1x6Y
         iTcHp+zR5r8oE35TTBGj06Wxw08YO2bsc2R73VULUWf5caJsktRoswMebxoKlGSbmtKL
         WWClBGZFAHQwNBw/tzvubYItpOAuCfDFlsJYzQAoIbKgJDxdFbpkJ9czERQTl4zs/Lr1
         KO/OHSkv+2VjNoMOhC17ZAaWZ4FRf4VnN6dHWfijJhu3DsLsMxsyTZaaXV00HWwkzepQ
         8Xog==
X-Forwarded-Encrypted: i=1; AHgh+RrV7yJmsR0/oG1gidVcqqZYHI8ZDTj58WlVflYebV+c8enm6sxxdUM3D58INhXHz8p66TBzhaPnItafhu5uC0hD@lists.infradead.org
X-Gm-Message-State: AOJu0YwmNX2/Qsz71QgmeLtedHMmu7LsI9Q3Ja8pv14xuFM960xLFK0K
	0bW8bXJ9pb8vcVFWsjAsutx0uR69gph+6+8yL3a034HYialrY1/iGmbD
X-Gm-Gg: AR+sD13VG1+HVe68HTcYUekuNFDDXEO9xXSQiHizrNQVj/pZLPwgA7hbLlWsZv1BXVR
	u5W7nmU/mdqvKdyfAVFHp7inxmZge1PGQEDoIAVY/YJyeZs+Tg0sF8RCo3xILWHAlvlxR0ul0id
	t++QDORgLVnAYRLQzABeVWMr4sAmhEbucjLD6gygcAgIWrCaVv5fHDpBwi6DKu6G6YIqDLzmR4+
	95F2wVub51I08Hmys2xJBtL1tmMPcVy3QmGQ2YJyYdZT8jnPG5ujBSePRollPNWVcKHamSPHNXL
	u12EoTcmbhaWacJpibxj4+RMkTu2RCW8L2eMF+7MzI3xMZ2g+qcrL4ObgqIGr9x83EVbZtvca1E
	rrCKv30Fhpu5Mx1EJoJta7scEOI1THUYUW+BKDPZv0IxzzHXvX5T2sIWew11fN3wm7gvTdDisaO
	pKNzTFSNlMWoOOg5vOhww2cCQtb5h/RsWiYfP8DihdklDatwaL
X-Received: by 2002:a05:600c:3b8e:b0:495:4126:1e55 with SMTP id 5b1f17b1804b1-4997c11024emr1666045e9.2.1786484818882;
        Tue, 11 Aug 2026 14:46:58 -0700 (PDT)
Received: from skbuf ([86.127.220.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997abebacfsm16561195e9.10.2026.08.11.14.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:46:57 -0700 (PDT)
Date: Wed, 12 Aug 2026 00:46:54 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>, netdev@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 RFC 2/2] ARM: dts: BCM5301X: change Luxul XWR-3150 CPU
 port from 5 do 8
Message-ID: <20260811214654.v7elo6smkknsyax4@skbuf>
References: <20260811193658.14304-1-zajec5@gmail.com>
 <20260811193658.14304-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260811193658.14304-2-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_144701_303987_84E439CE 
X-CRM114-Status: GOOD (  29.99  )
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

On Tue, Aug 11, 2026 at 09:36:58PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Northstar devices have 3 CPU ports (each connected to a different
> Ethernet interface). This design was meant for dual IMP setups when
> WAN traffic goes to port 5 and LAN traffic goes to port 8.
> 
> For practical reasons we label only one of those ports as "cpu" (the
> rest remains disabled). It's because of Linux behaviour (and it's
> probably a bad thing since DT shouldn't "care" that that).

Did you see ds->ops->preferred_default_local_cpu_port()? You can define
all CPU ports in the device tree as such, and let the driver select
among them.

> So far the choice of "cpu" port was based on how vendor decided to setup
> given device originally: which of three Ethernet interfaces got MAC
> assigned and which port was used by vendor original firmware.
> 
> Most vendors decided to use CPU port 5 & relevant Ethernet interface.
> The problem is that only switch port 8 provides full functionality.
> 
> Change the choice of "cpu" port to 8 and make the third Ethernet
> interface (connected to port 8) use MAC designed for the first Ethernet
> interface (connected to port 5). This makes Linux use switch in a
> feature full way.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> This seems to be a slight abuse of DT. Instead of describing hardware we
> make it steer Linux into using a more appropriate switch port. This
> isn't strictly a setback on its own. It's a change from one choice to
> another.
> 
> I'm not sure about that MAC however. We say that the third Ethernet
> interface should use MAC that was designed for the first one.

So the NVMEM is not provisioned for multiple MAC addresses for gmac0 and
gmac2? Can they ever be used simultaneously? Even so, I'm not sure
whether that would cause any problems (depending on whether the switch
supports address learning on IMP ports, it might not). Do you have a
specific concern?

> Is all of that acceptable?
> 
>  .../arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
> index 8e487f60a2cc..7969f0f331b5 100644
> --- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
> @@ -81,6 +81,11 @@ &gmac0 {
>  	nvmem-cell-names = "mac-address";
>  };
>  
> +&gmac2 {
> +	nvmem-cells = <&et0macaddr 0>;
> +	nvmem-cell-names = "mac-address";
> +};
> +
>  &pcie_bridge0 {
>  	wifi@0,0 {
>  		compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
> @@ -136,7 +141,7 @@ port@4 {
>  		};
>  
>  		port@5 {
> -			label = "cpu";

label = "cpu" doesn't really do anything and just confuses things.
Labels are only defined for user ports. Please remove this property as a
follow-up (or preparatory) change.

> +			status = "disabled";
>  		};
>  
>  		port@7 {
> @@ -144,7 +149,7 @@ port@7 {
>  		};
>  
>  		port@8 {
> -			status = "disabled";
> +			label = "cpu";
>  		};
>  	};
>  };
> -- 
> 2.51.0
> 

