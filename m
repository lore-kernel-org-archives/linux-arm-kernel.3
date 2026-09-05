Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAD2C79F85
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 07:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFzQQFmCjPVcuR+l7FGQ0u8MffPmow8qd7a6fWjai5g=; b=rVT+EUeRHMPD0/Jd1aCTg3hM+x
	nNDYml3ozp85kmwZMUJeRqgkaSLTuBOuIqTgvSNjj3DvMyRkD1NEMVfVGdtiPTyNJvIlcVJS7GcxP
	oOdkDwj8GOcg46oIBtBl0e4k9JDImE/1pLKFG1jfgFkRHsMyrNwzo9R03O9bzxMa0Hw56qssuAe1x
	Sk3iRPyxLlD/z5z7BRxkNyIOPhCY80/tExmTQgRdYiQKEswg4pXOH1j1Rm9V47hfguwnOLJuJILek
	Nyac7sPF4fApHhiaYFkIfIMLrTtlPPXiDeUlqNTzcUggY5RrPzOdYY5OAPHm7fBgAZLHXNyzw3IC/
	lm8Kd9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRh-00000003lIS-2IWV;
	Sat, 05 Sep 2026 07:04:13 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRd-00000003lFD-2iLB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 07:04:10 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-482dd6ee390so1912764f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 00:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591848; x=1789196648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFzQQFmCjPVcuR+l7FGQ0u8MffPmow8qd7a6fWjai5g=;
        b=KDvseV9irW+gw9Ohpvcj+h8kz3lEdUzXdM8v/QBWbqhASlI4cnGZ2XFvfy+QAiRJGj
         7O1pjJI5svgwRgPhLCyUBmrobk2i2XHvQQuafilZYSmfjCIHD8W1NpxJ8N1P5KjfMbXt
         i8HWRdwXo5Pb27f7KD47RGsuu0rMNtmJO2bAnAvzRjlES+YDqk23DVsuZUlUlp/U+y/O
         J/p+lJQ7zCZgvlDpxsgeDvixwSSdxjo95SKpaPKPAVoEDqP1LBrZqVH1xJVEAL5WlWoo
         G2kEiUbaovdY/ugvlpSuaDlBdTingy9QRXBQjhxGDRr5NpzCP1OwxnpAaV40uHQuhXRm
         2pZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591848; x=1789196648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kFzQQFmCjPVcuR+l7FGQ0u8MffPmow8qd7a6fWjai5g=;
        b=k7265JLn59DPuU6KcERMJQGW5ffNh8xa6wLRZuJWiPPGkUugoi9mcNh/hu5RFw6fFV
         t3lqe/yEPUc7s7iSKQJxhHTDqMSbE86QbRjDn1K03gc/g7SuQxhOVyVQpDiJtpyOR76f
         rhvIg443dIj3VqYC6NPUFXEJU3p89E7qBwr1irbpSSZLME5fXeEs3xEoFO0WUHqWmeI9
         04m4rryIH3NaAC+Hf2MYpFC70SJ9sDhUf9sQdUvyMd5jEFfXnbK7vBzA4XWFZZ/zIgxW
         0g3QAo8L1hZo/fUWtsESla6SZ/LWtXCbtNTSUimV1jgIjZYD91r+I7dPgGs0G0T+gCas
         nNAg==
X-Forwarded-Encrypted: i=1; AKwUvBwB8nrOcF4R6+sDOYTtzOQLMFy2bqofrD/zvqIuJKxIMX6qMsx1p80VuFEA4JHF/P259SPoCXRtFhN7UW5j6JJG@lists.infradead.org
X-Gm-Message-State: AFuF++ne6XDTrz30H3dj6D0qg6G3FdcA+7panBvtmWgpOEaRs4MSItu7
	JW8drSU8gpIYlJqEmqyXi7ikbEuRX5sw0Z9JsusrbVanEzngu7+Lasyw
X-Gm-Gg: AYBFou0TGNyNawOBHE5NqlMFYATnnEnrDQb2rQaz7GurC4Xkz+TKiaYucO3HweJHuks
	yO5yDBEpSeBNhKZENWmCJylRcECgM4s0kMrlcxzDqp5d8bo3hmWaHUDNxLNAR22U1Kdy6w4dk5L
	iAW49pHxOUtLJ0tg9mIZhzVH9BytVDRNJ5yWTEadxgC3SwZvWHAfoK127++I/EaRqg0Ax1yr93I
	cUZwPhjjpvpr01t3HCPXCz94d0tI6HwSBWz9Yc0Ql5CexF/d1FT7hTV7blrH+qrt83vsHnrXyg6
	yyVOux67GYRcEkMAUjqGdGH+PpiY1USiF1+s9ZshTfrRQm+LpvXf4FIAA2w7YBmd7P3NmZaM8DC
	OkviJY2LQ/hGS8e+ckeRk1hw9CCOcTN5UULK71aw5XmR/RgZMPXeXbu0slPHsTXkbLTKWcU2Ae1
	GIWwry1bbQS2YLRTnc0ZxFP39fh9ehRe6sUnm2ixgmu9a4/zpagumTIjrzkJvoT86colnXF/auO
	JhZa2fjvvLR9YduXG20T75MqNbPYXw5eYbA9QjZtah5PPHVnJrYpnlxs2l33mRozeod8gGhoVuB
	sF6SVsijfd3ahB5OhSSJZxcBOkvyipz2zOhrL84srlpwgau+uOULATQ/ucfxZzQ1Y4y0XqgymBV
	ioF6CVaQ=
X-Received: by 2002:a5d:5f55:0:b0:481:503b:b663 with SMTP id ffacd0b85a97d-48587091856mr13328658f8f.18.1788591847580;
        Sat, 05 Sep 2026 00:04:07 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:07 -0700 (PDT)
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
Subject: [PATCH 7/9] docs: kernel-parameters: Drop the omap_mux= entry
Date: Sat,  5 Sep 2026 09:03:45 +0200
Message-Id: <20260905070347.25902-8-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_000409_702343_4B5A7CF7 
X-CRM114-Status: GOOD (  10.60  )
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

omap_mux= went away with commit e9f5f1e45608 ("ARM: OMAP2+: Remove
legacy mux code"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: e9f5f1e45608 ("ARM: OMAP2+: Remove legacy mux code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d44728a45506..48dd273eaf6c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4765,11 +4765,6 @@ Kernel parameters
 			waiting for the ACK, so if this is set too high
 			interrupts *may* be lost!
 
-	omap_mux=	[OMAP] Override bootloader pin multiplexing.
-			Format: <mux_mode0.mode_name=value>...
-			For example, to override I2C bus2:
-			omap_mux=i2c2_scl.i2c2_scl=0x100,i2c2_sda.i2c2_sda=0x100
-
 	onenand.bdry=	[HW,MTD] Flex-OneNAND Boundary Configuration
 
 			Format: [die0_boundary][,die0_lock][,die1_boundary][,die1_lock]
-- 
2.53.0


