Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4DBFD88CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 23:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbE832rtYKpMRX+tYnhnQzdSRCBoOQQ9m9+SSD0KKTM=; b=0KJXPJgy4gOe0uUQmZ7I5EIggu
	/QNE7WF7gj/Lk9H9HpafcxXgMD+lYE0NSCb63VhdkXH6uzC8kcz+9L7qzW1htU3f+HjFJaJ6glYz0
	49q8x60Up26I7zAh5jyINgX6QkXX8W/6bNYhdeuFHWcSpsbNaIVu52ffB4iXVPh+tUi8KjIRnBWHk
	jEN1hjV7xsrO+wd1lnD1ktJaE1z33+QyDuZ5FiAYOhbRwkqZQNZIrvI1b+m+3sb6gv1imzYUmWLOq
	Bx902/Ts3VRzEZxTzmfXo2HKoYe4F0XhwNOZxXidKpFk5qcEVAe2MD4Tgtu6L2JdLWapQQj7TopmG
	TOZZRfpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w06T8-0000000ANlg-0qfS;
	Tue, 10 Mar 2026 23:26:30 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w06T4-0000000ANkv-3q89
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 23:26:28 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-38a3fd333eeso3612381fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 16:26:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773185184; cv=none;
        d=google.com; s=arc-20240605;
        b=lIpUDFeD/KzkQZPwnfTNxpTyF3eLGFndnzoNrQQZJMhmpMhickBBVUh29kG05Ssb0U
         WSGponZNXxc/g5cEQ+kI/5iG6J95GWdv3cI3z7Hvf1kpJZduBmi/J8vw506wzs6WoH5a
         jbiLtRc9r+M9spzrYf4WCA1vgz8z2UcclI+NowqZUzh6CdiGcK4ugNgGKrgazDC9+2aV
         Ap/GTQJpZ0ebjSU/fLBLKcv/s3i+LIOb2wlFPCOJBP221RjU4c1+/N6MamcVQ7IwTMmg
         lX+gVCgJOgLTa9D2AAnzUpc13VV51Y4nR0ip+N8J1z7ycmd5ehMsQ72xDyqnYgSAAVxi
         1lcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nbE832rtYKpMRX+tYnhnQzdSRCBoOQQ9m9+SSD0KKTM=;
        fh=+AywwV/rCg1hCa16Edi0hI0HpUlWl6BDcosw6rjNZIE=;
        b=iYBANoO9D6js+XkXyttAejzc0eZIKGQ0LJqmhH912gJABkDE1C0Jsxw8geCCUks3Yb
         OO0l7FeC2Sc72iWiznBwGB9VeUOuFzqgvn95kbdlmf1/TwyipLGchix2eOQ8TKocrVgJ
         Mqa5eeBwzHz+WxzZupK5Uz4bO9f33wLGWUqwsMK4EBW3E9msXQsOSlhNnfcA+lIQm6or
         QaHf9EOkyq8yLg98kX0tXJo8uKUrrD/1JQd7Hw/tReqv8/5T7cOmeqw/3V9PXFQGG5y1
         SkKDw4LWqjNm18jiaNoH4zI6EQ7nswZEBnAgkKE7NM/ugjJ2tLAszxZOfxKYS8U9k+Iu
         JT1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773185184; x=1773789984; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbE832rtYKpMRX+tYnhnQzdSRCBoOQQ9m9+SSD0KKTM=;
        b=U90kFkyaBmA3g1AYEPJJIAhtpuKJeGxdcGdBr1PyI0KbTmE2K2P4TB2rA5p5kABZ94
         gpw4QjlfvCtPvd4Q9Buqc1T1YfRw8D9/h14SFwmu515IaBazwjGyi7E6cp+fTn9YTwwq
         aWwdK9Q3gq9mQVQGfv2SD8tyB5xbsBsRb4ksKWpXYcgl8xGZ7ZTMs/eSsQtXzx9DhIqY
         RdD5x6v01/lVw/tyiOKz2G/YWO9VMQMD0XNXwYDPhEypNThEhniqBs5aPaqVfDVcF4Qy
         jgcj0DZoIqtlwUvmMaDfG/DVqQNaMrtke5/dZB51bqPAosxUlDs3gO8+o0VTK1G1uot4
         1lQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773185184; x=1773789984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nbE832rtYKpMRX+tYnhnQzdSRCBoOQQ9m9+SSD0KKTM=;
        b=i+47wcxpGBsyJVSXHl83CpQM2uKedg+QiI0RAs4JflDNR4JWQUa9IkPB6TEKdaCv2n
         yLrQGbSPaDwH6t5D2KYroGzeW0/oOk9zUu0SkrJ3yMHB/syin8jEm6bOA4VZjWxslBVN
         Za/9NnnrTQsyrVDzeZ7zR5awccx9QLHa/4Ajdh1vjvW7JMgw6gPI2G2JvsQ92KZlTo6U
         CDTXuZK8RhHBvgTNJHtqiaaRQcLEVFsEt2z4J44YqK48nBjrQTujReS+SPztk4hitDd3
         Wizcnq2nSRIbSP96Bk6PCxhmyG4/0v8XjgvgBYzEWXUQNp5DWIaNiMQbDiW+UOF8IGhp
         g9cg==
