Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36BBD2ECEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 21:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRWznSlw2S7cbES/gsl2WYiTRCw+WXgXVb1obiesglo=; b=E7//KNrVINp4LgnSTXc6T+BOml
	MOA3BE4MX3BFR94ZSNPgP2nOkATeiyZpQ9sp3XTD2wHebCGX9LxXV/RZ5LPC++hmKCgMK5I8eu+M+
	8M2+EEqqDL3LxdpwUzpzb2XlLmn+ITvQEPkEHsClhVFdsiXfzR2ZZmZ2cBGKltKgBUqT4bP8vR8b7
	VWbN2PmC8DH3GhUsRUHUtFIwh+LQa6Lm9Cl1Hx6UOUCVuqWOKEVkaX/KLxmEIalDjYZ9VmR0qMEaj
	S3ABIR2rKcOYYkH+ayRl1sDfE/zXTwzJYk2Y594co2gYKZ/Z9A99cLkVMOqmrWAutw1hNiv1DwTJo
	J2eCdDRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhx0S-00000002udy-2VLw;
	Mon, 19 Jan 2026 21:41:52 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhx0M-00000002ucp-3Eg9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 21:41:51 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-29f1bc40b35so47443305ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 13:41:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768858906; cv=none;
        d=google.com; s=arc-20240605;
        b=Fwo6+2WSnfJR0Cv60dhnfThVdEq63kJXt9gUwyEPGoDpMshiZnBHQ6230heLSeBFjO
         f12ccL87Xf9wboyvRLh4k/G71iHJAAY8OkdFvJych6KDZbfItxl6L6BSEdPxdwZlLGie
         lCTZh48rYTqYPbPMSAwFaG5jOGnBve1LHiDzi8jSkupr9RZFqnL9dtMXRlISFNJe9GKy
         7Jow0gzUhIni8sCX8Hgq9fvvx1XJdskJz8BGMMcLJOhkG01AcMvATWxzZcOoqhvKClrd
         U2qbtukqGG9pjjJ/YVeAU4B21WltFCNkREEqBJILtCM5+u8S/Mw3whTy+gypLBdMndFT
         RDxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pRWznSlw2S7cbES/gsl2WYiTRCw+WXgXVb1obiesglo=;
        fh=CcLUBEmEjCFyn2HpLrnTpWN18nvZ0uA9QxMXK8JGYjo=;
        b=hwYQTmfFZiuzRjKmwKlg6IWHVo1SObTej6DIqZgpGtJRcDP2nwLIpNHxwepuMuFGr0
         ZKOAMdd6naUDANAKavvXnMsSz+55evUliVgh+Q8jVe5NRrxFYMaMrusU7NyNoN6bTLhE
         BAzEI8oY2AzcylaXMB/mg9KyEV1l1kGxcxibMq71ResUReK+/HA12PIRdN3DrZ1/JNo8
         eh5ASWdmCu3Bi6PvpwRQJcyKJ64GVwvXMom7ZgNUIBmM4bVQ1vLv6CtGMnWstCJtd5V0
         Tp71VS7hfBkOS+FlVOp1XNvn6mDJMnzlX36Mwx0SdFz7fB+mXaSnRPB6bPAnu8MKSini
         glUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768858906; x=1769463706; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRWznSlw2S7cbES/gsl2WYiTRCw+WXgXVb1obiesglo=;
        b=FbJx1B9b2EyVH8EGxVHpRQxychUqyuuV/VF5Lxe5bsEqHLeZ6RE2znXnbiAFHztjL8
         I9cyRNUrtBVjlAqtPHpmUXW4Ih+7qIK4WQC1nk+nMYuq9bpJKFYWbrxADymB37HCFtYW
         0ghvIc9/4Z2WtJndifCEmn555gg6rWEW26h0xlW0SacCD/V0GObGWh+9S4vol8Qe3ndK
         W+Rw+iR1Yjj3yMm92/xrOGh3/AgTVFRPcynkH4ByO/SKKQmdoien4QYif7+biAUO7ymv
         Epeasi4WP1rqnoFPDZTu8QWtTL+MoNSEbUIjKfKLDJVt179FO2ZFutXHtuhlLFQ0EPCK
         xwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768858906; x=1769463706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pRWznSlw2S7cbES/gsl2WYiTRCw+WXgXVb1obiesglo=;
        b=Qz+fFXUEZ9mQ3ghKau8s1y6bGShgpgjxfr9trUOU/g1XGLChqvKhdGXuKkgwO1f6Jy
         WwNmueqtIXJ+MLVtkB0BNxZLYi6lySAEv6GJMG9m+xfcpOprfvOMKtIWmoiPoL6BkvgG
         drtO4mProcjnoMBC1sDCp+Vc+sxKgSZbLJA7nHT0TFH20iXUNQVtiPXIZFamXA/n9nBX
         2LELDJIQzQMp4/EGhyC1iwNR0ktyRUWyCkUqb4o3ZWkfdqnk45d2UX0ij/ALsd615SoZ
         Pm37kqcMXZxN2g9/f9UBaGM/fUE6a77ZDUKBj9LPIIdgZHcd8Jp51K8qh3OnnRm+Efc2
         HL+g==
