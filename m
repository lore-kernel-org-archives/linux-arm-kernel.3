Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC381CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJYNXDViBNg9H23IU+cEG/iUlaVVosMhC4bKdCUk1To=; b=aOcoG3ba9KRGiB5/bH7e6LPHyH
	n2kAznXNzCpEuazf7lMBPdxKYKmMbFTakqQfxOXtab/aVGiMmAwjNLBjJ9xu+MAIOqg23Ipl1rIVV
	je+P8OSWuja3uvKT6DNNeE7ws7M2jHkC9nleDwVdhk3lqVM78gMF3RlIy0PmGIPW2cTlX7QxOI4O5
	T9snUK/v+WnSn4Nzjo+Zz+MVXrtSrjikJIKmq/UGCYU2jmEqox3AvYZ+xuxHeev/CK9vvIywV3hQ9
	LGnQfDLBzltY15H/gcRv+czxCV/VbagXFMBXC+w9diDcDt+bZpRRrUHv1OdilwZegirxE2JmE48fz
	ktd7UwuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAu8y-0000000EYke-0hfa;
	Mon, 20 Oct 2025 17:58:04 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAu8w-0000000EYk4-09rH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:58:03 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-426edfffc66so3444013f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 10:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983080; x=1761587880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJYNXDViBNg9H23IU+cEG/iUlaVVosMhC4bKdCUk1To=;
        b=HfDvLf4RLNobq3xmtYqBE1uVBDZ7OtzJ8MvQVqzkKu7Rk+56KsU4TBAY2EtC5xcwEN
         1+MOBOhOFNji5LaO58D7zlmI/eYOEpdD9YwPeEM3mO+tHBnRVXPyKr1V9VFTbVFY2yBk
         yHd7jVdWOKPbncYX9Vf4hI1fHYq7KE8LJ73pHbE877F/Uys5x1n3YJH9hOexoghFUIR/
         3AicBbPhzOYa4gHAna0W1GUaMrsSQEfaZMFUpa8Cnb5mzocO/hqjbqZgz/2W6p8GpPaz
         NGztU2AEXg3vondnRF2PUzkndkZFiqvh9u+6Uaru4r9SwIepXaYUCgMXo5WcxdAPaXAR
         FnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983080; x=1761587880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJYNXDViBNg9H23IU+cEG/iUlaVVosMhC4bKdCUk1To=;
        b=BJACFmruIV3xa7qwn3/OpZ61SgZvmrfMHBTFG5HjG10ZhGj1yMzmYL1UxnUoF7B76N
         yYhtXGUld3VjK2d/tNUdQm8Y43gHdh+xZsXzkvhkT+tS4LpZH7M4nvcbyhXHUqADoVI/
         Sr7orfw0tSnqIT1JgeUaMP/lpSKJUBPmLXpH1NUSgi/lb0dIGwZRJYLxeo9V//SeuAmY
         rJapFRdZJIeVwD2L48KGteUlD8aFd8DKEPbzGn268voATTkifGoC97+VhMmEfROeCqqu
         SgJjq55e99RjQux10BiYy/CkqyCrbI7EH+PYNJZSSfK9jot51NvhdnfR+ygrHmJ0sSZC
         JgvA==
X-Forwarded-Encrypted: i=1; AJvYcCXUMF8yt4i7V+BniE2RVYRF/Uz6fJCrScLJUduo9FlceEHAbCSDeqZK3BQI+0k9ANxA4IXzUuyth4THAD4VGTmF@lists.infradead.org
X-Gm-Message-State: AOJu0YyjW7TgAcWaW7uUhNbh1yCIi2k59uhiwPLr1dZ9hytIItXsOvZ6
	+OF2V7pDPlcpmVcJBuawE4qhxuacfUR/7hr8N6DIIUgy+qA3J38e3dIPOVzI/g==
X-Gm-Gg: ASbGncsYRaPkzfhwJ6DDzUSsSlD1Uw5d1q+yPjTN9HzPgs0TmzgXuPXXi/0o2xFYV2R
	kVg478S3Yn/m1m5NHB0Z3bBwRjMutAngc9fNT2V3ACeYvMeLih3XpQMEh2eZSQWyQJkKWcmk30v
	1bLNtqzJApPRaB8LpDs2eITUD2Wbz8z0QN1m2xcramjrBnR1FewhZWjL0p5HVtKyTLdbN8QlpoE
	sg3pNkpY+hUQPkqJSenwsYRfP3P8OA1i7tJah6/GSMq/eHK0pQAt7gJVZ3QJQOaYxmcTp3KuONC
	FwxngslkpNjjt1EbJSrDZAd8vslZCpwOKuzsTNoGFz9Atu+5DnVbOdbBEOH8Jc8fh6Mdsa+aLtf
	HATdj5XS1v79cnx10bAjm69UzhWDpdw6AePiDqEXd8S1aFr4yvsF+31N+G5gK1mUkJcGXeXW1Qr
	9ep/tIxzu5myzGMY2obuntDZN8cAvkD03HOcXNTRjomh7XQqefD0P1omqa0CVD2K/GIjMA
X-Google-Smtp-Source: AGHT+IEQQl9YZkR1BgzZ6Z2Nufpu9HBikDewEvyF4EuaS29j/RILS2DM6SBqWX87g+1TkKzsAinQ/A==
X-Received: by 2002:a05:6000:705:b0:426:f9d3:2feb with SMTP id ffacd0b85a97d-42704beea1emr10367539f8f.23.1760983080172;
        Mon, 20 Oct 2025 10:58:00 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce08asm16294878f8f.44.2025.10.20.10.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:57:59 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/11] arm64: dts: allwinner: a523: Add DMA controller device
 nodes
Date: Mon, 20 Oct 2025 19:57:58 +0200
Message-ID: <2324646.iZASKD2KPV@jernej-laptop>
In-Reply-To: <20251020171059.2786070-8-wens@kernel.org>
References: <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-8-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_105802_102028_45A6A3B4 
X-CRM114-Status: UNSURE (   8.05  )
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

Dne ponedeljek, 20. oktober 2025 ob 19:10:53 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The A523 has two DMA controllers. Add device nodes for both. Also hook
> up DMA for existing devices.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



