Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15F3CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiyfD9o81mhFVe2IXX22fSEtB3j8hw+9RtRzlWaHF9U=; b=pzLy9rYKY51SfV67n6Mfy4OiSM
	d9qlThHopZEmP60tm+VvkWRuOCTjvpnV1bVm7V6Fqlvex/9o8aevi362XnWOcK6T0NHorMseZCJyT
	hWCU6jDo9sHhORxp4/MRnVwFe2R9Ec6J7/IV/MFPMn7I0mvJZLoML3r8qucJ3K5TATFepjk+pFsxy
	JJzzS7aFlqetOxt67qhS1l8+mfJsS5A6Ii+OFreJNp9zm4edt4KHIGIswfQe76F/dxRFx9LUSCv85
	TXhXgvFjeXdbGwipGLbpZv3KHELH91w71Ms+QDPyXTduROHxdSSmkY0ABSTpiKtmH6Jg85tcbyaBC
	7I9tLb0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3gb-0000000GaoT-2NZ1;
	Mon, 17 Nov 2025 18:10:45 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3gZ-0000000GamU-18t3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 18:10:44 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-297e239baecso51057265ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403042; x=1764007842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiyfD9o81mhFVe2IXX22fSEtB3j8hw+9RtRzlWaHF9U=;
        b=J62k45Zv71nYGUjf5p5+RKBE4/ZVJKX93KbOlCrVCZHZZjEQN5V1eq+4avgakzF6be
         kboxvVNbqibrD714l9kb2GZhQW6+A81cBgBvrJO+hFO5QxY/N4daW7zIgJmEYE+zP5kq
         3BBqEVm/FGAyS/72o5csJk8zNkNiVqs5FjWiXK+Yzj8p9VcCvtWo0QxaNCROWZnmN+xT
         q17mG3ZU4ka2G4Zk9LYfyy3buFMPQYx1hQ+L4DhUF1kwbHcK/106+LnFIQV9Dn6MOeR9
         nqHGJiNJkdE0rio5fo/CKSJdMF5wyXtgkXnkab58KL/X2g5IsIzfVVwc4VTHWLYHBG4q
         4JDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403042; x=1764007842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HiyfD9o81mhFVe2IXX22fSEtB3j8hw+9RtRzlWaHF9U=;
        b=cpJzUUb0BsdzWm4rxXGW0EG6VaIlcnv4xyt5gZob3zRNWuupJVjL+rAhE7Px4l/M8K
         g11B7tLFbQ9sWuM1IOa+EyyJ48TharYafJ2VZX7DFrmlQGUlWlUFld8fmlawb4co0Aax
         Fug8DaeZRgdFmol6UfU8ofUS9xl+x7kc2LNBf+f99Q3T+oaedHbuEG1j/gHeQcpS4RHK
         BCCIOhOLwZLzBr3fiUsjelApQosvFmdqSeXw/n1v+PukSaayBm9DAVjPXsycwmhcRcyJ
         GpjlEslufq/t6quff2s7BZR4kI72hiclYyZa/LqZqJACGL8DhQusOJ9aXkzaXxxSuaj9
         vkDQ==
X-Forwarded-Encrypted: i=1; AJvYcCURmWrgliU237aYZ3Ndr9opbUV3eBvjYoZ9XFrMCcTmcsEOMXqYCC2CKg8rwbw7HfJqICtTZn87RDOywdjjE2sj@lists.infradead.org
X-Gm-Message-State: AOJu0YxEMYPDrkxbC8rCBIHP+FrFZk/3qOzHXxgw4iXYNBe8u2yEmPcG
	GXriQh4X8PpWt6LCcezu+txUkLAk3ZICV593RGID8bKwZsiXuojxUU6j
