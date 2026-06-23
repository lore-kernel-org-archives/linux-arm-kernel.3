Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0A9CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 19:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwWnRfNKOCzBCV525CaMblQsIuzpWTFabgqtV6LDX6A=; b=eh0xg/sIy7vRkTRNoHU1gqDg0l
	LhgbjCUtENobw1yejctcYP9dzS5fkjRFKBz5EipZp4paXiYCzvwOd09BX49lD1e5mbl1N+1WLkHCy
	l/kjZaY3boOCACDyvSAXEsni9WjR5sBYzcvxiW68L4zERMb8k5WzzxF0yMac/R7AJGmJOq4M2E6uQ
	wbMVI5xQtCgiTE28W3t4JGvlsmxFV3krgQK/gnoqK56ZPId0+pzO/+zqNTdio1nzRuDJEzrRhiCK5
	dVRBtJFWB7CdU9yxmZuULZxuNLZVikJm9Rwrhn0QVcUQ8ie5fUB1p/WHFxhEfo2DSeZ12T9b0oG+T
	7u0taa7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7GK-00000006oRA-3mjs;
	Tue, 23 Jun 2026 19:58:24 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7GI-00000006oQY-2xvf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 19:58:23 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-13986d61b4fso395157c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782244702; x=1782849502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwWnRfNKOCzBCV525CaMblQsIuzpWTFabgqtV6LDX6A=;
        b=rMjyc+oiazIZHROQ8d9ACOpbAMtOaDNeOmVGhBDIuyM3rXraKorCaaE8YV3fCS7Aso
         VN3GJkhoBce7h2fz3w4cDhQch9/tI1GQeRhtF1/HqiyscDNB0kou8wFZo75OTKFJKOjO
         SdiVSBMVS949iQo1VBPKWoHtW4yEcY2gvyaxsHTAYYt0w8NDrwXA/1FsTcvq6w7SId7O
         QLJZRc+4XMbPdnmLgeNC99r1qSuue0Zbtb/Mpyr2KgNNnuGIyjfTv5DcJW6wskrRNcrr
         +sTK0YkAaMj4J+nqcsN8VBnMOQ3+7Men0qs+jCbW45VlV1hVxzLi1Z/BpZwgflxYAwz7
         qnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782244702; x=1782849502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VwWnRfNKOCzBCV525CaMblQsIuzpWTFabgqtV6LDX6A=;
        b=M2qX8XSUha2TZjm5b9hioDFWpYIg2ny5iFqyY95wt1jR9h++FWrA6wuShZOgyBX0E2
         O6413UJ4bUkbykPZ1a/ootb9hMMNX4QAl1SLa66HFfnC2g+8o3h9bByKD92NDVnvpBPK
         1KEb3hB+zSVhq1N6zD6FSQuH4j0f946pDqCPwnEBYO4uanAYcFVfQjWL6S4X8+zV4Qua
         LSe/lQsuG9fNm52o747BA8fWFENcj5krYKLnOT9UzXamPVserkS8lagSqcMJGJiAt1Hx
         /HTF/kZhu6KSUGovPAFAkUPC8h+7jeARwQBscPfBpSD4qNZFGKeR+OdpSeYwB75HoMux
         T0iQ==
X-Forwarded-Encrypted: i=1; AFNElJ+H7CQ+D6TcYk0VuiZFn9cshM5O84FsbXKvrVL1rOiwFHPt6GpElSq/4oPpzo4Sm+VaSfcBhOqXWMvBr5tzk32m@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0vtruyaLmj7UQRY/2DFfPfConcovExYdOY/VbN0KpCxMkJMd4
	hhhOqjpa1A/wwFw21DOmqaN9C6ZdvucU1kshmMliVJQW/qgNFcYFQrwf
X-Gm-Gg: AfdE7clgzdIE7HEWJ/PULaTqjM35ZAFRQu5/mz4xf1uDE7qnP33l6Topmnw6DnWiznB
	9/OgGd38dZK0tUxwWEUc9OPzP5xk0TnobD3brCPKPI9Chr/Zbsma5r72mvGLDO5yS4QfusKvo6+
	Mv2fTdGG4VYMhWayn23aI8SDMnTpQI92vgmsUxjMrQItzLZcobs+dWa03Xh4RvsXiBOwDr/akMB
	MP9chbqZXbiP/4jIq72ywEytJsLlHszqRpcXuh90BK2nl7qGItOQwtcG+qTspxNQM4tdhcZcH+d
	ZSFt3M8cHqI6VBM1KufA4gmG7J06/l3+tG1YXgSgK6c325m6VtN1m/Qo0vBwG4gWraTViN4wGn3
	sC8lSCpHmiMocGdwg/F3mL9+i3zrbL5VmwotzfGLqk491Ld1a1BWhDsbnI5Hn9xJel4fUk7msCk
	4TWGIH3KXbK7zw1JTBcVAkL4OSJWsHxhyibtPzGxdHdOanApH40A515pkjWxt9iLMK+zXirDV0Y
	+R5sVHU+JhRC0jkGFwElUUhAWV0oqN0VCYAUwD0K+c=
X-Received: by 2002:a05:7022:410:b0:11a:342e:8a98 with SMTP id a92af1059eb24-139d0b58d17mr176972c88.0.1782244701970;
        Tue, 23 Jun 2026 12:58:21 -0700 (PDT)
Received: from leonardoc-nb (201-68-197-145.dsl.telesp.net.br. [201.68.197.145])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add85c40sm15730896c88.15.2026.06.23.12.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 12:58:21 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	thierry.reding@gmail.com,
	sam@ravnborg.org
Cc: leonardo.costa@toradex.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/5] dt-bindings: vendor-prefixes: Add Opto Logic
Date: Tue, 23 Jun 2026 16:57:37 -0300
Message-ID: <20260623195741.495734-2-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623195741.495734-1-leoreis.costa@gmail.com>
References: <20260623195741.495734-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_125822_750331_2A4CA331 
X-CRM114-Status: UNSURE (   8.91  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

Add vendor prefix for Opto Logic, a Swiss display solutions provider and
printing systems manufacturer.

Link: https://optologic.ch/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index dd94c50e97f9c..ce0607afc1f4b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1247,6 +1247,8 @@ patternProperties:
     description: OpenWrt
   "^option,.*":
     description: Option NV
+  "^optologic,.*":
+    description: Opto Logic S.A.
   "^oranth,.*":
     description: Shenzhen Oranth Technology Co., Ltd.
   "^ORCL,.*":

