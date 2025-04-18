Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65858C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 17:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmDYdCFy/X2BM6MIhNTfkBMtV16BYD5eNM/8mtgykck=; b=v2RdPP0qkiwMBsc6FbdwVTC0TE
	KLwdRrLP7HxbZHX9t3EZawMhEWhAwRTkBgEQ87QuvqaCmk8KNFWPAOYWMKCoL9gnUOb7bIKWAoGGf
	Ecv01nttx8rHBtZRFpvIIl+9QKgN2/5Hva98N815IxiWE/GLPP3vCqhW/SdepgGXAQEkwJqje0IRW
	DmB9SnDG48qfiplwdTO+a63rm0wlHeoCFhLJKxEpcpTNtSUpAPcWbqItoRYs/1Gu3dzyizbEp+LXA
	7K333IeZZ2z1qO/csr96WCN3mcN6lzIsI8e7UZY2irRrelCvmZ0BJMFDfenRzT6FeWOfk2i4Shgsi
	bCaXu5qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5pIV-0000000HBAH-14l2;
	Fri, 18 Apr 2025 17:14:39 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5p8o-0000000H8mE-224u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 17:04:39 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso1814474b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 10:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744995877; x=1745600677; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GmDYdCFy/X2BM6MIhNTfkBMtV16BYD5eNM/8mtgykck=;
        b=DBcnuIz0QGfzcjyx/LRJGoA2IqZleFJEUaloyFLzp3WgCWjuHpFYiv8VuDM+hGHY+b
         b4W14a5Cup5mzkmqWlUCLu17qLqfXA023sK7pv3wELXgC16w9mcD//UugkeuMxt7VY+x
         iOH4/DZIqMWUFeQAyWpSPHnH2LcNooDaFl9OwxhLHXJIlHeAdICP25bsG1yD6KGwMsX5
         txHQLY8IxI1Xo0u5TIB7WMZyfgIUhp/XEc/BO46byIEgEwgG3EJC4rMlA+37VIJ0OLpx
         26DBK43SjBjW5F2Kq8k2aKdiDa3f15y68VOXED7IL9cuQS/bsalSUBHhSuvQQv1ozyAl
         Mt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744995877; x=1745600677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmDYdCFy/X2BM6MIhNTfkBMtV16BYD5eNM/8mtgykck=;
        b=MfGcmRrZzqE/109w/lKdG3XtL1HhI92OaWsRk6wPtVV/7lUXtk3l9Ci+t5HOzi4WXv
         NTMjFJAmlFmb/QB5XvhcjlR2nnSBd06oPJ1BnqCP30kwBJ0r8teDE4wzvMC4FwGMI1Yg
         3Oej3pNV9LbWNdtfBO00A4JwWc110d12cjReWp8QTU2VR+ARBcDPeS8NX4wRyjo4CZtr
         eiK10Ir9g5BZvcaPdf/04G33Os6vGPO9zPc97BHWhxjZw/YHpWjp2i9DgHHVo+P6ue5r
         OAkwLrss4lZGc0izuHsLgzkvCMGUA6VljcT1rG2M+4sglI7t8xN5CoY8p8ZZqkEFM3ss
         2mug==
X-Forwarded-Encrypted: i=1; AJvYcCVz6lbqoXoKVibR0yCeUOuiWkMoE+s16tzUYEfL6QjzHn/Z7T2xmGw2A3IiWJfFMnqX3IVcUwKl+ysVblsYizYC@lists.infradead.org
X-Gm-Message-State: AOJu0YwVAN7qgYZvPM8a2P8g3f34ajI0Pbw5hMqc/V6ocXo9vMIoBSQU
	Uz0SMtNWNYghdarziIr6YjJZirTytmQUXzbXsznpd2umvz8HeSJc
X-Gm-Gg: ASbGncu/QJ8xLZ+eronNRa4On/VtPhujL6uhM8sTvjsjmqvXaQURzb5B083MHdxBkfq
	Zozr+T99LvPUKWZZW3sRsNfJ+XPEKbVH8IOoWwYEKr8mdZKwC99rVUrM8tSXcAM7HPKXEMqUHIz
	Df41uaj6HpjZd1aiudwZUKFuO40m9MgcOFpl1y5JgrC14YZJ1I35fQjc719ai1Q1bVkGYNI4ST1
	QonIswUVlSjW1NNFPd2XTUeSXIqsKkP9M3pRrCO4CdzPPnB+Wy2vfv5VtOV0pyfduYBb2kuIxmT
	Orxic6sFOtAz+9ZWfkGA5tlcdI9NuS82tD3NPRIQ
