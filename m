Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F65FC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 00:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNXZtHXlMZe/GAVsS/mXzE2WPhNrxEPsqIaKcJonkWQ=; b=eKm4GtV5OeonQsYTX0SYsYnq/n
	b7h8Mk+wEUy+vV1tWObJSyZqHSPyPFxL9EAEZ5F+fLtG0WxedjXxiM/XVX+XqKwptbM9EXmLL1U14
	GXoElHHEXlOKs/zRjamolpyocUouHfWyH9P4hUzFhNuX0eszKNxf8598Xp/0K5c45Y98Fi1SWFW5G
	D77X54N3VdCSvgEF3h8wy+BGr6YsdWRhn6ERuWd2XKHHHONxdubEozkrqTdYoH+rM3DGIwI/UNo7i
	6oJ0cJbwgJoWmDomFEUwJkRYoRloMDnJDHCZcwNknUnku2PhlKfKpcLTGenrM5JULdU33aD7LYOhW
	aFpMP5TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4UUv-000000043BN-1Pb0;
	Tue, 15 Apr 2025 00:49:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4UT6-0000000433G-1CKA;
	Tue, 15 Apr 2025 00:48:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AAD2044817;
	Tue, 15 Apr 2025 00:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC51C4CEEC;
	Tue, 15 Apr 2025 00:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744678083;
	bh=RctWjOi2giJst7wLG7hJMf+486uMe6AiP6atMkwHVFY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rYUJEomi3t13v0k52FKZq1BfWI8eGCDRGljAyJxToldcbr/ynOjQkMsdwWECFTdi4
	 c7rJKZQFv1uEbNg3G7iys7O2BOZqzbut+enjmj7WmmAriF/jPbGsW9SiB6ITKmBmhl
	 2xUM75bT8eeqbiJfSGc+THgHhDh0s/E8TAdvQQZ5PTJ601jo+gFD9XJ8xdb/zjQ94x
	 SIluMEXi2Lu7fBl4mK9wbzHGKAR9Wd7xIg+MWq+07V1K0czh7Hu2z3xsgzcWFK3JNJ
	 TLjklGfuuB4ruIKMIjlBiFDgjbVYJFXE48AGHUA0Ba34rxsjVdt0MIlwSEG7Mh4TX4
	 eNTt6U6Auy1Cg==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so7385795a12.3;
        Mon, 14 Apr 2025 17:48:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUaFccndpl+VrrnX1cEsyuh5dKWnaFFpLhzB4Wm1dv0QpUvAp/GBzUQvRn9nwKtxCfgVP91mO4IY7BDjv0v5ks=@lists.infradead.org, AJvYcCXW53ItvB4VSK/Homxs2fJEjYFpP6SSF1bDxwpR+K1GdFX7TTagXbvKgXbz7Y7djq/UKCtms9mhY3yd25WYkYGX@lists.infradead.org
X-Gm-Message-State: AOJu0YwBQYnt0CtHO1L6ZJBwj6fQ3iJaGSt+anI7KsnvGlLV91ogSAXp
	lSAA70ZUwtCu1ENY7KDKOE1EvKGZuvz5t9DFiG6bxEM1Iyl/tF6noEkSbGAVW8ZmZOxuT5SAsOm
	ypg3H6O2uBXMMndVhisOvTOq0oQ==
X-Google-Smtp-Source: AGHT+IFFPfOrrDqgzpv3auvBWL0e6nlb0egIXX4wtTdxuwO1Kxz4UxhZv8bMmjzVcyJ70rS0tg3eelf7AFPeC8n1FUc=
X-Received: by 2002:a05:6402:2711:b0:5e5:be7f:a1f6 with SMTP id
 4fb4d7f45d1cf-5f36f527034mr10329827a12.1.1744678082088; Mon, 14 Apr 2025
 17:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250414225311.1913480-1-robh@kernel.org>
In-Reply-To: <20250414225311.1913480-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Apr 2025 19:47:50 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+D832Dq6oHO6Vxg=oMEA6drwWpgUqwHS+5f3s8-LBNeQ@mail.gmail.com>
X-Gm-Features: ATxdqUGRL_jz_WBTa5GmqkL_V7H8md2ow6s-ckR8Dq1jEmPSQe6gYDCQzg7ci0U
Message-ID: <CAL_Jsq+D832Dq6oHO6Vxg=oMEA6drwWpgUqwHS+5f3s8-LBNeQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: phy: rockchip: Convert RK3399 PCIe PHY to schema
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_174804_343127_76EBB81D 
X-CRM114-Status: UNSURE (   8.29  )
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

On Mon, Apr 14, 2025 at 5:54=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Convert the Rockchip RK3399 PCIe PHY to DT schema format. Move the
> example to the GRF binding as that has the complete block.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/phy/rockchip-pcie-phy.txt        | 36 -------------------
>  .../devicetree/bindings/soc/rockchip/grf.yaml | 13 +++++--

Sigh. Forgot the new schema...

