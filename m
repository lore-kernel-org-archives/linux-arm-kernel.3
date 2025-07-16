Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49872C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 23:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/NnJDTcQwKH0nX4EoIsUlDscSEoGQ+CI3cGaPK+Ctg=; b=22rke+aD6lkvavRP5w0EH9z9GB
	IMVNkeJtmj/qZlOoc+9RyWUKEB0SjeTtkRFCEaHRrSsfrYbR1r4GMg+Ptdq6UbPPz0qQcBr2NT8IA
	SfrwvGDOET+drLdBN0S7TkZ+zehvTWJ/DCxXkbthgQNouU1JlD6dg/LlfOhGK6tZLIAMPSI2iIDIA
	R6l7de9H+q9DZnektMDLac7g+A/F//83y4Og2XS5S6zcR6ZSPVLLckRR/mtZi7EP3jjdMpn1EOlKv
	3nXaR7jPNdY9ytv7zgdNqY2abCuOk+c7yt5+8//nnBacJI3H4rJw9MGKsIjpvEh5f5bsuOKSWa9Oi
	5/rwu3eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucBRw-00000008qy2-37pa;
	Wed, 16 Jul 2025 23:22:08 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucBPU-00000008qlx-3ukK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 23:19:38 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-60b86fc4b47so2413a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 16:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752707974; x=1753312774; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9/NnJDTcQwKH0nX4EoIsUlDscSEoGQ+CI3cGaPK+Ctg=;
        b=4mvXgkhzRGBTJCHM/MVAw342OgxYMSpGLeyACNQgIKRzVpJTJ5bV++gMVaIeeCXd3y
         vq7uBjycBPn4YRkmCA02hyhMYoGXCZZqiCnojJWGGbeujXWAkf9SWfMYuHuCFPnUJY2k
         ZPSAeoOwxKjRvJ2tE4mCRXQcxj4vlhWnNT4LKBbaFTSeafdOasxBg+RKuHw/tXrQ+J0Y
         cygJzA9AYQZ7OeMrxywdSukEaNqx12U05esraHs4AVYDyk4WpriJzxW+orvx+vj+arnz
         sKUwD/xz/wQ9U2NJ4gWgIIDP2zX7/MKoyEp9sov/9vyDFxl/oHUSfto+I2JgONI9qdYP
         MDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752707974; x=1753312774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/NnJDTcQwKH0nX4EoIsUlDscSEoGQ+CI3cGaPK+Ctg=;
        b=Vg9zl7wYrZnnKNmLPdQihOlLm0KkjYc4Xz4P6/cLFe2YzXQlfuAvCGM83lqQCYB7vj
         3M3LbkfPesK1wqA653RpCm1adyDDESs5Rw1PUdEExDyArkncL+8E8ZHQ2FV3gMKwXf6S
         FpN5o49Lu9HF0uBvbgEi2lknqmk1KaYB2TL2rEL0aTC5X6+sf5jx4zumP8C4q9I5GToE
         yRenfAq5jNTg+/yJz1ybrAySbh/BZBc3Fb7qq/vrfWddiV+VvGhrcXHnrwa92ZEhYKkm
         PyEdLvQouR88swArfB7wKn8y+z+6KDpGqTRjXkyKQk/Q1yPnAKCG6T2SpYgiVfhV04OD
         AFDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHgNe1c3Ijbh3x+rqA/1tIK8ZfdcjEJuieYd3LGOMY9wQHLWu+L7wYNW7Kq5nKmHtpZIdFXs/RWUGdQuUGbk+M@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5VBZ3+++JDvb2XNocY3nFe77VHxpBxizNcxXnHHXWE0GseBMa
	zeAnEg3hZwu11IYX6ZqOY14vMy4BCfMnFsmMF7gXOo2Jb1DMCTIKCISXUbgOGGdNRUTEVlUlf/B
	au8XK/jJblFScJ7jpe48EG2ZOZvEx+fz9hB/8uy4w
