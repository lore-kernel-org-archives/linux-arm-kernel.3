Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736FAE6F079
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpBpI/8wSHF7t4KFhnjlrnK8AhfjX0W1uSniYzs6/yA=; b=UiVHSGuPcLYcjysvBD102psYf7
	Tteg/vSnWOWBwUXa2exosqyBjSmwFnVXtlZX82ooRdrJTalSzFbHmvNZmQolghewwdPThmTUIUpAL
	DmoDDfPSws5XDuypQKnkQfC7Jx4FtRXUvHpzr7/JMi6NwDy60wt5vC2rvPfmXMcyxQ0pLJbDHcbvu
	Mi6In5e18BErR6oUTJAMnftGPN0SSN4Y0VfpzTsZqqrwY6zfSufv4XR6YlzHNGVBh0yG8BVXHeWuK
	q9FCbOaAVrIWHNhB5edmOW1Aows6p299Mv8XMeuLAqluSj+lggRBdBLUGjBxucG6A7UxFo8rxPTZx
	XTg8ZnUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzD0-0000000EoBA-0lPu;
	Tue, 23 Dec 2025 10:01:38 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzCx-0000000EoAm-0egd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:01:36 +0000
Received: by mail-pj1-x1042.google.com with SMTP id 98e67ed59e1d1-34c565c3673so2673582a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766484094; x=1767088894; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HpBpI/8wSHF7t4KFhnjlrnK8AhfjX0W1uSniYzs6/yA=;
        b=c8fMb+8CVLg7aQ01ZFwjRe31r64SmxokUMAxysOF09azF1Rz0vw1ErqTFoRzOhN2Mt
         XcstXnel0Zp25d0QwkEmnwYmnsh4FmuWdv/QDxcT1mKLe/L/oWxOwbvBXWVt1XjuFQcw
         9kXukcQoTIe3IDrBB9fSLCNkTAaV0DL7EJEsTy10qfzAXwFQI8ZUZ7T+qpLZCngaUzib
         zBR4JiuRoWaTY06+Eodb7np44SapYpe0dlQP7L3RTfmuV/RSaPm1k0M2u7drLJh3nawQ
         Z/xT/sh4/FO/KKpG1SEZY2EmWcyWv6RvN/LdnbvptjiWReRBtWV+c43MdxgvZ2YrEZQG
         luFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484094; x=1767088894;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HpBpI/8wSHF7t4KFhnjlrnK8AhfjX0W1uSniYzs6/yA=;
        b=H7s5ZWczGRpEJF/eUGBcIy/D7GW0dI1+aasIWbj64NPZNtV7BqTx8Il717H9P+1pP5
         9R3oY1cYlIhCgtSIp0AIJleS4wj8LDiom8KpCYuynhIKBEsrH+tCBWl6km7puMFCYzy4
         wfqtbNTVjtQBB/SrgxR5U3mwbda70CUzPzTiQkjNkAIx1QuYekPlezQo9ViEK++LcdQd
         9eeZDVYlQePH5XqVlYKI1CVWhc3USOc8ZRHgWCKcAVBri3S6tlVyKm6WRs9+NpG38FDK
         Tg8nw6adFGYifeKz8NvaTqxC8SBzyX0YeVM+Put6IObSuZLKOuWKJv783HjWVDA8poIh
         Oasg==
X-Forwarded-Encrypted: i=1; AJvYcCUUcVeOMJYwJdqcoF7+tgw6povTlO6x3qK5+4OGjqejFWPwkRfoIdBqV+zdllgNeYiDxsxQ39bPvaOuEH1z384S@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+w+NJlc6xybhqJy76oIOyBW/f2FUUOHHHL70LY9b6mHLrGODb
	AACoCdmgpTl4e3ii4ihblG0oOSigIFMm21YJdDQMJMliYgoMbFakE6VHQ1yo76G4Lqo=
X-Gm-Gg: AY/fxX5OTj1U1gPKFDDYnH3W3wpOpVbUt5Ws+3FUgshkSyoZvE4Mj9zjc2UPNCr1YGV
	+mwuSopA3CDY+bSCGCjGDEsOn5tvQZtmdDUnCnLdlAA+o26XloRswrafVDATj++VkkstaIMpVT1
	+lpCRj/zD7ylNpwhh1Qc2y4Y6YTwfWwIO3oCmyv1QhLyvdlUYMnHrd37wDxLgMkzWX72dV3Vuey
	kRf9bxb0+RrpdByVNDS5ayUJQRg9iA1gtZU/7mJ/VmTgUtgUOmpVLBvHCcMACf8JM1IteMFkuSI
	M4EiPjJdcpBNG7sj58/2+DyVkwD+GMfD8LtyxZiJ08BG96BCXfiFe+Uc+43Idp97j+x99IounHi
	fWx1EAHtg5vslWcNDUrfDasfr4qPcp4SDsHo05C4EQcd8SnTuiyHSdGBN+1VLw9S5hLAVwfSkQJ
	EpTCDll+FrdkeyU0vf
X-Google-Smtp-Source: AGHT+IFXuV7GadqIyPi+nPYJimRq9WoNp2FQ61ILnYC43nto17QpxsN8ikiDj+xBUwBcc1gocDeCbQ==
X-Received: by 2002:a17:90b:2e4a:b0:34c:9cec:3898 with SMTP id 98e67ed59e1d1-34e71e29544mr15068089a91.13.1766484093988;
        Tue, 23 Dec 2025 02:01:33 -0800 (PST)
Received: from draszik.lan ([212.129.75.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d4f7ffsm15451480a91.1.2025.12.23.02.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:01:33 -0800 (PST)
Message-ID: <28ead866eb9a11fb3f20ad49839aadd3993f3886.camel@linaro.org>
Subject: Re: [PATCH v4 5/5] arm64: dts: exynos: gs101: add OTP node
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Tue, 23 Dec 2025 10:01:34 +0000
In-Reply-To: <20251222-gs101-chipid-v4-5-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
	 <20251222-gs101-chipid-v4-5-aa8e20ce7bb3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020135_236353_A62C8938 
X-CRM114-Status: UNSURE (   7.68  )
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

On Mon, 2025-12-22 at 16:30 +0000, Tudor Ambarus wrote:
> Add the OTP controller node.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

