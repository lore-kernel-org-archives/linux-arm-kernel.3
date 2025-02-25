Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C59C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSEl3QGwsciK3DZesh967er1Ic9Jq5iFZZ00R3tL8wc=; b=Ult5EEfahcM+l+VjGQ8oZdkGV4
	Le+FFV9BuOQzwBc+tFckG3n2LjVu/phcPH9aHKPB3Y6Xk3A1a/zVWjdb/KBOdcnSFnwT/hePPnJ57
	QNh15jYs/Uc0g32u3jyKvtN1TAeJa47dFE/GmpuadEX4bqX1CammNEUK4k2ogXbl5vbM9IgjtkQo6
	RSPMQjaZOj24h4DgfTaoyIR8IXqSm7APMJpiS3YHagAJ7nYbPOOkPqI+JF9bLndLVo25MF6zmyt2r
	6aYjIeBsiqHEExAz/Ew0crC+7NfjyOOF/bSN3XORvDIyzh2u/OJbo6abWEEogk0d1M/vCYiIvclq5
	GY6J5n7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy1k-00000000Mk5-318T;
	Tue, 25 Feb 2025 16:43:24 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwrG-000000004W8-2WoD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 15:28:31 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30918c29da2so61315551fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 07:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740497309; x=1741102109; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSEl3QGwsciK3DZesh967er1Ic9Jq5iFZZ00R3tL8wc=;
        b=KF7GJloT8PnFlAg88qCBfGJK2OWb/O8RWquzGK5sAROy6pq3R9YlEv3MVvJUSLcJyG
         rAL1H1bg1BdxBS6yXkDqC1NHpMEZAASlE1NY8acxMqJtbr7JtUeB8Uio4cs2v5H8uBLN
         3QzaMJYKRHG8F84bGTlA4HVGdnIcliodktWQJKvQTR3Qn5U11irkNYTt7CEN4sD+O1m3
         wvpd5BLPXqfD2uSWd4qnT2lIW7RZc/TjJjsq5MxkXmlsT/Lto4R/tHVHl1CEx3JqJHB1
         vOcREGl55Mz27OIxUNttdOlAcye07d8XvS8tZ+ZOAAWdrPZCQfaVShCLocFhut6/i1jx
         9hMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740497309; x=1741102109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSEl3QGwsciK3DZesh967er1Ic9Jq5iFZZ00R3tL8wc=;
        b=ZJY/FuTD9l0nWmMuglrk2yY92dSbg3A9La0e7VP5+lbv0DfIjDvSV4ax1kaU8KFyRG
         6r5ohfK4ss8G82j72CWj/r8Oq3ufc8gReGTzo+KCEy76JfMsuP/9J8IEVwWlwkvcRsGo
         CSGk6ysmMllnceTeqLJq38NuGOMgM/SYCYZ3Pzs6jc3zF2UFr42feFMzONYnDL0+8G70
         rDhnLylI33SHsS1DLPXHiL4aGgqayCWnTlxXpVZj56w2/G8ck/LlkpObTFz4AQ1PVmGD
         Pzpu5R9OX8xGQt4n4A/LgDJDUEWpxzf754Orcsm4BPMiMq7lxrjJWXHtg3u2k+D51R7S
         YSeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhNeciDrrR+Vdo6+ly+3N2kzLbemQQygBioODr+IgTjE2m5k1CEdcMmXuiokxhVe2lY67lia3TRFfijjt8WzIe@lists.infradead.org
X-Gm-Message-State: AOJu0YxIwo3GeVwFugISe9hlmkg1o6WhIQXZQO53doGqdJxGD9NNBmby
	NA93WS93GcSawHzs3BTian6GBNJ5O9DACd3OekOsgXUHxmiz6s3/rbpQcIiLY15jaKbNxcph+3A
	4mzWVDyS4/oJcdUeqnd5D3HMoGUHsyIbsfBGV7A==
X-Gm-Gg: ASbGncu1MMCcHiprjsyeSiMuyyF+k/Ib1C1QYmm2bN92bD9pDIt9JTFXsxVG7mUWao5
	SZOAqfOPQry5gpJ5hEOYYZEJHVeUBs/1b2IHeaCiwkrwA404Qdh1tBpSw8hiPtJfEp9V3XyPBv2
	CK6FdHh5c=
X-Google-Smtp-Source: AGHT+IGhBcI3R96Ygjl+ia9NcJw/ZFQLjv7p2n56sPt5viyPNoWWS80PuvTaUtF7NwD5c1yT/18+krfoAge6OiTuJt4=
X-Received: by 2002:a2e:b38c:0:b0:2ff:e7c3:9e2e with SMTP id
 38308e7fff4ca-30a80c16470mr16634731fa.17.1740497308697; Tue, 25 Feb 2025
 07:28:28 -0800 (PST)
MIME-Version: 1.0
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com> <20250221180349.1413089-6-vincenzo.frascino@arm.com>
In-Reply-To: <20250221180349.1413089-6-vincenzo.frascino@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 16:28:17 +0100
X-Gm-Features: AWEUYZm9-GSXUNrjqwaX5LIfxqSFIktvtYAfGG9Wtd97LclpY3yNzhXHmiBivzk
Message-ID: <CACRpkdYX3Ad4PDDwFV-9FG5KgB_55JmiRMuCetVAAhmw38NBHg@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] dt-bindings: arm-pmu: Add support for ARM
 Rainier PMU
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_072830_637020_48608969 
X-CRM114-Status: UNSURE (   9.21  )
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

On Fri, Feb 21, 2025 at 7:04=E2=80=AFPM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:

> Add support for the ARM Rainier CPU core PMU.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

