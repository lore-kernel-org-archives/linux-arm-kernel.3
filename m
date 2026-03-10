Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0E7EB105E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 14:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mTgu1785s5aO20nIJwGtvYvJg7rw80/9Czh5nhcWUPc=; b=MKezs22+src7+8Lg/h7OVtMTnN
	KM0RJqVa9HKxFOLa+/1b4UoL84KabW047wRPc6FNxSi+lV9CmKKvG3V1MusoKORJy3+FD8sxzoYi9
	bzLF+j12R9qKy+vKwwB/GGwnqzzLDev81/jqVhrd49UaDfswa1itf1l1Rk9wAeNht4fLSCxx1K0AP
	0QxpNuUOLptuULfhMsfxXveLBDo6VNeKrEUKK/vgVvyK0OitLUwwcBHXWc/aLZKFRKH0P50Vk79GP
	5r97U+0r63WWupTFzvrcDkzMrpGbDPRIUREHy8vis0vhsDRH/5k9RIMVCZ2mGZ+1MKixvyxixmMdj
	GrBH0wxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyBr-00000009i6a-2Gk2;
	Tue, 10 Mar 2026 14:36:07 +0000
Received: from mx203.easyname.com ([212.232.28.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyBm-00000009i4z-2M9i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 14:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=peppergray.xyz; s=easyname; h=Content-Type:Cc:To:Subject:Message-ID:Date:
	From:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mTgu1785s5aO20nIJwGtvYvJg7rw80/9Czh5nhcWUPc=; b=qF0zP+Odhomk9Nqu5KkzmaH94O
	qqgtTYnwN1A74gqroFe2jMlQKAROIYmOVpBEmJ4nzEB7RKtLXPXDL1V6pQVmdOigCCQiPBjsyI3MU
	nNC/MzNR8mv8GNSMATv4O4QSEVfSCFYZe1m8BXV3Z2N7Src6SYrNAu/rrfg31cE0jUKeZ223iD4NM
	iuEBjBeenfiNYHaqrHB58MP0fwq0KGbIRXcrRMs1WM4JvRP2I50RGGr7xKk+2JKm6yy3PHgftnu8f
	WCDgmGOWQX0NjD7om4D5t7jRBljbVnS91EyHjsqruH1/9P3GQSr+qwPVJt25lykL8JtGxEaXH8juU
	LX4QS8ZA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=peppergray.xyz; s=easyname; h=Content-Type:Cc:To:Subject:Message-ID:Date:
	From:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mTgu1785s5aO20nIJwGtvYvJg7rw80/9Czh5nhcWUPc=; b=qF0zP+Odhomk9Nqu5KkzmaH94O
	qqgtTYnwN1A74gqroFe2jMlQKAROIYmOVpBEmJ4nzEB7RKtLXPXDL1V6pQVmdOigCCQiPBjsyI3MU
	nNC/MzNR8mv8GNSMATv4O4QSEVfSCFYZe1m8BXV3Z2N7Src6SYrNAu/rrfg31cE0jUKeZ223iD4NM
	iuEBjBeenfiNYHaqrHB58MP0fwq0KGbIRXcrRMs1WM4JvRP2I50RGGr7xKk+2JKm6yy3PHgftnu8f
	WCDgmGOWQX0NjD7om4D5t7jRBljbVnS91EyHjsqruH1/9P3GQSr+qwPVJt25lykL8JtGxEaXH8juU
	LX4QS8ZA==;
Received: from mail-ed1-f43.google.com ([209.85.208.43])
	by mx.easyname.com with esmtpsa (TLSv1.3:TLS_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <hello@peppergray.xyz>)
	id 1vzxsY-0000lk-Q5
	for linux-arm-kernel@lists.infradead.org; Tue, 10 Mar 2026 14:16:12 +0000
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6617f0bcad2so7742799a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 07:16:08 -0700 (PDT)
X-Gm-Message-State: AOJu0YyEZnnWD3Nh/vU6LExWXHQvkmDtlIEWgjcNYTgwuxOVUt1FZZiR
	h+MbTrrNhLjn74alNfLrJpkXb1AEBfsBQYCLw2GCvhxByi+yaRg5XngnLaFp38NpYAKbxP+in2y
	ajc5eflJydoEB7yyUbRHKCdpcsb5MDZE=
X-Received: by 2002:a17:906:7307:b0:b8e:fe3c:2255 with SMTP id
 a640c23a62f3a-b942dbcd330mr853312666b.5.1773152167871; Tue, 10 Mar 2026
 07:16:07 -0700 (PDT)
MIME-Version: 1.0
From: Pepper Gray <hello@peppergray.xyz>
Date: Tue, 10 Mar 2026 15:15:56 +0100
X-Gmail-Original-Message-ID: <CAC+fAGbCjQSGbtkbGr5Qb=tPez1i4KZ7TtC0DPHxGbC0wLvBAw@mail.gmail.com>
X-Gm-Features: AaiRm503pGz-nb_M9Lz3egtWB6_FCbOps3F_-QJ5XL4fGPd7A88B0Kv0vylRoWk
Message-ID: <CAC+fAGbCjQSGbtkbGr5Qb=tPez1i4KZ7TtC0DPHxGbC0wLvBAw@mail.gmail.com>
Subject: [PATCH] arm64/scs: Fix handling of advance_loc4
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_073602_593740_EB30DA5E 
X-CRM114-Status: UNSURE (   8.91  )
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

DW_CFA_advance_loc4 is defined but no handler is implemented. Its
CFA opcode defaults to EDYNSCS_INVALID_CFA_OPCODE triggering an
error which wrongfully prevents modules from loading.

Signed-off-by: Pepper Gray <hello@peppergray.xyz>
---
 arch/arm64/kernel/pi/patch-scs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kernel/pi/patch-scs.c b/arch/arm64/kernel/pi/patch-scs.c
index bbe7d30ed12b32..dac568e4a54f23 100644
--- a/arch/arm64/kernel/pi/patch-scs.c
+++ b/arch/arm64/kernel/pi/patch-scs.c
@@ -192,6 +192,14 @@ static int scs_handle_fde_frame(const struct
eh_frame *frame,
  size -= 2;
  break;

+ case DW_CFA_advance_loc4:
+ loc += *opcode++ * code_alignment_factor;
+ loc += (*opcode++ << 8) * code_alignment_factor;
+ loc += (*opcode++ << 16) * code_alignment_factor;
+ loc += (*opcode++ << 24) * code_alignment_factor;
+ size -= 4;
+ break;
+
  case DW_CFA_def_cfa:
  case DW_CFA_offset_extended:
  size = skip_xleb128(&opcode, size);

