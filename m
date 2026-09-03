Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5F2C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 08:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edjXy2PN+mcza+3kZSGSQQ3aYOZGZOPTwjWGFZXSb74=; b=iTT7/DyUx0yzxc+IT+CjUSCvzw
	6eqEYaCvhhGKNVxTI512RiXO95dxFeK7q+37stvo9yfePhYV18t+/0r9M/57tEcGolknTlF/XJa3O
	PISf429alCPSZshmAL04by9rgC/IF31O8yx0+zYvaDAbL1z6xI1G/XOXhmGzg42FwMXyHkuStlx5+
	ZrYL78MceSet/CanzqRzG8xKH/kmaB1WKEEKv7eR9TTPthsV9xqE1PVBAa3JZRL0KYmhQZFgT2zi+
	5YvO8Ix4qw9M8dOvbJHACRJOqFMatobXishC7VW1HoM5ypg4Irc7iadxz1fLE44RXO2rxB66YScli
	rK6e5eng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Am-0000000GqqO-06ap;
	Thu, 03 Sep 2026 08:51:52 +0000
Received: from mail-ed2-x00.google.com ([2a00:1450:4864:33::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Ag-0000000Gqm8-1XvY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 08:51:48 +0000
Received: by mail-ed2-x00.google.com with SMTP id 4fb4d7f45d1cf-6a5f79c6c4fso1026048a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 01:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788425504; cv=none;
        d=google.com; s=arc-20260327;
        b=DLe8Ib/pjJy4VU2IbQf+gyb7CUGxtMcVU4GnOLCuIsIhb5I2/UNuBvqu9n9ZXj+L8V
         DYaHa4tzA24ukWQEUJZInDVMs75x1w9s3/EwVuPBU2ULQ+ZwLyoZ5EjooJ6QJxwVULhV
         wBi5QWgZ7a4bivX3nJpv1ICsKO9kmiXN+01lfA6tm50DlImVuJ83cRDN4GVUR4oU6YEL
         nCoJcHd+EB+2Nx+R64BB78VTy/J7QEznYTq3P+E3+pLe/Z3+qmS6QjC+Al2Rrasv9moL
         8WOiiEiQpAacF26WI6Aa0o7wXhYksIEdjOU16z0v0UHGiGYwViMaNuuDpAtv+1iBFM3h
         CmUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=edjXy2PN+mcza+3kZSGSQQ3aYOZGZOPTwjWGFZXSb74=;
        fh=V9/eGsou/k1DiL1eE028d9m+MLsSNGtnQBnZk9hBAEg=;
        b=isuQR8R/y4bQkO5z6I0oYcTy/irPpdlt4as1mHxKGcRo32MCkCpxTjpRpmreS95Ogf
         IFQyaQe+MkJnf2o3X3ebbJK2fDTb4zDN6jy6hYVz9ZHXCTV4qO/vY0tCzJIVwRVpwZsT
         U2rE8h9tQtuZxHef5QA6FjXnw9VZXZLjMWnAAwACgfH+Y2J6TIU/mSuxjKMCadtJo3kM
         fj1xaHRDuS+fzxeDj5QHdT+3KtCQ0EQXxyQV1FVUywQ8uxguN0q0SCxk1PHDuNl8T/nw
         fYpm3rKiHT+vNdG8PIbFKZvQ+n7Wt8Emq8Dm3vECBPS85aDkcdws8am92kjNjYSH979v
         n2uw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788425504; x=1789030304; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=edjXy2PN+mcza+3kZSGSQQ3aYOZGZOPTwjWGFZXSb74=;
        b=QgF24gNPjgGB8rybzkCGGV0Ckk4IpikO0hgnT8N8TpjYoBRYRofc9kmC0qwlSe4IO+
         EHBvsJb9ENXWPeczhvZg2g459BQrjwyRsBgSf9hGBIcZ3bEwGhzmPLwTb6Ub71c2tvWy
         IFNwJTUd8jY8pLFMviCY4iosKlIk29X+H69VQnD8owLGY1SjZXr9CKT+afX/bPhoPSQv
         XwQDXHV+4mfyjYUt5wSCKZ1foQM0OYd6D58mr5sR5SgsVckLnJgjFM8oDdnmnQmhE0Mk
         cI26KwY6TXMt5Ut+UD+3+SyKJj9z0AbndwxVw7PpkWSVsev4ybZY8X5HGg9LTnicuUEg
         ioJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425504; x=1789030304;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=edjXy2PN+mcza+3kZSGSQQ3aYOZGZOPTwjWGFZXSb74=;
        b=Pk6VRWY9LfF7hous+sIb093QWPAI5TvVRXhgHo7gsrLc+l7FgDaFNhH48r9JuRfrCk
         TLRMy6uRLdWrJUe3KwL5v2w0ED93Ys/EjmsRrQHD5U1ISYVkPwdPZtfAUjo5XcVHmCSK
         iKnybHXUtb2c7QHUPOwIBpm+Xq0UBGWzFQxXibfKGX94HA0ZcgfYBQiBGM23/85una6S
         DFCdY8jxmhJoFHx8u341ytmZIXM40h9a9Z8CgdzM2kemZAimOaNdWPNc+rByEA9XTxwr
         wvar6N6QAQ6SyC7KhORGG0pGnzV7uslVOtZvW0e+XC1QAZ8FAotU0EvZneu39DZ6HVVA
         Wovg==
X-Forwarded-Encrypted: i=1; AKwUvBwTZ0Q2Iz5Jz1BktaRjCob6JstPoxpZ8nU9BoF1EF//8imqJa+QQcNncrBetC94+BpwCr6a3zOqAwBfIiHvljgV@lists.infradead.org
X-Gm-Message-State: AFuF++mpUC1AzMEfSS2m23Li3GWTk+hV3J4uX0ooeohKeQqo/bk1EpmK
	mCZQyE69FC3hHGg1FAnUTgx4KuxI/rQrIR69ljzvGI5sAekgE5IdR/JRduhiIxCHK8THe9CQL1C
	/e9DguKrBnZSuyq0cCLXh3NB4lQYn5t4=
X-Gm-Gg: AYBFou2BfeT6Ypnhr7oaaUBrGHNsAQzNfNSyKvKYqMvDW9Q8hPVzvnQlPQbR+V/buYd
	6wVHsG4QfZk6BLLtiOoTGIJDAwkJS0Qisb+ozkUqj0T6ad1X3InkRFP545yfhSIS+PDViO9fC45
	4z5ShLSSF3grmhF90JemwH3HvzzQAp7yAnPo97lFIRrGRjhqKx3w8PW+pFPCl1bF3UvvNH10anv
	tLP3W2hCoDPAHn96kkJufZvheT3HXNQo1BsSuB2DjOY0neCW6r2aoNHbA9jPJzZ4z806U2jM5rj
	tViA8GXqdlf/ZOnWOk7ueImxztTqYEvJQRrh53L43BF2DeC7T8KdRtGZj28=
X-Received: by 2002:a05:6402:460c:b0:6a3:87b7:b516 with SMTP id
 4fb4d7f45d1cf-6a68313fb0cmr6808251a12.6.1788425504326; Thu, 03 Sep 2026
 01:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260901150111.141037-1-coiaprant@gmail.com> <20260901150111.141037-2-coiaprant@gmail.com>
 <0dec5462-f6d5-4ef9-9d02-5fdf7f3090a0@bootlin.com>
In-Reply-To: <0dec5462-f6d5-4ef9-9d02-5fdf7f3090a0@bootlin.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 3 Sep 2026 16:51:31 +0800
X-Gm-Features: AcwNN1VVEgAP8GgA8LdwjKHcWBmFmP5U9Mjud48d0pq7C7tHDzymcLYpjmHugJk
Message-ID: <CALj3r0i2msRXH-uqA2QX=cRkQwM_H2bFH9GiroEys2NfEbTtCQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 01/10] net: stmmac: move XPCS lifetime
 management to platform drivers
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_015146_426888_E9B49099 
X-CRM114-Status: GOOD (  15.68  )
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

Maxime Chevallier <maxime.chevallier@bootlin.com> =E4=BA=8E2026=E5=B9=B49=
=E6=9C=883=E6=97=A5=E5=91=A8=E5=9B=9B 16:32=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi again,
>
> Sorry I had a second look at that after a good night's sleep, and actuall=
y here
> we may regress. The original logic checked for "pcs-handle" presence, the=
n
> for the pcs mask, but if no PCS is found we didn't error out, we returned=
 0.
>
> This is making it mandatory to have a PCS. Please handle gracefully the "=
there's no
> PCS" case :(
>
>
> Maxime

Hi,

This change covers all callbacks that use `select_pcs`. Drivers
without `select_pcs` callbacks will not have their pcs used by
Phylink.

Currently, only the Intel mgbe driver uses xpcs, and Intel has also
set a mask for pcs-handle not set.

This means that on Intel platforms, the parts that implement
`select_pcs` always require xpcs to exist.

I think there shouldn't be any problems here, but I agree with you,
regression issues can indeed easily occur here.

Best,
Coia

