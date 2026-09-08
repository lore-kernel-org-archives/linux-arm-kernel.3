Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560E7C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n1HHJlfn2XcOV1TeOuj4SXDQlV5H5y36ip/NG6d64DA=; b=dj6XoaLJvmJGImc0anSKJx5IKN
	w/D19qACC7U6GBcvU0KMfWdWNKrcAI172kQtrwx64RW2SDcMOStAQLTaf/gkDDRoBTd4R1bbxKlon
	1OMPaf0CB+uNiwbCycTozmxC3kRcdluBT2SaPqA4fSnpzRrDtT2BmoNORiQRHzrzb7Twyq0K71N7B
	hMDvzLLNNv4Fe9lZYVaMSfVYt3u6OACybgSiqy3RbdlF1LD8gjNqsJhZXuZaZfMKNgL7j1v0zfIq7
	KsFtK05rzl1P2/InGYchGEzYQ+Rc8RoF+GF3cuvdQoeZOvLpfABMApou+u/8U9Uk5chbbDAcUCrZk
	051gabYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zYt-00000009oAX-0z3a;
	Tue, 08 Sep 2026 17:24:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zYr-00000009o9Q-2BxQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 17:24:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=n1HHJlfn2XcOV1TeOuj4SXDQlV5H5y36ip/NG6d64DA=; b=Rjw4aTUbXkXN2LCR0bnv1lq0Lt
	rYVE0t3m+YKjutceOwr5iyN/IiNf6cNBWaXeeop/sqAYCFDFdA/4Y0+x8iOzQmQFfhmkoIGnbe96j
	Hu9dWMWUxcJiZ4Z7kDVcE3oeQauHDcZvN8UgMzycyKaPQ6A7e+B+10FIHixYeS5fvNwVoedJvjT75
	Tuxc6aMQ4MTX1732NSGPqjMdel+A5VTZMcr/CzVL+663AacY4pDWY5sOZSXubEW7dzlj0oVsQUlAF
	W8Bef2k3Dc7Sd4O/VZth7V+5X2HBaWO6/pVV881phvV8aM8drMzkZdh2bsNCDwAvH9InQ5UWSAULa
	D9nIThrA==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3zYo-000000009Yr-1GQ8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:24:44 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-853f8c34ba4so5738297b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788888280; x=1789493080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n1HHJlfn2XcOV1TeOuj4SXDQlV5H5y36ip/NG6d64DA=;
        b=dWljhlUOR5UjqeH3fujsxenD11eKcu4toVxeY8rRjByg6QGR2p6r+qRzwOrL2NUht3
         l5eDVvt4Evgj/wn1bDGfOgJEtUEsZQBxY0JX+Ft5vUlIy4t9KuT9KOVOidByg1NU2+j2
         Q08yxh8ZZu4MTRufISHB+ggtzbmfCU+OslNFkaeglC3UljCZ6gtgZwS1d+tEcOHQGKuE
         ma2Hdz/qIFmG3OExoMf1hrOaSqv1Q+0MqeWn42sYvK9hGgf0BIk3Hm8doSNnvg5s7KCd
         fHeFkMKOcoODQN76CV4YMzEJ7W9SrpOlgOnO1og5MngwtXB324C6ldulRaVopWOY9tay
         b/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888280; x=1789493080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1HHJlfn2XcOV1TeOuj4SXDQlV5H5y36ip/NG6d64DA=;
        b=I8jEzLN3Qedv6tXs4sPXz1oI0+aXBuqu6UgqljikMHqSBL83MRQEnf4QHY0hOC8JK4
         Ui50/0QH2/0a/VSXXEadQ9YO3TyCtXHCymgG+qbPypeAu28MBRY8P776EJCExz8zADKZ
         mDrhplihUcwpm4HYMPJTRb6p3qj1GSQiTKXPkM0PpmGWqFQSYDMgYpgX5LrluEXcLDtr
         fo56aodVwK8o0YnbWZUsQTs2aNWxuc9zBIgkv8QNwhkJmY/VxlbWQCo7BuUaIZOwysCo
         flEsnGxVHWnn/FeolKS86gq3dT4EIKpg0cYCnJTJdfttmofWm4HYbwVTy7jQ+ni9drki
         YK6w==
X-Forwarded-Encrypted: i=1; AKwUvBw7zlVWpEvrFvVa/PbYybtTBP+PDiI0SedeaO9L8dTTEO/IZtmHQUTL+LQmEWg73L8qRIumlHTTgSANIc+kXX5X@lists.infradead.org
X-Gm-Message-State: AFuF++mu+lL6C+IxjT4gdgS95kcdTcCIWjbn+FOOdhBngquzhcjJlH34
	oqL20cMYI2/Lw87oyAnfT6ynfx7bG3b6JpEK94gcjtoXe4+SOjUZUjxi
X-Gm-Gg: AYBFou3uYUg0poU+iw4wlbfEhNJVJ461fcsRk9wWSMKul7579AVxC4CS3BIJkf5e08Z
	8A5jQuLnr/StZTn65AmrgmqVOdDKrHzyOGk9QDdBcgKS/zgtWKsG4UjDEUqIAR+lo2gOgtUN1Ay
	I+/LRkNlsEiKY+fdCNq9iCRxwer4ha0Za+yupBEVawg0f4bsUi438C/UjBKSJW9fytrrx3Yeg8W
	GMC6+ooRHl/tImtXROCGx+p86aYx++wYlyZdfoZiD/0oeBKTymxeVerq/ezGinh916mr7gZT7CH
	1Lcoh0lUN1AYtfA1PLaXOyWuSTCpG0E2oyj2NwECdIyfwPtYykMLxsdlapECWXrgXs16ohuOiZo
	sYKNgpeu/7XIb7P5G7savtt7DP1p7BTFv5iExbPTkX5Cfv34xIUZ2YsbTdTOGk2l7f0KGX/bo/R
	H5vIqXdVCU3Mpo6QrBNKDdV8+QS3xxPl192Pjd872SWLrOJgbVDsezBVYVa5oC
X-Received: by 2002:a05:6a21:6487:b0:3d2:2afa:d77 with SMTP id adf61e73a8af0-3da3a0b0a9amr44752599637.14.1788888279580;
        Tue, 08 Sep 2026 10:24:39 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:43ae:bf76:d99a:e5ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm19297176eec.20.2026.09.08.10.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:24:39 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v4 0/6] iio: adc: bcm_iproc_adc: convert to devm-managed APIs
Date: Tue,  8 Sep 2026 22:53:53 +0530
Message-ID: <20260908172359.30003-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_182442_469434_DAE05C3B 
X-CRM114-Status: UNSURE (   7.90  )
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

From: Mohammad Shahid <mdshahid03@gmail.com>

Changes in v4:
- Move the ADC enable error-path cleanup simplification into the
  clock conversion patch.
- Simplify the ADC devm cleanup action.
- Restore the blank line after the copyright header.

---
Mohammad Shahid (6):
  iio: adc: bcm_iproc_adc: sort headers alphabetically
  iio: adc: bcm_iproc_adc: fix include dependencies
  iio: adc: bcm_iproc_adc: use devm-managed clock
  iio: adc: bcm_iproc_adc: use devm-managed ADC cleanup
  iio: adc: bcm_iproc_adc: use devm-managed mutex initialization
  iio: adc: bcm_iproc_adc: use devm-managed IIO device registration

 drivers/iio/adc/bcm_iproc_adc.c | 65 +++++++++++++--------------------
 1 file changed, 25 insertions(+), 40 deletions(-)

-- 
2.43.0


