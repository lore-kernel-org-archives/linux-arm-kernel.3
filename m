Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13866C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 13:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXw/VUZk2/2TbrEzlxvJbX2hPbKCJ0toaMiiUQlOMPE=; b=UqhmrHrKRRBxa7ZIxpNxvRKdd4
	AcpEM6iPFr81+pHmAaj5bFwHlRO3y99yoTtNqk+BnKM6lh4x3yB39hc1OuaKQIsRTFfzazD8WEMq0
	kX/Ds0HJxoAovB8+CAS3Sxj6gtRzHj2FaqdVESRVdw/MJv49s9AzajWcgYEGlYI06lfmN227pTTX2
	oPBWBrMUr/So4h1DW80tCKR2NHfrWRzc0wEAJQzAag6ZHJ5Ps0APkq+YKGklI1vFzjinQkEd7JDp2
	XJ370z6wPmDY6fqU40kIOIWycs4R9O+Xp/Pe6TY8XefjLq6Z4lTpYyazfrY3UslMGckDs7qSjHRNn
	F0oMHLFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNaf-00000008J0s-03cc;
	Tue, 18 Feb 2025 13:24:45 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNX4-00000008IRN-2sn2;
	Tue, 18 Feb 2025 13:21:04 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e08064b4ddso485772a12.1;
        Tue, 18 Feb 2025 05:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739884861; x=1740489661; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXw/VUZk2/2TbrEzlxvJbX2hPbKCJ0toaMiiUQlOMPE=;
        b=YQ75ar+XUvemZK2DsANZjFa1q00GUk1zko2LVgRKJjUAZq5Fjp71/fFqmfvf1+pIcK
         M6S1TLKEWIlH8Dn/9hrC96FuSRBBEZLHPvesEOud1bfqD0LL5+xae+F6n1m4NZfPD+15
         Y4e+Gpe1WXiTi9U1CTWa5I4rwc0eNnX5A1ZvCJ00HV6EExRAVdeIrNXKVwmu4Q+bwK15
         LMZRnuU/dFwXLj5MB9Lj1AlysERxQUSr7oBiLfFMJljp6MD4RKTA8nVHu7+9XbVMtywA
         t2dxf34iypIMgirIZTuJZMnPYJvxWQuLIaY/W3t183wtCnS8VBUwFp+kqDoIKjl6jULw
         0tRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739884861; x=1740489661;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXw/VUZk2/2TbrEzlxvJbX2hPbKCJ0toaMiiUQlOMPE=;
        b=DzV/cu6c+xZnANfr2xHBMGAuyF4T4uXtBhkPHPoH8WCFmDFlJCcI8EgXjQxBkxZXpn
         GnllWuqrTA/4EgwRiftGSA+6smy9w9/43NbUuIosYp3j4KvRJv4UGvhLQ6r0NAfWz5nt
         979oIy8clUVoNYs2+fXX6TFW7v7ECMiyg2bCf5bEcahIlr12CY6P4HxCJZwZrnnxwCdW
         Ljs3O4lXa+MKTZNTMu+/HTcyEXCEbKDOr2A6yn6zOfs5DQMjCLFAONYBsrPpjGEihsP/
         BSJXjpD1atbnglKTpWNDnSi8D4vzT00muibTKPs9+YNGQTnp98CfBqeqVzOYkp/NPZL/
         mVjg==
X-Forwarded-Encrypted: i=1; AJvYcCUIeUq7UP6TQryJCSUyxWA+CcIYNmZZTFwdhtoCPI/cgrFI1Hr2nnCU31H79sb4uiXDqIwoaVmVn1P7lPQZMfA=@lists.infradead.org, AJvYcCXBK/NgOfbZORzsWJd+m2M9XfDqaJ+XN2Vldn2zPBHAsv6su0wNHSZn1nIoRBnH8QN0vQcHZkM7C8lfsE+sDP86@lists.infradead.org
X-Gm-Message-State: AOJu0YwUA29P8HEQIVkcuD1dB/v2EBoGcjaDfrqNIGX0VHWgkdPe1C+Y
	IyKk+rvmuqbCg/Hevc2JIm23elYMTRiSPHX50n0pCMmCrz0fl9yG
X-Gm-Gg: ASbGnctdH1IhsNy13ReowWO+53zCcaVygD3WEmXjZfzu6XQBDU1uUAIbqsQND3GeCi4
	KtzS923UxwexpYZNSRflKWKhdjnJ+gNogPgFc8XaFlsAfgN6+Owvlu5HEidX6yOjqRh38VRgy6x
	vHcK+vwpYHTwMpZPTgFYQX8ScyHbJa7GTY1Ug/T+z6RoOzaZ5KWszObC43TwYY39NkuW829+So8
	vhR/i5omkkzMopTcIR4IZ02TarPiXNMXtwMCqOCDRfq4sc+9q8yyaahhQOD4CtimYWOFHX0HTHC
	p1/nU0GbApzw6M83R81rmS6GQCRqHpXSPr5LROsF4mZQ6qjdlpKRgGl+xqEtFz63kLdcGzeH
X-Google-Smtp-Source: AGHT+IGfAz1/Ln9aF9MylRqFz1gstkfkLiDTO4oAQvkajZW5cUBk1t7bUxgvzU80gmDZNx8cT63axw==
X-Received: by 2002:a17:906:1757:b0:abb:b136:a402 with SMTP id a640c23a62f3a-abbb136a75amr388377666b.18.1739884860519;
        Tue, 18 Feb 2025 05:21:00 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb4d3ef3c0sm714890366b.41.2025.02.18.05.20.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Feb 2025 05:21:00 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] arm64: dts: rockchip: add hdmi1 support to ROCK 5 ITX
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250217132146.604090-1-liujianfeng1994@gmail.com>
Date: Tue, 18 Feb 2025 14:20:48 +0100
Cc: conor+dt@kernel.org,
 devicetree@vger.kernel.org,
 heiko@sntech.de,
 krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 robh@kernel.org,
 sfr@canb.auug.org.au
Content-Transfer-Encoding: quoted-printable
Message-Id: <AEAB639A-1EA6-4FA1-AAC6-C382FB280487@gmail.com>
References: <975CFBEF-4E37-41E4-BE3F-7294FE7E4D3F@gmail.com>
 <20250217132146.604090-1-liujianfeng1994@gmail.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_052102_722675_696CA9C7 
X-CRM114-Status: GOOD (  10.66  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Jianfeng Liu =
<liujianfeng1994@gmail.com> w dniu 17 lut 2025, o godz. 14:21:
>=20
> Hi,
>=20
> On Mon, 17 Feb 2025 10:48:00 +0100, Piotr Oniszczuk wrote:
>> I manually installed it on my sd card and sill getting:
>=20
> I have built a armbian bookworm minimal image, you can test it in case
> there are hardware related issues:
> =
http://cdn.haguro.top/share/Armbian-unofficial_25.02.0-trunk_Rock-5-itx_bo=
okworm_edge_6.14.0-rc2_minimal.img.xz
>=20
> Best regards,
> Jianfeng

Many thx!
This is very kind!

I flashed, booted =E2=80=A6. and have exactly the same symptoms & logs =
like on my previous email :-(

Being desperate I reflowed hdmi ports board area and - believe or not - =
this seems to help (albeit don=E2=80=99t know for how long :-)
Now hdmi1 works nicely.

Jianfeng, many thx for your persistence with my hw mess=E2=80=A6. =20






