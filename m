Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E88FEDB7CC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 09:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IyeaVeCxfhnKWP2l9xAwx/3zDkoSerhyFLbIvFQP+0Y=; b=rFX1GKR8xH3MOvJ7FIEE/Nw9Rn
	3KIUwuvMjbWLLLhm9f1+xf7ctBM60aiecVfPsL+ORCu38JDhXJ/5dlVs0tGFlc3ggvBrCan2rRS25
	ctzniMrOzUhUVmePJhCbcXwfdCX5bG6k1uvZ5s/KpNyTshcY9QbmhLao8kbK0i1Qlc3EQReq5aZf8
	gR6QUPz4cr0ZljjuY4vYefsBE5AgKzk5FD3GaATsUOqz+IQAJV+fFdoAHs2MhNzxq0l1TgBpqZZyP
	c8uwSgXerlatanpFGA27mdFAsa0BEU31beThsVdFLN894ew3u8toqGkb9LkMRC66kMPhxPiPTCpiN
	S70UPWfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2ND-00000006CGL-2crM;
	Tue, 07 Apr 2026 09:05:27 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2NB-00000006CFx-02nV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 09:05:26 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7dbb89ab229so3434257a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 02:05:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775552723; cv=none;
        d=google.com; s=arc-20240605;
        b=c8GzhOznsTI7Ax2iJPYvS6rclaAjs6s9TTsT1ZJucYo/sSD1dEiOn6wWHIAwfQ8cpU
         RrjwX5VQkcOI42Th3NH8Byz3w8+CfYDv2hXGsrj/627BJDUvjxEZRhYi2MXuFI3WtCCR
         JcPoB3OweQU4OxvaNE76NTmTJnCHnGaC8Blsj57WBxopEWJcupBDFSGALo6VO3B+bbaV
         LLCO6ec8jkGhg7HLd0Gt0A4SWIlF4Em3hgS3POu3q0zf6LmCpa/unWm45Ox6Ms/bvuun
         kEHu+OZKniKrCkh7strjiPsQLdBLYoEHLfyVge6pCtWPjGbd9uW1/OQDBfVOsybmtcEL
         kUyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IyeaVeCxfhnKWP2l9xAwx/3zDkoSerhyFLbIvFQP+0Y=;
        fh=XDTx7EArp2UqZh/z7a0bodxbf/FH+7/l0Fsspph3tsM=;
        b=Gcw4ooSELT6hA95cGlmlceW1hrOSAVFDwh/JJTWowXqVg4Kd2toK73F2R4WjwN9eHw
         tbBqPHmMec6DMEb7sPbROGudCvc7kLwP5QHGpKqVIJ0WjgCGjxKGfkrkmOgm1EQC+NED
         9yk4UKCbTk06nBRVVRk0flXx4iP6bjfLT2+ActlX7zaaRd4U6p+6uavK4fmHI81iClU9
         vwIShvqpFN2VPcIoPBbpezlk55SeYaKydLEUzscb2fSNbruRrqNkCwV9qjdSKMLB5ZVl
         0GhVX7a2TujqqLvEDHQ/yPVHnUiKpOn0FhULdLLqErBuUFwRjjJYJ6NI6DCn9Mixhk4n
         ksrg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775552723; x=1776157523; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IyeaVeCxfhnKWP2l9xAwx/3zDkoSerhyFLbIvFQP+0Y=;
        b=TBwV6P+ryuqbUaPPKON1bUDWFxJ6/x/WEYkjV2r2fIT6JuIr01SOGj1TUieAGDxE5D
         Yh+kzwV4UdZmQ66k48BUlsurwRUAuu/j0Z67XwhWdlMUVPmTKRWDUnulcRK6IJx7Mm82
         DPt8LIFmOtvkGhIDsflPurhBV0KrjlZRBoawrLthAD99CGK+kQlJ345N8TvkenFVpZUE
         YRuere33DOu0OLDoPkRg16bSkhtO5i5wcmDhRC1kW3Du2kqfKBosy1neNnhp/rMJrPXG
         EKOsGjHezpIQ7RHx4eN7UQZD/gJv/bLv+l3d1ZpbIXsx2fmJISFWUeOfTlZ7xUXdjSXq
         SFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775552723; x=1776157523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyeaVeCxfhnKWP2l9xAwx/3zDkoSerhyFLbIvFQP+0Y=;
        b=SS79sbeYmBLnvPvgM0cfzq3wh4KiT1OWZQz6z76Ge6f30xGlnaK9oGiKoMAySqlxCJ
         bnhIdxViY7vFjnJCTNpOIsa5TRp874Za9gI/SNZwqvcXdlM+Uhi3cZFIVBiMf7MCsID/
         srJk8gYLIde01ZrC0WTJhu0CBHyHPfJk1chPzxRk5GpDmJ0gxxXyEs1J93VXMmKY8MCV
         zI51Txoq7KDMEGzUhcvdtl5w8gw7rforXnsFEFUPxlY2efKLqbp//MTe8PZGHi/uPbHJ
         cz+/IGDYru8UbQB9qCMOLE/e7+XsGuwDmazfvf4bQySsBT4ivxITVpbn8fJQj8yxX1PQ
         6Q3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV68m+/c5elNpO+WWBGQIkd0FnGh4xUIL6/qKLRV0tSM9KAmF6hVzqBc4+Tx6MOb4+AdYDhvRg7j/ZDvBChBDoe@lists.infradead.org
