Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28FC10BA435
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VdbZVRP/Ak929baCc2EeOgVlzDU6Wbl9p0jTnb7CIGk=; b=y8qdZhr0592kHUsTJqeu1+MAUl
	/YHf4X+2KPZL76zRs2e1xm/a6vxSsIKW7MOqTRiv0MJMgbegmBSVyfz7sQdW6ePvOx2wOVD7y5N7i
	20/k3E2N5AuwRYYZKr3osXvNIbH8Mzfv5KLOvcsIPDmqPIDP9jZrYqyUK6IpNkeGKw/K6mCuRlWeG
	Rg8bfH1Sx6Ynw7Z3WC/6UO9zTymyLUZuYRKC9jZNL6BV5LFAe72bHo4H/32rV8TSsSJUkI6SjTG/8
	WYNbbePlftIWeYumTa8rHD2fSN7ElDYBLwwsNpyJyrWkALwdIzt47VJidB6MV42No/l1tY8PSanRV
	KwhikLzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627q-00000006v6g-23bD;
	Fri, 27 Mar 2026 08:01:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627p-00000006v6B-0WE3
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:01:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=VdbZVRP/Ak929baCc2EeOgVlzDU6Wbl9p0jTnb7CIGk=; b=ULX3uMpgsGSEUKd1dcP3OTGTZ4
	tRVKAPT9OloUKwvyiyUN0qQ0HoCbcoCEX1zFEyKflnvjU2ly/GJknUcfk8yFtOpofp5SwGS0aYKzm
	a1EZrLekU3Bqj+BLDpWyN7hUJUvipPCyGtlKWlgrfWaii1LUOWQSyqW4Q2h3tPTzRsgmtcXpUhKMN
	trKjKOVbOfWXPtosC8woJlsH9UE3U5lYdhlPDAXSu2KKQoaD/F41HdCs6TIF/wufG+8j/ggMxsRUt
	A1Ag1iQcUTItdgjuxkrhsutQ4/Mc10ZnV/4Gk+Am8oNDixU2fVM6ODEaKgAi8W4oxVGrilFW5kEkQ
	jau9xWBQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627l-00000009vIc-2EKO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:00:59 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-487012ce896so10945125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 01:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774598455; x=1775203255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VdbZVRP/Ak929baCc2EeOgVlzDU6Wbl9p0jTnb7CIGk=;
        b=D5kX164KxkHR2uCYZNZeYyhuFzsd3EuL46OHkwfbU2sLyIvfIWi4up82fgXXPBykDI
         lsx5vtMwa61Zfdy7gQsNi4MV0kCV1kMh6HcPLGlHz0Yyvd9Fy8vFHpojN1rbN9jiaFC7
         UHgkB26Urt10I5dwi8WHpYKR4j5OveM3z7rjciYZTxluubWdphmJrcaq7uam8oHZgVhQ
         +wkyA9frJV10NWqjMM3yzvyQpLwRfPsTPBH8u/wHsNoU3uF7111faqkSWG6kDm5hb+SL
         4BV0QKQdtcwDFOiW6GmzH1ebygwM3JyAxBbmQsvFNP0M6JC2y6znLotFfHkNNb3XImUm
         jTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598455; x=1775203255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdbZVRP/Ak929baCc2EeOgVlzDU6Wbl9p0jTnb7CIGk=;
        b=L3EQoLWAx+Zu2eADO2/fdeMAam/ZlAMjCpPWGSULCN+TQC0ZlpYcxk9/YyM1r0kxW3
         0cKBEEpn1jtol9eiMQ7yi8QVoFdvctTJP2EwAUvwlG5FfdntKlGZu+5oInkjHWkTd1xD
         Z/G76aren/K04Cxh8zStv2Tj3qVA/mN0pY7KUs7kVjj5vLmF0JS7hy94AtT5YfasCJJC
         umG9RE/rw7fMkme6q3BuGF9/D4XeDYSylJ/eApNgJsU9yJSXitG5z55VdCjOUtGgFhQN
         IaFbPVrID40GTsuntzk42VEUSXZaC8aaxySNQYpRE65h7LWaE1coOkIxucTzfUrJbMe2
         m4ig==
