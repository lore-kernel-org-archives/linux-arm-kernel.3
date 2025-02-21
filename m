Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D461C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 18:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XQxXF+PqlTv7K3oBNr3byDHUiGFiR8jDQTmJ+u89x0=; b=ur/A4rQQbx9q4sxZVYEJoyvGE+
	p2s6tddxVRRT7rLiDhYfelDjG1zkFlG7VSF7CUryQE5r56Jw/0JKZC7PRVPszRdUqQUaSKVqaxcOS
	NWgiWcsMmpQtF/AtE91Sk3Cr4TcjvQYXfLwiTfBoqjlBix4irki+aeX6XENLxewkq0wb00NMuiZsr
	rmzQZ61SH38fnn+qreaGe4Vdx9LNIWrQrVs9Aw3acPdUxnFGNJse9I8v37rTzWwEyEJuasawvKnxG
	Ffe5Dhi/adNKw5x24/n8acjSqJjsAjYI1SwxCpH9u9AIfaylxJSElE4mf3K9oDgSesVvs+gw/8gBY
	1QPUh+wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXnq-00000006XPm-31mR;
	Fri, 21 Feb 2025 18:31:10 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXYu-00000006Ulp-3tta
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 18:15:46 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38f3ac22948so1265161f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 10:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740161743; x=1740766543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XQxXF+PqlTv7K3oBNr3byDHUiGFiR8jDQTmJ+u89x0=;
        b=HmodfDvO9s4UQ6V7/NQWK2uWgkWmh8MxdzhnqCBoocA2ura6DzAapxhmN0vNdxe8U9
         heG96TVOuHKZD/Zyh0tpoN+nGivcNRN/vy+pTB+3E48PEH3g/ypjpWEWjMl62jqfNav1
         ZBJGKdjN/AKw9UPwsoXKFVu4BUrwp2/OHYWljUjZ2R1Nl7BLk4yqlhONvRUYSiDh9bJT
         mow0UAxCr1amRJlYj4RvIgARbvU9O6DDu3nXomJV+6rs+Bh91ob6XSsLBO4/SGGQh0h7
         D7NgtiSzLelFKXn/yctT6uhlLqKZfLRlqxzRrZJYLGCk6+K8Q4UORw0AvGS9tWtS3R7b
         JajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740161743; x=1740766543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XQxXF+PqlTv7K3oBNr3byDHUiGFiR8jDQTmJ+u89x0=;
        b=AZVRSChQCc3x7R+MJFGH4MkZD+S4AO/2PY4ZWpo6BxL/YZgGGtUXaK5o4f0zy27i0d
         6iixNLFj7n+p6wEQUP7zri2ZU9MFKkhdYK4jmwBa2rGGipm0nctUxgm7v7OQdiT+Lz7G
         5yCiYGSMQiVwPb8EP9+S/qB4hc5M3GTKaEKyWxUFUibI/TcvNDDxggi/AQdT6UKE58IQ
         4nnyuLQwzleNotKTj9PlLPYHHXrug+2Qb0pP11Efs5/9ySOVX6RE3ineTtBNonBMqE3I
         BwXrAuzTyIgT1q9k4DdTtHHu7/9Cp28Ygek0DLS5+ZAQFSOxdXqJf1qLFPF3V7Ytjx/i
         NlRA==
X-Forwarded-Encrypted: i=1; AJvYcCWDOs4C+y2Pa695uaslblhOX00euzNhPXV8FanLBrVpPoO8aFBiEM9Le038CLgP9GuU5YfAp9Ir1JdfP0XfZpPj@lists.infradead.org
X-Gm-Message-State: AOJu0YyeEo6HoJe4iS+YG2sZPqMYr70bvzazgaiUnCFewpsHGgmcR5Dl
	oEuWRaE0hgaten0aMMgzH8ST3DLmW953HeTDjQmGhyfO4zGORmnt
X-Gm-Gg: ASbGnctfbH29yl6oqsvtaFXMtbrHi5oUXZ8z+SC1iQaWhGeIsA2pytxfpAWOnz+BlCs
	dmN/LkTLKV5wr2GcAv/CLVb3bMDZZXf7+ldsZ9Tw+OIVHRZ/YI1TwGeyL3s9G6WayaaoLfnEUVB
	M1VXg0TkDfNv8UI1puYpS8J7GfrqZXuvdBbO+MiqO9P1BjxmBc7B02MCTAzJjh1WQ7nzPUlrQxP
	OzMzUFOcaUVWp0JDnQVSHQZnsBmUE7ahtKt8BywxwOiE+ktgC27G9XS1LU+NBHdH07XBYj6NxV3
	JkUxv0Iejn3uMay5LWGpPliR+Rkx321pdMBfiBE4cMcF69c3qH54oVkKUca2bFrqpH97XJe6GBs
	Yjg==
X-Google-Smtp-Source: AGHT+IEUcd8ZVq/GSMpj0nEp4xNKJ3oVuqW8jkTX+24Fpx6yj7XA7+1f/SvbeSr2zKHVbT8cItUZ6A==
X-Received: by 2002:a05:6000:1543:b0:38f:46c4:4a6e with SMTP id ffacd0b85a97d-38f6e979cdcmr3162525f8f.24.1740161743326;
        Fri, 21 Feb 2025 10:15:43 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f2591513bsm24244645f8f.55.2025.02.21.10.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 10:15:43 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: allwinner: h616: enable Mali GPU for all boards
Date: Fri, 21 Feb 2025 19:15:41 +0100
Message-ID: <13703667.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20250221005802.11001-6-andre.przywara@arm.com>
References: <20250221005802.11001-1-andre.przywara@arm.com>
 <20250221005802.11001-6-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_101544_963836_2878B098 
X-CRM114-Status: UNSURE (   8.91  )
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

Dne petek, 21. februar 2025 ob 01:58:02 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> All Allwinner H616/H618 SoCs contain a Mali G31 MP2 GPU.
>=20
> Enable the DT nodes for that GPU, and specify the regulator providing
> power to the VDD_GPU pins of the package. The rest of the DT node is set
> by the SoC, so is not board specific.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



