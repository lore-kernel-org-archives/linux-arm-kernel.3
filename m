Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FE5C61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 17:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=smb+eC3dhHT61c6tdVhm6kuxDMtS75d/UQ8YVvsOsKE=; b=hyQhJeB6TkR0NMbDsDyHN3liR7
	w6KxHzLwI8K3rf8auFD0pRcL648zzclvUcpwvZWmA0T5GfyqnRBBKzEmu/l1V9d+/xNytOJFe31Zu
	rcZff7W7RF/k4QkGk5NgzvqohRBK7YnHLklcaeyYYYBwy3ofEuGMPTtlqq17O/y3i3K2Oajhny3zD
	RLvzknPGmJ2q2RMU977Ncw1UeBQcalIIqPmfjklLsFLjXLNCWLrTKNCASV14KRp+EbhgF8RDXH5T8
	jvKkEOFkGae0urTsEutdijkuMtvhYI3ClxcFDK1trdvqskzQye3XyoY2IDRej4+AyoI1q2TXNFEbC
	m2Zhp+VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyur2-00000001CpW-0yc8;
	Tue, 25 Aug 2026 17:22:32 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyur0-00000001Cp7-1DP6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 17:22:31 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2caed617615so1052445ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 10:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787678549; x=1788283349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=smb+eC3dhHT61c6tdVhm6kuxDMtS75d/UQ8YVvsOsKE=;
        b=hwwvF3bypTXhL77DIPnNOeSQhx0LqEUl/UJyc0KU1KO9WcBmpOWrQlEbNrtuIhkKOt
         vrmPKI1J97L4xYpIJ2KN50noQa797jFcIQqcZZbLRaJaM4rTvQ8a7xN4GpwJPkhuFwd1
         o8nNjZ5poXpfK0l4shh+NEWDhvwK2hdQcvQXyhLkrzPbGL887td3JDamGV1KQxOJNWtc
         1qh20ywB4YeI7IAbQ6BG7Opfrou3Sc9AvW704JoTTF73KZ8R2rF1m/W0ZuQA+sbW8/AO
         PVsXqMpfd5hT8MXF3GHDtB7OK7JOpwUPuNg4ZK021EIpsFqagZfajajEPIjU/WyxeBtK
         PeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787678549; x=1788283349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smb+eC3dhHT61c6tdVhm6kuxDMtS75d/UQ8YVvsOsKE=;
        b=M/BVKbO5XaKuszIGo6Z3bLL4GxTsruMAA+XK4r+cX+/oXUbT0A7BITWgsaNcrumFv4
         Eb8daAHKUD5z7aGDu7PUg+hCSgAHRqNWV9FWmtdTxmWmTHPZz/oMKcu9vZV619aWjAlP
         nVdlMOc+wfWTa0LAs9gSG6RIewfy3+GCFRR7wyO8dOXsc9RJj16p+E+27dd4AnffjlYF
         Gx7fEnoQQuYk4pKGGdyyX8K3CjEYGOMpF6TWsAGFJjkmg2/yaj7bLS565KonHUNnmnrh
         me+M0+7II2YQ/B+H8r7NDXEU7Dlamlx5t/oNv7q/AWXhH71vHhSmqgf7aCgHcdmywj2r
         1CxA==
X-Forwarded-Encrypted: i=1; AHgh+RrbJvuQcslsUYfJPhpkULw47LpFwXvNOODc38qB2hBkXRfMdhbiYWNwqhcrutzdFu1fO/CTUOfE9PDPWNd3/ITo@lists.infradead.org
X-Gm-Message-State: AFuF++kInmDh4lzqgtwzjpr02d+zjF2ZaFGZsgZsM4ITBnwEqhAb89sE
	r6Kg1a/8iOXvNFqwPmtsWBO7Ot9KuUGr6XEK9X9zIlfLIRBza1VE43r/
X-Gm-Gg: AR+sD12T1hELyNRM85Fi8F5bILWxweEWhP9nVlWvIGq9RLHEdei8B/qkofYLoxIf5+5
	7vAeBA2cfLJ3nM1DlHAg7rBsROFmHT2G36+Gfdl73WD355wZX3NsRC5MK7K6VVUFLQHNXOBRtl3
	rChHXxGkUFWAWlyIcwWcS8kni7evbgI0i/HWcSnjNqcPqW+2DjJPic6qyenvfO6IrGh2fO53Swl
	6ltV7UKlE1jtsGQOUniOvXdcI+JPLAJGnjukIPusDm79WG9Ys83BkpVxRtwk0cbYyaTEwLrkW/P
	MQztXNVQFekViqwRlvS94YlMn/3joS0pqnV+HQx+6/hcgC+vnPNJvQRTqNrWdJmFwU/mzqzCD9Y
	dxyxU6BC6F1Du7iB7sXQrIY9FVoVJ2Cerx3AjKPGgTYQY51TcI1uFtzW/yi0+kqRuZlgOahvmIN
	WL+ZKBGLc6TqWIQL0BhEOAcOUcNqczdGcOvmAP7BNVLlxhIkILSUnyCNJcib0=
X-Received: by 2002:a17:903:a90:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2d670b60ceemr551159465ad.2.1787678548700;
        Tue, 25 Aug 2026 10:22:28 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:7ed1:605d:3bd6:fefb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d8d208csm327637eec.23.2026.08.25.10.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 10:22:28 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v1 0/3] iio: adc: bcm_iproc_adc: Convert to devm-managed resources
Date: Tue, 25 Aug 2026 22:51:52 +0530
Message-ID: <20260825172155.250484-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_102230_331831_BACF1560 
X-CRM114-Status: UNSURE (   9.03  )
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

This series is a follow-up to the previously submitted probe cleanup
series for bcm_iproc_adc, which is already present in iio/testing.

As discussed with Jonathan, this series continues the cleanup
with a few additional driver cleanups and devm-managed resource
management.

Patch 1 sorts the driver headers alphabetically.

Patch 2 replaces the manual ADC and clock cleanup with
devm_add_action_or_reset(), allowing the probe cleanup labels and
manual cleanup in remove() to be removed.

Patch 3 converts mutex initialization to devm_mutex_init().

---
Mohammad Shahid (3):
  iio: adc: bcm_iproc_adc: sort headers alphabetically
  iio: adc: bcm_iproc_adc: use devm_add_action_or_reset()
  iio: adc: bcm_iproc_adc: use devm-managed mutex initialization

 drivers/iio/adc/bcm_iproc_adc.c | 51 +++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 19 deletions(-)


base-commit: 560c1aa128cafb238f460826abf43bc8b83aa0a6
-- 
2.43.0


