Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6181CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C67F/J05mAe+rfgJ6AOhDZKKwYuaYMQaqkEjs240jaM=; b=wxlzJptmIZAE1Mn+93ihhDvAmX
	apDP1EJ+BTjDfW7uK3dByHsj65/H1/FFGz5ZTQmGoB/IxiukEfA7Ya4IM+yM5RIDmKvcBkO4yo3G6
	G1BkH69N6xYeBRVUiQ0WJU6SkjP8+0f/jI8GyNAjJi6GiifiGC/yBYPOVqqYfofReuaIdA2aeKZmz
	980nc7QLoiwxTtoKN2NSK98714I60y85d0AD1yMTLlSYTeztCLV3KxkAYA+kn/AIO9A8OoS7IQktQ
	4c0smkctPCpe7IvSnjDGt1kxQlisXTSDmM0PE71IrWRkP0aKPM3aSc2CJQlZbyOrbV08YVyzIFSmH
	aeuWOIDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDltj-0000000GDxY-3KNG;
	Tue, 28 Oct 2025 15:46:11 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlth-0000000GDvP-2cn2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 15:46:10 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso6191627f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 08:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761666368; x=1762271168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C67F/J05mAe+rfgJ6AOhDZKKwYuaYMQaqkEjs240jaM=;
        b=ctDld48xxiWBrZfv1yIOL5QGZXQKZJIj+KCKWKgDtg/P64bmSVqWXcrzq4R8wY2has
         RDoHxMI0VTsMZKuXrFjpLQgSrg+C+LoxGVDsw5u3coJ+6KhUsal3twzo47ayRYHBvK+E
         cQu4HrgzwSb700/417xQwuLTG7RyWDTEsL+ElnmoF8IN8lzg8o83Us9AEVo/OxppRlij
         Ozmkau02dq4N/tuxb20SdXDMd5A8yrp3RJrm6ic7Z29ReGsfIfLC/WHWhHI8ir0DPhNc
         jVgKhEWk6dPa9BusO82qL9Ri2wEaX+oO+DnBQ+gtGC/srK3nmzhDb4Qnq24q464YzGY+
         o6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666368; x=1762271168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C67F/J05mAe+rfgJ6AOhDZKKwYuaYMQaqkEjs240jaM=;
        b=bvQL6fb9X26P40rPIuNt+A8HXh3FpFBKa6sUDXnJbY/iHOWCyp2oJoVhUiKYyvvXE5
         7/wr2DjAasVgDXkcr60Ws6Ds6wFFDrezWrSA08WBBHqoOUmKSd7/drXzn/kuIeSTEn4X
         yFVA14GuNGE/mwX4Ap/wNfc9Dqhg9xTwURgKBzfF8HKT30cQhaPXAA3ILTv4tUu7vYZt
         botVDVxNvMW8OqnNWi1B4DHFFN7aq1K6vLeZdUKZF2+FWaEmGpQn14GNPGh1f9dlourd
         FimZuD62K5/yIOjTqWHqgTRbwhE4M0Iieb5ikUeZiORgzhzxJt9/9EC6Sqdh/9Ne+/4R
         XFmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHtbbn1PCj4/5Al8/htD+1AteK1yNIb+KaEQSu7ZflwYMajkjhJhNtF0x4SyTOXRhbeEPjn/Qz00heAjXBJWEA@lists.infradead.org
X-Gm-Message-State: AOJu0YxLdvKu5iLOQtPHUTdihCc7jXcs1BpbVZqdWa1Yl/+Db081Dbac
	ClCd+aXhQqm8hmBTw18JLC6fX3rMOol5PkYpwBnBisW3p0+NltYhUqU7
X-Gm-Gg: ASbGncvM1hClCbEbm6ZRRHnmOfu9HuqsuncniK+BUguwiPBqx7IK5qxNUl7fCh2lDJw
	+3QLxuiO9z0Aub2TzSUNk3fPimo86xd+5ZbyjV8uEQuzukWlb2V1xP7iI271Okz///4VsfXlwb7
	CFQoBssBQMg+Wk/6F84Pab9xhpOHPiMykvO1U/zLqoyaePTUUBe9gMWgHkNg7DYb+QAZ657qIF6
	LN0FMbed6E7ygCJ5HW00Hls72oIMLdphnt9bZ5nEKB8uZryGntBQPVKzSs+KyAh4oKaFqYVRwBf
	APmt+AdVrDUER0LyBV97/zhl8jiGmxhmqWiV4tByqSxDHjmYsz8/gULHK30pmNDWF5Fu9ulToki
	ireCuFiWSe8NG1owtmXS7RN4AkO49/GY3xHwjPIQBSOGkQnoJHhw9t1i4/mQNb+mvu8PbC1fwPg
	Qo3weIxj2D9BVgAn4lc/QafhKe6ujDhLl2YYeULQQExpZOzO6c4Ct2iekdZQFYgrJm7ILv
X-Google-Smtp-Source: AGHT+IHosnjBq+7lnXCkpH/VCvR/dfjIj3WsAxDBH3sVvdzDiErsKruO/jAMqh6ugeSBky6z5EKP1g==
X-Received: by 2002:a05:6000:144e:b0:429:7693:884f with SMTP id ffacd0b85a97d-429a7e35c26mr4283497f8f.5.1761666367549;
        Tue, 28 Oct 2025 08:46:07 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952cbb20sm20964431f8f.18.2025.10.28.08.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:46:07 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH v4 14/16] mtd: rawnand: sunxi: introduce sram_size in
 sunxi_nfc_caps
Date: Tue, 28 Oct 2025 16:46:05 +0100
Message-ID: <4461451.ejJDZkT8p0@jernej-laptop>
In-Reply-To: <20251028073534.526992-15-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-15-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_084609_660947_2969FB85 
X-CRM114-Status: UNSURE (   7.91  )
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

Dne torek, 28. oktober 2025 ob 08:35:07 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> The H6/H616 the SRAM is bigger than the A10/A23 one, so move its size
> into sunxi_nfc_caps.
>=20
> No functional change
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



