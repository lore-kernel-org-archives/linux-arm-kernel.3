Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1E1C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 12:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFI3yyLn9l19QnGbVm2do/qnURFM3qOYJajHXsZKIRI=; b=PCS3cr19SlAfSy62NkG/HQZ4ic
	+LsMLa0adbHbwQ1cRjRsZxtHPHdY5vTffRw/dKYZYZij7P5vHxXK270xMs4DUpQqUi0RQAq2eKL7G
	4n498lNd5ABPy9yJBhf/ANFCI5djM9tXHP/utAdLhjknleSPE50qGGxve31hua5LpF0gw4lWBzJq4
	JedxFwBg7y+PKrPLTdy8Fo8wE5Kt0Ghz5bJ54vEFf+nM+pOTzNlMzp+6u0h8SvGXyeG9Ir2sEuGDH
	dKan5eoEPqTwM/yiqdwMs/tGzY1pLdIR9Eyyu6y5Kigc+b0CvcNEZLqn1qJhPdDWrQlwCzH7p62Yq
	IgpAOWdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqUo-00000000nkB-036k;
	Tue, 25 Aug 2026 12:43:18 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqUk-00000000njX-3DKx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 12:43:16 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c1671ec8692so667723566b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 05:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787661792; x=1788266592; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TFI3yyLn9l19QnGbVm2do/qnURFM3qOYJajHXsZKIRI=;
        b=jb4TTnPykuk1KhBgFInniVnxIAjgW0ACxw1RItvZrDxB4UaoRbo2ydO/ZC/mnME4Mw
         7pDiQopWlDQkEDgQwL/HtR8YlWnhK9nPd9ZjlHVxKedoC1kxh1yA4IBHskni6209VgKR
         K2x/XLDXu7BYJJJbZTBN6D3amwC/gLmNXF8zQIAQ+rTVMtOPhMb3pNONmwK0xLFAvyms
         NjoGc1gFVSB/Wa37oOX3M1QsmvC2IKIsTU/8pq/9gSRLoeIlG82fEAlbOGhLB1UymTH9
         IceJeJDeuVtWw5s3IlVeAXBkbf/sjFrAZAymytjxeogFTuuuetCDGAh3ZVIkAgHNy8J9
         4WHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661792; x=1788266592;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TFI3yyLn9l19QnGbVm2do/qnURFM3qOYJajHXsZKIRI=;
        b=Us1UmcVjg+39BiAf/6D4R8UIb/qnddFNJjjXxJRdkWQ0ueCt/1e2ue9II0M+1ymPli
         25i84cgWFczLwnToap4RBUs4qXwE83IyrHKOQix+7d6LmhjVQ9/qRk9emPpZMRjJ3Fcq
         rP7h1tvK1aEiPdOE/6wqbja5gEezpXFLJoABea1/0vyLPN9CagbV63qZNwkxCh22Jv3L
         NHnZI+Bycwap2asjJWdoNpWGrAFR0nDAgH8IXURFfP/ynFxtW6ywPh82IpNwOF34vRFW
         4MxrMLmjcSNqr7gQwP0ttZVdA+oqjk1w+D2yeAKa/yxSkwweuGzkGlAHexwpIuOexxh2
         RFqg==
X-Forwarded-Encrypted: i=1; AHgh+RrdCHTE3FKHiuj/bi1jdUI5YEH6ZyeUXFtLyb5sN/+0OcdQZVZ1ACT5FANFPOi1n3nEr6a3Gpbuo/6hj88T7bHr@lists.infradead.org
X-Gm-Message-State: AFuF++kg49sgEm8SxER88x/mJtATd5y7Jf4oOom2DNi9UNcFb7t4EzwX
	GPv8oCtC+5l5hQbWOgWkv8wGeW9MhSSNVLXkgJkm6vyLQaplnLbRupwrIXVwE8ZUr58=
X-Gm-Gg: AR+sD125D946tSwvsOxJZkNpVUralmh2DfvRoauXtlMLlwiQ1Fc04Rugcl8E6x47Lae
	UxRRzXZqiJ4ZvTu9Eh636X0mUQrHo+ivpVk8d6UxXKUV4+DKanKBFKqqZ/3W2Zss9RX6tEObdjF
	JRVpHvw54qmg3w/0pGnmDFz9roI6SwuqyjH/0fqGL0mwkwQLVOQ7UiKAg1En+KHcFPYXOk20Fmu
	0jL6MlGCvGfXaAksCBgvECWjwCVkn+6BpatkcK8QuKLkS+5u9juRBZF0wmLtq9KA5yz20FIkiNM
	/yCsWdURL5FN9see03CfYnsthPQ6n/i/1xM/Zs/Eflgd9jZVjfW7nUXCJ/psT+wvkHyrQJtLows
	aSTjkXKOnE1punU3bYbDpQrSCtdOZ9HsM7kQ6MrgIbyGEoS26EgJU8xEjdfUHiMKS1XtmKaS3tQ
	zXSDAMnKl8MnOPSds0WUs/TILFzBUmiMVQeXmHdH/aSruB3c11Oq/y53A5
