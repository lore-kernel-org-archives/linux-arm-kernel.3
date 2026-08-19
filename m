Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25122C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 17:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsYxExfrI1OgfgUtsxz2vPPCZHiFnpZ/4W9NF1DJIH8=; b=2Pet9GSxHqPsmIA/VT/7BMM0+R
	jvSlaxWH8j/GxZijTA28AEanmuKCxUtA4QamftRl+s1lrPKe1fzm9FIEOF/dneHx53nssYWPGD0eb
	qBTtOj6nuZHDCkPptabTgi3FZ8OA0oKXBq9b6D3+u4a9pgjDQqaLu/qh2/cVQru2yViiRdzNka3rI
	12gKdfAnbLJLBYtxWZ0wCWphXUZN1AhFroWbx8CyKW+n0tot43MLZ50g4vBZQnJ4yC4tqqPs1Bx4a
	w3c97ctmXqBQ15wfRzMTbTRHmbl91LHhU2iGvt3PIP29Uudqtvn7m5Joyr2Lr/d/94xoE17SxNPFr
	cmOl5vnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkOO-0000000AJ3t-18Up;
	Wed, 19 Aug 2026 17:48:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkOJ-0000000AIyy-3k2Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 17:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787161675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wsYxExfrI1OgfgUtsxz2vPPCZHiFnpZ/4W9NF1DJIH8=;
	b=Kk/l1/LciyY1pPfcRab3GmSNXYchHmwlPCaaa7agHX4O160sDFuDNkjFAJM2kT28GYFBg1
	wJsgtsNiobFtU9wWgpSeP6rnsvQJXzbOIs5dm144yp7zkMHa00o0tgzrSZbAo0hamwcF2O
	SX3SrkwOGeS/Un3OhAvbc7VytF8wMTc=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-XBDCK8fUOJCjFc5_MSPA1A-1; Wed, 19 Aug 2026 13:47:52 -0400
X-MC-Unique: XBDCK8fUOJCjFc5_MSPA1A-1
X-Mimecast-MFC-AGG-ID: XBDCK8fUOJCjFc5_MSPA1A_1787161671
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so836319a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 10:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787161671; x=1787766471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wsYxExfrI1OgfgUtsxz2vPPCZHiFnpZ/4W9NF1DJIH8=;
        b=OoZS8zuMRIdtzBMNJfaOjto2z2sqvxBwbyQKr2LeBk7EtDThB3meBiJ909VAej9E1Z
         X82Yo0TTSAJmebS5L9aMZJuTBvA5l3jQ6ojAu4THl4TiMNWBGrJukpaLz6+yKCue2ySg
         BbLnBRQPtfzdfwYFHOokZbgOUq02dwsrcSn7c596Es/gan8v7jVI+Bfu4VeDrb8q1WLl
         P1YxZaDVZzIqLJpt5riziTsYyKDf7evDOpL7nLDqoC0ccMFVzqOwR24sd7mcwpWD4bxM
         /VAmGd/RckfWhmfUP72VNDXJXWafhAuPLiscPTz67PWvUxClwlH2Ps/GHAfjnHW41pGo
         6fmA==
X-Gm-Message-State: AFuF++l24H9/0ILYoJLsDwH4hkau/1Tk9CcPbuieBeOKP7w5yfxfmvTM
	391rgBwUbv7NtBaXIf2v21QE7nA0A2Xa795GqF/68uZSSvMOyfnHKgmAaMoTCek5OTNw+G/Qdol
	6sHElaYrzT7oB7cQFg3vhMWc1IMH7k+kb7nlorpgubIExpAV9RQnHBEwc8TZv1i2Uh2eRGJeukh
	o5
X-Gm-Gg: AR+sD10StX3VsXHsl9k7MCqg4q/7dLZqoHepDzNHZv7i+IMZrWXR4iXN6J2L/AEjo6z
	cyGDfHbPIDRLyNf/ypFveLEoqoQo5XEY1IwjMOlvVpjFz+8M90+RBJEW1KwFaiBmw4h0Wx4cQIv
	PIIP6aqMjjuctzROZ95SJBUgkQAUXuMv08sS9ynh6MNLGBUmSM0I5wUH9b/Csy79aCTrzZAv2Zl
	Xf1MPMKYodnBXWcTTaMf6EqA80QCWEWyDPLqqcDyAHW9NOed7RDgTOoIB6KF7rt/QFjKRz9zu1G
	nxZt4dyuYqyfLo3EvxXLbnRc7MCjyf023di9ftGrrLAI2IxUpz4QaU4OlO/c4otQO396/JIhwBg
	YzJDNdIbJpl2dBI4zR4nmlmN7V/gz5d4n
X-Received: by 2002:a17:90b:5105:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-39581070da4mr12374215a91.15.1787161671156;
        Wed, 19 Aug 2026 10:47:51 -0700 (PDT)
X-Received: by 2002:a17:90b:5105:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-39581070da4mr12374130a91.15.1787161670669;
        Wed, 19 Aug 2026 10:47:50 -0700 (PDT)
Received: from mpilaniy-mac.redhat.corp ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f96ca41sm3319861a91.4.2026.08.19.10.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 10:47:50 -0700 (PDT)
From: Mukesh Pilaniya <mpilaniy@redhat.com>
Date: Wed, 19 Aug 2026 23:17:23 +0530
Subject: [PATCH v2 2/2] kexec: fix error propagation in
 kexec_image_probe_default()
MIME-Version: 1.0
Message-Id: <20260819-mpilaniy-v2-2-95e929ede0e5@redhat.com>
References: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
In-Reply-To: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>, 
 Philipp Rudo <prudo@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
 kexec@lists.infradead.org, Mukesh Pilaniya <mpilaniy@redhat.com>
X-Mailer: b4 0.15.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rGSRElUQH-NCHVtnj9duudVoRelcoss0R152H_PHKKc_1787161671
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_104756_003960_BD1CD774 
X-CRM114-Status: GOOD (  15.40  )
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

kexec_image_probe_default() overwrites ret with each loader's probe
return value and returns whatever the last loader returned when no
probe matches.  The error code reaching userspace depends on whichever
loader happens to be last in kexec_file_loaders[].

Only continue to the next loader when a probe returns -ENOEXEC.
Propagate any other error such as -ENOMEM immediately. Return -ENOEXEC
only when all loaders have been tried and none matched.

Suggested-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
---
 kernel/kexec_file.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 59fb9d71e9d8..b3060e984ef3 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -68,17 +68,19 @@ int kexec_image_probe_default(struct kimage *image, void *buf,
 			      unsigned long buf_len)
 {
 	const struct kexec_file_ops * const *fops;
-	int ret = -ENOEXEC;
 
 	for (fops = &kexec_file_loaders[0]; *fops && (*fops)->probe; ++fops) {
-		ret = (*fops)->probe(buf, buf_len);
-		if (!ret) {
+		int ret = (*fops)->probe(buf, buf_len);
+
+		if (ret == 0) {
 			image->fops = *fops;
-			return ret;
+			return 0;
 		}
+		if (ret != -ENOEXEC)
+			return ret;
 	}
 
-	return ret;
+	return -ENOEXEC;
 }
 
 static void *kexec_image_load_default(struct kimage *image)

-- 
Git-155)


