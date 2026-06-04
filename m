Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFF2CD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 22:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGK6nyQiO5fRhl198UMuPRvqMBmif9tHjKq3IyAKSuc=; b=vIjuDpNODDCoGSHEgyynwm8/SX
	kfyNzF/ZTxSv9cf+bSXgi8Njuw635+D2W8+Ec6wnJz355mFWDDW8h23J9LDb3vGQcljpu9b4FP4E9
	4xKEmDGpwJHzkt8dPfEcXQ86Y5sEfVCpbMF5cJrcHXeFpCK+bv65xF60AEy3teJXHA8BoduC4bqOB
	+CHUdan1SAOz+nnj3KXVXZAGeY4svdm9RgaMt5oyWANVA4ZHO998PdGB336evTBEGEPuhZA/H4Y+K
	0ActMG5eU5v1isGlECttcViWTJStF+gmViQN11JUdfe+LpSMN80qsJEmIdj8+vK+NBf3tmftB+T7B
	o5IBfdMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVGhF-0000000HPSJ-49nC;
	Thu, 04 Jun 2026 22:37:53 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVGhD-0000000HPRk-0pim
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 22:37:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490be03d47bso10267265e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 15:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780612669; x=1781217469; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pGK6nyQiO5fRhl198UMuPRvqMBmif9tHjKq3IyAKSuc=;
        b=oGVhJBs++cYjHEm5DrLKrGqI1x7FlcN/jvSEtnv1QW5u83J86ouAB6MAR2ZUsEDloI
         4f6+iI3NkAR9Gh8X5lfDoVFvzq+WbE3Nkk8MgO6rzrZTQqo0bAe9x1ClS7wfEciZsSz5
         FjZUnBAFTWlSH4zqQxD5YL6LeKpdM/zWw1fq9duG6bk/sUiSKDtz2U9ueEfHqtWpEv/j
         4fmdDjeOygRkR+ny4ZfK/89F4UsXGzVF73NKYEErRgWc+Tc4XLsiiB5kITjdXVelzBh9
         9NqQD3zInTGgDoNKjWFD2iXWtOSh83CNDAkrf/vGifzCN99oyiSN9wSG4AdRzQOTArLq
         pOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780612669; x=1781217469;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGK6nyQiO5fRhl198UMuPRvqMBmif9tHjKq3IyAKSuc=;
        b=izms2i0w3FFNKJkROfGqkAEZhDR+DsDNzVwp+LbDj9EWQib2TIxKC+465hR/w5a6GK
         GfhpOhIlWP8agFl0twBAs1YZIc0LrfPde6oEK2zXTHiXXSU9SZ+tOHOuPdD0/IL+GpRg
         GaLyEMSGajE+tU3vqlI6OG2Z07RtX9AAlqlfs8O5l9QqrYk6vnl9mj6y/rWPUbJ39gpA
         Q4JJVhIR2MJgZ+2+Ufed674vKDkM+kojpfn0tP/MBzLpqgKDs+KOhdo2zrwaBAcvhqCg
         3ihppU5CwVfGE2sNkoD60nEdcGfdKtaDw0gT0i+vfKIy7+DCR2IcsJDOYAxgcmH3nvRW
         zRNw==
X-Forwarded-Encrypted: i=1; AFNElJ9ULUaCzmaiVH3HSQkzYWDAluAU/2GTsi88HrqayCvbwTZJVhSg300mZYBKkcGRL4N3by/V8ktipyUh3/JwapDE@lists.infradead.org
X-Gm-Message-State: AOJu0YzJZ2B35We7zSztAcHuOpTfe3hGbUVp6CLzZdKaaV0lwqBZAQIJ
	MJZuY3wd3xAmAX/JWHrs48lPiZTQJZP886AqgWrS0r1JKFy7cjJF+e3o
