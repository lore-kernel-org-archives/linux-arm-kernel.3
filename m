Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA412D12691
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 09:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWyCGwyyY5MwroYq5IC5e5Bk38tH2sQPpmiHCOl1mRc=; b=j/dGdg3OuO46zOm/0L2eUur7Ce
	zlSrS3ZzXm4e3v3zn4PAX1csNyx1Y2L+a8CBIvQXg0j4F82DerzFHGBeO4f6UjlrO3y5Xf13fuKPw
	bMsuZ+SHtYURoOPkUDvt8qRB88uqsVj3GGpboMi0tWiTECli/Uuy3j3lIh1NMdEj6Onayw8+K3rjK
	iJji9EhsQUk/XY0itZ5cEL2nw+GeP9Ktnxv35aZ8xpgUqJXxhusMBTfmEfvCTMMyzTQoLcPvDPVsX
	4XQdrI7RnW5XqJzQCPfxo+BKdaTCmXHpZ5WNqW9/E+PF9CwlhQfbRBW9tRlIam4Z4uX607asLbqvf
	F3ar69SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjWq-00000006PxT-2fWR;
	Wed, 03 Dec 2025 09:52:08 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjWn-00000006Px8-2lgB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 09:52:06 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-11b6bc976d6so939987c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 01:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764755524; x=1765360324; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWyCGwyyY5MwroYq5IC5e5Bk38tH2sQPpmiHCOl1mRc=;
        b=X4NyK8bFlSvAuxBi5llbtI5QmZ9pNLKYORFdbNRrZIYV2vgPSZjX+NzhRsYnMOnNhF
         OjszMrXDH+qFSDoVn/35H9jBAdsrHj386DmJplSFG7Ngdwqu+FdpKHd3E1V9KGbffy5K
         Gv78fhf9J7+F4AIJF9OEUYJGySR9opCz9BC+0mskjOFcNrc2EJ/HAW/ydGyJ/nIlZXgv
         vYBSBvBMmh9iJX8EACwZ5+dXt2GqxdSvcnfqW0It0mrbckzgpDMQjzpc0f/4IlrXX0zp
         C6KgM0VDgOVnDqrq8myg61Tm7JEp33tdS4b6OOVjMov1bT47EXQkvk3/bDmKjeyX7H4W
         csaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764755524; x=1765360324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OWyCGwyyY5MwroYq5IC5e5Bk38tH2sQPpmiHCOl1mRc=;
        b=V4+sXmlZXe+YYNMOi/CuMKImUpPmgoupWavllEiwje2WbMnk8GUBQE/wrtZtFB/fC3
         MMH2R4dQMP8ZfxCBlXSUwJL5Nq3h13HkhgvHEMmRwCTHip5rvJxCPDJ9KGxZOVvEmTOq
         1T0mF0Ud+TCf9LQa/9LuV/i6oeI6PgiQdHJl9G+7RayyqW3mApz6yrNcBxVPzOXNvZJ1
         96LCFXXBSIiTPBUIbK5su2eXKYJj9aQ4dZlnwLUAHRJInyBDAWxeMCejTEeytZ7QvcD4
         UBSfdB8KhoGGlhi0uumeDbo/URFNRbGo8qphdZx71ykDsVIMHeO0U7MhFxyeYXn5C+XN
         RxXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2C4kbbb6AqH0+3NglN6LHvQSipODHYeihL3Bb7aYQYv6l1GzkfTs9AQ5yVFNwrZQGGPIMv7AeLXsrkDk99FTu@lists.infradead.org
X-Gm-Message-State: AOJu0YxwC6tyPCaK+BwZ0SG4jooZ4Ybo8wl6U7A0zpTGItKRiSjUF99P
	4uEfvcEjJqTTDO76DD7lB7EO91x3kz5owBcnOUvipMYHx5wu2o1+N2O5h4/s+wON1twthM5a2uQ
	lLPrAjFecG0WYJIf+bNzoFjEvQS8UO74=
X-Gm-Gg: ASbGncvW8eMweaKnorxA5aAzV3BVF300zQIobSPNOmQFgi30tcQBrW4e8QHz5OOqE4S
	wWrPzD9Svw7wBjNpbNc5uFY92+0VtrpzeuosGjghzkgp5pRRiBfyaDDq3rxGuxhiaeLPEB+bNsh
	kZgyLLjtoJTl+Vm4otFDaABb8iMdoy6HqWAQenwe3ak67b5PvWsz+4x08Lg0CpRJGOcgNDPADjw
	reWmoLT+t6u8wVOjA6vHtswNdwpCLlnjACDVQqG+X8SfmXMf3ANl0AGjgJBTvVfF1zJ+za+5B3L
	kipJUcE6AcUo4nf214YL+FE2Hs3+4Uh+O3VlUQHUAEOt+lr+qRcBlxdx0HwVWFD6gVOLFL+9W9a
	8XW8EcafhJg==
X-Google-Smtp-Source: AGHT+IGQ/2C4miLe3zM/NhOU3VZpHjMuVGyUXrDEher3Gr5uOwYWVn++qjicdMlG7B6aJRjD2FHdhjLCtYHpU2OLJk0=
X-Received: by 2002:a05:7022:ff47:b0:11b:9386:a382 with SMTP id
 a92af1059eb24-11df0c5d685mr1322583c88.21.1764755524533; Wed, 03 Dec 2025
 01:52:04 -0800 (PST)
MIME-Version: 1.0
References: <20251203070605.1868821-1-chancel.liu@nxp.com> <20251203070605.1868821-2-chancel.liu@nxp.com>
In-Reply-To: <20251203070605.1868821-2-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 3 Dec 2025 11:54:37 +0200
X-Gm-Features: AWmQ_bkG8GFRgAI4KsSzKwZsCVtdMd0KsoG-6Ph_fAU5WKTZEIqNOXxA-oOaB_g
Message-ID: <CAEnQRZDqX_-hB9mPT2s-mi99Ym_j2KVfwRykgS5W3hGJ8p_uJA@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: imx91-11x11-evk: Refine label and node
 name of WM8962
To: Chancel Liu <chancel.liu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_015205_696512_1D21DDA5 
X-CRM114-Status: UNSURE (   7.20  )
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

On Wed, Dec 3, 2025 at 9:06=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> wr=
ote:
>
> Refine label with "wm8962" and node name with "codec" to follow
> devicetree specification.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

