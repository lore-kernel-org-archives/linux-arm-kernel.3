Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3EC1099B4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 23:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpEl+bjf7Se4KqKa8OldWT2rsgy4As3qV1p2NkGwJiE=; b=DRONxqPAH+T6Ja4D7Y483D3TBh
	udIT4EohnmWSQ+12xMB4uBDZiZfN5OiMR0v303V5BK0IMSaWtpoWlgFIbzL3BMqShExr2m1l4K2we
	0xGJgRCAnST/AbqLVIaOi+f0MOtNKcgxxuIhIRqVatD5gc3K33GSj2710Jf7jN8HOnJcAq1ZTQ1v9
	Nkq7t+9bBuuyrOmVhfUbGVFtymDtD9rG37FyN0XkWvFUPjdniYKYho5F/gGWn7AZDkY1rIgy7Ezra
	O1PflZnsqJWE7KsF4eQGWEQg05nlyEI5Wb7bKzmzmKYYcvwWaYoAoQKd2emh22joQlRN2551Dn/KY
	R3SgP4Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ivc-0000000DmCm-12Aa;
	Fri, 20 Mar 2026 23:06:52 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ivZ-0000000DmCP-17T2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 23:06:50 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso3542703a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 16:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774048006; cv=none;
        d=google.com; s=arc-20240605;
        b=CQ2QKvP3Wr0quqA/kBeCyfw+i+CfXk9FsevOPC/Etr/iB7bsL1Jb7s5oRWaPWjBFCO
         c2m3Q4p5DFxoc0/qgTanAFTp1JAsoGvi8pZAQcGnjUTsGBC6GZxR1LkWcDw7IdKKyJzG
         7RSH7GYdqgRlECR1jssE6zSG5VfYQx6TfNOGrsDYM/GQhEdR/CWp9m0pisA7FSiB3qMn
         cIR6fZ9VhSp+uoZOvkVJpyDaj9sYS8NBvi21MCfI1HAJj4ihx8Mv8s3kSQ6GgbiMbWn/
         9iO316rnBI9xy4ps246564hBZFUuodNK1RFDge2O9S6A79ZjQ2qa+y4HLiAXQwJ/+AIl
         dcuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PpEl+bjf7Se4KqKa8OldWT2rsgy4As3qV1p2NkGwJiE=;
        fh=ivh4g5XFtrW9Nb230tXrgtz+oVHR6f5KThRauPYbNJ8=;
        b=HQDFWWQ7H7nGOQpMcmwRtviNnY8jlvxiKkR5ICTON4Bnuy5R5zp0ODAUDBSAspx+ld
         vbln9f77pI4bKDHCyOftwfvv42M1KzcSHTzVYi2bCuRg9v5fAtM7lQkpMCMhupBlp54z
         9GqFATqedSikPbJy1LvNBqh7BXRfPGxqS3eLSgyw61e/DMVLJvGwPwzjZvW826zw4Dz8
         VwjG1OWBltc67DbkB6+tVwZLUExDR4v4VZuXOdZ8hgW4sOTpDHUbtSvmXQziEArzv+Pw
         sK/spW3a2LKEuUdKBvrm+NT2SxzcB//aKAnV/Zps05rjaagVz36nLMJnaN09FGLlkmUL
         0OmQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774048006; x=1774652806; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpEl+bjf7Se4KqKa8OldWT2rsgy4As3qV1p2NkGwJiE=;
        b=iAzRLtPwLF6TzFpyVfsvDeCw3Z7/3qqRC+M00y4kpm1hu5TqqmdaUG8cEBw1WIbs7K
         kkFKChW5bPCRELR/U4p+KR/V+xlazBBZkuWc99u8R66lAAC4xBZami6BQkD0hUQQv1pT
         RFr31jwZ8ji8DvyjUKy1utKGp2FXjlyFru1BE+Zh7UpY+Yd9pC24m6Sd5NFfgH4xaRx/
         CVkVLelBJo2dbN7RrkYfzhMcJmnottIaFjtD2APXAg4vf5PqloUXZeXGS1SZWKawmK6w
         DL5DYiwEXF39RCYDpB2wliSY4my2XYYZh+gjNlVDrpqn8kcZ7TxqtlzCuza/n/1c9SVH
         IVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774048006; x=1774652806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PpEl+bjf7Se4KqKa8OldWT2rsgy4As3qV1p2NkGwJiE=;
        b=Mm78UqvshW4sTfIvoiMCOEdqmjAiAyrnCYf1exyq+B58sw1JmXIUjqR3aFKwtPPMDl
         30yvgsDsuUQqCYeZgoU/qHa8JqJvNJ316d+7HBulZA9t7w0b+iOolZcnVxBlzsdeu2z4
         wRCM0mP0QZV87GFM3z8nYKvaVO5YImlRMx5ezIfBFCyZHlOd2lASAoc9y1Yy7TfzMB1X
         gQeKx2iwXjMpyBcWaLV5MJOheksYclCirnfWKfkb5AFUE/3E2fSXOK5QA8Vdg4gsCq6x
         WM/odZTGYe5ymlTQx/ewqUD3o+pD1Nu9CxLP2TlGooVx6Kglm7ghUx9mm8sJDoolsz0+
         o3Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWC+aCfmMYdHkdS+wC8NugafOTdbiglrRxfi8iLRsmobtcLfIDOmFfEZIpA6hR217PHABk1vyUMXyxskCndkvhS@lists.infradead.org
