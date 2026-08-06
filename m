Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E52DC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 02:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RE5+yp+EO4sGvggz/JN1MlhfuJ4Nn1zTwuioIoIeNsU=; b=1gbjGV8op975z8iVn1Nrbqtu+f
	mfJGRNSPG5ddd82KB7AT7yCi4fOnYnHGfoWcRcJgqMgtHVrvcLhJvZnkbSihyCKyoobtDZzmMwnzs
	qoKD1DZNTCMVCJf76Dg4EBS8AVTPMRaGI6awtVGcQiA4+2ZxI9mqtbEi1VYJe7jQ2ObmYEJ33u5Ux
	sSvP3t1Kq+t4sHAkmkCWXyZonqj0B/FVI4mw3fDwrOX+jH/KrHB43Ph9X8jytpWoifEtRLnJrY0VN
	Xrf0IiQOGH1P0puDWMHA5z9ySnEkelW1fYMJRQGuL7Tw8l8Kd8I1udQgu58zMExo5yoaraqiTgbkd
	9St+vhHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wro15-00000004p9T-2YYR;
	Thu, 06 Aug 2026 02:39:31 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wro13-00000004p94-3BHk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 02:39:30 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so1526564a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 19:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785983968; x=1786588768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RE5+yp+EO4sGvggz/JN1MlhfuJ4Nn1zTwuioIoIeNsU=;
        b=VXrSBU/T5nCzXjsm40Wn3EAVihYZ3Q08TxSuti6vyQhiJ7LqkXXPPOZmKb99iXf/2H
         WJP8UKW9z41h1mpml7UBOeZ4PnI67l6toX2tuQe4IMBBDOE6B5XvUQTeI7KLY6KrJ6ln
         S0ASobtBGdx4b2+AHoCnUIRXNJ/SukGKxvZNmoORYg+ejKhOW5hy8/LLpFjp3pMP7yCw
         oa50TsDiD9JzZRjRe0+PEO9/Yoz5yA90dEVHlBUSXh7Xs1Ngp4YRPupFF3yTDrVNMo4c
         5Tu1YUZ1hTzz630T7QCGBZRxfpRA3xTcjbj1niDDtpanBBJqMRHg31G8UdyMDOf/BnBG
         +X3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785983968; x=1786588768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RE5+yp+EO4sGvggz/JN1MlhfuJ4Nn1zTwuioIoIeNsU=;
        b=aUBjEfhjDPJBXtajVkIs+ieSKwgKZl8zogtXRwHMlWto261juuM24Hd30W1PYB64wl
         91WWnvQzFt2QDSUwkjdYPe5luDv7ZkrnOUjygbGI5g9Gwmb24a0SVtVPx2sb/HqVcdcq
         E2SC7fLTwP6IR06jPJcTMtyxC0A3s8a/JvKZFVF+jkaORWEJL4SR9jOJ1qfQdtszW3KK
         k98Pw+VvM3mAn9mn2dp+hfyZysiHvIsTT/qYF5JuyJIQSqks1LFRDEZv+gwPvh3XKyb9
         LdBdICzdEyb4/VaNbY8T7cagTWEzYkOmP1XqKNrRfZ0Hqq6DCmwqXW9jAyD7k0Lk2xa8
         7rmA==
X-Forwarded-Encrypted: i=1; AHgh+RroN8zxRfgjLg1q7k6kc41diQ5OJopE8zGxodFspRRKZyxnW/MaAC3OHZ5RevuJKHe+SCKHIMnuq23oHO4QrIn/@lists.infradead.org
X-Gm-Message-State: AOJu0YzXo2hQp6QjffsoxbqQfspuW5ROeVEO1r/p6lAdqv4HUOJzF/+6
	jVjK8TQR3Ygf6Ug6rqHPetdSsC4iY9HrWdl1FdHszuzXZ2tlUR2rtimw
X-Gm-Gg: AR+sD11YVHMfkp8mSMzq+bpBCZ1L3muoPbP9mH+fJpQhBhJWUhPQNt5lJbYRVHLvCYw
	8EKEPPf3xgHB1P+/56azyxzOg/PqKAWYVJW6Bw6KN1hULyk/AuC60PCt6m9sefaIJMBzBwCzuUZ
	xNqEwit1dW0837fspTWlFNOk3a5qSY2m0JCv2iRFeTzJb1quk7iBJZYuRkzvZq5zAz6tCKfkXoP
	cB1O9WiKGpYgDOhqUJjjPQ0P8GIF8Nj6kRGg0fHxJi/yqsYWvW2pjqp8Ldk+GekJb2+YTzh127U
	s5VHPH4IcVeUqqNWsXgfXAApOG4mssNCzUWTwN2Qvp8De5Zc3J7CYa0DSIZkygSYo0u5rE21bn2
	Dr341VEPeHOX2o+W7u2EgQTO7Q7gIWH9VUVctWrF2K9Heflq4IRXDOkwHUzxGzyyq90hgPckGg1
	ObiHE828Ij2FWA+mdQiLIh6qXfIWQJpFKRJnzn6G4vRnRNLkVOXOghLtdyR9s=
X-Received: by 2002:a05:6a20:4391:b0:3c0:b4f8:bbfb with SMTP id adf61e73a8af0-3cb85e5cb78mr14282873637.22.1785983968204;
        Wed, 05 Aug 2026 19:39:28 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:3194:1e48:e141:80ab])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867d4929sm22404383eec.30.2026.08.05.19.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 19:39:27 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v6 0/3] iio: adc: bcm_iproc_adc: Simplify probe error handling
Date: Thu,  6 Aug 2026 08:08:59 +0530
Message-ID: <20260806023902.8608-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_193929_802191_BF72DB8D 
X-CRM114-Status: UNSURE (   8.53  )
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

This series simplifies probe error handling in bcm_iproc_adc.

Patch 1 removes redundant probe error messages where lower-level
helpers already report failures.

Patch 2 introduces a local device pointer to reduce repetition and
prepare for subsequent error handling cleanup.

Patch 3 converts immediate-return probe error paths to dev_err_probe()
while leaving cleanup paths unchanged.

Changes in v6:
- Restore the original formatting in Patch 2 to avoid unnecessary code
  churn, as suggested by Jonathan.
- Reduce indentation in selected dev_err_probe() calls in Patch 3
  following review comments from Markus.

---

Mohammad Shahid (3):
  iio: adc: bcm_iproc_adc: Remove redundant probe error messages
  iio: adc: bcm_iproc_adc: Introduce local device pointer
  iio: adc: bcm_iproc_adc: Convert probe error handling to
    dev_err_probe()

 drivers/iio/adc/bcm_iproc_adc.c | 46 ++++++++++++---------------------
 1 file changed, 16 insertions(+), 30 deletions(-)

-- 
2.43.0


