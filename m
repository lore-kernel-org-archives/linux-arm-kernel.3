Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2F0CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 22:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=viEI3bB6GOdsd4kqZvlb/IfnNxfAW1h37zzw5ogvS/U=; b=4Fd23jOx8O8AJqZvCjWCTcsbp3
	WSAFBE7xF3hiP5p67M2Un76ailaTK2Smha04w5NQMJsGZtUw2sA7CR+n5tDrNSLq5dCzAkzMxWZD3
	1hScM9Xgbny2P3qZgNJSeKI0JBfnuaNS15rM64miDLKD4wmbeiLYB2AGQF+yVacrZKyALeAT2K/FP
	MItRdPx3A4UYdamMJyxjNeU5DUUGmElvyngtXNQtM7rS59k85nse8ZUUNh+UpjfTtR8NhhEK6urWr
	lC8B60DEgoIlLLmseDfIVPzEYCJgJphTBJtN3CatguX4PmK6sPwbpWClC8oWIrLYt+EM2pgFK9ccB
	EaAq1jAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFf7h-00000008Tc7-2Of9;
	Sat, 10 Oct 2026 22:01:02 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFf7c-00000008Tap-2A37
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 22:00:55 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-677dbe051d4so647118d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 15:00:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791669651; cv=none;
        d=google.com; s=arc-20260327;
        b=YrIqsR7UJLKvpOlxXMt2/5eMDeYE5rr1KOKVUNE5Pq3Ay9et+4+va78226C01qmXzM
         pQJURZJCuxqCUMFV9ZEhg+zLaA8TS3OHfvS4XpWsJ89qh5VZO02Ijp5UXpdXds6VwHpU
         LY79pUvoFjZJW6NjZ4C6NLdSyy5Bwi3WhR5cq8bOUk10vtj0wF0uycsFzIQx6rGGYQu9
         eQ45WhkBiF13PDBvM936/wLYxwCnoLM9rpxw4LYiUOUzqqRPGvcviKg5PwDcx/ndx0WK
         69t1fy9JoDlodwUDPzo2D/VSEhi2U+/iYcHN4ENMwfvNv24+Cqbf5JXYqmB9SZlScWt0
         1Aaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=viEI3bB6GOdsd4kqZvlb/IfnNxfAW1h37zzw5ogvS/U=;
        fh=5+eoMq6slsz7T70p12w0SR+iX0f5F3YA4nuO5fohE84=;
        b=PbY3xB1rTaSEwT4cPFxGQhZtCq5m7aG7e5UeFVNrAcbKvzCZV7msWepkYqpnz+VQle
         zD4qvCChMji6JWIQB5um6ESXbDc+GoaZAcwAFqofsl3lIYgwKyQWCftAMWi9kopzNWUw
         zBVkW4zItQ5ZYeb17jUtyKoYTbQ83u6E2eV0zVgZ03dkMI6+bv+OlMECtyJeE5IffJ1o
         b3gmV7pIJWBdWlg1tA0Po0FT3rWvp+JZj1rhDp8eEBf51uC4QrUaYRq1eoIvT8b07JXL
         gUQEuFQjJc3C+ZgxvaFjoFtCLvNW9FQnsDJ+uZcB1BOwCJOLnq67C7J28MvjV7L8bHP0
         6Y0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791669651; x=1792274451; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=viEI3bB6GOdsd4kqZvlb/IfnNxfAW1h37zzw5ogvS/U=;
        b=FsDSYp8FetzNstVVzl2A22uCXDTZ2/T+WGFSppD3pvDKyQAiNkjSSFifchJlGAo0oL
         f6M7mC0WfxbA05avM8LO3faF78Kl3PuXuUMiBkvpNgru8swEYQntsJRVTb9p2sUkTl1c
         y+xPjiNjtSMVN/PCLNVnroirj4RjYzgiVRvAJPhmsUdToYxZ3lldfb5/Jf7FpUMGEWSz
         8x3rk+yCsK6BBbBJQaG+dGqXucQIYwDH+SRqTV2OjyII1dDOspxA9Vm++/Txa4XmrO78
         wLJspWgNH2WYbuxCwkeLFVW8BVLYVAqOUYbhiwJOnFxnMSkiEQN4DD8u++XzriIAuM6V
         ROEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791669651; x=1792274451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viEI3bB6GOdsd4kqZvlb/IfnNxfAW1h37zzw5ogvS/U=;
        b=fIoel6srMyT6xkuiwIkql/4Jv5Pv5XpwUEYkNejnRz14DHMvFATNqtsYcZ0PZ19lmP
         1Js6fkqA+1WhuMHBf5ggZq8NrQewdr1M4d36DBonqQo4roWoStEkTGKRD+3P48WSQqD4
         /5sz1CNAoosPyt3rSmGv2NvHp+JzxMuBTmlLaNpBGJ6hJdGXdWUKbPAXC1Mwr+kgBuO6
         Y0tsu0OeyGJ4pyzexaYoiqQZP2l2ZJZ9jEtQlgSuIlxRkCP93b+2Ui7iddaFpAB7RS0q
         fF3oUpSATzIFr1su2PYKJO6pemkxoVtWpFYNgUgB1JBYuSLPXmS+v9KBAvhXbShgisoa
         Q3rg==
