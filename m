Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06851093176
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 01:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=; b=OtL7hDLFgHeyOUHpxXM7EkGJM6
	x0Hn1+NRbIeboJAgZMQ2BbbFGRF/fwos+NaFony3QVO7DouUcV7ikMyGoMfkWVawUWBKN5xbVbQOi
	HprlrAEfQQBpooJLY/KeWAA5TIQ5zKQa+TC0xJLYPXvlHYlGGsuXEnMq+uJtto8H3m65bn/iSsN0a
	9zaJUdQkTfKuNOIw+txW3WvFTCzFTr4GzVqe7QCClmK01qRqJUqNae0rBwkM2N1SJkYJqy0b4FFAr
	LbxD5tLpNMd652ZE7FteGA1jI9rEq9kdAllsfooQ8EO77j23qDrUfCLSLmEzLhSzIwoiX1GCgAuVx
	meNgX99w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5DVo-00000002Thy-1VpP;
	Wed, 25 Mar 2026 01:58:24 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5DVm-00000002Tgw-16Sf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 01:58:23 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2bd5658b901so244882eec.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 18:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774403901; cv=none;
        d=google.com; s=arc-20240605;
        b=kLCgxiyrq0sTch7dWGlSmjxZV/0DtbJIrwIzGaAw5t5HIq7H0AGFNCoFGZHJOfu98Q
         rqqSvhVT3b1WvwWxfiYNSwokoUHzOoFothZ07C5I7OKH+QOtlNbnaS7XZ1eW4FvOOVWS
         lIdLs6vJHjIGfV/pXeLS87GxpjdQfY9N7ueTPoEeqkZJjbmpuZBrmTUnEidsr9v/qBjA
         lWYY+cbuRzmMd/BpiC1YYpVA+X4u54mkxYi71pE5wKSTHw9ubI2xrKz4eGwW7Y9No50M
         vCHE/O85bk+wdmCj1lmBXEPXXoIPNRHI7BxYXlKJC47dnmxfjTIdTY26s3atn7/JkeH+
         Gc/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=;
        fh=dmLwWVL3pfdHGvPk107Q366Gwipjx4URLAGnURWPB7U=;
        b=gWvkCDl2GDw7bohN9VvR378OXnFz3gCmrh3NTVXMpLk7IE74ZQ3lWcwY0bN9PHaKoU
         gzmEDe+TFmCkrPZYa2vqxkcf3n164d1AHPyj9jgr4jgqCbzLjaS3s2YqJXFtFWaxqhSS
         /iMrv579OtUFWOrHNMzKKqfkN4ETgK/WZ7aKPMy7iiKr2/HVd7pEP52QOSw48eewcAnq
         CJgs4jvnpifiMsFeuZQuhEPyHUpODvTZ+jyhmkC322KNZic5vkCcbpMR71LQY/Ho+gjH
         OblTD4ftw67jNbA0VFRQ2NeB7v40RMHueZTR5Ms6KqpWwS9g2GwGtq+F0vIjmWjPBGLs
         8KWQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774403901; x=1775008701; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=;
        b=ZVq1VAVRax4nvcvrdJmt4askuRt/n3KON9qe+p+Ly+fMFhiNINmNSC10loCa2WgBEQ
         9VokU+F1HHdjBo7QBItheb/JuX5mm8+h3Wjhya6jW+rulTbk+zX6wTBj0BXtN0R9yzxx
         Ww27yNFnHfoPOnNIJV401ouozvGh8k+HAld5Yp2zgdDLLnHHU+SbL9tsmLLX0V4P7I4L
         QOHh5xAkOWpEsNbdfRIT+8qlJdK5qXqqZOskzNa6PUHVUkv/RmSSluPyOxw+RzS3807Z
         mMkRCX2jAqSaST8l/6HWyyoAncJcINmBer5i5v7tth9wAOJqWdckZP+0+05UzPHVl98z
         dRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774403901; x=1775008701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=;
        b=dWR9hGLcJTl/Eo7ubOz12auuZ6Aut+BTjVaf44DHUsAH9T4S2xaWCjaibX7nOSwIXc
         L/IO68Qj6TNHBu+ODegwzIWbmPbHjyD6WQ69kmmzTkAwCCRpJIXkDFx/xhFA1ElFCFIw
         y6iAzHZK2KIXknjo1qAsDC0FGqXo3LqqRXFZzKU+Hf7oqwclZIXsCSfaaUChvMud/UCi
         fYGmTStM9L7LChNEz8f1F9hSzjnAiQfaTZ63JvN3sWF9jxGGeqDb3KMbD/qj4WGsVAXI
         qEOUKelvTdytpNyDMRyJGHXZPyKdnGFEuZsbNPfzt1xG5ESk3Ym3Uz/L3aEQSvJa2tDr
         D/hA==
