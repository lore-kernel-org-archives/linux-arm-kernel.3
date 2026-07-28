Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B85FC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dUKZYq5xkF+c+j8L2UCzb9nPYl48cxNMgRgY7fYgmE=; b=h9I6MTxpYG2peu1QyBzKHKWY79
	J+IpfxUAfemAPVrwc/PB4xsCQSLjOzhTlSSGcxehhb9QEB83J5OURlkmK2w1IaXQ8S82xsF2+li1J
	XcoyjBroShp3El9QJ9ri8QpbRX5zYyRSDogQiAnCgHP6GiYf97aPpCTUXrROPHPugdPeYawICHjNm
	yxxrTllMfMYSgYa/meXfH/lsslPniKEfzxx7H8oDEPz3pYbEL3+UkuKUPfw80PgJa2KMF0H/cAROG
	R6xMpGEB3XFEBXgelw4QoWTsWlYVhWOVRvSlD1gBpADvQkAAtWdvOMrgnTQy1x4oqMaiJuNp7f00r
	aPh2baKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopJA-00000006JsF-3Etr;
	Tue, 28 Jul 2026 21:25:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopJ6-00000006Jq6-3S6w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:25:50 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493b966dd74so1653215e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785273947; x=1785878747; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1dUKZYq5xkF+c+j8L2UCzb9nPYl48cxNMgRgY7fYgmE=;
        b=lsTOm87rn48E9atRlWChU2fp+1pRCg9w6xQTqh4Jm8BOQAf4Bxv7XjBOyRXtrnUzvV
         yAnhcp8yxeZSVqPpfdR0+YsE/6qFsJ1+V8spbvBa/+brtjvKdRilQx7cET+0EOhlFpp8
         225qxNgdzuxgSBW0m1vIuUIVkYEobSQWRngIujgX0R13rIytVnTj+iHkHrw2WsaX6D5A
         nAGNPrgVi9HARb76mUkTWe2UXtLlPcYD8F/jUP9dqSdacCX0Vvgnu/O1pQiKZarJmySq
         xxEi4TOrBm9PQPhPrTF37RWQF51Nuy/nq8pmEV9gvKyqvI3JyQu56nsXoSSMMjZo8W/v
         wPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785273947; x=1785878747;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1dUKZYq5xkF+c+j8L2UCzb9nPYl48cxNMgRgY7fYgmE=;
        b=L9AEEM2Mrp6Ylgn3jvZ/pk9wO6joW9w8ClqT5RKWKXaDLz+lJIRkImOQTSlq6naV60
         Y2ijEurZaNM0nCrvOpTIHT23HMldR1YE0yGuHfOf+i6JY/8SryfsDU/bfuJLVw3BWm6e
         k4MwRkhnnVtam0+0zPTZTgwLT5EpiRiQ/KiXkUxiDPJJvJ+6A40QhIL2le3jJeDN276E
         x42yC5Onw4+ZB3l9KRA+Lef8jbXZRrljJAe79RmmKlXywS8UlJGjKab6CiZnIV9qwPgG
         RxANaZRuJzmsmqKT3Sq9TlMVmffdpG4esMGq89U4xz0ORdrUYBF1ypfsC/+a4VzetuT/
         aP7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoBVlcicczoBmGfOaiFFDWdcoU0jmbvIl9scInli5dxDKn9aYdoIED9UyjUnVIcYNiKR19X0baBVT26fP8rQcYV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1frAD+wgvMyBSGP3oEHF2dODhPZUqbFZZ/ZYv+jeMME+N8DRs
	TFTkBv890zs3KPCTVbaZBKkLyQo5oeP2SM1nt/2rBMgPuPaQkSH2DFd7
X-Gm-Gg: AR+sD13HmTcmct3E8jfIgsWytdMzTz7BZ62IIBQq7Dm/LTr4dSAXBR0ytdDy3J1hOVY
	EVvmiZzOoy5S+EovpA0dZevD23IlgVLJbUvZRg81GK/V+I7UFpxKhSUWIee48eQq/RGjpU9I1J3
	njdc6E8B9PsulLnrbzNlAV5sbQaAItozVuM4Zugl8bTQMM5GOl06yp6uGOrlhmyk/at+Dvs7jse
	K7Ia8UKg4cTzsx/mznrCtCWAx3+I5sbQ0JNu1h/2l96R/fiqWb/G3St86iivzbhO8XFOvELbRkl
	hYhaNglffUXAiuIAmOWbqC/xI/7MEmzawTC18PzCToeS+cZlA6MmL5Y/Gh5smZEhAN55FGQ2XK2
	U2Y+ZgrxO75vAs6oZBTPxhA+2X8Snl+6CvO/AcUyYh5lbEupF5jx3eGKw0P31FRiylmZfuisN5d
	rIelterDs2/kEL6KF9PybGd5ImpWhl6bYpHcLSosX2e326aqognRvQQ/Y9nUq7oLpHIaVxCWo=
