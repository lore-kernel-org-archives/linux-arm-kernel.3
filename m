Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDA8EE6432
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 12:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0aSDGMKyT+fMQNL6kGw597IXO3k2kPPSUGq+qvudkw=; b=G4E7uoLnO5jYG4mIijj/pKPivc
	oxqWfSw15Z2y/5uaLKkw/udEkvdShTSzpq3SEV74Y+qaqQTv+iKcV2xPSkpQ2iPMVdAGVToN61v58
	fff30rBSJShBgseYLpuOGig/O+BGYaYHcucDNyc4lIrvTCTzrrLteOV/EH00tpi+dvDub8iwgLGcr
	Df4yFJA7z0/elSyr+NrjMibBkD+nOPjUG5OT4unOARB8jgphzAX6uNGnhUSVRgqzBqucPdtYYFfl9
	+jsaprYJKoYL3Ki+RWTz21uvFBiodvmMU2nWspNwF31WH5Scp4Piv0Nw4NVm8Yt5o6aG185TbZB/z
	GqRFuTgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavDz-00000005y2o-45Kl;
	Wed, 31 Dec 2025 12:22:47 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavDu-00000005xyn-3mnZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 12:22:44 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b70b974b818so984285066b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 04:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767183760; x=1767788560; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m0aSDGMKyT+fMQNL6kGw597IXO3k2kPPSUGq+qvudkw=;
        b=BYcN7Ncjn1Isg1KmJ2dSXuko4+Eb+sEdHqhGl3gJf49R9QnhvuxhdEWaxO3sEW4R5H
         zRkz3FYo27res69F7RQ9O5y0/xDD6NhjJcNDOPyIJ2pjhEUwmyKwWRKzomZiZQQKlhts
         FAcD9l/I69i0unDsQQnzAPUxQJJEG+ISYKDT2jOtSfjM/aXkh2OUIAqg6zDH8ECop4za
         bK3u4M2TD1DO/1ZWFDq8/9gflGASIDkN0AZc1qoO/SFzq2yP7qd3F1a7yzCC7brbzkhL
         MNdth9a9xx2X94m+EIut7ztmHvuJlReVnEFW4YWE+uuiIMFal1glImuEFNZK09Lp9nt1
         N2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183760; x=1767788560;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m0aSDGMKyT+fMQNL6kGw597IXO3k2kPPSUGq+qvudkw=;
        b=cSs1kjjXSVK1I4WxCKM+ibx5QGtsTnM5mTZph2MUs5vnSIEzBzDboHbrIyDpFt35yP
         OUCwfExKC4vAP6vT1H5kBsFwIolcpmPLUrJGeqSG0t0R9trE2meVAj5xbqLeMPL871Q1
         5F5dEk7CZ0y6KnvCYBl2cnBPsGP48zUDMSCD2roxx3IW2xFefdZdlDin7SIPf7hVgUxv
         3CV7Hzx4o38h1XMvq1C8BMODjTRqfei9AcVVa+1A4wn/LSXOOg+/ei6lHBr8Uv5VFfSg
         t/rUsSO3lgB26YzOCPzEnJEpFeLUQfwW1VjFS8vIudae+4DwRlIExP63gpD81PU5NUCr
         JLrA==
X-Forwarded-Encrypted: i=1; AJvYcCX6u3I4MJ+jiUnRHi+FPWj5+Ycpw0AjjN3IpAoHbrfU9th/BcFQXiV2NV5zmrmCBRSKD5Ftyt+VWTxniAe0y5gT@lists.infradead.org
X-Gm-Message-State: AOJu0YyTl11xuwx7HgKk7hDy3ZfHrMOe3zC6xUsRNWGjdfEiXlSeczGc
	m4X8+ibuOEWtjJ6+maLATMHUwh8a6hH9SeLC4Xc7+QsFeIK1zPNuuDc6bZwRJ5QiOmqwFzgOHZH
	IGEBWe1bNkN7xT68CZg==
X-Google-Smtp-Source: AGHT+IF6QCK61/Taq0LVCEy6u2Lh/f9qkwECTfyeXwyFZObuLicNLjWSsvwiJ+SkeSLRWE4V1R+yhLQS/6l+gLk=
X-Received: from ejbva10.prod.google.com ([2002:a17:907:11ca:b0:b73:7b14:6671])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:c10a:b0:b83:972c:7862 with SMTP id a640c23a62f3a-b83972c7a78mr466276466b.45.1767183760503;
 Wed, 31 Dec 2025 04:22:40 -0800 (PST)
