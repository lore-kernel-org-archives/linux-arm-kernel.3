Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEDAD75E25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 11:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ktoHeGKmXYIdsUvMRAz3vVzbrdPr/EI44OUns8qrUY=; b=ESC22m4Q6umheOmgpuW1sASuYS
	/FpXQWPTCUbeOK6f9Q2xNmleGOlyKbFE/u6mDlFXirKG5JDUFwfML0p4G08tI0F+95qDuO93soH6x
	Fk8CYLWjehx3K6hH4Niq47TK1ecws1RT2TFSaxfZVTqtm+U0QMqfhFUrFhIIfwrOa9upY2/A62XK7
	OAWxBjsISBSrAuIAFKypUFyEWfI81qEJD1RVN3LRiGuopSaFaip+9TBKpFDXqSh8860uLAK+jGYN8
	5TaG+bbYFREeU/f4J6HR4Tu+0D7aaRPLlDuA19k2xRQ2MMW/mf0GXm2Lqiq5Bmf7ID8j6Y0QjE4uD
	4Lvz8bKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tERdn-00000002Kww-408q;
	Fri, 22 Nov 2024 11:15:59 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tERUu-00000002JUY-0AFG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 11:06:49 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-38235e99a53so1117317f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 03:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732273606; x=1732878406; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ktoHeGKmXYIdsUvMRAz3vVzbrdPr/EI44OUns8qrUY=;
        b=DIiZYNI3eLuJGTBGigF6d4LOXq0HqtiOqSwJijPgOdZOZnn32KIuK0wePhfGvasl07
         tcdLthtY1U0xQmK/zUKaglghIKFdTIriuREYTxz7L/0EeR6nWe9inQLOuVpaV7WMvXum
         YywKD6s3qYRTc3GAyP4CJBn0IfKR3DeyBMLNrI6LaKgvPSDCD9KXloNmjads0OPrvTjD
         6S4V/TArCYICRrvcSstkLgpaST0d0T+DN2rfIwtx2LuRHBxn6WVA64y89AO5LmejlSHg
         eH2qpz5uyV4YcsBn8JgEeD0z6TgESx0nKFaJH78J/SgFB3uLjXxbkysQ/3QOVRS/rFAM
         380Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732273606; x=1732878406;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ktoHeGKmXYIdsUvMRAz3vVzbrdPr/EI44OUns8qrUY=;
        b=qz1PDPGzaxjPlntbGTMvQqJPkw3s7M4AX1wDjkvHzLG+vVTYFH/hn5xJJSG9veh61d
         wy2uudS6YIjl8eX+D3idWdbAk6pVyUxmXGK1KxSyz7SoGloGPzV2lxYl4C7qjGhjb1Po
         lqmChM2UH/aceKpXU945PnvbVlI5i2GPMHMrTfAE97icYcvlv4lycjZuv7ccLacG+UoG
         0J/BA2yk4A1A0/HRgoc+P4SUKFMXGCYnzLPhI4sTx+GOYMJ5WKLGIZPtAsvvPXOApnzl
         tY32anaa1TXCGN3bNVTSYZw0QRc2PJJKkBSevPRj9+boeQ+W1A37i72G9ewiVqFu3TVK
         4myQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmzg+aXonVVVI/M/sglHtBd1wyG458zfvAGWtWsd9Ov/5G5Y+imyIGYC06IvI888dYcD/xio1d8FjUEUU3QSCx@lists.infradead.org
X-Gm-Message-State: AOJu0YxaTj0SV0Fhhw/+m7Vjyj5bizzMYOl87JUn/MKyt2L+bBUzK56w
	Z97SD/KMyZOXTjxrEt2LKDtC0A91vvd+jye1FugMG1ilmLkwv4/veW/b4i156TxiXl++vQ8k/Q=
	=
X-Google-Smtp-Source: AGHT+IHxlIibkga1iw7v2vPgOGsJTBx+OxZIvFAGu3eNw4H3FAZffNRHym6mWyxiSwY3urBtHDIw7EKv/w==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a5d:5712:0:b0:382:3c47:f377 with SMTP id
 ffacd0b85a97d-3826060f567mr890f8f.3.1732273605841; Fri, 22 Nov 2024 03:06:45
 -0800 (PST)
Date: Fri, 22 Nov 2024 11:06:19 +0000
In-Reply-To: <20241122110622.3010118-1-tabba@google.com>
Mime-Version: 1.0
References: <20241122110622.3010118-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241122110622.3010118-10-tabba@google.com>
Subject: [PATCH v2 09/12] KVM: arm64: Remove redundant setting of HCR_EL2 trap bit
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_030648_080778_5870F04F 
X-CRM114-Status: UNSURE (   9.18  )
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

In hVHE mode, HCR_E2H should be set for both protected and
non-protected VMs. Since commit 23c9d58cb458 ("KVM: arm64: Fix
initializing traps in protected mode"), this has been fixed, and
the setting of the flag here is redundant.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index ffa500b500f2..cede527a59d4 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -57,9 +57,6 @@ static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
 	/* No support for AArch32. */
 	val |= HCR_RW;
 
-	if (has_hvhe())
-		val |= HCR_E2H;
-
 	/*
 	 * Always trap:
 	 * - Feature id registers: to control features exposed to guests
-- 
2.47.0.371.ga323438b13-goog


