Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E6CE77173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 01:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZTOGp1r7hkR99Iod6P2AZ3fuJ0kLpzFWImMNOngyTU=; b=3MI5zY+AREmiMwqJfHJinPnQAK
	sF5npki5tG00D9SLlA3i9T1Y6BtVAKq2rrIZw2Shu6cmxfa6wRJu+avy/70GYzWMaI8wHBo84oGBP
	avFIdjm6CAZhWcUnYX1+9cGprrcmyHwNa3txsJfxtxqlA37plRtCW4muLjU0bkghtJ14HUXvHvEmr
	3c2tzx3nvCBC3aYDjMAcl7YlqBX0Z0Wf4aXLiI9I/KZdpHI2M/qkrYSwO7nBKI3YeoHOAptBJff29
	YAhcSJrJHr6wXdB7+aLBHqs4t4UUFaYx3xJ0zklzUZQ8wfdsvWVBYqhOq+Jrb5DQNWm997/XHfE62
	/VNM04Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJjmr-00000003A85-2Jjk;
	Sat, 07 Dec 2024 01:39:13 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJjlp-000000039zK-0gFm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 01:38:10 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so2321143a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 17:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733535488; x=1734140288; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZTOGp1r7hkR99Iod6P2AZ3fuJ0kLpzFWImMNOngyTU=;
        b=WFLWBqpZ9Z2yfpbmkF6awWNjph+ZUu9uXC9/Y1iazHsqLI7RLJNnnY2s/dNZqe5Vno
         LWm9et/FGq7qPI9jahVb67g17ueFMh2jslN+LVn4mUav33D1D2fRPVFy2UQaQWRJUypK
         eJ75vNbe45bI6yPKEtiS5kAvm+tlNjUwhT6NW+0QZab2jskBsSYVoA38NJ9dFJY3QjwS
         1zi8ox07aNDhXDzWPMxyawsbDmDYK6PeJ03hPgXt90m9DjYhIhiRqWqwmcoCnHHoW4kU
         FMpJiVSk5rSg+gravo+9l7obVtnn83dAYCZHRJ4zWeEBBfo3tGzEvb6NRwRSqCuPogTm
         LFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733535488; x=1734140288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZTOGp1r7hkR99Iod6P2AZ3fuJ0kLpzFWImMNOngyTU=;
        b=TCrWFyCiyZMEGiZq9uxTgJlvn6fC2hlBU/jnhGkZVK39A8vsGPS6++XAaJW8CCxaUI
         LOx6AwlbgoiNLELizdqPUYhzX5WsL+zgmiC11zZ0ypfLNpZ91Hl594FuLj+VpuaTlROF
         9kCxYGllYz/nqXYVkrfsQyKr38mS9RO8fMKh7mbp6hq+ma7Odeuvep+ojSw7KDeV3TGO
         LPSMKiC3pjuHyH28capxr3oK53fnT/ZS3ei8uN6TFY/IY4Rc5CEYDDeEb0hOAOcKn0dU
         yY8ZnxHnF9WdqPbuWNAOG2fHRhIaXXIZnbMWejYo5icDCXmI9u0q2+SG2mRvXde1GIYA
         e/Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUxC/hheOyFaNZsbqXOl+nDR2UHFZCUfEJkiMHwMS8i7J8uNUMmn1uevay8mT9z1wpJcvD7J6CFtjV1nvYfm+D3@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz9jZVzV/aq5WNACjfhoTNNPeQkzCmN0qen9gs6TxL2OkT+VEB
	DqmLKjBSwRtf7j4fqLga9hmCQyelLFC627hvGUomvqazCpol6lxD
X-Gm-Gg: ASbGncuHzdgmE7Z/RVe5Z95iB3mwXM0+sl8+FuMdPFgDtmq9uiWncc83kHCxEq8R2uf
	qor3aHNXtyrTQdpsjMKlTJfY0JiPq7z55WKHlPkQH43f0gjn/8xZDIHhLL+2RgC5ismbQkGiZtJ
	OELBLTSKOxozlmyr7iD3V3rs3I82xYTga38Xe2YCjEivETU9hPII0jou03b5wvJrAIY2iJAXn3p
	xWYftuZ0eoHl/Dz24NqBY13bk2kjMC+X75h7vtntiVb0XspVw==
X-Google-Smtp-Source: AGHT+IGVziXDCgJ7WWittmXyPHVbsnVEcC4rwZTr2Vz2SiCLVRLP7xZj3DgIfwKgkAxvqmJSueqbZw==
X-Received: by 2002:a17:90b:1fc7:b0:2ee:d96a:5831 with SMTP id 98e67ed59e1d1-2ef6ab104admr8543489a91.30.1733535488087;
        Fri, 06 Dec 2024 17:38:08 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef2701df43sm6227823a91.30.2024.12.06.17.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 17:38:07 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 96C2D4209E76; Sat, 07 Dec 2024 08:38:03 +0700 (WIB)
Date: Sat, 7 Dec 2024 08:38:03 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: James Houghton <jthoughton@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Anish Moorthy <amoorthy@google.com>,
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>,
	David Matlack <dmatlack@google.com>, Wang@google.com,
	Wei W <wei.w.wang@intel.com>, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v1 13/13] KVM: Documentation: Add KVM_CAP_USERFAULT and
 KVM_MEM_USERFAULT details
Message-ID: <Z1Om-1D2g3bFW4U2@archie.me>
References: <20241204191349.1730936-1-jthoughton@google.com>
 <20241204191349.1730936-14-jthoughton@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="THWs/xiN6GnbQcla"
Content-Disposition: inline
In-Reply-To: <20241204191349.1730936-14-jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_173809_211275_0492DE22 
X-CRM114-Status: UNSURE (   9.78  )
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


--THWs/xiN6GnbQcla
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2024 at 07:13:48PM +0000, James Houghton wrote:
> Include the note about memory ordering when clearing bits in
> userfault_bitmap, as it may not be obvious for users.

The doc LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--THWs/xiN6GnbQcla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ1Om9wAKCRD2uYlJVVFO
o/pqAQDAcgOLkBs2QwTaz5H8Cms3BiufYbNEbuR2f2WwKNQOTwD/W/ANv/jXoqg7
C+d5nAhBL0GZGybXynXplppXnFrcDQY=
=04BY
-----END PGP SIGNATURE-----

--THWs/xiN6GnbQcla--

