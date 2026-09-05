Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F84C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 07:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mRF2sj6EV0Dui3NmrAkRlrIYgvCUUxE0IVt3jvr9R7k=; b=lw1Xc1e/lJPHQDy4Zkq5P4NRL6
	acnWb1RmCOPwBG/zi4duadwDoiGLxwGfO1n0jd6BAE1HDAfxy3ctpaKoxu8OVAzASxOfuhG/nwdU5
	r6BpoLz90Y7Y6OyJrAZa2/codjH/FHY4E/M0AopJ1a53AUCceaRHP0rxuCgggNtlqkV2z7sqFO1I8
	C6bvlgfJFcrNYfId62WeLuvm2Qtmu8LMEhMVVwjcAsEFD7BxcHvufKX5/SifJ3D6dp2SaZN2hDuIr
	vxj2t5ebB1BmiKV1FlHAFd0qzfW8On1t8/k9kKdFFCu2mwvQfegB552LYDMWP7BJjRA2YRW/I6R8l
	mgrQ4HAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRT-00000003lAh-2DoJ;
	Sat, 05 Sep 2026 07:03:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRR-00000003lA8-19mS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 07:03:58 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49b965570d7so20648475e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 00:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591835; x=1789196635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mRF2sj6EV0Dui3NmrAkRlrIYgvCUUxE0IVt3jvr9R7k=;
        b=BWL3DuqwwFmE9FOnNxrpUXsZqtGgm3yhFHCZDzdvrnmyzStFYuNW2QYSchCJ7KcjeB
         jZy7D2VfWlA6xE28U7bilCZy6E7gqzNplZWraU6nIpjp35urOJdJ0iqKiGQDF6MRKfm/
         /atm8l6dGZ+cI08Kd93XRhFz4+62qYw3FSoiRaaLM6D2XwdRai/F2HfGSNhe9ziXwT5U
         LzZZV2EfpiMfrzv4yr2ZP6D8xffMOQUPlrLwJgiVTEvjMYuoHhLeaSvbKkKHWAB2VRHT
         TbhFTCHbxzFtEeU5waeVO6kOIt8NRrSuixV5x/bCZCR9p4/4rq/qN8L4nQ5dNPD5okSv
         saIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591835; x=1789196635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRF2sj6EV0Dui3NmrAkRlrIYgvCUUxE0IVt3jvr9R7k=;
        b=MUI4Wp20nFovp7OOtJdqh4nfXiIFU6Oh6PUrVsgNJOkMiIKM5qDGVJvuGTYCky1SZM
         U8HLAZBjRtfXi1RF9jqSig1M/Ow1Szp7V+Z39sWBMhfRKF/7b0CLR8iBHdwIFN5ppDPg
         m6q2XSeqlHDb6Z2zQBQQ0F5qcJLGgtD9x38vOHsLK1SEuAAJ544G64tVQluPJh1pcCV8
         5IwzYyIMBfqEsvx+ZCU3SjxyuKSAVzvuFZJyJTJdiW1iZpa2X21dxSkEh0A751AySHav
         Mpa3Mg0vD9vAA+7W+fXXF87+JL7P5NOEIdzFKkAIHbS9j6+y7WmndCgGrQlVNpFl9H6D
         ldEA==
X-Forwarded-Encrypted: i=1; AKwUvBwSsQR4Ns7Q8lL+cQDtCnSlm8MEln+qrRN3qdz1HolYdfKYnpnTq3ya8wi35Ve8o2mRrJT8Ab5mW3+QFwq6X9Uz@lists.infradead.org
X-Gm-Message-State: AFuF++lhDO72vzwBxdD07vzMy1ZAlQVpiVbcjnIt8Kgz5sy6cykHK8OK
	B27DE21kdigJTKUXjFsii2FhW/0gcdbxESyH0jJcJ6oNfM4g4cdOiU47
X-Gm-Gg: AYBFou33snGN0tzBdG16El8xf3e5+rf1SD1aB9gEXIw8fG8gDMTex6/kpQcFoEcNvwS
	zQ77uLXwE7+lcWyroV6RQbUSUQskvte1ngnLjMqty4b0lEJ4oziddzPTSx2QM+MZMaEH6PWrlhr
	xmIqe4KBzHbWwNEVqtHm+aB0fJNF1ed6gSGrFzAUaS1xPx9L/qdug5EEVxMkXSU5rsb/KqYJipm
	F7wGdrJ+xXAJbWAioX3mCvk735ccrcZ2kRqf3qRP6HCbO1rTI5sOm1N5rzLIJWb3ywcek2GZmEm
	AlJgGpejGOUmP5Cy3xssy7Np2UcCpx2rxjz8t9Er6lPCmLJ0z/8bzebyDnleUnCjcEcPvhEdUxo
	tBAtBTDm9qHVsdTJng1vDLoh1TymxdGoRYdt/mm1JXPaOEh027SoadmACMTu6WmFbz6+Bt/BcxG
	xbop39JlEM616wRGiPnEkknYKVQhplvsHTsYTTuhLjcvkolWf3i5ertXV6tRhAkNfKNFpMCYNKh
	QChG6Yk+Ae5JQVX2GXDqckffXJUoXDcJbCC1MKgzRSzXi+r2C5GxbjOXWCUixsUc2SlLBaHdFu+
	8k9FWYNBshF5neoXnocL/1JS8CoRWAVJqdN7ZE5zdKWAGvJHwMpFhfnuzMVE3FP/2c0cSIUJ
X-Received: by 2002:a05:600d:864f:20b0:49c:fc6e:8cbd with SMTP id 5b1f17b1804b1-49cfc6e8ed8mr59365875e9.33.1788591835143;
        Sat, 05 Sep 2026 00:03:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.03.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:03:54 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
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
	linux-ide@vger.kernel.org
Subject: [PATCH 0/9] docs: kernel-parameters: Remove ten entries for parameters that no longer exist
Date: Sat,  5 Sep 2026 09:03:38 +0200
Message-Id: <20260905070347.25902-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_000357_354492_6D756B2D 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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


