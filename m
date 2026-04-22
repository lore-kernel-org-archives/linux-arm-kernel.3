Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31D3F94CBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 22:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qI6kGELEoPNIDxXAqpiIcX3kz3Y96gemHsRdJV8MIo=; b=ZIuScoHCgQZxS54MRiwFCZg3Xj
	cNfZw2WYYnAwfEJwzYE9Vxoq5aAUpapNRkA2BCZtffunidT6xB9iSdpmbVhq2Rdn+dhD2UKzFDll6
	xwxOs6Dn2/BPamVGpXmiBsthu2Tx+o3p8+BjNi+uf+IaF+EtNzwimWVxHRXWv01hNcuJFMWeuxvSm
	+4DAzgr2xbggr032YNKh29YhtygLVmLF7n9Yyqk4cBenWb4Q/rU4OJOXpJu4fdr+aNN0w64U35WOM
	89kQe0rrMTDySs8GIeb3NrTqTb21YSE5TiBPwQ1p4VBpjyM6mJpqNvTUpSAFSYbOb4G/v0zyaj1cj
	hoyUur6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFgNA-0000000AoE4-0qPo;
	Wed, 22 Apr 2026 22:48:44 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFgN6-0000000AoDh-0haG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 22:48:42 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso2015827b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 15:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776898118; x=1777502918; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4qI6kGELEoPNIDxXAqpiIcX3kz3Y96gemHsRdJV8MIo=;
        b=Z14oN7tjIFI65+g730BORYVj0Yb4rJXtFsyIL0RQLK8DXmwktdzKr15DwYp7wGhZP1
         C5VZN5WQc8NKeDC/oaGeHY/Hdjtl6iRimlFNMI6YtKXpdWosnA12DB5tEEmqZeSNHZTb
         HcgV0hYQSvuQRJjqYFHlLIB4Nk+LotwuuAwKoQOxg9WyBcuzW6QSPoDWoTvoZIA7aND0
         urI+5GuqeSZgqPL/A8GirTJtiywfHN2UAbxGnIDB7PjtGB/BPenaj/WAb+LgzEr7O9nA
         TPC9WX/DEZJv6kAvip2Brf6UnHJMkU19S4HlapfnJDVlPzZWvdSFSC/3hXVRUKlv96K1
         q95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776898118; x=1777502918;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qI6kGELEoPNIDxXAqpiIcX3kz3Y96gemHsRdJV8MIo=;
        b=gzFgb7KTclCDJUTqyqwSZ2P+zdRVqFjPc0XAXY/Yf8o5FrgrjCO9LjYMu0SF/qLO1D
         dzpCel8dCxHpld7gGkL7TSztBy0DGLQNnYl+X96sMLlny+7+cQC96LdVALmDjAMlZP+s
         mAtQkStj6M+jNbMFc9+ez8bXMMQWq+oMxOEIzYQgRH26GGKFWemh+LGX3WYVj8fy+cuJ
         0b155aXXZRkWwKLhOTMuaIBBuVW6LAa8NY0vDTV4eU+8lTJ2NYWjo+vCAv3YDarAMG0N
         4+Ln56XSr1OUDGH44UMTfv+FU2S2xXLWTjC2QJ4Fu26529s03IoZghMAFC1g4/JpTazR
         xcjg==
X-Forwarded-Encrypted: i=1; AFNElJ9oII1dBA/avmt3jnqL/zVWIkxV2xR4D7hoYT7jWOroegPdMmnqc63OjNUiltc0lrDS/eWSLUY77CWh6JqzLV/5@lists.infradead.org
X-Gm-Message-State: AOJu0YyS9inwBvduM3qu79tGzrltHYDd2WSzbKx3AEbVSA68dCih/q3S
	Kmk11KR2HqFvca2mWTvp9ZcAELkNujgyS1ybvOkfE2VNgj2J/LbX8ltZGQnsV6uznTU=
X-Gm-Gg: AeBDievwcKO0eo775d5/MAtXswRVL6G6RnckqW+//mNXWqjb2mJswQQx62+BPoydmCi
	iOHcjsmrQUJ2A9SmaGyiHGx12CBQchyzsOdAT6VziOA6BaSwLNQfInL1MrBqD+3g7Kz+GLQ+sNA
	G/jcxqEyb0fLfKuuOoL3Xr4Yl7nQ3a5eLWSvsoE6nb/axjyOK53gPN2rW6v4j2jcegEwUCGfDDJ
	4qQ1pZp+b+BoG9LXmgMGu1ABzpyLkhByPL7yt3kRc8PyWcRQ+nl61iOiC6JtofYdFrGvh7WLBUJ
	an+NsZokvFHNGz9ks7f7rQar4VAZZmc6Bm/Dn6yCR/kLAvZpkS/qzVyHGmFHBymiDbuZJ0Ueaya
	pNcJiippyelhey668ekA/rF357PJ2IwNeD0UwMwp2XHrwYbsk66mE9sS4qCrPulf3/SDe0n+Qib
	0bpKfnRVTsLzm1jeO+rhQRpK/wj8lTYw==
X-Received: by 2002:a05:6a00:c8a:b0:82f:98c:1465 with SMTP id d2e1a72fcca58-82f8c8fb258mr26682792b3a.27.1776898118539;
        Wed, 22 Apr 2026 15:48:38 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec04448sm21836313b3a.55.2026.04.22.15.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 15:48:37 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Sudeep Holla
 <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Saravana Kannan <saravanak@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Marek Vasut
 <marek.vasut+renesas@mailbox.org>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping
In-Reply-To: <cover.1776793163.git.geert+renesas@glider.be>
References: <cover.1776793163.git.geert+renesas@glider.be>
Date: Wed, 22 Apr 2026 15:48:37 -0700
Message-ID: <7hcxzqr4qi.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_154840_429225_753797C7 
X-CRM114-Status: GOOD (  13.83  )
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

Geert Uytterhoeven <geert+renesas@glider.be> writes:

> 	Hi all,
>
> TL;DR:
>
>     Describe hardware in DT, and perform the mapping to SCMI in Linux.
>
> The Renesas R-Car X5H-based Ironhide board is the first Renesas
> SoC/board combination that implements the ARM System Control and
> Management Interface (SCMI).
>
> This means Linux can no longer perform various system operations (e.g.
> clock, power domain, and reset control) by accessing the hardware
> directly.  Instead, these operations are abstracted according to various
> SCMI sub-protocols, and Linux has to send messages to an SCMI-compliant
> firmware running on a System Control Processor (SCP).
> More specifically, the R-Car X5H SCP FW SCMI controls access to:
>   1. Core clocks and module clocks,
>   2. Module resets,
>   3. Power domains,

I'm very curious how power domain hierarchy is described on this SoC,
because one more issue to add to your list is that hierarchy cannot be
described for power domains in SCMI.

I know you're aware of it already, but just FYI for anyone else
exploring this space, I have a series[1] in-flight right now to address
this limitation of SCMI so that we can at least describe this hierarchy
in DT and the pmdomain framework.

Kevin

[1] https://lore.kernel.org/linux-pm/20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com/


