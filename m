Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE5BCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 19:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOuC3zAW8kbxrBTL2TNiZ4NT6BGzG/ERW1AmxrJRhXE=; b=ThpSPoOXbY/e1s4ONJSgnPd+vm
	MUt4CfdN9eKs6Ov+Sqz0PCPMptY3IQkXeQrQaiq80Eu++BweEeFohZ7vtk7X13JAAjoMEGpudM8o6
	jUy4dCQKWkwyHSJXcW9mev9d7TeBEnZg8oIsh2b7py/jk3VcsnlM+wM3gxER71kuTYrP4H7vjhyiK
	mmfIOYC13AAUqjmIWVlxcAQNnPpwMOr0SOm0UhMyecKMNPZe1fhPMZ3JBc8lrHzuYUx07CRrj5Ni/
	34QCOboCmW/9iBLiiM+C8CGZaRGbqAN0ZjKYs2DaPhMqtnHdEqVeFLrS9H4oYUSFD18amkN+MHQ0w
	AvHtGiAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18I8-0000000Ebc4-1SYM;
	Tue, 23 Sep 2025 19:03:08 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18I5-0000000EbaV-2FtU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 19:03:06 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2699ed6d473so38175ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 12:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758654184; x=1759258984; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOuC3zAW8kbxrBTL2TNiZ4NT6BGzG/ERW1AmxrJRhXE=;
        b=ivC+ChlLv/oDWu608j5irJyITdHZQ/kyATHn+xpL2eEj7A4i1yMlRZ4Orc7MsujV8x
         aVR/Gay4a1VrUA2accIdNihqHmzg2ye38ZYDuszOmJRLQ9CJcBq2BgllgG0Glh6iOND/
         HYrY/dSVTTk3yE4FR/SuJmFU3bZqJuSpbdq6F7+7arwJTmvuBQNgx447VTdd0lsiyFs/
         hDQjJQrkUsxKKEtnGJ3p+66jbIACBdTGmmXjKtbE56df361t6EvlqR7Gj44SoaPBjzkw
         CA2bdfgM9VbG2Ud2uSY77fYLAdXwCbDhDun/X1VIhu7FRktCCvwX5C5jo0HxdyrB4f6x
         9GcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758654184; x=1759258984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOuC3zAW8kbxrBTL2TNiZ4NT6BGzG/ERW1AmxrJRhXE=;
        b=vIadn6rzUclI3aVWkK7zPB4V4RoQzBNNZVQ5Q/f5wSAQnz/ifioqLQV4wlWGAM1l02
         KBKj8NTBgAftdmsdyuX2n2zIZMU0BobkJRtI8MzE/4MT0iwWliuyxCpjEUIAZAicwdQH
         UFfrB/2usmk+IW8plpNYWGFsvhX3cCNZv/h0gWmjZpNRJLoXFzQcf4+2043f0QyFbyuD
         S1aREIzOkYahcmgnTHUCCBhDR575x03ZYrYHajf9yYTGE7LRG0EE/DgFhvSmnfI/mvRL
         haH4MzP823qgBGNO1IEfVi2nHdP/ihPQRK+vA7uBSaTx/25wDl9OdqMhdqEpBmzqdZs2
         bqYA==
X-Forwarded-Encrypted: i=1; AJvYcCWxKHT8MdxZLUdfX2xOpAuJ3z/+5IlQxtxpsmKKMlTQot46Q4P1iErcrNRit+oMsWI1nMJmSvz2DJIslgd195Kb@lists.infradead.org
X-Gm-Message-State: AOJu0YwYBdtEY+PA6XHuNkszuhFXFckDfvMmejpPdapDkFP/gUEnbqHt
	FJ79h2bnMB0gySU9WdbSAZXFZoqJCWgD2/qxfxJ6CEA7+TidMmpFU234ruD6PnzH9A==
X-Gm-Gg: ASbGncuPp74oYCHCEH5ZHevvz2AaCcbt2itJsvgkK2JiXfshmMDW05csM0Dz9WKo+yZ
	kjpNL4whJrLN3DNCEuZrGKt1EEsLyOlRimQBWj5ErXpwuD89US+toyLHuWruYg6yvWjQQD/VU49
	l6dLl/ORM/Vl/EHcaeR7CzC9tBFJVPE9EGRVLOBTlKgh58dKqSuzgo5m1yu0VugaNtTbO8fMl+M
	mbgmIyRUqlWkaiuGdeIhtFadvp6YF+TMwCIeM0VJHPCl2CvNlL8rwsRb7vkziCXDfjbAGJe5XTz
	UcNPVa+MfG64sTU7Va38KG5Plom4bAl0C0MmyvfQj+6SmvdbRYmeggk4wFte/zsh1MyrdKfXeiD
	Hu1etk/IjO75Wd2CqMgu3iK7wxDV/+tsn9OOVAv34qe0Deoo+DTNk2cxuOOplYv0=
X-Google-Smtp-Source: AGHT+IFRAqJuhYAhCis6IihkC0Dv0zYrlzWqXDH65c5umCcHF3NmW4wRGvNj5ih/do0Kdj3XI6rCjg==
X-Received: by 2002:a17:902:da90:b0:26d:72f8:8cfa with SMTP id d9443c01a7336-27ebf19022amr553925ad.13.1758654183589;
        Tue, 23 Sep 2025 12:03:03 -0700 (PDT)
Received: from google.com (23.178.142.34.bc.googleusercontent.com. [34.142.178.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed273e8fasm19914155a91.18.2025.09.23.12.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:03:02 -0700 (PDT)
Date: Tue, 23 Sep 2025 19:02:57 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, jgg@ziepe.ca
Subject: Re: [PATCH v4 1/4] iommu/io-pgtable-arm: Simplify error prints for
 selftests
Message-ID: <aNLu4R7VKkWNmvxs@google.com>
References: <20250922090003.686704-1-smostafa@google.com>
 <20250922090003.686704-2-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922090003.686704-2-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_120305_577171_3A10326E 
X-CRM114-Status: GOOD (  16.30  )
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

On Mon, Sep 22, 2025 at 08:59:25AM +0000, Mostafa Saleh wrote:
> At the moment, if the self test fails it prints a lot of information
> about the page table (size, levels...) this requires access to many
> internals, which has to be exposed in the next patch moving the
> tests out.
> 
> Instead, we can simplify the print, using ias, oas, pgsize_bitmap
> and fmt is enough to identify the failed case, and the rest can
> be deduced from the code.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

