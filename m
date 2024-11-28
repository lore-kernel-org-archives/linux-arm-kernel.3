Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D9DD690EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 09:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8r4E+fAxvn95ykDQ3t+Nmyf8EYUz2dFT+lg2PPw2HI=; b=yKA1BV0eDlc7dFnwYmTU3k269D
	9vNzQIe2VIHjqAe59ICKae/5Lpnv0Fwdg9ikCgmRRnoP+WP6Co16nuIhv68bLf9SZyZDcdwz3OwHK
	3sI3p/Y8M7VuXn+mNt23xFF6A/mCcfXvxHewqbk+cN+lTFRY/Z5D3jOOItVVExA6w/hNzR7f+23j7
	GSthGmVlEWUblZYdMKnZV4v0ss3HUpOiHdrnDpr2H6D+t8QUdgmQLHl5dOg2/ZBVi/ZLDTNcV/aHq
	4odBb2tm2r1dq+bjsNsBEmYgDfNWqtYP/5pIV4BDbPjrLzQvxjozMWqUwbSbP/sIce1YVRlh2zJZ6
	rNwWu3TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGbBp-0000000FBju-1Y8r;
	Thu, 28 Nov 2024 09:52:02 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGa4E-0000000F1xV-159H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 08:40:07 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-382588b7a5cso424621f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 00:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732783204; x=1733388004; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l8r4E+fAxvn95ykDQ3t+Nmyf8EYUz2dFT+lg2PPw2HI=;
        b=eEMHux9hVsfWRM4+0TaBGWzvHrR9Yq5/awZeJP2j+KljAmRfurFy4XBAn+n5u9lY4z
         t0Zcvze0LmkMqkxwP8Ljj6J9CajAdO6KHZd+Wr2hD+KjokC7Syzo/V2Vkvfn0eTSWNmV
         xu1hKtaJ7KfIYzv7VnUNvkY9AEM9Q7B4tEM0x04mcXVFnP+jDPp1dPJfDWy2Q/3Smmx8
         xeziYUw9OTin9fLu19elP1mmi7IhtwwdG6IvPIqHkOm3/Ilx7oAbzv74jQfrlutFQKNF
         16Ra2usGZ5wNyfe6f2/OXj3gY+g4KX+CLCA3VcYaiJQV/UvuA4ls1Q37nvyaGws7giJ/
         84Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732783204; x=1733388004;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l8r4E+fAxvn95ykDQ3t+Nmyf8EYUz2dFT+lg2PPw2HI=;
        b=vcuVYpMvZKosyDE471rULQnfXWYoMRJeMWtz6ZVg8acSHoTnOYjELU8anFM328QjRj
         gmdY5olCoA5s9DJxsN+tPwVKfql8REocYpIquwXaDTf09MwhlKX0A3LudP4m9ovdJIxW
         +nLzR4lUDyXjOPbFnFeWLgW9MYE0fNt9WC0YPUyFkIFL6NWl9/Wep9PVp77pI3abUgAe
         WBaTi4Nb7EHinQpQnOFWjSR11kcQLlw2ZCRskyJAGk8hWmeno7vKsQTIoXbPH7YZh67H
         +5kH6+NpaoUFTrNtCz9Og3boj9wLan4oOc44RHeVfSF3NISVq22lTNUgnKUwiwEf42XS
         t7vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv6+VLgNOT7asjxufddCSoFJ1eYFSThSFLrmIvOqHlWW/BmuaE41B/9LwIlOqgEWKrOE/i2dDSScPGDyJYdguz@lists.infradead.org
X-Gm-Message-State: AOJu0Yx++NikHqoPRbI+aO+InXRhMbxiz/fojN4VQYRU/coKuSyLzuGZ
	5voNylSoeCsybt1CktfJ4VSj/JHecjFmNDSoL+urr7SNiBK0BZavrz4eRSJ8iGI=
X-Gm-Gg: ASbGncvYciSQezZvWYP/YT+bkxBK/qmfwmnDX5u+oL1mW8SZavNemyLHydKWxxsn4en
	boS55t48d2Rxug5u8uBXMxSGYco3fhZ3H11H4pwSWe4gyf6W/0Jz062jG8k0bPrhphtG3yWhmCB
	x1gEvP0pjv616VYwbFDV6ffNmyUB8tmZi9yRPdqolYFjKa2LMBgCFgAFcDr0oGSEv+gc70mvVVs
	dfWcJJt5suNPgsPDnAkl2ugKtTwNXKi2Rp/KSRKI9334vZTsRAhXHs=
X-Google-Smtp-Source: AGHT+IHLCVGEBiGpNB3pr06gJDHBvejAWzRugYtAncqUTz6NJIMOpbiyuWDq3lH6CC8FDjfooG1oIw==
X-Received: by 2002:a05:6000:2d8a:b0:382:2f62:bd45 with SMTP id ffacd0b85a97d-385c6ec0980mr3638454f8f.29.1732783204673;
        Thu, 28 Nov 2024 00:40:04 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccce7859sm1096280f8f.0.2024.11.28.00.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 00:40:04 -0800 (PST)
Message-ID: <5d2a32a9bcc38f31beef56c04d07f6d53aa49e06.camel@linaro.org>
Subject: Re: [PATCH 2/6] dt-bindings: usb: max33359: add max77759 flavor
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>,  Alim Akhtar
 <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-samsung-soc@vger.kernel.org
Date: Thu, 28 Nov 2024 08:40:03 +0000
In-Reply-To: <8325415b-4af9-4bef-8310-39410b10aa84@kernel.org>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
	 <20241127-gs101-phy-lanes-orientation-dts-v1-2-5222d8508b71@linaro.org>
	 <8325415b-4af9-4bef-8310-39410b10aa84@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_004006_307629_F5024CA5 
X-CRM114-Status: GOOD (  13.17  )
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

On Thu, 2024-11-28 at 09:17 +0100, Krzysztof Kozlowski wrote:
> On 27/11/2024 12:01, Andr=C3=A9 Draszik wrote:
> > On the surface, Maxim's max77759 appears identical to max33359. It
> > should still have a dedicated compatible, though, as it is a different
> > IC. This will allow for handling differences in case they are
> > discovered in the future.
> >=20
> > max77759 is used on Google Pixel 6 and Pixel 6 Pro.
> >=20
> > Add a dedicated compatible to allow for potential differences in the
> > future.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> This should be sent separately to USB.

Sorry, it slipped through into this series somehow. Will do.

Thanks
Andre


