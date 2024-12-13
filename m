Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E250FE77180
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 06:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TWteF4vrF1/pE81Ren4Vt30zPczJ6J6JzqVwaxLGNdQ=; b=DcaMyszt2+x0HIU+IdIqeu8DP6
	HBy1d3igpqllLv9KIYtL8FHKW078SBOBlYj/t6idvmYR8zXziYFeQAggk8E3xdp4m4wfRVQYuBuBs
	Az+S4XKD6hJnYEqr+WPGh5+u4lc7XSx6FxNwB/vcQlUxmYwY3zH/r/IiqZM1vm+LrJgMRe7ZJWBzL
	V9bpJNQ+66kOFWCj+8fJixeZoGd9/gMrZ11G9onVDzJnob6q3aDQesJUk/nUF2T9zkQchzfVCNF4i
	MXVa6DjKk1JvittHDENC3S4zd0RWEMAURist1O7i3GyjRyRyIGWysg9NCWkneHToimT7eiNbitnCq
	AaDrSJsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyld-00000002pOb-0bs4;
	Fri, 13 Dec 2024 06:03:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLykX-00000002pF8-0SEf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 06:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734069723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TWteF4vrF1/pE81Ren4Vt30zPczJ6J6JzqVwaxLGNdQ=;
	b=JFglt242CgyKiihndtJNKHaU2S9Ravma9qeTBEsKlcdS36mhBQlaoxTjareO2nKpXZ7wnJ
	Zor1gXjSa4/z1fNd8A+huJ8iqlP15hkfjbj4UVxIyJ/ub1f/jN8sEiWi1BmrltIMBWiev8
	VB8PV9/Awho76igJenuNE1R6tECkpX0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-A5g-rwrlPjeQONapPNipWg-1; Fri, 13 Dec 2024 01:00:24 -0500
X-MC-Unique: A5g-rwrlPjeQONapPNipWg-1
X-Mimecast-MFC-AGG-ID: A5g-rwrlPjeQONapPNipWg
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5d3ce91c403so170323a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 22:00:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734069623; x=1734674423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWteF4vrF1/pE81Ren4Vt30zPczJ6J6JzqVwaxLGNdQ=;
        b=ngRoFM81/vnZ5Fcy1QXXzCPXFMvVXrXRIgop0zrA1jAnA/uHdnb8EFIPNuMYF2cKw1
         sVszjoSPopAflzeHBLAFbvmEGbKiT4O9h4XRF8x2W51VwvQCWgjy31N4su5mUk38M4Mk
         9SsfLc+5HGZkgVqSooW8NP+p/ELzzh9JKfNswPpIQG7lMuVm99zIkx2r2r+phfhhYYzW
         mdl3tgoNeVeYUMmQ2lMhfqFFIB2CITH/lddFgPL4Is5cukZV8ruEUwC6gdCgeodQohzP
         ccb8fjjxRHP9rjSLFq7efG0Bd4E4yfhRGV313uC0yltV4SwrZwFjOLdtJn2zWHAJQHwY
         rIGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAbIey/Ad7c3K9MYQzUd5V9ImSn+XNC4dzCDVOweNhQor5JJMmqewa5fLajaIyrXcvOC3c8Sh5xiBGlPhHdP9+@lists.infradead.org
X-Gm-Message-State: AOJu0YwA1l57PWXtDwrMsGl5pLlUdHU2umto9BUK2k+d4MDvNAGJQpX3
	lK9zCrMe7AQc8Mk0ywlI9WIYLT8nwVJ5hGE4e2ESOsnZNtRirT5DZtsJUNU5AeD5H1N8txsFp3h
	oDhY7mQYjXAendLo5mBRl+RBaAulxlbVDtsXUWxFErTerA8TwRs89AQVr7aF3/M+1jKUYwAmw
X-Gm-Gg: ASbGnctF7u/kmuSh9zlyvLUMp9QsOpkcKeADDby2m9eV0Y+OBRcD0Ru+C1gDBVleUS0
	qBPzQlGMJY3fQ2qzPFJDx1DAyzatuz5NHaJooit8d2RdxmB1rwmQyBzDHmZ6RwmCjTbH3x1wsgW
	orV7Asu5AHx4ks/jlQBtkpbgzWgT+W1yW6U3VsE9H3BOtOxriBn35+k4gycNWojTzRIVRK5aPi1
	If4WnerafckX467uiapb2IKp04fKUvxdIQOaKdsQjcLFwuQVxxXFJluLtOcOHmXOEM3M3/iagpk
	N49/2QkI27QIeCgtsQbYsJBN3EHA
X-Received: by 2002:a17:907:1ca3:b0:aab:7588:f411 with SMTP id a640c23a62f3a-aab779c8bcamr130015566b.25.1734069622966;
        Thu, 12 Dec 2024 22:00:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXwxJQVizGE5WgbyQd8OUq9Hy5FwjaQj5sQqA5agUSpWu1Zpe7/5Tw755l4EDxVsme0PEmFQ==
X-Received: by 2002:a17:907:1ca3:b0:aab:7588:f411 with SMTP id a640c23a62f3a-aab779c8bcamr130012766b.25.1734069622555;
        Thu, 12 Dec 2024 22:00:22 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa689a0a6fcsm648156266b.30.2024.12.12.22.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 22:00:21 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: repair file entry in MEDIA DRIVERS FOR STM32 - CSI
Date: Fri, 13 Dec 2024 07:00:11 +0100
Message-ID: <20241213060011.67797-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sGX2EIdvQzVlLl9xLVH4I1n2hcx1varb4pAFWAJd3zo_1734069623
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_220205_205612_DCDFF084 
X-CRM114-Status: GOOD (  14.77  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit dcb0f4c16be5 ("media: stm32: csi: addition of the STM32 CSI driver")
adds a new driver at drivers/media/platform/st/stm32/stm32-csi.c, but
creates a new MAINTAINERS section MEDIA DRIVERS FOR STM32 - CSI with a file
entry pointing to drivers/media/platform/stm32/stm32-csi.c. Note that the
file entry is missing the ‘st’ directory in its path.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference. Repair this file entry in MEDIA DRIVERS FOR STM32 - CSI.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bff3d35f80b5..230b7a4ee95f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14551,7 +14551,7 @@ L:	linux-media@vger.kernel.org
 S:	Supported
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
-F:	drivers/media/platform/stm32/stm32-csi.c
+F:	drivers/media/platform/st/stm32/stm32-csi.c
 
 MEDIA DRIVERS FOR STM32 - DCMI / DCMIPP
 M:	Hugues Fruchet <hugues.fruchet@foss.st.com>
-- 
2.47.1


