Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90017EF06F7
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Feb 2026 22:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uOZ3iwE/BH17JAQBdLoZGWfaV+4xttczJXUuAySVK0=; b=xYdEGYqXsf6a6xE8NfD4gppPaY
	KpNUYYbEQHrVTVfXiBnDubZ5ynw0vx0bECdIE0Hr6amr+War672LGsRjZy8Hev87LkxlDavbLQ+W5
	Ga6G195MoSR6MKEgE5voZjtfi1PQsJPaXV2pD1zKghozXnUP56aCTie3ek4tdELJfV/GsTErtUQOz
	btyaR0sL4MuTLg4fnpABZn/2hMyKyZvA4yaX5BkqzeCmxoTbclBMyzxJ87JK2bcglz++OX9HSHceC
	y6KisJO8iBcZ6naSBqxneZuw5hvk49pa+X7n1R/wqjjyNOCtdlr0kD9ryJdAXhwl8jkt+wFyYjLkZ
	HHAKnP1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpD8z-0000000EW5n-2l1W;
	Sun, 08 Feb 2026 22:20:41 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpD8w-0000000EW54-3PUo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Feb 2026 22:20:40 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-382fb275271so24206201fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Feb 2026 14:20:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770589236; cv=none;
        d=google.com; s=arc-20240605;
        b=LE/MtQcpzxw2mmb9om89pLuicfyZUYPrIPZ3+BgmfLeOwVdgelOZqX3qvOhwaB2MDP
         gS3TfiD/yvB/2bapE7zH1rQEsbbI7LSYjp/9ruS5cD2PfooV4licxCiiuosmsjgvpnQk
         CeuMjuXGxMJidc/PSx+8cGLCEH2rDIdW2MmLTEpSsgEusGZUqHzxHwxMeHu7LdOnF6P3
         NH3MnBQKGkKSS21lAqap2vP9O2Jlq7194tTBCzlSQ9NXy54KazHD5oSFal26MaZFAj2F
         saJnGO+NOYvARToznvlHSjBEuq4cWbYYLns4y/7iQ+2NaFqGLFRQgHvuaMohVAgVrm+V
         PTlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0uOZ3iwE/BH17JAQBdLoZGWfaV+4xttczJXUuAySVK0=;
        fh=opuiXMxjM56jYAY433nmqTptFLMPFmV9f8ZfOZ+qZ+E=;
        b=BOQUa5OErQNdwblU5tzgcGsHxjx+kvJrFPAtU0UFvDc0qdWPEBP/QA0hgkgY7rkhR3
         E6Ro1DDPA3jYH/mikEsb081sUJBnC4ZhAkMOrqRuOY1JhkXs3K/TVzMpEol1J2H2CWcq
         lTs8tRiQX0cPQIHecmBWv4kp/sie8RXVQzI0F156IRFeWQQJBVQkL7nEVcVGrTGWaQwT
         qZ+FXQ8nzP4yx5oWQHpKzxYNQ9erm6o+pfuSxkhkS83FQyhVjEPZ6R1BduJML+HPOByW
         vu5dWE2vLDzaaQ+H3GYl7EM4JHAdj9kfjm5th80dmmJhaUS1r4JDAazF3A4g+ZCJKRRK
         TGQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770589236; x=1771194036; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uOZ3iwE/BH17JAQBdLoZGWfaV+4xttczJXUuAySVK0=;
        b=G+M6OvwuRqtelmqqe5n/e/LRbc38jX5//yt2wmJgOdAZU+N03F5IuY5hcPK22ZDCdM
         AmgxmAOzzB00qwuv4uXA9QP4/0RojGHKuar7dfxP9uqIVqlvIFwDYgA8aegWWoG3WaIt
         Tw+O8dwlAMx9GaOXRWeiY8yyOxf8JsfCVLXATd6UKiZW7ceD1BBI7F+Tw4zGDF/9e3Cj
         uqCQ0GS/us9OW++j/UOzqwpNJCoQcF3JkYX7ZSAL+OFvcqkkrfdeKiUzU8IYhFK1ojHW
         RqZcMQDqAD8fs0qrucMc+mPQcDuwj3ujj5UrhXWzMDcIEgn3MI4WaBmrQ0uU3bE+ZGrR
         nb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770589236; x=1771194036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0uOZ3iwE/BH17JAQBdLoZGWfaV+4xttczJXUuAySVK0=;
        b=oIBqR4JrGfgMXdXGkPeZi32zCOB2zY1SunIKICcuVmsL0X/aXH+P4wFX1VgZondIVz
         +xp5E6Qc6at4inYC5Ek2R8qdZ/2SFDUjN4xXqLwCAsgVPuqBNfZUuHaYdIoxtneloIeT
         sxBQIlx5pbqMZbPvrRXeWHB9P54dA7e1CeU3mUYrz9410Age4WHZpJ0Vj4ZOFr+vT7AM
         haeNP2G8+pqoYvcCi91JDKGVMH6UEKuQvNFFIY/JkFAkmdqbq3rnwIVq6TuJpgks1s4P
         //PybE0x6UoGYnRwTLSemBeyn69R6+9HchsA8P0nrtgloMgA3UQCDALze+U48ntQtrRJ
         ZF/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXL7PV8uoYD/0jhcnEzLqWIpDUto6FBfHsLW8Yg2cZ8203oJ3SRH3iqs4XYJofZLz+Dn0vJqHYuhGs+xU4VSmg2@lists.infradead.org
