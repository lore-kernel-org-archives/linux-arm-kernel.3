Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682C9C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 13:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLbCdf5ydhGRwAPCjiKPFxPNXbtTOCnpAyz9+gFbv3Y=; b=EDN8GOeX2bGVX16rxNe9wLwst7
	rWqCG9r6+zBx3vDDi0aYg1NHPADQHcW3MVVir0uU8oeJlxux52MEWea2rc8DofP806e1yPC8TpGDR
	VJZQ+rKojX23MwQsoqnG/8D4VK/LwPICdJyunuxcQGZJc1cFqtJyRsG7cXiAfYqs42ayuopbYuUCc
	yylVUblaTqJ2djhroSOTniKcHnVUyPE/YFjfonXwMpJwANgk8tB1epyPMbWywTdB+qogbyaFvYgRs
	4TDei/BoeC4gz0s9mo3by1Vp5MWs1LxSWbmV2Y4nZFXZs+B5hWQMCsbM8iMJoKMHv/QFDwxlgfqeu
	y1PyHoVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpS6g-00000004kvQ-31ov;
	Tue, 04 Mar 2025 13:14:46 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpS56-00000004kVq-1I67;
	Tue, 04 Mar 2025 13:13:09 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-abf48293ad0so547965366b.0;
        Tue, 04 Mar 2025 05:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741093986; x=1741698786; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLbCdf5ydhGRwAPCjiKPFxPNXbtTOCnpAyz9+gFbv3Y=;
        b=SirTmXlzfp3lDa2DnuCTzvZh2JAz0lRLMPygWmwFONKlheoV9fS4vdeOY43hGVcEXr
         rdTOYcf4q11hkLQTu32jOkpynKAvXpVhqlnIck2sPUa/EYURmyF3acfYG4LTYAMg5Mfr
         07K5ppCoNxt2duiZjeVyQH0KkwoW28Iw8jE+IHE8dPcAAtlzYv5jCm5ITOSEZjLbQNt8
         7Lt8vOBAxmhU5j6tQXd4lYjPSL49+oNELHKdKMD8Mt91wYs0so9Y2PDOoIPcsnZFTKVN
         ECmAXS6t/ySvZf6FYmwZRTMcqu8wGdZB/qK+twdjoS4c2nIrDWLZq5fNhOPeLmpGGYFv
         0hSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741093986; x=1741698786;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLbCdf5ydhGRwAPCjiKPFxPNXbtTOCnpAyz9+gFbv3Y=;
        b=pB5eKHu0kZMm+e1EaHwWyfVUrLIKM6rk2PCp4F6uKPxMCIjuTO8T/B1Vf778SE2Tpr
         ie0+Gdn6+ufFWD4uBOtSo8z+ug3YpCgfXPjuL2/JlVBpcS509Jwge2LxvvHcoWCmD4P+
         REspjX5Ai5ybUS1uGDrMJAj5KIbI1LZZGbfybF2yyXtqcB8mZJblDO0+/ApMdq6s2Vn+
         CJXpTObaB5uqJIIdwFhTa5w79OJ+i3V5i2Py7owM7evPzFFKjdeinUidP7lH1aUA+aTP
         pB8anoOSaVcDOUuq9SmZduFGnAwo2f3DYrUq6VitzyrXMTqMtD7tIh/JvEeQE4UOGMEs
         sCeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUUo4Wlf4WHAeqS66g/1+peMvM95HVHapGh0t/aZY/J5wviDFZybby4HmrCbSom9wQrIME1+MliKDuc0l1upw=@lists.infradead.org, AJvYcCW+b9MYogPkekUkBTFDtcWSqxrcGpqAuAo2lp9hzdmPJ4jPwDN6lE7SRac0GMhydzqIy3bN/d/qF4W4mRcRHakM@lists.infradead.org
