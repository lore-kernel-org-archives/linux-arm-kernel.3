Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA39CE7AAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 10:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLugjK/2aOcd1kANbuWrprVoDL7qwO58M/oqiXvPZ6s=; b=v3T2ZoSCNUDSJVvL2cKzu8MyeQ
	O3BcSM8STnrWf1oZcgiUsl4OhpXUztV7aCu7iggEwF5WNw8Hnh/JGniFQ+BHs82GkIWXarON7ZdHU
	mo0zl42EArBxk3mVTRepYfI0sMNFRvItsHg94i8+iZs56CTaWfToPZGw7NCKy+O2xIACDpSzNU1//
	NkWsAITZIJjTENJ/dNTpxB1rJz8VS2PSndem23uY6F1t8kym5a002UlNhZrDA/4X9vCbEbVi1fF+a
	NJyUaC1G9RhFjaOiT94HJhgMJnLidFMNF6+BSkleoktl0AIS/en1OHh4YB0yjkQPYV5nwxTlJz89P
	D5mXTRgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqzf-0000000C0lP-0bpg;
	Fri, 14 Nov 2025 10:25:27 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqzd-0000000C0kz-1J9I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 10:25:26 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5942bac322dso1657485e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 02:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763115923; x=1763720723; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLugjK/2aOcd1kANbuWrprVoDL7qwO58M/oqiXvPZ6s=;
        b=Oux3S2nB88UMHIfAtRXu/75pNSOj9IqUekpgtV/+uBqd40nBK1b6UbxgBIa3JHguPg
         hnbPi5nBPnyV1hfgVYPw3xLE+cy5AphNXiM6rOYnDOMrvzr7+GR/xH72nGquUi/HaFBH
         vGocMzCeJrD6DuZaverZlf/Pv/WjAm6GUJNHekyFPYqS7DNb0LUD2vKzKaIMbVxkAmTX
         LPa8ZGufdKnP5ldtzB+lpw/j1KlU68N8irjOtpo1qgqTkRvccXElwWIu/0d5fBZ7GsQc
         ln7KJxUAi4fFuC2g4mcMVIAfFfrDyPLSMj7cgxsPiEnM8ZafGwJVa/1A9uj5Bat+zn8U
         kbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763115923; x=1763720723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MLugjK/2aOcd1kANbuWrprVoDL7qwO58M/oqiXvPZ6s=;
        b=I2RyxjfYihVysOZkcCAxRjhHHZg+fHKdbjHpMsDUBdYbVgxI7JXlU8WM67oTGcu+U/
         Pky9yX2Z9pNA2e+6viyFAQgjv6mVvBiFZkrPoSM67yw1JmYlLDQ03NPhhrg423aLH89X
         +ErqsF8zoTX8+XXSyHN3ElOZ3pl4TJ1PAoaheRqJ3ocxeMQ2VOag2eeYz6R2HBqEtJVQ
         q2d+l84MnN21qeVslB8OV7WrH87SjVT46K+Dw/v02orNA0cRckpGRHoCMhJHg4L95rUb
         GU24OXE2TwnMmIHndbnzJzLraH4AV0ZeZuJyMBaEME5CAX1CUeI/tMop6vgRDPpgsXLJ
         LXfA==
X-Forwarded-Encrypted: i=1; AJvYcCUyoey54P6yzI28kyVFKuxQC0IWgfAVpzyzMTMeirb/gKvOP3Zpj5hUEjAJA+aaYEltmr5QLZCLNU/Htn5FPeT9@lists.infradead.org
X-Gm-Message-State: AOJu0YwrHX5TWkrjbtyKX3KO4Y6St3OBKHsHHouV7oAtk6uQWLG8ho2C
	Uj8X+Q3zvcDc8uQhujbhF06+j5NrLeL6iRwqyZlxn23MpNc3THtHsEIkUoa41KE0wxS7tvwYmQD
	rSFNq4J+pNFnwDzQc0gNY9A/6bzqioZFBC7zQ0AVRVA==
X-Gm-Gg: ASbGncscr29fDlEAeNk+mlBIlo8cL5WGj9rran32WbQQ90amIgRMtBwrj7pbtD2oHn4
	ziRqBc27D9XspcZAo2/CxN8kjH3A0YEx/CnhVCC6I6jYA7rOVtZXzhjomSmvU7qrlif6Kovjh67
	X7VqpK3zZxp2APt5sZWr4/UmMCn44hQfrGhesubcjIshpmrVriWyqSDfAbjuK12T6ra4o/tdxN2
	xGJ6JbqlmMQ+EiluHeLuoWHZW8AO4H+1w7wFowFT5nVesLFoqOtJKCMPF9tonGqO5LHZlhsqEgH
	XjDm/tUF5CYHPGbtnw==
X-Google-Smtp-Source: AGHT+IG+vHnX/GfGDbOGf0qwI/P2NyNv9/lpky/1SJrhvTbXCs4bIpOoG9/nKcapAHhdcVGWWGxHXbG83qZQSmMMZIc=
X-Received: by 2002:a05:6512:10c8:b0:593:f74:90c8 with SMTP id
 2adb3069b0e04-595841feb2amr831443e87.35.1763115922730; Fri, 14 Nov 2025
 02:25:22 -0800 (PST)
MIME-Version: 1.0
References: <20251106163758.340886-1-marco.crivellari@suse.com> <aRcCzMZTcO_GXvfg@gondor.apana.org.au>
In-Reply-To: <aRcCzMZTcO_GXvfg@gondor.apana.org.au>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 14 Nov 2025 11:25:11 +0100
X-Gm-Features: AWmQ_bmo8lguOmNNoBm-dyARH6Q5UwSpuUqVJKaH5K0WfT987DZTdzJ2ZM7ZMaI
Message-ID: <CAAofZF4MqHDRRoLScMukxx8QefdSx1oeHyGiSB_ScL09XRqoLg@mail.gmail.com>
Subject: Re: [PATCH] crypto: atmel-i2c - add WQ_PERCPU to alloc_workqueue users
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, 
	"David S . Miller" <davem@davemloft.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_022525_359352_CA43A871 
X-CRM114-Status: UNSURE (   6.78  )
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

On Fri, Nov 14, 2025 at 11:22=E2=80=AFAM Herbert Xu <herbert@gondor.apana.o=
rg.au> wrote:
> [...]
> Patch applied.  Thanks.

Many thanks, also for cavium/nitrox and crypto qat.


--

Marco Crivellari

L3 Support Engineer, Technology & Product

