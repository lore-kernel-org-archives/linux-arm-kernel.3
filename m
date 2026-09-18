Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD8CC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 17:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1OQlNCcXAkK+hbxqoynuSjH/ynOWBUHLK9W984JsgL8=; b=dF/khrEVgIMsRYrFtoOB7Xhrp6
	aamARU6bvuRzFQZVIVyk60WeO9Df9Au63vjjFZexigxvp52iPZ/SPdgdAngDSwZDtxjSTwn9FLjzZ
	e8mOjhl0DJfOYt/qP+GDA1iDdBIYkRIeMtHxIaJJgtNBs2SoQJlZBx30fw5SYdqpkd7YLLcYQxLmf
	8MhhPCzMqen7mQSltaSG1E2XCHMBgGvAavjBQ7TS0mC89WzOWHlvJK/fjHsszlyiSqHn7QKz7htlu
	VjV26k+cIBVELFdPuXl0jYeygfpHlqKEXrIsX8cwI5Bw+GoC+ri8fQ3FE3BREfmymS2NKmv2pgasU
	ksUB5vNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cqU-0000000FEYf-0zqe;
	Fri, 18 Sep 2026 17:57:58 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cqL-0000000FESR-2hLg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 17:57:52 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485b1d2874aso769573f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 10:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754268; x=1790359068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1OQlNCcXAkK+hbxqoynuSjH/ynOWBUHLK9W984JsgL8=;
        b=PABagdAyzPQFZ/Oa/dYuNcM6tV5V7kdRbKgXgaCFZr1X4FSlsqBLt2K55z3snu/8YM
         YCt1SiXV8M0+HXCMFCNcXx3T2EK42Pcez7oFeU5BBHJxubgeIeBnYTEkATnHyhZGMQVy
         lCTfXmiWpPKJFVuY0/747R/GnwGRabA/BJiEIsBDfVKAC57H74T77n1hkIkkEObkkEZw
         gmCZuAGNH8osnHg5+sTWjbhaCmFBc7War4FWouVKs29ZoxDQkr5nH5KUt9E0BmCIVEre
         oxpl4nWAan91O3S9j3OuTOsDgd9pVovGQgABOpsFRgg/hesg1BGpGbZpNuHnm1Sl2Ak1
         cG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754268; x=1790359068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1OQlNCcXAkK+hbxqoynuSjH/ynOWBUHLK9W984JsgL8=;
        b=pAPR6KzYe94c9VS1Eq8IOTiEyOFsW9QnXN56B+MbWszSPWJa56bpd4lNOEjSJeVTmG
         7kAc7CQ0q7Ajng/xdn0VZ294cTIfaikjuQ0MYzSi/QS8UdnEorD88ty+++JhR07x/qO7
         eJ2ILn2cJlbOWWdC7ayYrb4FYvvVhA8572/H9dXu5aUwr5kmpB+Bwo+hIlyaFsGEXmdv
         XUQM1DiQUGXxQGBXNfWZwr9xtDFtwl5KVSNXpcS5YYeSRU/UJEebqanlGati6l/ces65
         5pZoLPg5i3LJZ7MGAPLvQzfFyxrLr6WbHTS08vky6b7pDMtw4B+14sNGekUZF/Pvb2JX
         42OQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7IFt6TyFwKWb+lbGm44oNY6KMj/rdnCH865EW/WGoIKSGYwDa/ro5NWfCvmGS5nm+xDu9hv+CjyBddpaqbx/a@lists.infradead.org
X-Gm-Message-State: AFuF++lB13ZVrEKhzvL401sl9ABYx+XCI4D7xQeg1qxZi+BCvZ3NElDt
	2OolJBvSGCfJG4jjbgZou2yADy3s7/mtjVN5HovmfvCwXDmQZ1BTBHR/
X-Gm-Gg: AYBFou1qtmXY0K7J0QMdz9BTwxq3fTXgHmiu9oOXhHZ8t4hYIYbsk/07JZq/ubjY6LF
	5MO8ZfFZRBpeFUk5oKeStXfJmj2FeLCgv12QqwcCqWi2gEY9oAotFUibSMKPKN90vyGx6IxhTgF
	ak3gmlMDmR74qJOnIxnqx+EKox89rTomdlSllBch5v1AUvENpYOYmUQw2yglis2B+TqkKDmkWNx
	Z4U1fHDeOgh0ihG2QoRsQHhUNPMwkzYXLPp1Rb+sWE2Xtj+7GfGCr9NHHFEE7NsZ/n1wNoSkIte
	5EYdpWG0H2HuOgPw+sgIafYNUSdPgRRkOBaldqjpmG0sftvXIeMI0vx5BJYn7DHt5Z1BRpAhuDk
	ddEtlUwEdEMImC5oVsBksDlur32Pm3MPDR7UmUnclMNSWTkIX2vLLBf6I9O1nkHo3gX/utBXVwi
	38KEQu+NFpPtabPdN4AGW/Q/7pMuyyuErG15J3ZA8wsf78XrWNRwItORGTnGDRGwX6GDk=
X-Received: by 2002:a05:6000:1785:b0:486:f282:e66b with SMTP id ffacd0b85a97d-4871e20f97amr7779772f8f.2.1789754267647;
        Fri, 18 Sep 2026 10:57:47 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm268461f8f.14.2026.09.18.10.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:57:47 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: display: mediatek: dpi: Add compatible for mt8167
Date: Fri, 18 Sep 2026 19:55:25 +0200
Message-ID: <20260918175736.355305-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918175736.355305-1-l.scorcia@gmail.com>
References: <20260918175736.355305-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_105749_695605_AFA19D8A 
X-CRM114-Status: GOOD (  12.55  )
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

MediaTek mt8167 SoC has two Digital Parallel Interface (DPI) blocks,
one can be routed to a DPI display while the other is wired to the HDMI
block. They are not compatible with any other device, so add a new
compatible to describe them in the device tree.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index eb4f276e8dc4..6cd96a5cd4ae 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - mediatek,mt2701-dpi
           - mediatek,mt7623-dpi
+          - mediatek,mt8167-dpi
           - mediatek,mt8173-dpi
           - mediatek,mt8183-dpi
           - mediatek,mt8186-dpi
-- 
2.43.0


