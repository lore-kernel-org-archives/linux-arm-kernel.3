Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367EEC55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 10:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t35LtrHrvAj+5G4uXnmpwWQkMKS7VxycgcaRFW924P0=; b=xDV2MhXK609nxByRVN3ESEewt2
	TxyrFKlMFzDWc4jQoFWKXI7O+bd7B0MxTafMqIWZ4Afvf5rqARLtc4xjXCS8TcqdXsuXQowSFttC/
	XR+B/GStqY2e/D1XTtmr41952xaWcNiZ40qQI1zKjeKv0kwNyd1PtV5wB7EzDV0NcLF3Rz7yzkfPK
	QcrepQSAAqOQgqg17DLJP0y7BpgBc7djn+CS6EjoA+eqZCIPywutPLO88hbfQzcYy/rxDTT+DinP6
	RSffFg8fWWy2uc/gIBanxx1iiR01vCm+lzQt4ntMIPVlTPcgHXgaZ0K5w3pNFUmwcyNI5/RM02W0N
	Kzy+YCrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqTXs-0000000FYAV-1e9C;
	Sun, 02 Aug 2026 10:35:52 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqTXp-0000000FYAC-3TXd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 10:35:50 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so2214588a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 03:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785666948; x=1786271748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t35LtrHrvAj+5G4uXnmpwWQkMKS7VxycgcaRFW924P0=;
        b=CMTxavnUXc2YYICoynP7VdZfdvC6FRbteT+UnwKgwlf2V0yBXNajF9youTfYgNH0w4
         ML9re2f1tkzfsAOMdPt6PVwUg9oiTubd13WvUF1uRruP3wC2HbYboJZRM5E5DCS3WF7u
         7ATDyEGwU/2nbIg3bDoCMBY16gXzmjkbgFD/8G/8RUGuqOBYFS8AfugpSaDmAkxagJ14
         6nAeUD0GeKyZ+/wjDsqxKj+/VnCUGxXqUOKlkp9fDWRU96SGJFj7ngNGct+RtCncXk/a
         MC6UXtGacGMGRA2l72g6ja/NsY8lE7x3aqhKfmEJmLG5ojF0sU1UuyKHY3McuNp6A9D8
         4nuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666948; x=1786271748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t35LtrHrvAj+5G4uXnmpwWQkMKS7VxycgcaRFW924P0=;
        b=CPi3CWTUwbf9flmXQUhkG4urwTcUqup0UfZTQ5soo745/UnziCGa2nsM4S9R4EKXeB
         7qgN5c5OVjPohOrocZ3Ng583XE10e7aFXg+tTbgHT+AnPHHsqTPpNA0gt2LZlZt27H4m
         mwA+1zp/1UJp+3nMaUzhVy+279XitfymkkwldB/hmiMJmwtIVUnpVrBxwnbS2QjMKBVI
         hed18EMVQVyhceFKj6Q23WXgmFLt/uHrT7gKNCjxslcQ9Sgayukb8cnT+ae4XEAVYgjc
         B1dfCI51AVGbWP39lYanxcK0mqlHxKqv1Mw9MVrm6w8FAfZEM+AQ93Hlpp42AL7A5rK+
         YJ8w==
X-Forwarded-Encrypted: i=1; AHgh+RrEGriofcHMBG1KIHD4mJRSbRyR775w73MtuQRFJdrc/ni3A4AqBzuP7rSYkLJldZcw72EInpwICvp1klc0SG14@lists.infradead.org
X-Gm-Message-State: AOJu0YxNUliEw7h1XRU/N4CIEvrIgmy7tYrRmUYMMrpL2jS0lE7aBBTA
	JWCCeU8B3gKAdXF1IWg1WgGU6oBHNb9Tbt9F/gADwqznLyN9YkMoWtND
X-Gm-Gg: AR+sD101dNlOsA0hQMIa24vJM3T/V43vflaqH8vcTKg0p0IVEe6AWPKU5OZuec3QXF1
	zB0IM9X+/sZyHRoZKobpI8oP2SU5qRyfVjuT562lrqv+31+GKqT4Gv3N8cXxWdQzeKmPIAVpru2
	CJ+kYj3+K1uzNyej3CvJM2GushqETLXD9Kasak1bXZSY2nH0rXugTASIhJJ80jdqfBQa/2P1l3t
	WHvHlWlBl4srEEcEKyqZFyPbc6A+eX5hhiA+BLka+u70ps+Brta918BVoauXiK3H2MKKm+BRj34
	Vhvh18dD40sjGAXUMt0jYBPivRADYPjWCAFYQyZKJvRaSAN39U7tBv0FgugbupiSZZVufrc83w6
	G82nLomuwDfLHNkTWkHIT0f5qoeaHdAkoqeTYR9CwvIvWDwchMrZdZ+5/DSnpRnUA+J3SDwaaYf
	vZG0gS//6R5D3TcebzpIwfVCdw6TLHPYGJ5gdfijtbap1C+79wyD3NciuEugU=
X-Received: by 2002:a17:90b:3a43:b0:38e:679f:3b2a with SMTP id 98e67ed59e1d1-38fbc4dd615mr5362391a91.30.1785666947686;
        Sun, 02 Aug 2026 03:35:47 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:a836:ada0:6830:9b96])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab13255esm18687092c88.3.2026.08.02.03.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:35:47 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Joshua Crofts <joshua.crofts@broadcom.com>,
	Broadcom internal kernel list <bcm-kernel-feedback-list@broadcom.com>,
	David Lechner <dlechner@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: Re: [PATCH v3 3/3] iio: adc: bcm_iproc_adc: Convert probe error handling to dev_err_probe()
Date: Sun,  2 Aug 2026 16:05:20 +0530
Message-ID: <20260802103520.114582-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260802030433.696454fe@jic23-huawei>
References: <20260802030433.696454fe@jic23-huawei>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_033549_872899_F1EAA8D9 
X-CRM114-Status: UNSURE (   8.06  )
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

Hi Jonathan,

Thanks for the detailed review and suggestions.

I'll address the formatting comments in patch 3 and also reduce the
unnecessary churn in patch 2 as you suggested.

Regarding the suggestion to convert the probe cleanup to
devm_add_action_or_reset(), my intention was to keep this series focused
on the dev_err_probe() conversion and submit the devm-managed cleanup as
a separate follow-up series, since it is a larger refactoring.

Would that approach be acceptable, or would you prefer that the cleanup
be included in this series?

Thanks,
Shahid

