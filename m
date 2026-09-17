Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA38C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 18:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8WFLPr3Z4Vj59hqf3BiQcKfbTnQOlSm6y7UQuAGxu8=; b=J3kTOjnjWg4lzKjnGp7REiN5XJ
	Ghky9e2te8odDInBQV2++OWJvRioGZrn7hi1FyR95mMHl5rGr/yIxn6hSolgB/FU2R7ELMYzaJTlw
	5+N/V0FSXsfARbYKS6wCAEd0J5o+0+THPMJGK9HJB4ZLNXF4CAtD3TxSs+ORPPhh6RZh2pasjz2XE
	HH7GBoc+X4oeOjiNxigwuoqNCVlFnk3hwZTvjYHxFSwDFLfGSItRwqrkoJ/1z993Js/6zOJuRANaN
	426A5pqUuwwxU0W00E8KFo8sFPsZvjG7TzSM77HEdETfcBM1PCaWjQFcxIPfwBVXwjqn8S+Kk6h1q
	SWjHDrcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Gqw-0000000CEEZ-25wE;
	Thu, 17 Sep 2026 18:28:58 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Gqt-0000000CEDa-2PsJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 18:28:56 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485b1d2874fso435344f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669733; x=1790274533; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8WFLPr3Z4Vj59hqf3BiQcKfbTnQOlSm6y7UQuAGxu8=;
        b=QMm0SaA6oTzYz/Z4MxnhUNuPtCoYwYfHfQSp5OVu6t3LHyBPAutnINopy4ZeBYXFVM
         gh4Uky231IxC7aut3vyWRj8RGJMhHQSa7mlrB1pWe9D7zXMcRDlPV0uUVXT9uw19vHVf
         DhPkX5o/TTqexJ9smqr749BgY5DHZkNi809UnIDYPXbL/f07W8hPTqGJFDv/vN2iBpEr
         eOPDx/WIsMcMNXmFllws8MyRtbOjZ46XWZR7ewiu3lpPaF6kq5A9qgoNc9Cshi4b2xFa
         R0hIbmFZt6WjxTIcNMNRycUG8XIqokIVWITlMGVfed+fOi/VG9w/moT0dFxVPxWaULVS
         APNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669733; x=1790274533;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z8WFLPr3Z4Vj59hqf3BiQcKfbTnQOlSm6y7UQuAGxu8=;
        b=ywELdAFli9QWQ74L7CCcT5+MhsUGLAR4v96QIKdMSWLVm+CQ+t6Zz4RFXP/gov220/
         mQsMuwbHROwn1Nf6rTQrlTlLXIg4dQ3LwlR2BBTTfEw976A9r2/8c+MMSMcyvXDCNVsH
         fjgeeTl+zngHr89n0A+WrjMDpxlS+L9uaJWbxVwTOyD+R/w8sUXNROfXIAW9jej/ijSz
         Y7Lol5N3VJiChcWGgDleJsZYHg8qrm1juWBBxnxhF0gJJ16nYVtHUBXxzZL9Xx1XE6Ml
         fqThtgCmkaF8gkLSFBIGdEpwKp0DehbxR0AG3fPbjRrqgH85X2d1ptnhrOdN29+2yYJX
         NRWg==
X-Forwarded-Encrypted: i=1; AKwUvBzQ+i8uxJvAkJJ4hhswL6EwZVXURKz5TrQRFToP4MDrAXhG6pWXwpfPSLC6EOO7VugwU7QclOn1wWMT5LRShnjV@lists.infradead.org
X-Gm-Message-State: AFuF++ma7C7jqVk9HOLo25VpuqHtfAK48oE0RuS1kXWvfOd3D5Vt0gIc
	N3vf1nTtTrXePnMb/W+ykvn7TevPqNOG3a8Al/TwnlMw3+fSMl4lHwSD
