Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62661C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 10:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GQ98Yf/YUpW8nUBxuk3MEoc2KzBZ8x8YGwRaJGiAnI=; b=0DpLdy2to+dcqc8tAXXx71xEMc
	zAJHf9vcVKij3RXUne+btgzBbKkBp3lsQP2oWyxi6qofFt5SJqiDL1X6ff7NfMzxsGH8UQGg1WriT
	6/9p718idJfoMj+lvGuSfumM+TT573TZDwNMI9Ey4PyUaGgQ7noTbPMFqGeOvtVXaDAMo2I1kxDHF
	fxOowuX1zeWIzYI/oyxHIaPEASTMW9NOaFXVZcl4kscsPygAP1+wA4B3XYrYTR+oF9o2knEv9eS6Y
	EU6jeLcAarBpldqzXIjeYOSsqHVtEzH7EEEIaGP54nNXD/vagC3AHYJciKQBCfZgnqksggR/r0FHW
	/0A8HrjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ5lC-00000002A7O-1FG6;
	Sat, 18 Jan 2025 10:08:58 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ5jw-00000002A0g-1cJP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 10:07:41 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d932eac638so5722598a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 02:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737194859; x=1737799659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GQ98Yf/YUpW8nUBxuk3MEoc2KzBZ8x8YGwRaJGiAnI=;
        b=YAn+4vXT3CKQZnj2KO8USemSel/uwX6IaoTpQ+fFDfwkO66hho/heO5ZsJmfBzxUjm
         3TQ+xUA1YoeRQolvY0sV3dKjUg0fCwhy8ZsI7HJvTBMMkbdyyzej3VJZqgmD1h2PeOr2
         TZfDw/3F7QlJ2F7H3+QP3p0ty1QYg6qn0Xr6/5Wt1PLFQH2TI+7T3qvSZ9ZYJfwiXKDb
         tpL/hyc4nyeiZveuUZXHBnuOB3tHe+hvcNRxn8lJbQpd2HYaBU6/RH41BUXWDEFJhdNs
         2PvJIl1e7oX63CZPiTOGovQiQJghB9m+JuBpTWGxNGmLt1wPJE9JbwHLfOjTvlGzEd80
         WVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737194859; x=1737799659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GQ98Yf/YUpW8nUBxuk3MEoc2KzBZ8x8YGwRaJGiAnI=;
        b=C39xtmbzwuuRDlO7V0o2Z3yZPfhUX+lrBdlg2z9pjvtYNDQsR5GPtgHm6tU616udEH
         JhG8LiGokpNDp5lYKB0A9jmsJLPs63Bg7wcuxs92zxCBZUjhyNa4rpFa2Xb7N2PTyaqV
         NoHb556wd5JtJpwnGRZVX5978YI+7VA0AEg+t+xc15wqRA7wtHjOQ69q5lpREHOBqJUP
         0yXOvWCw2H4pdAIXl7y4X03PGw0PxV57/USeeDCfhdFhhOQa6TJmreQTAd1fCvw7v5bK
         9mUhfrGZLW0ucc0PtPdiHRaVPPk1w4dalVqxwgasoaoaCRin0f6aKw4JubB5kVuio/Jc
         Q4jg==
X-Forwarded-Encrypted: i=1; AJvYcCXyG2Huah6WTewtBXzFXpyT0RmwWqnEpsYowTsaJKhZrcbL8icHyDid8W9Hv6/EVGoODDBiuQLcHwl7NJlTOCPS@lists.infradead.org
X-Gm-Message-State: AOJu0YxbxSErHv05LaRlQrLmQcd67mbeWmLkSSM+2Af1uzi6Q3RQ1CUH
	S0j14KwqV7b+zqb2TUAcoIPjEndce7YK5Oa8eK2XMobqusUAy1wKrVNYsw==
X-Gm-Gg: ASbGncs4TDTdFZVJK6OUC0unYX34PiTO3twNPDuksysqpnI+XvB5jNWu18t2CZ/wgiX
	Zq2hBxXSONdTLFCX6frHHyNiqus+XxVp1vr9W128pf2NegqR73HDRV+K+Zl+o/VA5q9Wa4sFs3E
	RJCywZoB4Chz56TJMp5qS15Kq7qGTO7COrvkaI5K2O+6iWuaHSFesFVndqbibJvlZUwX9PRt4qW
	OIX6l5qjdK14DdQaRVxdy2tjpgye66m/FAYxsinBVnpkuNByjAQo9BZ54iDQbX3SlwIqwc8GcL0
	nVnvR9te5uTVLhs=
X-Google-Smtp-Source: AGHT+IFsvrKMrEz8QcePe/YIiTwNkbTjp5GTltW896PPvrsYo1Lns2fM/cz6NBZTJCkAVR68cgnrdA==
X-Received: by 2002:a17:906:3a87:b0:ab3:a190:6cb2 with SMTP id a640c23a62f3a-ab3a1906e5cmr213892566b.25.1737194858490;
        Sat, 18 Jan 2025 02:07:38 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d2d3dcsm308908466b.81.2025.01.18.02.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 02:07:37 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] pinctrl: sunxi: refactor pinctrl variants into flags
Date: Sat, 18 Jan 2025 11:07:36 +0100
Message-ID: <1881692.atdPhlSkOF@jernej-laptop>
In-Reply-To: <20241111005750.13071-2-andre.przywara@arm.com>
References: <20241111005750.13071-1-andre.przywara@arm.com>
 <20241111005750.13071-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_020740_424664_D9F17774 
X-CRM114-Status: GOOD (  18.22  )
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

Dne ponedeljek, 11. november 2024 ob 01:57:44 Srednjeevropski standardni =
=C4=8Das je Andre Przywara napisal(a):
> For some Allwinner SoCs we have one pinctrl driver caring for multiple
> very similar chips, and are tagging certain pins with a variant bitmask.
> The Allwinner D1 introduced a slightly extended register layout, and we
> were abusing this variant mask to convey this bit of information into
> the common code part.
> Now there will be more pinctrl device properties to consider (has PortF
> voltage switch, for instance), so shoehorning this into the variant
> bitmask will not fly anymore.
>=20
> Refactor the "variant" field into a more generic "flags" field. It turns
> out that we don't need the variant bits to be unique across all SoCs,
> but only among those SoCs that share one driver (table), of which there
> are at most three variants at the moment. So the actual variant field can
> be limited to say 8 bits, and the other bits in the flag register can be
> re-purposed to hold other information, like this extended register
> layout.
> As a side effect we can move the variant definition into the per-SoC
> pinctrl driver file, which makes it more obvious that this is just a
> private definition, only relevant for this particular table.
> This also changes the artificial sun20i-d1 "variant" into the actual
> flag bit that we are after.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

That looks pretty neat cleanup.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



