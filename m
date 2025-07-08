Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DF7C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 14:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0P5JXJKoQne0+91AzBGnZ+7c0bfri6L6epqykQQTaN0=; b=D0/lLDmRUxNGlNF852MWGHYIHV
	YkS2hgCScvZa64OpS+bAXL2OBcmSgQelTc/TP1PrPe2WMMijShsWr+YwHWwrkg1FffpoPmUQ5QZtA
	Smhz6w9I+Zz/Jcdme69XHsTeWMUZqKFkbUlsQ3lz0hj0UkSETyh35U/so/MzWCtVBdlC0QgSi5bSK
	JoaqPFJmedo7elWNf7iHJXNIohz0LOl3zTFkPRPur6ktCE7KPCOfpHLl+Jn1zMp0jzISj2RDNRvR8
	uhGTAMl84vxXn9oYDnBOIaXlKzyzfopHIDL9tbqotJbJ5W9oz/UgFl4d3mBaZxw37LFyAa1zC1h9H
	my61uFsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9ku-00000005gWX-0TpP;
	Tue, 08 Jul 2025 14:57:12 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9af-00000005eXN-2xiP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 14:46:39 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso4697014a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 07:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751985997; x=1752590797; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0P5JXJKoQne0+91AzBGnZ+7c0bfri6L6epqykQQTaN0=;
        b=WPnRuDAp5PRrU5JVzR2TkWNBDx9twbNM0RD6rFqgzO84hFwZaWlJYwVFoft0vtaiRw
         nCO+07UCCreY3gZm8qvb972uWDBGpVtdOjlyXlvARp4PQvbz8NZtan0yUIiNY4EVVW5l
         MhwpH+4fseGLDKdSVREy33XYLKU2NqAoPksJ+QqBy9gneG3rEsQ1oOcKNMJ0UL7tbWxC
         kBNrIjvkhlA4DgMsRLGkTBEBkOiq80p5h9yV5EdgeKWc2FwFfpHuC+fgC59rMFVYPIn9
         Ab5Q0vSk9TxFFoobYOZM/nFtnt8Y56/iqx6PUC9NwOUJ3TwRcnhR3KkzEzRcaIrSm//U
         6eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751985997; x=1752590797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0P5JXJKoQne0+91AzBGnZ+7c0bfri6L6epqykQQTaN0=;
        b=iE8qD0HC+1NzkMVzhDivG9Vz+CaKtcnzu4fXZJlg1fZQJVBH4pRSNgp5iw1DLknJ6f
         Rm+nxOfCbxYPBOZvX4SoWWBJDz//8jSPFCUy48b1zfC4TZN8TsCx6bpL7v7mZM40dYXb
         31kUtsEAFmC7vUsGwIGs/eYZC2m+JESsTMHA4V8Q6xZGRh/imsUTtYLE+xFuEB5QR7HF
         /dyvhPPlWAEgxiWldaOb/t55Nd5X2VVoS8awii3gUMBbExDhQzpSqccGNZQthuNVyEsf
         dmYkpBLtRBqDaObF+3bhcVMdpSw8GwI+yC57EnRvVEShn0He9fxa7seRpE36adnH7vsj
         gokg==
X-Forwarded-Encrypted: i=1; AJvYcCWMdGPhPAcnIahvpSkvCABQArz7WKJ02lCzi+FSoLD9sbsgU3r+h8XLgQ2roOja+h7FxR9V1ecWG6fxtzf9gdgP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7juLXR2s5qdV5DIxRKMuR2raa8nCH09oiXpTjAlC71Cnmx5hj
	DdVXXsOGEW3w9JpViKGr9E/aHLiY9e+P1YIAArKoBFo5BhWaX8FNnTiq