Date: Wed, 31 Dec 2025 12:22:27 +0000
In-Reply-To: <20251231-rwonce-v1-0-702a10b85278@google.com>
Mime-Version: 1.0
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2011; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=f+ElsItk3DSISt1bsxPjTx60qDfLwGd+MdLyPyzjyQI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpVRWL4oDnxIVIQOubpJwcZRLcyzDfMlz7wIFAM
 FONlx/oCYKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVUViwAKCRAEWL7uWMY5
 RmH6D/46KKFKWvICb3h6YXEsXSSffucVzMDtCNxV/nON8HqUTVC9QRwy+QA5BR0hrfvViIl1dKx
 QFW5mE6zsjqHKs9m3qdyng4MUI8hLxBMk3ZddZ5++5KMoowDj7M9YW79F70Q5JL8cPNiGTxEn8T
 VOpmnKD0W0uqGzPVPn23nyrMXrCuGOSOlv1Gd7VlP14rVqitTFZNDbO/h3Jxy6lNTukLQ+koVaY
 IfTia3CyF5IhIS2g511uFdNOICKH6TDOYX8thm7ndly6HHx+6ARDy7WILR47BIDGvXOQdbt1kLi
 V6/5WiEP3hVfSFSXEsvYYHcIWFmsvvPJOUUlHKqLTHmMiG5YzhOcIMdWR2xCLaCeAb147Thitc8
 +Ze9StLM0Z7stUstGbYjIUZFQ+V4Rndjy2ocRJH5Ed52rnZN9G1Iy0NTMogqlQ8hkUiNoISzYer
 7JORef2rWkONYm1I2EyDd+XsVaBfYDD7SBf7gj1LjEzjn/cJZqNNetKASeZnYDGe8oD8X/hfN41
 /K11v2L2aZsQ/aZx/TvPkBaD5UlBxpRXYfQLDLE0Xgz2TNev4vNJ6gzjLvwaHsk+5wi29msQ69Q
 ZqqGYocGcZHMGcf7aalYz96ESMDQx6plGafNctmZtxnbAR6RDeb4Gt0M3Bf/FonllPV4dkLOmiO +fYoPkvnNt3oL+w==
X-Mailer: b4 0.14.2
Message-ID: <20251231-rwonce-v1-3-702a10b85278@google.com>
Subject: [PATCH 3/5] rust: sync: support using bool with READ_ONCE
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_042242_961945_4143D757 
X-CRM114-Status: GOOD (  12.56  )
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

Normally it is undefined behavior for a bool to take any value other
than 0 or 1. However, in the case of READ_ONCE(some_bool) is used, this
UB seems dangerous and unnecessary. I can easily imagine some Rust code
that looks like this:

	if READ_ONCE(&raw const (*my_c_struct).my_bool_field) {
	    ...
	}

And by making an analogy to what the equivalent C code is, anyone
writing this probably just meant to treat any non-zero value as true.

For WRITE_ONCE no special logic is required.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync/rwonce.rs | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/rust/kernel/sync/rwonce.rs b/rust/kernel/sync/rwonce.rs
index a1660e43c9ef94011812d1816713cf031a73de1d..73477f53131926996614df573b2d50fff98e624f 100644
--- a/rust/kernel/sync/rwonce.rs
+++ b/rust/kernel/sync/rwonce.rs
@@ -163,6 +163,7 @@ unsafe fn write_once(ptr: *mut Self, val: Self) {
 // sizes, so picking the wrong helper should lead to a build error.
 
 impl_rw_once_type! {
+    bool, read_once_bool, write_once_1;
     u8,   read_once_1, write_once_1;
     i8,   read_once_1, write_once_1;
     u16,  read_once_2, write_once_2;
@@ -186,3 +187,21 @@ unsafe fn write_once(ptr: *mut Self, val: Self) {
     usize, read_once_8, write_once_8;
     isize, read_once_8, write_once_8;
 }
+
+/// Read an integer as a boolean once.
+///
+/// Returns `true` if the value behind the pointer is non-zero. Otherwise returns `false`.
+///
+/// # Safety
+///
+/// It must be safe to `READ_ONCE` the `ptr` with type `u8`.
+#[inline(always)]
+#[track_caller]
+unsafe fn read_once_bool(ptr: *const bool) -> bool {
+    // Implement `read_once_bool` in terms of `read_once_1`. The arch-specific logic is inside
+    // of `read_once_1`.
+    //
+    // SAFETY: It is safe to `READ_ONCE` the `ptr` with type `u8`.
+    let byte = unsafe { read_once_1(ptr.cast::<u8>()) };
+    byte != 0u8
+}

-- 
2.52.0.351.gbe84eed79e-goog


