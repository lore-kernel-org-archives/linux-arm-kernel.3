Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811F5C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 23:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nkXfL18wjL8DTexX95EbzIZJDQIzq4nnjKVqXhVM+tw=; b=MrF4RFqtoKSQuA
	vO5P5w049cdt9gTUyIpcie7jNwTXD8feYBnNbPq7+z4O6ovRg1ldTUuywX4JOchTvG9IBi4JHan70
	2UKt1ROasIoOtHNGAkmrj5zIWguj4WSePHMJ53YOUeFRLKNpM2ostVKC1+dXnRTHgS7hr68vpNFkj
	sSc2if6HtRDq3rAjJOWnCVoenu8/ZaMJ/UuHpu3/+QzCZ41vJu3ceCWzCHqxsOK218sJxZywQpggm
	RG3ETYEKFfSEglewFBgsmN5I9rKgWI2RSQLyHU2jY3c3fGMfn2D+c1D0oAOOhWcqfgTS2iIK3K/4n
	Rm2AW0xfAgIgwLVEFlaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtZ3L-0000000D0Is-22kC;
	Mon, 10 Aug 2026 23:05:07 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtZ3I-0000000D0GO-19Rp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 23:05:05 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7ee125ec926so197559a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 16:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786403102; x=1787007902; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nkXfL18wjL8DTexX95EbzIZJDQIzq4nnjKVqXhVM+tw=;
        b=dHyr4A7csGGUMI93LeyDiBhB8aDNHmwNDSwnAWLMR5gDNMfYOIyP2Fv8KY4/uytrlr
         O5FSAyXTfTCFcPhYmq3UuivuLe3a1mcGPRItQau1dPJZld3HGwptjlrbzL2bwmYyxkmK
         +SWDOwzkd+TObEbxQIsfToMrRfcLp6HYDfRJL6UT6tQWFsnCN9Fl3WZUAHqEJVx63fDS
         5FUbtsMDxg06aRDBgRcW6bpDTP0P8AVBZ/ZcR/4zaiUw6FAQzx9JkGJYCjGTP9U04/s2
         RIDs58cEFNEfJyceH1WqHthsXkvZfpqHevfAcJvEfxKNZaBQu3kNLPbSA0CrRa6WvCSK
         WJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786403102; x=1787007902;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nkXfL18wjL8DTexX95EbzIZJDQIzq4nnjKVqXhVM+tw=;
        b=GnHVEYaV5Ofq+g7Th2S/ArRMIoYj0o8YaDm3kqmHWArID61UnI9I3u14tfYDQQPPJE
         Wy1Ehxo8WKnJbKZTVomkyQf2ng0EpezsfPcA/d78r+lk9PKP7+rM9UDrc+V4dU11wxSi
         N+8eO3mlx4KwK407C+XGtkfIcq+yWPrMt4DM6RzfZc5JWNb8rC/Ux7o5Q1/g/Em+yG1H
         nNXlTqs8u/h78mto4MLOLXMhcK5oa3GckVKpXMJJGPeXv+6+jxxXPpx6g7Q88t3gxxzu
         wOi7/Vxf0/qxrHOBOJJefofK/CczhNT3uS57E/M9X+M2+4MYkjvyNR3NZZ/7BuLs76Y+
         Dj+A==
X-Forwarded-Encrypted: i=1; AHgh+RooOS6UCP/T0UXfR8q/biSwGPO9RImrF9U8zOw3bQEwq4a13T7yOaY/rPPK0nHN2ueqGEXt5FBiwN3XCvTFWbiU@lists.infradead.org
X-Gm-Message-State: AOJu0YzBWKhLrEoJW0HmBXAaOtvWamIr+nnHaqqt+F0LnrK9CbZ0FUpx
	cjbF9R7XAUS+cIuSEQLZVdRfGDxSnrzDj/urAPk9Mz1InRM7LyPcNC3Y
