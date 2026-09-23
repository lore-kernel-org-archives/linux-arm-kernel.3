Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8F6C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 06:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wSYOj4Uqp3IuPS9LxFeZr5+KsmeDJy4D+uK1RvwJG2o=; b=l5l0AX980k2+NRvLqnuTrvyQ66
	L4AtR6SA7tqt3hYsSJel+abp0Mn+tCi/b1RcD1cu9q8b8Tsprbx+kOUIxQNGzh1CTucI8ysmOP5DX
	soz6wzfzndnVElRkooqcGrnbEYlZnMmli/msHO0NffC+OXlaLdwGLl+uxKC0fJYyzImH2FBo7dMtc
	IZvcIOGF5L7YYgVlIamA65moSvlgHEAk1d3JmIl0V+SJxhbRXO4a+kL3qpZYSDLjbj9yyLplF4zPu
	puhxfBkr07vvb+xs2fVFj/I4ty3mwKZHc8MwLn6EU0m7aHtp/WOGhc28IIBsj/p9HnXIoaTh7IufG
	u8CBq3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GJM-00000007G9F-3GiV;
	Wed, 23 Sep 2026 06:18:32 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GJK-00000007G8K-1kbK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 06:18:31 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so355649f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 23:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144308; x=1790749108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wSYOj4Uqp3IuPS9LxFeZr5+KsmeDJy4D+uK1RvwJG2o=;
        b=lPSnaiYn/C5SWdPbGtVUycbAqk0S76Y3gZ4CEI50NCHZ1jCTX5i6S2bmpBUoXgdxTi
         ET7WWquOfNeT9hmh30TxkgFAxDXw17ET8m9ktimW798GD/9Vx4JJzZCrv07HX21ZwpKX
         64Q8FDvP1XiWUdqRLlQth3zbnHZYoiNt+IhYv1N5Dui6PLzUcEsfPsGpCFzaD+QrlXtO
         jRuAL7gtKaTWNOzp55FkGPyB8EKGYyfCEBaElfpzazxMTTO1By4yl7SZeq5iPCCAi8wm
         v+dXIliIrpMrqc7jZzOSPWm1f/shZLFz8i1HDinF+gxL5IriEoNAUqD+4Gar4j/W9Lu3
         aHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144308; x=1790749108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSYOj4Uqp3IuPS9LxFeZr5+KsmeDJy4D+uK1RvwJG2o=;
        b=OKXDTIxyZA5myNZ9gbVyjox2kYtqBgMTQTHGeSb6s1qudyrV6TaP/LuGwEKGbLYCri
         Nd4hO9gVD3HIOe0V4OMrP2xqXiOb1GQgM7Tk/pCfDSRfvrNbFbYkIg1t5fNmBdCgSpXN
         XK4hIOkQn8kuy6nmgfQUJRjB3MQaMHWtyrXdAgib5Se3CZlRU5T4d9Ul08jVbpVT/Lw2
         niJkIFSpotbAUpFxhp8SLeOPzg6rlQmN80kRI4LAqO3OzqTZTXndHJsKYH08rWZ/Adhk
         iLmevmX38ZHf5SBBzZk62mnfagBSh/hMr/UVQvfLOUF7cHuos+FXZTS/bJ1n9K1gUnfn
         If/Q==
X-Forwarded-Encrypted: i=1; AKwUvByq/6SWKKUEt4KMFA4k5hlPvncAcavBWpe/SosM7u+cP2nsiYKQdZbud5cbd5Ob5zd5my+P3qdlkV+mP8+dLu95@lists.infradead.org
X-Gm-Message-State: AFuF++kxRJFKsV/31R2nONy5Q+tTYe79SCyU9tGzUez5pRNyYqkshQGE
	uOFZhR76H3knau3k3SQIL8wUpOILKuD9w/MONJ7iWn/qZ6CK/Abg6gqW
X-Gm-Gg: AYBFou3tECI6xhAQh/bzmh5RiFtWrJ+g3av3EM926MOEkGdk9A0RbRbOagZ4r0myrVK
	z10JYzhk6uMEWlQ0wobU9mnq1qyjyTfk953n0v7H1vFJf6RXP/pt6BNxBXjgwKEGgN3Ag3C48YN
	t59ekiBsh01bsGshVtG0mwFvuOtIgxRGWGt2usuhnZtw+GUxIN86/QEiOuGFtQ8NPgP4hd4rUzC
	XIN8R68cFvlpJ5prRLHGQD6Z0W6m+R0AFDlabGVu5nMYXa/uIf9P0HqFI+3l8AvEwGTHHze91Gb
	1la9o7Y819dJu1K93qRt65tMFxsl89Z/e9O4zmzlDXXCtcWh8TiMH/gXTuU2FXqVCyIXk0qsLLE
	gBxHZssU3S00v6afzOnULw9VH8wQbD1WTj9jVoIP4DgVlOodcJssELY9DCTRqPWufQNObwHxN0A
	O3op74VRy/qmarXzVuK9FQHMyE8shvpH8zorideqBeCrX6W6jQTJVN2d/V+D7dl9/J9dk9bGtQK
	COlym4noenmxGAF1+w0WR7G/1YmNg67a5buvqVaJLN68u1iaCsQYlZtWmv8ZHvwr86wB8F7yvRB
	Fl9t/NafkW2oVSIK6EuA8v0xMcnIYdSlKlRncg==