X-Received: by 2002:a17:907:1c27:b0:c21:382e:9a38 with SMTP id a640c23a62f3a-c2491c2a110mr2907599166b.2.1787661792297;
        Tue, 25 Aug 2026 05:43:12 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:489b:7642:1b32:84d6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f809bsm1943085966b.41.2026.08.25.05.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:43:11 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=14a369f1291804ff25a36242752313e74f8647a8095442ea6e38a796f654;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 25 Aug 2026 14:43:01 +0200
Message-Id: <DKY17OVPN49B.3U7OKB7NIMLF2@baylibre.com>
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Andrew Davis" <afd@ti.com>, "Markus Schneider-Pargmann (TI)"
 <msp@baylibre.com>, "Nishanth Menon" <nm@ti.com>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>, "Judith
 Mendez" <jm@ti.com>, "Daniel Schultz" <d.schultz@phytec.de>, "Siddharth
 Vadapalli" <s-vadapalli@ti.com>, "Paresh Bhagat" <p-bhagat@ti.com>, "Bryan
 Brattlof" <bb@ti.com>, "Jai Luthra" <jai.luthra@ideasonboard.com>, "Devarsh
 Thakkar" <devarsht@ti.com>, "Beleswar Padhi" <b-padhi@ti.com>, "Francesco
 Dolcini" <francesco.dolcini@toradex.com>, "Stefano Radaelli"
 <stefano.radaelli21@gmail.com>
Cc: "Vishal Mahaveer" <vishalm@ti.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Sebin Francis" <sebin.francis@ti.com>, "Kendall
 Willis" <k-willis@ti.com>, "Akashdeep Kaur" <a-kaur@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, "Hari Nagalla"
 <hnagalla@ti.com>
Subject: Re: [PATCH v7 07/11] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Move
 wkup reserved memory
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com> <20260701-topic-am62a-ioddr-dt-v6-19-v7-7-e9db8b16821a@baylibre.com> <f9a23a59-4346-4408-92c6-11b9162f0efa@ti.com>
In-Reply-To: <f9a23a59-4346-4408-92c6-11b9162f0efa@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_054314_825683_9B39FB60 
X-CRM114-Status: GOOD (  19.65  )
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

--14a369f1291804ff25a36242752313e74f8647a8095442ea6e38a796f654
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Andrew,

On Thu Jul 9, 2026 at 9:33 PM CEST, Andrew Davis wrote:
> On 7/1/26 7:39 AM, Markus Schneider-Pargmann (TI) wrote:
>> Move the reserved memory regions used for wkup_r5fss0_core0 to the
>> k3-am62a-ti-ipc-firmware.dtsi. These are all the same for the other
>> boards as well, so we can combine them here similar to what is already
>> done for the mcu_r5fss0_core0 memory regions.
>
> The reason we left this region here in the base DTSI is this region
> is for the DM firmware and is required for the SoC to function.
> The other firmware regions are all optional.

I left this in the base dts before and Nishanth pointed out that it
should be in the ipc-firmware.dtsi so it only needs to be changed in one
place:

  That was the entire purpose of splitting ipc-firmware.dtsi out -
  if the default firmware carveouts have changed, do the change in
  ipc-firmware.dtsi. That way some other firmware people will have could
  potentially have their own dtsi files and handle things appropriately
  there, even if they are using the same evm OR if they use the exact
  ipc-firmware on different boards, that will appropriately introduce
  the change there as well. BUT, do check first.

https://lore.kernel.org/r/20260507155710.5zch4ghhzrj7hnlh@immovably

Maybe I am misunderstanding what you are suggesting. Also note that the
memory-region list in wkup_r5fss0_core0 which references the memory
regions defined in the base dts were always in the ipc-firmware.dtsi.

Could you please help me understand how this is modeled so I can update
the patches appropriately?

Thanks!

Best
Markus

--14a369f1291804ff25a36242752313e74f8647a8095442ea6e38a796f654
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCao2N1RsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlMY
0wD+MW1P+fXLHbnT0Q5q0xRZNdlX5mzZrZjflYaQeXlZQVkBALnL4EjrbB40bxbu
e80zmZ+OmW/bF+SzGKpJy8SoyqYK
=pVaV
-----END PGP SIGNATURE-----

--14a369f1291804ff25a36242752313e74f8647a8095442ea6e38a796f654--

