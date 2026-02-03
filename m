Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C3AE8784C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UN47FJfHc7xTLQG5hcvh1Zikbidw8gYJs4hF8/nbHFQ=; b=PMIIeb9B0cjaK1APJmWCe4qj9E
	JB8M9WIABXgnN4oLCNTzBnXWHGLk6bcNDDO8I7vkM7UkcO2SM9xpOb2mVz1DC3+8+BaRDbgTUnGCx
	VGG8aSqVUocInrL5cNVxs+szt+aBsrmm7sPq6NhawM0bDwo8am/IHk/wLf1sEUU+7gJ3oRLtD2Z0R
	6K3skuY80S7E1VCptiSZDyYXIXcmAmKy7ELay9K5J6SwcXXTa6mEL6T6+N1mTlDqDty/YD/LtO8vM
	sY8Bljso4KhS6XaooDBxc1zryRhypK/FqC7b3cyOxfhUQ1ta376eIAt2xvonoMmVCidbSPkOIme5T
	mdVdsTIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKxT-000000077Fl-1wLg;
	Tue, 03 Feb 2026 18:17:03 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKxR-000000077FQ-1g9Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 18:17:02 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-81f4dfa82edso3219126b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 10:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1770142620; x=1770747420; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UN47FJfHc7xTLQG5hcvh1Zikbidw8gYJs4hF8/nbHFQ=;
        b=F34uvHjWqKgrXMjUa26r4mjPWxepZJ620yaLLwaZ25b28rRQKBFcQBvyMPsaiMM2hr
         dc7CXp7Tv+9mn/6AvKz2mvLXK9ekQwm7Q71+BPLyQBntwSF5RjRTJ2K5AT1i2wkSOdvE
         h4xbxgbZK3go7cmOMI296o9zlPALQzwBOsGVyZ6OxpKPnb5lZdsIGxVyEQdp0ZN3y4IF
         w5n/LSjNKgvQHinFEsmM2StBbNUBaOp5DqjrLW7SpE9y/nQ6/R+VCAI5YAYZr7dzWziF
         iG4/23ybU388DyXjZbjsVopGy5GdR8Yl+tZjWB/4RHoj2qVtknPvwNdTmE8uZnw3ju+v
         1y/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770142620; x=1770747420;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UN47FJfHc7xTLQG5hcvh1Zikbidw8gYJs4hF8/nbHFQ=;
        b=XHN5ZFjinhTuUliL08J6qiZ/dY5RtMX5J/qp7VJdRNVnceVuuq/JNBFBPWMdbO+oYl
         OKakCE1ZlJtkkfW8MPZAnhnqZEzCvGcMBPG9kGG58soLYPIrbMx6VJ5WuQcL48xWV6fX
         f0tCLn6Jhh6Be6AnBGf+HriYgpMMk5L0KXKNQRjRNK1bZ5gpztzq9+P3qe45BSyhPPGv
         dfiEP3hW9n0uaF9uD4aqxP0KLPZHAGE9nwrZ0Zx83gUYFsm83KPwcG5TAYEbLVEwgbyw
         Bc+p+/s2hIJuV6mqyV7JWNGEEW/jmAjYxv4e3sHEkfyti5iVPMZzZD3v3rPocIFtE6sd
         ZMIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr05SSYEe2yIUEmFHuSFke+KIivSlOmgRUjNk3aOZUQJ3pSmF/feHacCgGkL5AS3Uiec3Fj80gxvR8PkIPHZfj@lists.infradead.org
X-Gm-Message-State: AOJu0YwKTZkiaSak1gw3aSFP6TZeaS/KPuIKyk1KCSg33pjRz4uU0zhf
	kMOlJ3DAl71yN+XJshWRn/gbnoQUxRYZqma9gQB54e1cLDL0MY7DGLBudXQbMoR2Njt6AZH49+N
	WwENc
X-Gm-Gg: AZuq6aJ9CxLC1obup08AHAxC5NCQZ4SJPHT6tEg2GX/80UyE76saRM2/EpSzJ4P/sHb
	RXrybSdsRm7c5UCbYfReI1G3m+0KltuyK0hQWUJhah1yPrVuxoMf4KTmdeIkW4Y8w49KDRuG+6U
	pnj/TTzqWgE7QsHkcsveZnZhIFHSLP6SJ+iAnDTefm8C/qj8Emn4FAexkXwajiIAZKHaIB87mDi
	q71nrQEkQ05M2d3psK2STR1smHZlV4iId5pF9Gxuvh1ZkK3p0ATSdUbz43Zw2bbciF2Hau+eJvM
	iYT+L/mEo9S4w6TY4p3AEYjTBvG/aaqjT7z1asvdi6yLvTqVMRXHrTPZl1W8ZnGhtEzI+3xBMWx
	9WGjBJBi4xTDq4Nvi3RrLigIMBEmyz2Sy1KpR6t49bHWV4XIyAYKfFQ25OF2V0Pdq5xB/jUNsPc
	dlehtpNVAJeaV2oa9FvNGPuxzgEzEj/lGXXOURrh9lk53RWQ==
X-Received: by 2002:a05:6a00:4395:b0:80a:fc3c:f839 with SMTP id d2e1a72fcca58-8241c6458f8mr279158b3a.49.1770142620387;
        Tue, 03 Feb 2026 10:17:00 -0800 (PST)
Received: from smtpclient.apple ([2601:602:8701:5361:2dd6:2d53:d593:7d46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d438f1dsm35386b3a.32.2026.02.03.10.16.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Feb 2026 10:16:57 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v4] spi: xilinx: use device property accessors.
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <849bf95a-133e-4faa-973c-19342afca327@sirena.org.uk>
Date: Tue, 3 Feb 2026 10:16:46 -0800
Cc: Michal Simek <michal.simek@amd.com>,
 linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1DCB4BC6-372C-432C-A6C1-B089711CF8A0@nexthop.ai>
References: <20260203-spi-xilinx-v4-1-42f7c326061b@nexthop.ai>
 <849bf95a-133e-4faa-973c-19342afca327@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_101701_440235_C302C518 
X-CRM114-Status: UNSURE (   9.87  )
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



> On Feb 3, 2026, at 4:48=E2=80=AFAM, Mark Brown <broonie@kernel.org> =
wrote:
>=20
> On Tue, Feb 03, 2026 at 01:55:12AM +0000, Abdurrahman Hussain via B4 =
Relay wrote:
>> ---
>> Changes in v4:
>> - Removed patches making the irq optional.
>> - Link to v3: =
https://lore.kernel.org/r/20260122-spi-xilinx-v3-1-8cea20e82f0b@nexthop.ai=

>> ---
>=20
> That was the changelog for v3 as well (and you dropped the changelog =
for
> v3=E2=80=A6).

Sorry, I haven=E2=80=99t realized v3 was the same. Do you want me to =
change anything in this patch?=

