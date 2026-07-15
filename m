Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD52C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hz7WPKd8nuv0g834JzI7w/vUzS6TIu2DOFmMdBw0Pc=; b=lzSmzwfqiuS0ww/RjkzC9oLyX/
	q9KSqoc9OCU/M6rkAb5A78nzWYdzVNoyT63HaoOgIiKAiJx05BWHLgdOQDDT6Lg8szeJeFK8Xn+OS
	wyhXqyYiDRwP1kiLaOM0g4SAjqiht6nOV7m/51u03eFYenBkX10540PBxww+wmd0KRCz0vYt/uO11
	+ViiVGdGaU/CvxBgxh1EuJA3hqh/yR6RWesBb2JnnSposyd2br8Mn9YyXJV5Zz59n22qK4s6Ah7hl
	o+OWyll3jgsRTAjUKs6wp7N4R7thaAjIR0A7Iq47DL1cED1ZXazp4+tF1vRvk1YyFyzoI9bcC/lwZ
	gYq3RU0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvEQ-0000000EBkP-45mN;
	Wed, 15 Jul 2026 08:44:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvEM-0000000EBip-3FMD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:44:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so27828835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784105076; x=1784709876; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hz7WPKd8nuv0g834JzI7w/vUzS6TIu2DOFmMdBw0Pc=;
        b=IHeGtjFgKxM6wKVJvCWg7Ty4ehybxlanCY0XsAEbxoyAyiejUhZiJCEUdutd85Dvkr
         QiOgSrfXHBOKturb3CWS90kY3PcHs0tPx9+Tkf/SVb5FAsYYYDR6Ay9Gh0DkcXRDa9jk
         sf0Nf8uoKvZf5hqvzMAw6duNkzdUVLykDfAPM4iYpoJ0f4GnR67PnQFvKRjEhNHSvki+
         UIrrVKj8Hx1PpZtp9u/YxDNA+JsFjL4H+I4zhTfiRtiK9qPYvpZSYQfkWOtye32ZH4eD
         l6FBmnq4JQR2h1Zfbv2owEnD9RtKPz5O35l60Cf54YVXl+rbtd/CRYJSOOV/bcgnBe6h
         js+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105076; x=1784709876;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hz7WPKd8nuv0g834JzI7w/vUzS6TIu2DOFmMdBw0Pc=;
        b=eXPxHerZps02WlRGaivfnwy9Bl8oZQpX6KirG1NKAQybp1JVUcU7/zC5VMLfwa6BMN
         /xI6oVRIkoxTfS92CozXJVXMovslNAj0dFhHM7WNXHC8UBK9zUdGS/BVawGPC5a4W6KW
         9jeBSKzObaNjqMtG/sNLoDRw/AqWSUILF6nUlOsgow96EpJVo4Rl6ra9ZNJT6xRnlaA9
         I5WZ22Ir/QAX2Tw3+przYDutIPKBwX7K7z3+/DAwfK89gZpT8QhSK/cV/JKXYTui+0PA
         b9kV8FL1OZwtwnq+wXqjF2ukOupMybGepxiOTR/P356th6SSYcZZuhRMFwbwunvjUG3r
         o27Q==
X-Forwarded-Encrypted: i=1; AHgh+RpJ91IAWsem/hWKsShuIztD+5xbwSjYrtRRwibfP2FjjZRIqDc87k8syfvoXjQNsmKh71eKpkt0kDqOv2cufSwt@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4HA1G/NqVMkj3KzzVw7XSt/Pq9vthbB2VcesVjio3qK9BWsxV
	HLvU9PwKjIQp2Ap5zqHMjr9KZnWtj1MxN5fBJVoL8p9LjkGJcGH0KBPE
X-Gm-Gg: AfdE7ckzXDE2UWouef8Onmx9IYOiK+nYgb0hmR9OjKkpCBik8vD5XrrsWg0a71iHo1k
	9Nl6v8s6VN8VQnbPx+E/j4i8dENxjFjBEfWEwRD8VoWyXhNIxyOiVi9prshzX/f00peoXZT3A29
	NBV80A9RvPSqpuZsQcMITn8RGJV0xyE6cA1eNBgIfK+/Sr3BHxiE1u2uuFqgxHLuDqpbU+5Za5p
	bP4WCzSm4iLBSuCJRUPIWWn4eEV/5h1fzbgpycD3rfdxAg6Z6pg/wa1+l7c+Y9DAqyxYIsyxMTu
	EGPoLpRxQUcjy7Xq0nwThhTDLMNN9u4oxRx9UBlFY5SgsI95JeWr+DiVyeBRk7LMkADKzn5A6sX
	e5nCVBd4xiQOxEo1dn+gf/CDTlFxOuynzF+xQypH62MP7opF1/RnGphi2n9QZeKPqebTaXWqlYe
	xwgZsWhZM/lxp4DzeSgIdwmlZAIDrrgBaoolas04ipwBkz
