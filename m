Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5E8C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 07:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7kVEqO7RMErZOqrCCwlGVc05Mm1O5AzHceXa51xeCso=; b=zzix7uaKEkFlR357H7Pi/4cWhF
	BOYR0ZxeU96IpB57xeFGUDFxeEHPaIMOoSgQdCfknxQVPQTurrfD41W+v4mlmVwAtQ0kCCct1Tcv3
	Zbz175O5Xw2PHh6AesPXDL7S9xTodR+Kglnd5dM/KoyarzvnIDtunLWJmLWZQ2nJ7jZNxv0OX2aNi
	vUG2KEtvE0uFYEqeYaWCbfRq3ErAHRFC5ezSHXam8VCKSwQ/GnYdlr5/PsT5vGtpMpB6YrcFwLxmJ
	R0tiMyXpd+y8yEKTIMp6aDTzxczWcujnIsJXeIjArZhGU3U7TfxERi6FRawwXNl1zV8aav6DgrTTO
	rcuG/Yqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAjTI-0000000G6w5-3665;
	Sun, 27 Sep 2026 07:38:52 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAjTG-0000000G6vT-2MvP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 07:38:51 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843cedd129so1126289f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 00:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790494729; x=1791099529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7kVEqO7RMErZOqrCCwlGVc05Mm1O5AzHceXa51xeCso=;
        b=G/XzjDV8qWybuUnUncv3dymlh9SO1ToTJ/nczB9ruAQaX9JgBJX1jy8bBYWg7H/pLp
         V3x3aeU5A3sfzB+yG3lRVRfMq1WFzLyLFtm9GRKAO/m9GKfyMsjnwb8vWFOY2l3QyRGD
         r1vSyfkFro63dCeIIPbVkEs2xAas3Y83Bn8rYfJXH6PTC2yQLjy6R5+Sr4SuXDe4RGCY
         WXQtLPld1DyDyw1JwWYjZk2+7D8EcbM3osEdoU9XRz3xgXM8wls1kZXOQdVqaJsZLXdU
         o0cq50eWgWPAr080QwW0XHAe/7CbETRgkeXtCi8JKvJ0UTrASseRqbw2fsGrEime++Xt
         3tIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790494729; x=1791099529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7kVEqO7RMErZOqrCCwlGVc05Mm1O5AzHceXa51xeCso=;
        b=tICdBxklJ/8JsPiaOMt1tGh26rEhrZ53Ds+LtyJWnas+NF3s9B1GLGyRA5A8tKMd6K
         3LAt5niZhMjr81IFD5mFaMQ0XnhoXFr5o45kUmg8z96C7un7N44Uj8aMVbTvypbag7bg
         bP41VSmqzdOoHVjli9X7vXmotOvim/DkzTBUFPfm8fIlVbKAbg2em9NqcFZNev7r1GX4
         RER/JTDn0q4gaSVDyIQushNsyeOJASutzUgAsBDwcZk/RFd35VkolHE/wFY18eIdqjJD
         Y5UP70xYh+NqgjEte+aNIznofadqN12Nsj7XxlTKzDA2aajyGqq9aU1RDxX866lhxULy
         IuZg==
X-Forwarded-Encrypted: i=1; AKwUvBzlgkTjvFesnIW5qkyrjId4HpP/G5DLP0NoDgE9CLBIAfKpNEhJHSee2gVPhuKFxjOKaATMW9XWAue9bJctroWR@lists.infradead.org
X-Gm-Message-State: AFq9FYJBp/nj15+nbh5Vq7ZrTRwEBD6KThULAIF472GDrtPjj+hbwpCX
	I9cGPCmWlYDhcHFp+/RlU72mgeWBsTsnluk7SjedTGng6WbNsMIVdOHH
X-Gm-Gg: AYBFou2blb1TEW+owXBQ1q1HrsE2ZD7vTz5NRq3O+ujJBQngTgx+VHucUQYSs6xuW1J
	rt8doxfanOQEVqHgGXWPH0hLjROxHYHG6qNJvLTmr2SlhE02TcwOewixpqrG9T/PcTkuimK4kqD
	PpMd7Yw1k63ZmKVsESyQ4hX8Uh1xx+m0jbNEuifk3JIZFHD/Oz8VIO21wOJsQfsG069LkfnGSJP
	tUP4VcUvxJQ/vPhigHXnaM3vKEVuRMwKPiIMNZO00w5TFGZG4N9UpicvBNzFAo+vx0WggOWI5YO
	mjocyHN6DqcLcjDuX6JqjQVOuq8MW/oXaFSOXPCM1tdx9Ke8qOw1pe4J7h4AqV1xzr2wxab66aK
	O41rnaWFhQ+4Mmz2npRW052Fsdahdfc5MrTXEOllJOi4qise/hZ8ZNZtQkoG36C5X80wTY61zXA
	/T+rTv1aYcyTulRknTPZCA2VHAvjk9lb4eh60PPI2ZKx41oAacFMobAD+A1LBMCRQd+dTLi6bYT
	l0QIBfnAoourSxiiGLbzLFJPAS4IJhpyC5Gv9LV
X-Received: by 2002:a5d:5f85:0:b0:488:7fc7:dffc with SMTP id ffacd0b85a97d-4887fc7e08cmr12715977f8f.37.1790494728438;
        Sun, 27 Sep 2026 00:38:48 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35607bsm17210652f8f.16.2026.09.27.00.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:38:48 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	vadim.fedorenko@linux.dev,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next 0/2] net: axienet: allow instantiation without a device tree
Date: Sun, 27 Sep 2026 10:38:41 +0300
Message-ID: <20260927073843.346910-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_003850_623834_A02D139F 
X-CRM114-Status: GOOD (  13.72  )
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

The ADVA TimeCard X2 is a PCIe timing card driven by ptp_ocp.  Its FPGA
contains an AXI Ethernet MAC with an AXI DMA engine.  The plan discussed
on netdev [1] is for ptp_ocp to register the MAC as a child platform
device described by a software node, so that this driver runs it rather
than a copy in ptp_ocp; Vadim Fedorenko agreed that a platform device is
the way to go.

These two patches are what axienet needs for that, apart from one more
change - letting the DMA device differ from the platform device - which
has no user without ptp_ocp and will be posted together with the ptp_ocp
patches:

1/2 reads the probe-time configuration through the device_property and
    fwnode APIs, so it can come from a software node.  No change for
    device tree users.
2/2 adds a MODULE_ALIAS, so a device registered by name autoloads the
    module.

Both were tested on the X2 with a local ptp_ocp change.

[1] https://lore.kernel.org/netdev/CAMuE1bHr84n5LKcj02HmMR5XefPtvQ-UEJAx7+UKfYvRgS0eDg@mail.gmail.com/

Sagi Maimon (2):
  net: axienet: use device_property and fwnode APIs for probe-time
    config
  net: axienet: add a MODULE_ALIAS for platform instantiation

 .../net/ethernet/xilinx/xilinx_axienet_main.c | 34 ++++++++++++-------
 1 file changed, 22 insertions(+), 12 deletions(-)


base-commit: 014d795c73837ea2339a4ea8e8f82c6e959b845d
-- 
2.47.0


