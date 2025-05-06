Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCB5C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ea2yeqyCln5YmQUlQrOfEBlQkw4IJEtC+0ef1Pufbzk=; b=4hgGMxKmFuGgrmDfeBzTbyISb1
	V6CYBqJvVzZ7ySa23dkbBZ8SnlijMOvmXDPpF79lH+yR1oR0C86K25sIIiAu/CprqZdxsxi8HZi5T
	VsMmBip+x3RzBo3lBhywQR58c9r7Zq4Fn2Gb5iF7sTcOz5N3YfgtImYkM1KcuB6DERSYwYgMktZ6+
	64laLDcjy57DWqC5EwP6bphHFHis2RtCS6QkNG+KiwjX89itlrUWtuOz8cipD0QUS4Htd2oDsBKIA
	OxgkKXhTTqkE+zun+i8e/oomtgM5ahTvlpY7Ys2VTckfFKkZFQmHF8ZUNLZOyK3+m5Dx5c6Q1H35D
	/ZyFA98g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHcn-0000000Bx9r-2fpx;
	Tue, 06 May 2025 12:42:17 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFai-0000000BZuR-0zHE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:32:01 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so21422405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 03:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746527518; x=1747132318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ea2yeqyCln5YmQUlQrOfEBlQkw4IJEtC+0ef1Pufbzk=;
        b=JCatcamqJtbTzi6NTrdtxjGSEqRcICALvGPPdzx04vmWczSGy6X7pvBVmgXxoBlHYY
         +vRJ/3qnTGPmT2c8eaZPt6pT3OWVLruQZoHrCSn9S03usniS5p1iDnDmeOO2voH8lfM4
         yxrvcfWFrwx1FZVXqXYDL4UNUeSWRSSHObY+MkJ0TWl6zwj3d8vxp+M2Rk7FkRhFKOD5
         qMD97DnIzBO7tr1QNBYKlC7gZUOW/usfhRF16uhdrxow2cu8z6iUqrrKpUbqpcJjoUKg
         WMEdTZPTiOMTFHYWEuIBWxbQpsVbA3+mEA18+5WmJCKqXzLWW2A8fLWjeHQ/ddS5bYk8
         SjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746527518; x=1747132318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ea2yeqyCln5YmQUlQrOfEBlQkw4IJEtC+0ef1Pufbzk=;
        b=c3g728aekA1w9na9J2Vmz7x0Z/pC++cd36eYOciGlL4yT6EJK7mdD00fRE9M8YF/AX
         altNEEn7qb+LutshQs9LyMEuUSG5BQ5tBjXU36DcZarsoQgJNiN69x7T7y2kvW1DOJWt
         CXM2UosPtcNAEJNbgsFQrNFfGioU4npQKa/vOsORf0DBZ0IzNf/y4Stn8uRvYdFaFK6M
         pGNUfRIr2sPhn+eEtkLXARmY6jJz+EuXExcaWvFhnW+U5eNBPHO2sv5HlcYkCVZ4F+wl
         37R9o6e1eVH/cZ1MWOcMv2fsJKr3POPdKxLoZIkK5qD+5OB2Q36RK3vHMg8hQ5bmZEFQ
         vpPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdUVPfLJi/Ahx35CoKjWwJ55+9QUGMXPmidrKXv3aUHXV7x4l2fclVpcPozWP4jRat3oF8cEACEgmGFEotS84z@lists.infradead.org
X-Gm-Message-State: AOJu0YxeWkm4EWKieXRGhdBdcrFj3reVz+7Lmmf9htK8ZB44NZB+jpg8
	9fKho+nh+YXHgCY6RAar5iyt1NCyPSvh0ybwoGninvZpM8gTRguNY0TX0aNvRa8=
X-Gm-Gg: ASbGnctOYVYgq95Ka7q8XFH9WQgmyA9mchjjaYjbHKdMd1i2oSfBPt/fvbpB41j3d0g
	7tdG4oL/gL7h6r6faCoNRP+GtcGOki2THbfBzUm2NGrf8F2bexmKN2xBo5y8iAbIBaVZe0IEIPb
	H5fL81Mx+mb1/XaBZGIHiClMSp7nnocjSwSPjEizCn9495kkZazF9f1um7S7vdjd29OhX3CtaHb
	TmsPZjw9kcWte5lqlFWBHQSTmfn8QsVMkVh30YSKqU3q0lX6pR1tMN576bla/EIe1LMUFedbuZp
	Gf2kv+D53lc6P/YT5L2UcEra46PblhKhFcyney/TGxsILI5tqArQOcTUVHGGZQ4TlQ==
X-Google-Smtp-Source: AGHT+IFlaL3zlxfWhU9eMQsd2gakbJ4MFYO8Vvi3cHZ3L2dU+abGaPcYIyJZw9nvTDrS+u/WlfaH6w==
X-Received: by 2002:a05:600c:8212:b0:43c:fae1:5151 with SMTP id 5b1f17b1804b1-441d0531289mr19620165e9.25.1746527518190;
        Tue, 06 May 2025 03:31:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:26ec:c7bf:3d4f:d8ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc469sm166148695e9.6.2025.05.06.03.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:31:57 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/2] Add support for Renesas OSTM on RZ/V2N SoC
Date: Tue,  6 May 2025 11:31:50 +0100
Message-ID: <20250506103152.109525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_033200_291716_4CD817A0 
X-CRM114-Status: GOOD (  13.93  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for the Renesas OS Timer (OSTM) found on
the Renesas RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to
that on other RZ families.

v2->v3:
- Dropped config check and unconditionally enabled reprobe support for all
  SoCs.

v1->v2:
- Inveted the logic in the dt-bindings to require the "resets" property
- Instead of adding config for new SoC, changed the probe condition to
  `CONFIG_ARM64`.
- Updated commit messages
- Added a Reviewed-by tag from Geert.

v1:
https://lore.kernel.org/all/20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
  clocksource/drivers/renesas-ostm: Unconditionally enable reprobe
    support

 .../devicetree/bindings/timer/renesas,ostm.yaml      | 12 ++++++------
 drivers/clocksource/renesas-ostm.c                   |  2 --
 2 files changed, 6 insertions(+), 8 deletions(-)

-- 
2.49.0


