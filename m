Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C95FEE642F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 12:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnX+YiWBwSFj03NZe+M6b1I0lykasXzPK5veF6o26Xk=; b=cyODyK1k5KGuXt7Qr7DKH1im7L
	1u3XZYnHqrNbGP8r9lF9PQrn/ScZGV/kSZZukyiFkJm53vtNfc5uIvm8U/h+7oI4AThiGGk9apN4W
	eKQzRY2Woax3Ln27H4zNviuVbaOwXpPA9zbaJWHD0lmUzf/aeXzy/qZpVJCQX16btrKwRgZdWJp8j
	SXEKByg0NAATJW+pQicUu9dULFteO8WQDIyaInh1LUgrITBF+hgFJSh9tzRPJeSxu0rvSCYtwYMDL
	71Uezlff9xc2RZ8kuzdfxWy3asw/OW2w7vjThDP62WtHHSc+QkCxVXqpdoZfjS9ckOoRzRgjvD5ky
	Vz4pSFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavE0-00000005y3k-2Y2v;
	Wed, 31 Dec 2025 12:22:48 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavDx-00000005y08-0SNK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 12:22:46 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-430f8866932so8713403f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 04:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767183763; x=1767788563; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EnX+YiWBwSFj03NZe+M6b1I0lykasXzPK5veF6o26Xk=;
        b=h7HHU/5GmO3+eVHGAg0gmjfxESGxuHXJg2+a02++VT/iP+lg+Z3v5F1HnPmwGDjV1x
         wiVRwsOsBJdUeyf+FmrdSuTW5w5RfXlruD6wJwWDV+LG2QXIRLI6oL/sCjjSvxmCJjS6
         bbj9BXKCfIXDwBM44DjurwRkp6QuTAUWpM+PN+VD3d2x6DIdvHYwptsla7sVIRD4WGfH
         6c9i0YhNrktszEaiaV8gba85BDUMeioIMpl7nxctcJCf2DJtOpjURwIiZugEj3zWUweD
         +xjYd2N2T33zp22ES4G39hCBhVUW8pGKjZcIvXSITlAMNOHRaACQa2v/F42XYVQWo+0Q
         SV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183763; x=1767788563;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EnX+YiWBwSFj03NZe+M6b1I0lykasXzPK5veF6o26Xk=;
        b=KC7P7zxdCLNuSj6ELH1KwB1iG4/9u2lI2fgh++Xv3WDxOxjSp/hgwC1fLkNTlNm5EJ
         jp3oNd9JrfoukN/VuXJmOIZeNFaf0VQKVC9fWfNaErfhZeWwvZFbDyieOzr9sqBaNm9a
         paFSnT42AXW5SQ1zEqr1ZKNeYSFnqP6/o00EbLFY6sx4z1emfHkJNNhEBLtTjKb1B+8l
         IoQT5cyxgBfTsRjfa6ALpj6S0Cdgcc0qE5P8Q4ACOA5RyVYFzpOHrZVZFtggVEJ+nj79
         k5yS6T8Ya6oEdWx1YOpvUy0uEgJ2AY5zL4rQbwLrdw/8WEATvrLdaeX1YqsLfQfw3WRI
         gJIw==
X-Forwarded-Encrypted: i=1; AJvYcCUHcaTCFpZPhHo6xAO313Ja52PaWxCM0vd3NQtznVXSr2nmVxYMy2kvDGIT85JeXm1Qw7seE+XZuKFuIiysR+pz@lists.infradead.org
X-Gm-Message-State: AOJu0YwWRSlvTewzYw2N98rjTUZADV5LwpnBdMCzSmmVCirSysIEd4CL
	rXNVparbEyN3XYghgAJCYcBldOxBuEOIwe8U18WCNMyklstDftOfRduhVcFb9vtwrK7xvdjfpY9
	Cy7a+lGTRLUNxThwC0w==