X-Gm-Message-State: AOJu0YxWD5IzkgnICgCBNFCyaumtfgayk3Qc02RZVdIQgLBxgZ9citMT
	xHpCoRdcjw3i02qFLBLAUt6zevaYygk29D0Gh07LijIz4BOVFgOqmFDx2ke8w9cc5+jgur7ERMY
	lKpCk9FkYDbNLFjESvGtxnZjZW1FbWpk=
X-Gm-Gg: ATEYQzwELIIeJX68IXEf1FrOU1UbluAJFZsO3OwsRxd5kbR07+dR78gbjgLYoucAXuA
	mQCVXjOO39VhFENcy7hYux8QerZ4XjgfukRxOl5aSibeBpFfT3G4HpJ3VW//wCnOqpzuiVgcb7+
	nZ63h686biq6oFywdYo7nc24xjEGVEjMLlsZfKhE7ljsIUZzu/B8ptsRdf266Se20GvId3vcIOE
	GU7PHWC6uVdM5r8tC3JWgpA93Tvd4DlSoThZgfj1enKLA0f9DZk0isGYr3dDd/8RK/wTevh+nLq
	LBJXtnT/9TJMFXoTkDZdGtGptwILgGpN6Qzf4LS6cfLmzXtvEZ69AIW1py+1vVbYyfJH+bEV5cX
	IAQc4lA==
X-Received: by 2002:a17:907:d307:b0:b87:965:9079 with SMTP id
 a640c23a62f3a-b982f1ec9cdmr353416866b.3.1774048005909; Fri, 20 Mar 2026
 16:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260319035324.269905-1-rosenp@gmail.com> <20260319035324.269905-5-rosenp@gmail.com>
 <CAKxU2N8Vb3D0oEGPzOqvwsXSVLhJtxh=5xrd6qq-Yj2X8Rt5Rw@mail.gmail.com>
 <b3212a44-2783-4c37-95d4-56e0b486c73c@broadcom.com> <fb4c139a-1abb-410c-950d-97b1ed44c9ff@broadcom.com>
In-Reply-To: <fb4c139a-1abb-410c-950d-97b1ed44c9ff@broadcom.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Mar 2026 16:06:34 -0700
X-Gm-Features: AaiRm50XMMvY-ZjWrkWG_HgoJNYtwJ0GkH_RFkCpOeL6_sKDraQYRQHZTp5lDU4
Message-ID: <CAKxU2N97s7L+Aph62qgtZZQUoVtjydP18ryTh=vSOXFTV3s_6w@mail.gmail.com>
Subject: Re: [PATCH 4/6] ARM: dts: BCM5301X: EA9200: add wifi definitions
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_160649_365094_FCD1A4DA 
X-CRM114-Status: GOOD (  16.93  )
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

On Fri, Mar 20, 2026 at 2:34=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 3/20/26 10:29, Florian Fainelli wrote:
> > On 3/19/26 17:29, Rosen Penev wrote:
> >> On Wed, Mar 18, 2026 at 8:53=E2=80=AFPM Rosen Penev <rosenp@gmail.com>=
 wrote:
> >>>
> >>> brcm,ccode-map and ieee80211-freq-limit are needed to be specified on
> >>> some of them for proper operation.
> >>>
> >>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >>> ---
> >>>   .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 50 ++++++++++++++++=
+++
> >>>   1 file changed, 50 insertions(+)
> >>>
> >>> diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/
> >>> arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
> >>> index 617fb55bc52f..7b1363aa1144 100644
> >>> --- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
> >>> +++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
> >>> @@ -93,6 +93,56 @@ led-3 {
> >>>          };
> >>>   };
> >>>
> >>> +&pcie_bridge0 {
> >>> +       pcie@0,0 {
> >>> +               device_type =3D "pci';
> >>> +               reg =3D <0x0000 0 0 0 0>;
> >>> +               bus-range =3D <0x01 0xff>;
> >>> +
> >>> +               #address-cells =3D <3>;
> >>> +               #size-cells =3D <2>;
> >>> +               ranges;
> >>> +
> >>> +               pcie@1,0 {
> >>> +                       device_type =3D "pci';
> >> There are typos here. "pci' vs "pci". Should I resend?
> >
> > Not necessary, fixed it up while applying, thanks!
>
> Meh, this was not even build tested, even fixing that gives me:
Was build tested on kernel 6.12: https://github.com/openwrt/openwrt/pull/22=
223
>
>   ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- make CHECK_DTBS=3Dy
> broadcom/bcm4709-linksys-ea9200.dtb
>    DTC [C] arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb
> Lexical error:
> arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts:107.19-22
> Unexpected 'pci'
> Error: arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts:107.19-22
> syntax error
> FATAL ERROR: Unable to parse input tree
>
> Please resubmit patches 4 and 6 since I dropped them as a result.
There are three "pci' mistakes that are copy/paste in this patch. I'll resu=
bmit.
> --
> Florian

