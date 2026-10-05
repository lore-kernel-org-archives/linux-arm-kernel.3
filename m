Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FA7CA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 22:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCErEo1wEmMk+mf7jU8H4RsXealnJyQ44fgkbs7wqm4=; b=i+rsyK5omEhV26Y/gAHhnEUpn3
	eaAd2J6lSzzRwbpoFXba4Ri693nNRE30I5j5oxp9G7ERWxAx1aueDcfNDw+HKFfuvd01hAjMhmqgt
	p73hj70QnplTuBdlaYfapOTnj/TNvlZMP4yXF+YpvUVbSaDbnWhyYebtPrWSH+ynBuRym+XtHt8yj
	yH/3/wruHwRlyD81XctV/nEEPDb5R7xXGhBx20Pn1Eax0Aqsero3swLnKhw/hlJjAq9pxxTCZTvu/
	9knrU2J2TBMDKpYm9f0hkMC5PzGaD/SRPIWuB2GrwZX4fRDcEaxqN7z6L101/IRNkak2cuJunJeg+
	aBl0kcQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqnE-0000000HEE1-0HEK;
	Mon, 05 Oct 2026 22:04:20 +0000
Received: from mail-ej2-x0b.google.com ([2a00:1450:4864:34::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqnB-0000000HECs-0z4t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 22:04:18 +0000
Received: by mail-ej2-x0b.google.com with SMTP id a640c23a62f3a-c2e85cec3acso105995066b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 15:04:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791237854; cv=none;
        d=google.com; s=arc-20260327;
        b=HGsYY3/hvv5VHQjKXBEdSq+Ryhb/alNfzvHcAOuANjZyZcjNjSiVriRNyNsuTCKfI9
         PVwSwgyfSgKngAkxRyniqOx+NxdVopJsmiGvNVMQWPaeQP2qyytD1+uKfSJgRtjz6sqy
         Q5tPr2ObC6SMqJLoYQbeyzHnQNhd1TPhjtZVaPUOswv1rmFcYhG8Kg8ACnAGoD/vM5qJ
         zRv75Yz2fiDvcBbZmXRRjsBiOSQTNMZ05KogpvyUmmyVM3FvJNETOOlDlADHJ7AQGfbm
         j9F2dYcRpcMOzhGdiug9jkYih5T3h1pbTjhvFkwT+oZ6jWB3PuQ9qoh2akjqBmdUvUfz
         vyLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KCErEo1wEmMk+mf7jU8H4RsXealnJyQ44fgkbs7wqm4=;
        fh=GHrc2gbo8SYFb84HRhw7VGjWw20/jDQw0QJ7TvrwL7I=;
        b=fbe3OzhyiiURarPnfE2qjhnmgnmvisNzgPk4y8pkxb/C7IZlfLI910vjCdAWI+DjN4
         vwaYXWTmf8SRwSNR1mjy3OyHCF9DSXwies3HFYRsPe35UnZXMRIluyOFOx2Bg4Us5WVW
         hVpLpajgGQ13BVxucfhPJwGlwn/Gw9ZuE32GugUWyOaMYJdIMzgWnJcalXYqWZ96FWaw
         s0+R+n9J+id1AKyxy3wOEmo38aad3rrZIbIummGet+sdJCETTNXlq6RfzDcsnKK2PKZr
         ZiTAhAeDnhSNfXr9lhKDhppUWQlUfo2p0XKCaTXr4ucDkRGYDvZp/jp1AXeGpuZJnNIW
         LchQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791237854; x=1791842654; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KCErEo1wEmMk+mf7jU8H4RsXealnJyQ44fgkbs7wqm4=;
        b=hPhAu0fqpP81LCNgCEa3GiD2e1AqfDw0dJH/Mrba+OzCVgUMeAQ5FaGIvCq10WpUz2
         WC9t3wkIwXMUhLcCd8DQaK2cL9++tAdwNVARPzlxcqgtRo9oiABKmXb8Duyi2oTOAIrj
         CVcQaV8D7z9nVSemouWOlYU/scx1hqDxVJ7T3Dq+yaWa9HAFPYIg6DI0OqD/GuZ4Fo2D
         DgpXTFj0f7hpw7gUf4BjpD7A+KkYGPiQfTLp5QEIQ8oo2GBk5h+RTSpwCrizD0U+E3l1
         bowttj59kB1teS5eqNcwUsUVqpC8Ds+Daj6v7266w8qDAHpZHpBC09F0vvWH19xgGZCo
         UdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791237854; x=1791842654;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCErEo1wEmMk+mf7jU8H4RsXealnJyQ44fgkbs7wqm4=;
        b=YnW4oztdZW7ysl2yTxz6h9FGnKkWYzWyIyUEz7YaHbwMjrEPnCQLBSTTxbAvzJJw0R
         wllpQ5j5A/H4OisyGuo0J9uxIZvAPvMjg3pz7uib7xp2UFcA/MQ+RKpZUS/e1DAGYiZH
         WXOtYCX1ezX0ICNSNLTdBCsuvU3ThHb8oVRglZ/rRlMn3TW6Byp8aCZqFWIkp0uj6ece
         QxMtdOktWhPMjdgsQHKmvm562zfblvRNdFdyLCyHUh5yx+8XqTUvCh2442/xoUIJWvpk
         nKOLDsATKnqWjaaNx74HiFg3QjL04IW2niNTAwIJWLcHxYWL7p5MK+4lnyybGlZgJszi
         XpnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXCUN0rb1GYq3mZKHCjkZmChc7dz2nqmiVIOhq7m8htvaZbGQXrlfJ0pdsPU9saR5efII4O8kuhmu5KkeRF2AB@lists.infradead.org
X-Gm-Message-State: AFuF++kbwVGExYfx9dC5ccnCQDkmCdzmxQhqwCxnd6HKs+0IUM/gRQp7
	wnoRJYwdI2ZHlrV0xKot80luRwHIDFTVrZrU5faXx5uev4Eg2qiowhoB1tVmpwyvsYhpPPxrJqk
	D/vOrXhcilc1ZsDPA3AI1BasHYbdqLrQ=
X-Gm-Gg: AYBFou2+9fDMO0s043hXjw1yNET86NxUIW0uvJePxyinZfC0j+rER7dz1FEimeVV4ai
	rCnkv+YSas/KpHgMyzKlqa2u3uvkew6RJgDtbJA1GBpMSu3LOtzYdPAY7UDziEUc6eOvyUOeGae
	x/sDXeBoW7JkzMI2a38YhUYXC3lGrsxVM2ab83RAqnuqqTsoN+Dj4edICLZNr7l1np3c6Aimn4q
	DD+6X/TJQtlr/CnLm7MaE/jLluvJdJF9/5zO6yXTxuAgzHuDckdBp8HaZEF//2VVy2OxitfKqnm
	FNtkS7I1G8GpC8FuWRyDoQGmQKfUHu5DvUK8qeIwaI1R18acPK/axm/hqQ==
X-Received: by 2002:a17:907:3e29:b0:c2e:19b1:dfe2 with SMTP id
 a640c23a62f3a-c2e4ad3b1cemr1046003766b.23.1791237854529; Mon, 05 Oct 2026
 15:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20260922200336.2201212-4-coiaprant@gmail.com>
 <20261005135939.01ccde50@kernel.org> <CALj3r0h7j-4ZAiX67LmbgpmYCvK-Xmzd_qnYYgoBmniAW+eiWw@mail.gmail.com>
 <20261005144432.580daa2f@kernel.org>
In-Reply-To: <20261005144432.580daa2f@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 6 Oct 2026 06:04:02 +0800
X-Gm-Features: AclHuK8_KLwVxsmgUNUhSrq19BEwBKrpkwc4LlinlPX0y7uVYSSqgvZVvQtFu6E
Message-ID: <CALj3r0jNFss4RqdPjJ+NJ=yPRm7zZA0N83T2XxqLuFwoH6iN7g@mail.gmail.com>
Subject: Re: [PATCH net-next v10 03/11] phy: rockchip: naneng-combphy: add
 SGMII MAC selection for RK3568
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_150417_468373_582C609A 
X-CRM114-Status: UNSURE (   9.19  )
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

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=
=A5=E5=91=A8=E4=BA=8C 05:44=E5=86=99=E9=81=93=EF=BC=9A
>
> Well, the patch series is already getting stuck because of
> cross-subsystem acks. Do what you will, I have 700+ patches
> to look at right now :/

Hi Jakub,

Understood. I'll split it as Vinod suggested: PHY binding+driver to
linux-phy, DTS to linux-rockchip, and repost the remaining net-next
patches separately.

One request: could you prioritize picking the stmmac lifetime fix
(patch 01) if possible? I will send it separately.

Sorry for the noise.

