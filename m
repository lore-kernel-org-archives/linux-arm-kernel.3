Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795ADCE7AB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 11:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tQcSzEpSwA6ZBpPi/rTINYX4HBb66yNmYZWYgUBx7xg=; b=r5l4FH8lqhhHSjXKKuQ42k504m
	+sw7gW14BovybBfHu/9YmdAt94IURGx50ijclJzQBvdbtjh8CjoLqjKj6IA0jNH4SMBdCx425RwVi
	HdW5xdKYlE8kpKJJrhm6bWinkT41raQpbo1CLatyg9JUYFXokmkTU55yjBKk0djRd5yxHAWgf6DDu
	gTZwz8qynQC4GEBQK5CYkC47x4e9WTDriAAAU/cfDSwSMMeRYM3lJXya1F1l/SWWNpXNwnSefRfTz
	+7/POUPhZHtxUnVSPuOChswJVCKvK0gJebqGdrJ1x7NBMS2kDFdZqWaaForoE8bI+vaWLa0Nf4z11
	yjCjVlNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrih-0000000C5oR-0kNc;
	Fri, 14 Nov 2025 11:11:59 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrif-0000000C5nz-16vW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 11:11:58 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b5c6c817a95so152865566b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 03:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763118715; x=1763723515; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tQcSzEpSwA6ZBpPi/rTINYX4HBb66yNmYZWYgUBx7xg=;
        b=oN1gqxAlm3wf4U+Qr8Es9d0vChPCzIY+ltz3XvY1sIHl0L21pi6q/mkaq0qHVVoD+T
         78CwgxW4f113/ku5u2ltExDxxcazZ9MRcqfCv3S70Nqgp0qvNswFNZ6MRhIuGYs0a9s6
         nr7wGVB3DGVv53+39WjxFXbZAFEd4vfo0comED7pxOYFt5NOjWUgM8marf8Vy/dSvHy+
         IxXHzaPMhyeo84DHF54vv23D7ab3XivThUyAPgmAeE9gQ5beay/5KCWk9lLBATfrPhu4
         nmB1O6mGwjjdiYBfS6xHdTupGh3LSxJRzdXlEdK8gUNGWq9TE9+oo9PVB+II/wFtNp2a
         8W2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763118715; x=1763723515;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQcSzEpSwA6ZBpPi/rTINYX4HBb66yNmYZWYgUBx7xg=;
        b=UeCIr2L9lR7QlsMR7VBh5foQeQjF0knVLwZwMa7wgI6ep0K3c5uB+Yds6WG1AlbjTP
         D6BppGC1F0JsH5LOCLDa56sRBM80k2rp2POUZOS83zB7xakHftcwQbi/AyKQVnxA/c7j
         7j3yDY8R0RzLFGFRIyS2y2U9MwTg//msK/yzwnNBgtJxybUgZpQn2Dd1utkqsaIXG4XG
         pZTa2HJdACqi0JtehOvFRucZumlU9E04Un5sFhI9MfNMJqpdP4V3YdYbdc2h3HTmpl5i
         cGWp/nkQrVVQPze+CGkSJ4AHlSJFT7WgxdcwyQgkScGEzqFxq7Y1391xpRyHNaAwtrGI
         GnRA==
X-Forwarded-Encrypted: i=1; AJvYcCVuw9SddxoPJlRxwdVegZ+fqZbSBj1pWbOCcRqMD6sxO8EoXCZ03sRjcIk4YJ8WkapCN6NNCZAik8rapUTxZX0I@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnt/rWqDtvK49G3lzZDSDjNERf6jCd/9MoaIsDH8QHn2+jGZ5T
	zbAMXsbswMJR+ao+s2Im95MRkqTDA3vsvHLpRSjxAP9IzIcwdPTpfES5m6dqSGotcuKlxs3/6Gv
	t9XqKaIF2qQ==
X-Google-Smtp-Source: AGHT+IGnWVB505G2W650/nXNH2n0iR9oY27m/GdXw2nME7uc6d5UvqI4cEORymAa2S62GvJ0zkxb/mKrP/Ib
X-Received: from ejcvi2.prod.google.com ([2002:a17:907:d402:b0:b73:7326:8548])
 (user=korneld job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:6d20:b0:b45:66f6:6a0a
 with SMTP id a640c23a62f3a-b736793d74dmr217106466b.44.1763118714892; Fri, 14
 Nov 2025 03:11:54 -0800 (PST)
Date: Fri, 14 Nov 2025 11:11:53 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHgOF2kC/x3MQQqAIBBA0avIrBNSDKWrRIjUWEOkohGBdPek5
 Vv8X6FgJiwwsgoZbyoUQ4PoGCy7CxtyWptB9nIQQiiejvu0FOiyIXrvuFuM6QelUUsNrUoZPT3 /cZrf9wNy+DuXYQAAAA==
X-Change-Id: 20251114-pkvm_init_noffa-ac880547e727
X-Mailer: b4 0.14.2
Message-ID: <20251114-pkvm_init_noffa-v1-1-87a82e87c345@google.com>
Subject: [PATCH] KVM: arm64: Fix error checking for FFA_VERSION
From: "=?utf-8?q?Kornel_Dul=C4=99ba?=" <korneld@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Bartlomiej Grzesik <bgrzesik@google.com>, Tomasz Nowicki <tnowicki@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Kornel_Dul=C4=99ba?=" <korneld@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_031157_356569_601B8AE9 
X-CRM114-Status: GOOD (  13.35  )
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

According to section 13.2 of the DEN0077 FF-A specification, when
firmware does not support the requested version, it should reply with
FFA_RET_NOT_SUPPORTED(-1). Table 13.6 specifies the type of the error
code as int32.
Currently, the error checking logic compares the unsigned long return
value it got from the SMC layer, against a "-1" literal. This fails due
to a type mismatch: the literal is extended to 64 bits, whereas the
register contains only 32 bits of ones(0x00000000ffffffff).
Consequently, hyp_ffa_init misinterprets the "-1" return value as an
invalid FF-A version. This prevents pKVM initialization on devices where
FF-A is not supported in firmware.
Fix this by explicitly casting res.a0 to s32.

Signed-off-by: Kornel Dul=C4=99ba <korneld@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 58b7d0c477d7fce235fc70d089d175c7879861b5..ab1e53bd4ceeea431fc30a87548=
2ed1523b01ab5 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -792,7 +792,7 @@ static void do_ffa_version(struct arm_smccc_1_2_regs *r=
es,
 			.a0 =3D FFA_VERSION,
 			.a1 =3D ffa_req_version,
 		}, res);
-		if (res->a0 =3D=3D FFA_RET_NOT_SUPPORTED)
+		if ((s32)res->a0 =3D=3D FFA_RET_NOT_SUPPORTED)
 			goto unlock;
=20
 		hyp_ffa_version =3D ffa_req_version;
@@ -943,7 +943,7 @@ int hyp_ffa_init(void *pages)
 		.a0 =3D FFA_VERSION,
 		.a1 =3D FFA_VERSION_1_2,
 	}, &res);
-	if (res.a0 =3D=3D FFA_RET_NOT_SUPPORTED)
+	if ((s32)res.a0 =3D=3D FFA_RET_NOT_SUPPORTED)
 		return 0;
=20
 	/*

---
base-commit: 6fa9041b7177f6771817b95e83f6df17b147c8c6
change-id: 20251114-pkvm_init_noffa-ac880547e727

Best regards,
--=20
Kornel Dul=C4=99ba <korneld@google.com>