X-Gm-Message-State: AOJu0YwikzwZAm0Uc3lT7e7ZAUb8B0FCsrOjYnobsi8wTyl9N3tTTDLy
	AwuUsbjNCw4TY4HP4QKCkv7yYkz1L/jY+ox7YoZ2P6PZX5bs9hG+zwPgR/zv3WoLykhNcZj9ExB
	VV8C2EMpFPmvITP8bEPQxEQ2ewMjHmcREh6aA
X-Gm-Gg: AeBDieugEeBzwpVcr9g8PZUEUqgKbqilE4vglIHhL0SibctXtGqTfLdup8mWMzudwbI
	gl0tFfl2vYxhhyeXYD7WoBuAeRdBmjCJhv0V+3R0NfQJ4DiF7EI0nkMNUOPIQ/CDJ2qGw4WJnAy
	S2MIyk8DVg0RqFsZf3Sir3Nx8uvK/f61eKA5q/EhUJ95dqWXy3YqIkqyfVstpgQ0YiqxV/u8Tpc
	EP+xkiZmieuyz2I4HUsFsi3McDQa4MDHTrwJvBZ2YtVoxfVOBrexAjvlCFnzFfLojzrXNipnQo6
	2I8thXp4Xu6yYYy5/gM=
X-Received: by 2002:a05:6820:a0c:b0:679:88aa:7531 with SMTP id
 006d021491bc7-68220c43581mr8109352eaf.62.1775552723620; Tue, 07 Apr 2026
 02:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260226055521.1655243-1-pkleequanta@gmail.com>
 <20260226055521.1655243-3-pkleequanta@gmail.com> <258747f4-9da5-44da-8eb9-24f8a8cbff3a@lunn.ch>
In-Reply-To: <258747f4-9da5-44da-8eb9-24f8a8cbff3a@lunn.ch>
From: PK Lee <pkleequanta@gmail.com>
Date: Tue, 7 Apr 2026 17:05:12 +0800
X-Gm-Features: AQROBzAu9EPCeu7yAg6nFPgvrkXGV_brWEzr82YVFUVRgLOpe60s_tcEts7ZUn0
Message-ID: <CAK8yEODCyYxkggU+7=xzWFcXP6RMTpNbHyYRHZhahX7=b6reqA@mail.gmail.com>
Subject: Re: [PATCH v12 2/2] arm: dts: aspeed: ventura: add Meta Ventura BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Jason-Hsu@quantatw.com, p.k.lee@quantatw.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_020525_058165_B27D0C01 
X-CRM114-Status: GOOD (  13.00  )
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

> > +&mac3 {
> > +     status = "okay";
> > +     phy-mode = "rmii";
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_rmii4_default>;
> > +     fixed-link {
> > +             speed = <100>;
> > +             full-duplex;
> > +     };
>
> What is on the other end of this fixed link?

The other end of this fixed link is the CPU port of a Marvell 88E6393X
switch. We are using this switch in unmanaged mode rather than using
the DSA subsystem. Therefore, we use a fixed-link to force the mac3 to
100Mbps full-duplex RMII to match the CPU port configuration.

>
> > +};
> > +
> > +&mdio0 {
> > +     status = "okay";
> > +};
>
> If there are no devices on the bus, why enable it?

We intentionally enable it so user-space tools can access the switch
registers. I have added a comment in v13 to clarify this.

>
>    Andrew

P.K. Lee

