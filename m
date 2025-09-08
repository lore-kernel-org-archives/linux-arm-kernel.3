Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75D3CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qa2FDEzfrHnj9/Bgif488Zx3zsoWnSpMm3bjoJ5kMkM=; b=BKdAA/ew4bsSoly0zLqCZ8qgxW
	KWKr1wVyW8Y39BBqVIvh2QyVX7RjcrAnaLLQJ9P8TooUZaUZKUM6DTrPGEJJ7i0tToa4rdcptCa9r
	140mblEmbR5X3xBXiMF3ONV/Ey26y8mCnynbosQfmLBgG/kqGsC2jvSKqav1uJl/bdxrd2YOyTkff
	3Z7/0od+0ne8d0wZzXM6cQpwhllHjSKnQeAQqihoYtQz4GHYyX899ubuuHVUhMYGTktO9MJTyk9Zd
	8VE44mm3UOk4bkTmZoAS8LDxYgPf65VzHmjbJGD43jhNMWiu4LAkl1Uf1Kz+m/disZZz5zM0gbBdV
	xHOVI8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfnv-00000001FQT-2S7b;
	Mon, 08 Sep 2025 17:37:23 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvcB8-0000000HSTM-0cHu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 13:45:07 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3e4b5aee522so1314986f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 06:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757339104; x=1757943904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa2FDEzfrHnj9/Bgif488Zx3zsoWnSpMm3bjoJ5kMkM=;
        b=hnqzjG4Y5fsa3FbGxn15jIAlF8bKdQfyr8QkQmwC7d6FvNuP8QIyeNnTh0XTgBLta6
         p62FIOmTE8k4fC1LYpON5siiKO2wCb6Ip4H1RZj3ROmpIeCxErfzCL7uZZVmXSQWfVbf
         TrctECfiG1AvBPNhiqM2dssaww3yAfzLRoZ4BKQFkgflkv9XRRFhpfmR/yBDU3TXt933
         FDsYkrvRDSh3MX2tItKW8P+wwES3jyuhcaf8cO9paglau66sDmCxfOzVLoOnvnI8VlbO
         CVFylr2nu03//DD0+k1wxyzMREOOH9SMvCNs88OvSGFfrFNbd+DaMNfrc/c6ZjdkOEOw
         n+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757339104; x=1757943904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qa2FDEzfrHnj9/Bgif488Zx3zsoWnSpMm3bjoJ5kMkM=;
        b=uNoObj9Bp5pInrm5iBzL4DdA0P5Uoaw+D9BVmzoaqbeWztC85X3wD0Fi/jsMxS7zll
         r/9zrNFLfIZe1p/Cvyw3IInlEpoKFDOXgVE9UnWZkeK3uNJer5rZD36Sk9gTRJ5jLuD9
         SYbrBDxC9YIf3ufQCSD7Rsuz6ajQcBbmfrGmCw2JM9DD7tIsailhkSnf0rs+1Kk9ke+3
         q8gJS8uD0bD33/2Hglkl7ldlDPD4U+NMD5rS3n8Bk++lsRAJ3t8N5cMhedv9ONRkDlb1
         MQFNPjMQWDntwSIWnJl2/GL2r2WxUJcdCLvrOtombVLEWEPbySPSOl2R2vyuIGxOhJ6B
         V1EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEow7cNINt/tDUzRGOq8w+oCldIOnQA8tLGqsTbIOGBr6Yg5l7uFDGlRy2JD0eKjYXmG8Sl00JmpjA8e7Yjg/7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz8+iIR4DZv7CAAw+EmVHyZpFU9NR1RMCnqWWePbqi/e4tTrHF
	lwSs0g8gwVVTWNqKWn/SvILmM3Agi5+l1Lo3XC6jg2+U8ACfeZnnQRUG
X-Gm-Gg: ASbGncvYdTKTotmQe7EsdcL6AjcxOX/SmGlQKnFPXx5UvOiJkJXJsWywhjTc5P8oYi9
	FWyo6dW/1f8sBGxcRlxjLo8JaefQyakgJ425d9/AU6X1TuMnFAqnWcw+V4UdfWaVy+uCR+Fl1qq
	nQvNEWAEIRBRFZvqiex4DjERX6I3o90LPiwI3F1S+ISv0tECXaJhdaYGwq/KlG+4kxXXP/jMxgK
	AgQ75w60FECB1LPsTGkGphH0VNAMskTVZjYOCKgNhNvqbjVXl6KEiMnJlc/4zBhFs5tMYwJIC6S
	ik+gzzZgAa6U/qvvqpk5bscBmnbaGJCYo3iQUONhxQ18XRhSOQKWJrYad4uRwqcOX67hWl14fpA
	nkjVqES7TDQtu205xiUC/xcP7Edq/InhdE5ePYBS2kNbwoQCL0HD4F+hb8uK4+kIA+Ers1YttV9
	uYrmIU+8fAE2vzXpG1kN0=
X-Google-Smtp-Source: AGHT+IF/bu6N4b17VGa4d32p6sVB8f7trrLvKQqSA5MvaDaYKtxhuslb1edIkbNaktRAD6ubBUZRfw==
X-Received: by 2002:a05:6000:389:b0:3e6:fd4a:940d with SMTP id ffacd0b85a97d-3e6fd4a9c30mr6459105f8f.12.1757339104123;
        Mon, 08 Sep 2025 06:45:04 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dcfc3e11esm96635905e9.0.2025.09.08.06.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:45:03 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v3 06/10] arm64: dts: allwinner: a527: cubie-a5e: Add
 ethernet PHY reset setting
Date: Mon, 08 Sep 2025 15:45:01 +0200
Message-ID: <2795513.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250906041333.642483-7-wens@kernel.org>
References: <20250906041333.642483-1-wens@kernel.org>
 <20250906041333.642483-7-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_064506_188850_142BDE31 
X-CRM114-Status: GOOD (  15.31  )
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

Dne sobota, 6. september 2025 ob 06:13:29 Srednjeevropski poletni =C4=8Das =
je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The external Ethernet PHY has a reset pin that is connected to the SoC.
> It is missing from the original submission.
>=20
> Add it to complete the description.
>=20
> Fixes: acca163f3f51 ("arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E=
 board")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> index 70d439bc845c..d4cee2222104 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> @@ -94,6 +94,9 @@ &mdio0 {
>  	ext_rgmii_phy: ethernet-phy@1 {
>  		compatible =3D "ethernet-phy-ieee802.3-c22";
>  		reg =3D <1>;
> +		reset-gpios =3D <&pio 7 8 GPIO_ACTIVE_LOW>; /* PH8 */
> +		reset-assert-us =3D <10000>;
> +		reset-deassert-us =3D <150000>;
>  	};
>  };
> =20
>=20





