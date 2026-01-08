Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6F9D1D48A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pi8aTSDXEqFb0AtS29g5AANtZt1DyRnbPSfQSa91eEQ=; b=aUM/nrS8jlRAvceaqNYVd6aMj4
	9p4NLslgIYmSQdPOAyY1fMpqp5OOPna2Jyiv64sRWi+qKCdyXZvZOcvZCiRWUtXBBzLVOlIUUwBoh
	H6HHuvlOE59GYZ1JNu/RRHuHTdeXi0LOtT12WlQ6jo2kHiL1Wm4u62SgBUcz8LCVt3iDQZSqww2xD
	DparkePG/NCWfdz60LLWfmYQFELU68a4d/9dMD6ybhWXzkawweBL4/UUCGtQ3Zrdq0sa8sgryXPa6
	jV7ySUNx5xGYqkRKkrgo1vUO5xMbXBoG3E5dJX/kqrpkHF4fWBaDrDJJiL7xGnUByGuUIoyWjef/X
	EyW/N6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxPY-00000000tUo-1eZf;
	Thu, 08 Jan 2026 21:19:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxPT-00000000tRV-1a5W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pi8aTSDXEqFb0AtS29g5AANtZt1DyRnbPSfQSa91eEQ=;
	b=H/WA5AQeaEe/AEGI1YLs2d2Y73P0xEiVdivifWpPiq43uCm/l+r0Oetq/F0Ew35XAETpLN
	G+FUf6t6t0EY5Zrs3P6OvjSJNCvH+Jfat20Qkk1hAQE1KAU/Kq3knX2oemT4Ua9xv5OEZs
	7qk3IAuDEVbqXvCidFOmhYCgHxbE2gU=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-f6GHdWT6OVy2vzxZo2m6GA-1; Thu, 08 Jan 2026 16:19:09 -0500
X-MC-Unique: f6GHdWT6OVy2vzxZo2m6GA-1
X-Mimecast-MFC-AGG-ID: f6GHdWT6OVy2vzxZo2m6GA_1767907148
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5eea3639aa9so1313101137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 13:19:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907148; x=1768511948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pi8aTSDXEqFb0AtS29g5AANtZt1DyRnbPSfQSa91eEQ=;
        b=fwlpIqmsita9MF6sCG/F8xEhHDG6iJ2b0hw044AnvDeEcwT+aFbdnfAcX44XT4WcDp
         kcXZaterD4xxouc2sW8Zen0OXM/NYTfidXtA7pd8MEaNCNA3FC3IF4i2tNFzc5L5b2/l
         Vf4kFlqut8cBHdX+ubkt5nWIZrykrgtjdqZV61CroT+EOJLtcZ9tYlemEnVcFVLc+0LB
         oDyCJq/cni6fOWehGcKA0372/w2TzLV5IymVbsE6B27VmEdcIzK6I+b/9/oQqxajmvFg
         53ygS6vKgvSwsx+XlpEWcf0oLIs97KsL05jptdVBbNJ8UUzqYuYq93fq27dihcLbqVRD
         s/KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKgzQDxzhB0nnwmcAnWRMjYSbd2ZTxXcWt3IBsgMztj+croLiPCUdhUHx1XxOo9WtPHshHc5zW26M1M4FmE9iZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx39+CJqcUUfrCR9+nDhpS345JRHgHsZ3qjTRzBwwo5vbMuAKfi
	hWFnFn8WAN+a0w7B9Hs+sPRtrhx1/e+TSdVeBOz1nnt88YtspjSgK44u6EjlFKQsHL2PHW/slwi
	RB8XSTmYhuehtPc3gOZnbJcdOFEGqb2s9vSAvYZWmqmY3DOqLnLabk1CBPCxrbX+NnwbpBxH661
	LO
X-Gm-Gg: AY/fxX4vQ7cx4yT9j83XV08+q2p5TxMDEwrt8BuTKpgNXT5V53tp0DYAfbAK6wAAna4
	d5swCahonv2n92wX5uHNnrp8uvG6klHT3LI3QlRK4Kf0P4F2R0moYQaao2sPn4wuwUaQqo+Jhpm
	DmAmGgyjfIn9Pe8nuDPEhTPQ+etBtiUqcUMtWm9tqLN84k9fqHb37YKzOkVO6u3svMrEO7zHwRA
	qvgeCWXwqq+LOL1EppEiEob/w15aozS39u9y9kJu7DrCwqtn9EuMdczObqB+LRYLG4ARXjHsIvF
	3cvI2LJAYV2PnUzLYScxoWY1NiwdrKztlnjUZHCN2MfLTYEHOMRG0iQhMpdqN64zLAk3Lr4/Pcn
	gd8tG2jUyc3czYLo=
X-Received: by 2002:a05:6102:419e:b0:5e5:6eee:8adb with SMTP id ada2fe7eead31-5ecb1e6f442mr2910878137.4.1767907148426;
        Thu, 08 Jan 2026 13:19:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjkDxe401WB7XCmqhdQfn1Yq9q/xtZIkqczooAI9hDDE/Fw/5ZqkXt9GSFjs3KqeCx/N8xaw==
X-Received: by 2002:a05:6102:419e:b0:5e5:6eee:8adb with SMTP id ada2fe7eead31-5ecb1e6f442mr2910863137.4.1767907148014;
        Thu, 08 Jan 2026 13:19:08 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:19:07 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:41 -0500
Subject: [PATCH 23/27] clk: zynqmp: divider: convert from
 divider_round_rate() to divider_determine_rate()
MIME-Version: 1.0
Message-Id: <20260108-clk-divider-round-rate-v1-23-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Michal Simek <michal.simek@amd.com>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=obGg7UzQWRzDKZpy5Gk4sjLlNTrtDOG8AhKUHRKX6zk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5Hb93Mva9tclyPhOy56Un696Q2YrvHruccon7rjkh
 C/bN+7811HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEvhgxMswNc/g1N/iT6PZH
 G/5LGXkHrD8o0Xhj62/bnZklTBfNVxYxMrwInrTR6Ne1vN1MkkfTZpZNn1UrVOtnubLn/OVL9Vu
 PfeEDAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1BuLQzLZvdtCjEg6zSMq6sPmwfD2qJ6BIrFJLmOsWLk_1767907148
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_131911_510187_ED36F7C2 
X-CRM114-Status: GOOD (  13.91  )
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

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: 0f9cf96a01fd ("clk: zynqmp: divider: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/zynqmp/divider.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
index c824eeacd8ebd4d670d78f1af2186e61008bdae2..de6f478d527d89881a9c0deb04e7bc0a5bf6ebba 100644
--- a/drivers/clk/zynqmp/divider.c
+++ b/drivers/clk/zynqmp/divider.c
@@ -151,8 +151,9 @@ static int zynqmp_clk_divider_determine_rate(struct clk_hw *hw,
 
 	width = fls(divider->max_div);
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       NULL, width, divider->flags);
+	ret = divider_determine_rate(hw, req, NULL, width, divider->flags);
+	if (ret != 0)
+		return ret;
 
 	if (divider->is_frac && (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) &&
 	    (req->rate % req->best_parent_rate))

-- 
2.52.0


