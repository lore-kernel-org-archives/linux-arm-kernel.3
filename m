Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4908DC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 07:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FP+gLOszNdkYTUHyCbw8OXVGoIovDektjO/Dfou+tRs=; b=Mwmwp50fwkmnqfa9WsD9TiIGNG
	wz2kMYxMoBl1O3rPMgrtRUQt7xNTWoRJO7nNR9nMdYcfy5RJOF0dQjvKiyBcMPzeu197RSwDyf31x
	WVEsiKw95NPxhJcHkJxhtO86wPfwZpA+hcxurV01tfKpj/ZTFohhmJTbT0vieMnSh2qy7w2qBzTIs
	GKGD5vfOkkFUNhRbFBuC+hGcBhz3IY/ugE0klxIg625AGZZ/v52j4fuLf4pRnKQveUlMHnqa6YNVi
	gtY+jAdL0OR9x5aKm57Puo+/cYT4HdoA2tFWDRSKMsUeEbhSRBJxJiGWqA0YGpHhjo7TTj82HusJs
	MbV5g71w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB60v-0000000HZOm-37WQ;
	Mon, 28 Sep 2026 07:43:05 +0000
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB60t-0000000HZNh-27u8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 07:43:04 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c2af3a4f193so269926766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790581381; x=1791186181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FP+gLOszNdkYTUHyCbw8OXVGoIovDektjO/Dfou+tRs=;
        b=Fga2oJi+RRteeVEpVJ7KBNf9xPBk+HlltdTfQv2kNI59qzV9I6v5KDB+Mjkio8nWyv
         lMssIi+nvGd6HTPlGacCpebas5V+2XNGBO8ORblqfNR0ZeEC6DlD9o/XElnfv6ZSE5Gl
         7kawBLzTSZClV6e0Kd79CH1lMYgwlJsmav6tg7Qvkewy0svbq/KMKCSaXLlATgrzEJbt
         TywkiKiNs3egalqHypoJ7THNv3abWeqvw1eAAEiDtZbztjTsK87h3DZhVDnN2Ef3VXlO
         l7aDjC0C+j8pJqKrIam+RqV/xsEMfdYl6qwHNTlDa53Dij1Dn/wPwewpPGXXjHnYDjXm
         j4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790581381; x=1791186181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FP+gLOszNdkYTUHyCbw8OXVGoIovDektjO/Dfou+tRs=;
        b=acBTz/1oFYeCrccS3ltA4sUkqC9Hh+6UU+F/3wPo5P2ipl327BZ6/OOIpB9tnKeDUr
         j5yg+ErGGGJuH+Ugt949xAbqlGEuGfo2VFQsSwVh94Ij79UBvkMumBc/Vm9qNW4RBvXg
         xfIIcgzDvDy6kSPBECz5eJ42a6N93Zzxh32aBUssxmIoIcdCX3xWZ+lH5Q9h9Fqq7IKT
         wzVQdHOko2gji2VBKgQHYrFYyK4NX2Te+slra2fKMxjHny77U5owM4ADkrL7d7EE8D8P
         GjJwFkiRnME5CQs9dk8WT72Su5TyubGiOeP/2yy9QFBjo0l2di0UoDWTdTP8noNaeCpB
         umUA==
X-Forwarded-Encrypted: i=1; AKwUvBwELWYTYCg1ikm8kU2cwMQeV1e8PyfTyf6WEfoF5FeNiVRNPNPOo1fkSp9C+N28BXVNSyGI92peUWTZCJP0H1rF@lists.infradead.org
X-Gm-Message-State: AFq9FYJQprD9zI4cuoQS+NTvBK0f+wRDNdPUxFs0xxrMbAf7sNUzDaql
	uA6oR7G6+24TS6uMgzcztvrwQxcONqZj4rqayLeGWmOP4gQFpmLtcP/3
X-Gm-Gg: AYBFou0D1vq0J5Txz3/JEshbkVAm1qEVzH5wV0KrL9L4UYIrDPB99PUb6ak079vXNDZ
	/IDUhqkyZ2msdorNWnWBe8czPDN2OciHPDNANOdbeF6tMtL2aRwJPUsjFHDyEbYyb/LwgjxsF2e
	EC/adBZDU/03vkaplqogl8mBd1ktPAKZqbvhuzGDfku+Dezgd5KQdVDPAWMeHWGK+8nDWjRM6r1
	6iosFBOQJd0lWzSIoZnZfStN469v4KGwz1nQl0v6tYV31hCrckSXbPskSUQHyNWK3DhfQzA4fL6
	UNppdcL+arQOiAcC1zIIXQwoeDq05PaXLYg3iNfHDT8ZlxMdH/AHdDqw9GeOifmnnE0ZVKybJlQ
	NfhL3+pIC80W57q9fh46wlNv3C2kfHGXwU/q3b5hzNU3Hj0KWlY9CFZI4/Cqt7vabycOp66d7Tz
	yRVEP0ytzjkLyxaum35B9miZRuQLIshsnfZa//MLMXAMdM+sPPtRcTbqeUCyNpCmlxoE22M19cP
	PejHgBoGOudIonTzY8pgHbovQHXZY9X3IgE/dYQ
X-Received: by 2002:a17:907:1888:b0:c26:19de:9ae3 with SMTP id a640c23a62f3a-c2ac25ed786mr991954666b.34.1790581380877;
        Mon, 28 Sep 2026 00:43:00 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae76ac760sm419415166b.39.2026.09.28.00.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 00:43:00 -0700 (PDT)
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
	richardcochran@gmail.com,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next v2 0/2] net: axienet: allow instantiation without a device tree
Date: Mon, 28 Sep 2026 10:42:54 +0300
Message-ID: <20260928074256.462345-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_004303_566078_61628AAE 
X-CRM114-Status: GOOD (  15.56  )
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

Changes in v2:
- 1/2: convert only the four lookups a software node provides:
  xlnx,rxmem, phy-mode, the MAC address and the PHY connection.
  xlnx,switch-x-sgmii and the deprecated xlnx,phy-type stay OF only, as
  Andrew asked, and so do xlnx,txcsum, xlnx,rxcsum and the "dmas" test,
  which the X2 does not use either.
- 1/2: v1's hardware test was not re-run.  The X2's software node sets
  none of the lookups that went back to OF, so each finds nothing with
  either version.
- 2/2: unchanged.
- v1: https://lore.kernel.org/netdev/20260927073843.346910-1-maimon.sagi@gmail.com/

Sagi Maimon (2):
  net: axienet: use device_property and fwnode APIs for probe-time
    config
  net: axienet: add a MODULE_ALIAS for platform instantiation

 .../net/ethernet/xilinx/xilinx_axienet_main.c | 22 ++++++++++++++-----
 1 file changed, 16 insertions(+), 6 deletions(-)


base-commit: 014d795c73837ea2339a4ea8e8f82c6e959b845d
-- 
2.47.0