X-Gm-Message-State: AOJu0YzI4S6TNHlcBwgj1XxkNfsYqtoqMBn+1ypUe7+YJr4quFvMHsWk
	yZHXHoHy86jL6jR1UmiIQqW7sAJX5qWUN7ss9QJaT0CTTx2UHqJz
X-Gm-Gg: ASbGnctQsfX5g5hvW+qodp3ZG7MWh7mtFWGGrR+JGuA2NgjneBlFyeH6EA6sCGvlg7L
	ZnVaGL8tvbHb0A7MP26apdj/S0mPW1XahqN0ZrO0jLPe73ttP+mT0XyS+V8LXz8p0K+VRzsPHfD
	W7mG58+JwOZqWBI6i7KzEKn1helC+xqU0jsupoedNi1uXDyQ6aq7okULtmVAe9Lk19KBUIQyIJO
	QBsFBRXat7OUSozQU+OOaJMA+dnOkFpazmPVNS8Dc1BhmMrka/oyhXtt9JS0zv05s1QMQp7V4UW
	3fXz1oymGe2AqhUuTa4z/joR6rQ7MHGv9NUroxtqTf0wFL0Pej0Z3i2TRh6xCPcmi6LdJes0TXF
	scBkHLN8aOoyaAOAOdx99T5X/xw==
X-Google-Smtp-Source: AGHT+IFoaUg9Nkh97ooIflZaTgzJMVg2UFR+7WPJFlk7BUC+KoSF3yd0IR8of6FOHQwHK0CM0VOg2A==
X-Received: by 2002:a17:906:6a24:b0:ab7:6fa9:b0a9 with SMTP id a640c23a62f3a-abf25d94191mr2160998666b.11.1741093985833;
        Tue, 04 Mar 2025 05:13:05 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c2f408cdsm8118489a12.0.2025.03.04.05.13.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Mar 2025 05:13:04 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
X-Priority: 3
In-Reply-To: <7b8767fc.3607.19551aa5f74.Coremail.andyshrk@163.com>
Date: Tue, 4 Mar 2025 14:12:50 +0100
Cc: heiko@sntech.de,
 neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com,
 devicetree@vger.kernel.org,
 hjc@rock-chips.com,
 mripard@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 yubing.zhang@rock-chips.com,
 dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>,
 krzk+dt@kernel.org,
 robh@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <047EECFC-7E55-44EC-896F-13FE04333E4D@gmail.com>
References: <20250223113036.74252-1-andyshrk@163.com>
 <AC3DE87B-64B1-4C34-8E1B-3900E2C53AA3@gmail.com>
 <7b8767fc.3607.19551aa5f74.Coremail.andyshrk@163.com>
To: Andy Yan <andyshrk@163.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_051308_343546_35F2A9D6 
X-CRM114-Status: GOOD (  13.27  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Andy Yan <andyshrk@163.com> w dniu =
1 mar 2025, o godz. 13:24:
>=20
>=20
> Hi Piotr,
>=20
>>=20
>> is it worth to play with this or it is too early?
>=20
> I think you could give it a try if it using the Standard DP=EF=BC=88non-=
ALT mode=EF=BC=89 port for output.=20
> Since I don't currently have a development board with DP1 output =
available, I haven't been
> able to test it yet. As for the Type-C Alternate Mode output, some =
patches are still required=20
> I'll  send it with V2 tomorrow or next week.
> Feel free to let me know if If you encounter any issues=E3=80=82
>=20

Andy,
I added dp1 enablement in rock5 itx like this: =
https://gist.github.com/warpme/bddf75912193f57724c49216d5d85d4a
Unfortunately it not works.
For /sys/kernel/debug/dri/0/state - pls see above link=E2=80=A6
I=E2=80=99m not sure: do i missed something in dt or rather issue issue  =
is in dp code...

FYI: schematic: =
https://dl.radxa.com/rock5/5itx/v1110/radxa_rock_5itx_v1110_schematic.pdf




