Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0795FCA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmynuyHJU8N1Sba7vOKf17LXlfDtQutbPwLTql25A8s=; b=hpKiR82GKIWqwu0mL4u10gP+mr
	s+Z9zzdQSYv6ilcXVYqMRgNP4TgSSbBLLMKJUwPbLVSw/8U4srKniFRlCPuChKT+LO3kaJP1iCEbE
	HjuLkQwkT7wNPi65S+sw0x49KljDoKQci9xq70oBIyT+qUTXBSGgV4D8/WH5VteSORgU+bV+j2tKG
	4bS/ghZfsDq1nOzC50TIxoUAAKRr8lVEFZvLystVSLgGDpPcUdwAhfO48+QupA7d7JO3kZSNrSjYm
	WRfyywELPLZ6vPEgGjwg10Gspb5drMVdfx0h/Ztlolfkwrj9VGcoNZuKzIu6klp+kGxUPERNawmc2
	MITIfj4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsj9-00000005uWS-2tvn;
	Wed, 30 Sep 2026 11:43:59 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsj7-00000005uVJ-0iiz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:43:58 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843796e373so3071393f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 04:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790768635; x=1791373435; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WmynuyHJU8N1Sba7vOKf17LXlfDtQutbPwLTql25A8s=;
        b=clcyW4cVU+mZsM61N+Vygv8UEiyzw7UiKqczB5xdKk5B3XFq7vvH2sZGxPy7XU9GYi
         QdkNJlX512Ex+3mv7w4+/PuqfjaM9f8Y/aQufOGeVPfQSzQ1LiTJ6XBDpgjACIRoxpxB
         3v0Ha9AE/LDwQFx4zxJqgsmdpo72GhfCQPZCiWATEIViQOf/ZFXqNlN6yuNaumfmxx8C
         DmwS7OYI+fYZX3CEpMnmFVT3gapdHAKAst6pfl5ObZA7UUYLbrXX3INy2GjGnmQZWxjp
         HLsnRcvNkw/wX536tZxVs7k1DonyWM7HlvvPdyu1McMg55WZgILfoqh+Z2SimfJJur9n
         X3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768635; x=1791373435;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmynuyHJU8N1Sba7vOKf17LXlfDtQutbPwLTql25A8s=;
        b=qt8SbirTvcLMTjsg4tyRntTX1ewfS+rstuoDXgXzUoKMK89fooQr9C55Ovnj7oRSat
         Qi3L0a0U+OgGX2bTc4hs2hNLO09bnQtdkF3Xztc6gBLeaOtxJEBt+EZP1HRG6oVXEwNk
         fGGm+STXheshJVz8wCuY3YtrXKHGmB57K4rDNfEauC6twdL8VHwvMKmjem2YLiHGmIZv
         zsuSoE+iaywLUj87Pm48GLtHztVpiGS8aObgPiHUQtEm08M+lzUhwS8BHUw9f0zCxCnZ
         +slhrbVRRAYTsG26ZpSktRvppEwqlCWo5tY64FbOdlhb5mgPGjxPELsTNxfHAfWyEwtA
         OpcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBHEHhqMQZnwJ4n6Sq7MzpT5OqsDeibKsJ1wqndO8+1Ehlc8sqA//8G83bF3FDrcdCOLZ5XjI3axMqd2KBa9wq@lists.infradead.org
X-Gm-Message-State: AFq9FYJhlEfyWSzLsCHlvNAdoAFtQkYlAoyq+Yiag5HzCzE7quqsOF4r
	Slq5J8HfferCXX7WCx7U4q8B0aJrpT3fK98FVw2TIUN78/ymiqPN3UMe
X-Gm-Gg: AYBFou3ERG7Lch0rRuZ2CI8FDOmPd002c3CSO8aoFAJ97rMD03ZUbY2fb0iBOv/dJNu
	HEXkScSRktj+kVIVJ4z49U5j8GtUpCOuEUkty5XFDAOTnCIzGFhR/mjIohWMIDgWL8m229D+xgx
	tKim0h8parfhx09itNDTdMDpxNLHNdWH1c9jLBgvKX5YM9e759ZXENfzZpd2TUKfnzkgHhnG8EY
	u/ld+s/nchsjnSHcpOq/Q4z4MrSlEZ277LrA7YPdURoIjvFSWK8KVsPbatjmMjTSBuy8baQqel+
	+FEwfMn1zb7e5iEjfeVNt5qPTJdK1NfnAzG9kVOQd4iIDt8OZNlAlyaoLgyXm+qsEbCTPl7TIgB
	dMVY/Om5SFGYzObmhrC89DQ3Xv27BuoqQXpn40P9Byu1H2WHKdZmRtHfLuHCep3uxhxIEbVN2Rt
	5d2rEdwhQ3uRM4kWn2EJGepcZM7qzMXFKED+uSCQRV9BW5zBs9lMbnk5rI7gj2QYynXLb25odbV
	UCoz1h/JEAVVZQgXB7OaJ3liBg9LLvhpcFOCwok+nA=
X-Received: by 2002:adf:e00d:0:20b0:48b:2bb:aee9 with SMTP id ffacd0b85a97d-48b02bbb14bmr1650336f8f.11.1790768635262;
        Wed, 30 Sep 2026 04:43:55 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02949cf1sm3005415f8f.5.2026.09.30.04.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:43:54 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jason Li <jason.li@cortina-access.com>
Subject: Re: [PATCH RFC 04/10] ARM: cortina: Add support for the CS75xx SoC family
In-Reply-To: <d97a806f-a5a3-476e-8910-30027a6f568d@app.fastmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-4-4617c4463529@gmail.com>
 <65c87e07-1722-44c2-9a08-ed9e18902058@kernel.org>
 <179076583795.3054628.14443934429806440798@gmail.com>
 <CAD++jLnZBpoF3H3-sqzmrtwzxLGombFMdSYMVo59jiGFYcyCFA@mail.gmail.com>
 <d97a806f-a5a3-476e-8910-30027a6f568d@app.fastmail.com>
Date: Wed, 30 Sep 2026 14:43:52 +0300
Message-ID: <179076863241.3327419.16233537387530771884@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_044357_230331_8D259E7B 
X-CRM114-Status: GOOD (  16.73  )
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

On Wed, Sep 30, 2026 at 01:36:32PM +0200, Arnd Bergmann wrote:
> How about making this one ARCH_CORTINA_ACCESS to match the 64-bit port
> (saturn, venus) that Jason posted at
> https://lore.kernel.org/linux-arm-kernel/20260610112821.3030099-5-jason.li@cortina-access.com/
>
> I think this would be consistent with how we deal with other
> acquisitions (storm->cortina, freescale->nxp, ...). I would
> leave Gemini as-is because changing the name only causes problems,
> but for the new platform I would use the current name of the company
> that last sold them.

Thanks for digging out the history, that makes sense. I will use
ARCH_CORTINA_ACCESS for v2 and keep arch/arm/mach-goldengate as the
directory name, as Linus suggested.

Should the DT side follow as well? That would mean a "cortina-access,"
vendor prefix (added by this series, as Jason's has not landed yet),
"cortina-access,cs7542" and "cortina-access,cs7542-uart" instead of
"cortina,...", and arch/arm/boot/dts/cortina-access/ for the dts. I
have no preference, I would just like to change it only once.

Thanks,
Fil


