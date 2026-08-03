Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B09FC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 17:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnDKjAsExIlIO6cGLAGlNzQp1IiRGZFjDF5mAKUFBPE=; b=BnCoad2x6u8igCXOHlyxmRuSRp
	Sj7DpkmGPofBVvbECU1GMx97RyM/oeiUeA5pGu01AKZkzd78HDdo7v1pSp79eS4hO5NjswOGt4XWM
	H7Fhewvs7P8Q/BB/RxLidh1iAAtNQ2nja7N0w1cDZ1RcXA9HtnJXxa6cMPWmCOdLVrmth3a4364Pl
	ptUTS9tcUPzYiRStlQHQYgiW0zLnhpt+dhXHt7S7fOBYMHqtq/+S/TIH0kJjIZcZqeM/5OIuxbTZc
	JeemlYo4U2vSd0E+hms0r2CcwbJpOaWSIdAS3l3xC4Ooo74OPcpiD8HDrr7prPbMD+5jKzfPX1+1V
	dN2fbJOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwmH-00000000GVy-3zOD;
	Mon, 03 Aug 2026 17:48:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwmC-00000000GTs-43Qt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 17:48:40 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso20210895e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 10:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785779315; x=1786384115; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HnDKjAsExIlIO6cGLAGlNzQp1IiRGZFjDF5mAKUFBPE=;
        b=B7yf0dcy2Kf7AMYjkWntq0vP7h3M5z3tJzb+5OI33CbnJYHg+Xtan+zDjzUCPSTglN
         R3ep3m2D863yj6MHbJaYuwcD0JWVfDScCuDfbB1uBZ+r1PTm5hkTfebsr2nK8Gg7901j
         WA8JXhq8oUkmKVHcqCA4qqaGoh2ffI2ez23KO8mu+Pj8iNFJI2saQVxlTAG+YUsX4pu5
         On1VzezJXkokr5voefXF/aMyP94yRFv4mHM299wCTiF5sqiWL3xxlgibDHgHjhh+7USX
         di8mVRnsMZDBfuHUq4ZNkvQxrO8agQHG+HA0W3RJXqfCstkL2E6uEXAQ5a9ox+xhU9ya
         qCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785779315; x=1786384115;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HnDKjAsExIlIO6cGLAGlNzQp1IiRGZFjDF5mAKUFBPE=;
        b=RyFOin3AZA0HujfP5RvLC/SY3fogOXR4aN9Guui4Vkd0VRkAGQuoClxgoECA83PrBu
         ntokg7NDpWnolRyU0LBGdAYYY7ySb37IFrQoX0LEUlSO4TPexBWPPqKjB3Cowk/7b1eb
         PMrHctnU6LN+nJ1hU/w5oiy39Xu/JJnNXFPyaIdGKFWlYaxfHKGrHz6ZzQ6J/Cm2IyTi
         2WYuHf8s+cv6D9T7ipIOAoya1BpeRqi+osWyuzMlcO2dPgewgiWrmij7/up8AzF0EVUK
         FmK7BkRw+jqX40rDW3n6Dq3ux9nn0hdaBneiUVzuAOoqyXZRaqbP7yRn9UGu7kOmGVyP
         QdNg==
X-Forwarded-Encrypted: i=1; AHgh+Ro69PLswA4WSBA0IKnJTYaypvNNuvQ0XQQr52EaHvR+PRCMjnrCOf80Lj5TPZAJ/o90mRdBw6fnAsSmD405tBAw@lists.infradead.org
X-Gm-Message-State: AOJu0YywWLL9XvnQtsP1Tm7nxupn3ck4nhiz9cUSlDD3cKxoNKTHqTHP
	QfSQHtWioeFkq5zPHAKRoCYYjKyTKzyRnq8FTJtMqg4ucPkxe5bNwbK0
X-Gm-Gg: AR+sD13or6psM7d0MSjHtvCoIHN9LfGiyBtxoOqN7QoKKVX+zift8DgaNgxAQreT0AA
	vq7ozba3gKJaKPD9O+jqMAzj9qOdyIy7hIgxVhfPR5lBdyMV1v6u9Eo7ZCo9ZMuTw2rQtPh942j
	He8sr6mqA/X9QuK73rcjtGXjhG5t6RtOUtZcPHhg4Cajv0swZHbmhMsi4GoJvJacNFLh7BKaOeJ
	xi8mcBVaZfaacych6u2vR/CwKk9AG7hJefptv4SXEMct6uT35Kg4DsMS7vpqBtLsePMBuEawE+y
	gw9gCLajlx8JgqKjvurM1vByevJ3cEXZPGwwiZGabLwII/6QnDY729800Xl2P6zZkYui2uTVuww
	KoJ+NiME05k9LujjxgUfBBz1/K2MLsrO7HNKFUC/Hu4FIIYidVy6l7+aNy/+QY+HnufQL8xa0mM
	6WLk5fZssjpcjPLQJbew+HZLLA4ykgybv9bppFav94zXe9BYKdbCkeOQ3Oag7vi+FJDmoMBvYvb
	Q==