X-Gm-Gg: AR+sD12A4/5aQyUeJVhL/dWvbVqROSkym0K+n/mRGtpN595CqxRnWHAprHIwu8Wk8aK
	jl5egR+Yz25GvZubKn9ugd1A8670uLJJxFTprj+1HJbNTpObv7Huj1eboV2Wvrk7v0rlUExfHbI
	d6w+4x8Wv6TmIQseM3uS6i++e0hZ85hM7ubZnj3XPUDgoa5MCKl7GXxAgUcAxgU01LL+E/iEukW
	uoNDlJjcWSg73KDVLATFxNgyoqFlb1JudKJa3+A0iqTAxC6n17si5EqO2xgT7VkRmsU2C7i0mD0
	X5uH1udUAZ7vJopnjSBXxSRfoT/1rs3rUjKeBGtdiiTwlZE9JnrCzAiTl+a/GWm3scCUg0blLIv
	CrT06BfTlyNn2PaOFAk8oI5q4wgwKcDhCmFPJhZ6bKmJN9vwG6gkQX7Ki5xwyPb7rD8DEfhlCzT
	jsRk2pwtkcu6gCxXrCTfO+OKQxIUeaUMUhvBKXO8cXP6mBPgt7/eSj9OvfLXivHoM5tGVFh9Chn
	zSvIptokX6c+PAc0vB7pvptT7Sv/mtTkFPgO1IHdXKeCo1G+cWWaG8yz5PQE4SEDiJddOYZzMfr
	StsRDNYg7z8hKMRt2EaGSs8CF8lQXMTAWF14u7FHJJoioChy9ZUXsLcj7+D/RS5jL7cdcDg4Z2X
	Ra+xJDCCLc1yotJFWTN4Q+xnqwmGi
X-Received: by 2002:a05:6830:3913:b0:7e6:d0ad:5254 with SMTP id 46e09a7af769-7f1e5d8da15mr33431338a34.8.1786403102060;
        Mon, 10 Aug 2026 16:05:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b5a7616sm8921584a34.8.2026.08.10.16.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 16:05:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/3] mtd: rawnand: sunxi: support the Allwinner randomized
 OOB format
Date: Mon, 10 Aug 2026 17:04:48 -0600
Message-Id: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCMBCF4auUWTuQaUXUq4iLdDLqiE4kSUOl9
 O5GXT2+zf8WyJJUMhy7BZJUzRqtgTYd8M3bVVBDM/Su37k9OczT+NTSxmZF8xawioWYMMYRH/4
 dp4KVUAaibSDHfGBosVeSi86/o9P571a6C5dvHdb1A2a1yZmKAAAA
X-Change-ID: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_160504_328470_4B602120 
X-CRM114-Status: GOOD (  12.24  )
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

The sunxi NAND controller randomizes normal pages, including their OOB
data. The mainline driver compensates the bad block marker so that it
remains plain on flash. On H6 and H616 it also fills the OOB space left
after ECC with protected user data. These choices produce a different
physical OOB format from the one used by Allwinner NAND firmware.

Add allwinner,randomized-oob to select the Allwinner randomized OOB
format. The property enables page randomization unconditionally, keeps
the bad block marker in the randomizer data stream, and selects the
controller-specific protected user-data placement. H6 and H616 use four
protected bytes per 1 KiB ECC step, capped at 16 bytes, with the complete
protected region placed before the first ECC step. Older controllers
retain their existing fixed user-data placement.

When the property is absent, retain the existing mainline marker handling
and H6/H616 maximized OOB layout.

The series first documents the opt-in format, then implements randomized
marker handling for all supported controllers and finally selects the
packed H6/H616 protected user-data layout.

Tested on an H616 board with a Toshiba TC58NVG1S3H NAND using matching
Linux and U-Boot implementations. Linux initialized the NAND, SPL and
U-Boot cold-booted from it, U-Boot loaded the FIT from UBI, and Linux
attached the same UBI with 2004 good PEBs, two bad PEBs and no corrupted
PEBs. A target-timed 64 MiB raw-MTD read completed without ECC, timeout
or I/O errors.

Validation completed with strict checkpatch, dt_binding_check and an
arm64 W=1 object build.

Assisted-by: OpenAI Codex (gpt-5.6-sol, max)
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (3):
      dt-bindings: mtd: sunxi: Add randomized OOB flag
      mtd: rawnand: sunxi: support randomized OOB formats
      mtd: rawnand: sunxi: select the packed H6/H616 OOB layout

 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     |  9 +++++
 drivers/mtd/nand/raw/sunxi_nand.c                  | 46 ++++++++++++++++++----
 2 files changed, 47 insertions(+), 8 deletions(-)
---
base-commit: 15a3cbce32994141252bb4ecfe3ff3a5d22d0b4f
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