X-Gm-Gg: AYBFou3n686LZWw2CLVZ/eFXtcoZXqJf7ltvgeAdAE+0gxelA+qXlDc41lbfjqg/mrE
	U4w3aTM08FZJZAU76+rEZcP5oBXR/X1mmako8dV20jPxs/nFuXmHGjHAyyR5HYfc8xBvAMEnYPK
	fSTL92j6wP96Sjsh6TbG09/P5i3XhZhCViRuBxJw0ESbekI037P2pyox/uWrWOiVIy5FZcIyfEo
	ENjIB7J4EvrQ70smxZO+21mfEsYGlfK6wqVOrZHkOlPAxG19+whUi1DdcFg7iK9tWOcd39VZUEz
	JeL78kYrrTOCGyrxUQVng9WciJLb/t+w+7XBFAaQeEnfMOk/ny2dVyn+ipGpKnXAMRXvnFonVU3
	EmwH3fDusnVe1jEeQzpsEWu+8w8GgT25g+8e32E9eH5F34gn1mgZRD3APJxQgwjWa9hyo7x04/Q
	SuvV8CnMBUoJez7TZ49SyDXHZL26ctloZspprK+oQDgtGRWqxpJbwZ2Xwz00Kxkyqzh9UsNZ+id
	grk5A==
X-Received: by 2002:a05:6000:708:b0:487:11:d053 with SMTP id ffacd0b85a97d-4871d915c41mr24943f8f.0.1789669733272;
        Thu, 17 Sep 2026 11:28:53 -0700 (PDT)
Received: from strix.localnet ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf26c8dsm17422129f8f.14.2026.09.17.11.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:28:52 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 mfd@lists.linux.dev
Subject: Re: [PATCH v11 05/12] mfd: zx297520v3: Add a clock and reset MFD driver
Date: Thu, 17 Sep 2026 21:28:36 +0300
Message-ID: <lIjduhk6Sb-yyUCQAY-CKQ@gmail.com>
In-Reply-To: <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260910161711.GK1051768@google.com> <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartElaGoEJaRnaci40IYCPnGA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_112855_641081_1DB22DA3 
X-CRM114-Status: GOOD (  11.89  )
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

--nextPartElaGoEJaRnaci40IYCPnGA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Date: Thu, 17 Sep 2026 21:28:36 +0300
Message-ID: <lIjduhk6Sb-yyUCQAY-CKQ@gmail.com>
In-Reply-To: <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
MIME-Version: 1.0

Hi Lee,

Am Donnerstag, 10. September 2026, 22:14:54 Ostafrikanische Zeit schrieben 
Sie:
> Hi Lee,
> 
> Thanks again for your review!

This is a ping regarding my reply[0] to your review from last week. Do you 
have any comments on my responses?

Thanks,
Stefan

0: https://lore.kernel.org/linux-arm-kernel/x9tzyTnKRAOyrdtSGnka0g@gmail.com/

--nextPartElaGoEJaRnaci40IYCPnGA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmqsMVQbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiw48P/3we1ILZFxaaGd9dUpM9
EPNR5ZVYal8qGKGBQRRFG5L5iI9qCAETVZTl5UuYFjjcs3U9+f2t8HbH5pd6hZSt
C2F3WDGrsGddEGAPArMF7962KRKHHPUDoEOokUhrdp0/J7XFAZRDjCPJJdZxTHZD
cpnqNPNwoTUAWYs4kLINKy7fY7PW+sJqUmAqvnB47RLoFURA9/DYcNxa/1esTScd
Vyzm0NEsRFuZVSYTSjbBffTn266IrxNRSBnCJOxRAEv4edO2dkkqy9OZBDQLkcYn
LJDrdJY/bAPJFapkXGuowmd5kVtYjG60V8+0suU1m+2HLlSipyfl4XeYHAS8gT5x
UbXlsxgwtxCnMHWed3RbtXUGsYuBCsuO2HRz0Rv6Cduc2qY4XeEtgFxShiQbtq4w
bxxE8DTlxoYjflISxEYYp/fD79irBB3hsp7oeSzP8PUyHsuFfCKpb2kfwnUtwRIQ
Ov2oPm29JViaAFvrF1h5FQEU2zLsdNBquOIlsqamK07yjEPcELwlAByNv9e65/Zn
3HUXepbTgovCaAofjQsggxDdSLLb4O5FjNn26DgHxz9d6ONWOjyqOIalTG2SbujQ
ZDmnp3aIX6ETZBue8mBr5Df9zQTmCwYmmAh4PtqvOfy8R72pr+i3SSUdTXIj8h4X
3h6c3+ubcO2oiEqVFEPbus5o
=NhYp
-----END PGP SIGNATURE-----

--nextPartElaGoEJaRnaci40IYCPnGA--




