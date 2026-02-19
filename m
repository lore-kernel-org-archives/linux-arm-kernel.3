Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C085EE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 01:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKu24tYsRQh4lFoxnVM6yOe8TKZzgTUDIjcBbH/0LPw=; b=a94889XJZVr+XvKuHTGbvyn0dU
	J+mNU9Jv4eqwSU6pS4aGy9f7OihMMrpXbX8dyy7m8Uw4ePhU9C5kL7ln00bLZ8qi1Fs+ukg8qUuWI
	7YArNbT5leErzN0w+YoKP+r25MTaNUUq1Pn0kBK+l58y4ktrCqd4BvG8ZgDkkcQzY9DdOZbSHQoe6
	tgcBCyO+UdIEOtxXO6f1uf69eoyw0lIL2VtHtGSXwJi6tHGDL3RrQ0pxsLCAkjTBM7R/V5qSQNZgQ
	s0zFZzU/ErtP/SR5LeIrpdvP+ZS/zfTPR+3JKHD0cgdKHFO0Xk8onN96uJXR2MtWhudHZZlD971mP
	NsGPkCyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vstB4-0000000AiOo-0fra;
	Thu, 19 Feb 2026 01:50:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vstB1-0000000AiNm-2H5t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 01:50:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9F8A443D8
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 01:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966A5C19425
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 01:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771465797;
	bh=gprzKwyelAnbTbil6irDP/l70Ksm+SSNMddfdQb9Y4U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CTPd/F9QCBL2pXWHEWRBD2xpt13a3jkq5JqEJ0eZBXBZbCMy+H39GZ1l7RXkZXabp
	 KmPjcjZ5y+VVTZL3CptTyXurTzm9xeIn4q3Ek6S/Z80nz4Zh+HyWhrW/aTrnAfavce
	 kY2xaO1O0Dr67XxhNYNFz17FF41KipWvdM+XYTtr+LEopCkmk04HdNri5zCqkCQ1Sd
	 3Ge38m50C7h3/MNQIaSWIzd/UGNBTDedTN442ZDp5UtQRH88d/znZxjkpxim4Ehgmx
	 aNHkoguGhibStCtxCFyuGZm+BhLMYaKehLtkFv1gVwXZDhuJ/rirK/cefzYvIcrebB
	 ZV+LBWRMfkHnQ==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b885a18f620so79961466b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 17:49:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXvtYJ3SXAt90yZxdY7R3itbNHC9DI5IqYeT29iuBq0aqpbHihZABqfPo4+VlVVn/YmSSMbLyV+1KWnKo3EKwdI@lists.infradead.org
X-Gm-Message-State: AOJu0YzTO0DDmptbvm4tMXfrPb0Wx5FLE4lLBESqCvU2t9gYmhg/LdCC
	boQUeJ0CgqdDQT8qYnMWnVw0JUL3K0pb66jGw6upPLt/85Ac+h6Zw49rOBO9R0+Cv1Liwwwac26
	QQw6VmjHvmafp5aonVzbOrlgqyMEksrs=
X-Received: by 2002:a17:907:f509:b0:b8f:9d12:2386 with SMTP id
 a640c23a62f3a-b8face62ee1mr1051037566b.51.1771465796016; Wed, 18 Feb 2026
 17:49:56 -0800 (PST)
MIME-Version: 1.0
References: <20260218213501.136844-1-ebiggers@kernel.org> <20260218213501.136844-13-ebiggers@kernel.org>
In-Reply-To: <20260218213501.136844-13-ebiggers@kernel.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 19 Feb 2026 10:49:44 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9rQ+pqZrbsBAc+poE5TW7RUBXwFZ-w+zmZ73P_DBxWvw@mail.gmail.com>
X-Gm-Features: AaiRm52LC0cRCytNvmZP31u5klrDIWh3l86YDetcbx0CAz2pxLOClyB6yHn1x6Y
Message-ID: <CAKYAXd9rQ+pqZrbsBAc+poE5TW7RUBXwFZ-w+zmZ73P_DBxWvw@mail.gmail.com>
Subject: Re: [PATCH 12/15] ksmbd: Use AES-CMAC library for SMB3 signature calculation
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-kernel@lists.infradead.org, 
	linux-cifs@vger.kernel.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_174959_604341_FEBF39D3 
X-CRM114-Status: GOOD (  11.33  )
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

On Thu, Feb 19, 2026 at 6:42=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> Now that AES-CMAC has a library API, convert ksmbd_sign_smb3_pdu() to
> use it instead of a "cmac(aes)" crypto_shash.
>
> The result is simpler and faster code.  With the library there's no need
> to dynamically allocate memory, no need to handle errors, and the
> AES-CMAC code is accessed directly without inefficient indirect calls
> and other unnecessary API overhead.
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
Acked-by: Namjae Jeon <linkinjeon@kernel.org>
Thanks!

