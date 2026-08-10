Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14837C5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JRKE+fE845aOA8OzGKlsy7PDRI6qPQfdTEDqc0pnpUM=; b=ng8a9Yyj0iFds+0vUSgJnNCUeK
	bn7DDdO2ICvc2TVN6AgQ4RmL1LBw+AElnxlWQrO7UIv2XwD1giuwNVs3ZIFDNmCOe0A7n0wX74kxx
	lXeZJuT2xdI+RjMSatVSp6ZSQmxlNGBH6fXQcRN/iy7TsOM5M5xoFzOLwetKeFuTBeZG/suFApyUD
	Tumvaqf6siQDDDnVUYtGgFnaW4ZO+kLdzEWzBH7YaCt5fdRCA7NIlc5TfxsK/nL5B1sVIG2006A/N
	DYTuiJHuiAP8Lcw67kg/gkxdU73I49WDAowsAqvJVFg9hRbykNQpgbIpbZzLuAW9XH2eU9h/l+4b3
	tRbDvSRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQYm-0000000BwM0-3fRQ;
	Mon, 10 Aug 2026 14:01:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQYl-0000000BwKV-02a7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:01:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4954aff6088so17358435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786370457; x=1786975257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JRKE+fE845aOA8OzGKlsy7PDRI6qPQfdTEDqc0pnpUM=;
        b=eSLnTOU32WJDCUoYDQS0HGKD1Btfi8wpXxrzFkp7QFSgRj4vufTNe93kvIIp5tY3yR
         v6fAZvUKE/+ONgxBntpHUwgiOsCW9U6qrhwXIHvTlPBPv8Ruq4cczsdlok1b0OdL4MPg
         et4r6iCGhNKbe5MQR4AkLFk5asYgkffjOTBUsAbBBugig1wGLbMZPosvWo0DQepT9C/X
         +/1+Xop7fz1hmKX8jCmj9RdSZUtciThiKyUzYi2s7HUK+UugsI7+4wlpC8iV99hked3U
         o6cwlepFZgiz3FZ2hWJ7R4LOoTkkAi3/gRpL4+iK3TDJ2j+lx7sXErNSdXGzqqsTE2qk
         ufzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786370457; x=1786975257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JRKE+fE845aOA8OzGKlsy7PDRI6qPQfdTEDqc0pnpUM=;
        b=iftDexov6tpGzXoGAYOp59VL9aeWsWDdxvhoxmccqdN7B3hAVxZl7LN55H8itsQ+CL
         ciQmltfht65OrzdGC21xalXLZ+yKQw+8N+yugqF36u5qArz2WapUaKnwRw9SNZByLRrS
         mQb7bJnDn5vXBMJ3nPBsLPFmBahm/5g7LkDlqoyNNZ4Whblo258sy3PD529KN4hXuF+q
         sOqYT990K/TxKdZNhTtjR6gQ7Y0+n8WxXOA8gXhsopbDOhHXnD8FpgqwysFef8qIsy1T
         lxgZabjt3FkBfSUVGFTRv6f62XIdmhxUAgzjk+sOkTBBcKu0Ta+nlU9Kcb5jPAgrEdjp
         t/Dw==
X-Forwarded-Encrypted: i=1; AHgh+RqppWmzGfo3YGaBHeFJ58BUtem8wglKnrecN09BSmXMHa0KZLnpszK/wp6I8YTcW9Fu3OS101thZ5JFhaMHL6Qn@lists.infradead.org
X-Gm-Message-State: AOJu0YwTpdnNQAc7ghUePztdulYZzOb6qIqPJqC69zxPO45dxpiXhDWQ
	owTtrNNBulPexhaJqtD6ZdHAfE37wQRf21Jet4QeF6V//ogCdf91bTQH96kKZ2nP
X-Gm-Gg: AR+sD12O6UdR2Xu5g93uh7oORQIE+a0bQVoJmmyA8xAnrVGhAM4+lUWfDKQydmASwTw
	pasV5P4lvAakH1gyosdx5hDio2uH5uSW6SRbH0Ql8xkKzmrxSXGtxqrBsxtWe4OOGILzRVAT82d
	1uKuijq+G0+2CDjSuh6TQqLj59enJutkhwL8Yz2gebt99qM39e3V2w89vdmpxTm9bkfM5gtHTIS
	ehawNM5ZX5RkxGywVn6qRqfRD9ZCCJnxSFDKL0EEobJ6MkDVWv5SSFKeebsFKIaVM5IxoIATWRL
	NQBU5Um1hIAiPfzoMqzaTKi+xOnLMxUhPvWs4cru4VadTf1eym7CmTIXcnHatmK6C4zptaz+ehs
	+05UBjoLCOHD2oOBSstWMabTbSdNVS4O7WG4/PFmTf8Q1kMz28/gwJmn/kCH0oJow2hHxGOQhJu
	T24ILRC9HE42ef2neaAT23vpGvxdtkNGeA0SBxalcvVswdAiFSLh6fQBZlAbM4qleiYZU=
X-Received: by 2002:a05:600c:4f49:b0:493:cc25:9c0e with SMTP id 5b1f17b1804b1-499727a205cmr22968105e9.14.1786370455282;
        Mon, 10 Aug 2026 07:00:55 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm291661565e9.4.2026.08.10.07.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:00:54 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ARM: dts: vf: Iris carrier board for the Colibri VF50 and VF61
Date: Mon, 10 Aug 2026 16:00:50 +0200
Message-ID: <20260810140053.2793495-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_070059_073975_6C7182DB 
X-CRM114-Status: GOOD (  14.89  )
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

Patch 1 applies the EXT_IO pin group, which is defined in the module dtsi
and referenced by nothing. It replaces a patch I sent on 2026-08-07 that
hogged the group on &iomuxc; hanging it off gpio2 instead avoids the
fw_devlink dependency cycle that a pin controller referencing its own
child produces.

Patch 2 names the SODIMM lines, as the i.MX Colibri trees already do.

Patch 3 adds the carrier itself.

All three are tested on a Colibri VF50 on an Iris V1.1 running 6.18.44.

Mehmet Fide (3):
  ARM: dts: vf-colibri: apply the EXT_IO pin group
  ARM: dts: vf-colibri: name the SODIMM gpio lines
  ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61

 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 125 ++++++++++++++
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi      | 153 ++++++++++++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  13 ++
 5 files changed, 307 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts

-- 
2.54.0