X-Gm-Message-State: AOJu0YypK7MraMQz2OGc07TduaQFY9YdTtEmZQK0ScBVXpK2/q4frS5L
	N5ALcPnMgEsZITES6lFOONKrRiXf4cC0ZF58cmLi2EqoTm5jkhCuHre8CWfdlXQFqr0/d+TQ1Bq
	BPdUOiz9CBfuV0OoBYyJDis0Knw56284=
X-Gm-Gg: AZuq6aIlfSgPiP6ifbrlmxlZjS4Tic3lNWm/vzSN85uSYSfILW+Ua3tQLwaMWWeD3WZ
	ilfDo96tP6E1zYL88WJVJFPJilG1QKOB2ozH4hDH3R5YMbr9Hgt2X/ZMyFoZYKJPd4ivW1GdcBx
	5LQCG26BKIgbouG+E4+Riaklp9LSIjmMs3PDlUiN586s9wYqycIDLBSwdZ0UNkt9vHso9kx+saG
	W4DZRekDHG1aOUSuSOSnVooWyM7vwWZ5mlA9juqYxNjYBWhjuF1/VKtclObSTL3kRO6oD/oFPUh
	pY7iz8uEtnn4rYRA7+TGG3KrxLs=
X-Received: by 2002:a05:651c:f06:b0:385:beca:f6dd with SMTP id
 38308e7fff4ca-386b517f034mr27231951fa.43.1770589235643; Sun, 08 Feb 2026
 14:20:35 -0800 (PST)
MIME-Version: 1.0
References: <20260207131803.2834749-1-festevam@gmail.com> <20260207131803.2834749-4-festevam@gmail.com>
 <d41492a9-bb59-4999-8497-e28d03d3a13f@kwiboo.se>
In-Reply-To: <d41492a9-bb59-4999-8497-e28d03d3a13f@kwiboo.se>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 8 Feb 2026 19:20:24 -0300
X-Gm-Features: AZwV_Qic1qNN5-FtSKayD_BHH8s4MiBnriT3eLhue_QE2OzlTzJvDwiSSLFVTIg
Message-ID: <CAOMZO5CmKzrcaVdp6Su+F+uT+nAueroaJcBkKtO3O8N0MWZt6A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: rockchip: Add Onion RV1103B Omega4
To: Jonas Karlman <jonas@kwiboo.se>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, Fabio Estevam <festevam@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_142038_856335_64FE4E05 
X-CRM114-Status: UNSURE (   8.76  )
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

Hi Jonas,

On Sun, Feb 8, 2026 at 7:15=E2=80=AFPM Jonas Karlman <jonas@kwiboo.se> wrot=
e:

> Am I correct in that this is the Omega-4 Evaluation Board (EVB) [1] and
> that the Omega-4 is a System-on-Module?

No SoM is used on the Omega4 board.

Thanks for the review!

