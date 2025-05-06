Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132FAC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i7yG9YQOdfvwmvsNm0/fYdECrCTyZGn7Chc0k6oLu8A=; b=iox2pARtzy8rng
	8uPoI2u6M5ATO6FYemu/ltDZih9PIw51ZUI0QpsE0u322EEdshHRm67WZZmsdxv3JFfE4ko+fVRCD
	Kjq4vd64rw0ju7q8NszrAM+K46U4ZmZX1I94qTCEjGuuMQGoCsF9y19mONCIf37/cwmnKozEBdGvu
	XHROAS5FiQSFZSJJD0zzFTMf0sC7n/4GyRTKIbrplS1TxjvCZEQMjjj6tBzhKCQ1X174aEf/qsM3G
	ZCyQoQmmpX44WW9KfS5jh8aVfBuLISppCax5wwz0PC0hG97q6kBwmR5kCOlE02Mg+3oP+CAU/2NBf
	K17KhTCvvtp9kus1mTCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKr3-0000000CctA-3k5H;
	Tue, 06 May 2025 16:09:13 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHgu-0000000Bxef-1Zvs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:46:33 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7399838db7fso5780299b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 05:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746535591; x=1747140391; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i7yG9YQOdfvwmvsNm0/fYdECrCTyZGn7Chc0k6oLu8A=;
        b=PGqwrlziuXZWKQluNsKc7LesWKRfwD57Lj75yWdrb1XDwQyr2Y/OQW2nZ9twKJNdVg
         Fs9iDRV1M1IV3pG0L18n4PCcoLq+v59EkagFRplNYWeZizqtV04NLRgeLQJGvDOjAvPB
         sXGC9VsC+vLbbl+rczXdWn1xELoTbeFm3+NTscN4o5dh8VmnBT1aoWCS/bvIQWtFC1EG
         lcIiyP6oWhuT3Jp6NbOHuQfPBugmfDpaeXjsTUb8tOwnOpYqGtWwHW0vxzwmqKvjLqUl
         Aklkq9FlZX10XZV2L54tFKElFXMK7NpH4FiaJQ2zoTCLVHoCt8mwvM6vk69wpnfRRA3r
         XzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746535591; x=1747140391;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i7yG9YQOdfvwmvsNm0/fYdECrCTyZGn7Chc0k6oLu8A=;
        b=UgJy8ECcg0rJFu+UgqgCmTilDhmISAprNT9pPs/bTFpRkL3PHdr85bWjzSswzoJorY
         Q159FDcOIyQNIblyN0WZTNtumhYJ7/Kp6xMSf+ucS+gdaVyvbcCesmS4lrkt7heXNhJU
         HWrfk+mn/eer3O1lVygaImd+/Fw8fP/8yuA2+/eSB27N0zC0bJA51Xu26AGadHQXhjmz
         GVOEd7WvHIK83Auti00Xm2gmvOI43xz294dBJ4bsgx18ko3AQpzvxXh86mY43phEtZIm
         VGW8dO2uuEQVsCxuln7fFGmvpVY318prfcWZw28kjDZkbUzaez9t7MuCyocanGMixHCJ
         9zew==
X-Forwarded-Encrypted: i=1; AJvYcCWewVH5gM97L7HCnIBN2RBdKW7LYBPbjdOcRYxRvdnmJVMnV83wfhsKmsCdpLiKCXZyy0S311I6mBAWd4gzwd/j@lists.infradead.org
X-Gm-Message-State: AOJu0Yw47hoaBud3YnCdGtvcmv935HMWlJjBDasx69HO3G8hJSpZ5ddm
	FiUvGmwS3XQQpLD6JCH026H92VYxbJ6CCG6l12zGSeL+3YH9bqBM
X-Gm-Gg: ASbGncs6MqtnQF+DypDxfO2EdIm+1OhZnep3MXCtfpKhroNUFoupv8frauT6eQ6h9EC
	d0Yh4G7HCA1KzRSx7jXQBr0h9zwGrNRDZIa37SDO8enBNy4YwNiydyGXzOqhALnqxn4B+4gkw67
	tYWvo8tSA0mIxNOKC6eShqZHAA5LYrRnBMnDdGJN6mUreItWmoZSOk+AoVC6F9MpDeTgMwE913P
	DN3/iqcN/MpO+M6F275qR3voi3VJVMRv4ltjs+1muhK9VE2jr81UOAalVhEsPL8iUSB3RElD9n7
	hi0EtRLb6t4pUCx/KUAG/QHqDreeiiO2hF9TsUs3T/ykQV8EsE4v
X-Google-Smtp-Source: AGHT+IFCzOhbTau8gJyBHWzmXlS4OTxwPR5Z8ozr6pZ0CIZ/2xU6CL95Bj1nxXD6RsleXXRUFaLGDQ==
X-Received: by 2002:a05:6a00:3908:b0:732:706c:c4ff with SMTP id d2e1a72fcca58-74090f149f9mr4498414b3a.7.1746535591468;
        Tue, 06 May 2025 05:46:31 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405909cd89sm8756817b3a.169.2025.05.06.05.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:46:31 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v2 0/5] irqchip/irq-vt8500: Cleanups and fixes for the
 irq-vt8500 driver
Date: Tue, 06 May 2025 16:46:13 +0400
Message-Id: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJUEGmgC/32NSw6CMBRFt0Le2Gf6BXHkPgyDUiq8RD5pa6Mh3
 buVBTg8J7nn7hCcJxfgWu3gXaJA61JAnCqwk1lGhzQUBsGEZkooTPGiGUNaosXXNpjoAlpZKyO
 5kbVpoSw37x70Pqr3rvBEIa7+c5wk/rP/e4kjQ2X6RrYN17qXt3E29DzbdYYu5/wFZ3yUabYAA
 AA=
X-Change-ID: 20250424-vt8500-intc-updates-c364a31a36a9
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746535586; l=1359;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=2s8t2ILCxu6QR2p5gIlDfq3bNM/NU7vZWxbvOLL2qcs=;
 b=4MF6eXKej1vozD6Il7vf6VcJVs3Tti9FnagQ4gl/exBCU53jyRCftgDVM7Pl3drK3apBlQ7bW
 LclidR8TPqZD+3WM206rbiyIa7TbY7GgW/dJj+W/zfAvQUW+kXMDtp0
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_054632_419854_F3CB5CD0 
X-CRM114-Status: GOOD (  10.00  )
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

Fix the logic of ack/mask functions to actually do what their semantics
implies instead of lumping both actions into one. Also rework the chained
interrupts handling using common kernel infrastructure, while getting rid
of a boot-time WARN_ON due to a misplaced call to enable_irq.

Apparently neither edge-triggered interrupts nor chained interrupts had
any users, so nobody complained in 15 years.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v2:
- Fixed subject prefixes to follow the standard rule for the -tip tree
  (thanks Thomas)
- Link to v1: https://lore.kernel.org/r/20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com

---
Alexey Charkov (5):
      irqchip/irq-vt8500: Split up ack/mask functions
      irqchip/irq-vt8500: Drop redundant copy of the device node pointer
      irqchip/irq-vt8500: Don't require 8 interrupts from a chained controller
      irqchip/irq-vt8500: Use a dedicated chained handler function
      irqchip/irq-vt8500: Use fewer global variables and add error handling

 drivers/irqchip/irq-vt8500.c | 149 +++++++++++++++++++++++--------------------
 1 file changed, 80 insertions(+), 69 deletions(-)
---
base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
change-id: 20250424-vt8500-intc-updates-c364a31a36a9

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


