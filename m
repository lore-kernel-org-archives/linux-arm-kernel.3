Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2613AC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 15:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9PKkBftLtMMa3V1BGcq/seOYF3kVU6vuT2AmyZI/7o=; b=mPpsJmFCbXSFgptarum077F3+G
	QEJ0cNhJydBAyjjUQSWoDGb/Kz9Mh2JtGIJ1U8DSOnOPyqnGfLAbkrtQMa60x+rnV518ToS49TG9S
	+MtchrMce2b1hbIkSjX4aeEEWXAy5pxQJ8ICx7Bl1CQBfZd1iyfMxAeZ+LgPjsUAHkhVFokSFKToR
	L69temBLB451feLCm8u7VHkX2mOKwAfmWk1vBJhAzI/PRbyLPYc9n39OoWCC2v+37bZ9s2JolaQK1
	WAguSQepF2fJlZOQJRc6cOLcHil6n8YvcecxQDk83U0/RWTdf3fgMsAf/uFVCFt0BE1YR3UONeuYo
	9IpnJO0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJPL-0000000D7P1-2N1l;
	Tue, 05 Aug 2025 15:16:55 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujI9N-0000000CuNv-1D4q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 13:56:22 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169cso5471268a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 06:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754402179; x=1755006979; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=w9PKkBftLtMMa3V1BGcq/seOYF3kVU6vuT2AmyZI/7o=;
        b=JWSp9h5nARAq9Qp2zMs3JRk6fKYoZdtqymGGHLZP/rl/4f/YRRCGSilkUhWb1UIdym
         /8lN7q1twOFPvHSFgJ0G894iuRRb39/+3XWAkfpR574uWS2xhaATUVRUqiSJltcbTZoL
         6NQpgG3ShRzdpjm6PpWwpdHbchHula/qUFm3DNhHcXA2Vxps7OeFNKejdIlOtUXisY07
         svOnrsnLxCcM0mEzLf60bM2G5gCEB1lZIpaXa/OtIsegEIzRn3fZ5AdaIdXXTEK9ZrYT
         F9jlHfbkizNQ9cZF6YwzTNnlaMKIqrtnDzCVo4z5C3Sh+wU/7mMfmivLHi4VDmGACrWo
         f/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754402179; x=1755006979;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9PKkBftLtMMa3V1BGcq/seOYF3kVU6vuT2AmyZI/7o=;
        b=xSyQrxD1+8hc/IH9yKP7ecCuR86aGZetD6YzgR88gxdMm4QM3xxm1SLcwdlwv7BeBz
         7NyWWoB0UXvGcpSzMnGcSeIRZvOZakfIO8UEBjkzJRt1ChKtZDektuxMTx+pFvFfk3Nd
         kZ2IG1B4/dagS+VED3HrB/uMLrUdcf+3tQDG9FsT7TwtlsuGLcDAIUVzw2CaSJpGfNqD
         OTvpczr9YYmScvaz65pdwvPEKujGRR91B9ujqEM5QL/IXBnJ+sDXs0jzLrSG7SVzEIGE
         JUDNIlxtzFJTcD2k7YjxjL/m4f6wbs3ZgcdD+Fymy/ZSTQ9Kyz77HOeIBokmHZ+IB1LN
         D6Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWUGSfJwnTCw8jARgwWDh4d7iOXIdlpVYRWB0sYVDnX2OVpnNQ/f68c8g0urSNYUqX/uNm3hELOj1OA/QsAulBf@lists.infradead.org
X-Gm-Message-State: AOJu0YwuC8vgB+kaFvJIWAKgS1ZKbQIOW3nO5sRak+vDQXBJZzNX9Wz2
	mUo+HkgEleh8ep1rl08o95GATMVoICw6p3iuNipCjiBVHXuomd7DqFy8DSrnClMjopWliSA7H7e
	dtg==
X-Google-Smtp-Source: AGHT+IF5wgTcJEco9zIL9WHK/o1q8g0iW6nGJBQokB85ZIBv7D4+qnKQNfxOZe0YoUBGLdib7WasFyNGmA==
X-Received: from edbeg13.prod.google.com ([2002:a05:6402:288d:b0:615:789a:b89d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:50cf:b0:615:a3c2:2e5d
 with SMTP id 4fb4d7f45d1cf-615e6f52cefmr12085596a12.19.1754402179558; Tue, 05
 Aug 2025 06:56:19 -0700 (PDT)
Date: Tue,  5 Aug 2025 14:56:14 +0100
In-Reply-To: <20250805135617.831971-1-tabba@google.com>
Mime-Version: 1.0
References: <20250805135617.831971-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250805135617.831971-2-tabba@google.com>
Subject: [PATCH v1 1/4] KVM: arm64: Handle AIDR_EL1 and REVIDR_EL1 in host for
 protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com, 
	sebastianene@google.com, keirf@google.com, smostafa@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_065621_327540_29ED0EE4 
X-CRM114-Status: GOOD (  13.60  )
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

Since commit 17efc1acee62 ("arm64: Expose AIDR_EL1 via sysfs"), AIDR_EL1
is read early during boot. Therefore, a guest running as a protected VM
will fail to boot because when it attempts to access AIDR_EL1, since
access to that register is restricted in pKVM for protected guests.

Similar to how MIDR_EL1 is handled by the host for protected VMs, let
the host handle accesses to AIDR_EL1 as well as REVIDR_EL1. However note
that, unlike MIDR_EL1, AIDR_EL1 and REVIDR_EL1 are trapped by
HCR_EL2.TID1. Therefore, explicitly mark them as handled by the host for
protected VMs. TID1 is always set in pKVM, because it needs to restrict
access to SMIDR_EL1, which is also trapped by that bit.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 1ddd9ed3cbb3..bbd60013cf9e 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -372,6 +372,9 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 
 	/* Debug and Trace Registers are restricted. */
 
+	/* Group 1 ID registers */
+	HOST_HANDLED(SYS_REVIDR_EL1),
+
 	/* AArch64 mappings of the AArch32 ID registers */
 	/* CRm=1 */
 	AARCH32(SYS_ID_PFR0_EL1),
@@ -460,6 +463,7 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 
 	HOST_HANDLED(SYS_CCSIDR_EL1),
 	HOST_HANDLED(SYS_CLIDR_EL1),
+	HOST_HANDLED(SYS_AIDR_EL1),
 	HOST_HANDLED(SYS_CSSELR_EL1),
 	HOST_HANDLED(SYS_CTR_EL0),
 
-- 
2.50.1.565.gc32cd1483b-goog