X-Forwarded-Encrypted: i=1; AJvYcCUY/Pi+/sziN6VVQ2v3HLa9YqeNWMi+GDAhptCD5Wf0LQ9dNJlfB+Umdkrh5RDIsNHbcINQznebIC64b2/fkTP7@lists.infradead.org
X-Gm-Message-State: AOJu0YxDJP7bvjM47Jzu2v4+ytazc+xovIBwB9oHnRV9mKxsIGtcz4qC
	NfmVWJZEIfNH/GTZ0rAtGDqwvwFLWBTu+1gPujlTiOFyTkXkSKp0nmhJDaOfy3qS7O9CERdNMxj
	Nv0fMeowurSj4sDvyWOHmdf4nM/QCge4=
X-Gm-Gg: ATEYQzyTbUl8U4Pm4oQTPSsdC67LLiltsWTDCk19LQYAKoyMMpQ+UEf7viWMmPgToRt
	b5hhUM2LN5ZDmBCz8NwhgVSwq87r0sZ4ZbfAlmILNVCEghjoE5EqAytueILJsz+toBqPPVBzO5h
	OSf2sA+Lg34OqfNcwPTHuNrtWpRUTF3mFTLJToAI4SMA4Ete320UIdPVMHxMFM+uld7nspXC8Xj
	BtYT1CfAcMkodjFkoPAkOWwi/kLEbHFPIHz6uXKSR1M9Udt6IT3gHLByzzoNmUTdLC5hVcZK78L
	yHXvRyCtRGNALvXeucHS14YmyE7Ff+d/ohh7clK8LOIiXnlkb/qTL7Irn+xuQY9vWN2nqwSNpOU
	cOjV+qnU=
X-Received: by 2002:a2e:9e11:0:b0:387:a16:ee83 with SMTP id
 38308e7fff4ca-38a5d01f781mr12942351fa.11.1773185184057; Tue, 10 Mar 2026
 16:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260216010219.2131484-1-festevam@gmail.com> <20260216010219.2131484-2-festevam@gmail.com>
 <47923648.fMDQidcC6G@phil>
In-Reply-To: <47923648.fMDQidcC6G@phil>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Mar 2026 20:26:12 -0300
X-Gm-Features: AaiRm52ednYfXwxvAUqCdpkvrziRMGpVc5js93M_Hig6B9OSV9sZiqzLFMTLwA0
Message-ID: <CAOMZO5CBFq-crZs1Wub=7iaWT1n==Jrv2D+1q38NXd1cJM51+g@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] ARM: dts: rockchip: Add support for RV1103B
To: Heiko Stuebner <heiko@sntech.de>, Tom Rini <trini@konsulko.com>
Cc: jonas@kwiboo.se, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Fabio Estevam <festevam@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_162626_975190_4AE66A05 
X-CRM114-Status: GOOD (  11.03  )
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

Hi Heiko,

On Mon, Mar 9, 2026 at 6:24=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wro=
te:

> > +             cru: clock-controller@20000000 {
> > +                     compatible =3D "rockchip,rv1103b-cru";
> > +                     reg =3D <0x20000000 0x81000>;
> > +                     #clock-cells =3D <1>;
> > +                     #reset-cells =3D <1>;
> > +                     bootph-all;
>
> I don't think we want u-boot-specific properties in mainline.
> They are normally kept in separate -u-boot.dtsi files

If I keep them in -u-boot.dtsi, then Tom Rini will ask me to upstream them =
:-)

These booth-* properties are all part of the dt-schema, and many SoC
vendors (NXP, Renesas, TI, RiscV) are upstreaming them.

Just some examples:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv7.0-rc3&id=3D256feb5be482315a91c1bd1a1808276f57ef76dd

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv7.0-rc3&id=3De05f6566bc778bc1215283e667e18692d16b25f5

Would you be willing to accept these bootph-* properties for the
Rockchip device trees?

Thanks

