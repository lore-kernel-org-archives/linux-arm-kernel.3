Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C40C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6ua4V92NoIFfsZQXFItvUEVFE3bhvGaNwUwjEPfQYZs=; b=hsKqGvH3AiTZZqoNOT+sW/TmUY
	ZgnjEulD8dcap2f/ObwTnT4HZUy9LzOHvkjvcrowU2LVD/b9z4P/ckk44xUDGmlkYSnBaFlLiC/W4
	PZq/whSsNQ2H1PaXMxJQVmD1sKQSHIN9xOMuJAiI157SmuTDPfupoUH9zTyqVa4aiqPmnUjC0MpxS
	abhDi9Z9T98PRF8/vHgGGeWybGynLtC4HRhTgtpC+af0cIyiuIHoHRYM0a40pQHMU7lsmXF9WoXpf
	pQd3QU7ISzgG49blbcJmnkZwmJzrorj0wKE4lDIXkUH9BuSufvZdh+M+ZL5iqj7gtnMlVos5pEihI
	7e+0DdhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2ae-00000000zxV-1IVP;
	Thu, 08 May 2025 14:51:12 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1xu-00000000rpU-3GvO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 14:11:11 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ad216a5a59cso2518066b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 07:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746713468; x=1747318268; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ua4V92NoIFfsZQXFItvUEVFE3bhvGaNwUwjEPfQYZs=;
        b=eO4wApLAeG1WfIaWrhtVkVDtzqFhJz7ktEOH6OZRbjH5uYecwktUvAIF3/OIFQhUXt
         KHRNt4BBIl9XcA4g6jliQhmZKuCUPfalMHgWOxCkFYLZFUBEnRELKvrwzP4qVoJFGliq
         GYq9O4PzVcGIIiQVx3/MrcCJDXjmfGpd8A8hwoJhU3S0rSz1vDNavHNKD8GiGDiZOdKy
         XZ4MPganMf6l+rMS8I9Ien6JFfBCqay2vJnN/sE7ZKC0/GuGstTHBvwYJEHxokRDUVPq
         W8NTQAB7Num+A6S1IlzLgfY0O0OX/RnA9fBie2qRQu8L+t795I1+J4keRZhDYlDgi1ri
         Jicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746713468; x=1747318268;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ua4V92NoIFfsZQXFItvUEVFE3bhvGaNwUwjEPfQYZs=;
        b=VrQG2KsQZwz3/kpc+g2Ov78HqezbHxbKd8ZpHwpgNWSXXeq27zukx99rbYgJMDkgMB
         4/tICM+ps2e2uco2/fZnt2sx316aCx5/N00XCr3G05B0ADy9F5smq8jBcWcmELJrcSYA
         2HihcCgcSxEk7QUW0L0KlJa6U0psST7Mw9VN9BhpDPK90fOF2F5L1/x7WKcej84yZFVO
         wSj1QrDGpLA7//Xh+j6O1LtOIERkbyvOa2MS6i4GBjDaqfPt0WjUd0/EmKQXvo5kdxZP
         akXzfQ+L4LVTf8odRa7Hyo72cCPS2I4fl0shBl8O1HzClEdAUXdFGy+w9CpCGdlyIWaf
         eSBg==
X-Forwarded-Encrypted: i=1; AJvYcCU/Whovbunh+6gjCLVCaTaqZ3e6kkD6jvBc0J9/qfdBgtEISPnK/ydxjGuRAvMiNfmRBjcAiO86IrUbhD9Qw4w1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1wUsNJgoC8RJukgInaGJpx/eQYFnSUj1WuiFcPfvhImIJFjca
	t/hkYfnz6YUmWZPyILV0ls0xV2VEcxQ4IhYwzlDCsthws9jYAdFw
X-Gm-Gg: ASbGncu8/+OYqhHAo3shUMoycrT7TQf/slbDUvVx4vsG21OYvirGD0sZ69uAjngYAf3
	dMgBfCo+M7CEtv2++hjIJYJEY7mNBxbbpxFGHhb8Zr9xV2rf6RmfvQJkxmZpRm7YTjtf6Iw8+G3
	ki/T9nk3tmmv4gkkqrZAh3mlZAoWFIWX/3TgON8mxTh/NRRhoukUzwd/jjRace1kxpCZO1yBGzo
	slPAZ2Dk8szO5/OETSCd9KLrA0QJj2wv4zwYPUnqqDIFOGxWzAwvDhe3lDXSl0t3+sC03jboIej
	FassKGEkoG8LA1iNo4JqmpmaYU9zVja+YF2y+P/m2qNa6QEgMrOc0qRPFzTOGHVR1bDHBOV4WSC
	IWQ24
X-Google-Smtp-Source: AGHT+IE74nCsMrjWx1sNhOE7r+vEsthDSCktjhOI0HzucndfvBuhDWWhOESu2QR7Rl7L+nmpxU8msQ==
X-Received: by 2002:a17:906:9c94:b0:aca:e2d6:508c with SMTP id a640c23a62f3a-ad1fe9e3cecmr334933366b.56.1746713468106;
        Thu, 08 May 2025 07:11:08 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18914d031sm1090262966b.20.2025.05.08.07.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:11:07 -0700 (PDT)
Date: Thu, 8 May 2025 16:11:05 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Moto G (2013) DTS updates
Message-ID: <cover.1746711762.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_071110_816136_E5433F75 
X-CRM114-Status: GOOD (  10.19  )
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

This series improves the accuracy of motorola-falcon's DTS.

As a side note, I wanted to ask how to describe the Hall effect sensor's
vdd-supply. The sensor's currently described as part of the gpio-keys node.
According to the schematic it's powered by pm8226_lvs1, but I don't see a way
to describe this as part of the gpio-keys node (maybe it's always-on because
of this? Downstream describes it as gpio-keys too). Any tips?

Stanislav Jakubek (4):
  ARM: dts: qcom: msm8226-motorola-falcon: add clocks, power-domain to
    simpleFB
  ARM: dts: qcom: msm8226-motorola-falcon: add I2C clock frequencies
  ARM: dts: qcom: msm8226-motorola-falcon: limit TPS65132 to 5.4V
  ARM: dts: qcom: msm8226-motorola-falcon: specify vddio_disp output
    voltage

 .../boot/dts/qcom/msm8226-motorola-falcon.dts | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

-- 
2.43.0


