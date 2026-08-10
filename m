Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57565C5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUgBklvY23mceUXTKtC3ytvOgEkznOjtPrROK/VGe9c=; b=SKRQDyvekSLa6cgvsoCFy2ZiiW
	5T9BSx/QU5hsUrlsDG8xVbn0AeGdg/WuWmyot5iVyig2UxRKJu3wL/HjioTxAdu++Bbs1mJORki7T
	jeddzJTt257JOTe/l3drZ72cGebo/yMObIZuHLXOKBvjMqDQ5t6mvp4zWbSDCwYzBl+wHfTB/GPXv
	MxLQKOH8YyZ20QtIdE9o38kQVw/V8JalRtQAGErXqR6PAOJIINTHb0ZG6tSaVhSzSkfjVThvMkmzd
	jQQIjRvVVo5DhOJdDIa0Fl9wMO8wbhjizI9GNEWZqYw0O647mbSU87BIk3qAuAA6HkNO5B/6bUnIQ
	Tm48vXcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQs1-0000000Bz5n-07ik;
	Mon, 10 Aug 2026 14:20:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQrz-0000000Bz3t-16ak
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:20:52 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-495635a85d2so17478075e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786371649; x=1786976449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUgBklvY23mceUXTKtC3ytvOgEkznOjtPrROK/VGe9c=;
        b=gxXQ8JCdaGi8IWqoE4F+LsbhcxTJoKDeZUiMiMTwkcG2RzjTFS4v3I/IMefEJYWxYe
         4zxc9rJZ2PdJ0UujDzswYahDOYGimsDXril6L5u3Z4SYRk4N47fsLJvXXv44O7PDghZu
         VnKuBbguzZ6JEOyUba2UgWev3wj+2tLveBgyNNgH0Fw4OcY3pS4O/BDbiuMNjKnDHltN
         +F7Bgb1NgXsalCWwQwndER8t92dCsiaJ/65bNaIOoiV/TyyruXwNKofAjz94/oogCNn8
         0QVQj795ThNbGTRxQHb4NrbRpDVd1CRBAyDwwxDVZuOFmKErw+DhVS6+0XELOH8KABoo
         5drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371649; x=1786976449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUgBklvY23mceUXTKtC3ytvOgEkznOjtPrROK/VGe9c=;
        b=LRMaagwVQTlDPkFLgUFq+wXU/SuFVGTaYwiLiedajcaLwNuQPld2trSBOSWQCAHuzT
         ecRV6EOkgd313Mp4DRJ34V34ZgDoqJH9km8PnVzavpGzg6i/upDHB0bxhGcp0RoGLGSv
         b/suSsjw6hQPuKiu2Fhc9yzvv1igMVOpeOog4sldVIufLOefNRLHTrPxS5FURe1EgGUn
         I2Z5uyWrNEF48sn/rmxCdSn4wtAKFUE24lqS83oLAuDysYLkCuManpBfpBmY9xVM38nL
         Q7EbvCzJUhnDXW+7zCcYkqzfiJ2OpCktlS0Uok4yDomwS+JLB6dVPkfAr4LNNvoYBLy2
         Ik2A==
X-Forwarded-Encrypted: i=1; AHgh+Rqp9jZOkixepcvKiDXNGtUiwvxvuCd9lxFkxXtJPz74uJ1zW3w8QxEo68307Q0HFPjElFbYCsxbZPe6Kfvy1vKd@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5CJcbLw7iilp6zFHxD9omJfXMaR/8BwEMVxhIU729EHaoIkz2
	3L74vJxsKV0fxAJ/wSgtDBWKizkhxgEAWMnc5I1tXgC7qvnsYJH1ccuO
X-Gm-Gg: AR+sD11ut74d927tIBJIplRTTger2N1Jl8VGqwCYvRFNJrTrPBkXtytFBlMhHnQMsFJ
	AA6EicMFPquBoBDuFTnzmUYz+2vHFXOKyEo49ACWaQ6mSkPPdsa2PclvenNbjTYomSLl/GaFYPz
	BqG3ilWvGVoOs5zqX7mApdw32z3ggKI1eYFyBNggTCJ1UiTyw5AJy2flJFqMMAYfQk/5vKgZEvm
	MUcQ5F3U5Js+27Ex6TtARDWK5fhYAIYjmRCRn7txJd6y3Ska2mTzZCp/31Uas21h5EazgoM1grt
	3RZxfNgx6GkRA1ahVdIKs4H593thqoE5uyP3dJ+7X0jQjkxo+tyliO1ZHM0+XxrWStMKdVSXcry
	k8HANec7STzV4CgEzkEOB/VUjUbenqMgZ2zYbMi+m2iPESbVj8P2JIwhiGHszhffER3O8gpxc4J
	EtH3U2kLLzXg9+hRJQ65mfm64Yd/Mcil54r9kGlLcP7A8YLeCmpTntPzU4rRj87xLAucE=
X-Received: by 2002:a05:600c:a202:b0:495:7838:7e25 with SMTP id 5b1f17b1804b1-4994e7d01b1mr420429285e9.15.1786371649047;
        Mon, 10 Aug 2026 07:20:49 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm354413055e9.6.2026.08.10.07.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:20:48 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] ARM: dts: vf: Iris carrier board for the Colibri VF50 and VF61
Date: Mon, 10 Aug 2026 16:20:43 +0200
Message-ID: <20260810142047.2811230-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810140053.2793495-1-mehmet.fide@gmail.com>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_072051_318231_0B99250B 
X-CRM114-Status: GOOD (  17.37  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Mainline carries Iris carrier board device trees for every i.MX Colibri
but none for the Vybrid ones, so a VF50 or VF61 on that carrier has
nothing to boot with except the eval board tree. This series adds the
carrier, and picks up two things on the module tree on the way.

All of it is tested on a Colibri VF50 on an Iris V1.1 running 6.18.44.

Changes in v2:
- Document the two new board compatibles in fsl.yaml, so dtbs_check stays
  quiet. New patch 3, pointed out by the Sashiko review bot.
- No change to the other three patches.

v1: https://lore.kernel.org/all/20260810140053.2793495-1-mehmet.fide@gmail.com/

Patch 1 applies the EXT_IO pin group, which is defined in the module dtsi
and referenced by nothing. It replaces a patch I sent on 2026-08-07 that
hogged the group on &iomuxc; hanging it off gpio2 instead avoids the
fw_devlink dependency cycle that a pin controller referencing its own
child produces.

Patch 2 names the SODIMM lines, as the i.MX Colibri trees already do.

Patch 3 documents the carrier, patch 4 adds it.

Mehmet Fide (4):
  ARM: dts: vf-colibri: apply the EXT_IO pin group
  ARM: dts: vf-colibri: name the SODIMM gpio lines
  dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
  ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61

 .../devicetree/bindings/arm/fsl.yaml          |  12 ++
 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 125 ++++++++++++++
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi      | 153 ++++++++++++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  13 ++
 6 files changed, 319 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts

-- 
2.54.0


