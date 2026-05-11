Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0C9CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 21:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:
	Date:In-Reply-To:From:Subject:Mime-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vv6Cf4mYgD1HTgqKQL+63OwI9Ewor3llwuPU7oW2eIk=; b=UOj0GOe4mp75fxePZxDMWOGZbL
	vLoOVPRwtXD0bMbEMOGAEnBpi+VS9XEddXgVzJPI2w5jOS/kqZQ7BdFTmrC4A803hoo/FTdEYDklW
	9FBhskAksRJDWkd50wq7a2r7qGc0mw8XddAiTDkju3OJnXJJoDPNN6DMMDWR6bgqMy2sHYRL/wwqs
	eb5BnsBvJLnR05DATYiVkLO7uR25oHFHfFnwkxkWxh5/d3CUL5z+SKfSumBFV9qRPFWTd4enTrQPn
	ELzYxefTsrupES8j/4myRbPb04aVpX3tQhgLdDXlIV+I2sy9/fvqBg9446rwQ47e8gS+L0DepUyF9
	IGoQ5FDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMYGK-0000000EpFB-3TKv;
	Mon, 11 May 2026 21:34:04 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMYGI-0000000EpE1-141J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 21:34:03 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48374014a77so44705275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 14:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778535240; x=1779140040; darn=lists.infradead.org;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vv6Cf4mYgD1HTgqKQL+63OwI9Ewor3llwuPU7oW2eIk=;
        b=UtTMNVewq2grnrLrrIbSgQW3l8zk27s2o7IiFt7MHcY1D89rxqtm1KpcdiyCpOBvrP
         iULRNbOZQ8GRxOvIW1xuR5kRK91oI0RFwbu2Y9xGcAIcSshAyI25nDgZisUMXTW6JARe
         X2zcAkpO5svtr+Mxa5/KFAWBTB4dEyQUtVun3ncVbaEG/xIEkIROGHdlnhA43EKW/sWD
         PiMP+jd9m0JwZUsTBHVVxTcjzIJa1/4/yS5zk0cTcKW/3YY49ENEmktTcRkvRllx1WWr
         m8+8jW7S+JSJXhggzTOrEqn1hbp7Ktrjk6StEDwH8MCvEq7WQqixobkQkF68EiQfQRSw
         u+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778535240; x=1779140040;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vv6Cf4mYgD1HTgqKQL+63OwI9Ewor3llwuPU7oW2eIk=;
        b=HzpQh+GISseUDIJtPiUmexv2CBnXa/jgwkmNsZAitxD2kDrgFTxjBwZPF0D7JN4PT9
         zMz5hp57iV/6G0AVo04d/geXkyUUa13fSbqI3z2v2w3BMB0l74gFuLziDC8u2UGFExe7
         s3gYxYebAT08GZ70kAPdNDJdv2YZiIu5FC1F+L1jA547W3arLoTMa9//k5RjSOVmRz8i
         Pb6xM2LTcqwq48dI/ixMBUP0rs4pOWxyyFnUPnuRIzToogvizt0zES5ura1PwsBgN8+P
         JzNt/J/8SSnvkMyWF6YaHY0pMDMnF3/2ZiX8OoYPqXFs66tM430qgEPaVtp4gWOpbHnM
         nZBA==
X-Forwarded-Encrypted: i=1; AFNElJ/TW+LAeJBpurt/XEpZFHOiDokcXSd82BYLG50XjxlY7VMbbA5B06ehdyPXSSFMuolwneSLeAORg+z2uzcndNDZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxFCdTF8VkJPxapd0TbRrLH5Huh3q+LnCr/jXGSI0+gTDHq6sr0
	dTIP0WjIyxugvyc3KqEumE0pVXwK9aOn66eK8KWWf1hgo6qPukOlO8vp
X-Gm-Gg: Acq92OFlP7FpQ8cWSOKExZkGpWU+83dHRRIaPesrWL7lYPxJXEDzn/lFJJDytEKGJOf
	2xEXTSriGgTOHKOuxefNdwcqsu4g76T/9LQMZzSboyQzvjDirjr4VPY6DoYS2XYkTJlqGy/0W01
	TEM0X/QZ4eEov99Lm3Mk9xl3jafrtDzsgZ+IfapT5HFsIjifhudxWaRAF7F2P6x3cqE3BNj7X84
	6cPSnkGBqHO6MK5P16f7PNT/4T08qMDhRZORF4JG3n5EqSQZblGZIywPcJoDfAdRV9CGzi0uere
	S/vUFS5/8PcxEeelrIxq14GMreTkEZSiTw4Zyquka89aXxKDqzyydjH52kHH9KvWrD9zJ8R2HKv
	AVKIHY5i5jpDeJwXsorCRrqxGbHFWLZ5wyYou2AKhL4BTPBVIHCmn1/CMp0aQpT7wPrTh3zcXnJ
	1haLnZ5RbHNI0Nnia0c6wItsktp/GgRZNnYH2F
