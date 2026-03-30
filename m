Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84C21061B20
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 21:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hYVKSg9ytw6axWoUvWj7c3Njt/BrwbV7Jo1jvjAhhs=; b=i7ZGgp2IuB9edFRgJC8oR6uTjC
	6WRryNJBr/Dc8jVHs/T9Oevc4rocNImf3hKY3gEVsNy5CDrVoUKecsdz6GNa0Hg3r5QnXH7oEgGlN
	zg1PFcP/j+fkm9D0CeCdMd8q24HYEpu193I5LwOmTLdfotzGEBBq8FTWBK//iZPFnA5wJqUqvgVRi
	t464QhcN5HNBHrMzS7hEP2kN8MAZsSWUWDrWUynBOHTEAsRgBLbN3of+GbIZX6mEWfXBmWeoTK9uZ
	f/Yhrzu0XY802SRC5dFvJLqaYADBe4fLTXcPquTr6J/ADvdC7Cq/wts0dGWxp/QpS/0CZh4KMqlwH
	1T8oU0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KSe-0000000BvZa-2Zhs;
	Mon, 30 Mar 2026 21:47:52 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KSb-0000000BvYe-1MtN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 21:47:50 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c76682834a3so1935011a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 14:47:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774907268; cv=none;
        d=google.com; s=arc-20240605;
        b=heR+vVqQal9q4NuwegwKTOu4c8B6hale5fMvUbkOc5q79fHkVaRb96pznZYnxuVwBM
         RAHewaY0GTtBIGdu17GQ8w4i2IphtD7hYTiahcudGadUkNYLHHsxeVc8SAUerlZKPNQu
         zWylNaN2Y2Y589P1MYtBJj3iGKzLfasJWaVtZ09tIhmi7iOnnQ0S9mgHDabtzxHVEyWm
         XMoT1c4XakcsnF/Zw/eOxcnb596bguQO2dbTSWfSc4mElkB3eujGfZ8+WGCBwGM80KPw
         S7jGLOHe6DrEBd41T4LbaZria0c3Zb5VUy6D3oRjKi8l7UM5yJ37MYCOgkW/7oiq46NI
         NiVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+hYVKSg9ytw6axWoUvWj7c3Njt/BrwbV7Jo1jvjAhhs=;
        fh=d5B3Q9qoFpkar424bWO3fxvVID4h/HlG+enUnELQgqE=;
        b=e+m0HKYdYuXA0wwHQqr9+f4tppJqldKTdHc6ZhiCupfajOD5CLrtmPZrlyQ3b37zy8
         0lJMoi3inlmjTYb93hECsNtQMvtKsBx1aV7u7B3cUqF5+jCijGdwKYsIY+Cr8pP09+1F
         nqUBCa3Npd99FQnpVg91TE86Eou6x3yiXpZQ3CTQxQdjnVxPn2fNTmZQQaE2Inm7J3Hi
         98IkVwLb8bxuOtny5xf7KVRZIF9qIO8ze5qVsz3kQfkekiQR/q+lTdu91r1sFCHPBKoQ
         DKyt8MtaM32fQ/yv7EnhpnTXPVXfOpHZQ6HW76/tpAiiSbKlgEaUQa8Hi8UXAJsGwxKI
         qw8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1774907268; x=1775512068; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hYVKSg9ytw6axWoUvWj7c3Njt/BrwbV7Jo1jvjAhhs=;
        b=lzMQmYU7Spcj19ZAUjUmurLh5S3ojLpPTG5C/5O6zErUCE5FvdjmwmAAeuz2+2Hlp5
         wl+/vfyjzyLV4guH/5qM5lueoCZWiq51AZHpq1kVM7ZvPmLkrMgjBIetE9a/ZDAMefwH
         9F2+gbVXF4b5obukt4jKTTIU+Z9rwmA7s54ec/0CusFyJ6VIlbUcsJH5xe5ceTUJdNoD
         4M6geoPOVeTGLkFBBEb15g+nHM7YbxrvaUzOnPMQceaRXFRP2F8sbThFfRi8W7uC6Suy
         Mky2ypbEv15f9TuQO9qBrNZPeS5kpy5LzI5FPgvg+NLr4M8jwnAjt98NRlmK66STv+bc
         HlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907268; x=1775512068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+hYVKSg9ytw6axWoUvWj7c3Njt/BrwbV7Jo1jvjAhhs=;
        b=QacSjCIB8q6cmY1cNK4dFmL/xhsA48uuksA8Dsd6dQUf0Ly5UPuzGhV9LEgOJxeg0c
         DNf2fCQTPPahHGLe54aRoc+sQRV0k22T+aKZPdgPRxXN2FH9TZo5/KOjmlTfSKA+CMRY
         skKn8mq0HNSksKZK7ZAUCisNSzv1mk5kDh6aPTOD83uvv5eGtK6bZb1CU0j28bj7kBXh
         G78IsXdw9P7NMd67BM8AiYJMejoxyWhr3TQsxXLDL39MkAa5vcdc0xFKy3/QattDSkrw
         yor4aKqP4uxzJzKmepzRvNqPS0Eh/bqtYgF01KPdRDsSMru7AzWD4M8nkhfeNRj81/lH
         PR9w==