X-Received: by 2002:a7b:c38b:0:b0:493:c4e1:40a6 with SMTP id 5b1f17b1804b1-4953c28b6bdmr14477935e9.32.1784105076212;
        Wed, 15 Jul 2026 01:44:36 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-89-239.ip49.fastwebnet.it. [93.34.89.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953f643acdsm3214055e9.3.2026.07.15.01.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:44:35 -0700 (PDT)
Message-ID: <6a574873.3027643f.39eab0.b4c0@mx.google.com>
X-Google-Original-Message-ID: <aldIcfPxkeociXyX@Ansuel-XPS.>
Date: Wed, 15 Jul 2026 10:44:33 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Coia Prant <coiaprant@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, kuba@kernel.org,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, robh@kernel.org, krzk+dt@kernel.org,
	heiko@sntech.de, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH 01/10] net: stmmac: move XPCS lifetime management to
 platform drivers
References: <20260714191341.690906-1-coiaprant@gmail.com>
 <20260714191341.690906-2-coiaprant@gmail.com>
 <dc21b2fc-ae11-4fde-a5b9-09e2c6bee5c9@bootlin.com>
 <CALj3r0gWyfHHp0S4=71M1-TjgHKcgGax4Lr0DzPi37Q69-iCwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALj3r0gWyfHHp0S4=71M1-TjgHKcgGax4Lr0DzPi37Q69-iCwA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_014438_940926_6CCCC74B 
X-CRM114-Status: GOOD (  32.89  )
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

On Wed, Jul 15, 2026 at 04:17:50PM +0800, Coia Prant wrote:
> Maxime Chevallier <maxime.chevallier@bootlin.com> 于2026年7月15日周三 15:31写道：
> >
> > Hi,
> >
> > +Christian
> >
> > On 7/14/26 21:08, Coia Prant wrote:
> > > The current XPCS creation logic in stmmac_pcs_setup() is problematic
> > > for several reasons.
> > >
> > > First, if a device tree specifies a "pcs-handle" but no select_pcs()
> > > callback is provided by the platform driver, the created XPCS is never
> > > used. The phylink framework requires select_pcs() to actually return
> > > the PCS to the core, so the pcs-handle property becomes effectively
> > > useless without the matching callback. This is confusing for developers
> > > who expect that specifying a pcs-handle in their device tree should be
> > > sufficient to enable the PCS.
> >
> > I think Christian's work on fwnode PCS would help a lot with that PCS
> > handling in stmmac:
> >
> > https://lore.kernel.org/netdev/20260618125752.1223-1-ansuelsmth@gmail.com/
> >
> > I don't know when Christian plans to iterate, it could be worth using
> > that new fwnode mechanism here ?
> >
> > Maxime
> 
> Hi Maxime,
> 
> Thanks for pointing me to Christian's work. This looks like a
> much-needed improvement.
> 
> I actually spent all night debugging call traces caused by the current
> stmmac PCS lifetime management, and it was not a pleasant experience.
> The code feels like accumulated technical debt that should be cleaned
> up.
>

Yes we also got a similar situation with an ipq50xx SoC where the
standalone PCS feature was implemented (I can add reference to OpenWrt
code) and we also had some ""magic"" code to implement PCS as it does use
the DWMAC plat. It seems for DWMAC PCS is very abstracted and have at least
3 different implementation aside from the common "select_pcs" one.
 
> Regarding timeline: since Christian's series is still in RFC with an
> uncertain merge date, I'd prefer to keep this series as-is for now, as
> it solves the problem for Rockchip and has already started receiving
> review feedback. Once Christian's fwnode PCS work lands in net-next,
> I'm happy to rebase and convert the Rockchip glue driver to the new
> interface.

The series in RFC just because i posted while net-next was closed but it's
not in RFC state. (sashiko is starting to hallucinate problems) I plan to
post v10 today but still low review aside from ""lovely"" bot.

> 
> One thing I'd really like to see: the ability to specify the logical
> MII port instance via something like:
> 
>     pcs-handle = <&pcs MII_PortX>;
> 
> That would make the DT binding much cleaner and more flexible for
> multi-port configurations.

That is exactly one of the main feature of this new implementation as is
already used downstream by Airoha SoC where a PCIe PCS expose 2 PCS from a
single provider. (the code use the simple consumer/provider pattern and the
driver have complete freedom of applying whatever logic is needed when
returning the correct cell)

I think the idea of Maxime is to test that series on most Scenario as
possible to verify for fragility or regression on it.

(but just for Maxime the feature is getting actively used on OpenWrt by 3
different SoC and no complain for now)

-- 
	Ansuel