X-Google-Smtp-Source: AGHT+IEVvKcXr6CgV/sO/SopdsqbSp5OU9ou7XeJWfmPxsy3aUaKE2cdpBZhPeJYGAC28ivLbvgGuv+puag4k9w=
X-Received: from wro8.prod.google.com ([2002:a05:6000:41c8:b0:432:5cc6:c7ec])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40db:b0:42c:b8fd:21b3 with SMTP id ffacd0b85a97d-4324e70b2c0mr47793415f8f.57.1767183762838;
 Wed, 31 Dec 2025 04:22:42 -0800 (PST)
Date: Wed, 31 Dec 2025 12:22:29 +0000
In-Reply-To: <20251231-rwonce-v1-0-702a10b85278@google.com>
Mime-Version: 1.0
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1210; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=x48g//vEaovaCGc/+3V+kdS96OVZQrdlR7cVmTcJM3Y=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpVRWLpYz+qsgfDBCA957maLrU5abZ/AV0KNPf2
 x2dVJo4CRyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVUViwAKCRAEWL7uWMY5
 RpbRD/0SaSpBYAhj01HuT6p1Sh0F3HjDBRU4CbZou0WZNZ4WriLhGAdf+MIIjlEt+5DLcmae+YX
 27BXKetHb+p7wJar0/d6qrTf/TQHUwmCyaL950x8UvyGKZjIVa/TCNx64b/oJobA7VmOtuNtFHr
 krbCJy/HsPCYdyTfYX7LhHPaeMGMOZDlhS5MWUgWYmbEo0Jx4LgSaNXEzhQpnmDg88F1vPMjjhW
 no8A0idLJ5umHWtXn0h1OKB0XvRpQTVwo+JZsNk8M/8cFdcvbJQxHrbwuTEGFaIkb01dRY1Ntdf
 01rcHfSx1yu4iyuNDwnwXWxKy6Gk0DisKWSz0r+uqQjJIH5yLwLiZ+oKtGUU50CoT+p7D3XX7ee
 NQYmTAfFErPyMycWpb0rdPLebSye3a2RtXxOO0cCLsGAzKsadQYt9Qyiz/SRaSuGAxprP+2SaA1
 tYW2y41LKbfKByd3v4AXtcjuXykAoAaaZnFcRcSSFxaaLuuAzS1kB42Gdu92hVpMPWBZ16h/RLM
 lf/wjXI1jEitSsib4IBK188r4m5IDfIk6q5hlJM5cvNgfzDpsOBNpz0qvCLfTiIP01+JvimWH6n
 S+0cvXpMJQIc85ahkyeZd7IPV6qu+FHl1qL2ZnTHNJ0ktF6I2ONB+Fvhbz5Z7ky5OYO5MmZfBJO 4eEFKw4YUaLnpqg==
X-Mailer: b4 0.14.2
Message-ID: <20251231-rwonce-v1-5-702a10b85278@google.com>
Subject: [PATCH 5/5] rust: fs: use READ_ONCE instead of read_volatile
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
X-CRM114-CacheID: sfid-20251231_042245_163784_978115F1 
X-CRM114-Status: GOOD (  12.15  )
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

Using `READ_ONCE` is the correct way to read the `f_flags` field.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/fs/file.rs | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index 23ee689bd2400565223181645157d832a836589f..6b07f08e7012f512e53743266096ce0076d29e1c 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -335,12 +335,8 @@ pub fn cred(&self) -> &Credential {
     /// The flags are a combination of the constants in [`flags`].
     #[inline]
     pub fn flags(&self) -> u32 {
-        // This `read_volatile` is intended to correspond to a READ_ONCE call.
-        //
-        // SAFETY: The file is valid because the shared reference guarantees a nonzero refcount.
-        //
-        // FIXME(read_once): Replace with `read_once` when available on the Rust side.
-        unsafe { core::ptr::addr_of!((*self.as_ptr()).f_flags).read_volatile() }
+        // SAFETY: The `f_flags` field of `struct file` is readable with `READ_ONCE`.
+        unsafe { kernel::sync::READ_ONCE(&raw const (*self.as_ptr()).f_flags) }
     }
 }
 

-- 
2.52.0.351.gbe84eed79e-goog


