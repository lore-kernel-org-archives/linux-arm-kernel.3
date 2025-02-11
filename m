Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B98C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 19:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9e/sGwyL68UNjItnpSAp9MDvTFErGvwXM2lfdp/wyfc=; b=KoyJHRAsuomy880jrAcMPDTNY3
	yXRv5BnxOOjvUrr05nnnLU2rXoPWm3X92GmgaAxjEhE76J6fxauu0VQWacq/IjbnPWJSWydcrJ1Ac
	hMjXl3gVzozMDEmWl6l2U7o8m0xQeczrpWEpVVAsfZO4smk5jDVBbLmt612326epIyeJDhpVL9p+N
	IpUYXRccfH0GiEyBaAzmpZrQbPj6OxkAYFUfnTkNB2s9dZYVlpWLxtqaXkyg01oAvC3Uka/xDrQIQ
	JAbS/Ws4vD0UCd7pwkI3l7ltc226u4aWiUOZrHT+/DlTIp9zN2WSHVfxgUXSdmntGVz0/kzOfV4YM
	sAs9m/iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thwGI-000000055sO-1lMK;
	Tue, 11 Feb 2025 19:49:38 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thw4B-000000053hh-0N0h;
	Tue, 11 Feb 2025 19:37:08 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ab7e3d0921bso159571166b.3;
        Tue, 11 Feb 2025 11:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739302625; x=1739907425; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9e/sGwyL68UNjItnpSAp9MDvTFErGvwXM2lfdp/wyfc=;
        b=nUAJLQiC0nXYEyPPPEzcZFevHv3uo5N/uZ7IoLcqjwOdJPlqav5pn7r/urDvwS7Gnz
         wkdqY5a/pt1kXGOt5jeexPEstmeCxpEqOEHyJfl0bPQCADOoxkk5IShMA+1AG9a/oNOT
         udmTyHawRIEesVkDz3DqJ84ziu8JGtmYTN4Hi2vIloy7G20dFiCPn8I6sY3uTAkpdtPi
         pHIP67t6fL/mD+ZlCT3DG/OwPgcVcu5/tjp7blDuBsy838NgvYM89qexo5LsaFZyW8PV
         VOaxHUapdoRxBG65yCTwxciZ/2NioqOWFgHo5mystdFM7c/zCsZh4U1Qv3+zl+f2AYG0
         +zxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739302625; x=1739907425;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9e/sGwyL68UNjItnpSAp9MDvTFErGvwXM2lfdp/wyfc=;
        b=JrrZ63oFCPwybszn2KzRqk0ZAHBSNKkTcE7+Y2VE6F9MdPdphbuj+TEaCVWISmst9Y
         bB5R0sqy8fQMF0fRDDNLM1L+w8Mdn85+SsY3AekjS+sXTGh+Yfb1NT9dFb/jGZpwilqG
         yD2xUcbyhkgxEnpexCp/GVTstLEkg2SiX3oDueTicXQAWEpWd2VEMKS83F50m8sXt7NO
         BuweQCXroQ1w5w1W/P0pxshAtmwgBamfodWT/OuT2Xto55Num1czQiDTLbbPF2LJ4FtQ
         F22O5f2BW5embVvI6KFMCxJPygRLHKbclA13j+qJqdNvZUV8RLCrPjZErJgWDW4bRIQ1
         x8Jw==
X-Forwarded-Encrypted: i=1; AJvYcCU31OIMDi80NF4FLOzcQgAXZnxohbXvxuo2obWdrY6n4JT2Byss2uc9BqZRTCxRAfiZZoexpaKkv1FFhOs=@lists.infradead.org, AJvYcCWKPiGy3rXjO0sqAL6ua8nQFb6d78EYO31M9JKcXdv8ANaXVlt7iualGUTu/oJLwLE3vuTW2LFq9349rsxNNgg1@lists.infradead.org
X-Gm-Message-State: AOJu0YyxgTQeCyGMIY4XYKVaVOieNZFjmDQlZl/t63Gokag5/SWz9hPi
	Srw9t01qjsWTM67VJ3iC2CWlLz02uR8rekiu8wr0boBXBvkh36o8
