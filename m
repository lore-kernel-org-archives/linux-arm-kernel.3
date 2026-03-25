Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B32FFC72DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 00:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVriyXCxKTMRvh4VYnzoi9ecmHg2bwe0SbN1igFKrG0=; b=4ZGD0RIlX5utSBxs38C8Od6nFU
	zDmXrkzm59kN2IAw4EuQbN3yZQuQSwOYgD+XTHPjPZ5LFXvv8mKjQPht5HOppiQq1W/rAAdXsSnWf
	cblqhbzpZeGYliVjiRrr2JNHQppR/Noz1FiBuTErtVU7AqEXBuvrbYc4/iPd1FTvZQBaduBCI3LWr
	fM85XmUy0OP8ylIDKIyYIWGwkgKAwHhpPaauGCCdH0/kE88ilHP4lOYhzASb6ecahCjLuuDQFOkus
	5/FAbHt5n3B6cj+rWASRTHJulXV2xlEVBtgyrhzVn+e6z6HPwiU0BA53+epezAwcTs+7KRh0Okm4W
	k6o7O7EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5C7v-00000002P2G-0Xop;
	Wed, 25 Mar 2026 00:29:39 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5C7s-00000002P1Y-2QyR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 00:29:37 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-50b3488fb31so5432851cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 17:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398575; x=1775003375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVriyXCxKTMRvh4VYnzoi9ecmHg2bwe0SbN1igFKrG0=;
        b=gx2Pum/v9dqfnM+PWuJ2awbHzjt7AiT47vijuAB1cz7I2cU/TtEKfPu1TCNlZ+IMdw
         KPKh5dMIOFFIpfsQ70b8wKlftLV8DUVF8/UCWgH/A4ZXkABS4Xxw9WIAkxEvW0Nurv3v
         7m1paAjVvyCsNsFTwzMJEVEb0wyNwkgPJAN9HeNMGVbfbnyGkOwl0Qjb5scwwrWvxBUW
         oNTTKRDusC+OZ/3wsCYqkFtG87c1EHPIUpJtQo3AcwB1XPTjv5ilA+pj76yH8LyJviXR
         7bBpoIHpxzl09tf+rwrpztqk9ZOitJsOLesZWieVJrItLfkNg5VTycNI2ECP/LUwtMtx
         Ui0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398575; x=1775003375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yVriyXCxKTMRvh4VYnzoi9ecmHg2bwe0SbN1igFKrG0=;
        b=SNy16+v+LJ5qBtArcrB5TiTYGUXT/IuKyMncpPslOxA5vEQXW0DJEXU/JRYDweHSg3
         4KkCvv/hBS2RfNxP8VIw0qpm0O83HTBA1wLQBME/TMgd/V3NxpnwKc9BzFGLNU3oagmz
         uCyCt5ZqAtIYGQwjo3O05YuB10azBgZiNNYupxHLCL9AG2A/kxK2K7WuTzbvIK1q1Gk+
         s9zFkLZBQR05APR/A4y8PCerAJV5xZQRznvJ/vdzHSTa4L0y/Ceq3d6ecbhN0/rPJnSN
         zNIv8DlchY+maMixSLSNJneZoGGSnqbe1CwSa9Z9Qagr4rgSPJy8re3frnDhF/swXbtV
         ubMg==
X-Forwarded-Encrypted: i=1; AJvYcCWdvrh5pGUq7MUlI4k1rAogNz4gvwYNSwpVTytnn0EqKZkfc1BJQk7ZUpAiXNiIFgQuGJOOHp1ir9vzJ1Z733Nv@lists.infradead.org
X-Gm-Message-State: AOJu0YyfN1l5anc0X0Noc3iW2WWT3aBlljQtGnaFRPTUKji2IsLYdaPg
	fg2kPM3Vxy+2IBdGuWuUYk3ZEmOf7WefNzY9/r+/EBJbXQnHb6W73Z7d
X-Gm-Gg: ATEYQzwV0dts9yrd8ls3ydpIflvk5oQ7nT4ZkpKu5zHo0CLC8uetiynGq57mp7KJ5bP
	NwZChwTf5vxNZcTxw1tfYNJxsBsXSwEAzhgmR2/B+JB/PnBH1pxj0sbzL8FzELMUztvKdN0/jIw
	OAAyCsATiTPBtIwnzKRVELh4acYKRIPSZ/Kx8NhTfz/oRtrcMWOgsbkff5F0YnQ2AxtsvbUSrZi
	dkGkNQCVUgpwRByxhGAN/vr01K5kmXAn8dBxkWUKI390xK3fHJDDWfKnIaav0Q9nN+nTiUZTrXi
	n5ULwtPFZUieHGMXydEWOoSw4j5nZNfj9qOdWY7DE1Uc+xXr3PE6UFNpQ8B11xZZyVLv0rR5aZ8
	um3DpcVufcQEv6wFSqYFD6aqnJpE0ru3Kwwd8eF6CtoEjnEpUv+zrxCU0jTuHgj9/f0NS5/MZL4
	PxN7P6rByO3rJW2hZF5mXNtsPxXtZaFnRFPjcAr4qbLbvXXb/whLXMpQ2sPrQKeVps6Y2uptnRA
	ID2fBO8OFXK2Q==
X-Received: by 2002:ac8:7f92:0:b0:50b:2dd5:2be with SMTP id d75a77b69052e-50b6ed70684mr73711441cf.13.1774398575338;
        Tue, 24 Mar 2026 17:29:35 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8534f9ccsm129996976d6.39.2026.03.24.17.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:29:35 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] soc: sunxi: sram: Add H616 SRAM regions
Date: Wed, 25 Mar 2026 01:29:33 +0100
Message-ID: <3682916.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <20260324164357.1607247-7-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-7-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_172936_624871_FD501581 
X-CRM114-Status: GOOD (  13.18  )
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

Dne torek, 24. marec 2026 ob 17:43:54 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> The Allwinner H616 has two switchable peripheral SRAM regions:
>=20
> - The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
>   to this region is enabled by default. CPU access can be disabled,
>   after which reads will show the same stale value for all addresses,
>   while writes are ignored.
>=20
>   The mux value for this region is different from previous generations.
>=20
> - The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
>   KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
>   CPU access is disabled, the whole region reads as zero, while writes
>   are ignored.
>=20
>   The mux value for this region is the same as on the A64 and H6.
>=20
> Add data for the VE SRAM. The register values were taken from the BSP
> vendor kernel.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



