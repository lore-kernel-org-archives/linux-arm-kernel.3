Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55C1D6E2CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 19:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KZxHqu3SzujmiotRlzxJm3UYnzflG11IekQhIfmml9I=; b=b4vQkC8taGcLdY8UF8FqQrqdSO
	PG5MUN2rZCcXr/dJl0n5BP/CHEwuM4pWB9i7vi/bVIrlUPfBZuUDmoMS64jomQqDgeDaNUJdHs6Lb
	/jZD4RsgpBrpUConBrC2c9egqWHkCUxuOz1PfSCsSqMJojc6Zjc4P8YMWr7Bz2iLY/EZFOQelBr4Q
	y/eRYuc860UzvHXafmMjOd72rokC8Z6UCni82xi4Qzbcx9QLwD3QPEcBwBNJ2t5GSyovlTDm6vA1C
	x24yUNHzwaIAuMbmJqZ+UTb8FyJIeloVf1zcpy/JgGktGqlAuKCyBmXB68c8SROVoq3LK8tKIOTDb
	eEjOHFfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJKm-000000092n8-1Tgw;
	Thu, 18 Dec 2025 19:06:44 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJKj-000000092k6-1wxn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 19:06:42 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-64b8123c333so782033a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 11:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766084799; x=1766689599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KZxHqu3SzujmiotRlzxJm3UYnzflG11IekQhIfmml9I=;
        b=EeOwQnTh54sTBIsow1lGd3gbMxpMyaQp+OE+hrSSQQchu9WENrxaU853SL3BCIzyHg
         NfwTUMJvgbBJHqvCgMBg+xpNUz7rWo+IyFjNaDPZuW/ujasI/yQo4d8bkMRveTBA06bC
         ZpBjUwwB2uY1cZMg7z0O9ekzPBfTlpbQTjf0oZeO3XwqLbCImPt0XhtbDcUPlBvTUOlK
         OiCnyvoWB1DcTXS/AKaf/O9qtBxSu2rWaK3IovFT6I0JR7kNFuzEXN1bro1lxs3XE8zg
         L3tL8Yj7eIpgMI+C4H1vPKQ3vbPc+WuFVkdRIJBfTfpGnUg3bdVw3eOuoVygfOXw4W0r
         gw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766084799; x=1766689599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZxHqu3SzujmiotRlzxJm3UYnzflG11IekQhIfmml9I=;
        b=ClBsgAq3Xiyw3DYu2e5UICLpaPXJGF5ML02HW+LephYQFC7X6dmJ+wxNEAl+2008SI
         cllROc2foPPN45wpXqc8yvQNh3AdAbQA0tF6+lh33sUuEHwFYZ+szLukv/vXMVfGkm6P
         4+ka0sWAEz3PF4f+LQj3TXOutTbjYMBgwnmN6d/2GVurBZVWa5Kuhn9xflqwy+9KBKZX
         JZuVS5CzmwISFHvcPRvX4UOW8ktIvlkjuHYZYYDqv1DZpSw+oVCKrOfDZYT9WDF91lbs
         UwWhOpFr0+TgcTGsMePM8BVr+tGaOQTEKS7LBnxKf8EzZZysMaGwiWclIAqRhjKYkXlF
         dm3g==
X-Forwarded-Encrypted: i=1; AJvYcCXkUTV7BMYl2+1CcwLGjhblb1An7wVDNtTTgWjBsO59J8muHIKj/I+y2vE//OFx5aTUY4dyoCQJ1hKXVKa96mG2@lists.infradead.org
X-Gm-Message-State: AOJu0YyeMFaOQqD+l854DaCK+mz/E49RVyd2IVWdhWZejhYHDDWwlFmX
	ViTRb2OZ4f/TfWnfEocfMuS8H4Zum/wujz3cNEw6SJR4zrawkmHX1SgyA37rZFWZGCI=
X-Gm-Gg: AY/fxX4QYwiAbZdCeY7Oyb+Nfo98QE7B3Jm/tmItmGrnQq+beRCxEvLe+8v9wjNTOv5
	U4GYB3w+1l5CMXmhTgHG2uiLYRLYvfrXPUn2Ztsf7xwBzoi7XmD08CC77hGu5AphABy8n0CyGnH
	QoHb2T271ljA6HDlkv2AYmNF+gZQ1U/ope8lfAr5oE9Qxxv8+ae0fRL2HCigcJ+umEkpvpawK+O
	kCXXkUIsrMADSlaVykYOuLBCNFstmYtli878TAiLTjyPFKRTnVBCtwIl1G0Ef65tXfk7c2KWhWV
	imCkdUMTrnP+k30PlnPKkC1ePPDey2V3Mfo+Qi68B5qgDd03bQx/PqT1gN9d7lPbnq0auuBG5am
	LjqsZqAQrKH8HekYx/RVcr3FX5Ouc6OHPyz/Grbi3oT8m2up+h3YM62RbcoOix2oX9chKeZzEs2
	qzo3wDwePKSHAvg/DmdJZIgq6FeBUUnv3nJbhLvwRprkVOKZsWQKZF7w==
