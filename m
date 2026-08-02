Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A9CC55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 18:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7s3GZYSnT0cjOvsmd+6nT8896EOTxni+8aCua2o/oc=; b=OKlsaZOeLoUminwhgHmzdbaCli
	y675YpSG3q+BO0ofx+Nt7yAgcCjkDiXyKj1nViXD0arP+ZSXDo+kYjCc/tbl//oG+6GZpLLaNZbSE
	7UNXVFkLknjU0VfcvJ3ZRC8mcveBhJTPfwx/0Rea9nd8ULOtgvDH7tQhUrdPV734ITdueAvuKN17c
	ytaOU4VkUZUa3XBk9ciTRmtcyBha3Ugv5qUzMeBPoB+ekdhyeqgK8W+JCjGQNhTexbQWS8dFYM6xZ
	EUX6cJvjd1Wfis0tVOsG3JEuKpnXC81UEZXtc9QDLBC8Vk44BQJzrhr8iq1/JNKeZEp45iRH3nF6W
	XCHuu3GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqaso-0000000FvqS-3ZDV;
	Sun, 02 Aug 2026 18:25:58 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqasm-0000000FvpP-2cwS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 18:25:58 +0000
Received: by mail-pj2-x0b.google.com with SMTP id d9443c01a7336-2ceb5a39c48so8716915ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 11:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785695155; x=1786299955; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F7s3GZYSnT0cjOvsmd+6nT8896EOTxni+8aCua2o/oc=;
        b=ZivFzCHugaAxc/wqeCsPDqBC4Tgcqmv3FcCGZ6dbz9CLD7WG5l4MwqBdiT5Uyvlugd
         gML3OPrHyD39PjYkMHDNq1ARR00uf8qXALk3eB047ecDjj+di+d3Tjede8svJvSOTkk6
         fji8yYHltCuclWFCpZ8gp+WO2SO5BEi9CahSGuLtTg/Cv1MU5qgYzxM5Ahhfvf7ei7/V
         s/BcaqWAdEzlbrHY1qJDEZdDZhg5fv94OSHT2kl+C6c8qZppJ+i+RpZeLhiJl75d3jax
         vhY1pQEVgVkRSUqcDZYJSPS4Hhr2GvZ2CtuU3smrQmBjBUuiPpLlVg4Jlvj5oJWZ7+3O
         x8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785695155; x=1786299955;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7s3GZYSnT0cjOvsmd+6nT8896EOTxni+8aCua2o/oc=;
        b=aus1UxcctksA/FUw4f/Z9mdzugtigXfTir4dBJd72n4Zaybelup7WejZBDpcA+MCUw
         dkMqXWxQBGMSu+B0m1/o68oXHnw4KNEq26rPD5sHq5w00SFQPgYKuectxRIA64W1JeJI
         DiIWkhrcxlzAb9kNs/0XBtn32xJEd5VHoQ+2aoyc8IsaMaX50H67kf6g8q2rd4lhOUx6
         qA55pXK1R3+m0DkmnbXFHnRiQDGuLVEx/6ITeNM9R+v+9fFNxE7bx9v+4emZzl6Ru8Ig
         eS7sHHIUoQV1rPyEeJ00ivf4w1RiaAuxFq1BGSz1OWJEui5jin6RcGDFKlyPkTlJoqik
         aJSw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1kChDm8EEeru7F/zfe2EXJGnDYs0CKoUFGsorDgvX5f8hWxHtV81Vn5SJ7YLbEM/Ps6fjdmKpLJZHo8xvFLfX@lists.infradead.org
X-Gm-Message-State: AOJu0YyHokkL2NOHAma97PqwWoDDbB0u/bz8INGMdhEe33H0gGoT4jVJ
	YThQbQszBcjst2bALUofHOS5Oa6/JvKuNDY4K9CprExwCcr8B0Xz0z+Q