X-Forwarded-Encrypted: i=1; AJvYcCWg+5pSdEIjcOoJZp/YmIGIk7PaWlRPhzo3+2VGdem5x4SiSEkPyg9uJsH+t61y3WgUbrhjfe8ab3L6My1VAEgp@lists.infradead.org
X-Gm-Message-State: AOJu0YyebUQzuetXz3P6ahBFIyn0x1yxeDpvh61qseiaPQ8tJdVdk8WN
	lV6f/im3iVnzes4PrQyu98EmUzpiOiZQZ4NWb5D9V7QuEGTxh5yIEC7S4ieorBxxyWCrUmvQtRt
	AIXERQjLHaKmTJVhyfdCnT4Ktqe6v0Og=
X-Gm-Gg: ATEYQzw/YCFA4pGkVXCZAWBOY6O94qFf9af0bzEs5VsOSEuiqkjSTLBDX3lydds11Ct
	oBR8bhghSev09EC00dJcQbHLJsfv0WD3C6Et+BCNeOzP/aEbNGkkDod7fRYvTrNOoukfmiHtkPN
	TYgQNpAfuwGrFKYBI/PC645RDEFsk/ZKEET9E0cvueoxDoqdXg2Zsg1yuSLc/KTPZ8FT1t5/ic3
	xJxI0jNnQL1z83bs+jG5S9VHlKMnkUTm5DfQ+HZzzPE640+NrX+PrtimBLUFBeBmDKmMdkInv/N
	7iYyU4urYmjmbcPqYxbxyCNLzHpLP8n8w2plCnUM
X-Received: by 2002:a17:902:ea05:b0:2ae:c816:ec5d with SMTP id
 d9443c01a7336-2b0cdcb047amr144282745ad.32.1774907268370; Mon, 30 Mar 2026
 14:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260330-fix-invalid-property-v2-1-228c51c8de93@aliel.fr>
In-Reply-To: <20260330-fix-invalid-property-v2-1-228c51c8de93@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 30 Mar 2026 23:47:37 +0200
X-Gm-Features: AQROBzBvnmRKRGAIvSjOHMEU9BCTQO4Sy6Oph-BgTLAMA4eX_eDJ84xw0oCF39g
Message-ID: <CAFBinCAxT3Nz4VfJZWdvE0jPN0J0Ux8Q6NQrD-uCv1ouhmMuKw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_144749_367016_7A8D30C5 
X-CRM114-Status: UNSURE (   8.68  )
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

On Mon, Mar 30, 2026 at 2:15=E2=80=AFPM Ronald Claveau
<linux-kernel-dev@aliel.fr> wrote:
>
> Fix introduced invalid property for Khadas VIM4 sdcard regulator.
>
> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: regulator-=
sdcard-3v3 (regulator-fixed): Unevaluated properties are not allowed ('enab=
le-active-low' was unexpected)
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603290828.5gt393t6-lkp@i=
ntel.com/
> Fixes: 60eff75ac67b ("arm64: dts: amlogic: t7: khadas-vim4: Add power reg=
ulators")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

