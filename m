Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A28D690ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 09:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMHb2Kr+9Gyds+XTGzQnx6NFjRgDvoBkrYDD0zxb/+k=; b=C9VFDQTaUmrvBJoqWLlE8MNdu7
	L9NK3f1oxPK1CA7PyWOupc9XOVnomNEVdCb8I+43YHyXYblVUVNQRAQeyUfUZPgjlhAg6tp2+OcAN
	3CqESEckg9GC3fG6dhEgimUe7Y04B3zwZSW2PmjrqQsI/CXVoyufIcfGpYb6hmAxqmob/BFuhzj0r
	MhIBMhYpnlhYv9zj1X0nL5czAtFc9k1Jbryjhzfxoh6YKxdc23biNLEJ2w/jyhojWMOE0EGALZRoe
	k/kVTezvJxnDQsporeFrWQ1VkQAFJAYjhyfcDbqttLMpbdfX7LhD6sV6YRzVKvMSXFUQY6HD5qf5U
	DqrNjMag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGbBq-0000000FBkC-33SV;
	Thu, 28 Nov 2024 09:52:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGa7H-0000000F2fg-0e4l
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 Nov 2024 08:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tMHb2Kr+9Gyds+XTGzQnx6NFjRgDvoBkrYDD0zxb/+k=; b=fawaeF4BoiWUp3SANaj/k1DVA4
	qlQT6IqX1QNhPFy/9Gs0uXk6PfqmuyaZV3hZvT4EyTE9SgUbXOidlkNX1Xu6VGmFTMPLg41wC6hK/
	wnULF/eII64ApJqGPckxCyt+O8US8EXPU8BAovIFOv9Af6vbT0SeAYzs4gUDb14JtgCbyRb6er7Lx
	qfpx2wDC+7DZSODUsLly4nvPwfsDnp2fOwH5ctzMP4Z91AJ6P3kc4I1qyOmjpO3PHwF/Elatdf+hQ
	QwsrmDEbZ8j1EfSSquBuI1imdCflCIWYxkI2shpeWYr/JfcYy9UekisMxpx6se9NjWxlT8pshlf+Q
	kHlT/vKQ==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGa7E-00000001Z2Q-0lD0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 08:43:13 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a9a977d6cc7so30033066b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 00:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732783389; x=1733388189; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tMHb2Kr+9Gyds+XTGzQnx6NFjRgDvoBkrYDD0zxb/+k=;
        b=gEv9fwwBLLgc3n82gzNYlMbvI73Zd1iN5ka4usp9t5jt9PKsCXNGnJR8hIqeYKbie9
         1uXQaTvbcrRrBvUsKEyT6W1G1GLTDji+/f8/98JdoYPNwK8dy4DphLqId5N6ByIG4t9z
         wo43sJspUSoPV1ou1uJBOyjPI+2ETVBdDvyjhAR1G8mU865q2ay9hO1bFe5gFLbNOFua
         7NYTn/C2kjrzDhD5t1RCtm9/5BdRc6r4yO7nbAhugmAOXNTuwpqJx8aX0jNlx3EihNE6
         52cQb89ndGa7V/J4tl17lJVFqzg3t8TJAr1m3ejZtUSC4JMZR6hOFJXNtE9a8r+KxtPt
         z6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732783389; x=1733388189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMHb2Kr+9Gyds+XTGzQnx6NFjRgDvoBkrYDD0zxb/+k=;
        b=FSCw3Od1Ojcjs3kJzLlnRQwFBssxAhM6RQFeVLDAuPEUN0CJuHrw40waoBox66KeZc
         Imd1mZx4TK6UYt9exiJ3a0o/z5UL0t8HdN1iuPw0iJebQqMjfqey13Iu9DHX8Ag3ui4O
         xGSi6KuRIlYVSEYZrovcMCkcPqJaxzaeYZ+mVJ+i3qiH6HF+019CoObvrKjT3Za4ybnx
         lU+4NMIs1ZAeDXBTnmYAfO/Wr5s6MWnfB8juOu49AfHxALNIRGliKoXR5wn95I1IyBxF
         fDYI32GdwkRdDwB5PrCG4xZrYHRX5YsQBesQLS3buA/709kj8TlmbTdnnjxsDpBp99/u
         9IbA==
X-Forwarded-Encrypted: i=1; AJvYcCXBJTVRaeay4ShuTsVmwRDAWZV4fG09esWjpKTSVzEKgUrULn7ve/QnTJsV8vbgbDW7/ZZQ6AEZujucJKwYsV1e@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3EmW0PyPgCcgSORsH5avVWSx5xe8mebRV+1FSSOG5ESmkJmGX
	1nKt3PoJmLep6lS5sCrCf2A1nB0ILPUHZ8EWYUMiA0QpycMEMOlekF0gNQBvNbw=
X-Gm-Gg: ASbGncuGK4eHxzPYuo34259Rg2DFnun3zsfpAgHIhera6+HrJ2cLrGsB7HtNI1jL2Nb
	RTULVKz16z6zboOisFSqtnDiUAIQPy9EZVCP00xol5mducP5dO3/npmAbE21ck4ZKPg6V4FSayL
	ctUpdcqKWlKm/zXb1fWNxUZE6Fb/9EoLLay7SQTuPpOYUNt845QcCHkgqrVyws5xyS+Y37b6v5+
	7EE08rYTw3NjKicJRIApLwoEfPlTCcH9Qfr5UeB2rH6z6Q6F8BDy5pCzFe1b4WAHi3eNL7pK2ZM
	dukpPS46yAliqM+jJlQf2MZlmkGm7V33DJo=
X-Google-Smtp-Source: AGHT+IE91WdNXINf1ttfiGq0DeG9vnUXdI7yQdKbewyZQW5Jp/++7K5EDj28/C2AmS8X01ObB7bPuA==
X-Received: by 2002:aa7:cfd4:0:b0:5d0:8225:aa19 with SMTP id 4fb4d7f45d1cf-5d08225aa9cmr4768526a12.2.1732783388739;
        Thu, 28 Nov 2024 00:43:08 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097e8f649sm493828a12.59.2024.11.28.00.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 00:43:07 -0800 (PST)
Date: Thu, 28 Nov 2024 09:43:06 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
Subject: Re: [PATCH v4 15/16] KVM: selftests: Use canonical $(ARCH) paths for
 KVM selftests directories
Message-ID: <20241128-d7a5061ce8160000cd5260bd@orel>
References: <20241128005547.4077116-1-seanjc@google.com>
 <20241128005547.4077116-16-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128005547.4077116-16-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_084312_360215_D3B282E8 
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

On Wed, Nov 27, 2024 at 04:55:46PM -0800, Sean Christopherson wrote:
> Use the kernel's canonical $(ARCH) paths instead of the raw target triple
> for KVM selftests directories.  KVM selftests are quite nearly the only
> place in the entire kernel that using the target triple for directories,
> tools/testing/selftests/drivers/s390x being the lone holdout.
> 
> Using the kernel's preferred nomenclature eliminates the minor, but
> annoying, friction of having to translate to KVM's selftests directories,
> e.g. for pattern matching, opening files, running selftests, etc.
> 
> Opportunsitically delete file comments that reference the full path of the
> file, as they are obviously prone to becoming stale, and serve no known
> purpose.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Acked-by: Andrew Jones <ajones@ventanamicro.com>

