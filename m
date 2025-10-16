Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14283CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/EEkjyX2e9oSevCPubP9u1AVb3Rr9e/hCPzwvqQK/fY=; b=uTCOseflnr1mzT2i6jAZ06VLMp
	8EAduBkTI6W0xphR+zR1sCiu2nNi+OkfLdcSXCQ5R/rKX2AhIpKwTGvss8V2ka7Y9DCWvdsgD+DR2
	bGuCINBRAZQYxPnOTD9KJ6hQ7sxCtn6Es2WIdzGEo1vx7PbVsWI1gwHtAY2uIx4LvQ34/eUXlfXmQ
	S1l+FGooELCx/V1Vt3YE8iCg7H/XrR4irQchJii88kJimw5sQiaU0mQ+urIdLrzmLys2T03c2r1AZ
	1BbimmeAAYWzTDqjGyhgj2SMm8yPjARs6j02qjF+iSQ2m06znRpGyDn7Ie/9ZPxRZi82w1uKdzs9c
	IW2G+Bew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9RjG-00000005Z37-1NIL;
	Thu, 16 Oct 2025 17:25:30 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9RjD-00000005Z26-2H6h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 17:25:28 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-87c1a760df5so15367626d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 10:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1760635526; x=1761240326; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/EEkjyX2e9oSevCPubP9u1AVb3Rr9e/hCPzwvqQK/fY=;
        b=jT1qwHwYOrUMGk2giKOcGc1ipkbNgqFriAC+J9rlJxLJmvXQNp8T6zZk0nfgEtQhR3
         z1VIisBA/Belt7OtpgN30j1rKk8YkblFXMYilWjkeu7a/joCjetj3PK1lkYlRjzbuAkz
         HsoBStiGf8H8n2zFBeb43iv6o1pT7cPEVLoR+NMsxBBsqn7GvdvWVouOwJ7F5rMV6xSB
         zg7nPxMsGBNCej0fo5Rp2R0r4SMGMcleaeCbxsdztnpWFR6zrhOu2PO5aiB0JrvfknkV
         DOSCHcslBaPqo5oEr9Knqp4B+SN9R0q4XC9LJxllz++ZE+YK2qoSOMNb3NEE4kpStPWu
         X6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760635526; x=1761240326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EEkjyX2e9oSevCPubP9u1AVb3Rr9e/hCPzwvqQK/fY=;
        b=Wvvf+cIUk/mZrG+3vT8QCg2uHv5BtrguDWLVNg8hPm5vo33Q/dL6V9v73K4TDCDVpp
         ezdavOCbkRjwDEgZdnPfKhA6lReHf/MU78KzUzMkYtuktHO0J5e/+95asHxOOAfshEfj
         BBn18UaSJC01TCfBrVbDkpVDyjBNvnS+ogFYxSbe0e68ezf737EiVsUBp/CJP8IAb+Pz
         r8dnMGVVtBk4z3zAJogbWs47bdGCtnP3238BE23j3Wwt1u2Aaa+oFFA4+4GwnjR/Caxy
         JDI+USznrQGX78m2Suh3gMGZ17NfBezFXim1hIyQxYkQkE5Gqy6LMqE8aCIzIukSPgFU
         qzQA==
X-Forwarded-Encrypted: i=1; AJvYcCXU5s5qzgGvEZTT5LS6OibA+76iEMH/FA+7icM+Kcw6fRd4GZ0YDolZs1HNW+Mam1LSxZWYsgipNGw91nA8ZNYg@lists.infradead.org
X-Gm-Message-State: AOJu0YwJgpeBmAWvloDkFUmaX3IDzVYWBz3PJX5XN7zH3X54Ekq03fdP
	Fw0S7KAQUV62F82oCADUwn9BWP5a+cPiT5Oa/vupUykLTOMu6F8cVUtQQv/mWGKOZJo=
X-Gm-Gg: ASbGncu1rBOFH49+XYLZgiPKWbynwKGVWUYotrJVOA38y3Cm8qo7ym+fDLXhaCrCu9K
	04zgU/ID2MAGEnsSJR39AzK4t5oqMXN3FAxnSzPD+5CDLurdoIe1c4GkbKsfwyWRF4FE+aOzuZf
	LLyhZ4HfS2pQF1zQvyRkYNxIrQCA9LecmGnxycMCkmU8UoYM7aDiyqbxUB6QKrP586mnietQMUS
	EFzYuE6kgEZ218GOQVGtNbP/1XbcP3IrwUaBQWgQAs3r2W0obULexiamwmJ5cYZ9VawvMzBva16
	QzlaVzdyaprHRoZ7ypEdNnSEKpkm4u8x4wNmtqoROZr6/8sLvvrvqdgSk5XYGniLHMTozrKMQ70
	SH2+6oT/PHvFP4aqHv5NhmndXIZilRpAS4ckcMp1Kn9ohBalN0bMAlKeNMo7o
X-Google-Smtp-Source: AGHT+IHksrcKVBUhwjEbvljPYvDE0IZujaCH4Ti9W7M9s4IST+pF0PoGvC9Lpt9Kwo2sVKgzxbWPyQ==
X-Received: by 2002:a05:6214:319a:b0:87c:2206:2e3d with SMTP id 6a1803df08f44-87c22062f05mr5415776d6.25.1760635526001;
        Thu, 16 Oct 2025 10:25:26 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0121f891sm44222226d6.24.2025.10.16.10.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 10:25:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1v9RjA-00000000Wrr-3Ipa;
	Thu, 16 Oct 2025 14:25:24 -0300
Date: Thu, 16 Oct 2025 14:25:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, joro@8bytes.org, praan@google.com
Subject: Re: [PATCH v5 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
Message-ID: <20251016172524.GN3938986@ziepe.ca>
References: <20250929155001.3287719-1-smostafa@google.com>
 <20250929155001.3287719-5-smostafa@google.com>
 <86ca3918-4992-41a2-894f-f1fd8ce4121f@arm.com>
 <aO9vI1aEhnyZx1PL@google.com>
 <b48193a4-a37b-41ba-b4ba-8b5c67d812bd@arm.com>
 <20251015151002.GH3938986@ziepe.ca>
 <73a1d5d0-8077-450c-a38f-c1b027088258@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73a1d5d0-8077-450c-a38f-c1b027088258@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_102527_582917_3FF3D39D 
X-CRM114-Status: GOOD (  11.39  )
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

On Thu, Oct 16, 2025 at 06:17:35PM +0100, Robin Murphy wrote:

> In this case AFAICS kunit_device_register() can only fail due to OOM or
> something unexpectedly messed up in the kobject/sysfs hierarchy, all of
> which should already scream (and represent the system being sufficiently
> hosed that any actual test results probably no longer matter anyway) -
> otherwise I would have suggested a kunit_err() message too.

Yes, I think so too. Which is why I think the simple
KUNIT_ASSERT_FALSE is fine - we don't need to over think something
that should never happen.

Basically it is a simple logic for the test writer, any thing in the
test body that doesn't work as expected triggers a
KUNIT_ASSERT. Infrastructure included.

At least that is how I've written all my tests so far, including the
userspace ones..

Jason

