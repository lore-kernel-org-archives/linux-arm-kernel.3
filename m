Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A8BC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 07:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FA625NrqD4qvBQNaAhyUhXitr38lRtVRqZSGqy0z2c4=; b=fsklJnvr0Cls1Vq52onQDogtl4
	wA/KpEmYtHxYw2HIvxtN+wxu1EdVOAQG2ZS5A8sPOqwk88+rE+tgoR9L7FJju9l0GkFvDJSBmnBEI
	5MOVHIo9pxdyA3ChSk49k3oX7BIShLiUgAOlpls5I+0f566gR/s04fk1VcCgrGhjQgD9leRK+2Bmc
	leEahD+CK48R/F7NGDIgCaURfbCdZtx/3WLepA9uCobU5hvJdON1iwBNGFGsvvx0dNGol0YRptv5O
	z+ck3pCqdQOvH3Z+ufcQDd8/giSnzSw4mhJF8xT12Bjsx4NZXhV/2jMYt65NEWPJiE7Rn4FAfOLhE
	HUavy+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN4wL-0000000EwCG-0vPG;
	Thu, 05 Jun 2025 07:23:05 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN4u2-0000000EvyB-26hb;
	Thu, 05 Jun 2025 07:20:48 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-742af84818cso509788b3a.1;
        Thu, 05 Jun 2025 00:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749108041; x=1749712841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FA625NrqD4qvBQNaAhyUhXitr38lRtVRqZSGqy0z2c4=;
        b=eKM/JMxUhJRnlh7BzrtGvnmbAHx7p3w9BO9wn49uXR4FAYKuu9egtq4PVnTGORKyI0
         FQv8gZg2aJG+Krtigq/HJcP7UR7pqNYOX2GVb3RCdPAunPj8+nVO9w/mOOtWmviyOwpv
         6BUeio3ekPFcrYIDFzofbFFBJeQks3TElrBcnP4hFc13Z/483bxEBwI9mQU1ms2pAEoq
         e8TIsemunm2qL/AwXTaHA0ZfaoVK5OKz4GdlLRX7i9Ap6bV8yMtlvB4IU+UYo/LABVh7
         kXZOGKg5NaNIgK/tly7RGAowKuZOI3F5ZBgx8AUW/i4nKaCSy8KLEjmFeeS2UijsrJHi
         ti6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749108041; x=1749712841;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FA625NrqD4qvBQNaAhyUhXitr38lRtVRqZSGqy0z2c4=;
        b=hnR3UH4JwpMNz12Be76av4n7Lye0Ro+RwEQM35bcBLI4WZKisD01iJh6r4XEa/M5pM
         KQqv7pwz4XJrviDFUlbpz+Q/tEvjGlB3lvfFi+acTYfYJmwT0SXjql8JP6L2GBVhlm9D
         B9+tilmX2wnORdanp0Qw/JbdjVz1r2ftLJnNwCjAOfcZVDGqsvljufltz2zQEGwT4p6A
         6P5CbpH3ksAlHBTVeFQyZNnVwZ+eOnfYqqzgqkMU65AcuT6B6x44o7TDirKA84DdZDyW
         C8jJPvICIx3KX7VepDrPuFlcYH0pgjaBxUHU31PpSoHBYangkeMMclCEPH2A4mjrobZe
         8irA==
X-Forwarded-Encrypted: i=1; AJvYcCXKtbbi+0Cx+rBh9zsF6+FlFWB78re8UmjjMjBD4YQOdxKUzjgrQicyzdB0zTElM+vRdDwnz5Ha8YkG9xU=@lists.infradead.org, AJvYcCXLdjVviAihyvFUidn8BV/bhwVXUANQXmfa0plVmC8VMcQAvpetwUAWljGo/gCXUhyGV71SFGMXzsWqMq3hSUft@lists.infradead.org
X-Gm-Message-State: AOJu0YyZmobpjAjVQzZoT0Le73t/jct83qOAwcE03ixX51W/kdY7R6Zj
	1xnBJ4u6l4uHYRpHlY4zMCyosjtEMkZfV2Svj5L4+iM4srz5hIj0GPt7ZT9i1TYe
