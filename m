Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9AECAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 14:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Glm9P9HTH7GF2LUGNVtDEQmwup7tzZ0lSiiqddi2yqw=; b=l43fuLvqV4BkFdYOUNAwewkcS+
	EbX25H/I8GwucAcbnfaXaL6qw9G/m8xNtzkl7epQ6nlRHLO8qLwfz/K6pUQJOektEuTW6PHgKz15T
	Wh0/jPJM/FSwu4NsOTqSomexqUG6zgXNN0LtaNXtwJNr4A4f+XrthgeZlLMKwVr9hDvl8Rt0H2s0c
	b7GMl+Ycc6ijcLTYpkZ5kauxka3l8ouJIK5s74CcN8BaL7VZt2tYchYFYJ7nvokq2vN71heecy5Ov
	GOj5jM7Jz5hIUYlMQ/HhO5Z/fj/Ax9AShMWPIob1jtp0hCfH6lpG6a7JyGFHQoivb1kNAfL0IRf2j
	COLxDNEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mwM-0000000A1ti-2Pw8;
	Thu, 25 Sep 2025 14:27:22 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mwH-0000000A1nU-0K8B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 14:27:18 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4db7e5a653cso4979431cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 07:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758810436; x=1759415236; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Glm9P9HTH7GF2LUGNVtDEQmwup7tzZ0lSiiqddi2yqw=;
        b=QynjFFOXmt+u8YzGLzEcmxRnH9UpRSrSwQqz5V3M4oBewBCqDwTiTt6t6CXBNwgsQh
         RCzx/RQNq/QddQd5ZmneRcYD4Ier2FpEjI8is4Pi12/OdczWcmmT9S87RfytJ2hz9xl1
         ESy+sU/3kuTZFK/FApG7DkomjENM3ZQhDEK++ori/Nc3pp85m4MsXE+mPHnNup0LHVpS
         ZUahUTWPTAQDSyJu/Mk8HBw4AAmdludiQVY8BAYBknWktmMExuvBLm7HH5hl06ED4Gky
         T1Woa3RmYhztkNFkGD7M0tCT86UKGSi/nqCEIkYPnmq8XeiorTaImKPX8NeFHMQGvo/G
         FUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758810436; x=1759415236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Glm9P9HTH7GF2LUGNVtDEQmwup7tzZ0lSiiqddi2yqw=;
        b=DDgMxw/xmY3ZPNzpcbqlISebBNW6flMKMusV+wBA2kagy4x7MiWVkhG32PLOFv7MZE
         zSMPCI4iP5CO90xI81a1ALpavTCFa3ec6JxO8M1YTBKVjEvDi6fBIP14zfpTCk11VGpC
         I+buawqy9zKJRFyNYvbuvcbnSklNS5Y0WS+wJWifU5MDrySElPMsVkxf7ncHMzO4Te/H
         VSXz9WFLPmbml7I8O0jmba3JRBAIbm/gaEua4mHit6KBboY/ldaxYDGO9fHN0cSebDAu
         5669YbsBRlcGFrJ3dGh5nWE78/DnbYdcjIU3YFIwdfoDSAOlayhHpwDyeAHmePYf1SjY
         lQtg==
X-Forwarded-Encrypted: i=1; AJvYcCU2uyc+4LOEX3n94ZDtAi+riLygRONnqr0HpPb1stKt4OvBzKn2bD8pdeAL8Rioo2tNhyCmmPexObHNOjr52Td6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6l9iJpk5FJiZMKRcL7bR6YW/nA69p2J6WlkK9iJpr/DhGHN6w
	L+KGXk/7Qa8gT/CxOWA7rPe1KAsPxjAncgCB1fmKFhirP3rjZz+IJ5Zd9RPGEjUWvDm8Csvtqvo
	ywQfksHtpSIB0Es6HnUKx1Xja3wGKERg=
X-Gm-Gg: ASbGncuriLdkHz8mAC4OYKGCJCTlVLq603+aYE8f1huL2htpa3GaZGNVOoRcwNhXZnd
	Vs41+0uuShpbJz2HOHKA9jrQhmRxkaFVoLruZRIkkLm/+JlSkqOF8FgSp3d9OE5Q20ugQiFPaHi
	fvsw6lTZiUvO4TGkFMBpyvcPH97yk568uw6vsH8isFFEKyw7vhtbCkP7MyjSldM/zcdzpUvzKV7
	T14QKNKStkd5E9kxx8=
