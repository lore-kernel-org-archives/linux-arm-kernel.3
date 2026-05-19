Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B293CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 02:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VdLnXWkJlod6GBXC4HreIgrL/kJTqIvIXNwxAsiN18E=; b=agGuUrwFF2iIDHmGdYbtm1kyP5
	+qk1isb5mlOIvNaLubW1qtSUxyqaHZtXiDhNxeZW3Q234tszOjVWr3nniBnSyppia8FWOpZNAgupU
	IxjdcZorAQtM3u03ifodf7k/xAm0nwxlfcve70Cy78Tb/+hT+/Xl6GK44TPT94mVpbCeFdPkXegUM
	pqHpIbNlZN5pt6lVELLBv62yJsPYDCdEARet3CvzAe/Have7fjQaRQNt/maCbl/CzLHUt5hLaXcAE
	pFTU4OF92a5/86ItIya9gx4CIZLWutsKZQaxM6TfDZvZoKMzE4AljmviYqLyqVoau1Q+R37wVV3hw
	XaLQu1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPAE5-0000000HTZb-26Ox;
	Tue, 19 May 2026 02:30:33 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPAE2-0000000HTYc-2pVr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 02:30:31 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-65c1ba7eeb6so3067275d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 19:30:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779157829; cv=none;
        d=google.com; s=arc-20240605;
        b=lORkraP0tmGlPTg9Dv1I88rJNjbCTb8MlSyC58uIHC9thpxCop+6OZn6v2Npix7euX
         EEuEeHSEcdHnUdJWeJ+9dTWUGQzsDDDg5En4XSN5Vh8QEkt0DdiKQnNFFPwqtBxDt6io
         rMvY8ah0APv+nSVahdYGxTJqNnbDsAXdeVK3lJ3kzE4hm0dFeIhJyUqEhLEd/9gIyRJV
         WOTBc1c8eJtEuo15WQNAuJ9viuxXEe24BGH+cwQqShfJlBgwfOqXCuv22XYpRyvI7pEo
         G6omtHsdZf2vZYIdwZz+G0ZmG7h+mLi0wACxm0JwcGbo+pqJge5UvSLqf9DYDqOvir7H
         HceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VdLnXWkJlod6GBXC4HreIgrL/kJTqIvIXNwxAsiN18E=;
        fh=tFi1x7EWuaWiGoTIb6Sqf9rSUuVplzVJKxZI4UuZ3A0=;
        b=id0c3VbEZsovnTL9O9hpNqnCYASThLZ6b5yqI4ktVWr1G2oFw9fZw0JIALCOHsyDpw
         itaySkj8LD/An0p0wpPOFe8GlFVaM4Ze4Peo0AMl06e8INcd0/YlED9WYn4DYtnb0R3+
         qp+h54FNGRD7dr3MpHfJ8DuMGVqdrzocl9jpUOJ/kAi2dkQSuVTJpV84qbohlVUFhjrM
         xQi+/cyWjnyaN1qnndHIJ3bssuD6Pre7vLkGR/hiM0jZh21oVi48iJOrnDybQAPWniiQ
         zN7C200uDNmTbPb+BjK/DMUH30hBtbx8aVTm0wlX9BgHFA9PxSJTnlFCtK7BO73NXrlL
         +bsw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779157829; x=1779762629; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdLnXWkJlod6GBXC4HreIgrL/kJTqIvIXNwxAsiN18E=;
        b=YpQ2qTo0E2P4orNq8z7kgDYfOAFRWUwn1Ktfu6So19vIrFI5iZ4QsoEolf2Z0++Pwh
         T2h49Aqq2ur8hw7JqwFByuN0ksDeNPKzQcotm1jYjbGrK1zqiBrNR9VOCaoo5KdS10Rx
         LW/zKXvZfPbYafGmKb9i8TdwRh3fJVadTlOhPR0BFOQQvQ4DABSHpq7w+GF6kxUj3YEs
         rBIHY394EgpMykcWwDmt1vUKNDjkqi0wu/75xnG9Hw46+u83ao0kigPy5h0E0x6+vfBv
         9QYoioa9bxDhnn2bHz/V7X8FsZbB6rA0fLSejszrXt2u/g+rq7XeopzFiDdfncexahFD
         sk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779157829; x=1779762629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VdLnXWkJlod6GBXC4HreIgrL/kJTqIvIXNwxAsiN18E=;
        b=Ubs/hFQ+2pA7EKKN2XIhjnScOPYfshoPWBAElPewx66J8R6HzfaZCO+RWMAggaiaBz
         H5FDe2NKOdm/k1apckwcFZGWEwPmdcGSgdJ597e7rWBvQ8QmcmeeAu/dlJAtZ4Jt+EzY
         q/lQxmMSzWgZNz5sJiNxRequMMLIrhH+bAKUuon65bP/74S0dTAcbqBX6aIGMrF9jYpe
         qV4l8RPcbHIRJqfQiTt77bYXlcLYbuLF8e7Ucm0LCGsNXLaXTG2o/T9OtYcqT4AWg+B0
         KemPqUlex5nHXQiynnLCH4KteMAsN1BDsg0xALTh0i9yjCN58Qvk+etx+Dr6fKnyNerV
         yaMA==
