Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8FAF54AD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 00:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+W2l6HF6dMk2sjxzN6yjkAVU0JUCRJ2zSiQX38l0Uk8=; b=QWgs7t2VvqZcsuopzXW+L9Ffk3
	9H89OGQXu3Nf0GDFvvj08ifTmOeYEQIq4iG+bzH5F85UtTgV/VsDiey6KhuEXIr2SYf0jJp1cl/On
	c4nMCJ+WpKN6fIBrTmkZ8HzhbIG/Z7NMfEA+uXxr/Ot2pu03aqOuM67WeFGxvvsxucvFexcyHECpD
	U/3kx1xPn7nOWnLGLJrzjZby6APlN/kL80ZMHBEYv89uAidiGfQvCACja43G19/qxry4qcP48FAcn
	yz3OwhC+nNFl0H071fLH8YJblIlP+H+9nqJvthgELaaceD7Mu3F4l1NZL9rBDijAD7Jw2kVKdlB0L
	ap81g8pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5C7N-00000002OyY-3PXt;
	Wed, 25 Mar 2026 00:29:05 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5C7M-00000002OyA-1Rz5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 00:29:05 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-8cd90401034so174215285a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 17:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398543; x=1775003343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+W2l6HF6dMk2sjxzN6yjkAVU0JUCRJ2zSiQX38l0Uk8=;
        b=KVSvNBYS/Vg/XZYe/hz9tAhRC8HlxfxCmDIKTiCaPlmAMiNGx6aXBYO10Qcx2Ef9gh
         Z4Q+ZmEP9rj7OYx93Ko72OJMz+Jk/qeyNIW6rOPvkLrl0KURrDfKjCuqKFNRVeARyduY
         +HAlL8hriToITtq5yO78Q7bgFxmC86BsXEKZicFdQG7bVq/gFpM3QO4A0HsoU2v5cjUc
         Pzr9fRKrepTDjn80SufA8mtqiPEMLiZyXOkFBGe4Vruhzu0U2wZAhJ96mF3Y4Mg4W+5y
         zFqFSlyeax1XWZwVgIp2vBpNcPc3qh9htPhOETzK+ZbherfPldm6MYQP02FXbiftGeQN
         PUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398543; x=1775003343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+W2l6HF6dMk2sjxzN6yjkAVU0JUCRJ2zSiQX38l0Uk8=;
        b=bhL6Oc3bnOp74AsV1lCPrn1w8l8vpaqpJ0T4bFTf4tE5l6YK0ff5qCg6NDq2ZRqOj8
         ctqdLgSh9ATqY+ybEMVFJxSgHQ0NxGdDY+Fd4Fk8/nT4Aqz7zBOdAslMZV7ibmKk8LfO
         yzR6wIFFjsPAGEuquB+Gym7QclHwOJ2S8Y1Ly6Z21/XJFY0pAm5U+a5lGvfjmA/6aUuO
         wqp05mXGFztRJb/NeSaVejtzQPE+AEOgS8Oz+tBXlu935oL+3mcVoPVZjMZz38cq1VSc
         CMwof4y8f3PT2BdQmMibclKGfbEjwrXwCgIeKbZIgQadqxW7Fli0wIttMosmpykyfVAX
         ++XA==
X-Forwarded-Encrypted: i=1; AJvYcCW8a81yYhcHoHeyFv1fJNkKjjI71KBAofahtD8mH9bw+B7WuNsluptg7FU+6wIJcDXQrTqSagq2YVSE5G2cdmV5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2DtpvRqKPvVhTsvLKNyCP34zdUFFXWPEc/ku0MaHjIEIkvIKE
	bsShyBycnRoB7EYo6Spr4Lo0EaeWiZMwK+KoQoFmOQ1Off6wz2qujaGu
X-Gm-Gg: ATEYQzxFFhzuOYDV/mQ6lIBOaVZP/kyUOoOOb/Ks2ZJTnrfrbJbQRYHOZIe03+uLmZj
	uEUOoyZ0/e1w4fh+ungRnWthbKmbJyR3T07lr2wtYBFI5vW8czFkcbJT1P+HPaFqk6HMg8M4yTT
	A42Pf23n07UdESXfdlBQvpi3DS4IbzKspjJTdmLwljqXMVGS5jhDCSZTf75CsqvZEtqN1MC7RiP
	bSRJLWT2Cf8Zl3QJT6t0fCXuSYmGeIPK9dnNmVOq40MKfh7qz6mljBBLxaodXtGymEt46a3ZtLQ
	Y+npdtTYr/dx6ORkwDmLSLqD66+nBZs8tNry0RKGEuxzuK1d5yrQghuOuWL/rbB4qltrhUnC2fY
	6Yh1v9VOAm4ReAlXOHqAQoSmVdkJt+AlUATCRvxJVPZ97RmCrW0YZpLLgu0q6FUz0gvmIjE3+Gv
	Oam0WFTJJ8wYLzWdxK9aG8RMd/rpVosqJPd2CJSp+vkhKkSdkYVPOetestTn0gCSZlRCIDDxsdM
	yKsRwZVtZM/RQ==
X-Received: by 2002:a05:620a:1788:b0:8cf:b7c2:fd20 with SMTP id af79cd13be357-8d000ed1743mr238935385a.11.1774398542974;
        Tue, 24 Mar 2026 17:29:02 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc90bb7f0sm1172723985a.38.2026.03.24.17.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:29:02 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] soc: sunxi: sram: Support claiming multiple regions per
 device
Date: Wed, 25 Mar 2026 01:28:59 +0100
Message-ID: <7923014.EvYhyI6sBW@jernej-laptop>
In-Reply-To: <20260324164357.1607247-6-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-6-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_172904_415858_78AD9252 
X-CRM114-Status: UNSURE (   6.72  )
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

Dne torek, 24. marec 2026 ob 17:43:53 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> On the H616, the video engine needs to claim two SRAM regions.
>=20
> Support claiming multiple regions per device.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



