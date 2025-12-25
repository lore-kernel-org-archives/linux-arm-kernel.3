Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17EEE7AD40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 08:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPaxfOiO2h29JkefBVMH87cUVSszE5AdBCMfSOGSb4s=; b=vJctKj6c41S+3QnJ/v8R5Tfles
	J8STlfdf39jwFHyYnJMFQAX7rmpWBmAkzhC+EFyCsqYnaZkClVprxgLrE+TkZYyC0M5UxyIVCMGT7
	6rszqH2OKBUBNY+u7uDLjCO7/mlxxi+qBJDLv9VLLm2spvJcqBNdEzOe3KxaJBSUbZiw+m/BH50io
	e7eIwzQm/xHxelCWmSZu0KsTb4cQXz/fQbvpDASgvq05sp7SdHChhL2Zr1tvKadzEAd64TGYfCHFG
	jg1BiOnRmI7DvI+ZAjs3qwAppi4b0e8p+C45JCMbPXiQ5THyF17s+DGVY6FjudsN7jjGhkYuMwyQf
	KMh/LEyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYgX4-00000000DR5-2MJZ;
	Thu, 25 Dec 2025 08:17:14 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYgX1-00000000DQg-46Q3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 08:17:13 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-64b9d01e473so8274149a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 00:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766650628; x=1767255428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPaxfOiO2h29JkefBVMH87cUVSszE5AdBCMfSOGSb4s=;
        b=kUB7DId1VeI3th29fNluaEt9ESmOq3wNsI2D32VeGR5aOOCDe8+Ec+AfQ+JZqCx9Bi
         PNsrn23mhafUaj/utRGFOQrDeCK6g+gYfgcUW//aPS/FM125HUI5WuEnHY4Fc/JXy8Sj
         Tz7sbfSqX0OYbNx4WSzLP1QGzvQ2CxfYbQFhG5mvYZvONK5EWfZQkTF+90apD78WlHH8
         hI/oCHh8M5ihH9WbYglTLvHKgEYu9QsOVCkKC9T66ebSdu2TMnFld9SFFsNBRJz9zEKI
         1fAa0sMXfNQDhh9jyNy23pQPIYJjxxKFlN0kY84Vz9LmTEk/kgpgiV/5Grcjdj40Nbtb
         lkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766650628; x=1767255428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rPaxfOiO2h29JkefBVMH87cUVSszE5AdBCMfSOGSb4s=;
        b=Usb0vBpCQuH7yPHbf6JdOcB2yIhgJjGjsUTqQBOHqF9uYeXdxJ/HCThQel4srVbyqI
         G+2//yAvjHF2Q0swHqX33QR3YOTU02fxd02O6Z+cVzFn/S/eya+FgG4WTd8dQjrisOw2
         7eGeG+2otEVyyq+kd7gASZZypHfkWCYNuRKJrVwK4W3plN1py4skO7e2AuPeJk7SJ6Ou
         pGWd569SBg+NL2kV4sfnKhs+VQpgsV1I/8FShnhveso1UoF7Dj/AB9aaa1EtZZ8F59SM
         ZSsZgKXl0jTTg6WNUSBlvK0sX1Ik8jVC8Zq2fjOoKawIbB2NpkrPYlLwQwd1V+Dul210
         eudg==
X-Forwarded-Encrypted: i=1; AJvYcCUCYoqEZHZ8FWeDuOgbpAWPnpAO+P8r/mGtssIXtSSzxh2A2i1LXHPLYqCIpzGj5wzxj223vLReF6Fdln6a+PME@lists.infradead.org
X-Gm-Message-State: AOJu0YzmOXexOqKd/elJtcRPHizOwY/IoCwZWd8kNI6UlAv38mCrQapv
	LMtY539WkUkgxto4zSRftDZaTknuWQ8S02f7IihKupMsuDp3jdUfV3gZ
X-Gm-Gg: AY/fxX5CMgoQMsZ8yH8jecjFX+I2oF3aMXnMlxsfXRlU13nwuYgFHtOA6WTeTIfypti
	ClvweZmAI1ca332mAVyTyduMlgqMNvGjHuXFwNfHW92B27YV8tLVi6u52+I3F8jEcaFm7Nw5qlN
	BA4pIPZxHhtydINjC2o3b6nSaMUHOP/9neZ3Bvcxm4yK305NfriSSAey6edJjdgR6rkv9/uPWAc
	Mfm5+VTO3F+nqTn+tmdN6sNPZf05FuFLyh+udDWurVkA/0/aJ4GJVlrULo8Ku14pjbyGDdGNjyE
	uTKbANxqsPcpDsWHTmgIoi5qBGYt3Svklq9DRClwEZ5MjZH9Ubcjn39LOTn0W425s1zVT3LK4eG
	7nz6fMTg4RxdBIXCTY9o+qMgxQWGbHpLY2O+0hVuemZ6FU17pgiMgZuPW3LH01+mRnE2t0jmi58
	qflYzJn4kSQZS4ggM22xCXWDcog0gD4aTH
X-Google-Smtp-Source: AGHT+IGNe9sOMtndqFQn5j/VZK78chHVl1zIxR7eHSZrsbZhnsAd9hS4ioXFMobucGxkQgjR7lC5HA==
X-Received: by 2002:a05:6402:430d:b0:64d:170:7976 with SMTP id 4fb4d7f45d1cf-64d01707bacmr16253632a12.16.1766650627578;
        Thu, 25 Dec 2025 00:17:07 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494c03sm19322279a12.18.2025.12.25.00.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 00:17:07 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: axp20x: AXP717: Add type-C CC registers
Date: Thu, 25 Dec 2025 09:17:05 +0100
Message-ID: <2827385.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20251225080241.3153453-1-wens@kernel.org>
References: <20251225080241.3153453-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_001712_238127_FA4C17BB 
X-CRM114-Status: UNSURE (   7.08  )
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

Dne =C4=8Detrtek, 25. december 2025 ob 09:02:40 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> The AXP717 has some extra registers related to type-C CC pin
> negotiation. They were missing from the original submission.
>=20
> Add them for completeness.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Checked against datasheet.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



