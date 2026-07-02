Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C78FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 21:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hvq8f3W/S8SM2hfryHlRDSpp/ikQu+f+Y5+keswTDg=; b=T3gw5NatRSjn3Ygimk2OgXcVCd
	VogBPjGpB+1UIPgRqukF0BmAtKRzaYH/5umJcCd+Nwl8W0D9zTLIzrgptOUEzO55c0LLJXTDfgKMr
	IJJgg7YU8v0CvL77g/qHVGba5qtXkHk9NpvISc/QDS4gdrOmjPeHU5kS9GlZmZCQAJ9xDV1gUeuPl
	pwGJC6HuAQsh1csaH7WVbH3D9UVeVlfb4WTVtTISfv1BP+MMUNe/OMQ0E6vX1+5S2s6pBWfmgPG5U
	2kRceP1aj5Sd00S9B5q+Ak2kUULYyc9wpyubgm2jKXZ+zrfJ4RrqE61ecO0AdiROD/uOcBUej6HXo
	tLWgqxqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPGO-00000005Z9I-3x1y;
	Thu, 02 Jul 2026 21:48:05 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPGM-00000005Z6o-0Pq5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 21:48:03 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-6651bc5730dso3457074d50.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 14:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783028881; x=1783633681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hvq8f3W/S8SM2hfryHlRDSpp/ikQu+f+Y5+keswTDg=;
        b=NIHSz5pJkXHpdgS8KPsOvaihOWoD6mro0BSGzQqdQhhK8mWOzHXObJHRNxabvPuATX
         GNzB0lCfpeXP4NIA4vleAz+fbcGKve63aTdQxjYOB/wctW/iKLha4uZNifs3OKxy7MeM
         sQ0+ylsMaBVi0wbkRewHOhMbY7HR2PGHi6zw11aWTIakZbVx474kvXeXCEPij3lGZqty
         TEa3vI5nfXheXee+5L3u1mzCMDZQ/RZUhCCsQLydRysXQui2gVS4HJlkRnz1+3Xbbk9L
         DvN3JNJ16EdVkQD1tl7CB82fnEeLDiFE8Cnn5iH5IU7sv6Jy0SwxFn03NP89dymvye3c
         mAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783028881; x=1783633681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5hvq8f3W/S8SM2hfryHlRDSpp/ikQu+f+Y5+keswTDg=;
        b=smv9diCkIy5WkRFi7ycDJHiKZaZOJlls7Vdo27BO7z4gLp4wqFxXPG6ofqZmBaIw+A
         GoSLpy1k6moUmEZKI22lxAWNw/sGilujoakNR77hti8wZzJJsicERVxTMJy2Elm4N9fR
         IJop59fO/LuWqLqoaAKKwKd4bmGi67pPDWBFhPqPeeREnXqwDMVZRRKhkOtlEZkKgiw8
         9phL7mbol6U4acKkmX3CnhXwNrZ2evN9tW4ecBzrVExgb0XKOAgJDwaEC2T9AE8lLcKp
         lYfi6tFu0DJVm0uguRGfEDDH/70W5sLxzpwwIAqJnl090vIoAw9+prwZW2poPUwzUDLL
         XJKw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8Lz1xhzLN0YSS8YgkDlKTtq7UvbthV23vEgjQZb3izT92BK1hDB438K6+QEHcWNfDqAZiOU5ZNjLNM6s3Y/6k@lists.infradead.org
X-Gm-Message-State: AOJu0YxqY4iiefgpSVEP/tUy6Y44q9Xms32VK5/ayUSujNotIqIP2MaR
	yG6x/YQ33xS1gIQHmfOhdUmY0AYbj5Jf5ggaVJfA4GV85X3W1WCLhA4U
X-Gm-Gg: AfdE7cnB4U28BssR/eafY4FtDaQzApMtDvw7fTG3UYI8MWO/yFqyUj72y7SAMJ87uS7
	5GxTplp8FrUyJNN4UD4rPU2j6/kXen/dbtFkOKUoRlGP3NbCAVhGXMgMHej2IVy1H8bzPntejQb
	/WCTp2KtnQFdUe8TqgMb++4KY9UpvbDz2Cfh9v/8lzqWwy8+fY+OSzzGguP45MrmIM0onZZ5+O4
	DZ6qiXnT5hRGVYTmFHyfwfqo8vOcvdiIlnlZWUjCAH2j4igBveeSDe+Exzc99Bq4UE8+/skdrz/
	3pJY6GUuze7ekeFu92cjU+tcQuiNxmlKFFekj/rjAmi8HMc+Y+fgiX/p4R1HLO+zfMwlHGqHsyT
	wYSWXNCgggqR/0JsZOIWC6aWJmX/WOejT8ab+8DLu9PQTTr+Q91n6nJ3zIAq6LIr3aEC5BNNMcj
	UCrdhC2Kq+0fWStgMW5oertKRbzO2iD6mlA6SAkOYxYhq7Dko=
X-Received: by 2002:a05:690e:4397:b0:664:ae67:b674 with SMTP id 956f58d0204a3-66521bca8b7mr5877472d50.80.1783028879729;
        Thu, 02 Jul 2026 14:47:59 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:169a:36bf:d0a4:1d7c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1631772d50.11.2026.07.02.14.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:47:59 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
Date: Thu,  2 Jul 2026 17:47:47 -0400
Message-ID: <20260702214750.3428694-2-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702214750.3428694-1-utilityemal77@gmail.com>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_144802_153729_F66F4857 
X-CRM114-Status: GOOD (  11.72  )
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

The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
It is not backwards-compatible with the A31 programming model: the
control register has a pulse capture mode field (bits [7:6]) that
resets to a value which captures no pulses at all, and the sample
clock divider is now selectable via SPLCFG bits [1:0] instead of
being fixed at the old module clock / 64.

Since a kernel driving it as an A31 CIR receives nothing, add the
compatible as a standalone entry rather than under the
allwinner,sun6i-a31-ir fallback.

Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
index 42dfe22ad5f1..06656058ce91 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -19,6 +19,7 @@ properties:
       - const: allwinner,sun4i-a10-ir
       - const: allwinner,sun5i-a13-ir
       - const: allwinner,sun6i-a31-ir
+      - const: allwinner,sun55i-a523-ir
       - items:
           - enum:
               - allwinner,suniv-f1c100s-ir
-- 
2.54.0