X-Forwarded-Encrypted: i=1; AJvYcCXX6nnX7bSGTWB+G17zMxohUA8lKf7hZphc00iWmqq9Xigaspc7lOQk6vdErYT4JSoYVg3TXJU7nqGADdwZ/ZeD@lists.infradead.org
X-Gm-Message-State: AOJu0YwFCzYTukV9mpDN3gFUYh0f2WwFyQB7oEPFp5Q97dkDhlU0GtD+
	tfgz5mdod90WnobzTIFV72gKGicMvYtY2l6711SuEoEtxcJMf5l92Tnp/RUdCNJtbMXTBctkud4
	qbI1YNXm3xDlQDKicKI7xt7mCpxlw20o=
X-Gm-Gg: AZuq6aIEljia/xAjgoIC3rKmY/B6njO4brmxWlRFvqO7qL+vJMED/ZjgxVmYHagMWhU
	gjsh4hVkUcj0wADV63cAUE1x1ptgVm2PLIAFj1V3RNOofSLJ2NzUpQb1yKgSb3NEoaDRHDOjDyt
	KLX7BUKNzYoYia9s8/KbTIArb8Runynim8Dm/HtQm49G85WBGqYrbx0U1zElwDOunYdVSxDOC5+
	ZDPyp0RjEa+wgEoaapVn+4OFlcrO0rrh38wW/lYHejMdlk5XDWRZogyFdgh+fnLx+UkXTNbiG+/
	cbax4lLhmCRVXXKK8ecVXMZR7Bxm
X-Received: by 2002:a17:903:41c7:b0:295:9e4e:4092 with SMTP id
 d9443c01a7336-2a7177e69demr117828295ad.56.1768858905805; Mon, 19 Jan 2026
 13:41:45 -0800 (PST)
MIME-Version: 1.0
References: <20260116023900.2036657-1-nick@khadas.com> <CAFBinCAeNcKW_dK+1LD7U_+JkcozxmMw9J4oGUt1=OcvJ95dFQ@mail.gmail.com>
In-Reply-To: <CAFBinCAeNcKW_dK+1LD7U_+JkcozxmMw9J4oGUt1=OcvJ95dFQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 19 Jan 2026 22:41:34 +0100
X-Gm-Features: AZwV_QianNccn2npt0qzJu8jf1J7ZW5nG4PtEcDbgkjGz-yQ00oAH_jww9o3OAc
Message-ID: <CAFBinCCuV9eqDDg9fgy5hkQ8KukxpbfSgTzGq_C38nAB1HtDFQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 enable SDIO interface
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, xieqinick@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_134146_803567_219AFAF2 
X-CRM114-Status: UNSURE (   9.17  )
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

On Mon, Jan 19, 2026 at 10:39=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
[...]
> > +       no-sd;
> > +       no-mmc;
> > +       mmc-pwrseq =3D <&sdio_pwrseq>;
> > +       vmmc-supply =3D <&vddao_3v3>;
> > +       vqmmc-supply =3D <&vddio_ao1v8>;
> I'm missing:
>   clocks =3D <&sdio_32k>;
>   clock-names =3D "lpo";
I've been a bit quick here: clocks and clock-names should be part of
the wifi@1 sub-node

