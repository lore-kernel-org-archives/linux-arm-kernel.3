Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BE7CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 19:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzZhwVxQtOTxpPSV3ALvJKs3yCJTXAKgHjmBscK7oNc=; b=S+u1XmFPfOYOoR2UNdMTb9qdEn
	mFHqendaeAFCiYMslIa7sn4gdZ/A/qyI3K4WEBBu52mdQ/TVEpdCY4ruoNnM50LqV3E5ka40ZgHIp
	asoWg9dpLZ8sHdjOlPrRJsOkzb0jjfOcEG8F6yNkVA5ngRDZV4UD3kBHemF9r9Q4wdgqQrxRORNEU
	/iuDfoBwOjXM6OppmFJPrayow58yQimEMJ35A92CS5U6Yf+eBim2/h+mWWKkAxhn9rhn9BvgUDLlZ
	iLhAKN4zHdx6S6GurthIssE9JNCX1E14wOtyOFOqZ3RCJ/d6f3VJrxiFT972DPXyHq5MygKkU/1PA
	8XFfJhdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKFA-00000004gTA-3qRW;
	Wed, 27 May 2026 19:48:44 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKEn-00000004gHD-1hhp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 19:48:22 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-911796e9885so1054656185a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 12:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779911300; x=1780516100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzZhwVxQtOTxpPSV3ALvJKs3yCJTXAKgHjmBscK7oNc=;
        b=gjGs+GiNb1lPVTiIB1P8zgePVayHdFE67v1jlpoPtG7ap1zxhRtpb2MUyBOJed0Yq8
         7gaqVmnX+VpE1adBqg+ThMRzYzTxAU1MuMOK0Kt9Z2fIEdgjRO7iRLmPTLRcwAXtr46/
         qy1BzJMQR6gpLyPQ6hniPyzhaY0kFmWvnHSkquuCWXqYUrWJ5qJbZIMQYkxr1SZ4RPM2
         qxWxArHP2Vm2xiMxS7vcGSMNPkLJNgaeauU+h9z3BdUkx1D11W7xqmh8IbvxAo7uypUk
         Hjqswi1YyTzy+YRQGiGkV1vrjdeXoxP+jF+wBtUjq+YoOiRZsV3OuYh/4lxD5QcYeRg/
         e4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779911300; x=1780516100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DzZhwVxQtOTxpPSV3ALvJKs3yCJTXAKgHjmBscK7oNc=;
        b=O4SHv45eAnj/gluATq4R4FEEomVidk+mhNpXPenWqx7ubjAunuXFSCd4iroFslMS4f
         BaXH5hJbjY7Uvq0g+anV2uLFHbgZV7mCfDW6OArHmsfqvRm32Oc9JuxvXdEs+i8L7h37
         FsajbNuwVgJGnDABerkD0gTBjwo2hpQ4W7Mmb8Llc75ruiEBd0B9vaZ8ZZA+yxzQFUGO
         bVwbUv6GdUfq3BhmT/+F9u0nK3zmaWZ4aA1qW1ErZrr1BEh2PFdgB9NtOv1iIS7+oCdn
         P+R4buSQAz7KU7rImEtbiflGKToFdYHZ7wFFUgUwPX0nwhmswcepjala2069oiUAld/L
         eM5A==
X-Forwarded-Encrypted: i=1; AFNElJ8WzZD6jOFvgUqucqdJ5PYFo9kL8nc2Ud/S6/BizXKAAkL2HkZopRx2wOPJRyXmDnKVyG4mIuUfqcBK3a5LZjag@lists.infradead.org
X-Gm-Message-State: AOJu0YzIES8CmgjZ+NEKtB/En75bEf/zSThZWGJe20UTErP0f43A0O8E
	7/sLK/nZJZEwvC3OJMy0Xa1UYl3lnAIkn2dH+wlf/hFARQj4f/m3mnie
X-Gm-Gg: Acq92OFNQlxSZ6OdMNlOlMLFgEZdo61P5FyTdMbjem00RDWMlKABrAsFJhCGTCQ4PG3
	AYRlY2WxDqI+G6ph71QvwsPKnZJ5BUAsbOKU8sasku0yhqg5ROp7AIs7VPwiHUqScekouuoU82e
	b6SCiuUw322CDFygd1w0Txpei8NtusoIQ+MfpDKLtdx4hg3YC8IQgQueQsofmQ0wdBeokopHoGG
	SWexgbjchxrJvKylCGyEAjDUX5CaMph8vGlP9KQ7dnsmQvDWBcuTa9PPy1HU447hVM0nvtU8naA
	swWbXozW/RlOl1gzbKXkB2I3uQoXHl9X7JWE7kjHr1VpkmsFAFyGO7d5wImx4uDYtOQFFTlguow
	mgDe7tzMP/8FKXxqMG+mdLLgZ3ajhNP6XAWWRm9KpKCVEj5/uxVdAa7w6cc0aB/iT5zgaUm2dpo
	jctVMDZGMpvgB35ZbFJHRuIRzIg7Lt3a3OmdGYcUVWSP+YN/Zs0qxLWZIQbqfjp4GrkUZxgWtf2
	A0X+FOHgX77pwJuYm4I20gzcxtY03/ji1mR8c+uDDsSmoMTMh7paatrulmANZmU
X-Received: by 2002:a05:620a:462c:b0:910:f8b4:8614 with SMTP id af79cd13be357-914b51668bdmr3081086285a.31.1779911300034;
        Wed, 27 May 2026 12:48:20 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f87017a0sm564942385a.15.2026.05.27.12.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 12:48:19 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 3/3] media: rkvdec: hevc: guard INTER_REF_PIC_SET_PRED index underflow
Date: Wed, 27 May 2026 15:47:37 -0400
Message-ID: <20260527194737.1999409-4-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527194737.1999409-1-michael.bommarito@gmail.com>
References: <20260513181922.2075438-1-michael.bommarito@gmail.com>
 <20260527194737.1999409-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_124821_463389_62D06FBE 
X-CRM114-Status: GOOD (  13.30  )
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

st_ref_pic_set_prediction() computes the reference RPS index as
st_rps_idx - (delta_idx_minus1 + 1) per HEVC spec equation 7-59.
Both operands are u8, so when delta_idx_minus1 + 1 exceeds the
current index the subtraction wraps and the subsequent array access
at calculated_rps_st_sets[ref_rps_idx] reads far out of bounds.

A userspace V4L2 client that can open the RKVDEC m2m decoder can
submit an EXT_SPS_ST_RPS control with INTER_REF_PIC_SET_PRED set
and delta_idx_minus1 crafted to trigger the underflow.

Reject the entry early when the reference index would underflow.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Cc: stable@vger.kernel.org
Suggested-by: Detlev Casanova <detlev.casanova@collabora.com>
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index 3119f3bc9f98b..898d1ce74f38a 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -268,6 +268,9 @@ static void st_ref_pic_set_prediction(struct rkvdec_hevc_run *run, int idx,
 	int i, j;
 	int dPoc;
 
+	if ((unsigned int)rps_data->delta_idx_minus1 + 1 > idx)
+		return;
+
 	ref_rps_idx = st_rps_idx - (rps_data->delta_idx_minus1 + 1); /* 7-59 */
 	delta_rps = (1 - 2 * rps_data->delta_rps_sign) *
 		   (rps_data->abs_delta_rps_minus1 + 1); /* 7-60 */
-- 
2.53.0

