Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FBCCA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 05:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HZGLmDWL+stpVuTZqTeYWI/wCR8kqrLnXlNhpnZwRvo=; b=d+/bhLagmiOGqUSRvIM4jfdZ6k
	2/WujGvuoSwCJIjjf2Xk9tbm8+jUvIGBOCDO8Nreg+XmV2H6uDAeycKiqO7MLIjIyrL9ST536cIRf
	aSw4zNOVd7p75jj0KbHNeSbOy3o2SU7l4cxdyLA0aRKCRsIFk2p9hpYrUBYf6p+sscUlELEyH97UX
	3G8nJnTQtQBBBjKDuz3NXaqz+k3wkaGS5zyjQ2GnehMgYmNeVpmrlkpUltbx3m6qo2O8mxhn/FdBY
	ueB9zGIhYx64Kpm4+40nqVxY7hkEnr3iaTkX8UvQEFjvd94LW4f8hla6XZ1hwqLQWJnNb2h9q9vPp
	y06GmJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDy7h-000000005Y3-39xQ;
	Tue, 06 Oct 2026 05:53:57 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDy7f-000000005Xe-05jS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 05:53:56 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48870973bddso184757f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 22:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791266033; x=1791870833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZGLmDWL+stpVuTZqTeYWI/wCR8kqrLnXlNhpnZwRvo=;
        b=T4+6BQj8dDF/RBx1osoqH3XlA/7LxB06iMgh37ju7BHCzRGQiTYF0qOhOrtQWYWjk+
         KerlP7e5VkPDLfqqhzw4N2zs/ui8JBuAuRDCwa+BcZPHuTEUX91nZzSX6Un54gP5stIM
         5oBKgPYnPBgqso3TP3nPCCSMnPHOfzFU7haKbAOnb9vE62+E/mimgSg3iRO2dtRrM423
         nfFf7PESzkZZPBMxJPTU/uiiAAA1dGHLyghnkv0egz0c7FJIIVzQECqX8i6OjOrvMdeE
         mEQm1DoX0AshAu6yXGZMJxehNlYlmkZJUEnFPCEdZmtdJzvmpMIScgJimQl6BQIuu+aA
         loHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266033; x=1791870833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZGLmDWL+stpVuTZqTeYWI/wCR8kqrLnXlNhpnZwRvo=;
        b=L/j4e8NJoW1lcer1J7kjsYcQPDK62HwUlhU4pwiaL2cuiUmEKoGKrFhllnHQaKB3/F
         g7dmtaHUgfujukcCPH5rGwTUPBDzYl1KJ95SlI5wXQMV7hb4eRFPdimn7UJPeB+OOSJD
         swUMBEmfr/YVdaxlj90YA0vlpdblipM3Y5n7/ZYQNMgf2LbpuVqNSS4DU99q5ZCx57Y9
         bpB16fv06O6ePpvUyARdpAE5zQ0OfEuiyOSvro3VNM2UQrhnmtzu7neDIdYE11Do9AVf
         1AFQeIHwKTcEUesyLTZdd9jMDI65ToEzMK46/CK4IqFUljfr1vCizfSk3z9C2YcJwraW
         qG5Q==
X-Forwarded-Encrypted: i=1; AKwUvBw0c8uBGlfKmqE4nLf0f0zKVEj1zfKfyeqy01pxhIlxEFO5jPNphc9xRf9u/KjdW+bFL2IQ65l/hN30TmOfHf3s@lists.infradead.org
X-Gm-Message-State: AFq9FYKfiV5JfavmUS9JD9NjMIdTmUfZ2+XBwDfLxNaMH+fmPs07pa9p
	T2irz/btaX+I4Cdo369hFZlDw/djYgfD3h3iXs1iHfeEkEA0/1p1YtbwD3ttvh2t