X-Gm-Gg: ASbGncsMA8zqDFLdBYccERbAK4bpWkT4GBc03OQVyeTJ27bdcwjPkaN9Fwel/gzBsac
	DNArTm2Y7mB50CHMwusFyiE9Dxsdq3Wul9Wwicb54BsFLBpnO0gDitaP0PcZpJwCz4naJKZKm3x
	oLy7rv/jqn/TkcclL9pD4uN67p1+2uMgrqXTXq3/EPx5N2zc5DLlTUYvifLJ6fR3s1fIPb2uCLy
	VkPfXdiRKOihOkGwBl3Pk17HV8SHpgrFww9WLYH3QPIy4IkHt/X41RK2IFQUAlzOFFuQNv/XSRs
	daCU5SmPkFgv3WJyLlGzlvGo0GNvkHuW
X-Google-Smtp-Source: AGHT+IEQ/slzGtIIDpKNl/JqYbFTtsrceMpYlWtOML0fOzvbP4uW4Jm2p4lFLsInfuuv0UWM2bB/xg==
X-Received: by 2002:a17:907:1c17:b0:ab7:d7fd:6250 with SMTP id a640c23a62f3a-ab7f347a6a1mr18121866b.43.1739302624828;
        Tue, 11 Feb 2025 11:37:04 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7cbc313c5sm364663666b.150.2025.02.11.11.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 11:37:04 -0800 (PST)
Message-ID: <ccadcdf720d6b1055165f1404fafca9b1c6c54f7.camel@gmail.com>
Subject: Re: [PATCH 00/10] arm64 support for Milk-V Duo Module 01 EVB
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: soc@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	 <inochiama@outlook.com>, Lee Jones <lee@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Haylen Chu
	 <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
Date: Tue, 11 Feb 2025 20:37:01 +0100
In-Reply-To: <77c0db160bcaa7c2a68c04a0d33a561b2834f764.camel@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
		 <eoeyutuu4mrpsu7snkk5ll6kmm4344qsgbnncss6gerlcvvea7@usuf5v7w5ffp>
	 <77c0db160bcaa7c2a68c04a0d33a561b2834f764.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_113707_125326_CA02D10C 
X-CRM114-Status: GOOD (  21.14  )
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

Hi Inochi!

On Mon, 2025-02-10 at 21:55 +0100, Alexander Sverdlin wrote:
> > > It would probably make sense that the whole series would go into SOC =
tree,
> > > even though technically nothing prevents the reboot/reset driver to c=
ome
> > > in PM/reset tree. If everything would come together, `reboot` command=
 would
> > > work out of the box.
> > >=20
> > > [1] https://milkv.io/docs/duo/getting-started/duo-module-01
> > > [2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
> > > [3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm=
-v1.01/sg2000_trm_en.pdf
> > >=20
> >=20
> > This reboot implentment across the RTC and 8051 domain, which is
> > still a big problem to be upstreamed. This should be designed=20
>=20
> Now I've got it. The problem is not in the reboot procedure, but
> rather how to model this thing in the DT, because of all these
> unrelated functions brought into two HW address spaces...
>=20
> > carefully and needs further discussion. Adding these two syscon
> > compatiable may be not a good idea and cause some problem. I invite
> > Yixun to this talk and he may give some useful suggestions.
> >=20
> > At last, I prefer this goes to an separate patch series, and
> > implement with rtc device.

Thanks for your hints!
I've completely missed the RTC driver in progress [1].
I will provide a patch registering the reboot handler on top of the driver
as soon as it's accepted.

[1] https://patchwork.ozlabs.org/project/rtc-linux/patch/20240428060848.706=
573-3-qiujingbao.dlmu@gmail.com/

--=20
Alexander Sverdlin.


