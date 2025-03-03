Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AE5C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUFxaeOa8MxkhoOaa265B/ccj1bobA8YN971cVAYoCE=; b=TucJ8fl1t73gYatXxopac79E83
	DODU0UKjCXpo9KhPqB12Ov6XAwYjBDBFwqBjKMv/DHY97PSOyBRi+sMg8erS+U0smW4MdUVaDAetc
	0Rj2+5PadFAtrhdEl50mKJhgOFk1pQYsV4VKJMnwG9VSzmM47BvsdeB6Hv82LZXwKnEnFp7u/r4tD
	jGHxOSZay1EVYziDVLgRZEjMgykDoe9S+IS560UvHOAD2P5LNdBObh4dJGV2OBLxenitKQgAUzJRl
	THjpRdZieriVgrZP7oyQpw+biPFFYb7d7ULTpoDPb/vEvx8AokQhjvH4ZNkkp5w7N4KkKzsMEpq+K
	HlAMfMwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4Qw-00000000f5U-4Az9;
	Mon, 03 Mar 2025 11:58:06 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3he-00000000Tsp-2pLt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:11:19 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUFxaeOa8MxkhoOaa265B/ccj1bobA8YN971cVAYoCE=;
	b=Y5uWwxgCwKEcrzJAENfdOv9giYLmvYx0m8BkwnRw3rjkGWNDqwO1mi2jZBcU076us9cfpe
	NlIJ+nVEMz8yi0rHBd2d+N1S4xFgN9job+iswQJ+t+uhFMk8qoKYgI0iSixGv80eQRpXZJ
	T36BOlunSnevhikVuciu604kS6m0N/R5WbRALLYbB5QZOKmvkFiWAkJh7ziL6RjXpn1LI0
	NPQ9hz2VV6MqBqjoTxM8BFjYhcUmtPMQBsqvXjWlP8lFjQvInRUewL3iTuYV8Nn0z8aVSp
	FH8tcof86vHWIUGIYK9ADtOe7Q/94P1alvifw6OqsiOaWgUFrp7XuzLhxC0M7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUFxaeOa8MxkhoOaa265B/ccj1bobA8YN971cVAYoCE=;
	b=txGhQuO8g6BysurNHcVyDXbTp4j02hmRD4DuL7Zh74mFtq1/JxyrjKsLn/OMUI10Pa7IKC
	QoVL79GgITZAauCg==
Date: Mon, 03 Mar 2025 12:11:18 +0100
Subject: [PATCH 16/19] arm64/vdso: Prepare introduction of struct
 vdso_clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-vdso-clock-v1-16-c1b5c69a166f@linutronix.de>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
In-Reply-To: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=1512;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=L7kK/MCZMD7r1X/TTNdxBJdzqOQW5bJywl2DJquziWk=;
 b=fJgzjZCc5WkxvrFlLjxD+BfXszci8Y3cDqbkKCkbvF2kHXyYJjhzAfWZAte2yMP84uv4/uX+e
 gS1QU3HJXulDpcBrLb18rkXvBchGsQOAZLb+5338gjRvJQush6GNM2G
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_031118_853456_A491E451 
X-CRM114-Status: GOOD (  11.50  )
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

From: Nam Cao <namcao@linutronix.de>

To support multiple PTP clocks, the VDSO data structure needs to be
reworked. All clock specific data will end up in struct vdso_clock and in
struct vdso_time_data there will be array of it. By now, vdso_clock is
simply a define which maps vdso_clock to vdso_time_data.

To prepare for the rework of the data structures, replace the struct
vdso_time_data pointer with struct vdso_clock pointer whenever applicable.

No functional change.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/include/asm/vdso/compat_gettimeofday.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/vdso/compat_gettimeofday.h b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
index 957ee12fcc54bd7f978fbcd8945bce62327b037a..2c6b90d26bc8fd6d4be87bf6a4178472581f56d3 100644
--- a/arch/arm64/include/asm/vdso/compat_gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
@@ -155,9 +155,9 @@ static __always_inline const struct vdso_time_data *__arch_get_vdso_u_time_data(
 }
 #define __arch_get_vdso_u_time_data __arch_get_vdso_u_time_data
 
-static inline bool vdso_clocksource_ok(const struct vdso_time_data *vd)
+static inline bool vdso_clocksource_ok(const struct vdso_clock *vc)
 {
-	return vd->clock_mode == VDSO_CLOCKMODE_ARCHTIMER;
+	return vc->clock_mode == VDSO_CLOCKMODE_ARCHTIMER;
 }
 #define vdso_clocksource_ok	vdso_clocksource_ok
 

-- 
2.48.1


