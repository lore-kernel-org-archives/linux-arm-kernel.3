Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E04C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 07:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w00OFq+nWohxSjTOLQvg8WLpoA5EQgRX6xuwn6BkYyQ=; b=3nwsig8yQFGliH
	ljHr7dFQwxwVWxL+9bKUmrjgRAUYTVeUr/h+F6wCL1loYHo0jD6cTU0e8fauojDE7GAUywWeJbgNm
	ffaFD3rs+kAN+LSerdtryA5ms9yj+1Ocmia2KjW6/SswUKtRVRIdZgvXH8xhL5OsJ7fjiasE6wdWn
	xL+AIZ6ZXHIvkTXVQiYcKXSqajgLqrDDJPOdfELb2vTZQlrZDTRP8e/Yx0B4E3TIYmKGudBxRHZig
	sXVGrl5stgYVQNcMc/dB78RbZZjTEqUQV7kp15KrZ3GIcSUK6N66rsmOtnkGHvna/zR0aRGJd5vpy
	ne+Kv02KcmjVtxuASfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvWv-0000000HZWf-1sAP;
	Thu, 08 May 2025 07:18:53 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvOv-0000000HYDO-0vho
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 07:10:38 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-441ab63a415so6540725e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 00:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746688235; x=1747293035; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w00OFq+nWohxSjTOLQvg8WLpoA5EQgRX6xuwn6BkYyQ=;
        b=cbS+cbsK1weKtvUYid4GFiBHCZX9nxVRs4ttYG3eeLpFpzOAG8OiPUEZcVml7paH8I
         ATxyxH2BmWMF0T8Mnv+R/nZLIrfXFnmVP+xEfxYT2f35D1N4FXDmyxrEVz/nv0G9yXYv
         XhEYKQA+zwt/mBNPn+Qo0DxbhFJL+wqlHOMqHWIYoe6Vrh8XRxqowN1FLqzS2wvNZ+sy
         OuXCyXhB0GMM5lFD+VQHZdpfTwwPbV8RxZo+N9kotnEsT+sg3gv/0RYNg13DncYHroEz
         RHXZCxq46hhutCm25k/92XriM3fbsc+F+Y8ljN9CLK7KvSq3FRxbUfcQ8VoL/0x+Y+yW
         8cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688235; x=1747293035;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w00OFq+nWohxSjTOLQvg8WLpoA5EQgRX6xuwn6BkYyQ=;
        b=HC7ZGdaYXx5QYsEzpD9MI1j+ZQ47c4FxuiDqbITQuDH6DDJjn8jUYA2yBOA+ZKRgl9
         PKIDVVdm5cXhM14wyp/3O9GCEGYbNnsW5GNam7G19ehU8AoScgIXT82buJbOGwQ0pocP
         oaLwaz7v+F+zBfHE47l3PdYioEWc1ARXEn6Q/rRcni9gRCm78OSkESl1DqIwso/GO+hA
         NgciD153tUZI1r7ckTaAger3t9HXtxCpWt4fHDY9GZgn2bj6ZixaiIX8JOwEti6tmuse
         kbbMGdZer7ggfiyI/HPfhUyVFdX3OkKyKAOxtxGAnPh7kLSRVRogc6MzF/Qv8GDgFRKB
         dEsA==
X-Forwarded-Encrypted: i=1; AJvYcCWvwEwrxGLcyLgAH2MF4T9zXHpR7Be2CPlfrZ+E1z/MUOskxuzDdl/nUMg6oRwbB1rjtTynT37+X4lrkUZE7nZX@lists.infradead.org
X-Gm-Message-State: AOJu0YydX39gpejXIdH1TOawXfKFQwPPbKcfzlZZfuYd/GHZSQ64aAKs
	VCxiqZX2RHoM96NEJgqQRO5rijHugzbXaQ/V0UNIUWC74tvhKOdqQ95Bez0p4w==
