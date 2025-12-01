Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A508D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 18:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=odX/ox3aZ6OfRTd6Iy2+oa0/EpTihBm90P4xNQBVkvs=; b=dNd0lGYRQKjl+w0liR+NvEVwlc
	Kjbc8maX+kIhh0OHs31/FAcQRS9nrq/Yq1w8FYlTYDbWXKHlsS5F2RWgXvZj8GfuUPxTl0W5fAisE
	BimfbxnGO9FSNKZmdzExOasgiT2CgDLJmAi/f/tCZf+FK4ZI3sqp9184V9mpDb2+MRssp2bM5jKeF
	oyb2Ozh2Yh8TsXD+ioNcjy3GwHAHYKKyswD8VPdiTfhiT8X60JJFg+QflL0DM5w5/eUpgIZyVDtQf
	Vcf0DIdEgvbpQHa6RYgI/oSGNXHNfXVcQTIK8AcHOWDM9xdK1LTdWHnr8mNe8Z23OGPgkccrxKAgy
	arPfK/Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ8Wb-00000004PM1-2TFm;
	Mon, 01 Dec 2025 18:21:25 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ8WZ-00000004PL6-1PjX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 18:21:24 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b71043a0e4fso489087066b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 10:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764613281; x=1765218081; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=odX/ox3aZ6OfRTd6Iy2+oa0/EpTihBm90P4xNQBVkvs=;
        b=sQ03c0T0ApLZ3wp/18gRttdfvhQU2TCQ5OOp3FViMB907W8rkCIolLlQB+6kyWUToN
         DtISUoMe9ohTybSmu3tquG7TxWjLKSxO5Jr3cB6cIi++ZMSfOMl5RvIUtIDcdBg3WKXQ
         uzV8mLW2kkksFWss1GtzbQt+drddAv9++RcJxcAjBkB/xdAszNh79ww9zFe4Zc3UIAz5
         NVf8b1ToFVh0O9pM5Ge+X1tuslR7CPOX9bh56/3vjik09NB8G27Hxr2PH0Ft+IY0xXjd
         g3aaSBscMc+LsKOGqPvUnMBGE1SRpBECQJoOuWWr6wGy/0VT24YRNyL4Fzl5RUB7sC7w
         Z1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764613281; x=1765218081;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odX/ox3aZ6OfRTd6Iy2+oa0/EpTihBm90P4xNQBVkvs=;
        b=UyZSrnImsjYS1D8VEljDFvjjCg+fzy/0H9vIwAbck3t4WrcFHmCJp1XARTiBPEG/5q
         pbdBp8TWLXSzOW2Cfu+1pw+1VCpVqvChfhiIFzBLwsh8ezbIv9zqgwFOS6DQ89BxbBxr
         smEorTxZ+E2qjUXHIIAsYjWygvPH+CWK7HpBVKdC2HSnpSAFkJPwcoY4JuxvEz/oDIVb
         gjoAvD0Kky6dV7XT6b+XvwfkeEmdu4zon5orkoIyajxrUsZnBDMd6hHn7d0wI8d8V7tX
         gCHYbobJ+6HW4dEJFgF7/kKzv/DmjN2jGPiK3l5+DWApBX9I24B0BVl1fbMYj8HdsjP+
         IRjg==
X-Forwarded-Encrypted: i=1; AJvYcCX7P9ygcfhy+5P4iZUyBWEzMhOFgxem5vEEphkZeDIr7aFc8hMZx8+INdfI/RzIzf1/u+JERaXiNBIPu23eauwy@lists.infradead.org
X-Gm-Message-State: AOJu0YyOQ0aEXTKKg2DzKMnEl6vGRXubq3caQv4B8v2O7MjaqjMgW05m
	Ats9mcIS4SsLm5K3reoWMX+kCVhU8EVHHC8Wfgbfg8z8sFqZ0nmXlGdBuQVoQa7Ine8PJpCYRNh
	iZg==
X-Google-Smtp-Source: AGHT+IHh8EB3gV32tWgbXZNPjCoJvYZ5NAK7xEFvEDfY8RzeyPbORY5fp6hyi+V7tHYcCNBQoIRQPJhBGw==
X-Received: from ejclg11.prod.google.com ([2002:a17:907:180b:b0:b73:69d2:27b7])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:9610:b0:b73:870f:fa2b
 with SMTP id a640c23a62f3a-b7671596300mr4237213466b.27.1764613281291; Mon, 01
 Dec 2025 10:21:21 -0800 (PST)
Date: Mon, 01 Dec 2025 18:21:09 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJTcLWkC/x3MMQqAMAxA0atIZgNtQEGvIg4lpjaDVVJQQby7x
 fEN/z9QxFQKjM0DJqcW3XOFbxvgFPIqqEs1kKPOk/MYbMOyMTPuVxar5oS8RBoiUXB9hJoeJlH vfzvN7/sBPmjymGYAAAA=
X-Change-Id: 20251201-arm-smccc-owner-arch-cdf29f22a06f
X-Mailer: b4 0.14.2
Message-ID: <20251201-arm-smccc-owner-arch-v1-1-71f7d75f97a4@google.com>
Subject: [PATCH] KVM: arm64: Use ARM_SMCCC_OWNER_ARCH in place of 0
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_102123_377623_F733F882 
X-CRM114-Status: UNSURE (   9.65  )
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

Trivial change to use the appropriate self-documenting macro.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/kvm/hypercalls.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
index 58c5fe7d757274d9079606fcc378485980c6c0f8..3e7fdbcc6411f658f5cec818bfa=
d2e97711d37a7 100644
--- a/arch/arm64/kvm/hypercalls.c
+++ b/arch/arm64/kvm/hypercalls.c
@@ -126,14 +126,17 @@ static bool kvm_smccc_test_fw_bmap(struct kvm_vcpu *v=
cpu, u32 func_id)
 #define SMC32_ARCH_RANGE_BEGIN	ARM_SMCCC_VERSION_FUNC_ID
 #define SMC32_ARCH_RANGE_END	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,		\
 						   ARM_SMCCC_SMC_32,		\
-						   0, ARM_SMCCC_FUNC_MASK)
+						   ARM_SMCCC_OWNER_ARCH,	\
+						   ARM_SMCCC_FUNC_MASK)
=20
 #define SMC64_ARCH_RANGE_BEGIN	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,		\
 						   ARM_SMCCC_SMC_64,		\
-						   0, 0)
+						   ARM_SMCCC_OWNER_ARCH,	\
+						   0)
 #define SMC64_ARCH_RANGE_END	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,		\
 						   ARM_SMCCC_SMC_64,		\
-						   0, ARM_SMCCC_FUNC_MASK)
+						   ARM_SMCCC_OWNER_ARCH,	\
+						   ARM_SMCCC_FUNC_MASK)
=20
 static int kvm_smccc_filter_insert_reserved(struct kvm *kvm)
 {

---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251201-arm-smccc-owner-arch-cdf29f22a06f

Best regards,
--=20
Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>