X-Gm-Gg: AYBFou3LuMZhG7LI/pFHppVFgbKsUUAZSB8bKSNFvGVq7Q0PG88iFo6pPm5Q39EE+OF
	QdrOKLry8DxObJkLF6zyzHH0703FOcj1Wa83iRmmo2Sp5dLAVuATEh5KzK9SCjqbh4rP1GKrYG+
	0Za56kJu7KEAMNVlEDP4vKwHz6v8k0objwqd+g+rVAj21yYZXk1fqFtH1Mxa/CJe7timOApLHGv
	qdpx9Q25y9cHqySDGTATeWMOeMRRlDdYIk6w44f0m7EyiKpeE+ZTvw1Bew3acRWpsqyd/txCpo/
	mu7PXJ6syMEkEYYc3fqR07vtEXVwbF1h2TrG2lF8uM5k+ISyKMApB2NMXQ7ppNbQsmdj5oNBhQH
	bEF3zH5OQG+peuAR8dPk9iQxIFLeYyWRw+bcyZHzXVCW+30vONksFFYyY7G8dx0ZXBTt3RG9CPp
	JHSM5ay9/7wCGNJw7wgAHHYKb3AxTUHVeQvJUcLEHgrRK2xJt65OrI99CSQtwjkG8LEaG9nZvcp
	V3bpn4BpaYarXMZc7Ch1pzs8ujv1zHI9/PBKexEKsKo5ZsF8Bplwr//aXcowXJb6pqjaLj+6Xhp
	2sJT9u6kQLxK8LZRance0tR/WO8CrKmpbywCOsA/pp83LQ==
X-Received: by 2002:a5d:5885:0:b0:488:7892:1932 with SMTP id ffacd0b85a97d-48c6d05e8e5mr554292f8f.0.1791266032361;
        Mon, 05 Oct 2026 22:53:52 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-040-097.95.117.pool.telefonica.de. [95.117.40.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6229e0d6sm7798995f8f.32.2026.10.05.22.53.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 22:53:51 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: mm: compare ARM926 cache range sizes as unsigned
Date: Tue,  6 Oct 2026 07:52:23 +0200
Message-Id: <20261006055223.9299-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_225355_084806_2477F208 
X-CRM114-Status: GOOD (  13.54  )
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

arm926_flush_user_cache_range() uses BGT to compare end - start
with CACHE_DLIMIT. Sizes of 2 GiB or more are treated as negative
and take the cache-line loop instead of the whole-cache path.

Use BHI for an unsigned comparison, keeping the line-by-line path
at exactly CACHE_DLIMIT.

With the default 3G/1G split, unmapping an untouched 2 GiB
PROT_NONE mapping flushes the range through tlb_start_vma().
On a SAM9X75 Curiosity board, munmap() took about 1.3 seconds
unpatched and 20 ms patched.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Based on v7.3-rc6. Tested on a Microchip EV31H43A SAM9X75 Curiosity
LAN Kit with two kernels built from Linux4Microchip revision
8f2c610093aa3d5a7bd50a8d0597be4f0b7a3eda. The vendor function matches
mainline.

Both builds used Clang/LLD 22.1.3, the same DTB and an
at91_dt_defconfig-derived config: ARM926T, MMU, CPU_CACHE_VIVT,
VMSPLIT_3G, CPU_DCACHE_WRITETHROUGH=n. proc-arm926.o differs
by one byte, the branch condition.

An unprivileged test timed munmap() of untouched mappings made with
mmap(PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS). Boot order was
original, patched, original. Each cell is one munmap() call:

Range              Original A1     Patched B     Original A2
16 KiB               0.0840 ms      0.0852 ms       0.0844 ms
20 KiB               0.0656 ms      0.0636 ms       0.0632 ms
1 GiB                9.7688 ms      9.7702 ms       9.7716 ms
2 GiB - 4 KiB       19.4054 ms     19.3928 ms      19.4066 ms
2 GiB             1323.2802 ms     19.6478 ms    1331.8680 ms
2 GiB + 4 KiB     1322.2016 ms     19.3972 ms    1322.2146 ms

ARM925, Feroceon and Mohawk have the same BGT but were not tested.
Their fixes are left for a separate patch.

 arch/arm/mm/proc-arm926.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/proc-arm926.S b/arch/arm/mm/proc-arm926.S
index d94aa8199452..374229919541 100644
--- a/arch/arm/mm/proc-arm926.S
+++ b/arch/arm/mm/proc-arm926.S
@@ -155,7 +155,7 @@ SYM_TYPED_FUNC_START(arm926_flush_user_cache_range)
 	mov	ip, #0
 	sub	r3, r1, r0			@ calculate total size
 	cmp	r3, #CACHE_DLIMIT
-	bgt	__flush_whole_cache
+	bhi	__flush_whole_cache
 1:	tst	r2, #VM_EXEC
 #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
 	mcr	p15, 0, r0, c7, c6, 1		@ invalidate D entry
-- 
2.39.5

