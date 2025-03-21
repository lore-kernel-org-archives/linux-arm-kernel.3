Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E95C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3PPRppdrVJ7KjI6wixZGEvPAU+S5utOovE0gqiXmI0c=; b=EnFuHBpF96voTeSP2ESOhNr3+h
	aoyX1Ma2PHocLlKiKCKQNMlzKwdozW5Y/z/0ekCVop+jMmOQxAsYoshGqhizs/pRyz6S6VmUTFV4w
	mF8JimQPUG9Y3rPfGeSSy4AmWQXwyrdrDu401cMuOsf6SRSoJXIfoCKUqUQAOy5/Q1ElAlMSUOxGP
	stR2R5iARq2U5nvijdsgOrwKThVWBkO9IQU2YlyipaCBA4JrfIcCXmt/9xJYTIu2Bg98P0kqGleRx
	/veiw7GmYR/1NHjudpQH3a6qzTda4eRB8Y/otoWoqVLXQsYgfQ54gOkS/IDCoGkhtVgeD669LTmtB
	V9REzCJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdZC-0000000F9xX-3gzs;
	Fri, 21 Mar 2025 14:41:46 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdTI-0000000F8Oh-0c0r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 14:35:41 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3996af42857so2085089f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567739; x=1743172539; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3PPRppdrVJ7KjI6wixZGEvPAU+S5utOovE0gqiXmI0c=;
        b=Bo3W+DExYpWbfpLyc+Tz82GyVTvCLnJZbZuJKOw6A6mCOIJ9sPOIGrk6gqMVnWUPML
         a21DHPq6477/m145DiJeOD9mCaQvVCmDPsciQi6r36RkJUvY96tPUEO6KzjWC9rDDbT8
         XXoZNIdjkwqMx/IOTceik9mZ2a9cUY4RpFJ7O7O5J/uZS17pdgtwwYEqjdiWMm8YKE7X
         zp4S/SFnmDoskSnVe4KctOxw0CyeM4bkCI2ZXFn6hAWInBbi+eN3791sVVKG6R8LuCne
         TqbbT5vd8BC+yEjYVA6K6+kgD8rnsSQeqqYTEX2KbDLr+4nFJHjD0nsoKR4MZNR5Vqll
         0NjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567739; x=1743172539;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3PPRppdrVJ7KjI6wixZGEvPAU+S5utOovE0gqiXmI0c=;
        b=wZ3cvxqeC94RGqwZl+FMFfC8iIwK/NRQprdnv/r/2JIKJQtwUVf36yDKqGijGjCNpz
         7LqGaaedbpl220dBsReK5+nJKvpdengAIT0enU95QbEcPi1Mcp5eYS3KFxeK3g+nGa7U
         D8Vz7nPo9eeo4aWjO4lWxIjvfq69rs3vG7yOfhktRSiycYbH7jY/trwLJ/AVf2fQNQlc
         Mr9lDUlAnDECxJCSjln/cp0EFioxx1uJNsnJjlWw9wt4GuqThTutbawS1rHJ8HnfIXQL
         h1s2ajASi9IrWrEwSi+jSZNQqr2v2Gj9LlRw3a4+e76symUODTUQlxV0tN83Z1eRYwIm
         zFtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZDOupJmjbt8e7BEonlt4oRz3wUuAXH2Xzw3DJY6OTCml5QSV8+y+3NgrXcDucTXC/7ZECMe+dntPgjaQ9uBC6@lists.infradead.org
X-Gm-Message-State: AOJu0YxhHsA0/mN5j7KCpaqgkSACNeqeG9973MNfZcpy4vbtZ1z5/St6
	0OMf6tMydHelcE0j6ANQmqLQ2+Ct0R5l9MoLSvPsEEk++XT+gHwecoBOFXr29DA=
X-Gm-Gg: ASbGncsVO9QOk7OOVhcb52oeigavYsHJwGasGznkggWmpNfz7d62lPo3SDJzYz0QhOW
	Jrjk46azThFbz4i8WT+3FRW00TFOhEaNJJlokXSgm3UpdubecEp9EPTv9AfFhhkxxjiJa4xcUDN
	/iiIuezPu5nHRAe3T78gEWFFapDSh5colmz5VK1309V4144qdiwJJqn61/+yLW9p4090hll/Iqh
	AJp6nlQUWF+CAXAUNAn9lpeV9L6EC5obyg5nW8Rpw/VQ7zeTEW37XPxxYR1zLxuC8cKFImRY4jX
	n8dBEA4kfDAAjrTWJylwRtcPQhYTGadMx1nOoF/wxzWUc/IKDg==
X-Google-Smtp-Source: AGHT+IF2afE+amq9nc4FEedeUCaZRhGRjLvVfJvTuEgevNOAdUUfdZR/acRzOI2V9GG7bPnUNFsa8Q==
X-Received: by 2002:a05:6000:1fa9:b0:390:e9ee:f27a with SMTP id ffacd0b85a97d-3997f93e053mr3439159f8f.28.1742567738601;
        Fri, 21 Mar 2025 07:35:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9b26a6sm2493540f8f.44.2025.03.21.07.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:35:38 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:35:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: mt76: mt7996: remove duplicate check in
 mt7996_mcu_sta_mld_setup_tlv()
Message-ID: <fde7246b-08a2-4c2f-b2dc-c3fd0e6b300b@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_073540_186715_6DE1F6A0 
X-CRM114-Status: UNSURE (   8.63  )
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

The "msta_link" pointer has two NULL checks.  Delete the second check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index ddd555942c73..03539e20f5c5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2242,9 +2242,6 @@ mt7996_mcu_sta_mld_setup_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
 		if (!link)
 			continue;
 
-		if (!msta_link)
-			continue;
-
 		mld_setup_link->wcid = cpu_to_le16(msta_link->wcid.idx);
 		mld_setup_link->bss_idx = link->mt76.idx;
 		mld_setup_link++;
-- 
2.47.2


