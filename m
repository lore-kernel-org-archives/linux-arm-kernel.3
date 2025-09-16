Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15051CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 04:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bogLoMlflI6VbNNnCzsFDXRtZ6mT7yFBE69/g4NDZeI=; b=zJMjkx1WP3uSFA7VkYoLR1QzY/
	dKMNi5atyp8Zl9aUB02p2Ri4cgp2vKWHM92nyVtfkjxJn9ZMU6HGa7Msjw5sFK7iGjSA8udQhLC78
	fWFmwe0aWhQufvF2m2/oCwAwRCoLX3zTVeSSi6Yc8ZU88gin3H5apon9UBOPOL8sYToTjib5ub0eQ
	VR6CUk0fsTYLT/dmqEmuD06E1Mi5Z5LxDvhSDIww3ue+2QUdxB2j8EO07xiTTp5owWiMwkjFibqlx
	J6JBnzNvlZ1z4C8MNTlY9qaeC2YwkGuS4j5TZt3iMlrPBTOQEfCZ3+duDke75vethE5rXccvc9+ac
	+INsNnuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyNC1-00000006gUj-3bZV;
	Tue, 16 Sep 2025 04:21:25 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyNBy-00000006gTO-2N92
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 04:21:24 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e96e1c82b01so2980745276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 21:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757996481; x=1758601281; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bogLoMlflI6VbNNnCzsFDXRtZ6mT7yFBE69/g4NDZeI=;
        b=LZTGHV5ZqlDZI99t5OyPG21XgNuTefLIdNPpcCs/EF0hPewplWAhPPpBB6RYDQZeoV
         e2PIjg57WJYyNxZOeS9OSI+wk2V6IxUGK6i9jxz/b+SswjevN3HSHwA2k9ekeUa3tK2L
         qKrmomaSOlranK5Bff+ZxDhZ5c6mbVj6wsN/0j7VCBn1/avv5OXbvqGwpWLj0fX3egrY
         Sw6Ehbcn+/htwKDSKbvwiwPw1AUTsnr26d7Fcxl/lVblb6kkMzg9e20n0EfIGKb+0iBB
         8OGNIldrNXNmm9yvaReoXGtEQOGT5LeyfOC/RpCAbTE/g0LToiNm+Rba/+9Zvu3XOajl
         X9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757996481; x=1758601281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bogLoMlflI6VbNNnCzsFDXRtZ6mT7yFBE69/g4NDZeI=;
        b=In6pA12RtoWmWYAy2+NzTg5CpZqTERKvCokXT5YNlpToph29nE6jqW1t/4jBs7m0ra
         7EHzfOUSXIT5M+RlDdAGCH/suP8d9PEgJEQWZEu2BTGlOJ0PvGyVFHW+ioym8tgPOWvZ
         RNBFVezYHncE1ZX653KwZr+y5HhmciiDJvnlNgTS0qNfwnEsRS2JeOOJ06tCaf9ohR2x
         qmG5dqcngakeJoJ9EpYg2GkqoUarSlgw7DwHfe0S0T9vkucT6BjoKeyMlcWcKRnpLSsi
         FFRr3hThd7H2SpOeewfO5GVdeHmHH5kfU4Kx9Cd33f44aStvFTcl04d4Ps4pitDv18gL
         RfIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgSEnXPotHYQsvptjmjkw3MLiIEyRi1lUSpwGcHgP0HJfG7I7uinQf/fufb4OBxZhRIx/IJEgle2nEzi1wqDcK@lists.infradead.org
X-Gm-Message-State: AOJu0YwLX2oHRB1KpTl1h0kMXXKo3Jdv2M9397moOSuHmkDctpgyYpTN
	5kd/RX3rcf0maMzA2f/66N8fEpG46SLIvnjzgVvm92wa2zSlGDhbmlHz9BnVFQcUE8XoLR1l83c
	81LSzR3ztwcZRPDFx7F8CF4O+l2k7pDg=
X-Gm-Gg: ASbGncsNOLURQ7CvpUAQsRZ1rAGQ9Pblujxc7QaoTwInPedkEoeTSiWpfAjy6fqAEy+
	D3ysk5saQXmAk2X/+6hP2fBfcwB63/cimtg5Ak8BUed5n5+6cEdg7qulVfuKzrG/WOQnZ9MN7J2
	TEaIK0BXjvh9kL3xXWRwldNcjFJpuyj3xJRO221v5S6Y4FsKSBHqAuyEy6AkoFn6x0KcfkxUKvN
	xkXNCeruCEmZEF4g99yURDjwcuFmY0ZmtV5cl6VBjVXDn4MTx+S65o5X1xhb4+nG7Okfdc2
X-Google-Smtp-Source: AGHT+IFyzGXqLS7HgTpLjfWR0n2UfIRuua03WSClBxtb3ipLLNlXWlUaTN5qUbRS4LtdFGTOHy1hA97gOm1mTGj9g3c=
X-Received: by 2002:a05:690c:60c1:b0:72a:78ee:f265 with SMTP id
 00721157ae682-730623e29f3mr107076077b3.6.1757996481126; Mon, 15 Sep 2025
 21:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250913002155.1163908-1-olvaffe@gmail.com> <20250913002155.1163908-2-olvaffe@gmail.com>
 <20250915-numerate-makeshift-c076500aaec3@spud> <20250915-deodorize-proxy-b18e41fa8668@spud>
In-Reply-To: <20250915-deodorize-proxy-b18e41fa8668@spud>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 15 Sep 2025 21:21:10 -0700
X-Gm-Features: AS18NWDfiAtyEiAampVSnuFJXyQ57PVn2PUsFhR83kG6F0bRG1fbgCjLT-SJhR4
Message-ID: <CAPaKu7TEjG3sWamy3k_YLig=208oXLPhMmbCvPOf96iEL0-uig@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-valhall-csf: add MediaTek
 MT8196 compatible
To: Conor Dooley <conor@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_212122_616672_270F3FA5 
X-CRM114-Status: GOOD (  13.32  )
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

On Mon, Sep 15, 2025 at 10:52=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Mon, Sep 15, 2025 at 06:51:16PM +0100, Conor Dooley wrote:
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Hmm, actually there seems to be a more complete binding proposed here:
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250912-m=
t8196-gpufreq-v2-1-779a8a3729d9@collabora.com/
Right. I tried to add the compatible to the binding (this patch)
before adding it to the driver (next patch).

If this patch is not a prerequisite for the driver change, I can drop
this. Or perhaps there is a better way?