X-Forwarded-Encrypted: i=1; AKwUvBxJ4eFwFpksJcmS1BWVCP0rYhESuVQBWE4sKdr7Xlp4nWY4/PJIEVYo5n7dgbDM+gm8akRAyPWeglxobp7GFEaL@lists.infradead.org
X-Gm-Message-State: AFq9FYKbxBFLPjEHPqShk0ZmrNBAWRc8cebdbZqZdYf9QUtCUstJLDG7
	mDkH1Sl82taLE8H0iOR+4OJatBmO4BqwXc6jFEV+Cfpdp3qizOJgij8Nt4XBKkClTDGtloknOiY
	6LreU4gdBqgtPLGPc8EAf8Pl+DScJSW4=
X-Gm-Gg: AYBFou21pIBBAs5JGJHuseudOhdpCjgooIfxy8g/K36jflnEnmZHZi79CkJGgSpAA/E
	3iM9JmFXD1K33jhJrH8niod/+tXYGVaalpaFr1pAZYPyOJSzY3rnt6nhZSjMRua+gpqjWp6rvd4
	nMusqW1dWt5kVPJ6OeBpFZNYOcXVVIhI1c4ja1Xq/Ake5vjDwTJMenLfHpE9shndA6e+FaUnQIB
	Yx8WgkcoZEhUH4IFddSLjcWLu3hZZHPhdSQwbr6ZteLRhxLID3pL22Aai8FdqgLW+HvdMW6F35A
	oKjPUebRWq5y5IHDLx7tfxlaNVCM92RwVUo1h11BvDy4NU2m1HcI6bNo7ydwQwRyHK23ypzjgR4
	o/JaYEwtBvgv1
X-Received: by 2002:a05:690e:810:20b0:671:5206:72f2 with SMTP id
 956f58d0204a3-67936049a53mr1141845d50.56.1791669651100; Sat, 10 Oct 2026
 15:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-8-tanure@linux.com>
In-Reply-To: <20261010105900.247342-8-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:00:40 +0200
X-Gm-Features: AclHuK-1AFCBBfJ7Kfb5Ikey6DbHIu9yDPTfwBVIgnuMS2JnhjeqsjRPSCAltBs
Message-ID: <CAFBinCC8iKESoc2zEXJMEmqk0cwWbVap-a2KcAtB7-KFKO9Atg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_150054_343548_F147682B 
X-CRM114-Status: GOOD (  12.03  )
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

On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
[...]
> RGMII needs a delay on each of its two clocks, and on this board
> both come from inside the chips, not from the board traces. The PHY
> adds the one on receive. Its transmit delay does not work here, so the
> controller adds that one.
[...]
> +&ethmac {
> +       status =3D "okay";
> +       pinctrl-0 =3D <&eth_pins>, <&eth_rgmii_pins>;
> +       pinctrl-names =3D "default";
> +       phy-mode =3D "rgmii-id";
> +       phy-handle =3D <&external_phy>;
> +       tx-internal-delay-ps =3D <2000>;
You're stating that RTL8211F's TX delay doesn't work but not explaining why=
.
I haven't come across this behavior before and I'm worried that that's
an issue with a batch of RTL8211F.
What if the previous/next batch of RTL8211F will have working TX delay
again - wouldn't that mean 4ns delay in total unless the RTL8211F
driver is changed?

