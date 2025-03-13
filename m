Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B2FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 13:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s72E+WiRW3VjWXLF2oTp3RR6w8yjtvEkUxbaH/xY8NM=; b=5F6Hkv7sUTzYeNZU4lNmTxpigO
	Vz1CjHrLdJwvGHhpRDc54opiFIEExYNdafUAOOaCMlaGGu7B0EUwSgXJ+TCBRDq5sLWSEh939u5a7
	xysWEaEZPAl8r1EQIK1k/pjf72pPx1xXM7nM3L1vzxEes+lDYFwG5SAKgCKPS+mypFJr2/PWpNgXB
	xIFzmw7EAbI2QbzXi+namKdnQrZeBIvqEPIxwP83lKBM1pX5YNFWNZKsYPGQXk0f5OBd0HOlieMOp
	6PD9853GPTF+vTtz/t70qL0xOYDcXdgKM+Mx8cYRaogz6uj7m35HyzQRbYhSSa94p5dKPD18BwviU
	2CyjOd2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiy3-0000000BQxV-1W9V;
	Thu, 13 Mar 2025 13:51:23 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiwO-0000000BQci-1AV5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 13:49:41 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5495c1e1b63so1199760e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 06:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741873778; x=1742478578; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s72E+WiRW3VjWXLF2oTp3RR6w8yjtvEkUxbaH/xY8NM=;
        b=qGQwdPjUMT3vcQQfGj4NL0MaPiYW9C7hy5ft4PEUeXOPSnAy9H14VRPzleNU3YEy8/
         StHiwoWsiT3GA2bkK1NrUYsjVSEIsmoF4AST31WJVMVXeSFLB1rWGPKpcheNu+BneUOw
         0L9I4p4pjm9H68pf7aroIWwOtUGXusJjV/nXydYzKk9+ZD13UKKc+J8LGZ0DdCTHcDi/
         Cbz5RjRh90RPKn6rkjiJ/tIxb9ZeR8IW/OALbaO74E1bF+8j/xANL0ttz8hJ6CBFAPJQ
         cZdSNb4mZfSPycXmNzbl0sgqsFBn4Qi+pTvYaKigv3Q5aRHzfmzB7Fh85bKAGInqUsDn
         +fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741873778; x=1742478578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s72E+WiRW3VjWXLF2oTp3RR6w8yjtvEkUxbaH/xY8NM=;
        b=QDTK2+vv7WWGz8pliLVlKA4rTsqyLWMm0yHep0+ob61XaD1+YMp0ywtABEbxG9BmTF
         I4yoiIfINOcTcQ/DOFmSnFhFZN2AKBdpcsmVjyBWFOp7YL6oXCu/tqo/JihEdpNZMJ7K
         lCsvoFQND2k5vlHMHP7Uia87XuC1K11c1f7oHiBwYyMhPvnStxyMs9/V7eOMO71NReVO
         pA/JlR5aVG/BuP9cytNq3izJeB4oRY1pIeO9l8FZnuDtbNrMMjoc6tQPQgf/v+OsvfNG
         CaD033ElxCeSDRijW5N093+4/fM6tEO2ZsqlQoEBJVX/cZNJN6SWrHu4rXW6RGanFlVQ
         HuzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsCjPkfo1Pd0J1gB+wy1TA2RWWJaDHSBybvsOF/4A/zxkPrefNzLh9bvkxAY5XavFG29+pPmsAo9+L3m0gwD/V@lists.infradead.org
X-Gm-Message-State: AOJu0YzcV0UXP2Gxuaz0/+XWSlU85xdxY1k9VLi/sUE6h81JOewybeDe
	76SgCHgZBxxjLhdyFyTw7EXYPtn0g8i1ZlG6N3gaynSPBUistARxLhNoCfKsfd8dcvTWQaEY6Zz
	dnyiIIS+IDS6wMszk8phQr9rOhoCgTCilLpGriQ==
X-Gm-Gg: ASbGncv9rcU7uPXkWvt/hKFOHbUBVCB8S9Lx5rZZD7sQsrp284xT0HgecN2wFruWX6f
	VECRnT0hK5mTp0s+AGzQldnhOQMl4VN+EZF/YYAY90KBZhdiMYNg7PZlYErS2VtNfG5JVLOiV7s
	rDH40gHjD4C7gB89W/7lPyxmDFOA==
X-Google-Smtp-Source: AGHT+IEccZO3i5+lVUwnSS/WaACh7JJj5Xo6UXfk6dLNaFoPEkEoI3mENp7/zCsA/uhLA0RMiNFyQBBG0+AbjlILsis=
X-Received: by 2002:a05:6512:304a:b0:545:6ee:8396 with SMTP id
 2adb3069b0e04-549ababc849mr4033095e87.13.1741873778434; Thu, 13 Mar 2025
 06:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250306235827.4895-1-andre.przywara@arm.com>
In-Reply-To: <20250306235827.4895-1-andre.przywara@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Mar 2025 14:49:27 +0100
X-Gm-Features: AQ5f1JrLPVPuCTomUP4jXqnxl_0p1ehI2pivoJIVPNCchweDQ93p9WO-dULZ7nM
Message-ID: <CACRpkdaVH8GAx_K0a01FbRKe8CQ=jh7jwfVrs_PgS9og4vnWmQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] pinctrl: sunxi: Add Allwinner A523 support
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_064940_320833_314F4D85 
X-CRM114-Status: UNSURE (   8.70  )
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

On Fri, Mar 7, 2025 at 12:58=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:

> this is the fourth drop of the series introducing pinctrl support for the
> Allwinner A523 family of SoCs (comprising A523, A527, T527, H728). [1]
> This time only a small fix, spotted by Jernej, thanks for that. Also
> adding the new tags. Changelog below.

Patches applied!

Yours,
Linus Walleij

