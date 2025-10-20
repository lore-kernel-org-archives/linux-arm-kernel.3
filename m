Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1073CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0ywM16huaA6vxoSrQo9VcxXEvOPk2Rt5CdRZIoeNHY=; b=EGaXeOy4MIxyOUAZiECbcxOQTi
	lGExs8OFksAXsUaQUq9JBj7aa+yVU5ddyv469Pn1nVv6JBXqQb6pI4x0wU3VcXrsWCKpDMxjrcVd+
	6Us50ivVFNOBoILNi3uD4qmUZrzvDmwxfVV4S5NjRcf6nx3OYi4M6Gt1A7QZhR+senMASjOx9sLr9
	FqYXDUli+v0eA9AKCVNPObjdPiCV5cKWuWBg06gaXznaZxwb765aYNzL4ePu+WhjjDenP3JV8T8Mg
	rV5x4ebeUqR1HlvriDaqa77DhfWAJz2VTL5Kvz//ufxq599LQGkbXCuZomdCvDpTKTcgnCiyFOjCd
	1LXEsUXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAu9d-0000000EYuu-18RH;
	Mon, 20 Oct 2025 17:58:45 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAu9Z-0000000EYu0-087K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:58:44 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so3499712f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983119; x=1761587919; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0ywM16huaA6vxoSrQo9VcxXEvOPk2Rt5CdRZIoeNHY=;
        b=Xy62l3qIoJ1PSAT9QTV/1YUSZSJNmzxC5He+zOIe7BzjIUFNyNPT4pK+HNUpMQPXOi
         oCvlNN1w/Zt7HQO5c/GQ7r04l7h+G/fqZhLwaOPr+FydstVqJuPDTKd3kLn/2cqIeh68
         F1fEvWwMiG3yCH+L7DusgS7V/r3PAYilEIuFueXSd6qPOpWmVMCrNuNBuyGuN9oSpBqm
         vdHi4jMGUysIrxt9zKV7p8dHF6cFVTO3nq8PGfQbJ01MSMFgpL3yVefNiVcYgPZZZ+tx
         tmUIDN2o62Llky+tSOMGLc+3Q9EhWAumMl1QZhbaNrZdEnPrFYV5dT1R9GYCNJ9UXgdT
         r8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983119; x=1761587919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0ywM16huaA6vxoSrQo9VcxXEvOPk2Rt5CdRZIoeNHY=;
        b=OPXxFbL6N1qJgfOkAV8co0AIwzYOwXN1sZAJdv+26PtuLPOQERoI6sg9Eg/c6jQNgE
         kkM+jeRBU+bh5EoYFl7Fo6A3rsjanNc8ctrRbNJdnBPm3jG9VOiZZhU53mqtrZOFPT+A
         UkT7h7atvcFGyhRB/DCo4f0BAqy4C9pUzp9GnS3ACzH2aybYsCwE5Q8LDi/hdEmVIC5u
         dU8GN8HxngqGiKIp+NM3pkJNwETc8LeJgaHxQPhMVQf58JQKKnsu7Xf+7m9vsfJpd4+u
         pyMrmKk9ZFVXv/fgOgX8xVEZI3g5gFidVTrdKhHFyT2EqItZzvxBtsiPWfxHI0QFmuyY
         paPw==
X-Forwarded-Encrypted: i=1; AJvYcCXj6lNRoFb2hMuAaFJxxP7IIJg0DxkWtjfrL7BwEYxBv3PAHWiNl4XKKEsnNZ8LrK8yabuVQ+Sc5qBqvvWlgWec@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrn9xh00JuHALS8EoYO2liVbPpMnKv+kZiRqUDhHH9fnp6VZB2
	cFSpnnZ6IRrHUZGJjK69SLNLYbnxb9tyUnbrWcynqk4aEpHIk9MzQtcZ
X-Gm-Gg: ASbGnctz9r2Xxhn4WSjQYWcFXnEQYEeqHBQvwGoZCxnXh0sZ2cuj6H50gHYfPZB8vDv
	C2PRP2rqHSuKFIymPwVOse651yNQUHu1Gc3l5nWlYUn4fWI0+kLb3a9dXfZMBB8D5LYMcpxk4wP
	MBUH3TA7aw7PBFUsCaz5AkALKPsMVKmuZqubYjBhe/Dt4Idog6x2iHj7I6Z6MDgdYW5jQjECCoX
	KdsVcVE8VAjlG/G0hsEhsuQuUA5brBpCouCmoSlkMcVq4wp1dajOA1pZJtrkVf9Mat1ZSQ/OxEy
	+avWv9hEY17A0WBlSbxhtxNFqgcYM5DU+IM+oIltsv8C2Qe4IaoL2PIschPhb/LAtdjmlr5Tpay
	qz0nuXc7P6kzmddBgwIL05rnDiUfEi8PsuBI/27nOX+DRJDJI3T457Wz3MhumnFJV4DlqiPcr55
	3jv+DTgeXp6CyC3HeKksTkW8G5++MS/sUmWcSwzkjLUYqQ1jeHTyTJYHpXreoTAX7DyBjjjBaBx
	NQSPg==
X-Google-Smtp-Source: AGHT+IFevLoNtuerBsIw1VuRArXCqqtvXfnOs340pTPBnyLhuRUJ7DD12vxDIIoA4Zumvg8MBc0QBg==
X-Received: by 2002:a05:6000:2406:b0:427:a27:3a6c with SMTP id ffacd0b85a97d-4270a273c43mr7686143f8f.63.1760983119338;
        Mon, 20 Oct 2025 10:58:39 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a0f7dsm16168108f8f.4.2025.10.20.10.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:58:39 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] arm64: dts: allwinner: a523: Add device node for SPDIF
 block
Date: Mon, 20 Oct 2025 19:58:37 +0200
Message-ID: <22871360.EfDdHjke4D@jernej-laptop>
In-Reply-To: <20251020171059.2786070-9-wens@kernel.org>
References: <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-9-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_105841_071573_88BA08D1 
X-CRM114-Status: UNSURE (   8.90  )
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

Dne ponedeljek, 20. oktober 2025 ob 19:10:54 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The A523 has a SPDIF interface that is capable of both playback and
> capture.
>=20
> Add a node for it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



