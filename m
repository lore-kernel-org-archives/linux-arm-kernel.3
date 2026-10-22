Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120AB606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 06:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lVteJRd7;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Nqhom2fx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XKaoSo7CF72qp7qnN1m/zkh7lXXkEeRIt+dZZ5Jf4eA=; b=lVteJRd7yOD9Q5KhBz2BnUbcde
	gbsoFhgU5uqp/aPJCYg5x6AlqbxZilXuCi/8lEmyKcm6gVxQZxEC4xq1njGbqEz418Yfbt6MRs4Xz
	y/q3a29OFyiVdT3gofcEXvwT0x3lbnd/qAji0kaBUGGEATmqRYq2D+AuLL19W5NBTFPhKobIK5aBO
	xmn1SoNkw7WQn3kNbwfmc00B2s5FTybMSSU7BZ0oRlNkagiyqhRcGjbshzV4cjK3qsscFQmQakbgH
	dZH7aP8GOxhKcyrFZNH8qW03j11kgPIrqt7/DYzWD88tnXqaRYnw7Z3r6sogkM0rZMZd174KzIfJt
	ZDPwwp5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmDK-0000000DSii-1H0m;
	Thu, 22 Oct 2026 06:23:46 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmDH-0000000DSiH-2hz2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 06:23:44 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-886e61fa30fso567865b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 23:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792650222; x=1793255022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XKaoSo7CF72qp7qnN1m/zkh7lXXkEeRIt+dZZ5Jf4eA=;
        b=Nqhom2fxyXEaeSHKQDafTNqevULeqII101zk2/c5YnyCLozhX2dlo5B9ecpMe3pnQG
         mF0BkqS6VVQ8M5MnD6SjTuK0YTQDim0N/q3ITVwlKKJS+xgKhHGhCDVsvxus7BnofUAU
         zeGuHa3JM3MyLkymhmDjZ6wSktv5FgW7qoUCrN4puuVDA341IA1a9hKcTRJy64jHZG8x
         643/ZPQxsFz5LSAaFzZWJjFYoCoGondIkrSHN3EvFnENQuM/OcwtWQv6fjBBXQEAonUk
         Ac8ta9DgodMWO675V4CnkfhF95gf3Uz+ye+Nm2WY/LKunHRpxvb0VoFT5sf25kAaCl5D
         Tulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792650222; x=1793255022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKaoSo7CF72qp7qnN1m/zkh7lXXkEeRIt+dZZ5Jf4eA=;
        b=ZPc7kNNc9lpkjjp0Iv61h3IKvU0gwCFKq8C9bwlDAwfb2v6WcHRsn9bpcA1Wb+84d7
         0BrekjN+iew8fnpAhgUMIbB40YPBJJkJSnirDQdybdTUk+GjTLRupTwOkIfcp4P0k+sP
         U63sQuKhxeX156Q3Awy/6xRL0d3ZuPJIoNLHtlRkMXSrQHbpcV3QfUKGGrzK4Vv3Bp2u
         P584IbuOEkSgYR8UFjGtg1yJw5IsLJ+Iy7mfGIQ+/l3JEy9Qcq5vetE91URxEgWWzuMO
         l892JisJsv04mtyTjuYZElfqAklm0z0iIt/z7/WMRvhj0RbXmFHAgw/Zi9TYR3ByT7/8
         ErQw==
X-Forwarded-Encrypted: i=1; AKwUvByKKpJ3nUlrXh+cxqviRMCWojh853s8AVg5b2Yit2WsUWk/ry+Y+CPyXftPA24TgSZaYSA7NIXxXqtYzwHolzPX@lists.infradead.org
X-Gm-Message-State: AFq9FYJDkaLm+ztrdhUcJKnb48qBNwErZDNtbS31sJImFC4a3m83lqnU
	O3t0LAg34dfua3oCo1MeDVjiCy8yFK7nVW9oXSToJMj+68Pz3dxYyNe2oIOMv9aP
X-Gm-Gg: AYBFou1xq61CfKRPTWTkSqdqcpjS3ZAE9m/Zo4ywCumhBPtwyspqwdi0hMV/4lCuz4d
	9WLVUpAJaHnNd/kwE1Hhv8qPPX/sY/f/c0rjboezKcjMEP/s8qvyV8z5roiuSx/RFBbfDXp5rIl
	LAyuu9wQVZlqnP0y7jF7qZdavvG7MLv4lS8uTOZxC4G2QQWIPNYYnonuINLTc5Fkrr8ASc7VRQY
	Fph2gq6a0YDOSRfr5j4oT23EWnXO76R8XKBAUu9C/oQNtl4nwacTKQ2/rYkQ4y1luIMTOinnvNE
	DFpFasz6fvLSUQy+r1C/WUSGtdHH93LhiPJPkNF2mG0wswVJE6OmEdUalg21r9rvVd2wktTWS1o
	qdkHEkAgXC8Vaz4AI4IJaSVG1GLvRgdwWE9fCcTPt6WfouLP5NIFykiWfMtJwn69SD+SXEDlMAa
	KlIgzgIppj3TLOjp+rI0nqhpAfsKglzekgKv3+6mOgroY7DWC/j57COFDtjHS2OfmolvmmgMP+U
	Til+dlIG2oJeoGAqo65E9391wVZ9Gh5AUPOFZznzp41HsgtarQv2bgwdsfL
X-Received: by 2002:a05:6a00:4612:b0:8a0:4807:456b with SMTP id d2e1a72fcca58-8a089f5bca8mr3365981b3a.37.1792650222338;
        Wed, 21 Oct 2026 23:23:42 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b49dcsm1632102b3a.16.2026.10.21.23.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:23:42 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: sashal@kernel.org,
	andre.przywara@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] arm_mpam: make the mon_sel_lock guard return -EIO
Date: Thu, 22 Oct 2026 14:23:35 +0800
Message-Id: <20261022062335.758832-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_232343_714139_F75D62A3 
X-CRM114-Status: GOOD (  11.49  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The mon_sel_lock guard class reports -EBUSY when the lock cannot be
taken, but every other failure path of mpam_mon_sel_lock() returns
-EIO.

Encode the error with ERR_PTR(-EIO) in the guard class, so that
ACQUIRE_ERR() reports -EIO as well.

Suggested-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/resctrl/mpam_internal.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1f86cc158100..2f6dfb9d3906 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -204,8 +204,8 @@ static inline int mpam_mon_sel_lock_init(struct device *dev,
 }
 
 DEFINE_CLASS(mon_sel_lock, struct mpam_msc *,
-	     if (_T) mpam_mon_sel_unlock(_T),
-	     mpam_mon_sel_lock(msc) ? msc : NULL, struct mpam_msc *msc);
+	     if (_T && !IS_ERR(_T)) mpam_mon_sel_unlock(_T),
+	     mpam_mon_sel_lock(msc) ? msc : ERR_PTR(-EIO), struct mpam_msc *msc);
 DEFINE_CLASS_IS_COND_GUARD(mon_sel_lock);
 
 /* Bits for mpam features bitmaps */

base-commit: 8ea457f746d915d55f78b43d33b1cd618f3d93ad
-- 
2.34.1


