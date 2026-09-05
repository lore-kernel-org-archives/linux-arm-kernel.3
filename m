Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D69C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 09:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0rL+/iAM/i65sRrJdGWBjEYqO95wvZ81bUVdK7eRsAk=; b=K0lPYSwP7ZjGFD52dQ6AlW5dXe
	UsgEqfB49u5XEAPKGE1SlKzJXgVD6k3PICnzNAlVUTuA+0krqFctNFso0OR9msosl0fkL/Q/apJ5E
	sx3ccWVt7+CB05Ok7g0JIik+vU4JiD/CeJ+JPup0geb/MIneDAWW9+wSBRZF6MFnB4h5PGI4V4iRJ
	zn/ugHAWfSgREkHIdsEY3Kn3vvdgM+47K+KkdgAoyA88JgN6dR1LzX4YLHwGcasCULeS+UEu1vB7Z
	RmluuSMAQd1bM7rAGN2yZFy6v6HeuZoiss6HkpRn6TvFpXDbuAGFxY/E251VztYPxVo1HnELACBpS
	zN0wSODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzI-00000003w9r-3RxN;
	Sat, 05 Sep 2026 09:47:04 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzG-00000003w8Q-119R
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 09:47:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso15349525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 02:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601620; x=1789206420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0rL+/iAM/i65sRrJdGWBjEYqO95wvZ81bUVdK7eRsAk=;
        b=MKR4aL4HW7q3WHovd6+mbs7mn67jxElRYhgA5wWoEEJ6P3x63X9H3THsm2T2Ahk9k6
         V/Spw5wH5abdd/yHsEFwry5sdnnuwUvtRtqi4/8LigNj3JRfXFkbyOCRCq8Op9lYO5D3
         kVLAMdUpif3iRXAAWFmjaHlNx/IUWguDwiCnTZ8kcxz3EHgudnoVc9Dji6r9EZMBPP43
         0Rjjb2/yrQuzn3PS/dJeOHUdfZEfH/4Sd5o7nNrAG2WlEoBcppeKNLoakHAEPZvHwuRe
         NcO+8HCBFHbGViqPQ4CEuitOHFRj2B9QOHbkRg1gtZILzbXsqaBXmqe/SFPmXZTFxVPu
         X0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601620; x=1789206420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rL+/iAM/i65sRrJdGWBjEYqO95wvZ81bUVdK7eRsAk=;
        b=fgeJvbUptMWgoRVlUaKsRo47Jz7Ftj6vBhxvFNYJr+tMxP2CUpLx/FCa/EswvAUlGq
         XEyRb8INaNoeNv+I3KyTVeJzUIZWpHdb/KyLcuzqHl8qXw+l4n9fEZuSCk3lOPnteIbj
         izrV6f4nZ8swITMX+hL3oyi650SmkVBL7uNO9mBpMFdGW3q7fXu6/oWj+Sfd05yoA9Os
         R1ubJjdLDIWsr+aWnBSixbp1QukybyuIMVuwp11kVWEQT/dhbCf2uCmjwMEhAz1pfrSS
         XI8oflTGHl64EOg/b02kMNduXExmemigrBB+YEbzUelsca2yAajhnKn/OqWaKfoSj9yd
         i4UQ==
X-Forwarded-Encrypted: i=1; AKwUvByIeJZbvBeI/OIjky3vMO8Ln+eRApketBm6kQKl6mFraaoizcHbwO3Apfog7jviFBMMj9ULGBVl2vcZ+Y8Z/u9M@lists.infradead.org
X-Gm-Message-State: AFuF++m1587gizpBbZRvEOBkiDE/4GZvigfrrkEnLvYBNwFJVv9BZuPx
	tMrPN3tk7Olow2L8JqlV+5TyECjrLttRzqJReu8Ma93B3Ui4n38vSKA4
X-Gm-Gg: AYBFou3fsFf9JWTkm60k22QDoMn3kwtCBTRUjHC1dDJEElr37NPSMWzoV10ffrMb8ZA
	N9aKIjemxOpvkzVD7Nyyl/aKjksIH1K6l+odfYLwqNAfBFLU9eL62VvFC+qZjk3Xid3u1vrAIPz
	NKxIFYwF7p/2mTYcBF2SLakPp595zpfwg9ur3bU3UKgQTRzmFB7L9qFtL7eYgUEHOWv7p8bkfLN
	iF0uhygEsRFCCqdIXzP4CZODtMKM39qcloocKdOkMrn23T/HGUNX/rAn/dKo/+X0eYCfoBIA29d
	z30DK42pOJT+8zPpLxqJZ+fQMdFKSHSus5M0usGUMyOh+opC9iSVEbKHfQMPIyUgWRlACxoelcQ
	ET+sGIIRO9F4vtXw4iP1ePyYRZEvb3KopPsX/eRusjpvioE4Ir6li8P8Vb/yUi8zxAsxIfYe5wj
	ecWOAD0rP9KIioa1pYjq5eM+wUWaVHKDkrLnwjq3YsBXdWdSBhs6qfFN04/0ikr9cCTb9Q+NYnk
	OhWGxyyFzCXlQ6nZVfoafd/S8aBGG0g8altOitzTEKHfo5YZbyOQ14gLntYrMTiQyEVgxS2GUgK
	R/XUHGUjSBWCJxfcmucTR57JZTAQF/CNQ+9q8jEG+aB/146Xicm8a6QLeNukaouC03c=
X-Received: by 2002:a05:600c:3e0a:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49cf8267a36mr138818915e9.12.1788601620145;
        Sat, 05 Sep 2026 02:47:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.46.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:46:59 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 0/9] docs: kernel-parameters: Remove ten entries for parameters that no longer exist
Date: Sat,  5 Sep 2026 11:46:40 +0200
Message-Id: <20260905094649.41996-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_024702_297722_6B57605B 
X-CRM114-Status: GOOD (  10.65  )
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

kernel-parameters.txt still documents ten boot parameters whose parsing
code was removed with the drivers or platforms that used them, one of
them (atarimouse=) since before the git history. One patch per
parameter, each with a Fixes: tag for the commit that removed the
parser, so the maintainers of that area are on their own patch only;
the two pata_legacy module parameters share the last one. Each entry
was checked with git grep for its __setup(), early_param() and
module_param() handler and with git log -S for the removing commit.

Changes in v2:
- patch 9: drop the Fixes: tag for 0dcd0a76370a, which removed the
  separate pata_qdi driver and not the pata_legacy parameter; both
  parameters went away in 3c4d783f6922 alone
- collect the Reviewed-by and Acked-by tags from v1

v1: https://lore.kernel.org/all/20260905070347.25902-1-kmehltretter@gmail.com/

Karl Mehltretter (9):
  docs: kernel-parameters: Drop the atarimouse= entry
  docs: kernel-parameters: Drop the bau= entry
  docs: kernel-parameters: Drop the edac_report= entry
  docs: kernel-parameters: Drop the enable_timer_pin_1 entry
  docs: kernel-parameters: Drop the mini2440= entry
  docs: kernel-parameters: Drop the nomfgpt entry
  docs: kernel-parameters: Drop the omap_mux= entry
  docs: kernel-parameters: Drop the pcmv= entry
  docs: kernel-parameters: Drop the pata_legacy.qdi and
    pata_legacy.winbond entries

 .../admin-guide/kernel-parameters.txt         | 67 -------------------
 1 file changed, 67 deletions(-)

-- 
2.53.0


