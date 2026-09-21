Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D57C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scSu49n0yZs/NkIL79oefwB1Fce7usaOArd+rmA6NfU=; b=h+C2LLU2s+rLot56we5AhYbCSJ
	CPrCBMwd890kKB2+1tLJwEybwzKoYkB9utAQIyErWtxeLihAs4eye5b2M6/VWIie5QEGXurpD7/lE
	pIHraX6IEzXsyD9htX6IjXpynHsARUdd7i71C5/23lKGyNtLiMqRnIspccc650RkhzjhFKfjRx+0s
	Jt7YAGFgcYaGwg7IthmQyu955DAjwU3bKZFqvtX7YdXakUUpSDJRrfj7BHYFrwkRIceULXJ92Jpzv
	Mh2BOLbeaQmn1CbaTIoXztRkP8uEVhrzlG26Uy9t0FP8HnsBQqUsLLVV/R49qlbimALd9aDqkIUNg
	J5V6apCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fXK-00000002WqP-0JG5;
	Mon, 21 Sep 2026 15:02:30 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fXH-00000002WnR-418G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:02:29 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-8692a8568e9so2620305b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 08:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790002946; x=1790607746; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=scSu49n0yZs/NkIL79oefwB1Fce7usaOArd+rmA6NfU=;
        b=RKqV7jce6leXQOy2qpHGD61FpNA1PuQb/Bob//JXT6MPMvMz5WeDN7velV6uFb4FHH
         x6ZFjzMwi/U5M9P2vLB4EdlONGMINB3XPNZXSOadIAxZVcM6VRLixkLA9cLuNCU6hOM9
         GuT5FwB4nErP4mwTgqfgI13ntneyo864oAi+FVrXkZNU/0XTKf6pnMLAtKOt8pwTtnG0
         5TXxgnLpXV3hw0z6ISf4CxP5Himuk+8yL+205EuM4X43SUV496uoP1WEPpDnTkjOi3bP
         IcPgA99dz6sbxpLf8ivRHiE3VyNUJjhuAKK555Cugk4Zbx6GBn4kZax7ehUpcPmRy1nL
         A7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002946; x=1790607746;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scSu49n0yZs/NkIL79oefwB1Fce7usaOArd+rmA6NfU=;
        b=SHLfFGN5C0xte5fe9CD/Y7M2GeMovev1hPWv0+YPU9qYQqw2aaDnJl8O4Kk5OkyOzS
         DZTHQPXrrZ1jS0eZeGOMgYQxuAJFssYrEd7OvWcp7c5iGkVlQnx1IcbrR8S2kfIHtxLW
         cVs5lap//oU4pdlspA837BB9zR2qZeWXUzcPk9eSR9U/vlKyU3gR9DWo9imrwrhjbnUq
         ZtBnyvJ4eI18dmpdULiOhIwn4DiVd4wRAEQMLGJJk+0YH+6VocKm0eiPyzB3ojDMUh/L
         39lnd3fZFyQYt9hV9/q8njbTcX9opQEzhp1FHfIzWQZYlgcOHr7ZaRo8lNMOd1Gf8cUW
         dffw==
X-Forwarded-Encrypted: i=1; AKwUvBy6nR/KAnwjK2VuylTyhBAoL/+90HkmfEPgamcN9z9LwDvwtsvmzBSAp0OWxaLuBoSNIvsSXXwjC8a1Cukww++b@lists.infradead.org
X-Gm-Message-State: AFuF++kNSGmUm3SPmiJk385T8rljGAiGaRPcrfP+vZ41iA8O1HL0RfEA
	WWOqubyqvNbDHPJEVfH0B1C2wW5BU7LJR8+tsCrwu9JS3DEwTINkCVpO
X-Gm-Gg: AYBFou0/IHMzx1li/+jR276QIO0E4oBk8H/gw/WZUONzRkgU6rTinlgCb1QI2w3SFQf
	v+xca/ormL/s6OIuJaAqOou3aZBi72/fUOaFwdBaO4Jf5A3jVfrdszPBpCjeLqz5GrphnkBVvXB
	6uMZdnClej9WF4Tal/XFXZmL22+le6FBFh3u61Dh/p6NeQ5+DZL09FsqFuAw54USwf4GnVUzEzx
	tqXpfD1HqO6Uq2ed2N/22w1vIUJhEXOFuau+wZIwBNPp1CXpzfMNKUlxgAurapEMXerUpo6rHs6
	b6R37YfpcDd9Ji+nGhBpht5uO3p8euX+yFf/1arhqSXnC/0qK9NdOGLi99UFMdTJx/CMxgo+OT6
	xaFDSXXIzm1ybqA2TJgw/TvJgIjE1xLIqvog1iwUMSePZZrqxcAPh1BgQnr+1ARutPq8iPI0IpE
	ks6CQHB06De8RPgBiaMY/ua4K8Zgu260x3FocofBrg7f5RUXmG2HinzyeMnmNtTmCKt6S95fzZb
	E/O57NHRzLj
X-Received: by 2002:aa7:88d0:0:b0:878:3538:8f80 with SMTP id d2e1a72fcca58-87835389b2bmr7554907b3a.46.1790002946544;
        Mon, 21 Sep 2026 08:02:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a95eceb2sm3411465b3a.24.2026.09.21.08.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:02:26 -0700 (PDT)
Date: Mon, 21 Sep 2026 08:02:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: add Axiado AX3000 and AX3005
 PWM fan controller
Message-ID: <01278847-ebeb-45af-b520-765fa6ae3477@roeck-us.net>
References: <20260921-axiado-ax3000-pwm-fan-v3-0-3def8b6ffec9@axiado.com>
 <20260921-axiado-ax3000-pwm-fan-v3-1-3def8b6ffec9@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-axiado-ax3000-pwm-fan-v3-1-3def8b6ffec9@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_080228_020879_9E75EF98 
X-CRM114-Status: GOOD (  13.09  )
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

On Mon, Sep 21, 2026 at 12:23:55AM -0700, Petar Stepanovic wrote:
> Add a Devicetree binding for the PWM fan controller found on the
> Axiado AX3000 and AX3005 SoCs.
> 
> The controller measures fan speed using a hardware tachometer block.
> Fan speed is controlled through a PWM signal supplied by an external
> PWM controller.
> 
> Add a MAINTAINERS entry for the binding.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Applied.

Thanks,
Guenter

