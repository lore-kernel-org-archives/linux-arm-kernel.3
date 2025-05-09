Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20CEC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 08:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0ylSxYIXWVF0HWz4x+lkfWER0XsKyy8d2lPgWpj2uQ=; b=guhCNhcYOtP+fIs653f9npKBWZ
	+TXJB5y8xKSRmmBrakt3n1IHuBFy0CDoL5qgsTDwVPqVjqw6J6Li3/ynpoxxSnDQDQneUmhtBfsF0
	B1nriXzB5sFB2Mux9JV/eu9/c2GTCtMMQKEE+52b+DAzgzVylb4Iw8Tv9bIMHlcmZctg4vhZacF91
	zwF/78WOJyDc7neRNsHt8S62SFsZpHhFdatjRrZLCHUNbF2KfzVwQB/1N4bYZCXVhSamgznUvjT4x
	/QNmfiSudzww1h6hVDQ2QVZyhw0h8T/wXkWPOPDQZoVp+VKW2Ursxi1Zj0gsnmelfPJeKgfi3b/7g
	uj2EBTlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJ36-00000002vJO-1yCh;
	Fri, 09 May 2025 08:25:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIT5-00000002oGe-32Qk
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 May 2025 07:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Y0ylSxYIXWVF0HWz4x+lkfWER0XsKyy8d2lPgWpj2uQ=; b=Qx71+NjKqbmjja2qMyGGZwQiIa
	BEY6lZyCbaJswGakZyBBe0DFignBM7tPmbIahsNJ/0QKih+D4+MImr4Mcq2hG66qZ5urHBXa/1BhO
	LrPxBoaJrlbh/vbAioqw/WVZxIKhKXejuzcfepl0lixQcTIARggbBxJGq8zLGOsN6Zc9rulFLXfkf
	K5Wso6Upq7LhEF7fhliMHlLl/+EYj6+bO/NIJ7oaCGA+iQeFOwx4kk+KbIsnC7KHqlkmisReg3fvy
	zCq3ePZh1HItNqDNv/zubLpUJx0OSMGqxxJa6o0FSNHzdVfyg8fXqQg8uHu7QSKVp8VN3uH6NHbK1
	4EghZxtw==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uDIS5-0000000GEf9-26Ez
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 07:48:25 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-22e4c94ed70so17255715ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 00:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776829; x=1747381629; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0ylSxYIXWVF0HWz4x+lkfWER0XsKyy8d2lPgWpj2uQ=;
        b=fY+pBBSavQm0cW+5oYEdcRGDrbu5bSqYNLuXu+J1kUia+kzv22RUmlTPYolLXgQMUs
         NUeR8wllHKCoScA37xtnwg1Zgyr6YCE7J0dz1WXtnMVQHicGm+2pli3oM8a2FpfgH6Qm
         BQ1wgvNHo2DcKkMXCIueLoCQsJk8r+5SIfB9C+iVGlfDBsdZBldMBEBpHyYeNYlNuSjK
         X26TjnfP/o2SmNoLX/6WUJ5YnV+9voZ1EKyObrOmeO94xVsd3yqiamvPLlfj0u/3IdQ5
         CRHADlM+fGsILzOkiXjZxOCMFn3vPzCnPHmW3DKGYrwvoEniJxTMkJQ0+pTH5Tq3gSAg
         31dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776829; x=1747381629;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0ylSxYIXWVF0HWz4x+lkfWER0XsKyy8d2lPgWpj2uQ=;
        b=Xv4SoE8oM9omepkgpTFW3gYCiU43kZMCVoXgn0Y3ETBXH/QYABjO6G1s4KFiiXXBnH
         UwbvNC/Ad1PipZ1uTw+b3GsMH8XBRW2fDd5QiTYetmFL+TyhI4dPDwZQ/WmN+0otkqj9
         PJA7ZgKOv1m3V6PTILJMgtm7P4CUt+IYMfq7IYFKp/noZYD+WiC3NyGTxG4ayfr3XoHv
         YKECcsbcDGH+oTs6t6sUYXJvs9pA+tBIZ8HPVsxv2Q4hQLP0upSZtILhvbw/FRhlcNjn
         YdBVrnHhAmaxcl6YYkmOBKUJN+nOn22MLDa71jPTPQfTL6OUuUTpwK0++9aBE8FriIrV
         UwHA==
X-Forwarded-Encrypted: i=1; AJvYcCVogghwL9Sy9cmiQsiaj8IIlCwsnF16YycOS2tZNXb7N1AibqfF1dx46bF9I5j5VS9p/Yl5u147RD1LaGkewjnJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwR9ZyQAj8ulDbNHIEQpoVEG4u3zEV9S6US2JhJq1gPoZzTQSX3
	cm2yAETrAbhTwvMdis1FMZSAr0k5Q2aWYLta1laao3ioiQDIYGbohF3OwuwVxSQH27tDzs1oYsq
	iimvQ3Cvnl4qcqJn3HA==
X-Google-Smtp-Source: AGHT+IFcU+yi4lxCzXOaIz4vfStLTel++2NEV8ETDNWjCPUfioyFnhkypPSIgZhYN5NQ0+YhGSBWxvTzxUTVFzWV
X-Received: from plez17.prod.google.com ([2002:a17:902:ccd1:b0:220:e022:1e84])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e744:b0:22d:b240:34c9 with SMTP id d9443c01a7336-22fc91a9093mr42800435ad.53.1746776829073;
 Fri, 09 May 2025 00:47:09 -0700 (PDT)
Date: Fri,  9 May 2025 00:46:26 -0700
In-Reply-To: <20250509074635.3187114-1-changyuanl@google.com>
Mime-Version: 1.0
References: <20250509074635.3187114-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509074635.3187114-9-changyuanl@google.com>
Subject: [PATCH v8 08/17] kexec: add config option for KHO
From: Changyuan Lyu <changyuanl@google.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Cc: anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_084732_406401_1F3D66DB 
X-CRM114-Status: GOOD (  12.33  )
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

From: Alexander Graf <graf@amazon.com>

We have all generic code in place now to support Kexec with KHO. This
patch adds a config option that depends on architecture support to
enable KHO support.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 kernel/Kconfig.kexec | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 4d111f8719516..4fa212909d699 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -95,6 +95,20 @@ config KEXEC_JUMP
 	  Jump between original kernel and kexeced kernel and invoke
 	  code in physical address mode via KEXEC
 
+config KEXEC_HANDOVER
+	bool "kexec handover"
+	depends on ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KEXEC_FILE
+	select MEMBLOCK_KHO_SCRATCH
+	select KEXEC_FILE
+	select DEBUG_FS
+	select LIBFDT
+	select CMA
+	help
+	  Allow kexec to hand over state across kernels by generating and
+	  passing additional metadata to the target kernel. This is useful
+	  to keep data or state alive across the kexec. For this to work,
+	  both source and target kernels need to have this option enabled.
+
 config CRASH_DUMP
 	bool "kernel crash dumps"
 	default ARCH_DEFAULT_CRASH_DUMP
-- 
2.49.0.1015.ga840276032-goog


