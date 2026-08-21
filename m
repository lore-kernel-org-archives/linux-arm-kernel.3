Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA82AC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 13:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNohwqjvouRlAnKm9iB5tZeW1CKNRcmkGAU02I+Ttyg=; b=d39P25sh6x0+Wp2OIwM6lYzljo
	oTtbRHAnz4l665va5qdyIqrshMthGGP4u9UXjnhdC5APHNtUcRPRF+o1aVpDpP6u5fX81lomG2iPr
	DKt7D8zuAGOXjx0Z+a76aGcpuAArObDGx0yYlbsecvKJCYNeXkfz8Cmquv0iJ68tuMdCAqiJRF3n5
	or0CGfDiqRbnqyNvc8UADlNEGi4BkK5VaRd9MOO4n/LcHvZ2GUOGBN+xQ+7vjtkgfZa05KbaFrguq
	QIyYT5QzlS8hx7K/Lr/xmcfyHmerT0h6tWYFqhtEfMUIDraAjJQ1/GdmU5biF6+RukXCdxGQBehyf
	WqgVGkVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPdn-0000000DSeA-2XK6;
	Fri, 21 Aug 2026 13:50:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPdg-0000000DSZP-0JXk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 13:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787320231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNohwqjvouRlAnKm9iB5tZeW1CKNRcmkGAU02I+Ttyg=;
	b=MLeOSWhH0OofD2ygWGpJemnG6FtEsOXI3bm8VALVT55cgbF7joqsgfr8PUILjDfY3gDi5l
	WHok52I67u9WSFVY6UXBqC0OMuCaw8djQECtm/6ur5gbLo74pzp0BrWqB6dXRLP+gUg/2n
	KSVSzay1/l8l9nsVeWFp0RiMhe4bExM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-Ga5NPrYAOSCq92d2UPqHhw-1; Fri, 21 Aug 2026 09:50:29 -0400
X-MC-Unique: Ga5NPrYAOSCq92d2UPqHhw-1
X-Mimecast-MFC-AGG-ID: Ga5NPrYAOSCq92d2UPqHhw_1787320229
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so1756376a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 06:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320229; x=1787925029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZNohwqjvouRlAnKm9iB5tZeW1CKNRcmkGAU02I+Ttyg=;
        b=HVdSBoX8KhvRmiAiPTLTKGOA0tJDzifdhnCKjgjCFWeCmiqsyH+B6L2/2AAmAxxidY
         RWAwbXndyMNO48eTHCBM5rn2fHNMWzD+kz48TlM6hV9BS2T25POY4d9wLjgN5Cs4OaHO
         mom1EYM095ZMGEEMR0QvOuVt76ncU7TliMhYSEUjKOEsTa2g1RyY8P2OPVNCY9/anuw+
         VpYt+wdJ40oVQoaGaOjfIYoLq4GT4lLp3PhJ2h9R4ony67B36dsAf9s76WuBv0X40dLw
         NoipsM2dMcfnTisEi3yZg2nHUWcgjNINwBMJOyCzUXVh/unRBibSvp91Xn6167j22dTP
         rb3w==
X-Gm-Message-State: AFuF++nVdgiXh57Le3NojlheZnKnDnaR38lTw7a87CPESPfNyucGp8s7
	A8s2dQHgoGJHDZMiS4iaC8yUjmhPmPSTopWaO1edcmiveZrZY7jhiHNG8LdHR/SSJE2zSHYXKgZ
	i5AFl2mZVI5w0G8KqGrUQ/XCgkuY+y/Z7dMTQNW3gIOyiqQnRf+C+MVGYy/LCToGe4Y/D59T4/O
	wb
X-Gm-Gg: AR+sD10z31n/dz3wCd3Uohzhu/pOBqt2otdY02F/88ra/5P6esRiUh34s7Uy6d5Wten
	PG3XJPsGuEbm7Wz5ZI16goIy022cANSN3bGKGnhGdOGiPCMnmIcPYRbDiTh4E7OUr45NZDAtVSr
	rJdftD9s6BPYKpm9lKQDAotCmTuuSn7z+tk+BVh/wISl8D/rci43VqYyK7HvwkNV3rJq7hEWR/h
	sFTElzIijFxA/EKZoBBcZu5h8H7lO+r/R66cILcFtu67eYEbrd+TLlnZ7LfC28sJ4ySwZ5fmhKs
	Kj4Hj7L7jyjNoKQ6juWE50OeS64nwskcZTldHFfl/DcJqgaP7x5FaE7amusPZhlrtk+f+at0UYR
	/drOkUufOYCZHf530PS/WZKDgc206prit
X-Received: by 2002:a17:90b:55cc:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-395c334042emr13744006a91.1.1787320228655;
        Fri, 21 Aug 2026 06:50:28 -0700 (PDT)
X-Received: by 2002:a17:90b:55cc:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-395c334042emr13743913a91.1.1787320228164;
        Fri, 21 Aug 2026 06:50:28 -0700 (PDT)
Received: from mpilaniy-mac.redhat.corp ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4c194d2sm3300502a91.15.2026.08.21.06.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:50:27 -0700 (PDT)
From: Mukesh Pilaniya <mpilaniy@redhat.com>
Date: Fri, 21 Aug 2026 19:19:58 +0530
Subject: [PATCH v3 2/2] kexec: fix error propagation in
 kexec_image_probe_default()
MIME-Version: 1.0
Message-Id: <20260821-mpilaniy-v3-2-76b355399d2e@redhat.com>
References: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
In-Reply-To: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
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
X-Mimecast-MFC-PROC-ID: rSbgaB7CuOecy5-LaETN395pPkX5NbTts16YlOkf2Vg_1787320229
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_065032_203958_15566770 
X-CRM114-Status: GOOD (  14.46  )
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
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
Reviewed-by: Philipp Rudo <prudo@redhat.com>
---
 kernel/kexec_file.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 59fb9d71e9d8..c11a815e2235 100644
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
+		int err = (*fops)->probe(buf, buf_len);
+
+		if (!err) {
 			image->fops = *fops;
-			return ret;
+			return 0;
 		}
+		if (err != -ENOEXEC)
+			return err;
 	}
 
-	return ret;
+	return -ENOEXEC;
 }
 
 static void *kexec_image_load_default(struct kimage *image)

-- 
Git-155)


