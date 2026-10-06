Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD24CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 15:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yFVV6rDqzkVe7MPT1P1wIPFYg4xEhPTH8XQEr8tqcT8=; b=RWldsiMiJH+foKDE6PUmw+c/wl
	NPLmT32QPFMIeOdtQ2/ARvwGOISdv6AaDWw5YbRQINUQtu9Ogk0g+VyWi7V4E8r8x3HyOLeg38MNu
	sQtnMampfAMpG/Z1gIwI8bJOpUeAWewcjF5wsAmRXNAY/7DqUpPr6CAVY/WaTd5dPpZ/5eaKKT0zP
	kGQOe2TQkEJe8T0Nds+uB0KhiA0swAEVcC3Nj3ZRa5XjDqjwFcxdxumoq6cwqGOStGi1tHf1w2Rek
	MUxbAPqWxI7gS3SF0hCSN/hnzeh9ygw32zMRHcxlC3xc9DknyEJyvEu6eRxypRCMGcorxP3+IyW9X
	Ey/+HCLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6xT-000000011ZN-2RTO;
	Tue, 06 Oct 2026 15:19:59 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6xR-000000011YU-2k65
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 15:19:58 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-53394bffe0fso20728541cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 08:19:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791299995; cv=none;
        d=google.com; s=arc-20260327;
        b=Bk3d9LZOnsJ0s8qJZf/By74gGWMXadjupxGWJPwbNQc1u0sPLOMrcvYeq5mzNTyzno
         ZkQGxiX0D38M+ciXprxAalk8tOpmQoTLAgug1FxNGf1FgBCIS4Waxu0DCs+rbph/TPkK
         +gjMmn+GKx8fnFG8U/lmPL8m9UnEHDFdZ0E6WNWHuMfyv+yPYqh7o3TsArI6ZouptHcj
         3TEWIW/ojW7m8sIAUBKFwJ8nyfHvBdeYST1cNFQpvqeGdgTJ7VWZ+brji72uVb+ubcvz
         3CLbL+M37X6srrGoq0nA7Hw/U0autZpECJy1OaIOKoFraZ+EJN/cFK8oLSwKDZXPwtAN
         B6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=yFVV6rDqzkVe7MPT1P1wIPFYg4xEhPTH8XQEr8tqcT8=;
        fh=U/lS8UJ0KVR+Oh0oriHikE71B3l5+I1Y99zGGqI5Pcs=;
        b=kgPe828LKACZ7DiTubOiASGeqooeV/42L0n5o2whtchJ6ySuB3m0QQeCF57OZe+tJa
         62j3q+UKEbEgXKQOztBBB/sW6dC0CWIjoObSQWCotMhd+ENjRdRSTJLB6mSS6q1BNak8
         PNWsX3lVEGcae9BU/xDmjly1JD8R9mZ/HJfyt+Ld5+vPHg3OqqcpeSKXtCa7J1ugOUAU
         Pj3XGmtunIu+t3vKcxdtfYAcGbfx90FGIWU/wXQ+W5eXWqzWIbw92fELo39TBsuYQK3J
         o/lhVQmSfFVVbOWCe8NZiiIP8R3ifUyX4eVROm06QzCGfvpC4brmcP8Knf6EwpOMDrCM
         IuEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791299995; x=1791904795; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yFVV6rDqzkVe7MPT1P1wIPFYg4xEhPTH8XQEr8tqcT8=;
        b=ARLz4DCJIjUGv88yYwRk0+Jyg5c6duVB4jkucB4Lfto6sBTkWC0OaXU7VJ4EPbLlZx
         FMdGshaOKL/9CGZhCOgEs8ftQQ2TM3UiKAFaFSC4PYw9PJ5i1KSDDFuE3klMhoft3BnL
         lHnCouVhlCaKBlyMKMY49e8ebE6MedVX3Yvyg1qYtF5J95WoxPpGhZEqFDs2LOxh37mT
         2SOdVHaZR5TZVNFzcTW4qDUO4jsNDG4BtJ5At2ooZxhsOnXmReS+ZGqwlziNFEfRMyqd
         nZzmW05s7N8WxPOh1lD9YPqtay+91rbE6dzYy7odpG0SDgnPeEpqKnJUTAacTgiccY0X
         V3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791299995; x=1791904795;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yFVV6rDqzkVe7MPT1P1wIPFYg4xEhPTH8XQEr8tqcT8=;
        b=yGeA2wQgfmFYgcIbnVxrUmm2MbaH/unALHHUL+vpxepEyx1bVf61hSMkV50VFv2mDG
         R9ek9rTPTtKuqUpgjKBanX5bheUXHVtG9wjcHKLsifjz0ZTRSbVvOPmGKAcgkKAFB+Fc
         RNPqzEQCeN7KXeJNm8bCbEhrVWL9hSSQVPhwb5NkarZMxi4FCKg4UMSdC8jjZVFqSMhi
         JPo0TY8c5eeO9z2lZTPYOPRhCouvk8dBd+wC+oo9P8kIn2mpQAjYfYaWpedEAU8ptM0H
         ndwneZUmCso5Q9bxGoELEijK5l9BAgTQNUmqyHaFaju+XX9Er+EW8PafYCB8FoEAGX9f
         5G7w==
