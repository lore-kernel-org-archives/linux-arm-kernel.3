Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDF8D4335A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 12:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=youLRMmo0sKknJq3kY6wxMpo14aMmgxOgYUVVaBBx1Q=; b=oi+m2dCw3eHwbr
	zPq9dzuq1grWu3uG/zTOSd40odX8zf4CdnIOEO1s2/xR5zomBZD+wTOQ+tOb0qvWW/2aY2c58Yo5E
	ncGAWlJVOvNMwDw/PXam6yO8fnaEJ/8A67bsS34TH3iW4MlDP1F5xrIiMOuy2kFrh69KosGBa2PK+
	fGbyKLVQCAOhVx97vgCYRG9g5saXBJdI1gAINygbIpqqk/8al1ED2zQmFlikYt+Y8G34C9wpkfBDh
	qV0P7SEW6SAej+yawE9Ai+BQa5/3i2Wn6h+Mc60tcmCg3iGzd0ORoQTY3zGu37SoPEZsPqeC/W6i9
	DQrHDq7A7V1ySCy48//A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91rx-00000006yNJ-0DM1;
	Thu, 07 Nov 2024 12:44:13 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t91q9-00000006xvY-3qCd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 12:42:23 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20c803787abso7972735ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 04:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730983341; x=1731588141; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=youLRMmo0sKknJq3kY6wxMpo14aMmgxOgYUVVaBBx1Q=;
        b=VVqkNOkW/S8t/TZvJcRYjNfOObol6DmyD8votGkQ7nii1qMKWy9ivwUNFwMPt6r4k9
         8d5Ka3RbDWKgZtqnJ+bVM9S5o/6t4dPowO+/2vOp2PPQ9FtsIX78VobhhU4uEwqM2uFz
         RGrRMJSUpXv9P6QaOFP2p0vA/oSGTt58Yne5//o0WACUiC8z729LQVIEiq5mHCmglNBs
         3VVRzVYxkpFPBAoEi0giIrLOEF12W7yegvnDpHf7hdxUe5DkmcHApexEGz15KNnrwbFv
         Ydh9xWBjxGg1i40Zrcg3m+hD46J6jYLiCxlRVX24K8plANzVIj+8InL8pjD/BWx45115
         BmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730983341; x=1731588141;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=youLRMmo0sKknJq3kY6wxMpo14aMmgxOgYUVVaBBx1Q=;
        b=K/EOxgNMKcLrCDRS/dQJi+QOE3bJtvOxGqFWbLcbVmYpGGjffOLroNqJgnbVAP6ouX
         qLAECe3kzlQctul6m2V0lNYJ05mBQotb1ACz7Jl+4CesYo/fpBL3xOHjW9ropWGVyF4H
         KWziu1RqAmedY8/xix0mjx8HZafQ8HOU00X9joHozqCci0yuKGEcKheo6x3WTZD6B+W4
         3DmKm03Bk/7BacplBtPChhoswNGEveNsqdLgIqqmGdHKtBO/410LcL0OcXcN22XNeFFi
         WHrul0pwpaKiy5+dFRzK1Vqx/To879uubEFg9JmzOmfdtfo+2tY4jjNynWCjd7KJmSLE
         JA2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/IrzyeNlVMteaYy86feAWAOC7U9cxkDzZCaNL7ILIDnH5WKDkb0K6DRs5O18W2DdU7CEvKlwCxr/7ys39Rhy9@lists.infradead.org
X-Gm-Message-State: AOJu0Yys7JzJIr8Q0yv5rl5njMdG6sQuW0LZZimLMAa3RnLY9pAhMiE2
	/RdXv9r/2g5qD2R/h0tSCfktR071Aa+mp1iVTT/9jXuCrLlugyxK
X-Google-Smtp-Source: AGHT+IGEXo60WK+bnzWKZpp/tb3i21nIWbMBqygL8tAiAdUOQebmGHeK1uuGJEibdV7evN/corYGzw==
X-Received: by 2002:a17:902:d48b:b0:20c:da7c:6e8c with SMTP id d9443c01a7336-21175a93c02mr52725505ad.3.1730983340762;
        Thu, 07 Nov 2024 04:42:20 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e412d8sm11101975ad.113.2024.11.07.04.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 04:42:20 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v2 0/2] ARM: dts: aspeed: catalina: update CPLD IO expander
 pin definitions
Date: Thu, 07 Nov 2024 20:39:56 +0800
Message-Id: <20241107-catalina-cpld-ioexp-update-v2-0-d7742eabc0e6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABy1LGcC/43NTQ6DIBCG4auYWXcaQGJ/Vt6jcYEw6iQqBKyxM
 d691BN0+XyL99shUWRK8Cx2iLRyYj9nqEsBdjBzT8guG5RQWkpRoTWLGXk2aMPokD1tAd/BmYW
 QNDktHkZ15CAHQqSOtzP+arIHTouPn/Nrlb/1r+wqUWCpy1trO9tW4l73k+Hxav0EzXEcXxrhO
 nXEAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Potin Lai <potin.lai@quantatw.com>, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730983338; l=783;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=fDEBLfyJb9nAn3ipO12nV6wnAto2tMxREdWJ9q5mc7U=;
 b=EKVMgmy3zl5agoZHAZ4L/s+CG8X+hFuX+tTz28Z0g2vxOKOPzhCqGMqrJw48x6vluGrArZFlA
 FR3h5HtOXxxBC6dMyMqO51uFbZ63ua2/BTAb8HexQTzfXHtdyEkt81E
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_044222_083390_C8349C8F 
X-CRM114-Status: UNSURE (   8.69  )
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

This patch series updates the CPLD IO expander pin definitions of PDB
board and HDD board.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Changes in v2:
- add more description in commit message
- Link to v1: https://lore.kernel.org/r/20241106-catalina-cpld-ioexp-update-v1-0-3437bcfcb608@gmail.com

---
Potin Lai (2):
      ARM: dts: aspeed: catalina: update pdb board cpld ioexp linename
      ARM: dts: aspeed: catalina: add hdd board cpld ioexp

 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 150 ++++++++++++---------
 1 file changed, 87 insertions(+), 63 deletions(-)
---
base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
change-id: 20241106-catalina-cpld-ioexp-update-e4ed409a2fed

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>


