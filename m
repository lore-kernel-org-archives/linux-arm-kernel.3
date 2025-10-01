Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BF2CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 09:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95VNAivb4KtoR4t1T1BdFRDUAGxRsoT1vqmM4i3dGG8=; b=YQpBqtXMxpTKQLbC/Z83o3A/9L
	ziQM3KewW6bwKoaTfq3nZ0mJirExNN840bUwH4uwiw+q6sewUQ0V9lnkDaLDeGgZW9Ov8rdqZLzPq
	FTfQojroiLpvRciWsUQ9g/JJoMlZ90wZymeajIbFndCctJXCtKpIiSHjzFVbnQ8y+XovsPiuWVwWc
	rK1Vi1VQLLaa+V4iS6iREOX3SATjj169H9Ld2IfIylrfBc/FriEOdB3M65N+7jOewf+/hmePIfyhT
	CrXza+QA0VwfPe1XJV+6tD38mqV3LzxNenNITwPLrpIYQhimqux4DleKXT7FzL45Xd4U1I5AYd083
	k/lUuAbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sjF-000000076Ic-1pD2;
	Wed, 01 Oct 2025 09:02:29 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sjD-000000076Hk-00LJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 09:02:28 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3306d3ab2e4so7874418a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759309346; x=1759914146; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95VNAivb4KtoR4t1T1BdFRDUAGxRsoT1vqmM4i3dGG8=;
        b=JagIYk8OWMospPjdo8NVr12dBqWtytzJzAjR5Fdmr1vEvoRIyXcSZFs6O+KYJR/R0r
         zcVqh+a/1gDmQf6VVueRXNbONEGyIZGAm5tBxQ7k/hymGLwALwO9uZmAU7T/0ucrQIH9
         RusjAcQC7b2xS8FOxf/uVVCoYMh/D3CSrlruvUi/OXYmLd+nAiLeptLkwHABo66kjRcC
         aXV/woA5ceygoY6gNYzZbEXRB+hgxTPdmrtwnyefDgo8ybL8om5Ymq90EbcpivO2/r2i
         BgOa5AzHC3bgom4hiWBMytLXdTWt/+Diy4d44wLlfntWZDHuhKEoJYNdaYQDFziERXhC
         NmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309346; x=1759914146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95VNAivb4KtoR4t1T1BdFRDUAGxRsoT1vqmM4i3dGG8=;
        b=nlN4pwm/ld4A9GmO9Tk7nqMIB0mIW9GzFcxQByPqqEKs8egg0f7Lt49A4q+PKg5FQG
         TproUWKh6F3ovHXA3pzgq/JDPYH/So/OOx96+qjKJbd7sKqjfaB7I+o6diVCCy3KYbCi
         LkVmVAIRSl62pyOMzI62ZZao8kzb8DHneC8ZzaeRKBVvfVFlS9nIIRowMVP8y1tYs4EO
         7SNxs94HvCetwXsqU9bvDtXvmfu6hm7asRar0ITEmDWiv+0ScNR/6lNN+U5InFJIqG6D
         N2SnJSdhmanlx+gGti0u92pcuAKzy6MqV3NHc/zX9tp3GndHL/RdOosxIDDGHKMq1YqW
         5qBA==
X-Forwarded-Encrypted: i=1; AJvYcCWcESjRKMy/1udMsjMhc/QABxgFyfgMpbc+tnrVp78A9UN2SYkSLXcLe26mkjzkizQqJoM6hwO5e1Uvf0Nrso1W@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj0YMFLCpP/EtQfBrHRU0vtYU9wXbHIUsc4I9xMuQVmLXuunNM
	IcOBXTmeJTXBCFZKMU0bdfBWbOhFW1U5bOnP7cUPCfDCKrbEsx/WizOlotI3reXO2SUoHJ6sWhq
	JCHJKK8RtvIAonh0tTyRsWOl+JDTi+aY=
X-Gm-Gg: ASbGncujRkFc15xMcfXXsZzk04NuSMqwiHpiRFUDDLX4KbzExUKf/u+OEUVxRzVA8LM
	RYRByWFwuuP9+dq7bGyXzEec0dea3mv6mlK/gG/7deUXBGq/E20WRv1uLxMqz6FH1tM46o23Zjy
	4fuLkfPgjyK7gvA4lbSBZRM4a6IJ3jnIs0MQ2KLKWFDRB/BAl5paBVkQ1g0pTGEgtOzC1+gpdLf
	1KN9stOpXo+hC4fUb4xynczkZRMC6QkQhr3j/HVF+Llm9OM1NuhHZf/+I1IcSCal7paHv3t05Pj
X-Google-Smtp-Source: AGHT+IHpOHSWXjAvp/DRP8YSuqG/pR1Zv2Roxkvp40cPVFhkS4OWrC/GHFGw2hOP/qUB4JZY3u3JjNI3aeVWwTwkhfo=
X-Received: by 2002:a17:90b:3850:b0:32e:3f93:69e2 with SMTP id
 98e67ed59e1d1-339a6e9d356mr2831075a91.13.1759309346075; Wed, 01 Oct 2025
 02:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-yv5_add_dts-v2-0-39a4a8e3c9e6@gmail.com>
 <20250924-yv5_add_dts-v2-2-39a4a8e3c9e6@gmail.com> <dfd8160f015b405623aa7a4b9e69eda2ad1c5df5.camel@codeconstruct.com.au>
In-Reply-To: <dfd8160f015b405623aa7a4b9e69eda2ad1c5df5.camel@codeconstruct.com.au>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Wed, 1 Oct 2025 17:02:14 +0800
X-Gm-Features: AS18NWARSidOHUaRxCTj9BQiJJMS4I5tkjVU1GYlGC0PywCxUaMgQ66iwX6WNYQ
Message-ID: <CABh9gBedqTb--Q27o11qCZ1cr0xrsGiYNDqRDwvG3Ho=+uPRQQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
	Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
	Leo Yang <Leo-Yang@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_020227_055685_427E9932 
X-CRM114-Status: GOOD (  23.55  )
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

On Mon, Sep 29, 2025 at 10:54=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Kevin,
>
> On Wed, 2025-09-24 at 20:28 +0800, Kevin Tung wrote:
> > Add device tree for the Meta (Facebook) Yosemite5 compute node,
> > based on the AST2600 BMC.
> >
> > The Yosemite5 platform provides monitoring of voltages, power,
> > temperatures, and other critical parameters across the motherboard,
> > CXL board, E1.S expansion board, and NIC components. The BMC also
> > logs relevant events and performs appropriate system actions in
> > response to abnormal conditions.
> >
> > Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> > ---
> >  .../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts   | 1068 ++++++++++++=
++++++++
> >  1 file changed, 1068 insertions(+)
>
> This misses adding the devicetree to the dtb target in
> arch/arm/boot/dts/aspeed/Makefile. Consequently I don't expect this was
> tested with `make DTBS_CHECK=3Dy ...`. Fixing the make target and
> checking the DTB yields the following among the usual concerns:
>
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: ethernet@1e67=
0000 (aspeed,ast2600-mac): Unevaluated properties are not allowed ('ncsi-pa=
ckage' was unexpected)
>         from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac=
100.yaml#
>
> Can you please address that? You may need to update or introduce a
> binding document as part of doing so if it's not a matter of removing
> the property from the devicetree.
>
> Andrew

Thanks for pointing out the mistake.
I have submitted v3 to add the missing devicetree to the DTB target
and to fix the error caused by unevaluated properties that are not
allowed.

Kevin

