Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5E7C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 16:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IOKiZqPgxxYdzu3lGhozAU5+HVbqGefdej+WIN436I4=; b=iT/7y50IFLJAyYsQKCX80arV6E
	ji384WwB5EVV0TB/R8HiTjdUM2+m3GOqKovKQ8RWeWcn5k/hyo647j+i9apNMAhtTJqXw7Mm6lwHX
	aQTwoapY2VGSqq/BnHhovczRNWGSF4cpMMxr4UNC95NeJAZKOmkHW7jBaNxf7xeq+ew+se/PbbFpN
	aUBkVEitt4p0IEoFLwRguVyoW4IOFrXPsc1Z56VppBxJ3Hj6/zjwzClR/DAewZnmbsFlgiK298yVo
	HMl5dQR+u6CACf5igZ3GvTtqST0EtYjRigrK0eI3fM9TX8UgGbmfzF9HoLzycNl5VbGvZMyNj25SJ
	LYwVk3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7y4B-0000000GWcd-2DoZ;
	Sat, 19 Sep 2026 16:37:31 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7y49-0000000GWcH-3fJn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 16:37:31 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so9706425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 09:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789835848; x=1790440648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IOKiZqPgxxYdzu3lGhozAU5+HVbqGefdej+WIN436I4=;
        b=lg7cf9cvBw+AIqKs6zICgwVVZW24sliCcSGqfbJvSFF49x7zOzKpzc9BtvNo8sk/9V
         0NIjU5pfZLknne13JX+txzMb6EG0xRs1pZq6xfmJD15/aKRXOKvUoQ4vuufD2IGBnUzZ
         M/QsFqiagFmP549Jc+JRJBoqSuiolYGQkwU8gdOiXfjSoidCshooLiGvZYeyhmNB1U1z
         OnHawtPh9//atYWHnUYYsWPVU1BtLUvGdnoxSH4S7GdIYVtZdg71JG9DqkHCM8rtjQ9D
         0lNCga5fCDHJhQOwA0jdcyxu2NTDHBmoQejJCtFsIhsnN84QPAZdR8zlwG4avf0IY4yz
         clOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789835848; x=1790440648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOKiZqPgxxYdzu3lGhozAU5+HVbqGefdej+WIN436I4=;
        b=0yg/Db5xXR4U4o5OXBAOo1bo99UBe6ebgqOA4e2Lj2sLFpb6YPFgAdbe0mslBuTknu
         r198KrTJmtFx72EoG0QHhn9W0cROWMbHHtoGgJSCEVTXETkBYQcmfk5ZVRqlYkXIK9ay
         qoVpwT63XLnnW96TSnHmj6Jd7NfmaoKMDrW7XtjtuOl54Qu5CQWk0BmdWfsJPwDLTOB7
         n+9G+lYJyEY36v8lYiiggTDa0QsfNvn3tnWO8VBUdSY64o0nooX7709c7IXsWDC/IZwE
         avhwdQijum2K7bsgX3GmWItSEEmcj7Kd/Aw3bP+mO4v5mwgEnHO6cAaCDkIDcLL1ZdhC
         L/fg==
X-Forwarded-Encrypted: i=1; AKwUvBwVcUZukfqEieR/BBizRYJL2OQKnyN9SjqsmRMvUZYbQ2YyEwabdkPpqasTA9ADL7VUnJcx8djatgRFUpoEwf5s@lists.infradead.org
X-Gm-Message-State: AFuF++nsoWuVpoXeOUnHQHDsgPF1pbz6NEva32XkclxGnYlHAZRSQCK7
	xGm9jFU75spf0rI6fwVugwubSO5dS5Q7olUsj6qxvXOGbmTfFfDFRXKy1qfpfnxD
X-Gm-Gg: AYBFou2i5MCRE3Mv+iN4YpTWwW7eotqiOnQeB1ULbkHWyqUar+SqIbemgEff7ojH7RF
	NvpRsNEm63rjLDU3CTppbMgYenhkVt1lJ7SYfHOgzndRDhI8ID0nog5tHUgP60oY/hLx6G+ui08
	0u0Jl0G3paEO9TviZ78KXtnUb4XW5k954m5C2Pt0Irr+XS0RJpOPUC97ULCaUjxieJ5od2cajDX
	z5V1qG3EGW0vP37m68wN3UT1H9wjHq97UPS/DmouWZnGIWboLnnF8Njh6vDdkIsfDUNtBfxgUGe
	lkM/Hsxwa1E175/2RLxo6UyMzwzgNhb2zuw03zBhhqBhk+uTEbisXhm2M2cGnsz1v0dmkeN+a2j
	9NAfxvRGfTKRQnyWsqZN6gt7VLOAAHC+g28B58QJvCGCuunUnXVfzhxSkok63WEWFwn6MpN7dVD
	3u15gDyzd7+mWBuSempjRu8/ImL0vR6t4/M/6Dok8n3TwO/3X45lwJ3BJZt/6SpljMwtIj2vAy5
	LRpIYm84vGOK7qOEEUhL0AEw3UeFQE4c406iFKPeK5WF04E9aDnFfnxi6ktTiiJUvp0fND9oJ2C
	MmEMMX61E0LTOsNgW9j4BgowduIlk/Civ8Cor/F214rBJw9TuVXS6IB7uKBSeA4H55HsRWW8Td/
	lkWgjX9g9ar/GIej2lsQUhWVPTQ==
X-Received: by 2002:a05:600c:1c01:b0:49c:fc6e:a3d7 with SMTP id 5b1f17b1804b1-49fc5753eb2mr101364825e9.22.1789835847588;
        Sat, 19 Sep 2026 09:37:27 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872442263fsm8155986f8f.1.2026.09.19.09.37.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 09:37:27 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] soc: ti: k3-ringacc: Correct ring API kernel-doc
Date: Sat, 19 Sep 2026 18:37:20 +0200
Message-Id: <20260919163721.89044-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_093729_936011_B66EB892 
X-CRM114-Status: GOOD (  16.94  )
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