X-Received: by 2002:a05:600d:844e:20b0:495:5375:2510 with SMTP id 5b1f17b1804b1-496c6568a37mr33118015e9.24.1785273946598;
        Tue, 28 Jul 2026 14:25:46 -0700 (PDT)
Received: from grey.localnet ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45c297dsm103054375e9.7.2026.07.28.14.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:25:45 -0700 (PDT)
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
Subject: Re: [PATCH v8 05/12] clk: zte: Add Clock registration infrastructure
Date: Wed, 29 Jul 2026 00:25:34 +0300
Message-ID: <MwDLqBgXR7G6dGkTtCaRrQ@gmail.com>
In-Reply-To: <ami0TaY84IslWZyo@redhat.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com> <amiw7mfPfSPjLHLH@redhat.com>
 <ami0TaY84IslWZyo@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartYxrm5NhARqO7C27MMFWz9g";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_142548_883530_0D97E4D5 
X-CRM114-Status: GOOD (  17.03  )
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

--nextPartYxrm5NhARqO7C27MMFWz9g
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v8 05/12] clk: zte: Add Clock registration infrastructure
Date: Wed, 29 Jul 2026 00:25:34 +0300
Message-ID: <MwDLqBgXR7G6dGkTtCaRrQ@gmail.com>
In-Reply-To: <ami0TaY84IslWZyo@redhat.com>
MIME-Version: 1.0

Hi Brian,

Thanks for the review!

Am Dienstag, 28. Juli 2026, 16:53:17 Ostafrikanische Zeit schrieben Sie:
> Looking into the other patches. There's more mixing of the clk provider
> calling the clk consumer APIs here. It looks like this just takes a
> reference and holds them. Would moving to parent_data address this?

I think so. parent_data::fw_name is indeed something I have been looking for 
and didn't stumble across myself. And I suspect when you say "use 
parent_data", you don't mean "use parent_data.name everywhere".

But it raises the question of how to handle internal clocks, e.g. foo_gate-
>foo_div->foo_mux->clock-26m. Only "clock-26m" is passed through the DT and 
found via fw_name, and only foo_gate is exported.

For the other clocks I currently rely on the string matching to resolve the 
parent named in the static init data to an actual registered clk_hw. The 
alternative I see is storing the struct clk_hw * in a table by index and pass 
it in parent_data.hw, but that'd require managing the extra indices. Or build 
a clock-local name->clk_hw lookup, but then I am just reinventing the old name 
matching.

Am I missing something obvious? Is there a canonical implementation somewhere 
that implements modern best practices? I learned that looking at existing 
drivers isn't always a reliable guide.

Cheers,
Stefan
--nextPartYxrm5NhARqO7C27MMFWz9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmppHk4bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoirHYQAJP3CdwusoH3pkXKfPo4
IsHXR5HpSkcfs8UCWKbXUiLjzTOXi23M6YRSjmwFG3d1x7/tF3zuRiRB7UoTbPxi
Dpcjy4P38mBhhj5ViTMPZEDb1+yGlH/55A3Q13yyGUZAYrWBvjlF1+CeyejwGj3i
MVs7cQGfnjS5eKxnSlMeu6YES3/GMT1FEr87RSiK1tIR7l5Ly+ZlVUeFL6j/QR5c
0fRWrLVaRuf40Z+Br0mTqVYameqPi3Y2txNe/WB5/6G3h+Pwgr8fa18n7kss1CR4
PLy4xOCkdwBhFr3V1XAwmLR903mrts0OzyiU2WEgelU4aIvO0g+IY/QpVCb4Tc28
sIFnx1o9RB82nrHOGyZ+tE3Td9Z8jdagf7NCcynDF9OBNO8d2p2VHrytuTO05BU0
6WTcRZf3HNTRavdGicG0D+UZLTrVSeATG7Gn84xOtEcqnNQgqGw+7FFrbYL3uvnB
zJpQ0g3TxhaSjw9l5WYghaypuxgBUI3vsXsNBCFUi9/LHutvv7c2UFoB9pGMO+0F
agh+s3+qnrEIuyCa6gMNO0ARQMjjfVWPCMn+QO0W6LDHLm9V862PI8/fSAHIJtBw
8YniFVm03EcJNgSelHRlZO20sDNBbjjcJdMzKez23UwFsD+debYrdpQOo4Z1MVqr
o4X7ofieFY9lg1CnhuLk+OK+
=e+iT
-----END PGP SIGNATURE-----

--nextPartYxrm5NhARqO7C27MMFWz9g--




