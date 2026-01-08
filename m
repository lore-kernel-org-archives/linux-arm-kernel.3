Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69FBD1D494
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5cIhvc8dQLYctZYfUjuPlu8cNI3Cxecf0YI2Axf+TE=; b=rWd8+Nx+XpoMjeO8bBW8zf/dHG
	GrI3AICPcFlxkNIMMSR6Aa37TYNenaNoUgd0mP1BSoAV/f2rGwW4gYbYWNMFDibWsElhojCS8MHrE
	iRPILBKVMuYRpc3+FH40rJKGX4+Lhw7dkuNQLfRJGIXdZJLknblByqFD0+RO0cK/VDHoh7tXiW8Jr
	QDoBJF8fHT4OqXH7/F5h5cVoT1qVwquEJgHPqzRL/SKtjSISfAeIsoBotcb69SguFwAxxWsOfGP2z
	xwiOKflU3OZ8D6c4LXUfhgKa/KOny0uFMHOaiVpVYZrR3U2q8ufPaCVyCJ0put3wdd23Maom++KPF
	TlHPxzag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxO4-00000000sYG-3TTD;
	Thu, 08 Jan 2026 21:17:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxO1-00000000sVe-47By
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D5cIhvc8dQLYctZYfUjuPlu8cNI3Cxecf0YI2Axf+TE=;
	b=ZNJFBylxn3QfaRXqG+D08ysAxsJJSLkNl7Q0OYww6/ao3vopa055b59KOwejhYJu5wF8My
	aW/T0OOvt7yk+K/+Xg9d4GghU9JDLDnAANgXvSdFDRI4x9qA4koWowtDAHgo9Pe8WgM8Hz
	x18m95KRRtoTpQ0R1emw6P872nf5zD8=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-D5KHPvaPP-yJQoiQhH5YQA-1; Thu, 08 Jan 2026 16:17:39 -0500
X-MC-Unique: D5KHPvaPP-yJQoiQhH5YQA-1
X-Mimecast-MFC-AGG-ID: D5KHPvaPP-yJQoiQhH5YQA_1767907059
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ec8781f59cso1852315137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 13:17:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907059; x=1768511859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D5cIhvc8dQLYctZYfUjuPlu8cNI3Cxecf0YI2Axf+TE=;
        b=daNocLUp4oAzyqGhPKLGLGI21QzjmgBStOSF7FYnnFZ3AWmVrXJzjdM3/Tqnl4UtrC
         FQC30hcPT9zLVaylG3RGmPHl4mdlQbPRvpOzaT0z010h3zwoj0N0JSuCGjiKT40+aS2C
         5dcrHhSyysp12BCezV2SD96LdbW6VWVPdYmCca5p0ngw0/XNU3qsMNE5hvfx8mwJpR0q
         ksmx5QIP/eIVm2nifdH5XjL0OlPkbhG0opuixAXJc2qOv1VpxmO4kA63t32K1+raXotm
         tWzZq/mUnBL2ntHPdbfXYWCdYHMFG1lvsYWUOZp+4Ugn6j2Xd8PlijI+3eS4RPDYoKl2
         GYkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMb9qifr45r8hfoO4SdBzcHIxfgEFxWWJ7372H/lpwYLkR8sC8dsLjWkFcaOLQqSy3wJMt3tWRVi65N1eym5wS@lists.infradead.org
X-Gm-Message-State: AOJu0YyM66kxHtqKeixgmrZb1gOKsQJtQ/xfYPCpAAPRn7oXkUUNih7M
	Jlob5NlsOKOTGCVLz6nxpTEctup7UrL0oZXAHzy5zou/WurVHYsrwy8pKFC9gnnnuq5j6sfiwhu
	dl5bVAYZ/o3RupDi/OEanFyGzeF4XkI2AlY6iGWJBmoMFOhPdent0QS3Pu26bNsasc2TEyva90g
	Dx
X-Gm-Gg: AY/fxX4XXPIi29owwQwAVa3Yp+dC8+/TftqZYIvPwqrSyBJJR7aOEiGzv3dDWzSMV6F
	lDFci7aOGcGbTttU1ZLK+dHJpvy3b1wp3+syhFvuzOahfqgo2W1ViEIb8ctZKDh2IDDE0V7hGeA
	fMQfVHCu12EeGMePvai2TWu++hOlpbMlFYhQDYsGviwNVSacAvOWSzr52IQ9712d15UES36iZ9/
	tU2FbI6SElzn6NpYdag6Bjk7ewMAXuJL40i0RJKFgzq93mRVxAih1Jb93zN4T4zmNchDkqhH85n
	sMnck3MLNnlrRjRq5K5uOp1rCrDNUlg6tM6ptIziZOfLXQ1Ozwbua3Y3Mi9Lvht4ULU+ZhFHpQ7
	RuUE3frRzGGvzZNI=
X-Received: by 2002:a05:6102:4a84:b0:5dd:b28a:2e7 with SMTP id ada2fe7eead31-5ecb06087f2mr2463943137.0.1767907059171;
        Thu, 08 Jan 2026 13:17:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFevT6XpqiDw3gC3iSZKj1S68mskdqd8KLh1Xh266/vYweAbfuv8F4ugSPmroYppR3BxoB4zw==
X-Received: by 2002:a05:6102:4a84:b0:5dd:b28a:2e7 with SMTP id ada2fe7eead31-5ecb06087f2mr2463933137.0.1767907058653;
        Thu, 08 Jan 2026 13:17:38 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:17:37 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:24 -0500
Subject: [PATCH 06/27] clk: bm1880: convert from divider_ro_round_rate() to
 divider_ro_determine_rate()
MIME-Version: 1.0
Message-Id: <20260108-clk-divider-round-rate-v1-6-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ezyZCBz7BY8t8FxF4YFrSSzgfQvODsPKF5EJi4+BluE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5LZNOKPG16VUEnn81U/VWLG4RcoK2v5JAkZRG78V6
 B/MlsnrKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCJbzjIy9LvtvBGpMGPnhpVT
 feuFfI2KuvhvKL2yO5qdw/pl6uWui4wMMybKCE0RTCsvjvfmLhbm37/SxXh7R9LmRz9tMx/FLsz
 gBQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ijIRyciHfW8WzyvGhuxBHTITEcMbJgDH7VzhiU6ffHA_1767907059
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_131742_527836_D0D00ED7 
X-CRM114-Status: GOOD (  13.16  )
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

The divider_ro_round_rate() function is now deprecated, so let's migrate
to divider_ro_determine_rate() instead so that this deprecated API can
be removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: cf1d95fa0c64 ("clk: bm1880: convert from divider_round_rate() to divider_determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/clk-bm1880.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-bm1880.c b/drivers/clk/clk-bm1880.c
index dac190bc6e19a6dd4be413ea52d41f74934a1aa9..536df8e828eab83fbd3812135139c703aa7a1ce3 100644
--- a/drivers/clk/clk-bm1880.c
+++ b/drivers/clk/clk-bm1880.c
@@ -621,12 +621,8 @@ static int bm1880_clk_div_determine_rate(struct clk_hw *hw,
 		val = readl(reg_addr) >> div->shift;
 		val &= clk_div_mask(div->width);
 
-		req->rate = divider_ro_round_rate(hw, req->rate,
-						  &req->best_parent_rate,
-						  div->table,
-						  div->width, div->flags, val);
-
-		return 0;
+		return divider_ro_determine_rate(hw, req, div->table,
+						 div->width, div->flags, val);
 	}
 
 	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,

-- 
2.52.0