X-Google-Smtp-Source: AGHT+IFLjBIAYmNf23xJJKoS/fi4jO2Zv3lRydVslbcuKYfFZSoy/LLNwK2RXNGDnjZOnf14RqtA6A==
X-Received: by 2002:a05:6a00:4489:b0:736:ab1e:b1ab with SMTP id d2e1a72fcca58-73dc119334amr4736522b3a.0.1744995877338;
        Fri, 18 Apr 2025 10:04:37 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaace0dsm1823852b3a.126.2025.04.18.10.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:04:36 -0700 (PDT)
Date: Fri, 18 Apr 2025 13:04:28 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Luo Jie <quic_luoj@quicinc.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, linux-kernel@vger.kernel.org,
	cocci@inria.fr, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, quic_kkumarcs@quicinc.com,
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com
Subject: Re: [PATCH v3 0/6] Add FIELD_MODIFY() helper
Message-ID: <aAKGHIssRW5jXvdA@yury>
References: <20250417-field_modify-v3-0-6f7992aafcb7@quicinc.com>
 <86sem7jb5t.wl-maz@kernel.org>
 <0c97c659-bd28-45e0-8537-d9be2637cb22@lunn.ch>
 <86mscek7h3.wl-maz@kernel.org>
 <aAJq9mGswYsnAOS8@yury>
 <87plh9xz2d.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87plh9xz2d.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_100438_541673_4493E197 
X-CRM114-Status: GOOD (  31.95  )
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

On Fri, Apr 18, 2025 at 04:35:22PM +0100, Marc Zyngier wrote:
> On Fri, 18 Apr 2025 16:08:38 +0100,
> Yury Norov <yury.norov@gmail.com> wrote:
> > 
> > On Thu, Apr 17, 2025 at 06:45:12PM +0100, Marc Zyngier wrote:
> > > On Thu, 17 Apr 2025 18:22:29 +0100,
> > > Andrew Lunn <andrew@lunn.ch> wrote:
> > > > 
> > > > On Thu, Apr 17, 2025 at 12:10:54PM +0100, Marc Zyngier wrote:
> > > > > On Thu, 17 Apr 2025 11:47:07 +0100,
> > > > > Luo Jie <quic_luoj@quicinc.com> wrote:
> > > > > > 
> > > > > > Add the helper FIELD_MODIFY() to the FIELD_XXX family of bitfield
> > > > > > macros. It is functionally similar as xxx_replace_bits(), but adds
> > > > > > the compile time checking to catch incorrect parameter type errors.
> > > > > > 
> > > > > > This series also converts the four instances of opencoded FIELD_MODIFY()
> > > > > > that are found in the core kernel files, to instead use the new
> > > > > > FIELD_MODIFY() macro. This is achieved with Coccinelle, by adding
> > > > > > the script field_modify.cocci.
> > > > > > 
> > > > > > The changes are validated on IPQ9574 SoC which uses ARM64 architecture.
> > > > > 
> > > > > We already have the *_replace_bits() functions (see
> > > > > include/linux/bitfield.h).
> > > > > 
> > > > > Why do we need extra helpers?
> > > > 
> > > > If you look at bitfield.h, the *_replace_bits() seem to be
> > > > undocumented internal macro magic, not something you are expected to
> > > > use. What you are expected to use in that file is however well
> > > > documented. The macro magic also means that cross referencing tools
> > > > don't find them.
> > > 
> > > $ git grep _replace_bits|  wc -l
> > > 1514
> > 
> > FIELD_PREP() only is used 10 times more.
> 
> And? I'm sure that if you count "+", you'll find it to be yet a few
> order of magnitudes more.

And nothing. It seems that you like statistics, so I shared some more.

> > > I think a bunch of people have found them, tooling notwithstanding.
> > > 
> > > As for the documentation, the commit message in 00b0c9b82663ac would
> > > be advantageously promoted to full-fledged kernel-doc.
> > 
> > The FIELD_MODIFY() and uxx_replace_bits() are simply different things.
> > 
> > FIELD_MODIFY() employs __BF_FIELD_CHECK(), which allows strict
> > parameters checking at compile time. And people like it. See
> > recent fixed-size GENMASK() series:
> > 
> > https://patchwork.kernel.org/comment/26283604/
> 
> I don't care much for what people like or not. I don't see this
> FIELD_MODIFY() as a particular improvement on *_replace_bits().

Sad to hear that. Those people are all kernel engineers, and they
deserve some respect.

We are talking about tooling here. People use tools only if they like
them. Luo likes FIELD_MODIFY() over (yes, undocumented and ungreppable)
xx_replace_bits() for the reasons he described very clearly. He's going
to use it in his driver shortly, and this arm64 detour has been made
after my request.

From my perspective, both functions have their right to live in kernel.
They are similar but not identical.

I'll take patch #1 in my branch. Regarding ARM64 part - it's up to you
either to switch to FIELD_MODIFY(), _replace_bits(), or do nothing.

Thanks,
Yury

