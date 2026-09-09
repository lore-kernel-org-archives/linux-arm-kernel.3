Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEA9C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 04:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RtXPc9l4G9cuCIzezvpEqoPo81//PhfiTYKMse4zr28=; b=izXUtaAmfew8gtOfceiAqYhpkI
	BB3wOa2mMoTCNvX5nakSBBhVEQNS0O8s5ryRUMvPKLGcsOOhcSBk5SKjBse40WrB+4nfr46J+YWBH
	U18zjA6y4Gi9/S8K1g1LI0V5jNk0nwIzzW+/Uv9+C8JicjemJCOPeu90wmSCfqiQYvyYtBxl6x7G4
	yz6Xo05XmWtrE0Ec1W7lBnYCZ0vu2Xz9M943aQ0arLjmalitY+rtMMqkTUxk6q0diZJs43LRWphrB
	+zcFQLeIhzY3EoIadf9KKdr4rv46bpYXfG9hGTbWc3c5ERE3EIGH9FkqH4Q4YOK81DVKCATx32T6T
	8dC5ksag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4AL1-0000000AlxM-48M3;
	Wed, 09 Sep 2026 04:55:12 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4AKx-0000000Alwv-1dlP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 04:55:11 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2db59f54ccfso17652285ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 21:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788929706; x=1789534506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RtXPc9l4G9cuCIzezvpEqoPo81//PhfiTYKMse4zr28=;
        b=MpS8Y7KUfxi0FI9VjA0sOFQhLi+7UhIIMF7SvrfIzKzRiWLoGkhb4ENfH20N2aG6Ar
         tuQNmzbs0pzi/uzaqqnb7h4RuPVcuGM7UptWWa24fOzzi5aaRsZr0czUxLPNZKCd4Lii
         V6wztcaP8/1Wd4JK3VJoLUPaQxWK/H7wpGS5Uy+U6h2lpPt9HNsG11LH0ZHTMHOJP6PN
         Lx2q66Jxg0RvW5XG8AKVfHa0KxV3kSG2PPprjC2mXfPZpq2x09FegbWWIpPFyx6MHFpT
         bWnc1pTe1SoRDICRX2KFm/A4jewdhwlibnuiVeEiPTuvEioF2crFugJqzV3x4kErX+P3
         3H1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788929706; x=1789534506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RtXPc9l4G9cuCIzezvpEqoPo81//PhfiTYKMse4zr28=;
        b=WiT1YB+EGNpe+FM0n43iQY3e5mhx/e1fC2GgQCN5qiV9/QmxOXGDPWrV/dD0Ks3LOs
         OFRuRMtPCucsQhy8zFiRZ8P4s2aWW+4MFMF+aTH1p+wxk45iQq2m8XX44eYQz7IlhuEk
         dSE2Ecr4g3GctcpvzXBP1tCgHX8Jolkh450b5t7tS+idxBt2OhXByJwRsdKntVRG8Fy1
         7SXX2m+WOFxvVKmAdv9Hm+IK4X0qUmw3pAfjtrVd/ords/zii024lt1oFC4vJ+4s0/66
         5RHZB/7UtdPEgxnIr5/gj2PY6mZTrQ194Y2p7Zn364MOghmAXJp2vegiWr1SIf0WeKAd
         N2wA==
X-Forwarded-Encrypted: i=1; AKwUvBylmzdy6k9w5NYVpZNDrW9AGUFzki18+9yfLNNJTnIIaH9bJ8awOuZcE0Q6J0MEWRyCn/TuMMnXcRekEXmUIb/7@lists.infradead.org
X-Gm-Message-State: AFuF++lV7sqhC2t2HDwfVYQ5mh6wD5mvgOsyr7gssW1/wv3qPnZZxot+
	uF/b0B7V168CIsdjAHK2Da2UHtwSj9L88EP04HSZXZKv/cwgDQFsWbPW
X-Gm-Gg: AYBFou0WXVmPyBEoOOzqKIBg9lSsAG7ehd3DMWzrxszYhSWmFV8DPpU/bNg5cFcH5dy
	kW6hQK7Oy/C+oy/CAc9iqVG2/29Cwe6mE2s3sUWu2aPFaNdmuMbnFiEmS+VBA2/uLKxAJ8Wsorg
	vE4PXWMYqxAyivyBvmh3S06oPgiyvmyOHBEAG3w9xSrqnEuIrz+hIVCIsXV9a/IBcWcRi97AxXZ
	EOBUv40NzLa4kIopmrvBflvmukWBqkH93jQgmnwFM78xjKCp/P4jqY1+JJLGLG8cSohOLc2LPdt
	drxVQLotJO2lAvZ8ik3bsUtNzggQcAs5FT1XdeG85MAECUmWp2+kVjOHC0dbYyqmj5ctvR4zDBs
	ebMLlDe7kdXbyoPRtdh9Zc3BmwQre6QI17248QgWSbOhEQHoUfG2hBaDGHUJr/rV/y0sRFGNc61
	40x9/UcJ75LT+RBZqFI4BCHfVTlPZeeFWMeWyS7A46OIxne/t1WPdWUJlfYWxEfaqz7cIsNupaV
	TdcB15P3c60YfgwREqjnALzb4VhxhRkjSaqNc5f/VD0pselm2M5/D8vwP/YnHZyVjansbfWUbVK
	4oDMkwb7w3lLdkI=
X-Received: by 2002:a17:902:f68b:b0:2cc:864b:539 with SMTP id d9443c01a7336-2db12495a80mr474088295ad.6.1788929706292;
        Tue, 08 Sep 2026 21:55:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1499e876sm66688505ad.56.2026.09.08.21.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 21:55:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v6 0/3] net: xilinx: axienet: Fix IRQ error handling
Date: Wed,  9 Sep 2026 11:54:47 +0700
Message-ID: <20260909045450.16176-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_215509_943256_BC472D54 
X-CRM114-Status: GOOD (  10.61  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series fixes IRQ error handling in the Xilinx AXI Ethernet driver

Handle errors from optional IRQ lookup and preserve the original error
codes instead of returning -ENOMEM.

The changes were found by manual code inspection and compile-tested
only.

Link v1 : 
https://lore.kernel.org/all/20260811034715.6034-1-phucduc.bui@gmail.com/
Link v2 : 
https://lore.kernel.org/all/20260813042012.17631-1-phucduc.bui@gmail.com/
Link v3 :
https://lore.kernel.org/all/20260817105241.63345-1-phucduc.bui@gmail.com/
Link v4 :
https://lore.kernel.org/all/20260821123249.41527-1-phucduc.bui@gmail.com/
Link v5 :
https://lore.kernel.org/all/20260903073252.339250-1-phucduc.bui@gmail.com/

Changes in v2 : 
 - Split one patch from v1 into two patches.
Changes in v3 :
 - Move the lp->eth_irq check below instead of handling it immediately 
   after platform_get_irq_optional()
 - Add error handling for platform_get_irq()
Changes in v4 : 
 - Add Reviewed-by tags
 - Add error handling for irq_of_parse_and_map()
Changes in v5 : 
 - Change the error code returned when irq_of_parse_and_map() fails 
   from -ENOMEM to -EINVAL.
Changes in v6 : 
 - Add Simon's Reviewed-by: tag.
 - Drop the Fixes: tag as this patch is intended for net-next.

Best regards,
Phuc


bui duc phuc (3):
  net: xilinx: axienet: Propagate errors from optional IRQ lookup
  net: xilinx: axienet: Handle optional IRQ return value correctly
  net: xilinx: axienet: Fix IRQ error handling

 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

-- 
2.43.0


