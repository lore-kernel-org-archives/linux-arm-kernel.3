Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EC2C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 09:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0boECcjjn/VFHFH6rk1vpO238PkXNlP4zHZKdanKNnE=; b=AQbjpbDEuAQBqVdku7k36Q7uaK
	RT7+UJ5eNYVYJbXH2i6gOKniWfC7BVyUdlcFdCumRGyGJo9Pno7xo+SwHwKNr7PAnXcFZlW5L/W7b
	cjp3KQu4RZ0hIcJ1F4eCT0YBgZCWVlEhRmCuL30tONZTr3iH49V+g1PDEwtogQD3rFMc2nQkAFIA0
	u7ijr6YrMsliJxcN0CG3sVhk6YFQTRqi4HMSS6EbGck48CNhpmp/7WOmi/WgAgFa7/1stKZ3RV62T
	iCwTr0Dt5JbJI7VC2y01ob03wIytR6CNdJPQXiRJKVWtohjOp4XKCLCm4Tp4Dq6+qk9ZBieYrT/qU
	nnmFTbsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzX-00000003wMj-475E;
	Sat, 05 Sep 2026 09:47:19 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzS-00000003wHh-32iW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 09:47:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so16713765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 02:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601633; x=1789206433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0boECcjjn/VFHFH6rk1vpO238PkXNlP4zHZKdanKNnE=;
        b=bvo5+dMN81NxFEKHgH/Z2XHanSPcEqNfi16BWPqW/xHoUQnr5eMbNfQGpQeD+Vrrh/
         hSRdBh8zbv2GgIPgSEB11Gvu4EcAI+vXe4GRi+ndpJrUE24hz4cmjoO6Ge5TMB9m99qZ
         ZKWVWGxpKYc/Z1Eqgc24M9eva64ZJd5CrvoZibjk0qYymYa4HIzRl215rn9+9ztv+igK
         jKo1HI2ONygU+eM2rciXygQOMGSAUvfyS3HjdjnKE8zmSB037i7t8cwoYqpsj47/I0nT
         SCBBX3AXfzqJVsb77I0HO37BIKPOcrbTIW5j1+bJVkfbu9035YEoQSUFO2T7HVi4ePEr
         Yr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601633; x=1789206433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0boECcjjn/VFHFH6rk1vpO238PkXNlP4zHZKdanKNnE=;
        b=HDhmACnSdmn+9hIzPn3RoaBuhtb+8koRsGmR/9QnnEh/ihJrMB7Xtp/+dvKXTmnSYu
         qw/Td3z3W5XmLkxzzfZt/wpDqrI7IzqNboXVPRVJgYqc2JR5nwjTw1GzEdsMMxvawSG2
         RoJXoEXGeYQuqux1/oa9ykHn2NLWTITGmfdOCJ94Rk93C3yhfviqRfGjR8lh9Z82SaUh
         15JUd3AEwL9U/7peLOPyQwMAvv+q2nFfIRkNor2coyr2KcbnhudcSkojaikHpTd7gIdJ
         cLqZwqsDmYfRw0K8FPqvxrUZxe7Mmrtl0/WxFkc3/S36zvCOO3hCMOazIk6MZi2IY3vK
         Z3Lw==
X-Forwarded-Encrypted: i=1; AKwUvBya8ZSCS8yNP+9AGcUq6U3z/gaI7pXyFq1h8uwx4PHIZd1XNgOXXcOR0UIC3ynNRUpLGy9g4MHI6IJNawIBuJ1r@lists.infradead.org
X-Gm-Message-State: AFuF++m+4qOjBWnWyrAQcs20rYYYBFB4o9UgS7HfXx7MFNXb/tpoe1og
	wczeOpXwD5IiT9t4bdHhn9XAglRMBWM3Y86i/tkOBwAoRrCMMaMmu5RQ
X-Gm-Gg: AYBFou3rFyxiR4O9k4lUblT71/uLYBQFBrBc6ji7GYNPkPxyJ2HkqkTPpoW7Gmqs0JV
	azjMl9ltMhGws0zn/AawUb6VOynuxpJ5IyIAfI4oS+TplPh6PSfq74vPtShcTUxSLgrMAuH9FlK
	T6EVyAoqQ2CDzIizkAjL58f4j7QOaO4NXz2jUmLQbo4crKvXKzYZl904B2Y4kcnOqmSf/Q/dNRV
	qLCeQ72aAdJmTWBqFUoS4fRYmyFh3CatzbDEWccHLD65Q6VEYCvalFkZ3kAeMAYe1fUBll/oJEZ
	lInOLNuO1SlRhL0d47/ggXVhVPBZFM8/Tyl4Vpm00c5G3x6CKUNWRRB0aoRxJ9Mr23YUYdRaUm5
	FuIT8hQoHZIO27jO8OOnxfAvsfJ/cptdCa7yLeFpa540MyHtW76hq8cWmGokVigD09TsvcxpdSj
	Hx0aBOIQHsS+N4KthUhDwiSyXmIKLpSX6qHgArzh3vmgpljVXl4j1ZbBiKpF5mLq5Oa0edjqWzE
	06h+fLT9uAg1fcq51qsxIkIpVQ2OVk8V0Gsask9CVMpMvkUIjs3F4GbI7KbOWvsPkxlkUTlbXNS
	9qMcxThLyD2zJGmBO0pGxBJ9O1T/e8YBOOrd5Nm/LlybLRDuBZSyno2gbs/iauan4/w=
X-Received: by 2002:a05:600c:8b11:b0:49c:edfe:d525 with SMTP id 5b1f17b1804b1-49cf82417f7mr260260105e9.10.1788601632697;
        Sat, 05 Sep 2026 02:47:12 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:12 -0700 (PDT)
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
Subject: [PATCH v2 7/9] docs: kernel-parameters: Drop the omap_mux= entry
Date: Sat,  5 Sep 2026 11:46:47 +0200
Message-Id: <20260905094649.41996-8-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_024714_783040_721F5008 
X-CRM114-Status: GOOD (  10.81  )
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
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
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


