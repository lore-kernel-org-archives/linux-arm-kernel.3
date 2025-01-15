Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58240C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 06:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1jHKviSWbOJnThNL+BRNc29xaYnK5sB8qfkKjQ020pY=; b=riFbnodJBVeqE+ouEUYwCKoeqY
	X1IDO1BiOY5scgXWlU0NFwGV0wV9i4/DOLUhH99OmuxFP/AWCkA9paCZ0rmiPfFzipNZMKAC6fxZ8
	ocn+sQic35l8wNwpc4Y6iUGqmiDGjrGUmQ3z5qcE+nJXuvmvBO6sxSqYlYm/aWQFh3FMuS0GB69kX
	gVmVfKJyjMukXPKXQRZTBfiwwKK7mWCrLfnz+WRWjPfe/JgIvhk2S3AZ3ro6VwkAeykILKgf8t8jk
	xb/avVcCejGy5LHOs8v7RJbtxfd0hawj/4yH5HJ5+wXlOCUQyx0NDb9EdsMSSblQi0d4gApujQsix
	7GgEyYIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxIV-0000000ArpY-3Otp;
	Wed, 15 Jan 2025 06:54:39 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxHG-0000000Arf7-30n1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 06:53:23 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso10609154a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 22:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736924000; x=1737528800; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1jHKviSWbOJnThNL+BRNc29xaYnK5sB8qfkKjQ020pY=;
        b=HrF+rjOL44vYhZ007+e8VeAOEn7RQgCQEru1DXDewAiMFXkZ5prB2iTIgpGHCwoGBc
         3ciOxEbbT0SwGzp7ZK4JLRUV9ixsmaKUZxCQUUtUPuk3s+MrS7tiw7a37L2Djqh8VQe2
         Bskt94neRyIlLqvd1rvxelEtFyGt1CbkjW58MvN7bB3CRS1dmRAPPAPch7tsBhYhro9R
         O24mNxExiN5V9sGnSjeTBFPfpL44oSLdjGXXBUdEaq+gJQlVqCJjx2j1kjAsAS8+3YmA
         noUc0Imh4IxNkYO8+7uwKnuTkbMCgmdmLLwRjFG8uFanFGc0YS0WPE16gEPQCeXA/TVu
         z3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736924000; x=1737528800;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jHKviSWbOJnThNL+BRNc29xaYnK5sB8qfkKjQ020pY=;
        b=hD+2MvH8INL8VSE5rARS/+Dzxhbbt9vfq6WQQ9OGW8vlhrlDYtlRpOADIhFwfVaZnN
         V1WwKYW8wCBGqdRTXyKXlhO8gpb9jL7pMW9XFtgBx5ZKoWk9S+YwKcn91ZqkEpUgNxTk
         eqoYzSxQHjwbNJcgdLAmZxCs0X2bET1ueEnXcn4VhLYAzHky6reA8pXdpDz8TWkJ0yf8
         wuuBdDvjsyXxkZcxKrn4nmdyVKoPeodzo+SwIAIBCoYpwXUbdJsUtN0TvLxzyxXDZKvS
         O0yLz+lpAq+h9QTjPlSL39bbeKglDZ2hGwDilOR55e9qjlryifDvUZ/3aAfDBiGdaS5J
         5gEw==
X-Forwarded-Encrypted: i=1; AJvYcCU7VEBvpoAWwknmVJ6TxWoXYc0n1Qht5w9Bmd9QAjw63u6cGA0q5jYPJR7I6U+79lSkL/SQOZWtLkCNvzN2FHlG@lists.infradead.org
X-Gm-Message-State: AOJu0YxbrArNTQttgvyyFpMDbipZDiNlfc78NWY95j+4tzv5wkLxnisK
	RfJ/3LARSuF/1wPz0ZoQrojwYg5EBlmeSzR2fydQ30Kme/mQCV7uDiSv0xb24HM=
X-Gm-Gg: ASbGncswNIQ1H5evnC0cQ3modKtT9pFU10AdLjJrSfQ8r19OAblTfKp/brYnzRYmS/K
	LvysmboCx0hhiaNwe9t264hjxGb8mi+QhrRenwkr1a5cthDzVUgo15FdU/rJOTkkg+lTm19f9n8
	B2j/CkURU+cnveRJBCUqguGUe8uUKe+5+eVbs4SRXuKzVla3h4zVfl9EWRnGj3VIsJL8pMk/lGs
	2e9CSrUOo1dr42UF9LggUPc2LQ03fzqvxLmX+TxH8BfBGK1fcFNB6HZxebThQ==
X-Google-Smtp-Source: AGHT+IE9P5PDtBvyWPxhRNEsLiyx/nfhdVfXbwMkWhpN/F7zwvZlvMv1+220NOQBetuNrhffj43vww==
X-Received: by 2002:a05:6402:518b:b0:5d3:baa3:29f with SMTP id 4fb4d7f45d1cf-5d972e06740mr26199332a12.9.1736924000495;
        Tue, 14 Jan 2025 22:53:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c371sm7145838a12.11.2025.01.14.22.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 22:53:20 -0800 (PST)
Date: Wed, 15 Jan 2025 09:53:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] PCI: rockchip: Clean up on error in
 rockchip_pcie_init_port()
Message-ID: <7da6ac56-af55-4436-9597-6af24df8122c@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_225322_750076_D045181D 
X-CRM114-Status: GOOD (  11.51  )
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

Call phy_exit() before returning on this error path.

Fixes: 853c711e2caf ("PCI: rockchip: Simplify reset control handling by using reset_control_bulk*() function")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pci/controller/pcie-rockchip.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
index fea867c24f75..35bfdf3e17a3 100644
--- a/drivers/pci/controller/pcie-rockchip.c
+++ b/drivers/pci/controller/pcie-rockchip.c
@@ -132,8 +132,10 @@ int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 
 	err = reset_control_bulk_assert(ROCKCHIP_NUM_CORE_RSTS,
 					rockchip->core_rsts);
-	if (err)
-		return dev_err_probe(dev, err, "Couldn't assert Core resets\n");
+	if (err) {
+		dev_err_probe(dev, err, "Couldn't assert Core resets\n");
+		goto err_exit_phy;
+	}
 
 	udelay(10);
 
-- 
2.45.2


