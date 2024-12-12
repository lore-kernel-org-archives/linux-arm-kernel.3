Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D993CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 11:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5a+MQf0Hip9QArkqxNik21FxUn3e2NhEp21qq8cqaU=; b=tXPnIIBbWWtlfGueAwmQagX+gf
	vifBK5qWCEe1eyA8JFuEzBHf/rQHwjOncYjMqGAwnQ5az/AGSbKvsFdyCSjJaYZ1yXTPvWDRVaSgc
	6OS5UhrRH9eSOusI5SuPzlC8rWbix6a0ZninuuT6g2DDvTtlscvYvEzsZbIccOgH19J2Wbq6VKzbl
	fdYtJ1JKV93+K39/e9rQxTP0yfk7KNsj6Bivoo+fBO4M6ioEQyfy5F5bVYHKnabIadezVAi1NyPO+
	LIdLbtKiqlafHwIMH7XUPlWoVP3RIfSTlmW4PYwLFoSXfMvo9nZaAqoG1RfmW6HkYXxIqRMgQOBwF
	coiYrudg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhUL-00000000DKn-2SgE;
	Thu, 12 Dec 2024 11:36:13 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhRc-00000000CMM-14Z8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 11:33:25 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso469663f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 03:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734003202; x=1734608002; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u5a+MQf0Hip9QArkqxNik21FxUn3e2NhEp21qq8cqaU=;
        b=VZilp+y8YUZ3kj9axzBVqS/GecbYK3OTY1RfZiWRsB6drp+2ioMsv2T6PsgQ/E5qbm
         G+x/CQ72CYb6x7CXqxS7VgBTMCftnPjK5BAyxR/rHwfXB/fUg+2d+6MMelB04HUhwf4W
         maHRME2YPJpreZe/N2WXhm3bPSZDEyeoHk/Fdq42Jf6fe99J55AUCevTDSASetDxETpG
         LFtXL7eUh3kuL50KLkAa+CiJ6lkPTzLvJIQdTG5bMkeDNlVHBTlfSDsDe7IzSZjbJktI
         7hjkIyhAnWcaIkbc8eAQjRDmuwq5UTGHWO2tUUwdaarsZbD2XpEYN14X+SkAyY3wsy66
         9y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734003202; x=1734608002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5a+MQf0Hip9QArkqxNik21FxUn3e2NhEp21qq8cqaU=;
        b=Y7by4vgZUl9iyRpdwdtgO55RDF576WzJ6Rl5Up0UT/LElKKFKYEmkkw/Oni3SKTzkS
         ZWi6C6Qd1bn8cpMbcHn9e9ejFkxI7VCR4+jFQfN66IIQBgyBwOUsGn26o6nEOPucu0mb
         j7WlDHvmyOVun9zXVLufMukuHNxcLu0cgnU2KOFL4JOepoLke1EFbv/DX5t2TAEAM6sJ
         WCdmvEZrvj3NtI8lqaHs1O4FmtnTMmPfs+yW9IUv5P82w6pjUJw7Mr5pGBxKGDGHBBzQ
         XRoYkleREuSBi/33m11Qx9+nG+trhcNyqMiovu/ne50pLujMqXexbMPhAj60SX3vGXzu
         qxvQ==
X-Gm-Message-State: AOJu0Yy0QZ0EBSOiRVLRlUToCrAk2t/YDiHZcKxdxgYuhUv/6bWdoClm
	qYf03ys8OUzKhzK5cWC2upEQ8Ckv2XOPXoAh287Ah5Ze6b7r3v1+9yDvE1I9plAj/cMvlTF8wO3
	uCzLM
X-Gm-Gg: ASbGncvFX3vDM9ErzIwFqB3gswecSWYOoMBh5bDq3O2yf2yQTengS4V2pK4E4meg6Nq
	YcFvahM0sdpfW/nzJ3Ix3HgZy7bdOY4/qZNQcjvNOuyywgsEAEeWlDJqRzqpoGcF9x7WhsZNabr
	6OebW8LqnSUFA5Mm5Iw3N9Zuln9xjLdnfVcXG4XoqYkk1+sICboO6d2HIlvRuUaP5arsW/c8pq/
	Hwup+TE6xnPu+ggIaDSAKxW7qcStD03mKf80pLMbHzrOWAP5MRWK/rm2eLnjX09sCqLlRwSVx6B
	9fmOOvrcorjzdak=
X-Google-Smtp-Source: AGHT+IFftUzg2KTR00FQjwA57ZaLYqw/4a8Hb6V4ISjZn49Uf12Ozmj8QlHhzs/NZ8VdbA1gsYccMg==
X-Received: by 2002:a5d:64e5:0:b0:385:d7f9:f16c with SMTP id ffacd0b85a97d-3864cec7614mr5970842f8f.46.1734003201711;
        Thu, 12 Dec 2024 03:33:21 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa699487854sm470265966b.13.2024.12.12.03.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 03:33:21 -0800 (PST)
Date: Thu, 12 Dec 2024 11:33:17 +0000
From: Quentin Perret <qperret@google.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v3 4/6] arm64/kvm: Avoid invalid physical addresses to
 signal owner updates
Message-ID: <Z1rJ_dMJJzGOmjNs@google.com>
References: <20241212081841.2168124-8-ardb+git@google.com>
 <20241212081841.2168124-12-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212081841.2168124-12-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_033324_313717_83C15B6C 
X-CRM114-Status: GOOD (  11.03  )
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

On Thursday 12 Dec 2024 at 09:18:46 (+0100), Ard Biesheuvel wrote:
> @@ -908,6 +892,9 @@ static bool stage2_leaf_mapping_allowed(const struct kvm_pgtable_visit_ctx *ctx,
>  	if (data->force_pte && ctx->level < KVM_PGTABLE_LAST_LEVEL)
>  		return false;
>  
> +	if (data->annotation && ctx->level == KVM_PGTABLE_LAST_LEVEL)
> +		return true;
> +

I don't think it's a problem, but what's the rationale for checking
ctx->level here? The data->force_pte logic should already do this for us
and be somewhat orthogonal to data->annotation, no?

Either way, the patch looks good to me

  Reviewed-by: Quentin Perret <qperret@google.com>

Cheers,
Quentin

>  	return kvm_block_mapping_supported(ctx, phys);
>  }

