Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4122FC72DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 00:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T62eLvCEArRzYZStwBuW/DskGoPmPid6WBtJuVPOf4Y=; b=aif+RTcngi1gKT3qHmIS8qMDM0
	Y2/hePeZhINsQZsayKkPeCu9K119IWCrNsm2vRWWJlBKnoxO3+te4/u/niog51eSYlSp1rjbyU9hi
	s2MxwRLTmQusxBkmAsRtizXGYdZ0qpAGfzoDcjNm9T59W5U1dFR0IVdCDcrGM/njvqiDlHfWm1ytR
	laO1rxvsHQWW7tLxJ9Fpi0u+kgnhCMTCD0ESWygMNw/b7qKYCgpxNzBkxGZPCCUDW3UOUIuX9a5bB
	rn0RvYiJkyiK56Ths+9OV7ej0wUe7k7/U2JvDglviHeSbVbGusuWoP2E5w2z5MPxzsIxpCVWBeGMv
	cuNCpLag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5C3l-00000002OhH-3fJ1;
	Wed, 25 Mar 2026 00:25:21 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5C3j-00000002Ogj-2fOB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 00:25:20 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-8cd8c6e365eso428446985a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 17:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398318; x=1775003118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T62eLvCEArRzYZStwBuW/DskGoPmPid6WBtJuVPOf4Y=;
        b=BF4fhq+cL4EfhwM/N9m6UzZQAF6Yw+C2gkRYPOmar1OjFptmFsTn/zzNN2zqXD6P5F
         gtg+MC00Ts7xS+bi6wutGgJH7qdJeMZ/K4GkIGwDXGQbh2nIHJ55Ab7BsapjfJ6vYy6L
         WaqtnZshCbEMq2nCu2vSQ7U+B69ETWhbQlckHtRWOUoxcllZfzew+ywLpt+JaDmTCQYc
         4qTz4dUlazLs/OKFY4a1FL2h0pzuVXyvvWYxzWRIs5tFVyNajA/3v+z6K8+2HJMcgiLn
         tE+hzXIHhzPrttapLZa4I0S7KRCs0QzRrEjyBCKniFdklLzqceStynXuUmjbnlzUTU4/
         4SRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398318; x=1775003118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T62eLvCEArRzYZStwBuW/DskGoPmPid6WBtJuVPOf4Y=;
        b=eFP8AxeuqwUnwlVEF7Oa/MN8jtteUQMMkVeMBhdXt88qps0zMGa+IWJSyhis5VagGD
         lHMFAZWDc9Wp659LdeDvWQSJ94G47oF/+7dEzer5bJg8MwIAYKecCj4eisAHhNcECJYQ
         N1xMame1daly56AKf7199MT2xQoENGBZxL3XViPprLkfcDxv+2wCSlGJ6MG/d3QlIu/l
         vSgRvnu94AhlkrkWcJan2LFe/aALdCpRMZOHd2HGEqrXapEZ5xLKsD8Cj46q64La7Tlm
         ubAXTmdLhyK1M4V/GkPM/85IjT+gLfb43LQZVvantZDwYL4n7FCpdDELjBRAHeQPMOwF
         RMug==
X-Forwarded-Encrypted: i=1; AJvYcCVmfctQ0l0mfsOQd7KjAYXwjgkxcgdZPgqxH4wMOhM44/Oy/o8Mbfw2KEyqI6PRm6U36Dx3oWDm1tP369bDyCn0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwbf3sPTMR+VICpwngX4vlZ/jG1men/gISZJ2u17nvHt2gNUOY
	C9usDwCT57aJhENZ287dNP53eMg3hMr4I4s8F++Brq+JdPFJa7sF1LXo
X-Gm-Gg: ATEYQzxw+Cs/MGERD4rQMnJZsX7nnftc1s6PSTO00IT9cMTStJPtT3p5qVICowHX5VO
	3DIvzG2HlzKtPwFlyNzhUD6MIFsIpNj418GwU8jt7j98uxKvZ681qPT3KDc9/Pst6EwG7qYY9gV
	6mGuSBgbKbxXBabbjvMBUkQvBKeH5J+yUwkpA70CQqPKLc9K9G+ezcOd001shdKUu90QggZOLQw
	pD08l+0HGyiQFbE58mZnMcjCQ+POBHibs4awxgcKm+7uRfmNimAoViVyxsyFVMbaZcjZki3739h
	8Pxl4VC/f+Wj2mePw2TicRUz2m6EgrGUD5oAgMDhQSU3KQaLdcQYUPJktPXsTDSvs54uG9vFhOF
	9lD6A7NeqaZywPZdn3lWexb4UqWgqzk3TvdtOVWcN5xXq4nzAFyapGwQZAubnZ4Q6HZEG6KCUx+
	YDfSLbYCi8+bI65oi9Zedw9+jLzJGsnvOHPldtdxjn9LHJgOESzQB1a8ZOF+AjADzoI4hKxTxUp
	vj69R+Livvreg==
X-Received: by 2002:a05:620a:400e:b0:8cd:7f7d:b089 with SMTP id af79cd13be357-8d0010523b7mr229964885a.70.1774398318140;
        Tue, 24 Mar 2026 17:25:18 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfd55e79e6sm1017406885a.29.2026.03.24.17.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:25:17 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] soc: sunxi: sram: Allow SRAM to be claimed multiple times
Date: Wed, 25 Mar 2026 01:25:15 +0100
Message-ID: <2342486.iZASKD2KPV@jernej-laptop>
In-Reply-To: <20260324164357.1607247-5-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-5-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_172519_677749_C52B9668 
X-CRM114-Status: GOOD (  14.55  )
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

Dne torek, 24. marec 2026 ob 17:43:52 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> On the H616, the SRAM C region is an alias mapping to part of the VE
> SRAM (accessible in whole at a different address) and part of the DE
> SRAM (otherwise unaccessible). As such both the VE and DE need to claim
> this SRAM region to prevent access from the CPU.
>=20
> The SRAM claim API is designed so that a "claim" routes the SRAM to the
> peripheral device, disabling access from the CPU. So long as the written
> register value is the same for all the claimants involved, allowing
> multiple or repeated claims is trivial. This is indeed the case for all
> supported SRAM regions. The only known SRAM region to have multiple
> different settings is the SRAM C2 region; this can be claimed by the AE,
> CE, or ACE (assumed to be AE + CE). This region is not supported, and
> likely will never be needed nor supported, as there is no documentation
> for the peripherals involved.
>=20
> Change the SRAM region "claimed" field from a boolean to a reference
> count. A claim will increment the count, while a release decreases it.
> The first claim will trigger the register value write. The driver
> otherwise behaves as before.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



