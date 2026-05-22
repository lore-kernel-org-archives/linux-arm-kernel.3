Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF37CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 09:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=951wht0+W1VQnnLt3d/D9/zM6BZV046xXYoOH60ZRZc=; b=KMfqoVYhA/9xKZwbkzmMytSOJg
	DfmNj+NoXekV8Z8hXS0zgETF+agfwEg6vAXfVjU121Q3NGKpNPovzSkBfhVbsjZwgrwO9ftIcUKAF
	4ch6mlVB8E0+wma9d72/rSA5kcPzJV8ggeAaDVgAdBD3CMwedc1jBhlPJ+ghxnLKDzM7jjBpE8lIo
	r6xTIp0tcPBuzvnA9EWYdImFZ0Eskna3K9EfJgsA9skkgEk9lNwDuX0VZ9CuL3gmqP8uYTDSLRtKO
	TkNqELyHUctkuBS8i5HD4P8TZKpzVJel0p22ff1PlfP1MM63PbYPFa8yHSXFLL+1ErsWemUAXCVoV
	dG6+/67Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMaE-0000000ANRe-3pR8;
	Fri, 22 May 2026 09:54:22 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMaD-0000000ANR2-02uO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 09:54:22 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so2942994b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 02:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779443660; x=1780048460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=951wht0+W1VQnnLt3d/D9/zM6BZV046xXYoOH60ZRZc=;
        b=f1l5TLhMAGgCecYaw6lsbBFvhS8KbkQJCZztG2X4nOzLUMVnrcv763X70Mtf0WYrTR
         yJzeIvu5Pnxq5vIE+ns7KN4loYAoYh4gOkcvIz3Mkwv2sJwmDKv6G3KkGqbU37nGjm2j
         tZMIvQ5xXj1sq75yehtQu3DoAPzkbBv7rbKbxBx/2C6UjudzfjT+dtefq9io3VluKCe8
         WKkKaAb3pEtYPGJBhnekuiA7ZAEdCzUrz5XM0rlAaqI3xMEO/1fXBX/IqwaP8DEH7Md3
         PBNfGtLfabMI1Q1fRXTcf5afzlb969mcFwod6rSSK9f5EWcMXJelyj3jGYYCVVqV9j1x
         tUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443660; x=1780048460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=951wht0+W1VQnnLt3d/D9/zM6BZV046xXYoOH60ZRZc=;
        b=lQjwb8/mWqgNFatVP2WbYNwqDKJHpcAeEhIrst7QSsRWmkQIf4I81CdzxbPJ9Ba1PH
         HvsNsQ+YcgfzIY4WZ2kRM+9r6/8i+AnJc1qCRQlOGCSDTfXnydjFMbf02+EKEpgTXytU
         nMRPIOOq1gOQANaEwXlMvtdS3yWLZ0ePM5IQwPdD8IRbDA9W36SiMGGH8H4XWRejxxHr
         fHUYBN+Tj1VuqZj0zEZSc1efCGq+o51ujC+v0HBEqngnOSoQIyFu/F7FiMo6u7sSln5s
         IIiEdOpNGN0qOeG6q/9r5b27OdlKkCVDIU31fTiT6/SAOpFqZtW86PTbXi4ZwgK9tARx
         3QXg==
X-Forwarded-Encrypted: i=1; AFNElJ/pE9rHBT6hTY8hMhHhWuy9z3t/XQ6J8RqHPXWMB0rsWc1qqDbunbGgUyTLg4bpJWeLAvyqINM/AbBx1uwQfv4u@lists.infradead.org
X-Gm-Message-State: AOJu0YxVDedl9ZWUJOIQlx6gyb49UNY9kxN8YWX9i9AVm23WNk4l4zIX
	t0f/DNkIjge+AdaEGn7Taa4uH74g3m5MMyc/D5vTz+H/iAeudEO4ru+Z
X-Gm-Gg: Acq92OHoLajagWKEyO2PXkizQOfVaesyMl+UY/XnP8GH/+CZ1y91/tXqzEGYOlkLZmQ
	RLpjynZ76qssqqE01gm+z3B3AM5Ru2zhdpXqLMouoSpOzBvXXhUmwvpm/zZ5qssAeeBZtLGNV2k
	OXZTSiX2hO1dsOUc3ZZWVxHBYb2LzviTdUgS0aydvr8Za1/NlZlaRXf5IVVVZGCS1DmfAPAHxOV
	MiAniEDSe2OcN8UsUMS7FUW+oR7Ec7gsfRrtln1dUww6IY6VmB/XpPAUdjq2/vCrZ+a9+A2GRso
	LkIBAHAp9WQYzmj2CYyg1uBcCiaPCaZsLZkg4o83VlL0FYf/3I637l4V8/Qk+jC4CXH1o3TCuDk
	4lFIOQMzKeT9sKQIVuS1NNSYdeQmJu5d0eCepOFfDckKmmzxcjJp9Y2l6uJN1lfuAP5tW4FApsd
	lwsjK30hLOp+PflLI0GIKVUwrCRQ9A7CfU4vHwlTcuT8cEzsQui/TauyrCWCXgOk9HWG8m
X-Received: by 2002:a05:6a00:419a:b0:83c:5e:f647 with SMTP id d2e1a72fcca58-8415f5a64efmr3131038b3a.29.1779443659746;
        Fri, 22 May 2026 02:54:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164aed7c9sm1757366b3a.13.2026.05.22.02.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:54:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: codekipper@gmail.com,
	jernej.skrabec@gmail.com,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	nichen@iscas.ac.cn,
	perex@perex.cz,
	samuel@sholland.org,
	tiwai@suse.com,
	wens@kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/3] ASoC: sunxi: sun4i-spdif: Cleanup and runtime PM improvements
Date: Fri, 22 May 2026 16:53:58 +0700
Message-ID: <20260522095401.72915-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_025421_055519_687347CA 
X-CRM114-Status: UNSURE (   7.62  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi,

This series contains a few improvements for the sun4i-spdif driver,
including guard() conversions and ensuring the device is resumed
via runtime PM before kcontrol register accesses.


Link v1: 
https://lore.kernel.org/all/20260513105003.81880-1-phucduc.bui@gmail.com/

Change in v2: 
 - Switched from using guard() to scoped_guard()
 - Added runtime PM handling for kcontrol register accesses.
	
Best Regards,
Phuc

bui duc phuc (3):
  ASoC: sunxi: sun4i-spdif: Use guard() for spin locks
  ASoC: sunxi: sun4i-spdif: Resume device before kcontrol register
    access
  ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence

 sound/soc/sunxi/sun4i-spdif.c | 76 +++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 34 deletions(-)

-- 
2.43.0


