Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEF5E9DE6C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 08:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSinTqMRk7WKiOjjhU28b38TxCJUDpIkM+UX2/IoucM=; b=mDXKDum2uWHbgJBSC9h2KGdzcF
	MhcTXBdIr+Q2gYMagJ6mMmvz3dSxpiw2+fnBiRjG0dHVvInd7LIGEVRa1C+AHBT9DOJZdY9migY+S
	aCzWf3F0Md6A6krQWg2VS/FMTnfkK3Yyqb/oEYNqtf9z1fzKefu+Rc5tDd15hVYcknDM9thWLUocn
	nMwaFB0udBjhaTkRjH7PGL2h5RgRs3KNOzwTwfwdFiUQj1t/5rbd+yzsRie6J9cL+vh12jPx7ijlM
	YNpWWjWk9Tb8U0UFxt5+nihEkunLVPVGz7A4mpWlAeyX2TzhOMhWnHIu76cq5AE32zPPEad2HZGmi
	Ju3pIyTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAl01-00000009xw5-3MvI;
	Thu, 09 Apr 2026 08:44:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkzz-00000009xvP-0lzQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 08:44:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D441443CE
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Apr 2026 08:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51505C2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Apr 2026 08:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775724266;
	bh=XSinTqMRk7WKiOjjhU28b38TxCJUDpIkM+UX2/IoucM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GdD8hj67K/1zLUxPLNVOghF+oCNsAuD1A0dy7Qh5FjOLqX82tXv2tAlxrAIL1Cym0
	 K5m24CruJ3a7d7iCtqkTcYJcWpmkbmHGSxnEfj1KSYokKqXnSVGnQXsfnRwIT2Ozfc
	 JMvBPlNOhp0hB5sd+bS4ZSx/fuwmRG7ahRrvc7CFIDWwHVd0S29Sn4+FnO8QR340kG
	 KndacjW+Lhxiu9+JMDCjKq/LkZYUrj0o2N6q017HKmWZ9+ekOhnYmpJkLgI7vkvbwv
	 /v7F6R4phc0WnpuQWxR71yFVBjasiQcESQ+4tbnbhmzOhEsXK90dUcNBF2JG9eaAQ3
	 GQawv2tQ6TdNA==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7986e538decso6543097b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 01:44:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5yzRrGjGtvgKV9ZluO+iSFnscZWiOff9qQbr4qhdf9iK4EPdwL4cHm+JrZ402mcIcxhvDqbNnZAO+gtLCeksS@lists.infradead.org
X-Gm-Message-State: AOJu0YwU084m+RhODnn8elH7XxWB0XYtjGQPCnDHu6MyLks4/xqwSxUJ
	NWtf13njCNH642UT1Im5z5TPmMqlWhYlcpv+EOmqoTa5ljnn4Jr4FldGjVD4JeJakRxSIfFCE1X
	NroYimkgLZbCLdnSlgbF4BE4hl5ks9Fw=
X-Received: by 2002:a05:690c:6610:b0:79a:bc1e:a399 with SMTP id
 00721157ae682-7adf2863321mr27613477b3.35.1775724265707; Thu, 09 Apr 2026
 01:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260407235611.550515-1-florian.fainelli@broadcom.com>
In-Reply-To: <20260407235611.550515-1-florian.fainelli@broadcom.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Apr 2026 10:44:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLm10MOYt5Xx9Am+Oqs8rOFse+L7WDOc-W_5OS5fXuSSHQ@mail.gmail.com>
X-Gm-Features: AQROBzBBIPyY1s_9tUX4DGpv6VkJc53NEDV7f7YuwDbgIlTf2tXYVbrcG7VMnEM
Message-ID: <CAD++jLm10MOYt5Xx9Am+Oqs8rOFse+L7WDOc-W_5OS5fXuSSHQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Utilize pinctrl-single for bcm7038-style chips
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:PIN CONTROLLER - SINGLE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROLLER - SINGLE" <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_014427_246131_C3793507 
X-CRM114-Status: GOOD (  11.23  )
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

On Wed, Apr 8, 2026 at 1:56=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> This patch set allows Broadcom STB chips with the BCM7038-style
> pinmux/configuration blocks to use pinctrl-single. This does not
> preclude us from making use of a more sophisticated driver in the
> future, should we need to.

Patches applied for v7.1!

Yours,
Linus Walleij