X-Forwarded-Encrypted: i=1; AJvYcCUho8WSOFA/du3wVYieDTOCXuzPyA7M+KQ7syjHi3q95l7OsAwV6P3by2LFf+pY3N+mx4TXsnu4tjSOb4pjwOe6@lists.infradead.org
X-Gm-Message-State: AOJu0YwEKopCDqwyrxe7OmPOussBqHnNL77DMFRrAZJMywTPIuvHlDEU
	pq4lfmQV+sy5IchuHZaaEq++NkH3IpzXBsYTJtkxc+HU07V/UeqmZeJULQxOLFNpGy3GY/JMKfE
	B2ClXG4EeErGghEK8wf5EfaoCmhnte0w=
X-Gm-Gg: ATEYQzyZIg9P9U65AndF+hJg9Ip5FL28UXYhj/wUAoEvgdbSrFAZfHD7AzB2zQijmy8
	zC69rtB63vyo51VmCmXVWw30DHNyoVyiDMT4VGOV1mVAuuojLOMcDfOX/+E4cWeglOycIEDIz5t
	T+1L8Z2GnfPPmzeBf1LFOrv5aa/wKS3QhBNZ5MlhFx4OTKWisuji8gIpl1BcwVpq/PnG/sn+KLl
	IWDt4TywPVQEr9n7SgLl1EU3wveadz63xLSlXX5+O5ehJU7nzDXjd6G0aCUfDilHvkaN21KvnM/
	jBK2iXl2iEbtPdvfebIv7yJaq9j1L4s1kAHsPk5EmrJ88sYP03hwPgHGT9lSjc2mzGORf92e8MU
	Yv37zpGG/BXfzhqr2w6szv9k=
X-Received: by 2002:a05:7300:dc10:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2c15d3a8a70mr394983eec.3.1774403900918; Tue, 24 Mar 2026
 18:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <CGME20260322194701eucas1p1f72625f53e50806fa4f430550f291e76@eucas1p1.samsung.com>
 <20260322194616.89847-1-ojeda@kernel.org> <1c4e429b-f30c-42a9-8de1-71cb2cbbc114@samsung.com>
In-Reply-To: <1c4e429b-f30c-42a9-8de1-71cb2cbbc114@samsung.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Mar 2026 02:58:08 +0100
X-Gm-Features: AQROBzAYV4sPQIbCVLLNfW-UqAw-p0H5kvr5leqfcWwqgBKVIhpQi6sU039YVRU
Message-ID: <CANiq72=UPiXc7JLracLeC6k45ToByJWZedp3B3j5=5mAnyKZmA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, driver-core@lists.linux.dev, 
	acourbot@nvidia.com, akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux@armlinux.org.uk, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_185822_300363_F0355A17 
X-CRM114-Status: UNSURE (   7.18  )
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

On Mon, Mar 23, 2026 at 9:49=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Yes please, this looks like an oversight.

https://lore.kernel.org/rust-for-linux/20260325015548.70912-1-ojeda@kernel.=
org/

I hope that helps!

Cheers,
Miguel

