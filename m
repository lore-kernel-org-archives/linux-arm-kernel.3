Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51006C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 01:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VrhRS/M7q7pkTrLXrhmPne9tuf4NOHwrkARE6eFwxWk=; b=ZWy7fpYZdJqrDOhLYWz1nGZAEG
	6Tw21jlTOcKsG1SvnB3sfBauDwrPsaAcTkjkyZDwevUU9sd/QVYYqAjK+BZ7TDhTpOl7aL/FCL37E
	dc6/zQhhWObgZ2ENrqICWBtj7lbqiwhXrmMZqbxSOgW3VmvskM0tly2N7qsJXeNa2Ldy4f+6QOgmq
	FN6s9u5+dQeFdu5zI+srZsV2HlO0xwR4FTsxxCEyhzEngucW+rpneIt4vYH6wv99T5cQJC6MtbgXY
	YZ3XE/7fn0jqo9+V3vxs+iD/At7UoyE87zzP8Tu2s6iq1rXboCaEjreJXwjmW28TJn5FHw7iPEvzt
	fONufuvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Teq-0000000DBo8-48ut;
	Thu, 10 Sep 2026 01:32:56 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ten-0000000DBnL-3nzL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 01:32:55 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso53320185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 18:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003971; x=1789608771; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VrhRS/M7q7pkTrLXrhmPne9tuf4NOHwrkARE6eFwxWk=;
        b=JyhET+iW/Enxy7V6v7B2sABZUW8yr6UGOowpvcXQlqTK0QNf0XUmvUns2Z8+1J+cZG
         5SYlO5Fd0c6UayD0ktICoBf6FoYvrZAcIBsNbTF+BDywuiDIE51tfKeO74bRtWe4pCHo
         +jrazvvaECKaqXiuqj/ZJqarkrU7xVfaJkWi44BNIF79Pm6w5CAA0y9BwC0amLtVmxt+
         1zzjH+ilzsP7yf3OgRkOvdUMt/twpHnFC7ABiTeHJ5krgOFHT+tuwbCV76OCbQ2LMeVs
         jgN878em1Juo/KgDlSOO5wnHCEujN3C1PNePbT6x1aSM5U8SxtxIve5M7fSkOu35khNx
         W2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003971; x=1789608771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrhRS/M7q7pkTrLXrhmPne9tuf4NOHwrkARE6eFwxWk=;
        b=csfVdIc2JGmSNb87R0hLtfNJqOwC9+1ksfr8+zhZEi+PYtu9/G9Sz6kIfU6CiTX4eD
         bpuY7A1g4dXagw9BhfcE49NBYNqqugWqbQoFrbdsPF6ra5wr2IClaUceuWrIrIiTQWde
         eSfTmrxpWgwf7ynCZyv0Z2zWJxpKQmuUhqn7DN+NSGbn/ZblqfgUJciMHpUZ0DFnUnvV
         lK+fyoCkFF1f0tBlgOJcWvpRFYtaQh9+oSdh3LoQKGmlWx1qB8cDFzUXtykRYIamblNY
         bOUwfHD9vTKDOozFQ2ljKEQztHHn5rya6LKi6s+hKf/qcdIH0gt0LjTBPXPnCNDIO/Ji
         +cHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWhx1kjb49M2jgjF4iYCtA4at+chCRzXOnyBRubgMeUu4ub9Ww6DxmhKM8vkX59jNCuRCpyo/plO1hE9ARZUJo@lists.infradead.org
X-Gm-Message-State: AFuF++nHASUWIdexISWj/Jh1STolcthmSCjyCKTuQRh+TpH0RK43UCI0
	XL8jtbeDSu0DkBxBNn5LM8R/e9La/afjKMGOrFESA3GEeEbUSeDo5mSG