X-Gm-Gg: Acq92OFEoCAsRIRFfP1u+hHOMGA+k3+lBcOOeBBMp7eYO8iNSZf0hOtR1WmJWwkz7qK
	Vxxe1Z2jVn/vej/zl8IiPTblL/VCCvOIMGZ5CAC4CZjm4l2pjIe5X6l5yxXuZEa46wvQnu8jzbx
	/7RUdnBcZYKdODRQTQBTXNIOimoXd+dgCEcOL0p1Ggeasidma6tLNy6xfTGXgy5kWmUW9QCXkXA
	8v568ErAG7sWsdoy+kBhHDYX6NQNzQmc4KpB6w4/I4+4T91M2R1HQ2hoi7EnExmB+yGKbrOafM/
	2/3Kn+qOaS5h067Y2lwNGlf98BAtRxPV6rhLUBg2i5HywTofr/Q5eUznUvxaNjxyXf1sm3/KQDh
	30Sfe/vGJk7rze0QNXF/64OX+mP6eh0IcuNQzLu2jA6TDAMNMgCaNoxWZuPMqQE6B21iT0xlcr5
	1pvSGFzBDWS/ExdiaAh7zSgSpmQSFQN59wdJ7T3k5sXPcOJ00k7462fQfKExPPBAQ6hwMiUg2I+
	vQDEKZnvJmiUg==
X-Received: by 2002:a05:600c:6994:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-490c25de6f1mr7829425e9.16.1780612668566;
        Thu, 04 Jun 2026 15:37:48 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c1e20b0asm13827345e9.1.2026.06.04.15.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 15:37:47 -0700 (PDT)
Message-ID: <36c392676bc5cd69de5e8ca2cabe5ccbbced7517.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 05 Jun 2026 00:37:40 +0200
In-Reply-To: <20260518235432.07537260@ryzen.lan>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
		<20260510201644.4143710-4-alexander.sverdlin@gmail.com>
		<agr9m_tidBr6Cu2h@collins>
		<04da68168f92b196cce4d49c766fc62702bf6472.camel@gmail.com>
	 <20260518235432.07537260@ryzen.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_153751_254504_1827F308 
X-CRM114-Status: GOOD (  12.52  )
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

Hi Andre,

On Mon, 2026-05-18 at 23:54 +0200, Andre Przywara wrote:
> > > > +&reg_dcdc2 {
> > > > +	regulator-always-on;
> > > > +	regulator-min-microvolt =3D <500000>;
> > > > +	regulator-max-microvolt =3D <1300000>;=C2=A0=20
> > >=20
> > > Should be:
> > > =C2=A0	regulator-min-microvolt =3D <900000>;
> > > =C2=A0	regulator-max-microvolt =3D <1300000>;=C2=A0=20
> >=20
> > 0.81..1.2v according to A133 Datasheet Revision 1.1 Jul.14, 2020?
>=20
> Do you have the CPU OPPs for this board? Do they slightly
> overclock/over-volt the core? We have seen this for some other boards.
> But you could go with the safer 810mV...1200mV range, and we adjust
> this when needed.

I'm not sure how to interpret this, if it helps, vendor BSP has:

root@HelperA133:~# hexdump -Cv /proc/device-tree/opp_l_table/opp@1512000000=
/
clock-latency-ns  name              opp-hz            opp-microvolt-b0  opp=
-microvolt-b1  opp-microvolt-b2  opp-microvolt-b3 =20
root@HelperA133:~# hexdump -Cv /proc/device-tree/opp_l_table/opp@1512000000=
/opp-microvolt-b0
00000000  00 12 01 60                                       |...`|
root@HelperA133:~# hexdump -Cv /proc/device-tree/opp_l_table/opp@1512000000=
/opp-microvolt-b1
00000000  00 11 3e 10 00 11 3e 10  00 11 65 20              |..>...>...e |
root@HelperA133:~# hexdump -Cv /proc/device-tree/opp_l_table/opp@1512000000=
/opp-microvolt-b2
00000000  00 10 c8 e0                                       |....|
root@HelperA133:~# hexdump -Cv /proc/device-tree/opp_l_table/opp@1512000000=
/opp-microvolt-b3
00000000  00 10 7a c0                                       |..z.|
root@HelperA133:~# hexdump -Cv /proc/device-tree/opp_l_table/compatible=20
00000000  61 6c 6c 77 69 6e 6e 65  72 2c 73 75 6e 35 30 69  |allwinner,sun5=
0i|
00000010  2d 6f 70 65 72 61 74 69  6e 67 2d 70 6f 69 6e 74  |-operating-poi=
nt|
00000020  73 00                                             |s.|

At least 1512MHz is possible (but datasheet says 1.6GHz, so probably no ove=
rclocking yet).

--=20
Alexander Sverdlin.

