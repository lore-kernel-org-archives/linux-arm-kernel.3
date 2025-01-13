Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5819CE7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 11:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d50+4kQ7WdAm5ia8p2HevnBpfNxkxsfSO0lYdUIg1b0=; b=JueqdRVTHssNyVBj/cwXF3uM1u
	uhjfEOOwMMWUpndYCG6M+MqzOYD4NAYo2rRLQFqRyh658TWCfS26CS+JDsEahjbywEWdcde6sw9Zs
	bRt/3QzDpJgLNunPN3t3aKOVya/X3XwXkV6mAKm8zw6c8PTY15XSzSHUgRzDarornQdUWmJ2T5lxX
	1c1Uxj/lAUJc2X2WfpT7dqEM8G/MqSKLOdspWe+5KJJylOHmqlK8kiNeKwhFepOqcEbrb90PTz7/1
	WSSgnO/oYnW71WulsFFjq263Jy4W+KQWemXaA5IVAzfz0GtXMDR+dKBm0bc4+dEEAcAOzfmdj/+YL
	jdDlzr2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIBy-00000004qAX-0FH2;
	Mon, 13 Jan 2025 11:01:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIAi-00000004pzU-3GIi;
	Mon, 13 Jan 2025 10:59:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 171495C49F8;
	Mon, 13 Jan 2025 10:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E513FC4CED6;
	Mon, 13 Jan 2025 10:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736765991;
	bh=QIWLDCAmcI1C+xvUDFC7xp8Yn/Gi3b0khk0TnqElATQ=;
	h=From:Date:Subject:To:Cc:From;
	b=jjoGlL0+Uy+eDbOExpu6Pn9TRlQ5ZGhlp1GN9Q3LgRjHfA9SdeElCX+nlXjGZE4Zb
	 vRKGAsp4zVpJCJ5ZI5oleD2VC7fNUL2zcEQnaUpJZdMlEIFPmSjd5vz4VR11LRDc0o
	 AMWvRW3/c64M/UbhWcOV1wBJN52e1BrG5QojGDmUTe6cy5Dnlo13w/0AAVGiwIJbZj
	 ICU5FtJupJeEQOWIhmBWtvlOxjZ4hZWIvbYQEJ00IIyRu8HVQpFK4yvWjj8Lu+Ie40
	 SVoc4wLHhXmuUhJXNE6XqNBfFEltijb8+maPBJHvZyDDUS3pIC6NkftT/aNuvqUxye
	 gQdU/bkNaZchw==
From: Niklas Cassel <cassel@kernel.org>
Date: Mon, 13 Jan 2025 11:59:34 +0100
Subject: [PATCH] PCI: dw-rockchip: Skip waiting for link up
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-rockchip-no-wait-v1-1-25417f37b92f@kernel.org>
X-B4-Tracking: v=1; b=H4sIABXyhGcC/x3MTQqAIBBA4avErBvwpzZdJVqYjTkEKhoVSHdPW
 n6L9yoUykwFpq5CposLx9Ag+w6sN2En5K0ZlFCjkFJjjvawnhOGiLfhEwehnVvtoLTU0LKUyfH
 zL+flfT8OWRQhYgAAAA==
X-Change-ID: 20250113-rockchip-no-wait-403ffbc42313
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Anand Moon <linux.amoon@gmail.com>, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Niklas Cassel <cassel@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1285; i=cassel@kernel.org;
 h=from:subject:message-id; bh=QIWLDCAmcI1C+xvUDFC7xp8Yn/Gi3b0khk0TnqElATQ=;
 b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGNJbPqmYqOpeqY05+MXbvOGK0ZtZrkU2Hi0rufiTuJ6au
 4rv2W3XUcrCIMbFICumyOL7w2V/cbf7lOOKd2xg5rAygQxh4OIUgImwKTL8z9E/tSODJaq3VWFq
 W5d83n+fe5OWlbFfOSd6sDBUQaZYg5FhatCf175aTldnTm572Pi2sv/x5JBbOyeoa9WsSNZYvtq
 UFwA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp;
 fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_025952_861658_72F3E7A9 
X-CRM114-Status: UNSURE (   8.89  )
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

The Root Complex specific device tree binding for pcie-dw-rockchip has the
'sys' interrupt marked as required.

The driver requests the 'sys' IRQ unconditionally, and errors out if not
provided.

Thus, we can unconditionally set use_linkup_irq before calling
dw_pcie_host_init().

This will skip the wait for link up (since the bus will be enumerated once
the link up IRQ is triggered), which reduces the bootup time.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 1170e1107508bd793b610949b0afe98516c177a4..62034affb95fbb965aad3cebc613a83e31c90aee 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -435,6 +435,7 @@ static int rockchip_pcie_configure_rc(struct rockchip_pcie *rockchip)
 
 	pp = &rockchip->pci.pp;
 	pp->ops = &rockchip_pcie_host_ops;
+	pp->use_linkup_irq = true;
 
 	return dw_pcie_host_init(pp);
 }

---
base-commit: 2adda4102931b152f35d054055497631ed97fe73
change-id: 20250113-rockchip-no-wait-403ffbc42313

Best regards,
-- 
Niklas Cassel <cassel@kernel.org>


