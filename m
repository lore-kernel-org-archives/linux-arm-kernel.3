Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E567D46C0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 22:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnUDiJDYQRPq0HtYELggvMNOjTwVFLClGtpo/kjL3E8=; b=hIWs+SXUel0BEzScr9EyHG4L+D
	gpkl7yJgj6lZL33VcaZx1/sdnnRbh0+XiQAsiiBGNmnVSfGuXJz7qb1lBro6Th+RPGraZ6Qr4Fj4K
	RRCLLS0XtFnoJRMBCfLW5t2Gpi0RPqCDzG2gbaoIuR9MElqzEeEGI0KfyNDZTlJxqWJBGQngU3GJD
	31hJR3z1CqS53T3hNb3gm49wZ+kyu4zIUmqD3a8VJXi6+rRoanI2hUnAWISnRzva1IfScfZDeNvJh
	mmV6bDIpHvUBlGl/kdnuQALtw09WhZJuLtfJqMT9y9TOVbPPIbrVSrRQUgXdCxvb6Dt5rANDu7i9T
	6LOKuOMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlE7S-0000000GtMi-10ix;
	Wed, 28 Jan 2026 22:34:38 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlE7P-0000000GtLW-1MBe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 22:34:36 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4359a16a400so305911f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 14:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769639673; x=1770244473; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mnUDiJDYQRPq0HtYELggvMNOjTwVFLClGtpo/kjL3E8=;
        b=spmTnx9xcnlcUveT10bRREz0E/H4FgFvyakLcAh8sDbkLs04hmrMGW2g0y38oXU+Qw
         2H8/uUqMxPQfMFxba3sz7hQvTEcRXb3Ov65+YPNnU2rtLVHugSiMpT4A81kquAbZtjEN
         P+e5riG+mc5cDxx+KIy1hNPxPnahNRvchVWmnrlhaby//3z+7WfsukrnnNRGPsZPXl6h
         DWUnB70I+nsdzsUu1/k5KcqoRZ3LSUfEIVIHYBbmYjzc6JZi6bjdeIhAqARGiA+pdzP0
         Pfgc7fPpztgaU0pE5yLG3DZHbKzTvAad7/G8rN2N89l7Q+c9nefzQiKysa5GLmvp4wso
         vGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769639673; x=1770244473;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mnUDiJDYQRPq0HtYELggvMNOjTwVFLClGtpo/kjL3E8=;
        b=jpJiS7KrnVYXVC94KTQBxbttoMEp+Qq5a8gs5Sakwfvv7LBTqEPItMQ7UJVFqooTWP
         rJwM4G7LpL7/N8PGlMLSgQGyh8a0kPIhrwj5mWc/Pm6ciRtxDSViIVkm9yz9x3AFFCgm
         wUpU3ZCk3jAEIMlSXRr8wjvcwZkBo8KM7g1oHc3rjIQyvRc2gIOAJMKn0vUYk6NlTMlQ
         uT+GksrdquOe9BkpPqwCouGrRPVB31yXNJbdv+tvs1ISQ0ajRRqE8LeWcTXvZxjZ4k0L
         A2HnuRmITcx8czrcXiiDGB/zvq42s22Pbn3PiTJbNv8UQkfb011VYSqa1K9ihfjUkGJh
         ELvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX82VJnCCu8tIi8iQhqAmXdmd/jlS4JPjpRQEQFiS0yMhvYSz/XEftWMfyyv2qI8S+P/01nRoSYugmm0T/iCICQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxIk84Y/C+KfI36MtVHvizDLk8XLx9JAHZOebwrySnLxeiTTacg
	PEWiCkuKt1D3GW3va38/pBl9zYR6xeddH42EKkY0EK+otVbaDlLZ7Cz6GvyGKM9lWLc=
X-Gm-Gg: AZuq6aIur0cw6cBVq9kEwjTYy5ihkEKVBE2AOQyG38kU3DFaHhbgLN6k8lmPgm3QJYr
	tdfuHCBNVCKElvqbOlWdtl3AIug3aUEUOhO8VhWm0L6g4exxzxtGNroQRZTMllT/B4JnycWCFK5
	xhWEAxh5wa47VpjZbrLEBjRvUPd4MQU/xj2uuBzW5cmDugALJyxJTzAKbdoGJgPen++JuEe5lup
	SS8rI8D9YWHJEvRT/4Luv+NOkneVgkTfYWrfwE/m5jGkOg3Z7sRJAU9+1HUtTpMLvmfftEBaRMS
	9N0i8J1Ulre4MGJBfv++5tHpY8knYt19XvMJa5OMWHAtqHYoqSE1vfhfFpnGc1ZjngxP5AcjHB1
	4MeA6du6/lguU7lrA4Zvodgr1nkvXyjWincaA7XNuMrSvN9L8Hjqtjs4mN2Si9WjP/whqMjwAHh
	P7Adl5ptiCDNvJ+FSnPvQZp8l8E3gHHQ1wFg==
X-Received: by 2002:a05:6000:186e:b0:430:f40f:61ba with SMTP id ffacd0b85a97d-435dd1c0df0mr10119608f8f.41.1769639673349;
        Wed, 28 Jan 2026 14:34:33 -0800 (PST)
Received: from [192.168.235.30] ([212.129.85.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cfc9sm9819343f8f.21.2026.01.28.14.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 14:34:33 -0800 (PST)
Message-ID: <9936b5bd5f1e19f65c199d36ce54bb0af0e44b85.camel@linaro.org>
Subject: Re: [PATCH next v2] phy: google: fix build dependency for Google
 Tensor USB PHY
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Roy Luo <royluo@google.com>, Vinod Koul <vkoul@kernel.org>, Neil
 Armstrong	 <neil.armstrong@linaro.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Joy
 Chakraborty <joychakr@google.com>, Naveen Kumar	 <mnkumar@google.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel test robot
	 <lkp@intel.com>
Date: Wed, 28 Jan 2026 22:34:31 +0000
In-Reply-To: <20260128-next-v2-1-624bdae8e6d0@google.com>
References: <20260128-next-v2-1-624bdae8e6d0@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_143435_445922_F73C0172 
X-CRM114-Status: GOOD (  14.00  )
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

On Wed, 2026-01-28 at 21:22 +0000, Roy Luo wrote:
> The Google Tensor USB PHY driver uses the Type-C switch framework to
> handle orientation changes. However, the Kconfig did not specify a
> dependency on the TYPEC framework, leading to undefined reference
> errors when building for architectures or configurations where
> CONFIG_TYPEC is configured as a module while CONFIG_PHY_GOOGLE_USB
> is configured as built-in.
>=20
> Add 'depends on TYPEC' to the PHY_GOOGLE_USB entry to ensure all
> required symbols are available during linking, and 'COMPILE_TEST'
> to expand test coverage.
>=20
> Fixes: cbce66669c82 ("phy: Add Google Tensor SoC USB PHY driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601210825.ELrpQeED-lkp@i=
ntel.com/
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
> Changes in v2:
> - Add '(TYPEC=3Dn && COMPILE_TEST)' to build dependency to expand test
> =C2=A0 coverage as suggested by Andr=C3=A9 Draszik <andre.draszik@linaro.=
org>
> - Keep Peter's Reviewed-by tag because the change suggested by Andr=C3=A9
> =C2=A0 is a trivial improvement.
> - Link to v1: https://lore.kernel.org/r/20260121-next-v1-1-c18068b091b9@g=
oogle.com
> ---
> =C2=A0drivers/phy/Kconfig | 1 +
> =C2=A01 file changed, 1 insertion(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

