Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE2FCA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 23:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/zPhhqSzZgiqvCy2v2R07ljbiJnf/kj+cRVGXz4l2o=; b=TPtgQCR62D80KtdUUiEp6CUIco
	XLYnhsVWQIQ53lvSpSMnq9p8jOStgeV2VzaK0nXF3OC87Tp5DsZegNl+uuBsw6djUFnOQkE4TxHRB
	02Sli6qpWZYJwtbtng+NCmoo6WxXb1VWpkwlgFFroK+iOaLQaCly05WRq4gyYKREgdM9kTTY3dt/T
	Zm4U8aBwT5EH5/rh5/RYwtqeXScXgcIOqDL5//t68urPtuqUChZs7R2pBE1xHH3kgildv6pWq5fSQ
	XlhR8eLi945KAwt7EzKi55+iBT6jG61stqfKHPuz0aIwpuTBZTACLkqGngllrP67OSqtda5UFOtgy
	ff1mnzEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDs6F-0000000HKOg-1IHC;
	Mon, 05 Oct 2026 23:28:04 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDs6B-0000000HKNX-1WJR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 23:28:01 +0000
Received: by mail-pj2-x00.google.com with SMTP id 98e67ed59e1d1-39e501442e2so807775a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 16:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791242878; x=1791847678; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B/zPhhqSzZgiqvCy2v2R07ljbiJnf/kj+cRVGXz4l2o=;
        b=SigZaYHw1/FRNVSglcGINAYO8Q6Qf6XFc4W51LkL6dQTOTqO8s9E5jq7SOylGTGbJ9
         m3ztyr6akQL9mW7Og27NF3G6Gw4aTBGYDUZ8oxUNK7qnsM8wNVxmenDMrOdPqjysIC7B
         iBmWvrGXsyqxS6LHEdHtxlHCYubm8LkQOB6Gw0dCi1JK5NrqujR8isazQOXWDc69vazo
         TZGz6LNJFaKT9yenQs6jeRvTk4hLC+hM3UTUQXVSPXfvjn9T4oYa/IkSz5KRaBqSSLE+
         l+IekWJMbjP3eLestdkt0Vk5sno/xDKGg35h9ag8Ld1vwGEJ+3jybR5BOn/Z3U2Pwd6J
         VDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791242878; x=1791847678;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/zPhhqSzZgiqvCy2v2R07ljbiJnf/kj+cRVGXz4l2o=;
        b=MZXMGcCIKBtqgDO+kMuwlfsoDFmyn46h1RH5bjFVFpLpvSK0cnb4xbsl5TwMYoivH4
         45Nxa0dFqYkYJlniEyMYp2yDAtAN2b1jszz8iFqedVOErJvIjGCHtqdNhGJr/f/I0vTF
         qtoQH0I7KJvVI7cEiEHUK32mwJ0td1mcwLx9D4VqYiyUYW9q/M4ce4ffWMrojLJa2GoV
         seB5TQxcVb3qElcpCg3YQTYvTiHcnFzCEYUgblwrzxN0aHefhHimlDGAnpIOSho1BIkZ
         gpPmEKG+W+htTa9inxU16rwTIOVgzkKfXEI2U+Tcii9Jwprz6T/r46SMxTKxUXRWGfi2
         FQcQ==
X-Forwarded-Encrypted: i=1; AKwUvByrpgahoeeM+2wNq9WM0NUVSoiKzZWGWh4a6J3zpgInLUnm1hz6wL9N0N/d2bRVBbrDCMvHuV31tlGpGmHWFeXY@lists.infradead.org
X-Gm-Message-State: AFq9FYKd4URnMuqj2eR5iAt7KavFkU/f6vus475sEZrkybLGQ41cOWfb
	ysuOhPQs9ct7MCPFgKvksapfjUleYJihGMiLPQ7yLYvYH2NBoAQ7lZwz
X-Gm-Gg: AYBFou2cawxLZW6NvbcNiU32aI9R4846vt4JzaRpN/KmMhOgIjyo6BxE2WEjHVyXKpg
	ztBV0vxpnBZChalIz2pcyX5uqXJ/5DzP3mf31H5cR7CwGGDdFePVXO8pS9OKXo+W7ClxR01Kknl
	WEeOApA90KbtkRPmk71SbVTHsvaWqIWtan39URiyBG8eB22+JxquZh3qHxeCyD9etXM2euFiafD
	PgHSUqN1Arx5yFOsGzX2zQ2cXiTmyRAdZAM/AV30rGZD+/ZmiT+ffLMEDpLijcIvl3PnFp/g9qj
	KIk6J52MdDZWgBDS4B7X0aLWVv9oXvNeY8KoiPWTRkiYKMkTkl1jIEfkkhQZnypH7k8yd/YqN0M
	a2HsEtYDgl5Lo8RHHWr8P3Uv/LK2ad7tXR5/HTh5DnbveA4UFTvg4XzO28BJHypI1J1G+RxUohC
	ldp8+WvFIMFCNb7GcnBjFdSnvQAGLa7WYwjlRrt5FiYvejbpO3vLtu3ZxwLL/osIY/f1C/rKbcn
	bMek6sn