X-Forwarded-Encrypted: i=1; AJvYcCX8sUVdDJm72H8aX+WAqc0foN0dDPlo1OtKJCP6W05BCBxYFaVZB2f/60i++58O6ySQDaTTauuQw5gf4RWUhK+y@lists.infradead.org
X-Gm-Message-State: AOJu0YzAFGLZQjkle/U5U+aAKGgTTh7mLbjIzLC3xU9TOeDBmcVKwBus
	cKfxqwNJ9I/UqA+nQfdKsOEDl9eUe1pPbWvy2g5LVAqs0r67o2zV+k513X+9r44X244=
X-Gm-Gg: ATEYQzzk4UiSKmPQ7To5ePIDh0jJGfUwZR2mIDsbyWIx7Arikv8RH1yD4VqeBvFytdX
	7TClgqhmDeDKZ2SEmMNCv3B8b4wJSCg+ai6uyAjnWygmNWQD70PhyiBX695OuXqShuEAyloapFT
	0m2uHNNWcO7rmvguTtysnbbD3dW0vC+Y/bNLa011RGRaP9g9885USAmjKAUMVu9sdshj/sfo0yi
	H5gf1Wl+zsx2lBACZHkyGeLqMhIMuTf15qqZNSBhmDN8uHbyq2+8PGhHEt8dCIAQW1/lQAtcwG1
	u5YDAIM03dMqcXfhGpEd9v9gIWg7wKJP1ygFOFbHuPcXqUqCwUHyqAU9JKjKrFkW+7sgNV0eLRZ
	XfH5+EjoRTFUUVVe0GnNr+SNzEksXDvx0QZUZ+GvfsSlezbZ1pLfCME/RIHVRJdrnpZ2Tp9QZka
	3zZtwrfEyAeNp3tbg4AY/0X4dIfMM468IqPJxzUBWiFB+emJvtp3E=
X-Received: by 2002:a05:600c:8b6e:b0:487:716:2fa9 with SMTP id 5b1f17b1804b1-48727e883c4mr23399585e9.13.1774598455233;
        Fri, 27 Mar 2026 01:00:55 -0700 (PDT)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725fc4827sm12089735e9.11.2026.03.27.01.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:00:54 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-riscv@lists.infradead.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] module: force sh_addr=0 for arch-specific sections
Date: Fri, 27 Mar 2026 08:58:59 +0100
Message-ID: <20260327080023.861105-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_080057_775576_602C4179 
X-CRM114-Status: GOOD (  10.91  )
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

When linking modules with 'ld.bfd -r', sections defined without an address
inherit the location counter, resulting in non-zero sh_addr values in the
resulting .ko files. Relocatable objects are expected to have sh_addr=0 for
all sections. Non-zero addresses are confusing in this context, typically
worse compressible, and may cause tools to misbehave [1].

Joe Lawrence previously addressed the same issue in the main
scripts/module.lds.S file [2] and we discussed that the same fix should be
also applied to architecture-specific module sections. This series
implements these changes.

The series can later be merged through the modules tree, or individual
patches can be applied through the architecture-specific trees.

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=33958
[2] https://lore.kernel.org/linux-modules/20260305015237.299727-1-joe.lawrence@redhat.com/

Petr Pavlu (4):
  module, arm: force sh_addr=0 for arch-specific sections
  module, arm64: force sh_addr=0 for arch-specific sections
  module, m68k: force sh_addr=0 for arch-specific sections
  module, riscv: force sh_addr=0 for arch-specific sections

 arch/arm/include/asm/module.lds.h   | 4 ++--
 arch/arm64/include/asm/module.lds.h | 4 ++--
 arch/m68k/include/asm/module.lds.h  | 2 +-
 arch/riscv/include/asm/module.lds.h | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)


base-commit: c369299895a591d96745d6492d4888259b004a9e
-- 
2.53.0


