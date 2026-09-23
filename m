Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556B6C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSdVTPRqn06pkAsO84XJHQb2v3v0xthABnxiNhSpNuo=; b=N9V6jNSSpwDZToZNbzmNHv/uYk
	yDXgUDYykGavSghBmbpZ8UYpkvDF/2EpA8hs8I7ekFq8W4WrnPtMvpaDplEvXiPGLDiBMLe1ig9/9
	9TjlUTowyZ9E+Sdg92rc1ZJVuZQc1Od0vzdBy5Wj5swumGTXRu9r8KX6/SOtaGMZqdMqaCIhd7VAQ
	IJNi1tyq8oGM6s6aapye2bARA9sFz5j71WDm6rr8ik0/DPTP0YCuGlD3ynljYyU3fx1wjvY70CVrf
	1SI0elT9YY0Cm8V3TjfMpFYwpUI4xo8DujjcHpJZCbMLYYLDLtdB0mciJTD4ajOs+1wiLubsJG5nP
	jx+OdN+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TVI-00000009S4o-1wIN;
	Wed, 23 Sep 2026 20:23:44 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TUn-00000009RqM-2VFd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:23:15 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f56039dso204129766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194992; x=1790799792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSdVTPRqn06pkAsO84XJHQb2v3v0xthABnxiNhSpNuo=;
        b=c7+Q0il0WZ4NH5Abc9ubf8W+GDsvAC1dM4z7WxGUFZi+ON2rokb4mG2hLIn+uq2CVt
         RHAWu1jRTV428yzZA6eLa5rxJmYyWRsPmRGlvs0YewWt/vJBr7C0Ca3812HRW5eu0E9p
         h6TLR8DX0tjvp07gJaems9/uoI1g3Dhgu0kyeHIRR8hN/iO4rp7CIKoalLHZBFCtiLyJ
         BDnWnzLrVv56DQz10iAgwyA8+GtJQP0cbyAP7/1P9oVWj+yqRB4OqgP5nksDy2qBIJMw
         GlmsGoJxS1rrJRJzPcFkiAsUKJoPnW95GwfLqdu3s9/t7E0VVKJXdK5FZj80WdzOq6nw
         DsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194992; x=1790799792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSdVTPRqn06pkAsO84XJHQb2v3v0xthABnxiNhSpNuo=;
        b=av/qrqIvaml5TguimSYtiPrCXdmGjt0tkga9ypc+zchyVap3UGfQsQydzeZrjLT7BG
         Ta97oZmjbrjDwn1h3yhqo9/pw/WWoBGLUIPhYac8l4AZd7ZKg0xlWg5aikUmVDpoH4+M
         A1mhBgknOezHTV2IsaabAveNiskbXuMX4XkgpsUNUHcsRCHImYi5/i4+Om4iulFsv5UJ
         lXSdIlom7+FPEEIK5IEjEE7Dm0eTsRtZQCqIiNx/4rPuQRu4XA+cV0SuR1HzDyoBQmZo
         SvK8m1hq+q9qMzjY4iOAIV136qShKm4v7jPBrtk1KoM4S/fXxSQU5Fs5F+MSCfIl6j7s
         PJfg==
X-Forwarded-Encrypted: i=1; AKwUvBye/E9asyUmKZpm6Ye6eSLLstaiMUb2d6j2/1crdrAC/lww0a0VshcjLrr9OwL6uxoR+gSbaHcL2+M1/pOKy/0W@lists.infradead.org
X-Gm-Message-State: AFuF++nf+Ufm5YsTPoqWtzoXLCvGlgJv0mNvBX3MDJXNT0aWS1iSKB3i
	yEpR3DYIPLMQAHXD7IEb7wyTXVrW2QTkGcQSgOkoYSfjeJoNc9+pliWb
X-Gm-Gg: AYBFou0VkyVy/iogCp9EeH3Q4GgzxTXA589fYlyDuyZbQpxBu8ws9iEserihQbSQp3M
	ObJNgAAKP1Krhj17DvJgIT0ICz8w+aqz7eqNEszGuhTmlntx+l1AH6xA16fxkWYmF1+6PcLzWMt
	cejKaLUpbii6LK/g2fbBs3O06J+u8kPlJ9k3FqrquG1YhdbMj4krublbbfL3GtoVJeuVtnTYh0K
	wqeo1zi38QZBaDOd6n+qsia5+mBPT9yi7O6a8jNAfgY5p1cn9MCdTPaSTCw+rkY8W9K/rKgMpDI
	11YioPdgwtYl+MPMlOtEQ0hHiNVK8ZUwnmBi3/zQ4VIdFvu1FNY8U0Y20LkzfgL7QQgTV9DIbYF
	RMCpdFiaHiNPyUcu4cdr1l1EGxXWrDEWOhQfW+IErTb0NTkX3Oe2bLCD+1qJLl0sQ3zeYDXc1Ub
	FpLqC8mkfiD/dVnUthwDTvDOx6KGoSkgRejqijRhe09ntLRrXFZ8VbAGtIhLE2UaM6z7e9V3LAN
	d16fK887U1hIsU33Z6CnQ0YenKbyo6B
X-Received: by 2002:a17:907:e8f:b0:c29:63f2:99bb with SMTP id a640c23a62f3a-c2ac26820b5mr19501766b.47.1790194991761;
        Wed, 23 Sep 2026 13:23:11 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:11 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 09/11] dt-bindings: interrupt-controller: add Allwinner B288 NMI
Date: Wed, 23 Sep 2026 21:16:59 +0100
Message-ID: <20260923201701.43391-9-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_132313_818943_AC95F08F 
X-CRM114-Status: GOOD (  10.09  )
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

Same register layout as the sun9i-a80 NMI, like the V3s.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index bb9273ec2457..179e7842bf46 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun55i-a523-nmi
       - items:
           - enum:
+              - allwinner,sun8i-b288-nmi
               - allwinner,sun8i-v3s-nmi
               - allwinner,sun50i-a100-nmi
               - allwinner,sun50i-h616-nmi
-- 
2.53.0