X-Forwarded-Encrypted: i=1; AKwUvBzLv9yqkUN5M+6mTn5QlAaJFCMJnFAZ6D3YCOzqISlu8Dh679rFC6BsC3zy3Esk3LpX7G/0oXSMYdSjxBG9Gs2l@lists.infradead.org
X-Gm-Message-State: AFuF++mI/eDIWfhvNgu/LSr3UD9gZfqqMM+hW6aSIH8AltipXQX2kBhs
	6Zf8zS+dowBVKP1eAEcCp06gd4SvGzyyukr4Z12HJ5VA8+BpEegUyF5Qg7ag+cMPC6QiP64EFDn
	T10cgz0JlzVtDcjee6QO2g19JEMgbrCoBPg==
X-Gm-Gg: AYBFou0tfccWTh5J9VmXj8uUk1ehP5YHitS8/6WYw0fvgs4mRqIdcl1pbGkHSQfxYSc
	9rqwETf1B4ht7aGohisg8/SegmrFsNjPXq/rlvsAVv0lmUK7TJZxDYu074kDBM+cV65xJ6ZbtQm
	GcZvnvq2ivjsh7+XntVMWG2qKbf5yw2QrRK+AegCMy+jYPXcq2RHnYCMLuyJnO2Tc4h5V/q+Vds
	o18W9LAid+A7/jWg0r5Dm4pvD748/qgdDG2gJF4dgtWamUEyvPLhjrg9pSipBpU8SfiUHqX5vZK
	0gAzybCsuW5Juj/ihUbqYPFoM/m7D+Dz7uaHKX4iNPWzI6VUib7G+RQG5SqKhqaIRb+w6evmHvj
	3c0Lvp9MiobJ6avILABf5ZOMSXXnR/Qa1KyEZYNnvOpjjpxk6NNPtKOVJ2dpmIB62ykEBmKYBDg
	DbDrngYSTv2h+lRLq8TKH/rDvp59AUkVE4t3s7liufoHzfPB0d6NRdMleWsibjGyl0Zn9SDpWfg
	/s=
X-Received: by 2002:a05:622a:e49a:10b0:535:70b3:fa0a with SMTP id
 d75a77b69052e-53570b3fb28mr1387511cf.38.1791299994820; Tue, 06 Oct 2026
 08:19:54 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 6 Oct 2026 08:19:54 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 6 Oct 2026 08:19:43 -0700
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Tue, 6 Oct 2026 10:15:54 -0500
From: Ting-Han Hou <ue081723@gmail.com>
Date: Tue, 6 Oct 2026 08:19:54 -0700
X-Gm-Features: AclHuK9yqSdRAFzPsVeJO1Zn2ht02ZhprGx2lSC9pDzBb2P38sk3c0pSEMytM_o
Message-ID: <CA+NtrhQBK8uW32qO3dXxVxO1GSN-0EJfyJ16tnyx0o52T17WtQ@mail.gmail.com>
Subject: [PATCH] scripts/make_fit: Ignore schema checks when decomposing DTBs
To: Simon Glass <sjg@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_081957_718255_3159778C 
X-CRM114-Status: GOOD (  11.27  )
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

With CHECK_DTBS enabled, Kbuild appends a schema validation command to
the fdtoverlay command saved in a composite DTB's .cmd file. When DTB
decomposition is requested, process_dtb() treats every word after -i as
an input file, including the semicolon and the validator arguments.
FIT generation then fails with FileNotFoundError while opening or
checking the size of those words as files.

Limit the input list to the fdtoverlay command before extracting its
arguments. This preserves the base DTB and overlay order and ignores
the subsequent schema validation command.

Fixes: 17c31aded9a1 ("scripts/make_fit: Support decomposing DTBs")
Assisted-by: LLM
Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
---
Reproduced with DTBs and saved commands generated by the current Kbuild
rules. Verified uncompressed and gzip FIT payloads, shared-base reuse,
and the non-decomposed mode. The schema checker was a success-only
stub; no hardware boot tests were run.

 scripts/make_fit.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 15ba269..9bd35aa 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -292,7 +292,8 @@ def process_dtb(fname, args):

         if 'scripts/dtc/fdtoverlay' in cmd:
             # This depends on the structure of the composite DTB command
-            files = cmd.split()
+            # Ignore any subsequent commands, such as schema validation
+            files = cmd.split(';', 1)[0].split()
             files = files[files.index('-i') + 1:]
         else:
             files = [fname]

base-commit: 69f80fef3153299d9c72c53d1d71eef6354b6926
-- 
2.52.0.windows.1

