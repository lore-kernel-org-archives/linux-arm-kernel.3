Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474FCC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 07:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNdUV80pt9dTQBN0xsYhQhCQV2pGwrGMIFKsn4D5UWo=; b=aGrCdC3UWZi7SUyAq/3rvzi7Ph
	8WJmDPUrGHl64EibemUW3s/LbHdfW6MVOAtmi1DPHXMXCrWuQkhuroqAaIpJFItDt9//nf6jaIBiZ
	8o7qFogIdALKI9GeThkYWJt6x9ym0IpxXXZ0380wBrt8uaIh3FO7qfopb/MWHjtBoQFxPALZM1B7v
	ifzn7lJaMl9HWndXDJ+1OgrSjoQm7BiX6rBGCf6cZ/HNhxcftbc3n/SohYC7PKKqTcoxF3ySLHWzg
	xhhOyslOgOTL61drq/MEIMgBBZY8WC96/FtGzBC0N7lFWqReVqv7X79nFeFMOV8cnELVPdNX9HQaI
	cpl2i78g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvYr-0000000HZxy-0rK3;
	Thu, 08 May 2025 07:20:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvOv-0000000HYDU-2t7k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 07:10:40 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso6815235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 00:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746688236; x=1747293036; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNdUV80pt9dTQBN0xsYhQhCQV2pGwrGMIFKsn4D5UWo=;
        b=zQtJyB3r40Ca1bh5PAujc0OVS3soaUdKTOjSlRwmJ8xpLQOyv09pmhcezUg+787MXS
         TXd2toHPVz8KTpDsJapWrzq9IdHnYLUxlpxOb/SE4skK11wdKj/NxPeFkhQNsVN04bn2
         wS+FgL00FF4GgdN7+RVoHBtL9lNruigEgXbqTGlsITBf+0cNuZfgo5WEtABg4OqqVpE5
         kVVc0G56ehIIschx5xasYp7BpLwafPY0eVUtTdBfvLeVpH5zKCHJUPj2H9b5YgY3jhPB
         RNnCK7LLCSOEm1VPQT1g4urk9PTb3RvQac54JzVb+S6mJH3sJ7JapgzdGz4pU4Snl8v6
         xkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688236; x=1747293036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNdUV80pt9dTQBN0xsYhQhCQV2pGwrGMIFKsn4D5UWo=;
        b=I4ghoM9UfPDVhJaXM4ZpSQLRHXucKRLi7tB4HE2fViAW3FGWg9EL2gXDs07I9KL/e2
         Ad9Z1u86omv6q3mFBgCeOnNOEs7K6qWItUIvXkv4BMGR0Rr0yD7sCDRr5IU37YuH0z6f
         EdZWnYn0ET5+IQ45ZbYokey5QGzkVYioMcQ+gqMxoDR4gtHxTyt2O3TNfMvcn8eRspD7
         K2z8tzCJnc6/zXwEjD/GqSjcdxxpvv1BUmdy7SNbHmGMsFfKDAibDN9T9MElPfRtTNEA
         kagSq5EUlvftYeGuI7nNlpAR4SEzCeD5sddfmLpEt8ZTtPvaBafpSeMmk6gXa1lvQN8s
         eudQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQsejo1bshFVIMlL//ui43Pul5xmrgw96c/QrNzDFboB9BK0tBmDH2Q711ThY116RMt7U0ajjpMRYaC+h4PawJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwwAtvZlpjNWyOyxRjnKvmHEXfQJT1rcy9HJlGhjaqgANOGEz+x
	7t0jkykkNV1HvGgWUaBf/uF5AWVXtHtDxz+ANXS7mpTqZ1fdgXaGYaird6/D2g==
X-Gm-Gg: ASbGncsOSexlMrKLyQV6H+K0tZl1a/cUtSEbwf1RdW8neK4h8uWEzo89CUAHqnQmiYP
	psyjcqBHrXAjGx5+Nh7SqmXaq7+pskU0g2rA6VEN4ChwBMmWkg1KpBhwix3J6mOi3IfcBdrW9eZ
	nFleadskPDs7XtnRBjon3naQhUMKmbsGmekcqhiD/OppgIkUGJc0BuNSLHBVqLpM7WX7PhfdWti
	KsMM5NY0effa+TYH0kzGCTOCLAS3Lde5TPqhX0piueb03yBr7tBtqbL+1JEPi/5kitZbMX73ild
	mc2fLHWxCTeda/D/KkkPTJviC3SRqYqUjM4+2D9GivTeVknLpTgT2Xe1JnXChNLCu3ZyeedcYyc
	t2DZfDrlBk/EAmmr638Cc9nCZokI=
X-Google-Smtp-Source: AGHT+IGM/ocJYvn2QOjf3fD6bkcOlBGcdKqEyGGwPgr1OkqArjdUzcdfSklA7LLxbWYmBJNriXe76Q==
X-Received: by 2002:a05:600c:37cd:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-442d034bcbamr21959325e9.31.1746688236376;
        Thu, 08 May 2025 00:10:36 -0700 (PDT)
Received: from [127.0.1.1] (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b178absm19500236f8f.97.2025.05.08.00.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:10:35 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 08 May 2025 12:40:30 +0530
Subject: [PATCH v4 1/5] PCI/ERR: Remove misleading TODO regarding kernel
 panic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
In-Reply-To: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=789;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Aq+BoDTRwjfmiHKRLtODTEbwNFS8yDdFMEIJ4A/Pkz4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoHFjp3+Y0C7nYToqJfWiLXSkKAM5YKgVxrQcgv
 dew07ahS2+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaBxY6QAKCRBVnxHm/pHO
 9bheB/9ACtGdPZ3LmfihI48+MK1ALP0+Bx6+UetxxXKaahBYzIQ5gDCkxVfgOgnxWWQewlNuhzp
 LkZw3nCIYvdYAZ7/RT6FkDdBk4lRXh8t4QhrVlil8KmoN8umYdxyDDZutpu8RDRf9b5H84xabGV
 tt9QfWQz9sKtIRWtac2DBCJCM4vwuvtSDxEUlUvJkdec5PwCN8ffMmJBN3NQ+vSvJtmkY8CKX8o
 ZT1VVrEU3tuPcd3IaetbkOs7WBG2+W8B9TJkzU8p+4MnsQUmp41iy5Y6yO6mf3fDQ643DyRvmm+
 9X9+lTcKXgUsmH6hLBn6yhdJdN2ABj8XC+7vLejHvCUqYl4/
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_001037_738160_0973DC29 
X-CRM114-Status: GOOD (  10.14  )
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

A PCI device is just another peripheral in a system. So failure to
recover it, must not result in a kernel panic. So remove the TODO which
is quite misleading.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/pcie/err.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 31090770fffcc94e15ba6e89f649c6f84bfdf0d5..de6381c690f5c21f00021cdc7bde8d93a5c7db52 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -271,7 +271,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 
 	pci_uevent_ers(bridge, PCI_ERS_RESULT_DISCONNECT);
 
-	/* TODO: Should kernel panic here? */
 	pci_info(bridge, "device recovery failed\n");
 
 	return status;

-- 
2.43.0


