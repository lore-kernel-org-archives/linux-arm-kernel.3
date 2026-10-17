Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CB3CCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 18:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEkbkJFaQMaOIdNScbVyDcoXBnczG5ukWjkDYW48x7M=; b=LtvrfgfP97CAp5L876R1tdUkRT
	Y5Z2MclRLG85vF2JUpvmVDJGjBzcBJhRfWnQi4efDplYnTRML003lnRJZUliLz5Ki6zAbq9aT4gp7
	+/EyZ8Ff6eCQVu5v+NZaymBjGrpZu6BvVUCpQkpPXCxol13obz3zyeHyxOadml4yueFbglTDBcVZo
	MSB1EB30gG5mMqd9/vTzUuxjl1s7s2iL1h3lIlO5BCPmybtHhv+kGMGzzPr+2YuZDVnhmTLtXB06K
	2l+sHRPJGA7DVYl8+4lDAj1pO/5WD+T4i4hgJpTQNamjs6mueT7K1pXGUV6iMd+wRD7w6k0SHW3LA
	KfD+5RTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8ka-0000000533o-1iLO;
	Sat, 17 Oct 2026 18:03:20 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8kY-00000005330-0sn2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 18:03:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so11166185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 11:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1792260195; x=1792864995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEkbkJFaQMaOIdNScbVyDcoXBnczG5ukWjkDYW48x7M=;
        b=C9eCM/C+cGmly2XcF27xIRqmwXZaNsscGAoA+6rnwHIo0tqbw9m/zvWGmYRTEY90dt
         IcK7VC6Q+3swu4ONkSH+Hf5KvQMO3U08fS9FtTD2yT8U/Bn7nUTqu4J/UNuvMYsFfB7K
         xbsMj997MtmPGFDdvJdeoAaLccFne6AmL9n7HuuRmAaCd7ScyeKCD+sxhxGcNgSXVf5t
         Z9eLpz3hvilATShkGJFX5FPwS0uLBbepLqTJKBnZzRhS7dEDu2z2v/Ir5l76IizUOMBZ
         t/Mhkd4GDPOpuFAV+s73LPvUBFWak0W9Wev0DaVvhVhzxloaPTa40o8QHg8dPOzicd/Q
         kh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792260195; x=1792864995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uEkbkJFaQMaOIdNScbVyDcoXBnczG5ukWjkDYW48x7M=;
        b=RKtmGEKOx5Y4850QvvTLHOS5Lq2KA37A6wcDn6BSiOB8GVPdtyHaz8ppDQQwJZWDxQ
         kTpigK7i4T6CMPjbPUrH7UMUIW4SKJ1UG5MU8YIeTX8MpdiUYBKD3b/MIQ4M/AONOSDB
         j3vAdeApYxuzNYQri4h1sY//ivDUWercFblMSWmcSMdD9/sFOGk+r2+vtsMSIe7KO0WN
         bZ9wTpuA1jyAb0vq4NaKh3JBNJ50cz5IDazMpwNp5PXgGgjEn7P49OfEFtSX7AXSN4ZL
         vSVtCOyCa4e49wUt8qvjpjEXgStag8vSiAdtxaqDHLcE15cVgzTMq8z2zUsYYOAzEPU3
         aaTw==
X-Forwarded-Encrypted: i=1; AKwUvByYos+7W6OcL8HdkdBlj8KflttY1suDtcgvpUudWojv+B7v+LakWh8k6h1Q29lXKlBMA85ZweDHyYetcrdYUR4r@lists.infradead.org
X-Gm-Message-State: AFq9FYIiowTnuokhN4+9vv4ZILsbax+1Dl0Y/zr4KAxSsVQ8jln/Z8G5
	fzcRyqlMz92lDtZD4wEtjnRRJHBPEUl32Viqro7xSHJ71BScyRFtIobneFDpcBp6Siw=
X-Gm-Gg: AYBFou18AXXf0TdsjuGLD5Xp/Lz9xbQ/t4j8WX6uOHb52gG0eVIDkN3Yoq6oD2jzV3q
	LWHLYaTw8wkBhcE7wCgsWUG3PQVn2ik4oZ6S0AYIu+PlxFnr99XbNvDlMFtP9ADWLb4PXlQk9lP
	pOCOBYEVnOknCngvweZbrcpiKdvca3awt80jcpy8Y1M4Oi0S4jaDACbWm8VIwzXRfhqKfcDwXsQ
	ug+FQXI7SkpmmxMudWJRp5MzXHjm1HH4M2LiQP+kONZPjAdfEvzqsFENOOHLp6X7vJOtCLUDRRw
	9tXyiGrcnDAYPWTKNj9sFHlPUmqri0j5QmvJA9j0016J961qGF7v7posIYWQrrbRGsy5sNt+smZ
	ajC/Xeq2vsYI7eyN2DusEOw2ocxXdzSuKN0PDsU1L+Sdaimqko7npMescf0gEIrrubvCLk6mlmT
	98Iwj2yzTMl1jHVdkKBeDbRRy17/UhKIiQJ8w9Sbk1obj2N3OT+w==
X-Received: by 2002:a05:600c:1c09:b0:4a1:df2f:ae8f with SMTP id 5b1f17b1804b1-4a1df2fb8abmr32120385e9.6.1792260194385;
        Sat, 17 Oct 2026 11:03:14 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cbedb6f7sm159228435e9.2.2026.10.17.11.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:03:14 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v6 0/3] net: phylink: wait for a PHY that probes after the MAC
Date: Sat, 17 Oct 2026 21:03:11 +0300
Message-ID: <20261017180311.3618879-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <b175c750-104a-4859-a137-09de78a6d8bb@lunn.ch>
References: <b175c750-104a-4859-a137-09de78a6d8bb@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_110318_245031_95797765 
X-CRM114-Status: GOOD (  11.63  )
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

On Wed, Oct 14, 2026 at 07:10:19PM +0200, Andrew Lunn wrote:
> One alternative is to put the firmware download into the bootloader.

That works on this board. The bootloader now loads the firmware, and
with the driver built in and a small change to keep that firmware when
the files are not readable yet, the port comes up at switch probe. I am
dropping this series, the driver change is posted here:

https://lore.kernel.org/netdev/20261017180251.3618606-1-f@lex.la/

Aleksei

pw-bot: cr

