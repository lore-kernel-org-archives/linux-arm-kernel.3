Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137C5ECD994
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 17:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xG9GlTsOUqrpT1eW0/Cm5JB4EuHVIQb7eAFjTP9/Ne0=; b=sdfdJsi9cJ6J/+i6OFJAC/+CYN
	WiwiTFWekTu4QM2+sTO9ObxHsRRbrThkpBwbnE8Fsfw9McDuD+XSaW8bOOy1zjP561k0yPqUsTyfQ
	AEb397X9nLKHgxVKvZcw6eJZ9vNBCPHPc8SHN19eI7cIYerw4FMozMmSo0E40lp6tkFs65KRNmLys
	zR6UmSt8k3X/vw9V3zdAyz9Em1S85q4/eSRi2HN3+etuiZBw5usCxyndfDw3Pu97hPZlj5IOv94DM
	SLVqyn+TW8PEmRmz5mM27rK556bKMKJfjBcOCWhH/QT+UKT8EzQ5DkNnOsugPUNDsMvr/My27nyeJ
	f2SUY/Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3bq-0000000AKiB-4B7H;
	Thu, 05 Feb 2026 17:57:42 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3bo-0000000AKhB-2gg8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 17:57:41 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so12180755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 09:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770314257; x=1770919057; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xG9GlTsOUqrpT1eW0/Cm5JB4EuHVIQb7eAFjTP9/Ne0=;
        b=KmHLWP66KUkQJ07gR4ptPepQQpg2p5odssNo8ys+USLh7k0aLtPaiQdAel+SqqD1mN
         CaZGfJUCDpKP9z8jZw5ud83ud9hI9c2WkF3xz/UpSVxPqBeK4lGEI/PPbPFXt96kytWk
         E2asjB5ZNlrpRjMFICk7djwzI0wOyh0Hh9d9WsQ6FV2nSxMeGeo2TFjT0Neo5ywZNtBg
         9bsi3Z5yXBJelgsv5ZiwjmqzrwitE8a1R862bWieJxXjfV6+34ejnzl4VexXD6JJujXz
         gvubwV0XR8Kt6TZDKqpfEuOYb85gKb+665L9y0MDuz8L+cE/9balyy5wR2ZgsB7zgdez
         +IOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770314257; x=1770919057;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xG9GlTsOUqrpT1eW0/Cm5JB4EuHVIQb7eAFjTP9/Ne0=;
        b=wp1xsjV0Me3Oe6Lq+wl/CwgzclS1gJvMyTrmAB8TqE1ithhVvYL1VEGTyCkEEJ8bgJ
         CJ2to0OlVEmH7U2z+P0boDWgJOp4In0jvPjE8Hih4sDtr+6QLC1sYvAmDVr4hzTNwXYm
         FlVsWBKyapeulb9+cyi0svW2trOFt4C8omdZGJQrkEvmOcYED5mHJQ+jcSKcdJjAiUih
         WC0a/koIzX4+Jq5s9aPNBi4m+e7GzPqVrzN3vxyVofIqEhAbOllRVPZ+KNvGHgtnf60Q
         6k7JSghpxgBfUq7T1u71CyJX3Anzc44GnzcEzUAYI132oQag/jkHnpo2gwuSWBQ0Q+Mw
         wXkg==
X-Forwarded-Encrypted: i=1; AJvYcCU7i1j1cV+/mA4o6LN3IlsJmQF6t4ZIY7RmIED+lCBY7Z11gHY5dj243i0qkXMvaV/tWjs72eKjajzX8pX53H7S@lists.infradead.org
X-Gm-Message-State: AOJu0YxglJtpqglMjZCaN+NDZ7bvSQ/A44MFLWagV56pdU7rtdYmQNTx
	COCcm09lN31Mw8P4Z5aYDX51RP3/RQzkfPTWGL8ft8EQIZl476Vf3Oh7
X-Gm-Gg: AZuq6aLCzehJU+64m/mPnd0pTDjumVhnJHM+eRotS6nMwD7v9+VDxfS3xHsl5Un6Iis
	D8slQ3fRaLmR+4KecMPg1bqSIAJo7s+cMQEfGBfhPdf3J8DRdBEXxlJIZ3yXklMnZn9Tm9ibkye
	qj/sHTz+2woht/+3fMwLkmgof3ubDs5H9VJbYYXRT3vRM46U35Yi+TC7UUEdNiXptvvTjzTSF3R
	Iogv53hes1ODay2Uj2YQe+tWxK/PJdu58+oAy2euuckV8WI0WPrsZf+rirMwJEOorc5AtCOuyP3
	vGjvQ3MV2OvfMqlKD5baw9/l4AeNizMQ2as0CI9NhfPk7uX92u9xtV0/kdt1DkDlqh1J95vgyPV
	ttmdCy4eTajTQtJL41yPEe0YYmwc6StV3X90PleFsbk6W/n1QUo1onI4faNYatupEh4wKocN/NE
	SbZZeAPOrNg/ko/5+Zn3JvGR5fr/3E1QLloyOkEMzQ6S24Vr8gTJ+KxckWsPI5hH9r62A=
X-Received: by 2002:a05:600c:ad7:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-483178e303emr35887875e9.1.1770314256958;
        Thu, 05 Feb 2026 09:57:36 -0800 (PST)
Received: from giga-mm.home (12.89.194.178.dynamic.cust.swisscom.net. [178.194.89.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d345c2sm94337185e9.6.2026.02.05.09.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:57:36 -0800 (PST)
Message-ID: <abb8fa81c3fc7caec0b232e204af4bce71a7a667.camel@gmail.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt
 Trigger
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Judith Mendez <jm@ti.com>, Francesco Dolcini <francesco@dolcini.it>, 
 Vitor Soares <ivitro@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, Vishal Mahaveer	
 <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, Dhruva Gole
 <d-gole@ti.com>,  Sebin Francis <sebin.francis@ti.com>, Kendall Willis
 <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra	 <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	alexander.sverdlin@siemens.com
Date: Thu, 05 Feb 2026 18:57:28 +0100
In-Reply-To: <fcfcd3fb-2eac-4865-98f3-ef2ae24381bb@ti.com>
References: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
	 <c47697b4-6ebb-4af9-be96-c964d990835d@ti.com>
	 <DFO764ES0FNP.1SUQK9R0EUUDQ@baylibre.com>
	 <1a91fd40-e814-4b4c-8914-d8f0c4768e07@ti.com>
	 <DG59D7WGM35A.1WNIIMNCQ8U3C@baylibre.com>
	 <7ae7f6a1-0ee1-4d56-b1d0-f038a7d22b4c@ti.com>
	 <20260205072439.GA4548@francesco-nb>
	 <fcfcd3fb-2eac-4865-98f3-ef2ae24381bb@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_095740_949508_2F07BAA1 
X-CRM114-Status: UNSURE (   8.96  )
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

Hi Judith,

On Thu, 2026-02-05 at 11:07 -0600, Judith Mendez wrote:
> > Verdin is now booting fine. The boot failure was related to other U-Boo=
t
> > bugs (as Nishanth mentioned) that are now fixed.
>=20
> Good to know, that isolates the issue to only one board.

not really, as I mentioned, I had observed some issues with one of our
internal development boards, but I can only provide the data after couple o=
f
weeks, after my vacation.

--=20
Alexander Sverdlin.

