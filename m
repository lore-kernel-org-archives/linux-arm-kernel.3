Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18139C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knv3eV/uPl+lWimlwaG5qjUbDF4tZn6R2q3+oaVVNBg=; b=GL1AHKGRRNLYvr3dAbD45mClqK
	KA0ic5+45/AA6tvxCG17RbkrWntGU5pBsSCfJe0Rx5Q19jDrCrhRa0eFJ7TefM2SYdtRVjfmIJHhm
	Zg/1T0x6vGVasAkWgGjOoQ6pNIPAME5ENlxd8ycXXVBQzBhppDkjUzOIIocjV4QtrDXDv1X2hUBQ6
	/b9ajgCRG59I+jYF/upEoDJcyXMEtLqWkuT8UTCnV87WZaa05nghco7bbKe2lID11/T5e2VnKjyah
	GqTSy/C79/ZQlmBPRn0n2wcp/nj9QHtXVgt5z5lIRUIOdgSjp48l3qVtVrKwRzQlH7zKyIeVHqpP4
	ryoHfcsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis5j-00000006rBO-2wqS;
	Thu, 22 Jan 2026 10:39:07 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis5g-00000006rA8-3LX3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:39:06 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-43590777e22so490476f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769078342; x=1769683142; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=knv3eV/uPl+lWimlwaG5qjUbDF4tZn6R2q3+oaVVNBg=;
        b=w/YY+g6XDdRBv687BadBbuMh5URLWN+asZa3asE0DBK+reSs4o91acyaYTQZ1E83g9
         FmDpHA+pHdXIC1y/s1O3CTsUpYmNcR0LPiZkTRYYfzrame8FTdCJDwPX0yaM9m5oxJ6E
         n2wD0/YdiNRc06cM6ooMzacNSBD7ew8PpacMtWIc6DLz3FvTqgoxWiyzMGoofzyedo3S
         gYSljxJdlIn/oBKRVl10WZs8zlmxQ4HFLjWOU8ifUQZ4FA2IH3ylyYJJEXRBeOx3Rj79
         tLUWbDW34UqHbUv5EYiXu2eQKKSV3rAQVid5y8uj9WjCy6mxFwZz/eodxm2VYCPAHMlT
         +9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078342; x=1769683142;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=knv3eV/uPl+lWimlwaG5qjUbDF4tZn6R2q3+oaVVNBg=;
        b=rErTUlvrKR6Dm6Tf+vyjaStJFmQoGmvRimEPt1Klk77RfETzYR+NgvfaNVCWR46Y4W
         fCau2bW+Tvewea8Do6YvRnbUMpr3zRO57uU/ParG9o75LyAJCGXVmfe/lCrz5UoUUnXy
         8JPYG/HKAw3mvAaAR0MDBwkMN36y197ubPKvc0R3IXCxF7p3kQ/xHiKMjTEeDRiAcSax
         jVS2zDAHR0lxliiK3MHEabUppD1XzgCCKc6Kz0x7JIXX5sXaAJFqxP9ZcMJBBd+KP4Us
         2xDgwIosFB5yHe6SEjqXTXISapZzTCstibD5aKUUA3nsyMmu6ytr188X2CVtqvo8W3LH
         3okA==
X-Forwarded-Encrypted: i=1; AJvYcCXqqAmY9a3Yjg/n5tNavi3CHJQibD0PZkSNOXAJiQLhcejDVAGeadbkQdKDGiTWNpnHlQGBTs9xs+8dunXrNNbE@lists.infradead.org
X-Gm-Message-State: AOJu0YxrhYyS7xHV5+Q6u5yqsntdTF4WPILXb/CGwejXI6+TJNYAirc/
	BehnP1vQ+ILY55Uq8xcm8E1wUAhZ1b3KzVz1CtBWlMEhbY0uO1FXgOyDCao6MYlO8o8=
X-Gm-Gg: AZuq6aKGTUKAtyheiH5w0wGJifOn5n9M87fH1gejkgNlxkKB4oIWEcLimMqhZldZlmQ
	MI2SjCkYX/FGeTQ7SJHcEZDhrn/VxnIuCFml72BVQX2ydkybtSAqixDdrjnaPkRWNfxJxmZY5HG
	lZN+Q11Wnl6DXcrhI3eVEgdKgQJLceJiDCNCX+C4hV0GZfJVFz0Jw7Yc6I+ciMt+xbW3u6ccgJH
	xN12ftZxAA1DBl7zHFqpselo3tHF+XFiGQwxX5yui4FSmuKZWkjsUT6KqiejU7k+8BqciG+Ct3c
	3pjqXCycOW6xOyQ6vp+ABdmwa+urNWaTiRhwZozVXSL05bMY4HJMPsUqsHzJJ+AzGXbpO2oc9sH
	CJLwnyB/kIiHIkGw8ZmtCLE0eNjMRwi1FscA0f6hu7384CO7cJEXXTwNjer5znWD5SOUzuzfqCR
	YOGVJe+UeeE1Hd7ye8xQ==
X-Received: by 2002:a05:6000:ece:b0:435:a7fa:24ae with SMTP id ffacd0b85a97d-435a7fa2607mr2707643f8f.18.1769078342064;
        Thu, 22 Jan 2026 02:39:02 -0800 (PST)
Received: from draszik.lan ([212.129.87.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6cdsm45475978f8f.31.2026.01.22.02.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:39:01 -0800 (PST)
Message-ID: <7c78f9da40022e7bbf850ae8989c617bdc30cc95.camel@linaro.org>
Subject: Re: [PATCH next] phy: google: fix build dependency for Google
 Tensor USB PHY
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Roy Luo <royluo@google.com>, Vinod Koul <vkoul@kernel.org>, Neil
 Armstrong	 <neil.armstrong@linaro.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Joy
 Chakraborty <joychakr@google.com>, Naveen Kumar	 <mnkumar@google.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel test robot
	 <lkp@intel.com>
Date: Thu, 22 Jan 2026 10:39:01 +0000
In-Reply-To: <20260121-next-v1-1-c18068b091b9@google.com>
References: <20260121-next-v1-1-c18068b091b9@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_023904_859646_FA471AD0 
X-CRM114-Status: GOOD (  14.84  )
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

Hi Roy,

On Wed, 2026-01-21 at 22:21 +0000, Roy Luo wrote:
> The Google Tensor USB PHY driver uses the Type-C switch framework to
> handle orientation changes. However, the Kconfig did not specify a
> dependency on the TYPEC framework, leading to undefined reference
> errors when building for architectures or configurations where
> CONFIG_TYPEC is disabled or configured as a module.
>=20
> Add 'depends on TYPEC' to the PHY_GOOGLE_USB entry to ensure all
> required symbols are available during linking.
>=20
> Fixes: cbce66669c82 ("phy: Add Google Tensor SoC USB PHY driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601210825.ELrpQeED-lkp@i=
ntel.com/
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
> =C2=A0drivers/phy/Kconfig | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 142e7b0ef2efb9209781800ee47b820a91b115ae..5531ff31d8156cb164c32e3e5=
2d4a57b26a62d8d 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -49,6 +49,7 @@ config GENERIC_PHY_MIPI_DPHY
> =C2=A0
> =C2=A0config PHY_GOOGLE_USB
> =C2=A0 tristate "Google Tensor SoC USB PHY driver"
> + depends on TYPEC

Can you make this

depends on TYPEC || COMPILE_TEST

to allow some better test coverage?

Cheers,
Andre