X-Received: by 2002:a17:90b:5144:b0:3a0:a055:1759 with SMTP id 98e67ed59e1d1-3a6cecaa898mr10080837a91.40.1791242878358;
        Mon, 05 Oct 2026 16:27:58 -0700 (PDT)
Received: from ehlo.thunderbird.net ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dce36d07sm8230776a91.1.2026.10.05.16.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 16:27:57 -0700 (PDT)
Date: Tue, 06 Oct 2026 07:27:52 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_pmdomain=3A_rockchip=3A_mar?=
 =?US-ASCII?Q?k_PD=5FPIPE_as_active_wakeup_on_RK3568?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260925041751.495818-1-coiaprant@gmail.com>
References: <20260925041751.495818-1-coiaprant@gmail.com>
Message-ID: <382B43FA-B225-41C5-80B6-944D9D2802CF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_162759_427225_531788BE 
X-CRM114-Status: GOOD (  16.91  )
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

On September 25, 2026 12:17:51 PM GMT+08:00, Coia Prant <coiaprant@gmail=2E=
com> wrote:
>The PD_PIPE power domain on RK3568 hosts the XPCS, the PCIe
>controllers and the SATA controllers=2E  All of them can act as
>wakeup sources for the system:
>
>  - the XPCS for MAC WoL, through the SGMII link
>  - the PCIe controllers for PME#
>  - the SATA controllers for hotplug wake
>
>The domain is registered with active_wakeup =3D false, so genpd powers
>it down during system suspend even when a consumer is on the wakeup
>path=2E  That kills the XPCS and the SerDes, which breaks MAC WoL on
>RK3568 SGMII boards, and it also powers down the PCIe and SATA
>controllers while their drivers still expect the link to be alive=2E
>
>Mark PD_PIPE as active_wakeup so that genpd honours the wakeup path
>of its consumers=2E  Consumers that call device_set_wakeup_path() keep
>the domain powered; consumers that do not mark themselves as wakeup
>sources are unaffected and the domain is still powered down when
>nothing needs it=2E
>
>Several other Rockchip SoCs already mark their PCIe and USB power
>domains as active wakeup, for example RK3588's pcie and usb domains
>and RK3576's usb domain=2E  PD_PIPE hosts the same kind of
>wakeup-capable controllers on RK3568, so this follows the same
>pattern=2E
>
>Signed-off-by: Coia Prant <coiaprant@gmail=2Ecom>
>---
> drivers/pmdomain/rockchip/pm-domains=2Ec | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/pmdomain/rockchip/pm-domains=2Ec b/drivers/pmdomain/=
rockchip/pm-domains=2Ec
>index ba66ae719428=2E=2E16ef0a235f0f 100644
>--- a/drivers/pmdomain/rockchip/pm-domains=2Ec
>+++ b/drivers/pmdomain/rockchip/pm-domains=2Ec
>@@ -1296,7 +1296,7 @@ static const struct rockchip_domain_info rk3568_pm_=
domains[] =3D {
> 	[RK3568_PD_VPU]		=3D DOMAIN_RK3568("vpu",  BIT(2), BIT(6),  false, fals=
e),
> 	[RK3568_PD_RKVDEC]	=3D DOMAIN_RK3568("vdec", BIT(4), BIT(8),  false, fa=
lse),
> 	[RK3568_PD_RKVENC]	=3D DOMAIN_RK3568("venc", BIT(3), BIT(7),  false, fa=
lse),
>-	[RK3568_PD_PIPE]	=3D DOMAIN_RK3568("pipe", BIT(8), BIT(11), false, fals=
e),
>+	[RK3568_PD_PIPE]	=3D DOMAIN_RK3568("pipe", BIT(8), BIT(11), true, false=
),
> };
>=20
> static const struct rockchip_domain_info rk3576_pm_domains[] =3D {

Hi,

Gentle ping on this patch=2E It was sent on Sep 25, and linux-pm Patchwork=
 shows it
as "Handled Elsewhere", but I can't find it merged in linux-pm,
linux-rockchip, linux-next or mainline, and I haven't received any review
feedback=2E

Thanks,
Coia

