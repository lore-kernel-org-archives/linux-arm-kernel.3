Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE8EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 19:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXS6IlzCXXiWTFVQaBT3Lr0CwTpzt5HQ3tRbwjKwIVc=; b=0g62VJ+paqXK7wDbEbrSccpK1H
	3kwnXLyWbyWaxHCQaOKUufMOZPGBxhzxHWRdStqjO1uWvRLK7cI3VX7hUiQyvdeEtOQIZn1n3Apfy
	IhQjQOzl6XpRwPXo9BhARzejrY5aPjcd+swDDl77/sX8H92Y4KFZC3Qzp4rDBbIuDU2w014nLDPpG
	Pw/vECFlSRTlIGUTxuhsSsx9ZwmLlt63sEGyJD7WyciBciDIZCJXs7sHHJIqBqM26XAWP4LwDItuP
	wtZC2WTEpe8FfEZLLQtrrsJCaTqk9LvWduxdc64vEMTEgbqnis03toEwKnh397uuUUblTMTisASS4
	01Uq9TCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucUAt-0000000B04A-0csM;
	Thu, 17 Jul 2025 19:21:47 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucU61-0000000AywT-0NyT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 19:16:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4560add6cd2so11205765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752779803; x=1753384603; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXS6IlzCXXiWTFVQaBT3Lr0CwTpzt5HQ3tRbwjKwIVc=;
        b=Kh+UL4yusuebyGsSQvOkUYbxLQsSKfVPuR3XIRlqQu+pqR+1rOcvEhnptqHHcgVNu7
         saOF80V0CNgGLZMggxCv0xoa+EruaWyYDMMM5JbmcPm4DSQN6vOici/6Nvk8U7huGUcH
         4sz5WJAoxABNy6ZRQatJ5dDm4lVdQD1rznsDNswZjta/o6PzA382ly3kK1mqZv83OJKs
         ikeJoQtxM50GPTymnkKrEsuQB2rtgOyLlj5mAMswpxrr5kSR6eTlhXzAiSFOhtrp7bcD
         zIPmyY+9MLLQEUHy41leiNfW01rRPEi8HpZYRWB9de7opMorFou9Ig7bBa+AQhKybEis
         mO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752779803; x=1753384603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXS6IlzCXXiWTFVQaBT3Lr0CwTpzt5HQ3tRbwjKwIVc=;
        b=Z1bFB7ZgVt4ZYCe/9rWiPPSMhM7eL6qfEL/ZKfWWCtzt5bz/+5kZu23YNCgIzBMdpJ
         NHW8Mbo/VDj6UlEPAbj7R7aSe9Z+tP9/jsWqa0BAfZfbexZOyPUH4NsT5hrdl/fVjPUY
         OyzLNlJgOWNaK7cvsL+fGwbimrrMSHmUJMCLvXIglEFQwfkLQJ+40W4uKpIxYbjQaZeR
         iXVmuz6oigI1ohoA1ENRL8uzJx3FWI+cPHA2Ji+BnuEfhGPTQW6ohXgnsiwhMFbUqH7u
         qsOEq1cyolTRIT8OWinfLUpSVKXxGR4vCRBBrCGmxk/x3zPxahALxs6A3aFYfUpS0LXE
         8oBA==
X-Forwarded-Encrypted: i=1; AJvYcCVY9NhWX/yuMQJupjbABuIYF+Zzfb0UPZQnm1nM1dU5LKj8YP+itNSHpRVsm4PFO+Dht9EIqhjLePyRVowPFDN2@lists.infradead.org
X-Gm-Message-State: AOJu0YxyvW0dHj33BU/iamX36LJFR3fU0OqFsMUK3Fq01t63k2MaxUNR
	Hp9H6ygmSjTzT/FlQbTIhgl9yb6jYVStyWtaQgN0KL+Jz3/FhB2i28p3
