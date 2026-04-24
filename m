Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49BEFB44C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 07:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/sC3xbHX91SFc6+u2OW880xg51KottdLmNCvxxcEqc=; b=O/Hhx1VRFkBRQ/YOMzrRdvWj9p
	kJ3U8bmi8ceULBNHhH4DQ/ZAjnp5eijOzpYoHolpHcD5Ky4XDnBHc23On5VlKNKM74axdBZrSUm81
	HTPOW5p/IsaJtHwKPmz3fl1WApGhar1qpomg/MgUkdCZoTt+xyAmWx+urAQerfh8GIBRoSQFqHUhr
	5FDRH5Bn80E5yvhoFIvU1iD905SML0C5A15ynqZkTM9LwBFr/dfOFPzE6BNRAW2MM8ibpdIryK0aZ
	29o15taQQjv24Q4HnpT9KMWlm2PBH85DeUFwzkryZ5GCHxcwm1ok1h4bU26/Qv5+TY/qxMxA8M16J
	8w3yln5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAc3-0000000CloJ-3HPn;
	Fri, 24 Apr 2026 07:06:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAbw-0000000ClnX-08bz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 07:06:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94D4044559
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 07:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709D8C2BCB9
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 07:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777014359;
	bh=0/sC3xbHX91SFc6+u2OW880xg51KottdLmNCvxxcEqc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TW5KiS9Y784yt8KM1XFWshhpxYqEmWvwSwhluCtKApdksdpwJs9m+BVMNubJk0RSq
	 B8u06aG8Ph29If4I0Y16LPNb3gUFT9wiWi6xu9KAIpLEUHpA4vam9+Ql3xA1XplEfG
	 XAYVEPSsOZYg56JMdBvhWmvPEPGxgxic+VyBbOyROzxsj1RusWMSeRyzYCX5iQLR8+
	 Mw3yPZzX7u+eitAC3lxBtisahpOM/hWQhoLzZJkStwtJhr87C6CvZdBU+eXSRj2rYg
	 9reNDcNAr/1z/PGIXT+jvvhZbtPVTGYR5XhBrXvb38Vujn+SVn2hh77oFsakG6VY2Q
	 XpUV2mG6mSyqw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a3be187ffbso7996543e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 00:05:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ84XO6rG6ysfDCB8QkMSBtLaufHZ6AE/CW/cCiZioa5nlWgkKWgAHqVitY2Hj7yjaOLD6c4E4U4ecKYdCXtwVgU@lists.infradead.org
X-Gm-Message-State: AOJu0YyUMBLM5MNDv51cUweWzRpcBKM+ACrfMyfPhGHN35PC8cOAPhP6
	/Bq+nRtldOncl/kt/1bu2s0GoZMIrzEtm+ZA8/mSP7HmD1DM8Ifl95n2VXI99bI90LxUkGaQ7qt
	jzcYToSbGdqB2SOzWFR3gtYyweRnrLww=
X-Received: by 2002:a05:6512:3c8c:b0:5a2:b86b:56c2 with SMTP id
 2adb3069b0e04-5a4172a2e97mr10579597e87.21.1777014358009; Fri, 24 Apr 2026
 00:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260421-send-v5-0-ace038e63515@gmail.com> <20260421-send-v5-6-ace038e63515@gmail.com>
In-Reply-To: <20260421-send-v5-6-ace038e63515@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 09:05:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLmbWmj+tyefBm=sFGzxQMxY+H4h5TRUD7N7x=kL_ZdqEw@mail.gmail.com>
X-Gm-Features: AQROBzD_BbBKfIuVI61TLisBat5ysC5wN22oHTVtH8oB5cdnAJpZ64NHEl1Cquo
Message-ID: <CAD++jLmbWmj+tyefBm=sFGzxQMxY+H4h5TRUD7N7x=kL_ZdqEw@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] amba/serial: amba-pl011: Bring back zx29 UART support
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, soc@lists.linux.dev, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_000600_120773_124B71C9 
X-CRM114-Status: GOOD (  10.57  )
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

On Tue, Apr 21, 2026 at 10:24=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:

> This is based on code removed in commit 89d4f98ae90d ("ARM: remove zte
> zx platform"). I did not bring back the zx29-uart .compatible as the
> arm,primecell-periphid does the job.
>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

I like this.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