X-Gm-Gg: ASbGncs6OEoDyJj5LLrJVCG2ah1LJz2958VTlEy/pkqrdqnIn1BOYLEpxWPkntmzCv/
	I9KPn2rRmSfTwNCSXL7MBBnqzg3l/T6ciTsRXgX+94nI8bbnZ/PCSMfmFeyNrfSWYr5nVhEx5tQ
	1vkK6h1QmGFRxA9a8q8GlVkGzYEqOh+qFgYBbkHd3TBilE/8AbVU6K4HRPSkr9lxNCOJx6ViWBI
	ronZhIe40gx83J6NlzWi/gwa8WFwb/rhepd/n8aK47SZuUyiu9GailSa6ByKZGCZDa1kWf/bcln
	mXhJKi1l985ZznUQYRCQMvhKkWwg2uErWFhPC4Gg6GYmb5bYL8qJ+wQuk9pcdUgHyZzNiJrNbji
	nRDgQ90hQGstIeG6w3jLv6uTqUZw=
X-Google-Smtp-Source: AGHT+IGyLqEV7FV8nWWqYY5qCj+3cSwPattjz/CT/mpsRNB9xus7yRn9kwCjspweE93CFzg64EvzTw==
X-Received: by 2002:a05:600c:8205:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-441d44c7c7bmr63780445e9.17.1746688235432;
        Thu, 08 May 2025 00:10:35 -0700 (PDT)
Received: from [127.0.1.1] (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b178absm19500236f8f.97.2025.05.08.00.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:10:34 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 0/5] PCI: Add support for resetting the slots in a
 platform specific way
Date: Thu, 08 May 2025 12:40:29 +0530
Message-Id: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOZYHGgC/3XNSw6DIBCA4asY1qVh8AF01Xs0XSAdlMSIAUPaG
 O9edGVjuvwnM98sJGJwGMmtWEjA5KLzY47qUhDT67FD6l65CWe8ZhWr6GQc0oARZxoHP1NRstZ
 qATpvkHw1BbTuvYuPZ+7exdmHz/4gwTb9byWgjCqpaq5Atlax++BGHfzVh45sWOIHAJozwDOAF
 kXTciENnIHyCIgzUGagVhqYBDCq4T/Auq5fm/p35DEBAAA=
X-Change-ID: 20250404-pcie-reset-slot-730bfa71a202
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
 Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4736;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=LPKZpjoorPcJ0i3sy5Fe9gxmCowL7rHoa3+8Kx1k5I8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoHFjoZn2Vau5rBgSkqFonGWIjBD9vXqMQSpvxQ
 iz76V7WG0mJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaBxY6AAKCRBVnxHm/pHO
 9baVCACcMZ+oGHyyvjtszQkQwoCc4LQEhNyBVCLMAukrkzlHUKuJuUgMLxOaizVKaBzVqZ+ImAm
 KFJDCmiXyQNskAOrCdFyEWeHP2rLBoNzxWKTODzgJ8uppEcksqBFWh1rEl5psqx7nS58ivJfwBF
 0IR7EBandYxRPofAprBmAyD/3pvvYcpIxlTilooBHNn2VzXduU0KYkSDDK5b4wJXryWat2+Mt8n
 BCAblJUCeBFK49eRl8FOHziOW4nIj4aSgX4clBB2igJ2YPjOa8wv2Ubvw1u6kDAMRQ1cSqP3A4B
 ktlGEOIB0nYlE+VSnH51tHJvblCq9bTJqJpTyBKZObEDWDGZ
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_001037_272093_63B7F205 
X-CRM114-Status: GOOD (  21.47  )
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

Hi,

Currently, in the event of AER/DPC, PCI core will try to reset the slot and its
subordinate devices by invoking bridge control reset and FLR. But in some
cases like AER Fatal error, it might be necessary to reset the slots using the
PCI host bridge drivers in a platform specific way (as indicated by the TODO in
the pcie_do_recovery() function in drivers/pci/pcie/err.c). Otherwise, the PCI
link won't be recovered successfully.