X-Received: by 2002:a05:600c:4f46:b0:489:e126:b757 with SMTP id 5b1f17b1804b1-48e707fbb13mr187762585e9.25.1778535239802;
        Mon, 11 May 2026 14:33:59 -0700 (PDT)
Received: from smtpclient.apple ([197.250.227.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7040a9a9sm370272295e9.9.2026.05.11.14.33.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 May 2026 14:33:58 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_86F8E9FE-3936-42D2-92C0-780617216CA2";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH RFC v2 1/4] dt-bindings: clk: zte: Add zx297520v3 clock
 and reset bindings.
From: =?utf-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <20260511-backstage-crewman-e44947ab6cfc@spud>
Date: Tue, 12 May 2026 00:33:42 +0300
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <DD71E384-1777-47B8-93C8-D6EFDA4BA74C@gmail.com>
References: <20260511-zx29clk-v2-0-29f0edc300f5@gmail.com>
 <20260511-zx29clk-v2-1-29f0edc300f5@gmail.com>
 <20260511-backstage-crewman-e44947ab6cfc@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3864.500.181)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_143402_306716_9E8D538F 
X-CRM114-Status: GOOD (  19.53  )
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


--Apple-Mail=_86F8E9FE-3936-42D2-92C0-780617216CA2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Conor,

Thanks for your reply!

> Am 11.05.2026 um 19:07 schrieb Conor Dooley <conor@kernel.org>:
>=20
> How come the "matrixclk" has no constraints on clock properties?

Because I am not sure what the correct/preferred way to express the =
interface between top and matrix is - see the first question raised in =
my cover letter.

In short, matrix potentially consumes all clocks available on the top =
controller. There is no obvious interface between them, like there is =
between matrix and LSP. So I see two ways to handle this in the =
bindings:

1) List the top clk inputs, top clk PLL outputs and PLL fractionals as =
matrix input
2) Be quiet about it

It'd be about 20 clocks or so that I know are consumed. The bigger issue =
than the number of clocks is that my knowledge of the board is from =
reverse engineering, not proper datasheets, so I might find out that a =
clock is missing or wrong.

> Although, these two devices seem too different to be in the same
> dt-binding. Do they have anyhting in common other than the SoC they =
are
> part of?

No, they don't have anything in common, other than that their concerns =
are poorly separated in hardware.

I take it from your question that the preferred way is to have separate =
bindings for them in this case - I guess separate headers as well as =
separate yaml files. Is this correct?

The third clock controller - LSP - is nicely separated from the other =
two. I would not be surprised to see this subsystem of the board show up =
on a different ZTE board. If top and matrix should have different =
bindings, LSP certainly should as well.=

--Apple-Mail=_86F8E9FE-3936-42D2-92C0-780617216CA2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoCSzYACgkQPRO8yFRP
GiJreA/+NGigL8m01fqUXyaZXJW5lLjWCmzMbFofI/RsTAhtteVvQK2IwcfN6iYG
KtWe+zgDbdjjhwLYy1VJqgUMfyYHaWVicYSnxJ0q8JvTcJeDclHifEV0sQjqsmQO
KWlolqcNVfSq9qLcYNyfygoKbBOSlIt//WqyiX591Rpkcar/mPVjrrSXqHciErrs
hE5eTYr0RoyE4CDc2o20I5oqZwtntKa1xbOav4GSD1tUNLbsTm0xWLFLf2Bh3uX9
3qS/GJDgNCTeTnEK/Pks7JNPk25kIq2OeTktMR8cv5SSs8ZQLaKtvQCX97QnfL8H
03YRzF/jbBXsCYO+IXWMrn1R+J26HkUR61lWOkiWykoj4Zda7mX2zGaTsFR/tcPL
u3rOSmbcqEaMMY2hD08I/vIrbXcPiZ26rxS0DgnwKwqN8kFem0ULhjw3L0UCURXO
3J9IHhKhkp++QmTZSclOOY8MWujAh3IRYoT8VwUtQkmmsEzDkTnmj+at0tf7CtOp
fQmC3jkuGPrRj0fZJeFvPze3EGxHWWTBHkHaoAqtjGs6ONVNRx58MuasigPKmueb
CN7jtmppAGpLlur53BXetZflBBdFfU+EpDmOszZJ989HOZtsg/zAu7ZuWfCYDMKH
FD+WtwfgX6fIqRrLs0/FD7rV1kHx/GagGhOfBey/j+iPqvcTgoU=
=XNGK
-----END PGP SIGNATURE-----

--Apple-Mail=_86F8E9FE-3936-42D2-92C0-780617216CA2--