X-Received: by 2002:a05:6000:2901:b0:487:2806:2476 with SMTP id ffacd0b85a97d-488670b6b66mr2377289f8f.42.1790144308158;
        Tue, 22 Sep 2026 23:18:28 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-182-160.95.114.pool.telefonica.de. [95.114.182.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886848646dsm3859755f8f.10.2026.09.22.23.18.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 23:18:27 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Udit Kumar <u-kumar1@ti.com>
Subject: [PATCH v2 1/2] soc: ti: k3-ringacc: Correct ring API kernel-doc
Date: Wed, 23 Sep 2026 08:16:57 +0200
Message-Id: <20260923061658.20140-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_231830_508184_FE7D316F 
X-CRM114-Status: GOOD (  17.38  )
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

The ring accelerator header labels k3_ring_cfg as an enum, uses
propname instead of property, and gives the DMA reset helper the
ordinary reset helper's name. The DMA reset comment also omits occ,
including the convention that zero requests a hardware occupancy read.

The proxy flag is parsed as a separate parameter, and the pop helpers
describe pushing elements. Proxy access is supported in Message mode;
the listed Credentials and Queue modes are not implemented. The phandle
lookup returns encoded error pointers rather than integer error values.

Match the declarations and document these argument and operation roles.

Fixes: 3277e8aa2504 ("soc: ti: k3: add navss ringacc driver")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes (ti-ringacc-v2):
    Changes in v2:
    - Only patch 2 changed: describe num_rings as the total number of
      available rings, as pointed out by Udit Kumar.
    
    v1: https://lore.kernel.org/r/20260919163721.89044-1-kmehltretter@gmail.com/

 include/linux/soc/ti/k3-ringacc.h | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
index 39b022b92598..2de6031b9424 100644
--- a/include/linux/soc/ti/k3-ringacc.h
+++ b/include/linux/soc/ti/k3-ringacc.h
@@ -57,13 +57,13 @@ struct k3_ringacc;
 struct k3_ring;
 
 /**
- * enum k3_ring_cfg - RA ring configuration structure
+ * struct k3_ring_cfg - RA ring configuration structure
  *
  * @size: Ring size, number of elements
  * @elm_size: Ring element size
  * @mode: Ring operational mode
  * @flags: Ring configuration flags. Possible values:
- *	 @K3_RINGACC_RING_SHARED: when set allows to request the same ring
+ *	 %K3_RINGACC_RING_SHARED: when set allows to request the same ring
  *	 few times. It's usable when the same ring is used as Free Host PD ring
  *	 for different flows, for example.
  *	 Note: Locking should be done by consumer if required
@@ -88,11 +88,10 @@ struct k3_ring_cfg {
 /**
  * of_k3_ringacc_get_by_phandle - find a RA by phandle property
  * @np: device node
- * @propname: property name containing phandle on RA node
+ * @property: property name containing phandle on RA node
  *
- * Returns pointer on the RA - struct k3_ringacc
- * or -ENODEV if not found,
- * or -EPROBE_DEFER if not yet registered
+ * Return: Pointer to the RA, or ERR_PTR(-ENODEV) if the phandle cannot
+ * be resolved, or ERR_PTR(-EPROBE_DEFER) if the RA is not yet registered.
  */
 struct k3_ringacc *of_k3_ringacc_get_by_phandle(struct device_node *np,
 						const char *property);
@@ -103,10 +102,8 @@ struct k3_ringacc *of_k3_ringacc_get_by_phandle(struct device_node *np,
  * k3_ringacc_request_ring - request ring from ringacc
  * @ringacc: pointer on ringacc
  * @id: ring id or K3_RINGACC_RING_ID_ANY for any general purpose ring
- * @flags:
- *	@K3_RINGACC_RING_USE_PROXY: if set - proxy will be allocated and
- *		used to access ring memory. Sopported only for rings in
- *		Message/Credentials/Queue mode.
+ * @flags: Set %K3_RINGACC_RING_USE_PROXY to allocate a proxy for
+ *	accessing ring memory in Message mode.
  *
  * Returns pointer on the Ring - struct k3_ring
  * or NULL in case of failure.
@@ -126,8 +123,9 @@ int k3_ringacc_request_rings_pair(struct k3_ringacc *ringacc,
  */
 void k3_ringacc_ring_reset(struct k3_ring *ring);
 /**
- * k3_ringacc_ring_reset - ring reset for DMA rings
+ * k3_ringacc_ring_reset_dma - ring reset for DMA rings
  * @ring: pointer on Ring
+ * @occ: occupancy used by the DMA reset quirk, or zero to read it from hardware
  *
  * Resets ring internal state ((hw)occ, (hw)idx). Should be used for rings
  * which are read by K3 UDMA, like TX or Free Host PD rings.
@@ -217,8 +215,8 @@ int k3_ringacc_ring_push(struct k3_ring *ring, void *elem);
  * @ring: pointer on ring
  * @elem: pointer on ring element buffer
  *
- * Push one ring element from the ring head. Size of the ring element is
- * determined by ring configuration &struct k3_ring_cfg elm_size..
+ * Pop one ring element from the ring head. Size of the ring element is
+ * determined by ring configuration &struct k3_ring_cfg elm_size.
  *
  * Returns 0 on success, errno otherwise.
  */
@@ -242,7 +240,7 @@ int k3_ringacc_ring_push_head(struct k3_ring *ring, void *elem);
  * @ring: pointer on ring
  * @elem: pointer on ring element buffer
  *
- * Push one ring element from the ring tail. Size of the ring element is
+ * Pop one ring element from the ring tail. Size of the ring element is
  * determined by ring configuration &struct k3_ring_cfg elm_size.
  *
  * Returns 0 on success, errno otherwise.

base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.39.5 (Apple Git-154)



