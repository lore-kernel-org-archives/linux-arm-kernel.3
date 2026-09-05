Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0301C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 09:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8I1Jlm5MucKkfjFwaOiA/wi4L8q8pr7cNwUH5XJFU8M=; b=eyoobfXj/2+qrPFBoaqJBB29xh
	OjCvPF74UJKjgIqmGticrBliF10pSZDYNAEN2zJbDp2ULTuAYrFNgET9ZaQkbpJn+OWLmSVfRuRUH
	nYgCID4K6SLrYgLtitMtYFaBdTXckcJHbqNiArf0Scuw4kS++kb5q7hZG5VgpCxVQQcUvGCWncnNu
	k0ut+vtR0wTHG3mIJ40kK4hbNIz4aJb4zyg6lr3jrMXE+aTbc1Ofg4ywfBCXKDy00SIm9MyKhmAVw
	rzAHnhnVDzXyRtBHOZbsrRBrBITUQhJRI8FrEwsPNtwKE9ikJ5p5+NOgLv8MjIIdUCBdJv4LR2OCf
	rFHw+WcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzP-00000003wEX-0lL7;
	Sat, 05 Sep 2026 09:47:11 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzK-00000003w9m-0AD6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 09:47:07 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-482ea739de2so1226253f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 02:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601624; x=1789206424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8I1Jlm5MucKkfjFwaOiA/wi4L8q8pr7cNwUH5XJFU8M=;
        b=Mioh3+AUDuaRNdu7Qcg/wEcJ+2Dvw1mZWnJ7+JQbM5hB7NRx73jKs+4tnSAE/giPZs
         Q+Cc7Nm0pe1GZuoAWjmjjwClKBfGZwkn40UzLTpEloasX/dYqnN2I2rxadUcjYyO8OjL
         G/pC7hV7nPAim/2pwFTuIYbIhZLn2nlKRAkM8yu47N9hB42E64pMYV+kSOHkfe5rkWx8
         wUyLVdAsHtH+vGOC23MMknhBGIlw/GuuZok3yWqs/lYLU8wbcrRZmQuC15uh7YvDYoXa
         3IOX4TLFHvd2h3kvZfBT1WBzjiBAvAU9MqX69dqakFqs158gebCr8irwVED43wbq07X3
         /FhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601624; x=1789206424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8I1Jlm5MucKkfjFwaOiA/wi4L8q8pr7cNwUH5XJFU8M=;
        b=bWOkn+xsrggwvj24H1MofoIJ79yck5QWTfm+qUp+stWb9yqBvNF2i84szMHUZNhs7B
         74FzdymPFpCvRGg41SzhKOHCBFyieZKA+iQClK5pRPDmuWIk/Tv0HlMlp9wTgFVu0YQj
         GuGyTyl0JdZ8IBAq+knQl4nrxsBZGwvSC8s61xqoM9Iw/UUklfdVgtXkDM+Zi+g44K7y
         +KkYzGay2f0E3ZwLqxG/wZEpOV6W+7Ui0siouHfvPPPG5sRIxPwZirpPbEDUQs7IeCEm
         l+QGmLBqTH/BsSNmBkV6qqyiD3uCCDkfS714EgVm78kSEhpqjb12fsMLzpCs5O1rXKav
         0nfw==
X-Forwarded-Encrypted: i=1; AKwUvBzyR9NTe+tD9C7iDDOp9bgy0Dw2LuX+yL8zCIcwZg8FsTSBn7R7qJnlv6jBShGB2Phrkgei7vHIuV4MFhsS/qRV@lists.infradead.org
X-Gm-Message-State: AFuF++kC5RjrXEgJGrqQGBbib0Xn0lx5RQ61igiV50kSoyJN3vVqGnn8
	ipk/wnHg4GI6NR8RTkli1WwuofRjF3ZFg9DXk76RzMmNCZ3YyQscvKVP
X-Gm-Gg: AYBFou3+hj2ithXmSPqIZiVDyi8jkz9IvjMC/aj9PPk6GoYRKYHneKHuZLbCARwl5Ia
	+DKjFAAvUzYLHRXxKv6VWwIXih86t/g9JfXRgvxVGeP59bacKhN+3jYRRC50xXh9trxoHz5bmi5
	uY+GZORkUJOXMRHJseOkb/ifQtnODBfyanebeoXXtA9CzBl3z2+CwWQSs82gH8FioxlqpMlGMSQ
	aZ31ACmA0Lw+oylGtPNo3YAZcrN3KqeD0/GsThVPoon4aqGgYeGQLtD+HFCaJj6z64f0w9MlkS4
	ptkI6bKHaeX94h4mAc0WaSnBMXcOyWUNhSXo7XXemeL5DOafL/MhqpRHK6W4shwrD8S33tWcrz6
	eCPad67wc3SlqnkgCIyNziQdTPXBZaiQi5UB663CkL94FzV3Sb79NeTAgVHF4It1G/WAu6iMpnr
	REYaC9kqNMMBXgX3hTq8CCSDuZO1QautKxvD4vpNML/MiZ0Rp30MnHo8zDTsM03UQLRNZbqGiT2
	/jg04KN0sn0sphZnjk0lygyM4nDIZ/dmsV7JscPrNkY6uHLfkT0sLaumh5/CRVBe1XfRJ0fTTX4
	yPIoN3dwgmYA6uxp9AqhaTmA5ozUWmXlGZQklWeM2dxgc3O0gtNjn1x3qpMXy9FIVRZoFinPgQj
	nNw==
X-Received: by 2002:a05:6000:18a9:b0:485:9211:6560 with SMTP id ffacd0b85a97d-485921165d7mr3155784f8f.25.1788601623937;
        Sat, 05 Sep 2026 02:47:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:03 -0700 (PDT)
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
Subject: [PATCH v2 2/9] docs: kernel-parameters: Drop the bau= entry
Date: Sat,  5 Sep 2026 11:46:42 +0200
Message-Id: <20260905094649.41996-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_024706_097722_F5533DE2 
X-CRM114-Status: GOOD (  11.58  )
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

bau= went away with commit 39297dde7390 ("x86/platform/uv: Remove UV
BAU TLB Shootdown Handler"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 39297dde7390 ("x86/platform/uv: Remove UV BAU TLB Shootdown Handler")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c8d96de4c00d..99d5bb68968a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -624,13 +624,6 @@ Kernel parameters
 			Format: <int> (must be >=0)
 			Default: 64
 
-	bau=		[X86_UV] Enable the BAU on SGI UV.  The default
-			behavior is to disable the BAU (i.e. bau=0).
-			Format: { "0" | "1" }
-			0 - Disable the BAU.
-			1 - Enable the BAU.
-			unset - Disable the BAU.
-
 	bdev_allow_write_mounted=
 			Format: <bool>
 			Control the ability to open a mounted block device
-- 
2.53.0