X-Received: by 2002:a05:600c:314f:b0:495:4572:21af with SMTP id 5b1f17b1804b1-4980c673252mr206970055e9.9.1785779314611;
        Mon, 03 Aug 2026 10:48:34 -0700 (PDT)
Received: from strix.localnet ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b5b4a2sm295532795e9.1.2026.08.03.10.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 10:48:33 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v9 05/12] clk: zte: Add Clock registration infrastructure
Date: Mon, 03 Aug 2026 20:48:18 +0300
Message-ID: <ky2t5IqOTfWMdfZsXE91Gg@gmail.com>
In-Reply-To: <anC72Cf1zKcLYWlC@redhat.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-5-d05530d85d28@gmail.com> <anC72Cf1zKcLYWlC@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartnWZPMUIwR7W-Gw2dYxPvgg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_104837_083906_9E87BBAB 
X-CRM114-Status: GOOD (  26.18  )
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

--nextPartnWZPMUIwR7W-Gw2dYxPvgg
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v9 05/12] clk: zte: Add Clock registration infrastructure
Date: Mon, 03 Aug 2026 20:48:18 +0300
Message-ID: <ky2t5IqOTfWMdfZsXE91Gg@gmail.com>
In-Reply-To: <anC72Cf1zKcLYWlC@redhat.com>
MIME-Version: 1.0

Hi Brian,

Thanks again for the review!

Am Montag, 3. August 2026, 19:03:36 Ostafrikanische Zeit schrieb Brian Masney:
> > +	/*
> > +	 * Sanity check: Make sure all parents are there and write a clear
> > message rather than +	 * leave potential orphans.
> > +	 */
> 
> It's not common for clk drivers to have a validate function like this.
> That said, I know you are reverse engineering what's in the downstream
> BSP without documentation, and there is value in having this. I think
> it'd be useful to clarify that in the comments because code usually gets
> copied and pasted between drivers over time.
>
> That said, once it's verified that the clock tree is correct, can these
> checks be eventually dropped so that this validation logic isn't ran on
> every boot?

Yes, I plan to remove it eventually when support for the SoC is more mature. 
It has saved me some head-scratching as I have been working and re-working the 
clock tree. I'll clarify its driver specific role in the next submission.

Another option I contemplated is wrapping it in #ifdef DEBUG. What do you 
think about that?

> > +struct zx_clk_export {
> > +	unsigned int priv;
> > +	unsigned int binding;
> > +};
> 
> Sashiko flagged this as unused.

Indeed, that is a leftover from earlier - before I realized a simple unsigned 
int[] does the job fine.

---

I have a long-standing question about tristate/module support for drivers like 
this: I don't think the driver can realistically be unloaded. I have been 
testing driver unloading by removing the UART clocks from the DT (otherwise 
the clock driver is busy) and marking all clocks critical (otherwise 
unloading/unbinding will shut down the UART (and more) and lock me out of the 
system).

I have made it tristate because from early research into clock driver state of 
the art I gathered it was desired, even for drivers necessary for fundamental 
operation [0]. Did I understand this correctly? It also uncovered some linking 
errors that weren't obvious when compiling the driver into the kernel.

That said, I'd prefer to mark my init tables discardable with __initdata and 
think the module load support is going to go untested and bitrot over time.

Cheers,
Stefan

0: Chen-Yu Tsai's tak here mostly: https://www.youtube.com/watch?v=d1VIAnVb3hI

--nextPartnWZPMUIwR7W-Gw2dYxPvgg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpw1GIbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi7TkP/05WuGUn0opY7QQ8sZB6
OuKTG5SinWEzjuroAKgG/nD8WOveL+GRtp0cJ8+CUdvw0WpzZQeuRnSX/zDbSvXa
2G3pIBOvMcd0MOBBaEHUAtOHArZybsIuoFTVTzsaAYyHf2B7cc7KVbJZWRztmYSH
Z/OUYaxPHYoD6cHC4FlSNHyJplDqLj0LpgZOwY4zP0jaWLbEJpkCTK9Izl+ZIB4N
Q15I4WFfnyUi+J+3/mM3Rl4UYrS0U55ydarl5Io0PUsY/ORocxQY7jhXTvFyVmGV
xEythQnLVsvYici8F6d1tA/VcdG5jbo/JxRgrG53yGGuZX7x31CampUCrUOJRJ7t
bMsQwZz/VwpxL11Pg92G9bI3mzCHb+CZDRLT5zh+DN8cOkF5u4GBnI0CPKaqFAdw
deFt0WVnrrosFn0Vf0p17OrTiycj+f72S3L97DLCiH+0A02LR5XC6rxe5ia0xsFj
zXVl/z67OSLLN+g00eH/Gm7t6wSmRHdNY8QYBxaoIfY7NSPC4sfAm0BPcRfOtHEe
aN2QkZlUqy6LOPzLMKJXsVo1oXp94QXx5YgJpObLC1OH2GasPwX+teqCVXGyJZpt
we0fT64SnRaq5A4TfIcEcb2QJZUmH6znzcgROxCXZIJ1Dla1nW0ASQlNw2z5btj/
bbygfsidb6/n+WxVmEd5JJI+
=Lf/s
-----END PGP SIGNATURE-----

--nextPartnWZPMUIwR7W-Gw2dYxPvgg--