X-Google-Smtp-Source: AGHT+IHWG4LHoKaiiruOEBctdxAHnsbItZY+jg4X40WE9oC/dX/aDtGLSsf4UY9Cm0B4WQZVSPvMPw==
X-Received: by 2002:a05:6402:40c9:b0:649:8be7:eda with SMTP id 4fb4d7f45d1cf-64b8e94d0demr435503a12.8.1766084799432;
        Thu, 18 Dec 2025 11:06:39 -0800 (PST)
Received: from localhost (host-79-37-15-246.retail.telecomitalia.it. [79.37.15.246])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91056731sm173599a12.8.2025.12.18.11.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 11:06:38 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Phil Elwell <phil@raspberrypi.com>
Subject: [PATCH 0/4] Fix RP1 DeviceTree hierarchy and drop overlay support
Date: Thu, 18 Dec 2025 20:09:05 +0100
Message-ID: <cover.1766077285.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_110641_523089_929C6FC0 
X-CRM114-Status: GOOD (  15.47  )
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

The current RP1 implementation is plagued by several issues, as follows:

- the node name for RP1 is too specific and should be generic instead
  (see [1]).

- the fully defined DTS has its PCI hierarchy wrongly described. There
  should be a PCI root port between the root complex and the endpoint
  (see [1]).

- since CONFIG_PCI_DYNAMIC_OF_NODES can be dropped in the future
  becoming an automatically enabled feature, it would be wise to not
  depend on it (see [2]).

- overlay support has led to a lot of confusion. It's not really usable 
  right now and users are not even used to it (see [3]).

This patch aims at solving the aforementioned problems by amending the
PCI topology as follows:

  ...
  pcie@1000120000 {
    ...

    pci@0,0 {
      device_type = "pci";
      reg = <0x00 0x00 0x00 0x00 0x00>;
      ...

      dev@0,0 {
        compatible = "pci1de4,1";
        reg = <0x10000 0x00 0x00 0x00 0x00>;
        ...

        pci-ep-bus@1 {
          compatible = "simple-bus";
          ...

          /* peripherals child nodes */
        }; 
      }; 
    }; 
  }; 

The reg property is important since it permits the binding the OF
device_node structure to the pci_dev, encoding the BDF in the upper
portion of the address.

This patch also drops the overlay support in favor of the fully
described DT while streamlining it as a result.

Links:
[1] - https://lore.kernel.org/all/aTvz_OeVnciiqATz@apocalypse/
[2] - https://lore.kernel.org/all/CAL_JsqJUzB71QdMcxJtNZ7raoPcK+SfTh7EVzGmk=syo8xLKQw@mail.gmail.com/
[3] - https://lore.kernel.org/all/CAL_JsqJUzB71QdMcxJtNZ7raoPcK+SfTh7EVzGmk=syo8xLKQw@mail.gmail.com/

Andrea della Porta (4):
  dt-bindings: misc: pci1de4,1: add required reg property for endpoint
  misc: rp1: drop overlay support
  arm64: dts: broadcom: bcm2712: fix RP1 endpoint PCI topology
  arm64: dts: broadcom: rp1: drop RP1 overlay

 .../devicetree/bindings/misc/pci1de4,1.yaml   |  8 +++-
 arch/arm64/boot/dts/broadcom/Makefile         |  4 +-
 ...-ovl-rp1.dts => bcm2712-rpi-5-b-base.dtsi} |  0
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     | 39 ++++++++++++-------
 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi   | 14 -------
 arch/arm64/boot/dts/broadcom/rp1.dtso         | 11 ------
 drivers/misc/rp1/Kconfig                      |  6 +--
 drivers/misc/rp1/Makefile                     |  3 +-
 drivers/misc/rp1/rp1-pci.dtso                 | 25 ------------
 drivers/misc/rp1/rp1_pci.c                    | 37 ++----------------
 drivers/pci/quirks.c                          |  1 -
 11 files changed, 40 insertions(+), 108 deletions(-)
 rename arch/arm64/boot/dts/broadcom/{bcm2712-rpi-5-b-ovl-rp1.dts => bcm2712-rpi-5-b-base.dtsi} (100%)
 delete mode 100644 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
 delete mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso
 delete mode 100644 drivers/misc/rp1/rp1-pci.dtso

-- 
2.35.3