X-Gm-Gg: AYBFou31xrlcSK9qN8d+pWa2i1bq1rktPkGm8Otpsg9odHzX9EgPWeVfncfmrbs+ojL
	1MFAAw/ka5CSrbCqgu1TyRF1OUIbYzIer3S6gRbB8ZMHTZ8jdPpo5VVk/6neqSZeHV0uPMWySWa
	o0SJWN3mD4K/sWihOUkCoFstcTRef2I7rCePJN+6bslYn6S8ML+Zz9EG9gBbs87YCmTVTCn45Dl
	76UBDkOLue0bgmBe+rzR1BHOS7rCVAmXqWsrmlckJ1y/Ec42T/fGIEUHfemkYq4clVbwX0pUevr
	fzciVMWwf+B0OvWyvuEWoRe4DG+43t3KqCNsQB+0wxXRfekKTLrdNyK3CkrSY4ABXw/yhnMhmMu
	y4jJRbdI8El8rdiAuP5nKmsnLKcoUhZzB5JYW9Zz7mLEL0QIuKbXZpb+yWnG1PsQYweGUbb7xCh
	JIkhiUHSqU+NuXyRZXmBLH/tuAZNUkQPwhuBGG4KF2PZYajiScJa/U/dLSdfMWVYzP4SPsmvDzO
	zfHU8392RQ3+CNLT/hzNmzZLUJwdn0hxrx6WN10oiNCD5PPIZl4cC2MhR05N+1tyriGog789iRF
	9XDoi0J4oojbFeXwlvb870bDyzsRcUKmFbo6NoHL/CW5GdauOpcQevpyxjbtI8OfLUbna0BYTtB
	cDw==
X-Received: by 2002:a05:600c:4e0e:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49cf81e6063mr368280035e9.2.1789003970778;
        Wed, 09 Sep 2026 18:32:50 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:32:50 -0700 (PDT)
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
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 0/8] docs: kernel-parameters: Remove eight entries for parameters that no longer exist
Date: Thu, 10 Sep 2026 03:32:37 +0200
Message-Id: <20260910013245.8619-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_183253_957554_B564C002 
X-CRM114-Status: GOOD (  13.40  )
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

kernel-parameters.txt still documents eight boot parameters whose parsing
code was removed with the drivers or platforms that used them, one of
them (atarimouse=) since before the git history. There is one patch per
parameter, with a Fixes: tag where the removal is in git history.
Each entry was checked with git grep for its __setup(), early_param()
and module_param() handler and with git log -S for the removing commit,
and the name is absent from the whole tree at that commit.

Changes in v3:
- patch 3: name the commit that turned edac_report= into a module
  parameter (fee27d7d9788) and the one that removed it (7fc0b9b995f2),
  Fixes: tag moved to the latter (Boris)
- the pata_legacy patch is dropped, Ethan's patch from June covers all
  six parameters that commit 3c4d783f6922 removed:
  https://lore.kernel.org/r/20260607064053.195166-1-enelsonmoore@gmail.com/
- collect Reviewed-by and Acked-by tags
- the "Found by cross-checking ..." paragraph dropped from the messages

The remaining eight patch diffs are unchanged since v2.

Changes in v2:
- patch 9: drop the Fixes: tag for 0dcd0a76370a, which removed the
  separate pata_qdi driver and not the pata_legacy parameter; both
  parameters went away in 3c4d783f6922 alone
- collect the Reviewed-by and Acked-by tags from v1

v2: https://lore.kernel.org/r/20260905094649.41996-1-kmehltretter@gmail.com/
v1: https://lore.kernel.org/r/20260905070347.25902-1-kmehltretter@gmail.com/

Karl Mehltretter (8):
  docs: kernel-parameters: Drop the atarimouse= entry
  docs: kernel-parameters: Drop the bau= entry
  docs: kernel-parameters: Drop the edac_report= entry
  docs: kernel-parameters: Drop the enable_timer_pin_1 entry
  docs: kernel-parameters: Drop the mini2440= entry
  docs: kernel-parameters: Drop the nomfgpt entry
  docs: kernel-parameters: Drop the omap_mux= entry
  docs: kernel-parameters: Drop the pcmv= entry

 .../admin-guide/kernel-parameters.txt         | 54 -------------------
 1 file changed, 54 deletions(-)


base-commit: 986c24e0fe44f844b44d365b71ce831947f50298
-- 
2.53.0