X-Gm-Gg: ASbGncumRWn639ENJnlcGzDYFU2EIU65ypLg669siLLsPvY8fCBBoAiP5MBwy6I3iMR
	EwPmng1vGa8VMO+S24qLjiHEtGYmQ6ph36Mg990etyYB98ja8X7QoBZEyFotBy+BW3vdXIoTFhL
	aDfl5uhRaCzIEytER/E+9YQWmhRCM07FoDa/PNOPnVpR0HOKY278GgDpjbtkpak0KgzKavhL6XK
	M4FuljLRAXWgRqve7BAj7HEQDh6Wlvk73TfSvza3AXFT4U/31PW0dFOIzdc3dLnWh4u6ox46qTP
	8hUgVnbOOJj1XMLePXsh6/3SUvdYjyjer1Km4jivzd/UJFVXxWIzgCJLLWZkPvr4yaG4CJX+S/p
	6jPdfwKge11gz6+LYAoBr6Tu8tuvaDYmVqQ==
X-Google-Smtp-Source: AGHT+IFD//RPz7ru1g21LutghSu3t+G8Yuhv3ZX4QuwTNEkZ18KvKr5lhdrA1j/AUPiBIQk/dzX11w==
X-Received: by 2002:a05:6a00:853:b0:736:7270:4d18 with SMTP id d2e1a72fcca58-7480cf8b97amr7468180b3a.14.1749108041124;
        Thu, 05 Jun 2025 00:20:41 -0700 (PDT)
Received: from localhost (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab109sm12229223b3a.40.2025.06.05.00.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 00:20:40 -0700 (PDT)
Date: Thu, 05 Jun 2025 16:20:22 +0900 (JST)
Message-Id: <20250605.162022.1856520286549134654.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, peterz@infradead.org,
 hpa@zytor.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, tangyouling@loongson.cn,
 hejinyang@loongson.cn, yangtiezhu@loongson.cn, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org
Subject: Re: [PATCH v6 0/4] rust: Add bug/warn abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72=GXWj-aj1kPwnH=9mwR=GgrfJ4xsQUK36SFBRedk3oYg@mail.gmail.com>
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
	<CANiq72=GXWj-aj1kPwnH=9mwR=GgrfJ4xsQUK36SFBRedk3oYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_002042_542626_EF8F6ECB 
X-CRM114-Status: UNSURE (   9.31  )
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

T24gVGh1LCA1IEp1biAyMDI1IDAzOjU2OjMxICswMjAwDQpNaWd1ZWwgT2plZGEgPG1pZ3VlbC5v
amVkYS5zYW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOg0KDQo+IE9uIEZyaSwgTWF5IDIsIDIwMjUg
YXQgMTE6NDbigK9BTSBGVUpJVEEgVG9tb25vcmkNCj4gPGZ1aml0YS50b21vbm9yaUBnbWFpbC5j
b20+IHdyb3RlOg0KPj4NCj4+IFRoaXMgcGF0Y2hzZXQgYWRkcyB3YXJuX29uIG1hY3JvIHdpdGgg
dGhlIGJ1Zy93YXJuIGFic3RyYWN0aW9uIHRoYXQNCj4+IHV0aWxpemVzIHRoZSBrZXJuZWwncyBC
VUcvV0FSTiBmZWF0dXJlIHZpYSBhc3NlbWJseS4NCj4gDQo+IFRoaXMgcGFzc2VkIG15IHVzdWFs
IHRlc3RzIC0tIEkgd2lsbCB0YWtlIGEgYmV0dGVyIGxvb2sgYW5kIHBpY2sgaXQNCj4gZWFybHkg
bmV4dCBjeWNsZS4NCg0KUGVyZmVjdCwgdGhhbmsgeW91IHNvIG11Y2ghDQoNCg==