X-Gm-Gg: ASbGncs0vCMpjOsXoJo8cls1gSfIbkjG5nP6wZa8mjFRfey5B4O0kvvLzEngh5PMRLy
	CBz6I+StyWqJ8txkiN2bMb/OdiwmQNJi4IQGWLTxKgHbfNfE9guf8DBPf4hOcHZ9ZHi+B0ekUiU
	b08h9OSEim8hbT2WwA05o+2taCYTu1SIbbGsxFfn0yapVydl9dsVe1OoGHuOla7iIZyY9jvNA4H
	bz7hEfVZxw8US079O2U8BceGnZ4dPvu0c6dK1+fikTt1lUSEec2HTYhGIJi/mXx9jBXSS358ODC
	ynLcSFQkEBBiwZbpKKMRcRPQESW20EehyOCnANc8iE1IzB7q7fXeMzpj6GUTxU6Z4UOyMjIWHrG
	x5PJrVdonTzxPkuQJKH48XWhWYYywECCuIcg9SOt9Wp25Tk51NY5pstEb2rNalbEh0RQGMS3fjz
	aLbtwQIJOD
X-Google-Smtp-Source: AGHT+IEuH/QkCta7rSFSTx6mLuh1Na7bJwzHG+M7fE+y1+6A8oUVr+VmAtfVcXC0t4C1FaCf1X60/g==
X-Received: by 2002:a17:903:4b30:b0:25c:43f7:7e40 with SMTP id d9443c01a7336-299f5512becmr2969585ad.10.1763403042469;
        Mon, 17 Nov 2025 10:10:42 -0800 (PST)
Received: from rockpi-5b ([45.112.0.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245ecdsm147237955ad.32.2025.11.17.10.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:10:41 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-pci@vger.kernel.org (open list:PCIE DRIVER FOR ROCKCHIP),
	linux-rockchip@lists.infradead.org (open list:PCIE DRIVER FOR ROCKCHIP),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC v1 2/5] PCI: rockchip: Fix Device Control register offset for Max payload size
Date: Mon, 17 Nov 2025 23:40:10 +0530
Message-ID: <20251117181023.482138-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251117181023.482138-1-linux.amoon@gmail.com>
References: <20251117181023.482138-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_101043_304760_DFE18A63 
X-CRM114-Status: GOOD (  14.83  )
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

As per 17.6.6.1.29 PCI Express Device Capabilities Register
(PCIE_RC_CONFIG_DC) reside at offset 0xc8 within the Root Complex (RC)
configuration space, not at the offset of the PCI Express Capability
List (0xc0). Following changes corrects the register offset to use
PCIE_RC_CONFIG_DC (0xc8) to configure Max Payload Size.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 4 ++--
 drivers/pci/controller/pcie-rockchip.h      | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index f0de5b2590c4..d51780f4a254 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -382,10 +382,10 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCAP);
 	}
 
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCTL);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_DC + PCI_EXP_DEVCTL);
 	status &= ~PCI_EXP_DEVCTL_PAYLOAD;
 	status |= PCI_EXP_DEVCTL_PAYLOAD_256B;
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCTL);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_DC + PCI_EXP_DEVCTL);
 
 	return 0;
 err_power_off_phy:
diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index 5d8a3ae38599..c0ec6c32ea16 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -157,6 +157,7 @@
 #define PCIE_EP_CONFIG_LCS		(PCIE_EP_CONFIG_BASE + 0xd0)
 #define PCIE_RC_CONFIG_RID_CCR		(PCIE_RC_CONFIG_BASE + 0x08)
 #define PCIE_RC_CONFIG_CR		(PCIE_RC_CONFIG_BASE + 0xc0)
+#define PCIE_RC_CONFIG_DC		(PCIE_RC_CONFIG_BASE + 0xc8)
 #define PCIE_RC_CONFIG_LC		(PCIE_RC_CONFIG_BASE + 0xd0)
 #define PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2 (PCIE_RC_CONFIG_BASE + 0x90c)
 #define PCIE_RC_CONFIG_THP_CAP		(PCIE_RC_CONFIG_BASE + 0x274)
-- 
2.50.1