So this series adds a new callback 'pci_host_bridge::reset_slot' for the host
bridge drivers to reset the slot when a fatal error happens.

Also, this series allows the host bridge drivers to handle PCI link down event
by resetting the slots and recovering the bus. This is accomplished by the
help of a new API 'pci_host_handle_link_down()'. Host bridge drivers are
expected to call this API (preferrably from a threaded IRQ handler) when a link
down event is detected. The API will reuse the pcie_do_recovery() function to
recover the link if AER support is enabled, otherwise it will directly call the
reset_slot() callback of the host bridge driver (if exists).

For reference, I've modified the pcie-qcom driver to call
pci_host_handle_link_down() after receiving LINK_DOWN global_irq event and
populated the 'pci_host_bridge::reset_slot()' callback to reset the controller
(there by slots). Since the Qcom PCIe controllers support only a single root
port (slot) per controller instance, reset_slot() callback is going to be
invoked only once. For multi root port controllers, this callback is supposed to
identify the slots using the supplied 'pci_dev' pointer and reset them.

NOTE
====

This series is a reworked version of the earlier series [1] that I submitted for
handling PCI link down event. In this series, I've made use of the AER helpers
to recover the link as it allows notifying the device drivers and also
allows saving/restoring the config space.

Testing
=======

This series is tested on Qcom RB5 and SA8775p Ride boards by triggering the link
down event manually by writing to LTSSM register. For the error recovery to
succeed (if AER is enabled), all the drivers in the bridge hierarchy should have
the 'err_handlers' populated. Otherwise, the link recovery will fail.

[1] https://lore.kernel.org/linux-pci/20250221172309.120009-1-manivannan.sadhasivam@linaro.org

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Changes in v4:
- Handled link down first in the irq handler
- Updated ICC & OPP bandwidth after link up in reset_slot() callback
- Link to v3: https://lore.kernel.org/r/20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org

Changes in v3:
- Made the pci-host-common driver as a common library for host controller
  drivers
- Moved the reset slot code to pci-host-common library
- Link to v2: https://lore.kernel.org/r/20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org

Changes in v2:
- Moved calling reset_slot() callback from pcie_do_recovery() to pcibios_reset_secondary_bus()
- Link to v1: https://lore.kernel.org/r/20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org

---
Manivannan Sadhasivam (5):
      PCI/ERR: Remove misleading TODO regarding kernel panic
      PCI/ERR: Add support for resetting the slots in a platform specific way
      PCI: host-common: Make the driver as a common library for host controller drivers
      PCI: host-common: Add link down handling for host bridges
      PCI: qcom: Add support for resetting the slot due to link down event

 drivers/pci/controller/Kconfig                    |   8 +-
 drivers/pci/controller/dwc/Kconfig                |   1 +
 drivers/pci/controller/dwc/pcie-hisi.c            |   1 +
 drivers/pci/controller/dwc/pcie-qcom.c            | 112 ++++++++++++++++++++--
 drivers/pci/controller/pci-host-common.c          |  64 ++++++++++++-
 drivers/pci/controller/pci-host-common.h          |  17 ++++
 drivers/pci/controller/pci-host-generic.c         |   2 +
 drivers/pci/controller/pci-thunder-ecam.c         |   2 +
 drivers/pci/controller/pci-thunder-pem.c          |   1 +
 drivers/pci/controller/pcie-apple.c               |   2 +
 drivers/pci/controller/plda/pcie-microchip-host.c |   1 +
 drivers/pci/pci.c                                 |  13 +++
 drivers/pci/pcie/err.c                            |   7 +-
 include/linux/pci-ecam.h                          |   6 --
 include/linux/pci.h                               |   1 +
 15 files changed, 212 insertions(+), 26 deletions(-)
---
base-commit: 08733088b566b58283f0f12fb73f5db6a9a9de30
change-id: 20250404-pcie-reset-slot-730bfa71a202

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