X-Google-Smtp-Source: AGHT+IH9fq+ZHarv12E5Wiwa5ANc8v0SLu1OdwXvzSahIaMx6BArGuHvon1RcjpXEhOi/ie1rgfJtvwPRNtpXcis6uE=
X-Received: by 2002:a05:6214:5095:b0:7f1:3094:306d with SMTP id
 6a1803df08f44-7fc400b2c46mr54245696d6.47.1758810435646; Thu, 25 Sep 2025
 07:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250925092037.13582-1-jjm2473@gmail.com> <175880949051.820269.9096832740960574577.robh@kernel.org>
In-Reply-To: <175880949051.820269.9096832740960574577.robh@kernel.org>
From: jjm2473 <jjm2473@gmail.com>
Date: Thu, 25 Sep 2025 22:27:04 +0800
X-Gm-Features: AS18NWD4junFDrz8pZg4TpLnxjmQYCHszyF4BKlv4AvixoXW2PGMp3AIFbDTSgU
Message-ID: <CAP_9mL7RBoy_jhEp4CU7FXtc19UtzP0GKuE15y0isF=bF7XGGg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: rockchip: introduce LinkEase EasePi R1
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: kever.yang@rock-chips.com, krzk+dt@kernel.org, heiko@sntech.de, 
	alchark@gmail.com, linux-rockchip@lists.infradead.org, didi.debian@cknow.org, 
	pbrobinson@gmail.com, honyuenkwun@gmail.com, naoki@radxa.com, mani@kernel.org, 
	neil.armstrong@linaro.org, linux-arm-kernel@lists.infradead.org, 
	quentin.schulz@cherry.de, jbx6244@gmail.com, conor+dt@kernel.org, 
	dsimic@manjaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	inindev@gmail.com, ivan8215145640@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_072717_123893_236337D5 
X-CRM114-Status: GOOD (  21.11  )
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

Rob Herring (Arm) <robh@kernel.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=8825=E6=
=97=A5=E5=91=A8=E5=9B=9B 22:12=E5=86=99=E9=81=93=EF=BC=9A
>
>
> On Thu, 25 Sep 2025 17:20:34 +0800, Liangbin Lian wrote:
> > LinkEase EasePi R1 [1] is a high-performance mini router.
> >
> > Specification:
> > - Rockchip RK3568
> > - 2GB/4GB LPDDR4 RAM
> > - 16GB on-board eMMC
> > - 1x M.2 key for 2280 NVMe (PCIe 3.0)
> > - 1x USB 3.0 Type-A
> > - 1x USB 2.0 Type-C (for USB flashing)
> > - 2x 1000 Base-T (native, RTL8211F)
> > - 2x 2500 Base-T (PCIe, RTL8125B)
> > - 1x HDMI 2.0 Output
> > - 12v DC Jack
> > - 1x Power key connected to PMIC
> > - 2x LEDs (one static power supplied, one GPIO controlled)
> >
> > [1] https://doc.linkease.com/zh/guide/easepi-r1/hardware.html
> >
> > Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
> > ---
> > Changes in v2:
> > - Change deprecated "rockchip,system-power-controller" to "system-power=
-controller"
> > - Link to v1: https://lore.kernel.org/r/20250925055906.83375-1-jjm2473@=
gmail.com/
> >
> > ---
> >
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> This patch series was applied (using b4) to base:
>  Base: attempting to guess base-commit...
>  Base: failed to guess base
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/rockchi=
p/' for 20250925092037.13582-1-jjm2473@gmail.com:
>
> arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dtb: mmc@fe000000 (rockchip=
,rk3568-dw-mshc): status: 'oneOf' conditional failed, one must be fixed:
>         ['disable'] is not of type 'object'
>         'disable' is not one of ['okay', 'disabled', 'reserved', 'fail', =
'fail-needs-probe']
>         from schema $id: http://devicetree.org/schemas/dt-core.yaml#
> arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dtb: mmc@fe2b0000 (rockchip=
,rk3568-dw-mshc): status: 'oneOf' conditional failed, one must be fixed:
>         ['disable'] is not of type 'object'
>         'disable' is not one of ['okay', 'disabled', 'reserved', 'fail', =
'fail-needs-probe']
>         from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>
>
>
>
>

Thank you!
"disable" is a typo, should be 'disabled', `./scripts/checkpatch.pl`
doesn't mention this.
I'll fix it after review if there are no other issues.

