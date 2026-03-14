Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DCE107BCEB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 06:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGqE3n15B8Oam7oaufyM4egmtIok/tvgCx592UaF9pQ=; b=Uh4hD1ZTnSjDZnze3Hkgg+NF6L
	liwwjML3bRw1fV/QFksc6AZK9W25gfnvvn+zAKLB52Z5/BnQbcr0sp8gtQgB6KqwtK/UFPP8q+fPZ
	fMTPmet8ud8C96DvQQ5PDbAlHOyqv/AV7uKIzfew9t+04fjRrDqiHTimtbj6EdYubqfESAZoPA+gz
	rDwv83gf28FGIFwkRpi3fNr+saC7CS4b1nN9ohch0qJyX1iFuNx2+dKOkoKWiivrcNdfuTiTm2KFw
	J84DCDxEGV1BlGGZ/cA44vTVqlA3VZYRcGOn7NC32RbYkISfbs5j2g6Lbxv+H6Y4gMlwGpXQuuBYf
	aLMrFGKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Ise-00000001ZB8-2J7t;
	Sat, 14 Mar 2026 06:53:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Isc-00000001ZAj-41gK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 06:53:48 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48374014a77so28260525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 23:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773471224; x=1774076024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGqE3n15B8Oam7oaufyM4egmtIok/tvgCx592UaF9pQ=;
        b=Le4P8eQY/8mcfMPGfvlkcsfAuYcb9Eseiyra5U8z4DpqaxFiAwrhZbBhSQcML+gDCR
         +BMgmxcm2pnPZeu5CHKuqGmUwbrwwKL8qTDaqbXlR++ELeJcRMl1CzEoDJW073wLV6kN
         vdeqBJPp3eAigYcFfllV/RhsgDkR2Iat999hEfkBwPWTNL/tYm58dlziY+IFVJav1wDr
         6cyjk8Wx6QoMdJNhJbiMQyLFVtwMQ3x6p0X7NZQhETWzWzm5kResgsdj867TiSwKVG+a
         qPlIEMaxfn5DfCLO6MXGcQ+e3wKVSQfIFFHqlRCKMGCjPA+gQ1pJEJ/M2/W1Om6LeyP5
         WXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773471224; x=1774076024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OGqE3n15B8Oam7oaufyM4egmtIok/tvgCx592UaF9pQ=;
        b=qk/QLA8gY/gLaFU09LuGsJHfpcJcm1Y+a+66kLJOJRYB/zU31gGG5F8iLDcvqNHCeM
         0a+EoGsFzpVJrrIrAl/1DhK/ihHy3QPYcAaiDRCBxDHe2rP3JsSQbHWbr7C1tcUai8yH
         ImutupkkpCEW31NEgzYY9w9MOOUIMeMUTtsGzDn5b8dNmF22FUah3HF06TSk0HPe3Id/
         bMYkWAP3JlOS6YIbQR2ozyWDalrcyBPc0WUYvQDsmaLoWQuJtQWdIf/17MHiCL/70FKQ
         AZHohutx40dJfC6JAldEV0cPI87fos3TmWy1e3c1J1LWh5suUQjzx74g9dBe5Uk3y6Ok
         JmeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEhk7/Ygf1SPw0LSroBHs90rqGXKrOiDdUkXIRBNu4qwgUmBGTHZMS3UsQgGF8mMKRAZXtWv2mXSGYSoiXEAcW@lists.infradead.org
X-Gm-Message-State: AOJu0YzI7W6ac+cyKjm6RpSpTd1E4DzxDSV3Yig5NS9xQprzOs1JWaJi
	94HvTohlbfvhLbpTEeqt4R9dfgcuXnPQ7CpYb2Nxyo6G9qJwCohhCmVs
X-Gm-Gg: ATEYQzxbGrmq4876v6SkCAnE1/yKWJmZBX7GjgT3duES5Ol2j9x7ctvWkMvK7aG2hBh
	/TLrHow1HHULawp67BoBSuMHd1wmk+oV5Cmzclw62Bogv9C4ZMl5NGOzBHv2WPmxPRfS8hXtEfX
	3rhnp0+YzXdJKZWbon6P8pPfT3v85QnIYj77XLvWJ+0R0cf7MpKjRWWwvBmP6oTONAX/YsV9B8S
	sK8YM+ijfHCVNr2fC2bmjxaWCNpqzvUUSs1HCuN+GwWwsjSY2B0g/JvI9E9lvX2H9cmbnzza4SI
	PhFW75EZe0XvsEhaWsD6aN7Sv4S+uYtrPE/z0H7sSNqzsL4X5YvDRUtYKH0vxKSgQxmsHJ6UtXJ
	Cj4/nk0epkTKUYtoa0deYOH+O2gxSJUoaIUwdETyAccm9xsI4aJnVKh/IV+lvOQ6Rd3O1+vqddD
	72ypG64jMz1LdgIsFvlh475IVp+ZjBNnwsyM/QS/f3ymThAMjDATrAOOXGmq+OjoY9VpTZe6Vqs
	etnbA==
X-Received: by 2002:a05:600c:4f8b:b0:485:3a27:a960 with SMTP id 5b1f17b1804b1-485564981d8mr105428765e9.0.1773471224016;
        Fri, 13 Mar 2026 23:53:44 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-12-163.dynamic.telemach.net. [86.58.12.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48556422338sm40021775e9.7.2026.03.13.23.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 23:53:43 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Yuanshen Cao <alex.caoys@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
Subject: Re: [PATCH v2 2/2] pmdomain: sunxi: Add support for A733 to Allwinner PCK600
 driver
Date: Sat, 14 Mar 2026 07:53:42 +0100
Message-ID: <5083201.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20260305-b4-pck600-a733-v2-2-ba6bbed7d253@gmail.com>
References: <20260305-b4-pck600-a733-v2-0-ba6bbed7d253@gmail.com>
 <20260305-b4-pck600-a733-v2-2-ba6bbed7d253@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_235347_059524_1833C534 
X-CRM114-Status: GOOD (  11.04  )
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

Dne =C4=8Detrtek, 5. marec 2026 ob 04:34:08 Srednjeevropski standardni =C4=
=8Das je Yuanshen Cao napisal(a):
> The Allwinner A733 PCK600, similar to A523 PCK600, is likely a
> customized version of ARM PCK-600 power controller. It shares the same
> BSP driver with A523. According to the BSP provided by Radxa, unlike
> A523, it doesn't require reset, as well as a different pair of delay
> values.
>=20
> Make reset optional in the sunxi pck600 driver and add support
> for A733.
>=20
> Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



