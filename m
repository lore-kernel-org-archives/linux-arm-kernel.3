Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8438BC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 09:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNEKDUXXNxdZ3aoZYUXXrkyQwTuziw3tR5vOmFxFPD8=; b=ntFlhsZi/D5CBaZk7jjBPhtoLW
	eu/RqH+sFnAsv+Lxxa3mcI0UaE8WfxRHuXy8132DTMJRA7Tt+9vadLAmaze7DZZle6Ea1i76Lfi+e
	YpLgcb25OipQJ/mqpKC3gJLoyKY6iZzYjMa+5TKnWZ/fTEUnGU9T7TWsc86srzyUHkbkQ6LfW7dg/
	6B4rAUJQepryRecLnupRaeq4l4GV/+9msWeeYhj9zfxNrt5c+gCT3fGK6Hr9xRjuJPA0fWGyf+JhD
	j+x8CYmavU80NkvoPN8nyqZwx0Q1e31RM78pIdlIRKCHbEQaE8o30ySNT11XGhfQ3NtgrAtZ/SHen
	Ig17BWfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCXY-00000000EIS-0AyY;
	Sun, 09 Mar 2025 09:01:44 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCL2-00000000CRW-0O9w
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 08:48:49 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5e61375c108so1980509a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 00:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510126; x=1742114926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNEKDUXXNxdZ3aoZYUXXrkyQwTuziw3tR5vOmFxFPD8=;
        b=k49mWTKifUBXi/zrHMvEAyO3vyPA4hOV4AcZNjFPc+i+pFNOluLsxLoQLpLcg4oTwW
         9zdJDH6J7aGeayKX6FcBB/V1PotpVSZlD1ifyuMYy+gONs2Hqc64JWHs+2NYwdoXcWd/
         M69vFTbeaboDabo27pspLYlJ3KMMO2rXhsptQgh29eKhjeMXapakXf0iNBKt63Bq6/xp
         cqDLwbEkiOE38DzlFXzXc0v5QqK/cSmexTZgFkxNaPSeDVxxL/4LaboVf0UIZi23f5rW
         0yE2V/aZHG77tJOfgi6tTdyqcZjRHhJNmVAI6Uxszp9Qhz9+X+Pt/NezP9xojXExMs3R
         Yc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510126; x=1742114926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNEKDUXXNxdZ3aoZYUXXrkyQwTuziw3tR5vOmFxFPD8=;
        b=uaCzc9Lx8Zees3t/zINd+jmrynkfH1JfTwSu8EzZftrWBFOTJySrYBWXdetSrXBUtC
         hFDLKiUPOHf55tePcpFZQEtWme8nKTmNPeg09V4g1D1EyG866LtJq83UDXNUZpcmz4Bs
         9NhsP4FA1sQfeHlIJ51spc/tg5SekGH2TaB5XmIjkKpvk2LncBtKwpy1ZzAL6wWjB9bU
         r0kQ1dLwbEg482qaB9MbovYpK6M90loNfs5lT3sHVmYpDbg48DD/N8UpyBQr/ankwtRJ
         McNrG0dq1f87k7F0Eox0Gwf/chT6V8H4kHcOTRL4MwPMj92GazKNbGqQ3quqddSywzKZ
         M+oQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7fZ6pzMlUOqr2EoEPKry/YQH1VzSlxEgD/kwX8rN0JIr2//L7yHW1HL7ZrNoT0ZlbouXCuwZ075UjOAbtUxsO@lists.infradead.org
X-Gm-Message-State: AOJu0YxQa3OA+cyF6LwjvNbTzQwq89fnskDjDZwIwEAbdZaOmTGsIXkv
	yD1pJIa4dqTnq1ejukI2pRUEs8fhVd6PcYllpP+VEkrVT/b2Ll51
X-Gm-Gg: ASbGncthtYM4EbIhQi/SMqLXjUU+pBNhJhCia9GCG6LB1MK9FLcpx79Qby66Yxpz/Si
	B2XZOS/NdSl+NMN0PP0iC49L4zF953pjQGIEmqWogwRMJy5GQ85XBYQxTj5UTaZwCsP5Q9lFC7h
	7JvPiBQVYrIWHrJaK9S9fIUxz0ZXWVbcMlz/K5gbLWD5I9EmuVIynVXHvokw4NlQHecnveHcTag
	0au4SWlo4gqqX0LLR/XvDlNPUk3Xq/ilG51WMLwzVzEIDpiNFTN1Jj+NpmzjShdUPrLdvbtEc+T
	qKTlB+SSVyw5kQQYIOoFw583H1djPZ/uDgV0NObDnng+rWHsBCmaWmXxWw==
X-Google-Smtp-Source: AGHT+IFd4OXwST2S8J6EVuRFcvfp8HeWmw8/swAHhqOkgPPhysWXT9icPKoNrSp/fqbd/dZ8XFRNhw==
X-Received: by 2002:a17:907:9719:b0:abf:46cd:5e3f with SMTP id a640c23a62f3a-ac252a9d6acmr1037408766b.16.1741510126320;
        Sun, 09 Mar 2025 00:48:46 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:45 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH v2 07/16] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Sun,  9 Mar 2025 10:47:59 +0200
Message-ID: <20250309084814.3114794-8-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_004848_127483_2D39531E 
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

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 26f85151afbd..efdece2b33b9 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -9,6 +9,7 @@ title: Quad GMSL2 to CSI-2 Deserializer with GMSL1 Compatibility
 
 maintainers:
   - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description: |
   The MAX96712 deserializer converts GMSL2 or GMSL1 serial inputs into MIPI
diff --git a/MAINTAINERS b/MAINTAINERS
index f8ffb7cff9c5..abf3afc95fc9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14184,6 +14184,7 @@ F:	drivers/media/i2c/max9286.c
 
 MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
-- 
2.48.1