X-Gm-Gg: ASbGncsPdEWSAnXUMq6nZVTd1WlnQq2eeSy+EPuj5BYlBzZwqNQNtouUp8hvK+cq+QH
	y0/QpAMmE9RNMMFxe9QKMeHmVjrZPQKUj+KdMSmTRHWUiSrEojmhsO3AP1NaOMaQKXJ/rr2yFf4
	QyV5PJwMt9PB1ttb60VFYuGRDjXY0g5MbQuGKoon5qpqL0wXs2b1KVim41/5BnMUuyTZ8AiBgkf
	ZDJxspcXuvnb9+c7bxqKedh1DF2kgHOnpJAzSF0jvL/0LIVQiQVE0GfQvbtZzTPIBs45gthYfQP
	ysXzY5wgkX82g9hwE15Q5dcZiuVF6mdm6j3zDAeuUFNDtU4tVplHe/32I295zLJT0GPAP8pbobi
	jVfCeJqpwXhKZ7RO52458UQ==
X-Google-Smtp-Source: AGHT+IFdO+XRcbjzoMbTOgsB553gBGGYSvejU7mep2+ENo9zQ9I4WEUO9p1GUi72lBKstfRX+R/XeA==
X-Received: by 2002:a05:600c:3b9b:b0:456:f22:ca49 with SMTP id 5b1f17b1804b1-4563a498d0bmr9790875e9.0.1752779803165;
        Thu, 17 Jul 2025 12:16:43 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-456278ab486sm70291115e9.1.2025.07.17.12.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 12:16:42 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Thu, 17 Jul 2025 21:15:32 +0200
Subject: [PATCH 1/4] drm/sti: check dma_set_coherent_mask return value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-sti-rework-v1-1-46d516fb1ebb@gmail.com>
References: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
In-Reply-To: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=913; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=PyB/CZMxUn55sPN3ZHQgk/pnsj+LAy/0OIGcsrAdeRo=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBoeUwYYCgacxXo0fm/BVR90qG/tODN+dH4bygpw
 oxe1gR/9UCJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaHlMGAAKCRDnIYpo1BLC
 tdC4D/9PsDag3hJ3pQT2IHv5rLHgtffYGReR75toGfxoxm1xIDATWpwXpz7AMz28dIoe7TBdrIa
 9HaawGMVTwTcwbJAUXtJUK5ZJKfKaTEV4O7ytjQUcLKE583M3ZKtQb2vNe1Hv4ATzGfW6RB7LGZ
 T6dHZ1PC/1J5esXSpzBZ3l0pHjcrrcgfWov8h1qqQBXjH24xsrn3xlIxSE7sukbSyOHlVXXZGrw
 B73Oduzy9HRac0Hm30rsQ74ijETnbiHKxzTmAN7fBtI131mv24arM41DW73wOFGomii8pcARPPS
 /ucgzpxx+oREkpfs+PFc0JHGSjj1DoQcwl5Xvvg0+CaEt73jSRxReU7z5837VahsAWJ07n9CiQn
 /WzTU26kGplGZHF6VXQwZolwEHSdquw5c45amV9Sa7GoX24lFThAOwAxe+Upa7jadOUKCbuq9Dp
 ldRu9H+6AXybqAAeU8MTZx+T3qWnJvPOlvxWrjJt+BQNcFJj2Hd87bz0gGgMzCyqlgCDUFqc5zE
 /jvw5El2+HA5ui3BTLbAMFp4edudZpw4XrGtVLQBhiP1qtzTzrkBsZsDXYkuv+bfpeIOL7trQU1
 baadlcUS+IgxC4wNKOqw8fkdXP6H1g866ElvJYPcxKALSNovXCapIeIeRWxadbIdbquNk8ki9uz
 z04oBK8+NQOGNug==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_121645_136207_705F35C2 
X-CRM114-Status: GOOD (  12.62  )
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

Return value for DMA allocation was not checked.  Check it and return
error code in case of failing.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/gpu/drm/sti/sti_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 5e9332df21df0db30f10b7a6f5a41cba85c4f7ae..42f21ab91957b38cb9aef012b6ee7f4ae1683edf 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -234,8 +234,11 @@ static int sti_platform_probe(struct platform_device *pdev)
 	struct device_node *node = dev->of_node;
 	struct device_node *child_np;
 	struct component_match *match = NULL;
+	int ret;
 
-	dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
+	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
+	if (ret)
+		return ret;
 
 	devm_of_platform_populate(dev);
 

-- 
2.50.1