X-Gm-Gg: AR+sD10ulkzCsH81kT4IoHe74rFNHzycx1wQK+MRoHIdC+xS+XTPbXNMX3U0hZjB0kO
	u/ZaPN6KhYsu0eYG1SeOqFFx7Xr4xhsyLAe2x5tTNOTHLf6Bbz5lTosiaskS3G3siYakS37S3Td
	hNGVOn6nX0tkPeZBl23+3hl4QxN9qwP9u5OythafQMTLNOqqY+w2wQFwGXJvpkTqKnArEUXNH+Z
	LH4rRpl2Ki649r8rudVs6WXcKHiM69lMWKVUAVoIV+v7FZ5lDZ31CDZ/ad41hcNSEZUqgpFeXKm
	MoLdaOgMhAGhHvuvGy8uAvGiAMoeMQe3VK9iyhub5cbF0pRAxPMRtYfiCiQFkgcWNMSfrlUK0G5
	KxlcNXTZSm5GdLyRBobvXezc5nf69GT2QsA0A9NgZMGxFAwRkTbvyo01u3kxuYcpMdwoLsbqa5p
	k08ybHT/Rj/QwMIHJTH0/rKYmpGyiT8OkdKIFOez1pjuXb0rR50We+tDHXPlOND0dh
X-Received: by 2002:a17:903:b4b:b0:2cc:dacc:fe27 with SMTP id d9443c01a7336-2d0522984dbmr69929465ad.30.1785695155310;
        Sun, 02 Aug 2026 11:25:55 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:5a0:1000:10:233::14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0eb7b7sm27443245ad.39.2026.08.02.11.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 11:25:54 -0700 (PDT)
Date: Mon, 03 Aug 2026 02:25:45 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Shawn Lin <shawn.lin@rock-chips.com>,
 David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, Jiawen Wu <jiawenwu@trustnetic.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_06/10=5D_net=3A_pcs=3A_xpcs=3A_add_?=
 =?US-ASCII?Q?ANRESTART_support_for_SGMII_link_recovery?=
User-Agent: K-9 Mail for Android
In-Reply-To: <2886b24e-1c3d-48f7-8b22-9620fa0404f7@lunn.ch>
References: <20260801142244.679437-2-coiaprant@gmail.com> <20260801142244.679437-8-coiaprant@gmail.com> <cfddb747-11d0-476d-8402-e0886cca582e@lunn.ch> <CALj3r0i1TCTgvm8FrJAJqmZgoJp61NCxc_xmVYaDFd-gh4H=7w@mail.gmail.com> <2886b24e-1c3d-48f7-8b22-9620fa0404f7@lunn.ch>
Message-ID: <2E676CD9-82F3-404A-B24D-27679042783B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_112556_671226_B89FE009 
X-CRM114-Status: GOOD (  18.29  )
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

On August 2, 2026 10:30:52 PM GMT+08:00, Andrew Lunn <andrew@lunn=2Ech> wro=
te:
>On Sun, Aug 02, 2026 at 11:11:40AM +0800, Coia Prant wrote:
>> Hi Andrew,
>>=20
>> Thanks for the careful review=2E
>>=20
>> > This probably needs more wide spread testing=2E I would be afraid tha=
t
>> > if you kick off an AN cycle, you loose the link until it completes?
>> > You would of noticed that on your hardware, but other hardware
>> > obviously behaves differently=2E=2E=2E
>>=20
>> The trigger condition is: link is down AND an_complete is set=2E
>
>Ah, i missed the "link is down" check=2E That makes it safer=2E
>
>I still find it interesting that this devices is different=2E Has the
>silicon vendor done the integration of the licensed IP wrong?
>
>> Regarding testing:
>> - Jiawen Wu has tested this on Wangxun NICs and reported no regression
>>   (Tested-by tag included in the patch)=2E
>
>Probably Maxime will test on the platform he has, but i don't know if
>any use the XPCS=2E
>
>	Andrew

Hi Andrew,

Thanks for the follow-up=2E

Honestly, I'm not sure why the RK3568 XPCS behaves this way=2E I don't hav=
e
other DW XPCS hardware to compare against, so I can't say whether this is
a silicon integration quirk or something else=2E

What I can confirm is that on RK3568, the PCS does not restart AN
automatically when the link drops and comes back=2E Without this ANRESTART
change, the link stays dead forever=2E

I agree that wider testing is needed=2E If Maxime or anyone else finds a
regression on other hardware, we can revisit and condition it with a
platform-specific flag=2E For now, the change is limited to the SGMII
recovery path with a safe condition (link down + an_complete), so the
risk should be minimal=2E

Thanks,
Coia