X-Gm-Gg: ASbGncu0785+F9QYTGVfmS7fRwMAHjLbaNB9A88qFYdOSzpXUeqbgbn3RGIChUeHKhz
	zSxfraSSGdV8WMa/MM5Uk8ubo+APE8jJnTdqAsIN/CNOudJYQDEt9JJwtqvKc082Wsm+s3Sj/Os
	yyzP64tv4lSwSskor5W6LhJtFVNgRVK0XlWSMcOtA1fdUjnWxNGrViGodHWxp0EzITfcoO5LCfE
	otuaDQYKuJ6CIVjL7ubIheo0pNUi8N/VkSYSkBrJVh5sRS1
X-Google-Smtp-Source: AGHT+IEWW6wSvnNGlneW8csSuEUINBhv5Xrj4krisO4j8KjigJe6weh6HtfKmo/FhQRiZhIVz1T5uW67ohk4ura9SHY=
X-Received: by 2002:a50:d75b:0:b0:601:f23b:a377 with SMTP id
 4fb4d7f45d1cf-612a4cf8fc8mr29145a12.6.1752707974101; Wed, 16 Jul 2025
 16:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <4c459085b9ae42bdbf99b6014952b965@BJMBX01.spreadtrum.com>
 <202507150830.56F8U908028199@SHSPAM01.spreadtrum.com> <c34f4f606eb04c38b64e8f3a658cd051@BJMBX01.spreadtrum.com>
 <CANiq72=v6jkOasLiem7RXe-WUSg9PkNqrZneeMOTi1pzwXuHYg@mail.gmail.com>
 <24e87f60203c443abe7549ce5c0e9e75@BJMBX01.spreadtrum.com> <aHftocnJcLg64c29@google.com>
 <CAH5fLgiiZE_mFhB4J+G7-Jdz46+d-5NP15npjn2_H7DgSAynxw@mail.gmail.com>
In-Reply-To: <CAH5fLgiiZE_mFhB4J+G7-Jdz46+d-5NP15npjn2_H7DgSAynxw@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 16 Jul 2025 16:19:22 -0700
X-Gm-Features: Ac12FXxXgsXM-s4jPwxbK0qidi2uE_QL2umvn-Fdybn9nHdZCi0VGiyXjMukuYQ
Message-ID: <CAGSQo03DH9L7OFZsGXU8gt_4iq2zo6gZbJtw3p2hD6tGp0KTzA@mail.gmail.com>
Subject: Re: Meet compiled kernel binaray abnormal issue while enabling
 generic kasan in kernel 6.12 with some default KBUILD_RUSTFLAGS on
To: Alice Ryhl <aliceryhl@google.com>
Cc: Carlos Llamas <cmllamas@google.com>, =?UTF-8?B?5YiY5rW354eVIChIYWl5YW4gTGl1KQ==?= <haiyan.liu@unisoc.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?B?5ZGo5bmzIChQaW5nIFpob3UvOTAzMik=?= <Ping.Zhou1@unisoc.com>, 
	=?UTF-8?B?5Luj5a2Q5Li6IChaaXdlaSBEYWkp?= <Ziwei.Dai@unisoc.com>, 
	=?UTF-8?B?5p2o5Li95aicIChMaW5hIFlhbmcp?= <lina.yang@unisoc.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	=?UTF-8?B?546L5Y+MIChTaHVhbmcgV2FuZyk=?= <shuang.wang@unisoc.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	"kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <christian@brauner.io>, 
	Suren Baghdasaryan <surenb@google.com>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_161936_972100_808051B5 
X-CRM114-Status: GOOD (  12.27  )
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

The reason removing that code makes your build "work" is because it
entirely disables pointer authentication in Rust code when you remove
it. That is likely not what you want.

> > We have KASAN builds with android16-6.12 and haven't seen this issue.
> > Can you share your entire config file, so we can try to reproduce?

This - please provide the config file or instructions to reproduce the
build. Since this is an upstream avenue, ideally provide instructions
for reproducing against `linux-next`, or failing that (e.g. if it's
not broken there) against v6.12.38. The default android16-6.12 build
will work fine with ASAN. If you can't provide the entire config file
in a public context, or if you only have instructions for building it
with Kleaf + fragments, or can only reproduce with the Android tree,
please reroute this request to our bug intake system (I am pretty sure
unisoc has access) and cc myself, carlos, and Alice.