X-Forwarded-Encrypted: i=1; AFNElJ8XBCGC854rSo5ZnMV4rxpIHWST3zE0G1I49SW1Ml+xSDAPfp8ccIJVgVe5ZUUKPK8s9JGxGX4Zbx1I/wC0d78V@lists.infradead.org
X-Gm-Message-State: AOJu0YxPKp/bRsUmvCn77+XZIrj67/CVm0IsRVLizwbxnFaXBNsfdIEc
	DZ4kiQNiUNpqXo/meywFv2pdArZvt7fSyirCZtQmQH0zaJN8sw7RR0Yw/Y+1hU9PLMGX2lbIKmb
	NXBkT3hMk0M3U979MAFcVM3wlIq0KaG8=
X-Gm-Gg: Acq92OGbF7Ohe9J4ZYqyg8g/SHBW/h29oz5rAVtmBP9OrkhasXYuh5l6Utp6uYEFj/U
	OUfgXtusVfWuyhIUKhHPn/wIg6Ttn6n/myfeRs56uN9OEWbnuIxYbuc0rYK379aWwEFbrKpvPgB
	wnUspm+4kr5eLkK/4AhmVUrtH8ttIxis5Dwf27QstPCoxAlVLl7DGfELTiWjF5v2xUwAfdo+1u/
	tgJQZr6w8luuNKeicwL1bNwlrLecndpZBjOpARzom7got0AoDokA1qWiZJJHegvNy8/EUQ/Gpne
	sGDUE4r6
X-Received: by 2002:a53:acc3:0:20b0:64e:a9a1:fdb9 with SMTP id
 956f58d0204a3-65e227fa1cemr14329495d50.34.1779157829471; Mon, 18 May 2026
 19:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260518033440.17569-1-prasanth.padarthi10@gmail.com>
 <20260518033440.17569-3-prasanth.padarthi10@gmail.com> <ddb781dd-e117-4f9a-a5a3-94c192d8c2ef@lunn.ch>
In-Reply-To: <ddb781dd-e117-4f9a-a5a3-94c192d8c2ef@lunn.ch>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Tue, 19 May 2026 08:00:18 +0530
X-Gm-Features: AVHnY4JaeDtUFpVTlb85c0qbNvo1Pm4Tax_KEyAn6qJ236xPn2YUFjmk-qtw3Ac
Message-ID: <CAMFFDGjg-ZscFf8g_6=rkCeZ6L7M+hEsBnD76Lb+sGaStWQ7ug@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch, 
	devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_193030_752106_2FAC7288 
X-CRM114-Status: GOOD (  13.63  )
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

Hi Andrew,

Understood. I will not rely only on the vendor DTB value for this.

For the next revision, I will drop rgmii-rxid and use the conservative
rgmii setting unless I can provide board-level evidence that the
required RGMII delay is added by the PCB/PHY configuration.

I am arranging hardware validation for this board, and I will update
the Ethernet node only with evidence from the board/manual/logs.

Thanks,
Prasanth



On Mon, May 18, 2026 at 5:42=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +&mac0 {
> > +     status =3D "okay";
> > +     phy-mode =3D "rgmii-rxid";
>
> It does not matter if this is what the vendor does, it is still wrong,
> unless you can show the PCB is adding the delay.
>
>    Andrew