X-Gm-Gg: ASbGncto6aaGX0AqmdYtvuJ9uVNHhYg54E6PC7W8GLuZjCej9odFMPLTiw/LGuCZoQy
	XW7VefnDRk44ueWv8lftCvs/k3/EW1zOS8rYo1LPX3DkJNSkiBmI7mtaMgTycVdrbIveeyDKoDG
	P+AXpqVBYqLRSXjHYAtmYeonUWQzwZWQCvMxdjuix4A4/fNfLFmGAzxUfpUANDuu0jG0ZaI0S7B
	t1q+q0CkYaAfZf18BAwFjUczvwwv+b65VEfTv3r5LDWgOpmoaIKO3BmQLjzLupmXIb5sRotKvNv
	ZsglH8H3VIdY4A5WgqfaqjZKWrpj6bTQMyNxHitLRy2V1RnLv+z4hWwLoYDpLA==
X-Google-Smtp-Source: AGHT+IFiqdSlCbU4zD//x0lPXI7pA7rphxHL2l3rMZn1TfraBPWBfii1gmAYrhU1Zmp/y07HuF1+6g==
X-Received: by 2002:a05:6a20:258e:b0:1f5:8a1d:3904 with SMTP id adf61e73a8af0-225b7f19802mr30657387637.7.1751985996536;
        Tue, 08 Jul 2025 07:46:36 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee476152sm11695895a12.24.2025.07.08.07.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 07:46:36 -0700 (PDT)
Date: Tue, 8 Jul 2025 10:46:33 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, catalin.marinas@arm.com,
	will@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org,
	james.morse@arm.com
Subject: Re: [PATCH 2/2] bitfield: Ensure the return value of
 type##_replace_bits() is checked
Message-ID: <aG0vScXkDROkdASW@yury>
References: <20250703135729.1807517-1-ben.horgan@arm.com>
 <20250703135729.1807517-3-ben.horgan@arm.com>
 <aGv2WoAtxnEgqV4y@yury>
 <03a76e9a-86ac-4791-9f0a-494b28c07fcc@arm.com>
 <86tt3n9fsh.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86tt3n9fsh.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_074637_760157_3A31C506 
X-CRM114-Status: GOOD (  30.17  )
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

On Tue, Jul 08, 2025 at 10:45:50AM +0100, Marc Zyngier wrote:
> On Tue, 08 Jul 2025 10:42:06 +0100,
> Ben Horgan <ben.horgan@arm.com> wrote:
> > 
> > Hi Yury,
> > 
> > On 7/7/25 17:31, Yury Norov wrote:
> > > Hi Ben,
> > > 
> > > On Thu, Jul 03, 2025 at 02:57:29PM +0100, Ben Horgan wrote:
> > >> As type##_replace_bits() has no side effects it is only useful if its
> > >> return value is checked. Add __must_check to enforce this usage. To have
> > >> the bits replaced in-place typep##_replace_bits() can be used instead.
> > >> 
> > >> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> > >> ---
> > >>   include/linux/bitfield.h | 4 ++--
> > >>   1 file changed, 2 insertions(+), 2 deletions(-)
> > >> 
> > >> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> > >> index 6d9a53db54b6..39333b80d22b 100644
> > >> --- a/include/linux/bitfield.h
> > >> +++ b/include/linux/bitfield.h
> > >> @@ -195,8 +195,8 @@ static __always_inline __##type type##_encode_bits(base v, base field)	\
> > >>   		__field_overflow();					\
> > >>   	return to((v & field_mask(field)) * field_multiplier(field));	\
> > >>   }									\
> > >> -static __always_inline __##type type##_replace_bits(__##type old,	\
> > >> -					base val, base field)		\
> > >> +static __always_inline __##type __must_check type##_replace_bits(__##type old,	\
> > >> +							base val, base field)	\
> > >>   {									\
> > >>   	return (old & ~to(field)) | type##_encode_bits(val, field);	\
> > >>   }									\
> > > 
> > > So, would it make sense to mark _encode_bits() and _get_bits() as
> > > __must_check as well? At least from the point of unification, it
> > > would.
> > Could do. It seems less important as there are no obvious foot-guns
> > that these would guards against. Would you like me to add this in a
> > v2?

Yes please.
 
> > > How would we move this - with my bitmap-for next or with arm branch?
> > 
> > I'm not familiar with the branch machinery so can't comment on this.
> 
> The first patch will definitely go in via the KVM/arm64 tree, probably
> as a fix for 6.16.

OK. Then I'll take patch #2 v2 by myself.

Thanks,
Yury

