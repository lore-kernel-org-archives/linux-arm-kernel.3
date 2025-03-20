Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2E1C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 17:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88p1w7uEcFSCHYKOCDuBHPZGg/x3AAPkfIOOrr6qmRE=; b=UxO/qJD1edjMfMx/pn/lvk31JY
	2diNeLrAh1qyGSFMj7wqrmd5dIt4P7pKH8qAdE+n3BsoPWReXnG2VHrBRefX7/fTurOVMZVunckXN
	OgUvozWdGtzhqd+1Dvey+QhQspHnNJvSJLDzIdzPWsnq3xljVcM1dqPFJzQlMqF/oX1I53L4T0CgS
	EDJ1Ig4NovcI4PNVL2uooNNkhdIRiejwiHrpYOnIJOcmayEYTDGK2FEBKd2oRU5MfdYpQ6/4etleD
	CPxZNV2C4+I9vkDxKbFU18NuCeRWY9N0M5IG40NRM63KrV56ua8S49PBm0XX3JA7082eeejuxQm6L
	5bpZo6Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJgJ-0000000CnkB-36nv;
	Thu, 20 Mar 2025 17:27:47 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJX7-0000000CmaS-2hxm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 17:18:19 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ff799be8f5so1727988a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 10:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742491096; x=1743095896; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=88p1w7uEcFSCHYKOCDuBHPZGg/x3AAPkfIOOrr6qmRE=;
        b=lEptnLmktB/e/BZeoEA03sW/XKu+vAZJt2X2N9Z1rkytTqOWV8lgOzwOhlB7KzE/4h
         ktfWRkIL88dlUNuVJWbH9D6ofdJzsXFBicIN5ePnP+K9jTLaxSCeHkT+lRNzxU2aM7An
         Cy2LnZhGwEkMD3oXxHJhsvgeqmAj9dMW/naWwieL/jbImL/dd8o7rEwiLlJyssQMIfyy
         JA9v1W5gun33qeHTfRqO3EdxflZNgz09MHXe4zYdMJpiV1cl8ZMu+twsxHPXK4IGksHo
         zKMYn4WtzyI/zNSYP+KHUPZwmYLNPaTDkpbtdOtOKjD2Vn6mzwIpAk8Lreag2DYlCtm3
         yHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742491096; x=1743095896;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=88p1w7uEcFSCHYKOCDuBHPZGg/x3AAPkfIOOrr6qmRE=;
        b=qLZhhivS+tNmPq6K4tHlzQCnmm5la5nn+tnA++Re5HY3UVbqDkOLrTCTrI80TML2MR
         YDLVgAgbPExzd3foFtI30LLilQ4VqzqsaywnS5/rAKp8SlRjRGa2IZxPbILpCF+1bzgr
         ENmmTLinPclRZaAQMU+YFPwtInKzI2akEa8NBmA1U0iQzIa4ZXn4RsvW0/ecCpyhe+hj
         iYzDPJ4QrGV9BSzrp5nVlETWdbyjjA/dzTHELp+kqFuq3CnHkdn0c4TyOcThq1JHYw4G
         Rbyu9Bel7kQkJTDBxvOMtJUnrrP3UIaO9G8tI5wgaUg4QYjMOz+PDtf2I1Tr4Its6vlR
         ViQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY8Vy4ntlnkaYnU6JEeag38sC6upmXJD6uE57SBfaKqcdDBsQWDY52E7Zi/vToR/ktmzdPGbc5dcck8Vd2NeKa@lists.infradead.org
X-Gm-Message-State: AOJu0YxR37yr3+hUJcOJgRM0KgsaSx4uavOhMX8r5NZtaoCFrPth9zB0
	zQyu+ldQtlIOCzKJ0Ay6gopQRwpuAdcXbCA7p/tMP/3CGUTwA5zApmZlzMwchQFkcDdumd2bK4s
	Kl94zA2Vwa2jupv3RaA==
X-Google-Smtp-Source: AGHT+IGpaoCewgRhvYW5fa+HpkkDxI6GYIKVShvL+72MGW8IdbGecEsEYFRFVCnEraF7VtF/dPJ/f4MPXZFrOdbn
X-Received: from pjbpq9.prod.google.com ([2002:a17:90b:3d89:b0:2fa:a101:755])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2707:b0:2ff:6488:e01c with SMTP id 98e67ed59e1d1-3030fefe3e4mr5163a91.29.1742491096376;
 Thu, 20 Mar 2025 10:18:16 -0700 (PDT)
Date: Thu, 20 Mar 2025 10:18:02 -0700
In-Reply-To: <d5f7379c-c66b-47f5-bc97-eab90ab34346@kernel.org>
Mime-Version: 1.0
References: <d5f7379c-c66b-47f5-bc97-eab90ab34346@kernel.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250320171802.2325561-1-changyuanl@google.com>
Subject: Re: [PATCH v5 11/16] kexec: add config option for KHO
From: Changyuan Lyu <changyuanl@google.com>
To: krzk@kernel.org
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, changyuanl@google.com, corbet@lwn.net, 
	dave.hansen@linux.intel.com, devicetree@vger.kernel.org, dwmw2@infradead.org, 
	ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, rostedt@goodmis.org, 
	rppt@kernel.org, saravanak@google.com, skinsburskii@linux.microsoft.com, 
	tglx@linutronix.de, thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_101817_686097_DA97AE10 
X-CRM114-Status: GOOD (  14.43  )
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

Hi Krzysztof,

On Thu, Mar 20, 2025 at 08:10:37 +0100, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 20/03/2025 02:55, Changyuan Lyu wrote:
> > From: Alexander Graf <graf@amazon.com>
> >
> > We have all generic code in place now to support Kexec with KHO. This
> > patch adds a config option that depends on architecture support to
> > enable KHO support.
> >
> > Signed-off-by: Alexander Graf <graf@amazon.com>
> > Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Co-developed-by: Changyuan Lyu <changyuanl@google.com>
> > Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> What did you exactly co-develop here? Few changes does not mean you are
> a co-developer.

I proposed and implemented the hashtable-based state tree API in the
previous patch "kexec: add Kexec HandOver (KHO) generation helpers" [1]
and then added `select XXHASH` here. If one line of change is not
qualified for "Co-developed-by", I will remove it from the commit message
in the next version.

[1] https://lore.kernel.org/all/20250320015551.2157511-8-changyuanl@google.com/

Best,
Changyuan

