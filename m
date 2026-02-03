Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251B0E83060
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 08:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8NCYqdOlT9sFa8uH7kXNnGKZoNbj9Xsd6uRR6nTxrdU=; b=2T98JFmElamgTzeSkLUAXQuIcQ
	h6uodfmHhxLgKONruLA2hpaIYkHeg0iMBv10EuHLEJ2QXr91yxU71XVvfJF4M0SrUkT69VAKZa9PB
	E3xtLURtvCnqKpMwPNc8x6vqtu+wyiJj9y6qk5J2zPpL1aWeop8/rjJ7hcGEKnxaFvMqvUbw+7m0T
	YVahBc9+L5zyDxTby5yhq+xxG0yQd3Xufvlb/onQdfKS1gF3Q3wy6SonpGEBERSiajknWQo+rPsSM
	kA6s1vYjicQsgIUwrl/Msz6VcdgjKeunfN/oovnu95CZRu3es6hPEbrTyG5F7JO7wT71AKhuFwq3Y
	4JWpZ72A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBw0-00000006KBQ-1RzX;
	Tue, 03 Feb 2026 08:38:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBvx-00000006KB3-32l4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 08:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770107930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8NCYqdOlT9sFa8uH7kXNnGKZoNbj9Xsd6uRR6nTxrdU=;
	b=b6BO+VrdFm2078m2HEU6ImRkWQrOUMim40ZH1uO/ouRFUoGQR+rT4b1NjmASqBjqBkxEmU
	U+YiRODpfWDr1nZlko5XzTjWDS9MakA8XWjw236nnBHuO4hknBz5qKFanRQZKMglfk+IqJ
	YmkFUWgmemUFr9mfhGK4oIpGOZej+Qk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-FxdZfQdtPrK_4RAhTEk0Qg-1; Tue, 03 Feb 2026 03:38:47 -0500
X-MC-Unique: FxdZfQdtPrK_4RAhTEk0Qg-1
X-Mimecast-MFC-AGG-ID: FxdZfQdtPrK_4RAhTEk0Qg_1770107926
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-480717a8e05so53075545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 00:38:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770107926; x=1770712726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NCYqdOlT9sFa8uH7kXNnGKZoNbj9Xsd6uRR6nTxrdU=;
        b=po2LrI+AmKfHHNjzhFDAi5j0OkIooaJZOK9A2Vf18DNl7XYCbo2NdtLyVaOgOMilbJ
         Y/ISHjb3gJWaqoLtvrIbcZF6XW/RmcPTX+O79yW8NpBmpAwxvOznltBLL7JkrypYovRU
         iwzHCbSiSSy0czuzildmFrcX1jiIjmS7DlBj+x5nbHmYbWIRc/9N5X3NWY18dp/FEBQk
         czA+y44xkCF/no2HZqv/NVgn+1yXHk4J1AqTuEJ4jTAmM07qF3VO23uI1bvyUlfyptE0
         edwUR4FEBed5ztWKww9744g464xYp9+ptGCyp7DxZ+nrnwNZBlYgZy/zoE2fE40tlf0n
         dJ6A==
X-Forwarded-Encrypted: i=1; AJvYcCXwuJm6T2tvyPVuGOI+39CcWnYOPrt8uHv090RADsT5fyR3FBiMQXX3IQ2mxTuTPoALrlwwbvOQxdVYq3R3KEra@lists.infradead.org
X-Gm-Message-State: AOJu0YylQFuKwfJ7GVWuCGIFhc+eyTKBT2d2I17tNzymmnGYDHepCSED
	PuzxcdNyR7ZknaKPVoxJpN4Dzxf2UtkBUxARqgU0lUZ3AVF7y8LiTvszxtEe6lHh1Fr3yidIR9w
	LC1QQjpQUHHTO9+7T4wMy8iHUFb9Xp6/v4M7uF568qaGYAZO8uzY7Lm5w53hcRsqNblJN/oWSwr
	WC
X-Gm-Gg: AZuq6aITjF/ESAnh5d2OvcBAOC7gOIlmDVgsAOQFWpe/Iubb/7ieNqgVe0cyZ6uU2Kd
	I3bkswAQ0gvdRYOP1Jly4S6K7V9/LJ6Kkc5oXbVx1TuX18yNPF+uP0ugOdjFyaCSZr8pb0qTd/r
	8V/1wFEtsjLo8HIn8qeD4dtS8o9hxsMS4AAu17r8bSUfgq3e0/Ea7+/qoX0Lj2TJPFQBJAoQQQm
	gtcANMzJUGW6EfFtdS2/YO9qubmJOcbxNigUf3IBYHjJhGQTObUxpo4rFYU1iRAzI6RCrF/jQV0
	IyC4SKCC/qqUMFvvKyrH9jF6EXCAn1W2dlSrtFKJz+06BL4PnSG8EMm2l/SKKVS4HPheJjn4LgW
	3t+BHgXY9Uf7L/h/ZCxtdc5FyY9VTC0wdaaWfVoyIfXzrBfbrkekqhoxF+eU=
X-Received: by 2002:a05:600c:c4a5:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-482db492454mr174834095e9.20.1770107926227;
        Tue, 03 Feb 2026 00:38:46 -0800 (PST)
X-Received: by 2002:a05:600c:c4a5:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-482db492454mr174833795e9.20.1770107925792;
        Tue, 03 Feb 2026 00:38:45 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482da8eb486sm138469105e9.2.2026.02.03.00.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 00:38:45 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Elad Nachman <enachman@marvell.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: drop file entry in Marvell Kirkwood and Armada SOC support
Date: Tue,  3 Feb 2026 09:38:42 +0100
Message-ID: <20260203083842.347391-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1n3491aZDei9kXIvSNDid3_ojH-JkjZnaBXeGjTbkks_1770107926
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_003853_864293_88DD355C 
X-CRM114-Status: GOOD (  14.97  )
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

Commit fcaf733ca526 ("MAINTAINERS: Add Falcon DB") adds a new file entry
referring to non-existing files arch/arm/boot/dts/marvell/db-falcon*.
Checking with 'find . -name db-falcon*' and the files actually added with
the commit b3370479a5f7 ("arm64: dts: a7k: add COM Express boards"), which
was part of the same patch series, the files intended to refer to are
actually arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dts and
arch/arm64/boot/dts/marvell/db-falcon-carrier.dtsi.

Note though that there is already a file entry for
arch/arm64/boot/dts/marvell/ in the ARM/Marvell Kirkwood and Armada SOC
support section. So, the added files were already covered by the
existing MAINTAINERS file and no further file entry is required at all.

Drop the unneeded file entry, essentially reverting the commit
fcaf733ca526 ("MAINTAINERS: Add Falcon DB").

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1d6c1df42bf5..0c474d8f62ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2989,7 +2989,6 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git
 F:	Documentation/devicetree/bindings/arm/marvell/
 F:	arch/arm/boot/dts/marvell/armada*
-F:	arch/arm/boot/dts/marvell/db-falcon*
 F:	arch/arm/boot/dts/marvell/kirkwood*
 F:	arch/arm/configs/mvebu_*_defconfig
 F:	arch/arm/mach-mvebu/
-- 
2.52.0


